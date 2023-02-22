Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEC169FD9D
	for <lists+linux-usb@lfdr.de>; Wed, 22 Feb 2023 22:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbjBVVRR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Feb 2023 16:17:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjBVVRR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Feb 2023 16:17:17 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F2325E10
        for <linux-usb@vger.kernel.org>; Wed, 22 Feb 2023 13:17:16 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id bj35so1746709qkb.8
        for <linux-usb@vger.kernel.org>; Wed, 22 Feb 2023 13:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677100635;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jzC+G7JXGUMEMTg+296rqY8TNpbshezIFmO/f2WmN2c=;
        b=lv99x0jP8pMSbX/iFLPGCN092rgGl4AS5fe1Fkl2basNfeUppZuZZDkPYTCWoQ2qKs
         M6Tnt+YAC6vgfGyCdRT2psMZwF0uZXPuUaxUvDVpxugSX04+7jzlLVScF87OiWYM4VMD
         W6OfFEnh6z3DUsROKqGfiXJQqO3HPKfF96to+OyLMtbMaB8THmz/LfQ8P+4yYyRlwrXv
         htJjeseSp5C/5pccBIxvAWYkvk54pnnZg5CEtfGPfvkyomC+mnuODYcNVGhBxQoUTenQ
         wzGqoVMMaUpjjLfxyZ4pC+qknjgA/lTePuYQ1NKg04lcFnJPqslp1s89aX2FOjcTxHbX
         WA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677100635;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzC+G7JXGUMEMTg+296rqY8TNpbshezIFmO/f2WmN2c=;
        b=fxjzzYaXGAuzYCEcME7kq+MmzQoj+H1FPu2KpaCZq/Gxy9o1mJIFFuBRbcHbRg1ghS
         xltW9YvZGRCyzhv9VeZH3gCyX+SsdRegR/vXVXXSuHeAr241hareaFhGl5dNVt9YGYiR
         EY2FePRFNMNstUScwVgcHIcTLc2nxYKiBK9uAV8PXn8aS+lPM0WdFFMHxf7gUINP4kZx
         gckEY/ApcIOyxxzClD/Lwolwofa5CEzzqYVP9jwoQG+QYSUKKak2c9dWtVBjvshY0fBT
         p5IvvHyyLndhSR0ebREH9tybCzS0ufVKLFeShRgXwW7a+bny3eMDK2tEWpTw4dHzYaLx
         vP3Q==
X-Gm-Message-State: AO0yUKVGCLLJxKWMvSjHZGsCLZ4ZozZf+QVnkbt3Uy+u6nk3/aiYn2Ta
        pvrRT9CTPcsCcgtc8UzmqUcmSTTbTfpb701rj/0=
X-Google-Smtp-Source: AK7set83O9Pf4GeyUQt6V1zznzXg9WeI+fYii6SosU++P1zaE9QaxBbOAVMKOQd15Ejlersqo5pC6E2L56fM19xdz7g=
X-Received: by 2002:a05:620a:1495:b0:71f:b8e9:3633 with SMTP id
 w21-20020a05620a149500b0071fb8e93633mr1434212qkj.15.1677100635441; Wed, 22
 Feb 2023 13:17:15 -0800 (PST)
MIME-Version: 1.0
Reply-To: salkavar2@gmail.com
Sender: maxwellkojo880@gmail.com
Received: by 2002:a05:6200:15c4:b0:4ce:9999:291f with HTTP; Wed, 22 Feb 2023
 13:17:15 -0800 (PST)
From:   "Mr.Sal kavar" <salkavar2@gmail.com>
Date:   Wed, 22 Feb 2023 13:17:15 -0800
X-Google-Sender-Auth: 1ELg56Y4FOznrM07uP_HppOtfaM
Message-ID: <CAGUcSJZMy9p7BxEurjiVVSPHi1HHuV5iq86BP1gJbbHdKc4Vig@mail.gmail.com>
Subject: Yours Faithful,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,
        MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

ScKgYXNzdW1lwqB5b3XCoGFuZMKgeW91csKgZmFtaWx5wqBhcmXCoGluwqBnb29kwqBoZWFsdGgu
DQoNClN1bcKgb2bCoCQxNS41bSzCoChGaWZ0ZWVuwqBNaWxsaW9uwqBGaXZlwqBIdW5kcmVkwqBU
aG91c2FuZMKgRG9sbGFyc8KgT25seSkNCndoZW7CoHRoZcKgYWNjb3VudMKgaG9sZGVywqBzdWRk
ZW5secKgcGFzc2VkwqBvbizCoGhlwqBsZWZ0wqBub8KgYmVuZWZpY2lhcnnCoHdobw0Kd291bGTC
oGJlwqBlbnRpdGxlZMKgdG/CoHRoZcKgcmVjZWlwdMKgb2bCoHRoaXPCoGZ1bmQuwqBGb3LCoHRo
aXPCoHJlYXNvbizCoEnCoGhhdmUNCmZvdW5kwqBpdMKgZXhwZWRpZW50wqB0b8KgdHJhbnNmZXLC
oHRoaXPCoGZ1bmTCoHRvwqBhwqB0cnVzdHdvcnRoecKgaW5kaXZpZHVhbA0Kd2l0aMKgY2FwYWNp
dHnCoHRvwqBhY3TCoGFzwqBmb3JlaWduwqBidXNpbmVzc8KgcGFydG5lci4NCg0KWW91wqB3aWxs
wqB0YWtlwqA0NSXCoDEwJcKgd2lsbMKgYmXCoHNoYXJlZMKgdG/CoENoYXJpdHnCoGluwqBib3Ro
wqBjb3VudHJpZXPCoGFuZA0KNDUlwqB3aWxswqBiZcKgZm9ywqBtZS4NCg0KDQpNci5TYWzCoEth
dmFyLg0K
