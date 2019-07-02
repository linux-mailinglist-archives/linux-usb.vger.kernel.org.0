Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADD185C87B
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 06:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbfGBEmx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 00:42:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:48056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725648AbfGBEmw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 00:42:52 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5B129208C4;
        Tue,  2 Jul 2019 04:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562042571;
        bh=Wmp1sX+7ESLyi8An6+jdjKMshTYfEOXQrPFhE9L9QBo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BRtCNkd0D5syEpOlgf1u83N5EwHFk8IYhO2L6gaToHQvuwPMko1iqqRfge4CsKZGY
         VR+YF+BEzE4oD9gfHppEdxN7I/ZSde87N5ZERi+MvI5oHRUrBjHMkwsz6RtxEstDd+
         dDbJN0zgMBSQWumGAQAcjqrjdzBE/2tda6flNCIs=
Date:   Tue, 2 Jul 2019 06:42:49 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        usb-storage@lists.one-eyed-alien.net, oneukum@suse.com
Subject: Re: [PATCH] usb: storage: skip only when uas driver is loaded
Message-ID: <20190702044249.GA694@kroah.com>
References: <20190701084848.32502-1-jckuo@nvidia.com>
 <20190701085248.GA28681@kroah.com>
 <8e8e8703-8620-b625-4917-bbb8d999caa4@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e8e8703-8620-b625-4917-bbb8d999caa4@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 02, 2019 at 10:36:59AM +0800, JC Kuo wrote:
> On 7/1/19 4:52 PM, Greg KH wrote:
> > On Mon, Jul 01, 2019 at 04:48:48PM +0800, JC Kuo wrote:
> >> When usb-storage driver detects a UAS capable device, it ignores the
> >> device if CONFIG_USB_UAS is enabled. usb-storage driver assumes uas
> >> driver certainly will be loaded. However, it's possible that uas
> >> driver will not be loaded, for example, uas kernel module is not
> >> installed properly or it is in modprobe blacklist.
> >>
> >> In case of uas driver not being loaded, the UAS capable device will
> >> not fallback to work at Bulk-only-transfer mode. The device just
> >> disappears without any notification to user/userspace.
> >>
> >> This commit changes usb-storage driver to skip UAS capable device
> >> only when uas driver is already loaded to make sure the device will
> >> at least work with Bulk protocol.
> > 
> > But what happens if the driver is loaded afterward, because 'modprobe'
> > was called by the driver core (or it should have been, because this is a
> > device that supports that protocol)?
> If uas driver is loaded after usb-storage driver probed the device,
> the device will still work with Bulk-only protocol, though it can't
> make uses of streams.

Which is not a good thing, and is what the original code was there to
prevent happening.

> > I think you just broke working systems :(
> > 
> > Why wouldn't the UAS driver get loaded automatically if it is configured
> > in the system as it is today?
> An user might want to completely disable uas for some reason so he/she
> adds "blacklist uas" to modprobe conf file. I think in case of this,
> usb-storage driver has to enable this device with the legacy Bulk-only
> protocol instead of ignoring the device.

Why would they want to do that?  Where are people doing this in ways
that breaks their systems?

> As an alternative to this patch, I thought I could get uas driver
> loaded before usb-storage driver so I tried moving the functions in
> drivers/usb/storage/uas-detect.h into uas.c and letting usb-storage
> links uas_use_uas_driver() of uas.ko. However, that didn't work
> because uas driver actually depends on usb-storage driver for
> usb_stor_adjust_quirks(). There will be a recursive dependency.
> 
> Please let me know if there is better approach to avoid the issue.

If users blacklist the uas driver, that's their choice and they should
rebuild their kernel :)

Or better yet, talk to us to get the issue fixed for why they would want
to blacklist such a driver.

As it is, this patch is not acceptable.

thanks,

greg k-h
