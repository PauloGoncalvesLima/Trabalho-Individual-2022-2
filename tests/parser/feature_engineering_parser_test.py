import pytest
from trabalho_indi_gces_2022_punb.parser.feature_engineering_parser import (
    FeatureEngineeringParser,
)


class TestFeatureEngineeringParser:
    @pytest.mark.parametrize(
        "test_input, expected_output",
        [
            # Test case 1 - empty input
            ([], None),
            # Test case 2 - no columns in input
            ([{"input": {"features": {"word_embedding": "es"}}}], ValueError),
            # Test case 3 - no features in input
            ([{"input": {"columns": [{"col1": "string"}]}}], ValueError),
            # Test case 4 - columns with alias not present in feature
            (
                [
                    {
                        "input": {
                            "columns": [{"col1": "string"}],
                            "features": {
                                "word_embedding": {"col1": {"dimensions": 30}}
                            },
                        }
                    }
                ],
                AssertionError,
            ),
            # Test case 5 - valid input
            (
                ([
                    {
                        "input": {
                            "columns": [{"col1": "string"}],
                            "features": {
                                "word_embedding": {"col1": {"dimensions": 30}}
                            },
                        }
                    }
                ]),
                (
                    [
                        {
                            "columns_alias": ["col1"],
                            "columns_set": [{"col1": "string"}],
                            "data_lang": "es",
                            "dimensions": {"col1": 30},
                            "enabled_features": {"word_embedding": True},
                        }
                    ],
                    ["col1"],
                ),
            ),
            # Test case 6 - input with multiple features
        ],
    )
    def test_parser(self, test_input, expected_output):
        parser = FeatureEngineeringParser()
        try:
            assert parser.parse(test_input) == expected_output
            
        except ValueError or AssertionError as e:
            assert isinstance(e, expected_output)