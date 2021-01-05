Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD8E2EAE3A
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 16:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727746AbhAEP1K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 10:27:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:59540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727634AbhAEP1K (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Jan 2021 10:27:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4900722BE8;
        Tue,  5 Jan 2021 15:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609860389;
        bh=tf7siYdFOYEjcGJb6NgU2FVcNHARiMtpNTM2ObzJNAc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HsNR5xUVvSjlvnxTGzJVTULsXuF2d0bu0hHeP/9DyMWZd++zdKaSLk8l+cbf2jqb1
         OvXiQblsOMyLUzgoi+uYajYzsNfKgPqcfMns2gisqDwD/ZJgn5AebDYf+HyaPDp6s8
         shWV4BzDAeL1T6z2eYoCWAO4TIfEnb4WKKZ8JqQE=
Date:   Tue, 5 Jan 2021 16:27:53 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Augusto Ciuffoletti <augusto.ciuffoletti@unipi.it>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Problem with the CH341 driver in Ubuntu 20.04
Message-ID: <X/SFeQM48WUyVR9V@kroah.com>
References: <CAOefePC_PEkra4adLq4Risea3VCtN41jU42_C=5UJ=mYuGfFog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOefePC_PEkra4adLq4Risea3VCtN41jU42_C=5UJ=mYuGfFog@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 05, 2021 at 04:14:14PM +0100, Augusto Ciuffoletti wrote:
> I run into this problem trying to program an ESP8266 board, which uses
> the CH341 chip in the programming interface as a USB-to-Serial
> interface. The problem appeared after an upgrade from Ubuntu 19.10 to
> 20.04 (that I carried out one week ago).
> 
> This is the kernel I am using:
> 
> ===
> $ uname -r
> 5.4.0-58-generic

That's an old kernel, you should get support from your distro if you
want to stick with that, but:

> ===
> 
> When I connect the ESP8266 board (a Wemos D1 mini) to the USB there is
> no activity on the syslog (or dmesg), and the kernel module is not
> loaded. In fact I do not see the /dev/ttyACM0 device in the /dev
> directory and no useful device appears in the Arduino GUI.
> 
> I have found the module in the kernel tree but, even forcing the
> installation, nothing happens:
> 
> ===
> augusto@Legion:~$ ls
> /usr/lib/modules/5.4.0-58-generic/kernel/drivers/usb/serial/ch*
> /usr/lib/modules/5.4.0-58-generic/kernel/drivers/usb/serial/ch341.ko
> augusto@Legion:~$ sudo modprobe ch341
> [sudo] password di augusto:
> augusto@Legion:~$ lsusb
> Bus 002 Device 002: ID 05e3:0626 Genesys Logic, Inc. USB3.1 Hub
> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 001 Device 003: ID 13d3:56a6 IMC Networks Integrated Camera
> Bus 001 Device 005: ID 0cf3:e500 Qualcomm Atheros Communications
> Bus 001 Device 006: ID 046d:c517 Logitech, Inc. LX710 Cordless Desktop Laser
> Bus 001 Device 004: ID 093a:2510 Pixart Imaging, Inc. Optical Mouse
> Bus 001 Device 002: ID 05e3:0610 Genesys Logic, Inc. 4-port hub
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

Where is your usb-to-serial device here?  Are you sure it's actually
working?  I don't see it in the list of devices, which is a pretty good
reason why the serial driver isn't working :)

Try looking in the kernel log when you plug the device in, perhaps it
says something?

thanks,

greg k-h
