Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9459861F044
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 11:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbiKGKV6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 05:21:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbiKGKVt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 05:21:49 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C63EF18E25
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 02:21:26 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id b124so11629697oia.4
        for <linux-usb@vger.kernel.org>; Mon, 07 Nov 2022 02:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AOmtRIzmF5dcnWrT0j3skK83MYTC+QvduwZ6ndeN2Ks=;
        b=L9okY7Icb0Gf5ctoFsS3m7Ms6FyffuhIG/wumllqb99pGSDM0eKoVdXRomu4k2Vvje
         vaAAA5b5CG4T9vL3DYzTbt6i7ilTYVRiZHeAf51qWroCKMi/06UV8twkwYbbvcb58b0c
         O8aiXYIeKLPGKFxD8AeTNjdm9XiiwAwYXXYnxXnBzQtt4ZaPQYbu2mn3d4/wBF5dq0sI
         fYgKey8dWac3TMQ3pm+aZLL8XgADS0c8wc9DQhJYDoGLimjkDspSigMMA/pe1/be4Mmf
         FTMTprRtatoAeN10/4e16TIuQYPcJ6zZ7AsqjnUqg8Bde3BWUPkO4V20s/KjpolOjYbD
         1dVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOmtRIzmF5dcnWrT0j3skK83MYTC+QvduwZ6ndeN2Ks=;
        b=5xvrgRWdLOd98M/0p9O2BJ6jvLusbD1mVovnrSKJbw9SX41xJeka01uy6XVStwi4SH
         zCBH3Ak8NQEcLjTsyN0rK8xJ9R5SCyi6a4A5wDQczbC9sraEE0+EToWH3dFd0lV+FD9x
         UBsqlmjwOUTk/7qqeA3ixMDVAq7uMiXHx7I763DzDmp8n1gmNJuN5nyNtHFUIbQIKvh6
         vVCFLHbPb/WYL1rzT/PpXO8msfi6m4iGIx0kdI+KEnqxkEIL611FcACs10QQlysXBBPb
         aoEI+lD0Y/+QcYR8lFTHn3l9kbgZKfarubv+kqY4NbGm/4DMIztEbbOljScH6z5pTAu6
         OOdA==
X-Gm-Message-State: ACrzQf3aL1F0imqsFmftNLUgWkj1rigM2nrLtebEZr8lklWsPJz5/paN
        mtmA44cuCdLdmgZuyYB6LGWmtt26tIojty3/gPrsQ3rrEfk=
X-Google-Smtp-Source: AMsMyM4Z92xjGZXgCyg2wym9Bu3/u65n6EL2ZpWI9kWf7s8xWZden0QG/zdZVfFd3uCVmOfceIs+YigxV7lXSF4Af+Y=
X-Received: by 2002:a17:90b:2393:b0:213:ecb2:2e04 with SMTP id
 mr19-20020a17090b239300b00213ecb22e04mr38944517pjb.100.1667816475223; Mon, 07
 Nov 2022 02:21:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a06:925:b0:587:19e0:c567 with HTTP; Mon, 7 Nov 2022
 02:21:14 -0800 (PST)
Reply-To: contact@ammico.it
From:   =?UTF-8?Q?Mrs=2E_Monika_Everenov=C3=A1?= <977638ib@gmail.com>
Date:   Mon, 7 Nov 2022 11:21:14 +0100
Message-ID: <CAHAXD+Z_SoFK+TjW_6apBCCLtc_awXEjaqOdf77jdLRxxup3TA@mail.gmail.com>
Subject: Re:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.8 required=5.0 tests=ADVANCE_FEE_2_NEW_MONEY,
        BAYES_40,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,FROM_STARTS_WITH_NUMS,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:243 listed in]
        [list.dnswl.org]
        * -0.0 BAYES_40 BODY: Bayes spam probability is 20 to 40%
        *      [score: 0.2547]
        *  0.7 FROM_STARTS_WITH_NUMS From: starts with several numbers
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [977638ib[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  2.0 ADVANCE_FEE_2_NEW_MONEY Advance Fee fraud and lots of money
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hei ja miten voit?
Nimeni on rouva Evereen, l=C3=A4het=C3=A4n t=C3=A4m=C3=A4n viestin suurella=
 toivolla
v=C3=A4lit=C3=B6n vastaus, koska minun on teht=C3=A4v=C3=A4 uusi syd=C3=A4n=
leikkaus
t=C3=A4ll=C3=A4 hetkell=C3=A4 huonokuntoinen ja v=C3=A4h=C3=A4iset mahdolli=
suudet selviyty=C3=A4.
Mutta ennen kuin min=C3=A4
Tee toinen vaarallinen operaatio, annan sen sinulle
Minulla on 6 550 000 dollaria yhdysvaltalaisella pankkitilill=C3=A4
sijoittamista, hallinnointia ja k=C3=A4ytt=C3=B6=C3=A4 varten
voittoa hyv=C3=A4ntekev=C3=A4isyysprojektin toteuttamiseen. Tarkoitan saira=
iden auttamista
ja k=C3=B6yh=C3=A4t ovat viimeinen haluni maan p=C3=A4=C3=A4ll=C3=A4, sill=
=C3=A4 minulla ei ole niit=C3=A4
kenelt=C3=A4 perii rahaa.
Vastaa minulle nopeasti
terveisi=C3=A4
Rouva Monika Evereen
Florida, Amerikan Yhdysvallat
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Hi and how are you?
My name is Mrs. Evereen, I am sending this message with great hope for
an immediate response, as I have to undergo heart reoperation in my
current poor health with little chance of survival. But before I
undertake the second dangerous operation, I will give you the
$6,550,000 I have in my US bank account to invest well, manage and use
the profits to run a charity project for me. I count helping the sick
and the poor as my last wish on earth, because I have no one to
inherit money from.
Please give me a quick reply
regards
Mrs. Monika Evereen
Florida, United States of America
