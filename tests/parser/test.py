from trabalho_indi_gces_2022_punb.parser.feature_engineering_parser import (
    FeatureEngineeringParser,
)


def main():
    data = [
        {
            "input": {
                "columns": [{"col1": "string"}],
                "features": {"word_embedding": {"col1": {"dimensions": 30}}},
            }
        }
    ]

    print(FeatureEngineeringParser.parse(data=data))


if __name__ == "__main__":
    main()
