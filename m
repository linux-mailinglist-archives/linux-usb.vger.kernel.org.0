Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED2B12FBF22
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jan 2021 19:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392247AbhASSgX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 13:36:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:57520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391403AbhASSff (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Jan 2021 13:35:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E491E22DFB;
        Tue, 19 Jan 2021 18:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611081295;
        bh=4aOfcOc1Vq7B62nHzEpR/XCPFhSQ6Oe8zNJgiT5jV28=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zlzuSRaT+o8HahEPX4wVvxK7fiYDqw37048jBui0+273ms14mNsID3bIfFFz69+Fk
         cY+60aGsxgraUsjr5zwri2ACI0I4e2J5MQctVusNXsUQHJxn/UwhaRLxgmJypyCog9
         vA6fbUQqHXvH6fKaKDaihRlJ3Rn00AVkdQCb2m24=
Date:   Tue, 19 Jan 2021 19:34:53 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Doug Kingston <dpk@randomnotes.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB Sound Device detection problem
Message-ID: <YAcmTSV6/fCMCXUd@kroah.com>
References: <CAGPaoUucowcpa5k_9VVjnRnrUkiG=npiCJYaOyT6-Ya7hEfJKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGPaoUucowcpa5k_9VVjnRnrUkiG=npiCJYaOyT6-Ya7hEfJKg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 19, 2021 at 10:20:34AM -0800, Doug Kingston wrote:
> I am doing some work setting up some radio data nodes that use USB
> soundcard devices to attach to radios.  I am building a system with
> two radios and two identical soundcard devices attached to a Raspberry
> Pi running Raspbian.  The devices are discovered at boot time by the
> hid-generic subsystem:
> 
> (see dmesg output below)
> 
> I am accessing the sound devices from Wine via the ALSA stack.  The
> problem I have is that
> the product string is identical for both devices and they show up
> identically to the Windows app ("USB PnP Sound Device").  I need to
> find a way to alter this string so that they are different.  If they
> were processed by udev I might be able to do something there.

Why do you need the string to be changed?

And why can't you write a udev rule for this?

> The options seem to be:
> 1) fix at kernel usb discovery

Not going to change :)

> 2) somehow fix in the ALSA library (snd_*)
> 3) fix in Wine (mmsys.drv / winealsa.drv/mmdevdrv.c
> 4) somewhere else?

Why not trigger off of the topology of the USB device?  That's what
tools do today for multiple devices of the same exact type, which is
really common.  All of that can be done in userspace, with a udev rule,
or a script that is run when accessing a USB device by querying where in
the USB physical tree it is located.

> And, we need to do this in a supportable fashion that does not break
> existing users of this subsystem.

Userspace is the key, you have control over that, so why can't it detect
this?

thanks,

greg k-h
