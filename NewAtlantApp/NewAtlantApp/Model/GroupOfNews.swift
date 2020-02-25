//
//  GroupOfNews.swift
//  NewAtlantApp
//
//  Created by admin on 25/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class GroupOfNews {
    var title: String = "AllNews"
    var news: [NewsOfPeriod] {
        return [jan(), feb(), mar(), apr()]
    }
}

extension GroupOfNews {
   private func jan() -> NewsOfPeriod {
    let new = NewsOfPeriod(year: 2020, month: "январь", newsItems: [
            NewsItem(newsTitle: "Важные изменения января", additionalText: """
1.\tРолик ТВ (смонтирован новый ролик)
2.\tРабота КЦ (новые СМС и скрипты)

Эти изменения позволили добиться увеличения количества заявок. Сейчас идет сбор данных. Все это будет предоставлено в феврале
""")
        ])
        return new
    }
    
   private func feb() -> NewsOfPeriod {
    let new = NewsOfPeriod(year: 2020, month: "февраль", newsItems: [
                NewsItem(newsTitle: "Увеличено количество заявок на 20%"),
                NewsItem(newsTitle: "Конверсия за период повысилась на 10% до уровня 35.5%")
            ])
            return new
        }
    
   private func mar() -> NewsOfPeriod {
    let new = NewsOfPeriod(year: 2020, month: "март", newsItems: [
            NewsItem(newsTitle: "Важные изменения в кадровом составе", additionalText: """
1.\tНанят новый конкурсный управляющий.
2.\tИзменилась организационная схема.
3.\tОбщая численность сотрудников увеличилась до 35 человек.
""")
        ])
        return new
    }
    
   private func apr() -> NewsOfPeriod {
    let new = NewsOfPeriod(year: 2020, month: "апрель", newsItems: [
                NewsItem(newsTitle: "Планово вышли на самоокупаемость")
            ])
            return new
        }
}
