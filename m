Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F078D5B736
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2019 10:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbfGAIww (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 04:52:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:33430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726442AbfGAIww (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Jul 2019 04:52:52 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B81AA208C4;
        Mon,  1 Jul 2019 08:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561971171;
        bh=3chGK0gprd1kh+pxU66lzTIhvo2YldKPF6w724fjlIY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K9HCOZBERRuq+R/68bB3W08jIh8ZYFcTOY9nXZBozKWQ77kLWh9n2jmHWNXH5rGDy
         WOnPxDmDLugNDjQY/f7PD/4BfoYVqyIl4pvkqFFfCVvJfmeLFg9iXJPM8+niVqz2Sh
         1b/KzukH+sHFrmNBX2Re77oz2Cw+QOJBWu6w5iZk=
Date:   Mon, 1 Jul 2019 10:52:48 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        usb-storage@lists.one-eyed-alien.net, oneukum@suse.com
Subject: Re: [PATCH] usb: storage: skip only when uas driver is loaded
Message-ID: <20190701085248.GA28681@kroah.com>
References: <20190701084848.32502-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701084848.32502-1-jckuo@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 01, 2019 at 04:48:48PM +0800, JC Kuo wrote:
> When usb-storage driver detects a UAS capable device, it ignores the
> device if CONFIG_USB_UAS is enabled. usb-storage driver assumes uas
> driver certainly will be loaded. However, it's possible that uas
> driver will not be loaded, for example, uas kernel module is not
> installed properly or it is in modprobe blacklist.
> 
> In case of uas driver not being loaded, the UAS capable device will
> not fallback to work at Bulk-only-transfer mode. The device just
> disappears without any notification to user/userspace.
> 
> This commit changes usb-storage driver to skip UAS capable device
> only when uas driver is already loaded to make sure the device will
> at least work with Bulk protocol.

But what happens if the driver is loaded afterward, because 'modprobe'
was called by the driver core (or it should have been, because this is a
device that supports that protocol)?

I think you just broke working systems :(

Why wouldn't the UAS driver get loaded automatically if it is configured
in the system as it is today?

thanks,

greg k-h
