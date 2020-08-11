Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF24241F75
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 19:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgHKR4s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 13:56:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:43954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbgHKR4r (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Aug 2020 13:56:47 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 100A920756;
        Tue, 11 Aug 2020 17:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597168606;
        bh=NkBvzd5zoxgUU/FzPJiqzCrXUg/bU1GAPTumo8YXRPc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bVaUbVv6mhTY40jm8uMANf4j/otOf7QVCDTGy880E1Kmt4KFXVYEYF8pQ9nYqV77H
         znde+dFweJ78ZQrIrGDWmynLWvzABa4tR2e84WKYMh1vSCvj9Pxk0Pm7cl5h4BqomV
         U/kypS5l5NYFp9cLof3Jd8RNo4Gj5BL/sKfTU8eM=
Date:   Tue, 11 Aug 2020 19:56:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Patrik Nilsson <nipatriknilsson@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: high speed data to usb disk makes the kernel think that is has
 been unmounted
Message-ID: <20200811175655.GB828356@kroah.com>
References: <a161e45d-6ce8-2077-c513-380b67c4dfd8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a161e45d-6ce8-2077-c513-380b67c4dfd8@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 11, 2020 at 07:19:00PM +0200, Patrik Nilsson wrote:
> Hi!
> 
> I have an issue with a usb to sata adapter when much high speed data is
> sent. If I erase my 4Tb SSD disk connected to the usb to sata interface with
> a "slower" /dev/urandom it works, but if I exchanges this to /dev/zero the
> disk is after a while disconnected.
> 
> For logs from udev and more debug attempts see:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1886172
> 
> Description:
> 
> When the speed of data with a usb disk device is too high, the probes that
> check if the disk still exists is missed. This makes the disk to be
> unmounted and is remounted with an other drive letter (/dev/sdX). If this
> disk is the root ("/"), the computer hangs.
> 
> A usb SSD-disk (4 TB) connected to a USB port reproduce this bug easily.
> This has never happened with a mechanical USB-drive.
> 
> Symptoms and how to reproduce:
> 
> 1) (Disk mounted as root) Computer hangs. Only way to get started again is a
> hard reset.
> 
> 2) (Erasing disk, not mounted as root) If you erase a disk with dd ("dd
> if=/dev/zero of=/dev/sdX"), the disk disappears from the mounted list and
> reappears as an other drive letter. In my case the data is redirected to
> /dev/null and the fans speed up. The apparent data transfer speed is also
> increased. Usually this happens after about 45 to 60 minutes.

Can you provide kernel logs?  Odds are the disk disconnects itself as it
takes too much power or something.

> 3) Fill RAM with programs and make sure the swap to this disk is used.
> 
> Bug found in:
> 
> $ uname -a
> Linux pb-189b1884 5.4.0-40-generic #44-Ubuntu SMP Tue Jun 23 00:01:04 UTC
> 2020 x86_64 x86_64 x86_64 GNU/Linux
> 
> $ cat /proc/version_signature
> Ubuntu 5.4.0-40.44-generic 5.4.44

That's a really old kernel, any chance you can try 5.8?

thanks,

greg k-h
