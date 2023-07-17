Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34A407561A0
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jul 2023 13:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjGQLfV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jul 2023 07:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjGQLfU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jul 2023 07:35:20 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA47DE4E
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 04:35:19 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b700e85950so62740301fa.3
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 04:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689593718; x=1692185718;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F8c8AGUyyMsh/tWTeIQLFMtnKuW3caepMaMLhbfX7EQ=;
        b=Hk48rQBXLZO/ZQn3Gwb/VxHWSP7qXz2j4PkhV8TpZMTAmtTVM76S91rI+OoMQldqym
         yml6fY7hdJJRbt2R3ygSso+XUcZRhXAbHT8RSflNCG4YcwhJkftjm+4/B06/beq5ki/V
         UZFXOOD86K7C6LWGDJGhgRo+Tzt0Ej/cTRI7P+Gt7i5+t/u2OJvVPVZJMAeVvfNpxfRw
         2uWdhzNWsy/gb1FG75ke2ANf8HStpopdBjPmorQZ51pbbbnQp/Byn4BZsjc6ZwnEK4/i
         4iAnfTP5c/X0pLgA3ySBdXEk/ZMK8NIacnQQ95QcjV6E0rWUcRElHH8b5eV+5RQ10Lu2
         fgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689593718; x=1692185718;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8c8AGUyyMsh/tWTeIQLFMtnKuW3caepMaMLhbfX7EQ=;
        b=Fj/nWCiEGv/4mpJYXhgYb++I99kUcfLdUU9w6FZNWdlkgXSrTUAel2/RC8q0r2o5Ku
         /xHj7GuHvt+gdHzbl7C/A9CmeAxkls69dUclS9AM8SM1mnHX4z+3TbdfLT9D1eFs4DRq
         JdN8Tz3CiAO8lcq+jYCdzfuUms6Pe4qByAqd0evNrAyzSQkKzR9Sia/8XtSbglAudfMw
         +1Vcl4RE4nlwiBvrXZrBvL+6vHbQaa61YfuMgKOYyt10j8+aoQVkvV25a2V8GcW/cf29
         L3FY+V61/C88CZyeM1oEoBuP/laYzHw1hD2pYkSP1CogaYk6OP88N6KJejHLJUQaM2gh
         q6bA==
X-Gm-Message-State: ABy/qLZdmVdu2ikzJm6AN5w6FvQYk+L32iS4gGkdzlyRfsLANRx0N8tL
        pQZCvzP1qFLqAHv5XubL2zBvWSHQDkapvKE8DGE=
X-Google-Smtp-Source: APBJJlG1EQb+18d0Rg4daI2zH/Lg06PPL1JtCVrZdoyfccXjrpboHKz7f5DI8x7ValT3RlTuihVktuJA4yKaJ7my7No=
X-Received: by 2002:a2e:3211:0:b0:2b5:68ad:291f with SMTP id
 y17-20020a2e3211000000b002b568ad291fmr7492195ljy.19.1689593717931; Mon, 17
 Jul 2023 04:35:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:9815:b0:991:7874:ef80 with HTTP; Mon, 17 Jul 2023
 04:35:17 -0700 (PDT)
Reply-To: rushmila9@gmail.com
From:   "Mrs.Sayouba Rushmila" <infoclaim24@gmail.com>
Date:   Sun, 16 Jul 2023 23:35:17 -1200
Message-ID: <CADNbBXLvddE6Etg0TwUy3zE7f3+jnbKvoC36nirgyRLFP+Enmw@mail.gmail.com>
Subject: =?UTF-8?Q?czekam_na_wie=C5=9Bci_od_ciebie?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drogi Bo=C5=BCy Wybrany

