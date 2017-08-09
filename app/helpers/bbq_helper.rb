module BbqHelper

  def min_value_cut(wgt_cut,wgt_cut_min,wgt_cut_max)
    if wgt_cut <= wgt_cut_min
      # wgt_cut_minimo = wgt_cut_min
      return wgt_cut_min
    # elsif wgt_cut >= (wgt_cut_min*wgt_cut_max)
    #   wgt_cut_maximo = wgt_cut_min*wgt_cut_max
    #   return wgt_cut_maximo
    # else
    #   wgt_cut_medium = (wgt_cut_min + (wgt_cut_min*wgt_cut_max)) / 2
    #   return wgt_cut_medium
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
          ['costela',1.2,3,14,5],
          ['vazio',0.7,1.2,20,3],
          ['alcatra',0.8,1.3,20,1],
          ['fraldinha',0.7,1.5,18,3],
          ['entrecot/chuleta/bisteca',0.4,1.4,22,3],
          ['contrafilé/bife de chorizo',0.4,1.5,21,3],
          ['picanha',0.8,1.3,32,1],
          ['maminha',0.7,1.4,23,3],
          ['cupim',1.2,0.5,20,3]
        ]
      ],
      ['suína (porco)',
        [
          ['costela',1.200,1.8,17,3],
          ['linguiça toscana',1.200,10,10,5],
          ['barriga',1.100,1.6,14,3],
          ['pernil',1.200,1.4,15,3],
          ['lombo',1.200,1.3,16,3],
          ['carré/bisteca',1.200,2.0,17,1],
          ['alcatra',1.000,1.6,19,1],
          ['picanha',0.800,1.4,21,1],
          ['filé mignon',0.600,1.8,22,1]
        ]
      ],
      ['aves (frango)',
        [
          ['coxa',0.200,9.0,7,3],
          ['coxa com sobrecoxa',0.200,0.4,6,3],
          ['asinha de frango',1.200,0.2,10,3],
          ['linguiça de frango',1.200,0.25,14,5],
          ['coração de frango',1.200,0.15,18,1]
        ]
      ]
    ]
  end

end
