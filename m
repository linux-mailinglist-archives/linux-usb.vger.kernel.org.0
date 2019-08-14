Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8968D78D
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 17:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbfHNP7y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 11:59:54 -0400
Received: from mx07-00252a01.pphosted.com ([62.209.51.214]:1122 "EHLO
        mx07-00252a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725828AbfHNP7y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Aug 2019 11:59:54 -0400
Received: from pps.filterd (m0102628.ppops.net [127.0.0.1])
        by mx07-00252a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x7EFws7x014621
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2019 16:59:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raspberrypi.org; h=mime-version :
 from : date : message-id : subject : to : cc : content-type; s=pp;
 bh=kAAlN0ErpO5xe7Xwc59QIKhEuf6yRMoCBWz21cXpwgs=;
 b=PTmmdnQz3k6j934w37m5UoHbSeWgSUNXmYc831LYxjvHgEta+Dxlc+geHT0cZVWowICC
 PudHR9iqy74i095pPYmU0FMZrnVzg2RY7NulUdoGI889XwsixZr6WQ7lcusb1DnseF9K
 J2XZTWBhdZYhpkVoc+ExDivuDhrPTiUPgCM+zu2cBzVl4pGl16Yi4aO05rng8+GS7xq+
 lvlFneNOzjTUYIG4g3s3qyn/1foGtYJ95Gz80Ex3Hq9ITITbUS13MIDwqGtgrJpBnt6z
 tNzlK7z/2igXq6Tnb428Cy8SlleyG/GdeFWx5Yn3YmviFdd51RW5l7fPEUMQih7etYk9 Jg== 
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
        by mx07-00252a01.pphosted.com with ESMTP id 2ubfbbrw39-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2019 16:59:51 +0100
Received: by mail-oi1-f198.google.com with SMTP id i132so39008777oif.2
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2019 08:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=kAAlN0ErpO5xe7Xwc59QIKhEuf6yRMoCBWz21cXpwgs=;
        b=WUu0MfCafVoy1DqonprdkfhflT92RYD29lPcZRE65upeI3pEpUEoCeU7maiDtMBWcb
         BxJqLh9JIABBifNyxxofKVu/Od9ds8qacLz4AQpz6Im2BAG/livmS2T1eThxw8xeRjEI
         e83ziC9/+WrNs+qX1m3SLJRsm+EcVH2wJEiq+sJyby/jPU4MAz5BWZU0JjM9DgCnpard
         dCY1yghlBCkQ4zJUu3K0RW+kwcCLlWSkq1OplDBxiDPEmMbAUNMmsq4/Z0IYpw2WZfza
         r8K4mGK+gBjEEds6Ffoun/KXu+FC1iFeWeCdNi9W1dIjnBEhTX55fkWSyDdru2g+z9pd
         d+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=kAAlN0ErpO5xe7Xwc59QIKhEuf6yRMoCBWz21cXpwgs=;
        b=LKyMxc7N2UmGd9U8YPD+JQ5bb3R8MwOsw0IRNkeOQM1DE73lW/RjcJfQOoOGAPXRmp
         P/XcyxEzk+PzBVylkb/twGMOxozMWzzuiopznS/1jI1eBmDLjWrPH1e1kM9xUuBeaEe1
         oOE6+rzVYOyIhsyd+DrbKUX5bdeRlfSYcyEbkQBrjYeCfDc5Fb8CJDoxQ+nM/4yiO+Gm
         6oY8CgcxhGbt6grRpJ8lZrWwXSj1nJQZxybSEfPRY4chx3AhFVBSDB81V00CQUCyd5lQ
         ixfHY1Qw5KrW9tr5Whz7g77CvW7MzfO8fuiZp/6/SSeDuPULBZzZunrw/wh08ZUoEYcX
         SVzw==
X-Gm-Message-State: APjAAAWOiF/sXCBvk21IBezYw5VaDayQCQ8VZRU/fYWeqZG6+/PXPrE9
        t+nyZNA6DDDpFR6lvsXNOBaxXtdlVvl0Mk2dO7R/6QFGDb6ggZPHCAuAcK6g6hNvpA2vCfNWsOt
        W/sZmOURo3xua+xgwrtBnMBqGCMD8hHYwjf4D
X-Received: by 2002:a6b:ea02:: with SMTP id m2mr608530ioc.155.1565798389481;
        Wed, 14 Aug 2019 08:59:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyNDUY4w+C3ICcg/nNXYIwACl12eaOQuRlcLNVJmZOy0WsMbJM/FGNQ3IroaV5RrjNLkI2WKMGzzpG3DbSWHJc=
X-Received: by 2002:a6b:ea02:: with SMTP id m2mr608521ioc.155.1565798389318;
 Wed, 14 Aug 2019 08:59:49 -0700 (PDT)
MIME-Version: 1.0
From:   Jonathan Bell <jonathan@raspberrypi.org>
Date:   Wed, 14 Aug 2019 16:59:36 +0100
Message-ID: <CAPHs_J+G0jR5dMg1gVD0z60Zf4oZBikx6P9+B99-TA6m29DWGA@mail.gmail.com>
Subject: dwc2 / Raspberry Pi - hardware bug for small transfers results in
 memory corruption
To:     linux-usb@vger.kernel.org
Cc:     Minas Harutyunyan <hminas@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-08-14_06:2019-08-14,2019-08-14 signatures=0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As reported by one of our users here:
https://github.com/raspberrypi/linux/issues/3148

There is a bug when the dwc2 core receives USB data packets that are
between 1 and 4 bytes in length - 4 bytes are always written to memory
where the non-packet bytes are garbage.

This is easily reproducible by
- Plugging a UVC-compliant webcam into a Raspberry Pi gen 1, 2 or 3 product
- Running "v4l2-ctl -d 0 --all"

The camera's control ranges (brightness/contrast etc) are all queried
by 1- or 2-byte control IN transfers. As 4 bytes get written to the
URB's buffer, this results in the uvcvideo data struct containing the
control information getting corrupted like so:

contrast 0x00980901 (int)    : min=0 max=64 step=1 default=57343 value=32
saturation 0x00980902 (int)    : min=0 max=128 step=1 default=57343 value=105
hue 0x00980903 (int)    : min=-40 max=40 step=1 default=-8193 value=0
white_balance_temperature_auto 0x0098090c (bool)   : default=1 value=1
gamma 0x00980910 (int)    : min=72 max=500 step=1 default=57343 value=100
[etc]

We've implemented a downstream fix for dwc_otg[1] that just forces use
of the dword alignment buffer mechanism (aka DMA bounce buffer), but
dwc2 only uses a bounce buffer for split-IN transfers.

I have two questions:
1) Does this bug occur on non-Pi hardware?
2) What's the easiest way to patch this for dwc2?

[1] https://github.com/raspberrypi/linux/commit/c0e4ca17457d6669a263e86a88f0036875fc019e
