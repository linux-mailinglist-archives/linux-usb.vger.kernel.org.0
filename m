Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 241FE3DFE03
	for <lists+linux-usb@lfdr.de>; Wed,  4 Aug 2021 11:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236554AbhHDJau (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Aug 2021 05:30:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:36522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230436AbhHDJat (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Aug 2021 05:30:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EDE360EB9;
        Wed,  4 Aug 2021 09:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628069437;
        bh=6k/6qUZbxNL5sJJJ1nd6vDOplbQyZP1eJQPT++YeUz0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tv9CAKJ5eAo2kk+pC028P1JhNxWVgdWhA5i2nGPj03OWSnHEYe1+NdJgoeKwF5EIY
         rw49tX/J4eELK7GaQCecN7QEMMvLrPIBzQMxsbIo5EnHe3RsuIjiQwWBXYcJyZsqOi
         J8inRiUbnaQzLJ9xZs+hx300TIwMVTQqMlAjX9/S91OCID4Ix5VORSQijt3vDWDVjl
         VpFRmA506myjzc+jEhfutDvf28eXw+oRljJfL339MEBhqr4DqVJiwnC3P5Yl83Zn+D
         nidh548JFFK1OS9MDQoEyN2l+X6o1rK+ZgnHNJ/vgo2dL94fVVXj3oIx9q65xclNUx
         goYsyExDhKxFQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mBDDn-0006Rh-70; Wed, 04 Aug 2021 11:29:55 +0200
Date:   Wed, 4 Aug 2021 11:29:55 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Vasily Khoruzhick <anarsoul@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Commit 8a7bf7510d1f ("USB: serial: pl2303: amend and tighten
 type detection") broke pl2303 driver for my adapter
Message-ID: <YQpeE19WIeQO2b//@hovoldconsulting.com>
References: <CA+E=qVfWm=3iJ6UR3UzeM-Se5sBjT+xx8CAM2G4bP2NxqW6itg@mail.gmail.com>
 <YQJ8rNbYhSwmZvbb@hovoldconsulting.com>
 <CA+E=qVdS+7AvRcQAioUu2BshP=ReOcrCLEHE3pmERsXJascbgA@mail.gmail.com>
 <YQPzdwYy8qxY39BW@hovoldconsulting.com>
 <CA+E=qVcLdZ=gdJa-nV42ey751Dd9gFHWya7v=-y3WejoDYkaHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+E=qVcLdZ=gdJa-nV42ey751Dd9gFHWya7v=-y3WejoDYkaHA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 03, 2021 at 11:41:33PM -0700, Vasily Khoruzhick wrote:
> On Fri, Jul 30, 2021 at 5:42 AM Johan Hovold <johan@kernel.org> wrote:
> > On Thu, Jul 29, 2021 at 10:37:00AM -0700, Vasily Khoruzhick wrote:
> > > On Thu, Jul 29, 2021 at 3:02 AM Johan Hovold <johan@kernel.org> wrote:

> > > Bus 001 Device 024: ID 067b:23c3 Prolific Technology, Inc. USB-Serial
> > > Controller
> > > Device Descriptor:
> > >   bLength                18
> > >   bDescriptorType         1
> > >   bcdUSB               2.00
> > >   bDeviceClass            0
> > >   bDeviceSubClass         0
> > >   bDeviceProtocol         0
> > >   bMaxPacketSize0        64
> > >   idVendor           0x067b Prolific Technology, Inc.
> > >   idProduct          0x23c3
> > >   bcdDevice            3.05
> >
> > Thanks. Based on the above it looks like either a TA using the default
> > GT idProduct and new subminor release number (3.05), or it's a GT with
> > an undocumented release number (the datasheet says it should be 1.00).

> > Could you try applying the patch below and check the log for that
> > pl2303_supports_hx_status() printk? If it is indeed a GT then this
> > should also make the device work again.
> 
> Thanks, with this patch it works:
> 
> [793566.912312] usb 1-1: new full-speed USB device number 43 using xhci_hcd
> [793567.053688] usb 1-1: New USB device found, idVendor=067b,
> idProduct=23c3, bcdDevice= 3.05
> [793567.053702] usb 1-1: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [793567.053708] usb 1-1: Product: USB-Serial Controller
> [793567.053712] usb 1-1: Manufacturer: Prolific Technology Inc.
> [793567.053716] usb 1-1: SerialNumber: CMA>b103Y23
> [793567.056684] pl2303 1-1:1.0: pl2303 converter detected
> [793567.056956] pl2303 1-1:1.0: pl2303_supports_hx_status - ret = -32
> [793567.057281] usb 1-1: pl2303 converter now attached to ttyUSB0
> 
> I tested it with picocom at 115200 baud.
> 
> You can have my:
> 
> Tested-by: Vasily Khoruzhick <anarsoul@gmail.com>

Thanks for testing. I'll reply with a patch to get this fixed in 5.14-rc
and backported to 5.13.

Johan
