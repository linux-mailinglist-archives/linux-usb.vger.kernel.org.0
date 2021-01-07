Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE8F2EE769
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jan 2021 22:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbhAGVHA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jan 2021 16:07:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727265AbhAGVG7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jan 2021 16:06:59 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D4CC0612F9
        for <linux-usb@vger.kernel.org>; Thu,  7 Jan 2021 13:06:19 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id q25so8909776oij.10
        for <linux-usb@vger.kernel.org>; Thu, 07 Jan 2021 13:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rollanet.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=lHC87a5gYkk+qNM6dj7Rwdv8K9KfmhHxFSOqlwzkfyk=;
        b=T+0886ztA2VlL8f3DktDVjIPxd8pE5ZLzktzzEB3AODkow6vIhyljVrPwxbzsA1a41
         aWn2Rxz8JKFsCaEI3NYVLr9sQGrcMglxGEl7sKfleow7d9vIxVFvHK6RRvo5tVgCNOH+
         02g2UqsW5fl9kX3MliS+DLpZL0lRcz17h3xIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=lHC87a5gYkk+qNM6dj7Rwdv8K9KfmhHxFSOqlwzkfyk=;
        b=sRX6T4PUpvjaaan045a52extpptd1ZFGFOBnXi8+m9n/Y525wjJQKrKRulbHz7xCDH
         +xHgl+zNU3PGB6mTzGC/4IfTfZrKKTeFqWEmkdtm6UXhJvJsWWTZ454qYadBCa2zXpNw
         9wNp3kivmZjmpFaiQEyCBIAxOiqNRIzZSKL6araskzWnU3KZxtsUfAjnWMZUb1Nc55aW
         GkI27+o0ZRlS7ScVCY1ZZFRryFwvndOrdZ+onNKug7Hd0GIqam3g4GvKtLzbBzOW1t92
         CFJKJzH9qKRxf3z4Q7yOSz6CTYamHXDQiveVLiKkAlKFzKL2HKx78Uu3pBwo/qn0bM8d
         ULAQ==
X-Gm-Message-State: AOAM533W8mGjEvYKVYgcnVXqUXtP51aGEIWw4fM7f2uToiB4WJ/hUD9k
        8UfKQLJMQHXZ+xYsztrTLclq6FPO9AClloXUj0Kx3cgGHRAtq3SZ
X-Google-Smtp-Source: ABdhPJxfsPQH53y/vYQ3/lB3j1xjM6q2vj7DRi/lYdEsBClyJBPX2PgUYUbs3ftxEa6bjzlK+ywaUtUVVqTraCubNXc=
X-Received: by 2002:aca:5548:: with SMTP id j69mr365734oib.32.1610053578754;
 Thu, 07 Jan 2021 13:06:18 -0800 (PST)
MIME-Version: 1.0
From:   Joe Abbott <jabbott@rollanet.org>
Date:   Thu, 7 Jan 2021 15:06:07 -0600
Message-ID: <CADuz4ONmN299aw460r4wXCEK5F1v9kt_cewCCrdg2hb5nJV9uQ@mail.gmail.com>
Subject: pl2303.c 110 baud not working
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Got redirected here by GKH email-bot.

My message to him was:
I have an ASR33 teletype that I'm trying to communicate with using a
PL2303 based Benfei USB serial adapter.  The ASR requires 110 baud 7E1
and it appears that the driver is defaulting to 9600 baud. (possibly
because the baud_sup array doesn't contain 110?)  I've tried adding
110 to the array and recompiling but that doesn't seem to help. I did
have to comment out the '/ SPDX-License-Identifier: GPL-2.0' line in
pl2303.c to get it to compile.

The windows driver works so the hardware is capable.

I must be missing something.  Any help appreciated.

Running Mint 19.3 64-bit.

I'm using stty to set baud rate like this:
stty 110 cs7 evenp -F /dev/ttyUSB0
stty reports that 110 is in use when I:
stty -F /dev/ttyUSB0

Oscope shows 150 and above changing (didn't try 75) but 110 reverts to
9600 (mentioned in pl2303.c file).

Also tried putty.

dmesg:
[ 3990.294929] usb 6-1: new full-speed USB device number 13 using uhci_hcd
[ 3990.479021] usb 6-1: New USB device found, idVendor=067b,
idProduct=2303, bcdDevice= 3.00
[ 3990.479028] usb 6-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 3990.479032] usb 6-1: Product: USB-Serial Controller
[ 3990.479036] usb 6-1: Manufacturer: Prolific Technology Inc.
[ 3990.481075] pl2303 6-1:1.0: pl2303 converter detected
[ 3990.494144] usb 6-1: pl2303 converter now attached to ttyUSB0


Here is lsusb:
Bus 002 Device 002: ID 0bda:0158 Realtek Semiconductor Corp. USB 2.0
multicard reader
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 007 Device 002: ID 046d:c00e Logitech, Inc. M-BJ58/M-BJ69 Optical
Wheel Mouse
Bus 007 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 006 Device 009: ID 067b:2303 Prolific Technology, Inc. PL2303 Serial Port
Bus 006 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 005 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 001 Device 002: ID 04f2:b027 Chicony Electronics Co., Ltd Gateway
USB 2.0 Webcam
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 003 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub

Here's modinfo:
filename:
/lib/modules/5.0.0-32-generic/kernel/drivers/usb/serial/pl2303.ko
license:        GPL v2
description:    Prolific PL2303 USB to serial adaptor driver
srcversion:     4864FE101A0398064B5D9A8
alias:          usb:v0CAAp3001d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v0B8Cp2303d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v0B63p6530d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v11ADp0001d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v054Cp0437d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v04B8p0522d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v04B8p0521d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v03F0p0956d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v03F0p5039d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v03F0p026Bd*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v03F0p3239d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v03F0p3139d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v03F0p4439d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v03F0p0B39d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v03F0p0183d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v03F0p0F7Fd*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v03F0p4349d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v03F0p3524d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v5372p2303d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v05ADp0FBAd*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v07AAp002Ad*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v11F6p2001d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v058Fp9720d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v050Dp0257d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v0731p2003d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v0E55p110Bd*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v0413p2101d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v079Bp0027d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v10B5pAC70d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v078Bp1234d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v0745p0001d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v04A5p4027d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v11F5p0005d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v11F5p0004d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v11F5p0003d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v11F5p0001d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v11F7p02DFd*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v6189p2068d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v0731p0528d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v1453p4026d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v2478p2008d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v0584pB000d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v0DF7p0620d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v0EBAp2080d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v0EBAp1080d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v056Ep5004d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v056Ep5003d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v0547p2008d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v0557p2118d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v0557p2022d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v0557p2021d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v0557p2008d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v04BBp0A0Ed*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v04BBp0A03d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067Bp23F3d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067Bp23E3d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067Bp23D3d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067Bp23C3d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067Bp23B3d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067Bp23A3d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067Bp2304d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067BpE1F1d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067Bp0307d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067Bp331Ad*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067Bp0609d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067Bp0612d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067Bp0611d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067BpAAA0d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067BpAAA8d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067BpAAA2d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067Bp1234d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067Bp04BBd*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v067Bp2303d*dc*dsc*dp*ic*isc*ip*in*
depends:        usbserial
retpoline:      Y
name:           pl2303
vermagic:       5.0.0-32-generic SMP mod_unload
