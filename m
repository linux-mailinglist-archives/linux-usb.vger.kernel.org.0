Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2483DD221
	for <lists+linux-usb@lfdr.de>; Mon,  2 Aug 2021 10:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232433AbhHBIi2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Aug 2021 04:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbhHBIi2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Aug 2021 04:38:28 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43D77C06175F
        for <linux-usb@vger.kernel.org>; Mon,  2 Aug 2021 01:38:19 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id m19so9909954wms.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Aug 2021 01:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rtst-co-kr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=qMHAwwf5Z0x5KKuhH/Sb56cOAOFn2sic4Agk5IpGY8E=;
        b=BQKUmjeQSKOk8z5GMZlHxTcU23B9IpgVBTEJQn53mht+a4MBr/PSZYGAFjWU7+SuLJ
         iHl7hj48LKYz7mr2NeAzSAZJq40bhLFj+bclSFeVXr4CtvTdX8kbmCaPlDSU4vdZPUgA
         LoBEDNwHu7agrJgeWHrT8qWSyM9xzVGzp6D3U0r1kWeaUW8V4LJsowKCx/4hK1qOFJ3r
         VPVHk/0Jm4NMPDVZNAQsj7jcWi8a1R3RIRtq4VfyyTLnwuPko+uv4hyMLrUUuyMvEAbq
         Ptotf9xxBhCGuQKRkqVDs/uYL/4i4lavnVvp7oeFL2i1AkBEoJHmuLiwHpGJuAdyaOc7
         +cOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=qMHAwwf5Z0x5KKuhH/Sb56cOAOFn2sic4Agk5IpGY8E=;
        b=WUM69cGM4SRW8VW/0er5xXg6mOJRpgNA5nL3tgIEwa3z1Jrb3gLAGvSIo4jCdn5Dp0
         TtfAQcA3fVKXHGQ4lFMx77xBe6cz7OvxWsAkHbJoja50R/4mZxo7g7fo1RBkPuoqQ8mY
         yDC4QGrtl3La04DXGRakrWCHj9n9GcHxlq5iJHBUYMDNwb4MuFHDoIG2l2gVbbYDqFKG
         N0kf65l+mZkUtfxNNq0kxWoVyh8JiTfyGOsgrgy3ZoZHuAxgOcCvqW1w0eDwf501HEP0
         53ve1jz1d0gRFaR9DdbSQedb3I9/WPsjyvQYpRyNPwM7ola16rm43GWf4DAt23BNY5iI
         OXJA==
X-Gm-Message-State: AOAM532u2Q5zd9y/jKtISuKfMXxKHzhghONaIGBDnNCGGe8WCUACDs9M
        4qFu0v5Nv31hOablIlLtHsNzAkjj2a5sqaMGB33Kog==
X-Google-Smtp-Source: ABdhPJxpxu6N0cMoXKEnDb7iBDptSuoLHIfMdDN+wGN0a4LxZmZ+sUiEHMkvuPK0CXVLhE/uPxbPHmWitc+Tjb8UCKM=
X-Received: by 2002:a7b:cbcd:: with SMTP id n13mr14135420wmi.105.1627893497840;
 Mon, 02 Aug 2021 01:38:17 -0700 (PDT)
MIME-Version: 1.0
From:   Jeaho Hwang <jhhwang@rtst.co.kr>
Date:   Mon, 2 Aug 2021 17:38:07 +0900
Message-ID: <CAJk_X9i5+Yzb97NT+iEtxMKGqG-tWs3065LOqJ9HMN6Gea_eqA@mail.gmail.com>
Subject: Chipidea USB device goes infinite loop due to interrupt while hw_ep_prime
To:     peter.chen@kernel.org, linux-usb@vger.kernel.org
Cc:     Linux team <team-linux@rtst.co.kr>,
        =?UTF-8?B?67OA66y06rSRKEJ5ZW9uIE1vbyBLd2FuZykv7J6Q64+Z7ZmU7JewKUF1dG9tYXRpb24gUGxhdGZvcm0=?=
         =?UTF-8?B?7Jew6rWs7YyA?= <mkbyeon@lselectric.co.kr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi.

We found an infinite loop inside the function hw_ep_set_halt
(drivers/usb/chipidea/udc.c) if a cablle is repeatedly
connnected/disconnected while ping through RNDIS with chipidea USB
device.

Using ftrace tracing, we found that hw_ep_set_halt is called due to
error return of hw_ep_prime(drivers/usb/chipidea/udc.c:202) which is
called from isr_tr_complete_handler -> isr_setup_status_phase ->
_ep_queue.

The comment of function hw_ep_prime says (execute without
interruption) but timer interrupt is occurred while hw_ep_prime is
executing. We believe that the interrupt causes an error return of
hw_ep_prime. We tried to protect hw_ep_prime from irqs and then no
case of the infinite loop is occurred.

I want ask if it is appropriate way that turning off irq inside
(threaded) irq handlers. And should we explicitly turn off irqs before
calling hw_ep_prime?

Thanks.

--=20
=ED=99=A9=EC=9E=AC=ED=98=B8, Jay Hwang, linux team manager of RTst
010-7242-1593
