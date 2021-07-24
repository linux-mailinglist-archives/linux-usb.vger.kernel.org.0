Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 976AB3D481D
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jul 2021 16:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbhGXNhJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Jul 2021 09:37:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:52846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229539AbhGXNhJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 24 Jul 2021 09:37:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EF3460E97;
        Sat, 24 Jul 2021 14:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627136260;
        bh=qROEOE8sxEEswG2p8l1zshWhlXdvpKohVLS6H0Zc+oA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IGF0FictuDWqDDAjgrBKDBsqhsTr2dX0DFluDrhJVbV1GlhOjGpbjK6k5FyZ9gO5w
         /J7fJa2IZ+b6htNE+ZjEQsZAnA+ofeLzrJtb7eyvC/HYvmQEoOFKaBlSacsWTJwlB1
         HSC8H1pacmk9ryaHmLjNSOer3YlQnjmexgRgwzmU=
Date:   Sat, 24 Jul 2021 16:17:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Petr Vorel <petr.vorel@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-sunxi@googlegroups.com
Subject: Re: Mainlining Linux Sunxi SoC AW USB
Message-ID: <YPwhAsK/rDkVeK0y@kroah.com>
References: <YPvjYIsu0G0HSu5I@pevik>
 <YPvrpUZ/VRc0eHvA@kroah.com>
 <YPwYlvh4DqaUsPCF@pevik>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPwYlvh4DqaUsPCF@pevik>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 24, 2021 at 03:41:42PM +0200, Petr Vorel wrote:
> > Why is this even a driver at all, it looks like you can write a small
> > userspace program using libusb to do everything it does, right?  What
> > exactly is this driver needed for?
> 
> I'm sorry for not providing more info at the beginning. This is a driver for
> host computer (i.e. developers laptop) used by LiveSuit tool [2] to flash Images
> to the NAND of Allwinner devices. LiveSuit itself [3] is unfortunately provided
> only in binary form. The only open source code with GPL v2 license is awusb
> driver. Thus I thought I could ease my life with upstreaming at least the
> kernel driver. But maybe it's not a good idea. I'm using LiveSuit for flashing
> Allwinner A31, but it requires quite old distro due libqtgui4. Maybe sunxi folks
> use something newer nowadays, but I haven't found anything in their wiki.

Ah, that's not going to be good then.  Really, this doesn't seem to need
to be a driver at all, and the ioctls are really strange so we would
need to change them anyway before it could be merged.  But with no
access to userspace code, that will be quite difficult, so I would push
back on allwinner and have them work on resolving this.

thanks,

greg k-h
