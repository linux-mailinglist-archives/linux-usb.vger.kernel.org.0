Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1AA61BBBEA
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 13:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgD1LHO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 07:07:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:60470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgD1LHO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Apr 2020 07:07:14 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D391206F0;
        Tue, 28 Apr 2020 11:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588072033;
        bh=reBtGK4DS5N3bE52xICX/Blk9UJl3YDkbUOEjVqugGE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q3k8a2ptQ2NqKzOzxy9W3LcabrgT8jJGa4J7lUqa1h2X6XpZgUHaNP3bvWGOnelBf
         /tEM02yh70pyONsjOQFnrRwRPu1O+FA+vKh10ZAjZwswJ0XAgOjmtssR7htq9psI7b
         +j04jRkkBBF0IoF2YS+a+Y0/6yWk1Jt0QPRiV9Ko=
Date:   Tue, 28 Apr 2020 13:07:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     vladimir.stankovic@displaylink.com
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mausb-host-devel@displaylink.com
Subject: Re: [PATCH v5 3/8] usb: mausb_host: HCD initialization
Message-ID: <20200428110710.GC1145239@kroah.com>
References: <20200327152614.26833-1-vladimir.stankovic@displaylink.com>
 <20200425091954.1610-1-vladimir.stankovic@displaylink.com>
 <20200425091954.1610-4-vladimir.stankovic@displaylink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200425091954.1610-4-vladimir.stankovic@displaylink.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Apr 25, 2020 at 11:19:49AM +0200, vladimir.stankovic@displaylink.com wrote:
> +static long mausb_ioctl(struct file *file, unsigned int ioctl_func,
> +			unsigned long ioctl_buffer)
> +{
> +	return 0;
> +}
> +

Why do you have an ioctl that does nothing?  Same for the other
functions that just return "success", if you don't do anything in them,
don't declare them please.



> +int mausb_init_hcd(void)
> +{
> +	int retval;
> +
> +	retval = register_chrdev(0, DEVICE_NAME, &mausb_fops);

But you already have a chardev?  Why use another one?

I don't understand the need for these, it's not obvious at all, please
provide a lot more information on what is going on with these userspace
facing interfaces please.

thanks,

greg k-h
