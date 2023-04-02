Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED5E56D354B
	for <lists+linux-usb@lfdr.de>; Sun,  2 Apr 2023 04:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbjDBCtN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Apr 2023 22:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDBCtM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Apr 2023 22:49:12 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3683191F6
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 19:49:10 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id y184so19497242oiy.8
        for <linux-usb@vger.kernel.org>; Sat, 01 Apr 2023 19:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680403750;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gxUwmbnGO9PwsjorDOT/rnk595ecVVzsXlTp7Yvu6mg=;
        b=m9Aip/qGKCe/LlRmsDg9Xz2b3/lvgW6WeIxCsm/xDDlQ/px8y8qCXdk3y6lNqtKK11
         Um7o0H9gvEoaY+EwjfCCSPod03IIe5PlHdqZNGkgZ7CCb5DU3a4cK9C7sxqec+OxcZ9/
         eTzsVN5Qr75lR65lQNdAIUHt65kOr4QM/IUbklce2/mvnxcRaE29QIiDmyoGXJHo+MNV
         wEz+BhaQTal6plmv12zbzWBzNAFJvg8HfO8Xo51pSpqYJNM/lxgwMMQj4FQw5vGDihly
         Tz6nh/ncwyifOoFe4KX369vKYQL1YvaOERdf5QprfzhKZ5IwiJwDAVlwEcKtUlF99uWo
         +COg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680403750;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxUwmbnGO9PwsjorDOT/rnk595ecVVzsXlTp7Yvu6mg=;
        b=Yn9nE03fiyV9nuRQLv1jr6WLPBERLqlh+8kcM+fC6fqA1xg42UKGvGA2OQuz3aKzkK
         bY70ZWfAG6aNh1ChZtm+Qj5xRSYuvLL5Asnd+D2LZSJy1i27S5dImFcceajt1GBncmOR
         xmvDXM5X8ziLz24gIPDIv5k5MHy7y3sewUTfG4hyu2g16+37TP7ze0PCTORP1Fs9ly+v
         68HMkhbBIFAodK5xl2RamsaYKbyJbvMm7IgOtXFgDcPb58CrN5U1uItZwFamjkeZ8xaS
         QrS2P04zCXt7yEETYnMsS8JreMDB9E8WwGk9eKkLZMiLsEL62B8uU7y4HbUegNqpg1bP
         KWMg==
X-Gm-Message-State: AAQBX9crQ6oYN2XwzTZRhPFr2/XFPr4dNqcYrWT24qri60EeF77PZtlr
        f+H/RbK6qhAqDhF3FPhggajJl89GKWSfWMAbPOY=
X-Google-Smtp-Source: AKy350YF5QEVsnNQbgwxAOj3o/Cr/Q/JfLJW6qbIEQZhUy9Q0gnhRWPcLk+qaFD4DoIEAHV8IvI5HFCmvvO8eU4dPWs=
X-Received: by 2002:a05:6808:1390:b0:389:7ffd:b280 with SMTP id
 c16-20020a056808139000b003897ffdb280mr4602735oiw.5.1680403749629; Sat, 01 Apr
 2023 19:49:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:7188:b0:10a:cc3d:725e with HTTP; Sat, 1 Apr 2023
 19:49:08 -0700 (PDT)
Reply-To: infor.bankofamerica.net11@gmail.com
From:   Kristalina Georgieva <ubabanku35@gmail.com>
Date:   Sun, 2 Apr 2023 02:49:08 +0000
Message-ID: <CAJut6M6e9FtuU_NF6O2AvJfWY9HqmXeOAMQ-qHo1GD9BWyk=AQ@mail.gmail.com>
Subject: AUFMERKSAMKEIT
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,LOTTO_DEPT,
        MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:244 listed in]
        [list.dnswl.org]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ubabanku35[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ubabanku35[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [infor.bankofamerica.net11[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  1.1 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.0 LOTTO_DEPT Claims Department
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sehr geehrter Kunde,


Sie wurden dar=C3=BCber informiert, dass die United Bank for Africa Plc
nach Erhalt Ihrer Zahlungsgenehmigung und des Wechsels vom
Internationalen W=C3=A4hrungsfonds Ihre ausstehende Zahlung begleichen
wird, wobei zu ber=C3=BCcksichtigen ist, wie Wechsel aus Togo und Afrika im
Allgemeinen in Europa, Asien, dem Nahen Osten und America in
=C3=9Cbereinstimmung mit den International Monetary
Transactions-Richtlinien unserer Bank entschieden, ein
US-Dollar-U-Direct-Konto f=C3=BCr Nichtans=C3=A4ssige in Ihrem Namen bei de=
r
Bank Of America USA einzurichten. Ihr vollst=C3=A4ndiger zu =C3=BCberweisen=
der
Betrag 1,5 Millionen USD, die nach und nach =C3=BCberwiesen werden. Dieses
Konto erm=C3=B6glicht es Ihnen, Ihre Gelder schrittweise und bedingungslos
selbst =C3=BCber die Bank Of America Inter Switch Transfers-Plattform
jederzeit elektronisch zum Nulltarif auf jedes Bankkonto Ihrer Wahl zu
=C3=BCberweisen.

Ihre sofortige Einhaltung der von der Bank Of America USA festgelegten
Richtlinie, die mit der Standardrichtlinie f=C3=BCr internationale
Banktransaktionen =C3=BCbereinstimmt, erm=C3=B6glicht die
Aktivierung/Validierung dieses Kontos und Sie haben Zugriff auf alle
Transaktionen und =C3=9Cberweisungen auf Ihr angegebenes Bankkonto.

F=C3=BCr weitere Anfragen, Antr=C3=A4ge, Beschwerden wenden Sie sich bitte =
an
die Auslands=C3=BCberweisungsabteilung
Regie: Frau Pamela Cox.
E-Mail: info.bankofamerica.net11@gmail.com
WhatsApp: +1 (829) 747-6879


Beachten Sie, dass Ihnen der (IWF) aufgrund von Betr=C3=BCgern hiermit
unseren Verhaltenskodex (DTC0414) herausgegeben hat, sodass Sie diesen
Code angeben m=C3=BCssen, wenn Sie Frau Pamela Cox Foreign Remittance
Department Bank Of America kontaktieren, indem Sie ihn als Betreff
verwenden. Bitte benachrichtigen Sie (Bank Of America) unverz=C3=BCglich,
um den Erhalt dieser Nachricht von der UBA Bank plc zu best=C3=A4tigen.

Vielen Dank f=C3=BCr Ihr Verst=C3=A4ndnis, wir freuen uns darauf, von Ihnen=
 zu h=C3=B6ren,

Zeichen
Management
