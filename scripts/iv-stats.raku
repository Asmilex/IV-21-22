#!/usr/bin/env perl6

use IO::Glob;
use IV::Stats;

my $stats = IV::Stats.new;

for $stats.objetivos -> $o {
    my $aceptados = $stats.cumple-objetivo($o).elems;
    my $entregados = $stats.hecha-entrega($o).elems;
    say sprintf( "%2d 🧮: %2d%%🚧 %2d%%✅ %2d%%❌ ⇒ \n     ",
            $o,
            ($entregados - $aceptados) *100/ $todos,
            @aceptados.elems*100/ $todos,
            ($todos - @entregados.elems)*100/$todos  ),
            ("🚧" xx @entregados.elems - @aceptados.elems,
            "✅" xx @aceptados.elems,
            "❌" xx $todos - @entregados.elems).Slip.join("\n     ");

}
