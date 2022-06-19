Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9CA550B3E
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jun 2022 16:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234686AbiFSOxt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jun 2022 10:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236088AbiFSOxk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jun 2022 10:53:40 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC586151
        for <linux-usb@vger.kernel.org>; Sun, 19 Jun 2022 07:53:39 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id n185so4544474wmn.4
        for <linux-usb@vger.kernel.org>; Sun, 19 Jun 2022 07:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=XfBaW94tYLh6Gfk7V3oY1xEpClLq+agTEi5dSO4kTWE=;
        b=HOnANhUv4YSfp9Gw/gD9YrubLj/I6UhIFp03iya5ipII+DBbPCzSZwOO9H+qHWsf4p
         wOKgakQHLLKhV6zzEzUSkerhD+nT5BZi09VFxO1fk0oIjfAwpTEBVwRQ7EHAwIajw7u8
         KjXlObfVM8fAeE4Dip8aVcJnnHdFSZmuMC5EnQlf2kZBkzGqlgvESrf/tgmuwu9spfdG
         cjymJay0+a/Cl33Lgh/XTp1rGTh78ATgq0uIFrBp3So889KucQEWJwGGnEP1SHHyqU4u
         qVgfrUfudMQ0G2IzImymPn4i8GfO2CXxB47b38CMf5mA7/072gWr0Gxj77ldq87krRF2
         lqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=XfBaW94tYLh6Gfk7V3oY1xEpClLq+agTEi5dSO4kTWE=;
        b=suub7MTr7OiVaoaw7u0aaYxPQBaqjrbbkTikPVw045s7X7lVwznOv7u7klj61nSFqD
         tnzKxkNpoutBehvYcScimY1vYnxtpfSCsbZet3i8t0AJLTLkEeCZrZJ4I7DRpq2sbOi2
         c2MvCAp2NwbpX6FUGLAD/DjnbqLlCiKl57GcyENUerS/3ik8qkmmK6lfiEeKA9t0bak+
         INPQVeMj5V0Ccq2ouJNv+EyD4fdRGtacj4Zm0AbEsCZPo0c1AwuRUQGUFZYZJZwCDs1+
         NUDJDB9gLtqGaaPNKhRTStNkAOAKRwB/FYJvQnZdeVQUR1UVn2KgVmwwjv3ln/yz9Iy7
         8rDw==
X-Gm-Message-State: AOAM533oqHJxr9jA0GdSNSwncFclajU3LqJervEFGWiaeYmbeihZnRL1
        P/9XVQ1QcZitTHMe/5K6kLknS/0kxcbXCHtNW78=
X-Google-Smtp-Source: ABdhPJyP2Ulfe1D9ITrHIPRCFt4GfE4fdh1cdU6HhTJaHxBiDEjFs06qoMjNUUB+iZcsqpB8O4tcTQwxZhRu7c0qxWc=
X-Received: by 2002:a05:600c:202:b0:39c:40de:ec19 with SMTP id
 2-20020a05600c020200b0039c40deec19mr30401327wmi.29.1655650417848; Sun, 19 Jun
 2022 07:53:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:5c0a:0:0:0:0:0 with HTTP; Sun, 19 Jun 2022 07:53:37
 -0700 (PDT)
Reply-To: wwwheadofficet@gmail.com
From:   "wwwheadofficet@gmail.com" <moneygrambanktransf@gmail.com>
Date:   Sun, 19 Jun 2022 14:53:37 +0000
Message-ID: <CAEDS9izKCbSCq93zA-j+u=XPdTssz+kZXxa9XmasgsFMrJy-Ow@mail.gmail.com>
Subject: w
To:     moneygrambanktransf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        NAME_EMAIL_DIFF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

LS0gDQrQv9GA0LjQstC10YINCg0K0JzRiyDRhdC+0YLQtdC70Lgg0LHRiyDRgdC+0L7QsdGJ0LjR
gtGMINCy0LDQvCwg0YfRgtC+INC80Ysg0L/QvtC70YPRh9C40LvQuCDQstCw0Ygg0YTQvtC90LQg
0L7RgiDQnNCS0KQg0LTQu9GPDQrQsdC10LfQvtC/0LDRgdC90L7Qs9C+INC/0LXRgNC10LLQvtC0
0LAg0LLQsNC8LCDQv9C+0YLQvtC80YMg0YfRgtC+INCy0LDRiCDQsNC00YDQtdGBINGN0LvQtdC6
0YLRgNC+0L3QvdC+0Lkg0L/QvtGH0YLRiyDQsdGL0LsNCtC+0LHQvdCw0YDRg9C20LXQvSDQsiDR
gdC/0LjRgdC60LUg0LbQtdGA0YLQsiDQvNC+0YjQtdC90L3QuNGH0LXRgdGC0LLQsC4g0J/QvtC2
0LDQu9GD0LnRgdGC0LAsINC+0YLQstC10YLRjNGC0LUg0LTQu9GPDQrQv9C+0LvRg9GH0LXQvdC4
0Y8g0LHQvtC70LXQtSDQv9C+0LTRgNC+0LHQvdC+0Lkg0LjQvdGE0L7RgNC80LDRhtC40LguDQoN
CtChINC90LXRgtC10YDQv9C10L3QuNC10Lwg0LbQtNC10Lwg0LLQtdGB0YLQtdC5INC+0YIg0LLQ
sNGBINCyINCx0LvQuNC20LDQudGI0LXQtSDQstGA0LXQvNGPDQoNCtChINC70Y7QsdC+0LLRjNGO
Lg0K0KLQvtC90Lgg0JDQu9GM0LHQtdGA0YINCtC00LjRgNC10LrRgtC+0YAg0L7RhNC40YHQsA0K
V2hhdHNBcHAsICsyMjg5MTQ0MTg1Ng0K
