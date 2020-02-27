//
//  IndicatorsData.swift
//  NewAtlantApp
//
//  Created by admin on 27/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class IndicatorsData {
    var monthes: [MonthIndicator] {[
        MonthIndicator(month: "Январь", indicators: jan()),
        MonthIndicator(month: "Февраль", indicators: feb()),
        MonthIndicator(month: "Март", indicators: mar()),
        MonthIndicator(month: "Апрель", indicators: apr()),
        MonthIndicator(month: "Май", indicators: may()),
        MonthIndicator(month: "Июнь", indicators: jun()),
        MonthIndicator(month: "Июль", indicators: jul()),
        MonthIndicator(month: "Август", indicators: aug())
    ]}
}

func jan() -> [Indicator] {
    [Indicator(name: "Приход мес.", value: 122400),
     Indicator(name: "Расход мес.", value: 315327),
     Indicator(name: "Приход нарастающий итог", value: 158400),
     Indicator(name: "Расход нарастающий итог", value: 1115835),
     Indicator(name: "Операционная прибыль", value: -192927),
     Indicator(name: "Прибыль инвестора", value: 0)
    ]
}
func feb() -> [Indicator] {
    [Indicator(name: "Приход мес.", value: 230400),
     Indicator(name: "Расход мес.", value: 358851),
     Indicator(name: "Приход нарастающий итог", value: 388800),
     Indicator(name: "Расход нарастающий итог", value: 1474686),
     Indicator(name: "Операционная прибыль", value: -128451),
     Indicator(name: "Прибыль инвестора", value: 0)
    ]
}
func mar() -> [Indicator] {
    [Indicator(name: "Приход мес.", value: 338400),
     Indicator(name: "Расход мес.", value: 402375),
     Indicator(name: "Приход нарастающий итог", value: 727200),
     Indicator(name: "Расход нарастающий итог", value: 1877062),
     Indicator(name: "Операционная прибыль", value: -63975),
     Indicator(name: "Прибыль инвестора", value: 0)
    ]
}
func apr() -> [Indicator] {
    [Indicator(name: "Приход мес.", value: 446400),
     Indicator(name: "Расход мес.", value: 445899),
     Indicator(name: "Приход нарастающий итог", value: 1173600),
     Indicator(name: "Расход нарастающий итог", value: 2322961),
     Indicator(name: "Операционная прибыль", value: 501),
     Indicator(name: "Прибыль инвестора", value: 100)
    ]
}
func may() -> [Indicator] {
    [Indicator(name: "Приход мес.", value: 554400),
     Indicator(name: "Расход мес.", value: 489423),
     Indicator(name: "Приход нарастающий итог", value: 1728000),
     Indicator(name: "Расход нарастающий итог", value: 2812384),
     Indicator(name: "Операционная прибыль", value: 64977),
     Indicator(name: "Прибыль инвестора", value: 12995)
    ]
}
func jun() -> [Indicator] {
    [Indicator(name: "Приход мес.", value: 662400),
     Indicator(name: "Расход мес.", value: 532947),
     Indicator(name: "Приход нарастающий итог", value: 2390400),
     Indicator(name: "Расход нарастающий итог", value: 3345331),
     Indicator(name: "Операционная прибыль", value: 129453),
     Indicator(name: "Прибыль инвестора", value: 25891)
    ]
}
func jul() -> [Indicator] {
    [Indicator(name: "Приход мес.", value: 770400),
     Indicator(name: "Расход мес.", value: 576471),
     Indicator(name: "Приход нарастающий итог", value: 3160800),
     Indicator(name: "Расход нарастающий итог", value: 3921802),
     Indicator(name: "Операционная прибыль", value: 193929),
     Indicator(name: "Прибыль инвестора", value: 38786)
    ]
}
func aug() -> [Indicator] {
    [Indicator(name: "Приход мес.", value: 878400),
     Indicator(name: "Расход мес.", value: 619995),
     Indicator(name: "Приход нарастающий итог", value: 3160800),
     Indicator(name: "Расход нарастающий итог", value: 4541798),
     Indicator(name: "Операционная прибыль", value: 258405),
     Indicator(name: "Прибыль инвестора", value: 51681)
    ]
}
