Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB0626C6AE
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 19:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbgIPR74 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 13:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727697AbgIPR6n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Sep 2020 13:58:43 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C55C08E86E
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2020 06:33:37 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id b124so3946138pfg.13
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2020 06:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Z59ooJDsuSRh3WpgjPcaFgr1Ej1tmjibts28KLusPiE=;
        b=sBkh5DOhsfR2dl0x/ApnSnRxoQaso9jXJi7fNCqa1h/nLM2nCkz0NgYgWn+MmvbgqZ
         b4PsvrQpWxqWjeAhKqsTBGxlxWHXb72T3l1A8wkhEkjNH5dwEG34XpOlrOg6nKkBG0Ra
         nEYgJzDBMZKrKF1e9QimVS7NTlWm1cm/5D5Kaznvzd4phI+IRySHZ06KrcXUOIq5iikl
         V1MAW93Nn6qVgeRz7RJjGUN02eM9zxG+c7XXQoXzleUsH/acHELN/hkkbIvd0xukqMRm
         DDDAFsaAlg/r3HeZYOhSn9FqMEgBU6tUoMSAJ61IosAri7E1Uga07omV7xdzPM8C31RS
         d7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Z59ooJDsuSRh3WpgjPcaFgr1Ej1tmjibts28KLusPiE=;
        b=oeLpX8pchOROZ3c7qIN4BB9xgsYxnSvUxznvIQOZoPnoFxrzp7Fpj5DGJxe4r6ki9I
         ZsoLRiAOR2ZMBbqAnG+9ssShbYhoD7usiMojZcojin1p3JZHBYQpUaD/4vcl4XcHSers
         1QOJAw3dMv/tDI9ikD9zLvN2nRj+ju0Ghc4XvokqKebxOQ0l3XMzDFLzOhO/GfQAO4Sn
         0/QXrxhmaDv3X96Pve1hJP/DQjwjoAGBIvlu8ISSwM8DjGZiu18HBGoNc9YPOI9Y+h6+
         FI4aSVjUbt7ZG+y69i6ebvmo0+COZkh9qYdRA2c6Z4Wdycbpf+aSa0kZ1iwpqSNJgF02
         vlMA==
X-Gm-Message-State: AOAM531ntGohVCKQTYJri1oFv76VMVep88mDwzP10/g8QtSh+ogoy05C
        PhxW3Jbu3TR2hyiM8QqTplgBOUSwFHdDUIlYFxcmCg==
X-Google-Smtp-Source: ABdhPJzjinU/zjeAOGY94FbXyYFRLLCekdZY3q7ofVZmOlV51ckS2dByMnR8/LczqwsVEgD15ft70VZxzSOLAe2RBqA=
X-Received: by 2002:a62:38ce:0:b029:138:838f:dd53 with SMTP id
 f197-20020a6238ce0000b0290138838fdd53mr21292120pfa.2.1600263216683; Wed, 16
 Sep 2020 06:33:36 -0700 (PDT)
MIME-Version: 1.0
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 16 Sep 2020 15:33:25 +0200
Message-ID: <CAAeHK+zOrHnxjRFs=OE8T=O9208B9HP_oo8RZpyVOZ9AJ54pAA@mail.gmail.com>
Subject: USB driver ID matching broken
To:     Bastien Nocera <hadess@hadess.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     syzkaller <syzkaller@googlegroups.com>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Bastien, Greg, Alan,

Looks like commit adb6e6ac20ee ("USB: Also match device drivers using
the ->match vfunc") broke the USB driver ID matching process. This, in
turn, led to a complete breakage of the USB fuzzing instance.

This is how an attempt to connect a USB device looks now:

[   39.781642][   T12] usb 1-1: new high-speed USB device number 2
using dummy_hcd
[   40.299955][   T12] usb 1-1: New USB device found, idVendor=0cf3,
idProduct=9271, bcdDevice= 1.08
[   40.303072][   T12] usb 1-1: New USB device strings: Mfr=1,
Product=2, SerialNumber=3
[   40.305678][   T12] usb 1-1: Product: syz
[   40.307041][   T12] usb 1-1: Manufacturer: syz
[   40.308556][   T12] usb 1-1: SerialNumber: syz
[   40.314825][   T12] usbip-host 1-1: 1-1 is not in match_busid table... skip!
[   42.500114][   T51] usb 1-1: USB disconnect, device number 2

It seems that when going through the list of registered IDs the code
tries to match against USB/IP and succeeds as usbip_match() always
returns true.

I'm not sure what's the best fix for this is.

Thanks!
