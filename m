Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFFF42AF84E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 19:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgKKSjz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 13:39:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:58830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726460AbgKKSjz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Nov 2020 13:39:55 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6AA53205CB;
        Wed, 11 Nov 2020 18:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605119994;
        bh=mg4cq31o364PM/T1bGsNiqiKct0gxyb09dZfWAc1ugs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ANE84NR5QxXniFgpTUCLO7LzZtSzrUWjSJt0nRyNrmFx3ovA7qo2/X41acx4ErBkN
         pxNLy+O7B01h4oeJzQFjhtxAxGhK1EYOcBoV9k4N/LxslRada+zHL8qiiq7lWXU0ye
         e1/waJlnczzTVZd3xFgfBCBHP58jMgJuQefLXVOc=
Date:   Wed, 11 Nov 2020 19:40:54 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] usb: gadget: User space URBs for FunctionFS
Message-ID: <X6wwNo5ZYYugyHu7@kroah.com>
References: <20201111170718.3381-1-ingo.rohloff@lauterbach.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111170718.3381-1-ingo.rohloff@lauterbach.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 11, 2020 at 06:07:16PM +0100, Ingo Rohloff wrote:
> I am working on a platform (Xilinx Zynq Ultrascale+), which
> is supposed to work as a pure USB Device (not dual-role).
> 
> To get fast USB bulk transfers I wanted to have something similar
> like USBDEVFS_SUBMITURB/USBDEVFS_REAPURB, but for an USB Device.
> 
> I now implement two new ioctls for FunctionFS:
>   FUNCTIONFS_SUBMITBULKURB
>   FUNCTIONFS_REAPBULKURB
> which provide simliar functionality.
> 
> A similar functionality is already implemented via AIO. But: To use this
> API, your user space environment needs to know how to use these system
> calls.

So instead you created a new interface which requires different system
calls?

Doing it in a different way is "interesting", but you are duplicating
existing functionality here.  What is wrong with the AIO interface that
we currently have that keeps you from using it, other than it being
"different" than some other user/kernel interfaces that people are
familiar with?

> Additionally the semantics of the ioctls is slightly different:
> Usually you can only access a FunctionFS file if the FunctionFS is
> already bound to an UDC (USB Device Controller) and the USB Device is
> connected to a USB Host (which then enables the appropriate configuration
> and USB endpoints).
> These new ioctls behave different: You already can submit URBs before the
> Function is bound to an UDC and before the USB Device is connected.
> These "pending" URBs will be activated once the endpoints become active.
> 
> When the endpoints become deactivated (either by a disconnect from the
> USB Host or by unbinding the UDC), active URBs are cancelled.
> 
> A user space program will then get a notification, that the URBs have
> been cancelled and the status will indicate to the user space program,
> that the connection was lost.
> Via this mechanism a user space program can keep precise track, which
> URBs succeeded and which URBs failed.

So, it implements AIO in a different way?

> The final goal here is to be able to directly let user space provide data
> buffers (via mmap I guess), which are then transferred via USB; but this
> is the next step.

Isn't that kind of what the AIO inteface provides today?  :)

thanks,

greg k-h
