Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E31AC573777
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 15:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbiGMNeU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jul 2022 09:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbiGMNeS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jul 2022 09:34:18 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E61328D
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 06:34:17 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id s1so7266414vsr.12
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=vvtS89Fk2u1S3Szl4rrCs3KSXNS797GmNVbZS9fGKtQ=;
        b=ObpYYD2li8Mhk7lbLgzRitfquvHSldlOHXIxiKGWDWwBhDtMfgxEXJUWqTCj7ANzqI
         QdGitFMyzpXxVg3MD7gPbUYBJvD4mws846ukH7WedVGocp6k2tGz32gWQB2XLuaY0tBw
         y/o5PIkYC2KbSI1i4Mo97WSNnl6rNKFOH5zgBEJONhZa8V61VvAMf9WDyPHxTShzsMUZ
         +ru9IKpQp2Cc4OCfuJYX+bpEmpfb+6k2pPdD9fHZYstQST0VrSZaqHQw1fsOcP/H/hhK
         Hg0NgRmmuvhIYHJAptxznHpyF6JL90t4WNMTnJ+InqXyYjkko1xu13IQlIAbeQeTAxjT
         FNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=vvtS89Fk2u1S3Szl4rrCs3KSXNS797GmNVbZS9fGKtQ=;
        b=Y7nteoo1ePVKan7ZNZPcnGhouX3QpwQ4kfo9KXtQjC2KuxBtaM+nmoguPZ0I8cXdAW
         ruzbCvaLaRJnl4B7hdNiizJe10HzuwFYvNDL0Cs/uv+PV2r00xtbqc+Lh4y+a29YdBMy
         E8wydHeT3nP7tdknaSDlQgeKbvy1hzm6XfGLwaHYwBzGKhCz6wZsH/z2sr737cjAweYa
         PrPaYKAFguq608Es7DufxvlDk98dieg1BRZ1jH4UVPZ8h/gIQFO23YCYeDUU3DYSs1h7
         X8MJ1R5KudUIh0Ea1hqDP4VSpL+8tNPwFMW7cqlPqCSJPd6sfKcjGG66g7nALi6B7TfX
         ev/w==
X-Gm-Message-State: AJIora9GTUBasUYSRxmk/gZ2UO02z/7jKqil6jI4LnYe6xsOW34sIgXF
        bEMztxZrm2Z8G7XZ2iWKgKpMIcpjI70TalgFqYw=
X-Google-Smtp-Source: AGRyM1tMs9/j0lZB4CZbLMw6KkMebhm4pm583fT2xLekSW5tPgtwltA85i7V3laXUyl8xJ2o8VbLJ8qCEFU4L+uWfiM=
X-Received: by 2002:a67:f301:0:b0:357:1b13:2691 with SMTP id
 p1-20020a67f301000000b003571b132691mr1192797vsf.6.1657719256338; Wed, 13 Jul
 2022 06:34:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9f:3724:0:0:0:0:0 with HTTP; Wed, 13 Jul 2022 06:34:15
 -0700 (PDT)
Reply-To: cfc.ubagroup09@gmail.com
From:   Kristalina Georgieva <georgiamila084@gmail.com>
Date:   Wed, 13 Jul 2022 06:34:15 -0700
Message-ID: <CAGydNXGOcdChY54ox1hfn8cSUQRh-1QqC48Vnmh2Obowq2W4-Q@mail.gmail.com>
Subject: HEAD UUDISED
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,LOTTO_DEPT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Lugupeetud abisaaja!
Saatsin sulle selle kirja kuu aega tagasi, aga ma pole sinust midagi kuulnu=
d, ei
Olen kindel, et saite selle k=C3=A4tte ja sellep=C3=A4rast saatsin selle te=
ile uuesti.
Esiteks olen pr Kristalina Georgieva, tegevdirektor ja
Rahvusvahelise Valuutafondi president.

Tegelikult oleme l=C3=A4bi vaadanud k=C3=B5ik =C3=BCmbritsevad takistused j=
a probleemid
teie mittet=C3=A4ielik tehing ja teie suutmatus tasuda
=C3=BClekandetasud, mida v=C3=B5etakse teie vastu j=C3=A4rgmiste v=C3=B5ima=
luste eest
varasemate =C3=BClekannete kohta k=C3=BClastage kinnituse saamiseks meie sa=
iti 38
=C2=B0 53=E2=80=B256 =E2=80=B3 N 77 =C2=B0 2 =E2=80=B2 39 =E2=80=B3 W

Oleme direktorite n=C3=B5ukogu, Maailmapank ja Valuutafond
Washingtoni Rahvusvaheline (IMF) koos osakonnaga
Ameerika =C3=9Chendriikide riigikassa ja m=C3=B5ned teised uurimisasutused
asjakohane siin Ameerika =C3=9Chendriikides. on tellinud
meie Overseas Payment Remittance Unit, United Bank of
Africa Lome Togo, et v=C3=A4ljastada teile VISA kaart, kus $
1,5 miljonit teie fondist, et oma fondist rohkem v=C3=A4lja v=C3=B5tta.

Uurimise k=C3=A4igus avastasime koos
kardab, et teie makse on hilinenud korrumpeerunud ametnike poolt
pangast, kes =C3=BCritavad teie raha teie kontodele suunata
privaatne.

Ja t=C3=A4na anname teile teada, et teie raha on kaardile kantud
UBA panga VISA ja see on ka kohaletoimetamiseks valmis. N=C3=BC=C3=BCd
v=C3=B5tke =C3=BChendust UBA panga direktoriga, tema nimi on hr Tony
Elumelu, e-post: (cfc.ubagroup09@gmail.com)
et =C3=B6elda, kuidas ATM VISA kaarti k=C3=A4tte saada.

Lugupidamisega

Proua Kristalina Georgieva
