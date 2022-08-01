Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E592586D6F
	for <lists+linux-usb@lfdr.de>; Mon,  1 Aug 2022 17:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbiHAPJf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Aug 2022 11:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiHAPJe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Aug 2022 11:09:34 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3652AE26
        for <linux-usb@vger.kernel.org>; Mon,  1 Aug 2022 08:09:33 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id v3so13585851wrp.0
        for <linux-usb@vger.kernel.org>; Mon, 01 Aug 2022 08:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=kCSqCOP5NnmgqzMKAvoC+xj8lkHVueu0SPSEqGKA1Ew=;
        b=OY4SVrYz3ENiRC6Iq3n+lR4yHiIv/762p7ktLazKXbh5JrS/Lc7G06YdnamsFqvGO2
         GgRxRaSGxHkSSlv/ipoa4UwXp3toCQOOSXYqthn23qqNQiJYJDf5k0xwH//DPi1ecR0+
         AGIsPB1Ot9sbqri+wCnbpI0yio0pRCmNExHlA6j/RhENl1UHoOFo82kOGQb6cTMcBgUV
         WlKXlOYJ6xgIsRUJa3pUTntzmzFb8xuuVnUfEpiTtAv3DyC6CmJb//FUxrtvKmKdiQ+H
         PkThk4bVoAfASBnWFJofRMd+DqO/WM81ndJ5L3j3WdEJbU4YR9GrYyrcpoS9ym9BDXFN
         vcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=kCSqCOP5NnmgqzMKAvoC+xj8lkHVueu0SPSEqGKA1Ew=;
        b=PJOlaNxIiMik5rtzYJAvfPcKH7ReuceluGWZ8W4kGGXd9LCx1Kg3xGh4sZk4cRkQ3m
         zeoW6HsQprRTHEdB3oTxkv+PMSR0k8ltCrtit1YjpaGJcAKQwExIEpiY3XbM+Aoj/ASW
         quTEM6LotgEwDK6Z167oD56svbeCaNfLv/JBKTIzUQdWHDrVU2IouGrcoqd3/qgs3Ol3
         ybytaxrza299zewoQQ5DVf0JJANm62UYr2K2QIaIFoUFfzccAGMC8VsO3GU/QXAaGHqf
         HgPoOqRBF96dfUy7ZhuzZjDCZBMghask/pRZqbCkgEfYN+qaPOICPeVMGoIxK2fMjqSK
         omVw==
X-Gm-Message-State: ACgBeo2RAeZJGcPv5IhteQtMASPo+/Vp/CFCnvZtb2A0dbOHGxJBkFik
        mXO/V1DcE8ImPe3zSkuN8Cah5CiZw+tXF+3GnM8=
X-Google-Smtp-Source: AA6agR7xmMoj40y+m0HZVaGMizsEHV3t8RjUad1Q+dPW6Ixa4lAwwZntNeTsFuxzXocAJwq4lb6TULJ8XdYnc81F6Fg=
X-Received: by 2002:a5d:4301:0:b0:21b:8af6:4a21 with SMTP id
 h1-20020a5d4301000000b0021b8af64a21mr11009961wrq.296.1659366572163; Mon, 01
 Aug 2022 08:09:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:600c:1c9b:0:0:0:0 with HTTP; Mon, 1 Aug 2022 08:09:31
 -0700 (PDT)
Reply-To: lisarobinsongift02@gmail.com
From:   Lisa Robinson <timothykiemakalungu@gmail.com>
Date:   Mon, 1 Aug 2022 18:09:31 +0300
Message-ID: <CAAjdwV6Z8PuqLw_DBUhPejSajaDUWMQc1pAGebGEhPE-UJYXZw@mail.gmail.com>
Subject: Donation
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=20
You were chosen by God to receive my Grant Donation of 1.200.000,00 =E2=82=
=AC
Please contact: Mrs Lisa Robinson via email:
lisarobinsongift02@gmail.com
Surname:
Country:
WhatsApp phone number:
