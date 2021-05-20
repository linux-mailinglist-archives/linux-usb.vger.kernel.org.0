Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF9D938AF87
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 15:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240443AbhETNEZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 09:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242444AbhETNES (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 May 2021 09:04:18 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF74C04C05C
        for <linux-usb@vger.kernel.org>; Thu, 20 May 2021 05:36:07 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id o21so16393817iow.13
        for <linux-usb@vger.kernel.org>; Thu, 20 May 2021 05:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=34ELGrTKuiRLxs9YZgxq8FjdR4bSeQq2ABY8yaAo3p8=;
        b=NdVCwdCk0OShLDJDQ+Z9tTynVhjzNFmImm1ltGb9gmE+rdaexcQKtSFVce9f1aVUC+
         S7xKsJfxMWlD0b82R8DuZRMej52+Y39hSHHnejZuTYEZedn217b4ltxI6D1SiSiV1nei
         iA6WlQT7zUg1Po6+RdxStUVWXJKgajigvFUbHirvxhKAzh2uwnhbb2uSN/qH0RtjbtUa
         uDGuk5SiCg2U7um9IYuP4IbRJgm3OTiyF+ruX2hWBlkRkCU3lSRo5WXZUdNhEP95eFmJ
         u+1FNjs1LAxsuzhtogFs4mLc6X1AsoNFOPSMFeMfOBNlGIIYKX+Ofm517T7Sp2SMRLbo
         wT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=34ELGrTKuiRLxs9YZgxq8FjdR4bSeQq2ABY8yaAo3p8=;
        b=KQrgpTaQqgx7GAZZUEfc7V4DPLE8GGSG8Vx1FQ9j26ApxlywK+dequ5/GItydnb17h
         mQv3+/Sa11JkqH6uYuvyo+hSkwLgVOMy+TL8Jzn2eyr9VO4Q4ZW7XzUQp+VCkMNrK+2H
         P9MR/uqAmirY/AItODsx7jSujkKiUUkUSan1fQAU2IDpjSo9JOU/uJBwi8GPqhu8u7E2
         DzCwMcvm6Wx6dBDwd+FSyE+LYkljjM3kOUxKPeIjBRiVOocgpGDX5oGSx7n7kdzVpKDl
         wtveqoWDMzJreKCrvMi580HPs+cMLGL1loR19MS7ek+YZDrCNJ1JtmjSTAFMCy0TlzwP
         CyHQ==
X-Gm-Message-State: AOAM530QplWLm4/v9EkblskCwqI4kPl0Fcltp9QbjzHqOX5bSIr4lHW1
        fNwzwuIzlu7rq3duyHcmDKBE6NJI1rh4x0hPCTVdtE97hAhXAXeJ
X-Google-Smtp-Source: ABdhPJxl3X0bi/unmU3kMQOO8DVToqfi+dk4i7NwjkVtKc9iaE62f3uL3UNXEXexuxFDjD9BtRWzaLy4t6Ulz33WvoQ=
X-Received: by 2002:a02:a10f:: with SMTP id f15mr6024629jag.124.1621514166894;
 Thu, 20 May 2021 05:36:06 -0700 (PDT)
MIME-Version: 1.0
From:   "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
Date:   Thu, 20 May 2021 15:35:26 +0300
Message-ID: <CAJs94EbV6+C81NggHtnJGZ8aoeW12POhv4zi0RTawuDcf+ybFA@mail.gmail.com>
Subject: Odroid C4: dwc2_hsotg_start_req: ep1 is stalled
To:     hminas@synopsys.com
Cc:     "open list:MUSB MULTIPOINT HIGH SPEED DUAL-ROLE CONTROLLER" 
        <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I am running upstream Linux 5.12.3 on an Odroid C4 board and see lots
of the following lines in dmesg while using the gadget mass storage
driver. I suppose that this can indicate some issue in the dwc2
driver.

[  189.752586] dwc2 ff400000.usb: bound driver g_mass_storage
[  190.118994] dwc2 ff400000.usb: new device is high-speed
[  190.199074] dwc2 ff400000.usb: new device is high-speed
[  190.267855] dwc2 ff400000.usb: new address 4
[  191.310603] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
00000000ce48180a ep1in, 1)
[  191.310737] dwc2 ff400000.usb: dwc2_hsotg_start_req: ep1 is stalled
[  191.311015] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
00000000ce48180a ep1in, 0)
[  191.312257] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
00000000ce48180a ep1in, 1)
[  191.312373] dwc2 ff400000.usb: dwc2_hsotg_start_req: ep1 is stalled
[  191.312762] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
00000000ce48180a ep1in, 0)
[  191.336959] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
00000000ce48180a ep1in, 1)
[  191.447759] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
00000000ce48180a ep1in, 1)
[  191.447823] dwc2 ff400000.usb: dwc2_hsotg_start_req: ep1 is stalled
[  191.448098] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
00000000ce48180a ep1in, 0)
[  191.448550] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
00000000ce48180a ep1in, 1)
[  191.567748] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
00000000ce48180a ep1in, 1)


-- 
With best regards,
Matwey V. Kornilov
