Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 765DF56797B
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jul 2022 23:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbiGEVr1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jul 2022 17:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbiGEVr0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jul 2022 17:47:26 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714E3BE36
        for <linux-usb@vger.kernel.org>; Tue,  5 Jul 2022 14:47:24 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id bk26so4300750wrb.11
        for <linux-usb@vger.kernel.org>; Tue, 05 Jul 2022 14:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=jK9rblSrOgALCsDzsVHL94P0WkdKF94I3mwjFWnYBg4=;
        b=puOL5FDNcT2uaf6SNPG34VNetbqLkUKDsEKWfqxoFcdFSWK7lOyLAq/aS7SqeQuf4G
         Gd82khFRSkiB5rBOa4WReiivESlElyrMwIfpg/FbsZuUrpnn7pzdtm1zdU4gfO5xDrYE
         chKcP9ookFqA1209g+Tv/Jor7TAmB0ALqW7YEiY2YutU9e1QcX+AqXGZXS3JL7JUAdvq
         BQV45OmwaVlOI0Xm8mwi6mZkefylA/8Sr9PFQeiaiqEK24dXxcgKEjUhkD4792PJ+uxN
         F5UVZ6FTMVBhVM6GZnQ1Y7SZAJZucsQ30yRiTEoOVEVBzK1YuMeCmevXMrPwmYmz78Uc
         LGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=jK9rblSrOgALCsDzsVHL94P0WkdKF94I3mwjFWnYBg4=;
        b=0HL3lOhdVtaoDcI9iBuZE7tRcSgki9O4f9yAJ54J6sj/WzKiWttgMdNXc1eycAPMd1
         6tsQVILIgFrtxD6+cM9ELrDUtJ5CwTtJsG0WwEgHHe9maSyLTpRkY8XXxbWJb1jby0fq
         GkLPrpDFWyemkpp25MUtiZ5ZsJNt3SjHArVH5Mi8LrP1ihcERQskkTAi4VWTMaFgOpkN
         t9vvrh00YOUJr7S5XlesyCXiwsZbc3ytQqbeC0tYpjPfCud2jn6XYufYC4LqbbBKT/4+
         KP2huZBc+g5NQJRooyDkXAYOfTmKFdgH80OU7lmzDkMZvqabiaCsdsira9Dy+qrNxAmt
         wUdg==
X-Gm-Message-State: AJIora+elLUH/ZOKwFGGsSPtZQvo+oCtHpTjLwjDmX+84KT/w9yIrcp0
        fP5xclIpElzDtjDeWOd2/cfnaPE2vy12rD5/Zus=
X-Google-Smtp-Source: AGRyM1uhRcvtCeENEoO72bo52zk5JbNXejKBYo1CLXb8aFjEGlIdaowRWzsTV37gFXzBHM32+pD/SdV/VjQ6hqWqy1Q=
X-Received: by 2002:a05:6000:1acc:b0:21c:439c:7074 with SMTP id
 i12-20020a0560001acc00b0021c439c7074mr32308209wry.686.1657057643022; Tue, 05
 Jul 2022 14:47:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:600c:6006:0:0:0:0 with HTTP; Tue, 5 Jul 2022 14:47:22
 -0700 (PDT)
Reply-To: jennifermbaya38@gmail.com
From:   "Mrs.Jennifer Mbaya" <robinrampha0454@gmail.com>
Date:   Tue, 5 Jul 2022 22:47:22 +0100
Message-ID: <CAOkx55QShhd3jwX1edC78Dc7xroynRwQ0nKB70HRM3pEQvgkkw@mail.gmail.com>
Subject: Mottaker
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Mottaker
Det er en pris i ditt navn fra FN og Verdens helseorganisasjon
tilknyttet det internasjonale pengefondet der e-postadressen og fondet
ble frigitt til oss for overf=C3=B8ring, vennligst bekreft dataene for
overf=C3=B8ringen.
Vi ble bedt om =C3=A5 overf=C3=B8re alle ventende transaksjoner innen de ne=
ste
to, men hvis du har mottatt din fond vennlig ignorere denne meldingen,
hvis ikke overholde umiddelbart.
Vi trenger din presserende svar p=C3=A5 denne meldingen, dette er ikke en
av de internett svindlere der ute, det er pandemisk lettelse.
Mrs. Jennifer Mbaya
