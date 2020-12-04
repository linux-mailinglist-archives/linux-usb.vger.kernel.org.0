Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEAE2CEEC4
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 14:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729798AbgLDN04 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 08:26:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:33722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727711AbgLDN04 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Dec 2020 08:26:56 -0500
Date:   Fri, 4 Dec 2020 14:27:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607088376;
        bh=Vzjw67cSBzLE7M02slsPXUZTGZKu0p+1eja3xraiIDY=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=JA+IaqzsJL9GCuWsePHgcCvKeElwEJ+PKFuYUHoqH7it/aAizuTWZoaqS0j4skI14
         +gHJTqvx6csncoQUQbUXniyYSsDiBnMjzZZ6xtjLuLa5Df6aPEQaRKHuXLBWXIHBp5
         x+Xvvderhngx2gdlTfeXgQ1aO3+jvvbCTcZcqz9k=
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?utf-8?B?0JTQtdC90LjRgQ==?= <denisw@tps-expert.ru>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usbhid kernel driver bug?
Message-ID: <X8o5RCgEH/SsmEfP@kroah.com>
References: <cc67eeca-6d74-4e27-85db-11843c7f70db@tps-expert.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc67eeca-6d74-4e27-85db-11843c7f70db@tps-expert.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 04, 2020 at 03:55:38PM +0500, Денис wrote:
> My UPS wokrs uncorrectly. it appears and disappears in system after a few
> seconds. help me
> 
> Ubuntu 20.04
> 5.4.0-56-generic

That is a Ubuntu-specific kernel release, based on a kernel from us from
over a year ago.  I strongly suggest you go get support from Ubuntu for
this issue as only they know what is in that kernel, we have no idea.

That being said:

> 
> [ 2925.730918] usb 1-1.2: new low-speed USB device number 74 using ehci-pci
> [ 2925.848395] usb 1-1.2: New USB device found, idVendor=0d9f,
> idProduct=0004, bcdDevice= 0.02
> [ 2925.848402] usb 1-1.2: New USB device strings: Mfr=3, Product=1,
> SerialNumber=2
> [ 2925.848405] usb 1-1.2: Product: HID UPS Battery
> [ 2925.848409] usb 1-1.2: Manufacturer: POWERCOM Co.,LTD
> [ 2925.848411] usb 1-1.2: SerialNumber: 004-0D9F-000
> [ 2925.894211] hid-generic 0003:0D9F:0004.01C3: hiddev0,hidraw2: USB HID
> v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on
> usb-0000:00:1a.0-1.2/input0
> [ 2929.604764] usb 1-1.2: USB disconnect, device number 74

This looks like your device keeps disconnecting and connecting to the
system over and over.  That's not something that the kernel can do on
its own, are you sure this isn't a flaky cable or something like that?

good luck!

greg k-h
