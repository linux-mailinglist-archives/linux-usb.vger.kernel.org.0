Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5685816FD
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 18:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbiGZQJD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jul 2022 12:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232578AbiGZQJC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jul 2022 12:09:02 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1F6B186D8
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 09:09:01 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id y129so6738159vkg.5
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 09:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=2geObz/qPbQ0zmW0zjdppN56rmNh6IuNe6i2t19UWOo=;
        b=mFvXtTA23lfUz6xdbPfDGEJbGWapCuppCz43ZL32V1c8iW8Vdc5OZAs0dRH21yo5p6
         eTsqZEgIp2Vl0k+h+pXwIFbSd+sVuy2RCPeUTJkP9m0pQm6eIMqRwH9J5RN2XAGdexOe
         bCMY/KQBZKGB3m67t+HhkRqKIQVGLOrhooGL8B/4J/tuKgg4jD0wVahDwGdU3GVjIAAV
         EwOerr/kFCniNBljnVGi2QI7GDtEBITyz4KOSNTQf5TlbmD4T+kdIZ7nSkvV+5mFuTwf
         9/kvWOCd97O49PDC80pJ+Isu5U/3v1XOojaEWA11kg7SIl6PhQS6sNr0s0svtG5DZ3F3
         Crjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=2geObz/qPbQ0zmW0zjdppN56rmNh6IuNe6i2t19UWOo=;
        b=NXWXHFZU+rHPwi2VrQoFtEMqLZFj+WGS/pqvwHzFHmSTWZZ4PmwwG4rxjj9rxnKD+h
         WZvxO9w0HKygTv2G8iP8B2AsAwnakuPvLmfnRhsUcN7EAmSWE2HtU6C5Klq8QtopoKjh
         5bXjuUGS6lHs3A/8vs4n4AUsuAU5elURCCpPWoUp6IhQU3UlieJCDVeyXTl8gq/XABEC
         Pzqg/Wi+mctKaqwoqVj986JjKUKrPrg0HVhZlONvAQ/pFzV/tooC0Y3Wus/1hU8e7yiI
         KxfN0W5t2PQiIF75Z6998BNQF8Yghg8oXkH8Y7U9YSowSVzk/DUY+3Wc2VAWWvzTMTUp
         MS8w==
X-Gm-Message-State: AJIora+BIU3r+J5/TDDpH2W4WFX+nxU7gJOU5PnFIEAa4ewYI5Wn9w4u
        4DL2fW8sp06L1K21F62adUogzAS6EXwz7uEBAs8=
X-Google-Smtp-Source: AGRyM1sRNtv+VRItUWETNBpM/YK2t5yq02o2Gx4ZR7JBPCo+FkkVQEHiN9D8adY4rbtC1fJfAcDUtdwaLABZE/IBlWs=
X-Received: by 2002:ac5:c4f4:0:b0:376:42c6:8a77 with SMTP id
 b20-20020ac5c4f4000000b0037642c68a77mr4154450vkl.9.1658851740566; Tue, 26 Jul
 2022 09:09:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:ea88:0:0:0:0:0 with HTTP; Tue, 26 Jul 2022 09:09:00
 -0700 (PDT)
Reply-To: cfc.ubagroup09@gmail.com
From:   Kristalina Georgieva <ubagroup.tgo12@gmail.com>
Date:   Tue, 26 Jul 2022 09:09:00 -0700
Message-ID: <CADnAz74NuNY2XothKuAXA8mMSbu1JvSGu5Bo4ZO5mqtiaTbDWw@mail.gmail.com>
Subject: =?UTF-8?Q?GOWY_T=C3=84ZELIK?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:a36 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [cfc.ubagroup09[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ubagroup.tgo12[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ubagroup.tgo12[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hormatly pe=C3=BDdalanyjy,
Bu haty size bir a=C3=BD =C3=B6=C5=88 iberipdim, =C3=BD=C3=B6ne sizden e=C5=
=9Fitmedim, =C3=BDok
Al=C3=BDandygy=C5=88yza ynan=C3=BDaryn we =C5=9Fonu=C5=88 =C3=BC=C3=A7inem =
size =C3=BDene iberdim,
Ilki bilen men dolandyryjy m=C3=BCdir Kristalina Georgi=C3=BDewa we
Halkara Wal=C3=BDuta Gaznasyny=C5=88 prezidenti.

Aslynda, t=C3=B6weregind=C3=A4ki =C3=A4hli p=C3=A4sgel=C3=A7ilikleri we mes=
eleleri g=C3=B6zden ge=C3=A7irdik
doly d=C3=A4l amaly=C5=88yz we t=C3=B6legleri =C3=BDerine =C3=BDetirip bilm=
ezligi=C5=88iz
opsi=C3=BDalary =C3=BC=C3=A7in size gar=C5=9Fy t=C3=B6leg t=C3=B6len=C3=BD=
=C3=A4r
=C3=B6=C5=88ki ge=C3=A7irimler, tassyklamak =C3=BC=C3=A7in sahypamyza giri=
=C5=88 38
=C2=B0 53=E2=80=B256 =E2=80=B3 N 77 =C2=B0 2 =E2=80=B2 39 =E2=80=B3 W.

Biz direktorlar ge=C5=88e=C5=9Fi, B=C3=BCtind=C3=BCn=C3=BD=C3=A4 banky we P=
ul gaznasy
Wa=C5=9Fington, Halkara Halkara Pul Gaznasy, B=C3=B6l=C3=BCm bilen bilelikd=
e
Amerikany=C5=88 Birle=C5=9Fen =C5=9Etatlaryny=C5=88 Gazna we k=C3=A4bir be=
=C3=BDleki der=C5=88ew guramalary
Amerikany=C5=88 Birle=C5=9Fen =C5=9Etatlarynda degi=C5=9Flidir. sargyt etdi
Da=C5=9Fary =C3=BDurt t=C3=B6leg t=C3=B6leg b=C3=B6l=C3=BCmimiz, United Ban=
k
Afrika Lome Togo, size $ VISA karto=C3=A7kasy bermek =C3=BC=C3=A7in
Gaznadan has k=C3=B6p pul almak =C3=BC=C3=A7in gaznadan 1,5 million.

Der=C5=88ewimizi=C5=88 dowamynda g=C3=B6zledik
t=C3=B6legi=C5=88izi=C5=88 korrumpirlenen i=C5=9Fg=C3=A4rler tarapyndan gij=
ikdirilendigine alada bildiri=C5=88
seri=C5=9Fd=C3=A4=C5=88izi hasaby=C5=88yza g=C3=B6n=C3=BCkdirm=C3=A4ge syna=
ny=C5=9F=C3=BDan Banky=C5=88
hususy.

Bu g=C3=BCn bolsa gaznany=C5=88yzy=C5=88 Karta berilendigini habar ber=C3=
=BD=C3=A4ris
UBA Bank tarapyndan VISA we eltip berm=C3=A4ge ta=C3=BDyn. Indi
UBA Bank m=C3=BCdiri bilen habarla=C5=9Fy=C5=88, ady jenap Toni
Elumelu, E-po=C3=A7ta: (cfc.ubagroup09@gmail.com)
bankomat VISA karty=C5=88yzy n=C3=A4dip almalydygyny a=C3=BDtmak =C3=BC=C3=
=A7in.

Hormatlamak bilen,

Hanym Kristalina Georgi=C3=BDewa
