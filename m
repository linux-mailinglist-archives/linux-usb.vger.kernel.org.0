Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C61F5CB93
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 10:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbfGBIO2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 04:14:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:34784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727735AbfGBIO1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 04:14:27 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6FFE520645;
        Tue,  2 Jul 2019 08:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562055266;
        bh=/hqUavSM9jF40GYQlnoxzOeSzhs5r4KnNGS0tgqpMmw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LY8IBqQZTRTt/uW3FLWUWwDni0+hT5KCwmSW8QMU3nrKeFHQtCL4/XBjNETj8Fye+
         Tm1JAYPU8LTyLCTKuseUqdCQ2yaAqitEvkZsga44BQM0XoR/ArXqksiv9PZqK1qRNX
         wYReplZJP1chTiDrXxc6lWY8IzzAhDd4iDc+imAs=
Date:   Tue, 2 Jul 2019 10:14:24 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        usb-storage@lists.one-eyed-alien.net, oneukum@suse.com
Subject: Re: [PATCH] usb: storage: skip only when uas driver is loaded
Message-ID: <20190702081424.GA4162@kroah.com>
References: <20190701084848.32502-1-jckuo@nvidia.com>
 <20190701085248.GA28681@kroah.com>
 <8e8e8703-8620-b625-4917-bbb8d999caa4@nvidia.com>
 <20190702044249.GA694@kroah.com>
 <f6ed2505-5da9-c217-a052-a19d197c5c8e@nvidia.com>
 <f43e7ecf-64d5-20d2-0461-85a55fa28a33@nvidia.com>
 <20190702073432.GA9265@kroah.com>
 <136cd205-6114-2be5-4244-f6689ce6bf3b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <136cd205-6114-2be5-4244-f6689ce6bf3b@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 02, 2019 at 03:57:04PM +0800, JC Kuo wrote:
> On 7/2/19 3:34 PM, Greg KH wrote:
> > 
> > Footers like this are not allowed on public mailing lists, and forbid me
> > to respond to...
> > 
> 
> Hi Greg,
> I am truly sorry for that. I have just figured out how to tell mail server
> not to add the footer. Please allow me to query again.
> 
> Since blacklisting uas kernel module is not a good idea and could break UAS 
> capable storage functionality, although user-space should be blamed for the
> improper configuration, do we consider forbidding making uas driver as
> module? That means to make CONFIG_USB_UAS a bool option.

Step back and try to describe the real problem that you are having here.

Why is the kernel responsible for fixing a broken userspace
configuration?  What UAS devices are not working with Linux that could
cause someone to want to blacklist the uas driver and who is telling
them to do that?

Also see Oliver's response.

thanks,

greg k-h