Pisz=C4=99 do Ciebie ten list z ci=C4=99=C5=BCkimi =C5=82zami w oczach i wi=
elkim smutkiem
w sercu. Nazywam si=C4=99 Mrs.Sayouba Rushmila, jestem z Tunezji i
kontaktuj=C4=99 si=C4=99 z Tob=C4=85 ze szpitala w Burkina Faso, chc=C4=99 =
Ci to
powiedzie=C4=87 poniewa=C5=BC nie mam innego wyj=C5=9Bcia, jak tylko ci pow=
iedzie=C4=87,
poniewa=C5=BC by=C5=82em poruszony, by si=C4=99 przed tob=C4=85 otworzy=C4=
=87, o=C5=BCeni=C5=82em si=C4=99 z
panem Sayoub=C4=85 Sofiane, kt=C3=B3ry pracowa=C5=82 z ambasadorem Tunezji =
w Burkina
Faso przez dziewi=C4=99=C4=87 lat, zanim zmar=C5=82 w 2011 roku. Byli=C5=9B=
my ma=C5=82=C5=BCe=C5=84stwem
przez jedena=C5=9Bcie lat bez dziecka.

Zmar=C5=82 po kr=C3=B3tkiej chorobie, kt=C3=B3ra trwa=C5=82a tylko pi=C4=99=
=C4=87 dni. Od jego
=C5=9Bmierci zdecydowa=C5=82am si=C4=99 nie wychodzi=C4=87 ponownie za m=C4=
=85=C5=BC. Kiedy m=C3=B3j
zmar=C5=82y m=C4=85=C5=BC =C5=BCy=C5=82, zdeponowa=C5=82 sum=C4=99 8.500.00=
0 milion=C3=B3w dolar=C3=B3w. (osiem
milion=C3=B3w pi=C4=99=C4=87set tysi=C4=99cy dolar=C3=B3w) w banku w Wagadu=
gu, stolicy Burkina
Faso w Afryce Zachodniej. Obecnie te pieni=C4=85dze s=C4=85 nadal w banku.
Udost=C4=99pni=C5=82 te pieni=C4=85dze na eksport z=C5=82ota z wydobycia w =
Burkina Faso.

Niedawno m=C3=B3j lekarz powiedzia=C5=82 mi, =C5=BCe nie wytrzymam siedmiu =
miesi=C4=99cy z
powodu problem=C3=B3w z rakiem i udarem. Najbardziej niepokoi mnie udar
m=C3=B3zgu. Wiedz=C4=85c o moim stanie zdecydowa=C5=82em si=C4=99 przekaza=
=C4=87 Ci te
pieni=C4=85dze na opiek=C4=99 nad mniej uprzywilejowanymi lud=C5=BAmi, wyko=
rzystasz
te pieni=C4=85dze tak jak tutaj poucz=C4=99. Chc=C4=99, =C5=BCeby=C5=9B wzi=
=C4=85=C5=82 30 procent
ca=C5=82o=C5=9Bci pieni=C4=99dzy na w=C5=82asny u=C5=BCytek. Natomiast 70% =
pieni=C4=99dzy
przeznaczycie na budow=C4=99 domu dziecka w moim imieniu i pomoc biednym
ludziom na ulicy. Dorasta=C5=82am jako sierota i nie mam nikogo w rodzinie,
tylko po to, aby stara=C4=87 si=C4=99, aby dom Bo=C5=BCy by=C5=82 utrzymany=
. Czyni=C4=99 to,
aby B=C3=B3g przebaczy=C5=82 mi grzechy i przyj=C4=85=C5=82 moj=C4=85 dusz=
=C4=99 do raju, bo ta
choroba bardzo mnie wycierpia=C5=82a.

Jak tylko otrzymam twoj=C4=85 odpowied=C5=BA, podam ci kontakt do banku w
Burkina Faso, a tak=C5=BCe poinstruuj=C4=99 kierownika banku, aby wystawi=
=C5=82 ci
upowa=C5=BCnienie, kt=C3=B3re udowodni ci, =C5=BCe jeste=C5=9B obecnym bene=
ficjentem
pieni=C4=99dzy w banku, to znaczy, je=C5=9Bli ty zapewnij mnie, =C5=BCe pos=
t=C4=85pisz
zgodnie z tym, co tu opisa=C5=82em.

Z wyrazami szacunku
Od pani Saiyouba Rushmila.
