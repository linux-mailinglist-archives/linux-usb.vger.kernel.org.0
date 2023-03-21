Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B586E6C2D5B
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 09:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbjCUI66 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Mar 2023 04:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbjCUI6c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Mar 2023 04:58:32 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D08110EF
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 01:56:50 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id a11so4218708lji.6
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 01:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679389007;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jzC+G7JXGUMEMTg+296rqY8TNpbshezIFmO/f2WmN2c=;
        b=USS2aqx/KXhOKB/SmdM7OTdpiwLVYoU33PaCkCP+BRnGkE3CXO1ZSblXZrPOsxR7lv
         T1Mx/wCPRApTXFQPggoJor66V8biZry2+M5GMslhCyxNCgs4dciZ+nnT+79ZRrnYskeK
         Du2LWDZCCaDD5MRrM4haV+hByT9Z4ec7ZrUf98XVCwbYjHNQsDyeN8ODoT75JsZdXR1q
         PHYBFjlHT0XiIy1FYDzgTdgBP3KNPvnJQYY5aCOw77ovSrQRzJexBPb7znvefBU70vBH
         FVAZymUTo6zOMkieTg1yrPkmCXNd4clloqHTOu5DZbcitXS8I4aQBiHftSV+1t8H4/rB
         mOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679389007;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzC+G7JXGUMEMTg+296rqY8TNpbshezIFmO/f2WmN2c=;
        b=u2Vq69fhXx6W/11Hx3QL82C1P35uCXm8HdnH4oKfwcA2mfcYFyS29ODJeLUP3obUgA
         L9YqFnGV5m0bgL4cT4Zuo3Z4hVD0/KCOE0mJs9INxbWz6W/pBWzr8sfVVYITsK2FyVDj
         JE3HurNuKt5m+Q0HyGhfSYvWVHzkBE6whhD/QXR1GX+9RZpNpT8Uv29CnZe6ZtEZEAL3
         sID24FbNifZ4AsYFt0n5AuCgcAlinvcCg5PZ1VYDmEstJzLl6o/rdhII8+I0whlVnS2O
         ToOns15zjA33ln/HNhYmUsEoMucc1r8kw/1p7jQjHXNIOmSi4it+f7Z9ivwQOWNOh+Pn
         ja+A==
X-Gm-Message-State: AO0yUKX5E0b0aG2j+Z3WI+GM0OUBNKGN3VXRtgMCUhIcgX70lN67aUVy
        hcKIKqcfPUsI893R0CyfE5uEsUHHtSrCsV8L6To=
X-Google-Smtp-Source: AK7set8NnfpMUhhmF9INQbo28EMQwbG+57ESDHIeO6EcgygpW5vgT2MuqIbgxTA2Q77WTsZ2zYLVtZXwc0OTweLwOPY=
X-Received: by 2002:a2e:9802:0:b0:293:2f6e:91bf with SMTP id
 a2-20020a2e9802000000b002932f6e91bfmr597817ljj.7.1679389007244; Tue, 21 Mar
 2023 01:56:47 -0700 (PDT)
MIME-Version: 1.0
Reply-To: salkavar2@gmail.com
Sender: mrahmedhannan0@gmail.com
Received: by 2002:ab3:7104:0:b0:223:fd48:978b with HTTP; Tue, 21 Mar 2023
 01:56:46 -0700 (PDT)
From:   "Mr.Sal kavar" <salkavar2@gmail.com>
Date:   Tue, 21 Mar 2023 01:56:46 -0700
X-Google-Sender-Auth: kOTWPztbhbolSepV6_OG8edN8Dk
Message-ID: <CAPtuYjBED=G2Vu96vJiqerSJLtiOHquMA_q4tur15BU1fbgTSg@mail.gmail.com>
Subject: Yours Faithful,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
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
