module BbqHelper

  def min_value_cut(wgt_cut,wgt_cut_min)
    if wgt_cut <= wgt_cut_min
      return wgt_cut_min
    else
      return wgt_cut
    end
  end

  def quantif(x)
    if x < 1
      x = "#{(x*1000).round(0)} gramas"
    else
      x = "#{number_with_precision(x, precision: 3)} Kg"
    end
  end

  def cost(x)
    x = "R$ #{number_with_precision(x, precision: 2)}"
  end

  def meats
    [
      ['bovina (boi)',
        [
          ['costela',1.2,3,14],
          ['alcatra',0.8,0.5,20],
          ['vazio',0.7,0.5,20],
          ['fraldinha',0.7,0.5,18],
          ['entrecot/chuleta/bisteca',0.7,0.5,22],
          ['contrafilé/bife de chorizo',0.8,0.5,21],
          ['picanha',0.8,0.5,32],
          ['maminha',0.7,0.5,23],
          ['cupim',1.2,0.5,20]
        ]
      ],
      ['suína (porco)',
        [
          ['costela',1.200,1,17],
          ['linguiça toscana',1.200,0.2,10],
          ['barriga',1.200,1,14],
          ['pernil',1.200,0.8,15],
          ['lombo',1.200,0.7,16],
          ['carré/bisteca',1.200,0.5,17],
          ['alcatra',1.200,0.6,19],
          ['picanha',1.200,0.7,21],
          ['filé mignon',1.200,0.7,22]
        ]
      ],
      ['aves (frango)',
        [
          ['coxa',1.200,0.3,7],
          ['coxa com sobrecoxa',1.200,0.4,6],
          ['asinha',1.200,0.2,10],
          ['linguiça de frango',1.200,0.25,14],
          ['coração de frango',1.200,0.15,18]
        ]
      ]
    ]

  end

end
