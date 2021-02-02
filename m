Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9D2730B9FE
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 09:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbhBBIdN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 03:33:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:37530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232728AbhBBIcq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Feb 2021 03:32:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A7F764DA5;
        Tue,  2 Feb 2021 08:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612254725;
        bh=1uyTvcbLDGMGSM0vlefyg16XQREFPdHBDTAy83bODaM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SB6V1rPSj1G2U6h4uo/P1o/ykCtRmO71fHEJPuO3O5qIaJrx0ES9ir2yqqHXZUtyH
         bhdu7XYIj6hkqvcLpGkAbaLMOLTs9c7CfoISpsgg/zY+gEOgrpf9AXcIgPLtbKHEvX
         6DIWydEbTAUvdIWfeUh1Qz15NIYDZ7iOiPO/YbFEcOA84zeHocKYj1UeqYKuQkcm6q
         e9tcctcj+x1vxZmc046phayXxc1XMv/n/4xiAvA67yUU48tE3uL0VtSgR+/VV6uZso
         V1o90rLPgMFKjkUjje/1/sGl/sVP3RYiIjMI32d+HTd4iMUytPpZyxcGSb4zXsfy3n
         ni213cwxUciLg==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l6r6e-0007Fo-Gq; Tue, 02 Feb 2021 09:32:17 +0100
Date:   Tue, 2 Feb 2021 09:32:16 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Tung Pham <Tung.Pham@silabs.com>
Cc:     Hung Nguyen <Hung.Nguyen@silabs.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Pho Tran <Pho.Tran@silabs.com>
Subject: Re: Bugs: usb serial crash when close second comport
Message-ID: <YBkOEHM8/VfK5Gc+@hovoldconsulting.com>
References: <PU1PR06MB2117988A6B7680CA1806DBE091B69@PU1PR06MB2117.apcprd06.prod.outlook.com>
 <CO1PR11MB48828958BDC51E796D37D63F81B69@CO1PR11MB4882.namprd11.prod.outlook.com>
 <YBfVqOwEZfkvX7YA@hovoldconsulting.com>
 <CO1PR11MB48821E7544DCB4E06665849481B59@CO1PR11MB4882.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB48821E7544DCB4E06665849481B59@CO1PR11MB4882.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 02, 2021 at 03:50:50AM +0000, Tung Pham wrote:

> > Can you reproduce this with a mainline kernel?
> > 
> > Otherwise, you may need to bring this up with Ubuntu.
> 
> this bug doesn't occur on Ubuntu running on pc, it only occur on
> raspberry.

I understand, but if you can only reproduce this using a Ubuntu kernel
on the RPi it could be to something that they've put in their kernel's
(e.g. some out-of-tree driver) which doesn't exist in mainline. That's
why you need to be able to reproduce it on a mainline kernel.

> One additional thing: the bug doesn't occur with HUB: Orico, model
> W6ph4-u3-v1, Manufacture: VIA Labs, inc.
> It only occur with hub: HB-UM43 hub, Genesys Logic, Inc.

Ok, so depending on if the kernel crashes or not, it could still be a
bug in the hub firmware.

> > This sounds like you could have a problem with the host-controller
> > driver. What controller is the RPi4 using?
>  
> For the Pi 4, a fully-featured host controller drives the downstream
> USB ports. Downstream USB is provided by a Via Labs VL805 chip - that
> supports two USB 2.0 ports and two USB 3.0 ports

Which driver does it use? I believe some of the earlier RPi used an
out-of-tree host-controller driver, but perhaps that's no longer the
case.

> > As you write above, the usb_serial_generic_close() is needed to
> > cancel the outstanding URBs during close so you can't remove that.
> > 
> > But my guess is that something breaks in the HCD when unlinking
> > those URBs when connected through the hub. Do you have a stack trace
> > from an oops? Or do things just lock up?
>
> I don't know how to capture stack trace?

If the kernel oopses/crashes (e.g. due to a bug in the driver) you
should find a stack trace in the kernel log (e.g. run dmesg).

But if the USB bus just locks up (until you disconnect the hub or
device, or reload the USB serial driver), then this could also be a
firmware bug in the host-controller or hub.

Johan
