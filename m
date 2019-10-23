Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89DFDE15A0
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 11:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390824AbfJWJUx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 05:20:53 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37955 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389998AbfJWJUx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 05:20:53 -0400
Received: by mail-lj1-f195.google.com with SMTP id q78so5144860lje.5
        for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2019 02:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dawes-za-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=Ov4RSTuOwQ/5HVuBdfnKek3dmRXiM+x+6mqknsSIwqE=;
        b=w/JVv255PuYJ4qe+NHdhtOCXzS7KaAG02QNFmERDJfSjp3UcaET6k25wXlY6Q6wed5
         qtZ+vDyA6NHkggM7wsGlnfBzbLYRuLKiQucQoFRdbuuw19YTM3ZnC3LIq9OZgGuVIOL1
         dBNzI4LX83odG8GiRwQdXP+M4XMTQjpwMJ50Mx8uSfYeMqz7IIPoUPxrB6h/2E5d23+4
         sQbjlVtHi7gkQhXeE+dk6Ul/SNGIvU0/EaU7wNpmYw8b0DbCy7yl4MjtWpl2YuVUsiLE
         gyR5hqfKM6YOGWp8qwMXcA/tzVrF2wqEkc9iiX591PwwFlBAScshCo/BftlT4RiSCKMW
         g7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Ov4RSTuOwQ/5HVuBdfnKek3dmRXiM+x+6mqknsSIwqE=;
        b=npWDHNHs4R1d9VRvZ6WP7G79geXdHPqL0XcP0e6xCb/0qEqgrdns2hyyhTJ07yHvhI
         crwFyJb98pH3BIqQu3BucelxBYxPJz8dwfJX7Dfp0/WhkA/s2gfUNOw7FCEN34rTS3fV
         jgFfxkBeeDxXqu0HiCbBwCAYcHjma+6vSc8WUSRa1vGwMJuXxZhE8NrQaxXMut8SDh3g
         SVAokleh9U4RGJYpVtpGypHwgYyAkbCqo/LjNfMNJg0hpdyExI/Lg1eGjRkhO0Gpmnq0
         gR82S7rwMxn4oeoBSbhwno6BkI6cKxp3fykJDD+DstBDdwuiUksj7G7Vm0xk6upP4G5y
         Xyzw==
X-Gm-Message-State: APjAAAU4bM5UkqDz20Y+IAH/QEVS2pXSjFBMO8FK+r/Y7jOpUHeh/RxX
        g5r9qZCYzbT5m/XeblvSqMOi4EBFTrt7piYnCMdIyfyZ3pk=
X-Google-Smtp-Source: APXvYqylzsGORJeGT1SkGsiLBA+z5pmIM6KtlqVOwmPTk8glWTwXz6tTBHbYObxWr/3K51eSAajeX7yh1oIsw/PNZoc=
X-Received: by 2002:a2e:b537:: with SMTP id z23mr1735836ljm.129.1571822451367;
 Wed, 23 Oct 2019 02:20:51 -0700 (PDT)
MIME-Version: 1.0
From:   Rogan Dawes <rogan@dawes.za.net>
Date:   Wed, 23 Oct 2019 11:20:40 +0200
Message-ID: <CAOYdKdhLGPazjVC3S-RVJ=Kcw2swabrsY_iDmG5zV9eCRZ=2Cg@mail.gmail.com>
Subject: How to find devices that have gadget support?
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi folks,

I'm trying to find out which CPU's that are supported by Linux have
USB controllers that support gadget mode.

In theory, this should be a relatively straightforward matter, given
the device tree descriptions, I think. But I am struggling to figure
out how to actually create a list of these devices, and which
attributes to look for.

For example, one device that I am interested in is the Mediatek 7621.
From what I can see from drivers/staging/mt7621-dts/mt7621.dts, this
device has an xhci node that is compatible with the mt8173-xhci
driver.

From arch/arm64/boot/dts/mediatek/mt8173.dtsi, I see a node u3phy,
with details for a combined USB2/3 port, and a USB2 port, which
declares itself compatible with mt8173-u3phy.

Grepping for mt8173-u3phy, I find drivers/phy/mediatek/phy-mtk-tphy.c,
and eventually, searching for OTG, I find:

static void u2_phy_instance_set_mode(struct mtk_tphy *tphy,
                                     struct mtk_phy_instance *instance,
                                     enum phy_mode mode)

which can set various host/device/otg modes.

Firstly, am I correct in my reasoning, that the MT7621 should
therefore support (at least) USB2 device mode, and likely USB3 Dual
Role Device too?

Secondly, is there an easier way to reach this conclusion?

Many thanks!

Rogan
