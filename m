Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDEE229738
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 13:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726941AbgGVLN7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 07:13:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:35252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726028AbgGVLN7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jul 2020 07:13:59 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1EAA7207CD;
        Wed, 22 Jul 2020 11:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595416438;
        bh=Vc/Dp55RwvxiJrMacEMsB1swnTr3sOi8WCoFa6p7Ok8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QvGMuEhLUpQKr8j1ay7tPcZVH8KhEJ9HGQ1P3ZwU8K8Z43wiHh1hITUxlqGoLesRR
         gldxh5e6atxe08nyuryijYbClinwLhPBjlx2zrAVv31Xi21xbp7fyRD+w19w5SmZY0
         qnReQtkGgRsVgmOR+WxU3+IVd0l4Yml98xP4hiU0=
Date:   Wed, 22 Jul 2020 13:12:33 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/2] USB: Fix device driver race
Message-ID: <20200722111233.GA2912795@kroah.com>
References: <20200722094628.4236-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722094628.4236-1-hadess@hadess.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 22, 2020 at 11:46:27AM +0200, Bastien Nocera wrote:
> When a new device with a specialised device driver is plugged in, the
> new driver will be modprobe()'d but the driver core will attach the
> "generic" driver to the device.
> 
> After that, nothing will trigger a reprobe when the modprobe()'d device
> driver has finished initialising, as the device has the "generic"
> driver attached to it.
> 
> Trigger a reprobe ourselves when new specialised drivers get registered.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---

What commit id does this fix?  And if it's in an older kernel, should it
be backported to the stable trees?

thanks,

greg k-h
