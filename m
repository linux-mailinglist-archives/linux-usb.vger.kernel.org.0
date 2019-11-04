Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E828EE1CF
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 15:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729058AbfKDOE3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 09:04:29 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43351 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727782AbfKDOE3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Nov 2019 09:04:29 -0500
Received: by mail-lj1-f193.google.com with SMTP id y23so6826273ljh.10
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2019 06:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dawes-za-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=g6EyMF+u5e65vvlDXIzQbx6k4XLQuFfwPRwATGVBBiQ=;
        b=KAqdt8b4rtahb6hV/AbbPvRwg60iSqtp+wijF4ZM+abKojsqgUlKVfqAdq1/T8DL0l
         2iLb/0+GsjYFHLnF9Qn2rxKF2+6CmHrlwPrsjc6KWemhqDmMsBZ3jm0rpMCjEZm6D5Ss
         LZf6HPN5xuesHDMfPwKv4wRfOOfjU1HjitlWimQcXx0pqtPyxIxCmn3qeJoEr45gS9do
         Vq9p93m6xuW0t2x2D0yvLTE1W2uhVuKlOAKGBYTIPA0NArACzbIhNlNpnlnRmWSqUiRQ
         6JBXmF7aUHuLm7ggrmXtk8wVg3AU/OKHPbyR9Q92fUGZhEiEgiTCz7HNGrrvCU7eByle
         g5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=g6EyMF+u5e65vvlDXIzQbx6k4XLQuFfwPRwATGVBBiQ=;
        b=tVLh5CpiBB7vDZWNgWb4l5Gg4JtpRiCJgO5k5ndfmVGQDlR5IC0Jm/jPtFCt3Upntp
         X3PAonMAD+amKTS0tuAyLTF3rSOozNOq3T1f+KzAHsRyKy1iaWrOQI+kmU7iE38E/UP0
         Aa5EnVIffQzrpKLG9kNqW7Jk6tk0MdiSYfgDCCptCeupJAaNLB/QPem6feFLwRvZI9Lr
         02xcMlzNFaoOQJFyI0kj1kHMvUQT1TwgzDYnBRP/j2+WaYgQHP8b20YDl0kIt8ntzXJO
         C81Go/VVtFtBVzinDqgVXKmslczZ/nqe1Vp6HQxVKIbIkxnWXT8GYXK3PbmaFeVFjtXQ
         VJKw==
X-Gm-Message-State: APjAAAXaf14NiuvOOvJeKknGtshCPUpBClPMqwU1/eKJ6H2xq+QQuxeQ
        p313hZzDQEustYv8m54ryN2Mc8Q2vTwgjXfsRbn/HHkvzSU=
X-Google-Smtp-Source: APXvYqwYCddpFhiwatZCyGwCUepwCypYQApP4gIkFjifaEPr6h/ZWNZQ+B7OPAFJLuzZ8X2gmnCXDMFh4LQ4TqTe1bA=
X-Received: by 2002:a2e:96c3:: with SMTP id d3mr5065915ljj.248.1572876265663;
 Mon, 04 Nov 2019 06:04:25 -0800 (PST)
MIME-Version: 1.0
References: <CAOYdKdiYdnH246mZSRZ==dhjcM3Oah5vFP1Nh=m4SgyvJKNn2w@mail.gmail.com>
In-Reply-To: <CAOYdKdiYdnH246mZSRZ==dhjcM3Oah5vFP1Nh=m4SgyvJKNn2w@mail.gmail.com>
From:   Rogan Dawes <rogan@dawes.za.net>
Date:   Mon, 4 Nov 2019 16:04:10 +0200
Message-ID: <CAOYdKdh7zpu2Evp=MNHnWrB-xjwhC-+Sqrtm29+gZP8LuGORsQ@mail.gmail.com>
Subject: Re: Programmatically switching a USB port from Host to Device mode
 (not OTG)
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 24 Oct 2019 at 11:01, Rogan Dawes <rogan@dawes.za.net> wrote:
>
> Hi folks
>
> I am using a GL.Inet AR750S (Slate) travel router, which is based on
> the QCA9563 SoC.
>
> I am trying to see if there is any way that I can get it to operate in
> a USB Gadget mode.
>
> According to twitter support
> (https://twitter.com/GLiNetWiFi/status/1187190831746179073), the
> router's external port is connected directly to USB1 on the SoC, and
> the internal port is connected via a USB hub to USB2.
>
> According to the datasheet which I found at
> https://github.com/Deoptim/atheros/QCA9563_July_2014.pdf, USB1 should
> be a Host-only port, while USB2 should be device-capable.
> Unfortunately, the hub chip makes it impossible to test USB2.
>
> So, my question is, is it possible to modify the device tree to
> configure USB1 in gadget mode (even though according to the datasheet,
> this is a reserved configuration) ?
>
> Is it possible that a pure software configuration change may be
> sufficient to change the role of the port, or would I need to remove
> pull-up/down resistors as well to see if this could work?
>
> Many thanks!
>
> Rogan

I've been trawling the Internet, and trying to understand if there is
any prior art indicating the feasibility of the QCA9563 actually
supporting USB Gadget or Peripheral mode, and I came across what
appears to be a copy of an official tree
(https://gfiber.googlesource.com/kernel/windcharger/+/ca3986b4fd425176662f005cc996d61dd439d1f2/drivers/usb/gadget/Kconfig)
provided by Qualcomm to Google for their "windcharger" fibre router.

It contains commits like:

  commit d95f9bd73fd3a4ebabf7c524941f6b6095388c55
  Author: Allan Zhang <allanzhang@google.com>
  Date:   Wed Jan 21 17:00:47 2015 -0800

      Initial WindCharger Linux Kernel Ver

      This for record purpose. It's the QCA-provided AP143/board953x linux
      kernel, based on linux 2.6.31.

      This version targets for no code change and reflects qca code snapshot.
      Any enhancement will be in individual CL for review.

      Change-Id: I7252866c2f87f8ffd26ee64976dd4dccc955e739

Which contains a file arch/mips/configs/board956x-wrap_defconfig

which sets

+CONFIG_USB_GADGET_ATH=y

So, I'm wondering how realistic it would be to try to get the
CONFIG_USB_GADGET_ATH driver ported from this kernel version to
mainline, or perhaps if someone might take a quick look at it and
indicate whether the current mainline actually already includes this
functionality? I do know that AR9331 USB GADGET support does exist in
mainline via the chipidea driver, and from what I can see, the rest of
the Qualcomm chips seems to use the same chipset, so perhaps it is as
simple as configuring the device tree appropriately to use the
chipidea driver on the appropriate port?

I'm completely happy to try and figure this out myself, but would
obviously appreciate any pointers from anyone familiar with the
Qualcomm USB drivers.

Many thanks!

Regards,

Rogan
