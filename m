Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6604D1380
	for <lists+linux-usb@lfdr.de>; Tue,  8 Mar 2022 10:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345379AbiCHJhf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Mar 2022 04:37:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238506AbiCHJhf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Mar 2022 04:37:35 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E938741601
        for <linux-usb@vger.kernel.org>; Tue,  8 Mar 2022 01:36:38 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id t11so27493954wrm.5
        for <linux-usb@vger.kernel.org>; Tue, 08 Mar 2022 01:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=p4GORicRfKYMmuTaUvzvYC0X6pcYWYL8sK1k4bp9fMA=;
        b=KIQQd5yVpx+5xXTchaZG2GV+eq2tHbP/BKBnIi1lQS3xGD7sMddIarLwoP5ZvtF5CM
         OyuMwuhcoyhqIswlry0FfL9FR6mYmQS/Lt/bgRayb1whJuc2s6Mfc/0fV/uPngObF3/k
         dz/v9iXKsS7zJBWYQonWGupfAoUDMPuTerXwBW6CwQiti+UR2xOwFKqY1qlkwWOD+gge
         MNgFCJ7a7cm5xiaGCtUSZWbasD9Wb2xrCxCZKD1NYyEEqXF68yQRR6Yldt8nvkDy6s9A
         nxWu3lMgDoBW80I/Vru607002qfmIDB/c1Obn625N8ajC3kvXIT7ZlQURJQ7wIF2k78v
         r9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=p4GORicRfKYMmuTaUvzvYC0X6pcYWYL8sK1k4bp9fMA=;
        b=iT7FWTMbLNd2vVoBMJEuHwqDa/owEB9Ydn4xcqwGaVFotR0IiTXTCTLRa9huSueu3N
         BMjO+D4JRsswJvVngt/lYrzsL1o9WrumT9NZ4p3qgt8PN8HoBOALxCSw+VhSkv8uWmvJ
         9Jvy0I7LnSDruf8VhnscrNgm//y+lmsds/ZSbEaqQ3kzPnbzilAoCf2DL+ycQisDYfjw
         5YnaOpAiszb35Al0nPSObZkpNS7xllewd+8HdpOaiMSbEsygyF2DIPWt2ZKqhnLIaX99
         w5dYBwPULB6+1XqZL+iJIxZ7SaguHOEQZmSCaGVZTmO5aNbNuEXzSGNWDFoTITjIuHAF
         RCYg==
X-Gm-Message-State: AOAM530seFt/fMAyrAM0RAkUVCjGsL3vc7921QdNVhvKwETeXKZ1D8f9
        1wrbzlczeqNsYvH7rnjs75Y=
X-Google-Smtp-Source: ABdhPJx/MGTDYIl6FXo3qJwVXa8arwap0xqP74E2yX3UTF5jY+1xg7nBPKzffnjYxc5IWg9MhvUNKw==
X-Received: by 2002:a5d:55cd:0:b0:1ef:6e69:9c78 with SMTP id i13-20020a5d55cd000000b001ef6e699c78mr11652163wrw.626.1646732197577;
        Tue, 08 Mar 2022 01:36:37 -0800 (PST)
Received: from DESKTOP-26CLNVD.localdomain ([105.112.25.95])
        by smtp.gmail.com with ESMTPSA id y12-20020adff14c000000b001f04d1959easm13238389wro.13.2022.03.08.01.36.30
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2022 01:36:36 -0800 (PST)
Message-ID: <622723a4.1c69fb81.597c3.f898@mx.google.com>
From:   Mrs Maria Elisabeth Schaeffler <deargideon04@gmail.com>
X-Google-Original-From: Mrs Maria Elisabeth Schaeffler  <info@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Spende
To:     Recipients <info@gmail.com>
Date:   Tue, 08 Mar 2022 01:36:17 -0800
Reply-To: mariaelisabethschaeffler88@gmail.com
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        HK_NAME_FM_MR_MRS,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hallo,

Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Wirtschaftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen, die restlichen 25% dieses Ja=
hr 2022 an Einzelpersonen zu verschenken. Ich habe mich entschieden, 1.500.=
000,00 Euro an Sie zu spenden. Wenn Sie an meiner Spende interessiert sind,=
 kontaktieren Sie mich f=FCr weitere Informationen.

Unter folgendem Link k=F6nnen Sie auch mehr =FCber mich lesen

https://www.forbes.com/profile/maria-elisabeth-schaeffler-thumann/#443b4a6e=
19c7

Gr=FC=DFe
Gesch=E4ftsf=FChrer Wipro Limited
Maria-Elisabeth_Schaeffler
Email:mariaelisabethschaeffler88@gmail.com

