Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B55B3462C2
	for <lists+linux-usb@lfdr.de>; Tue, 23 Mar 2021 16:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232787AbhCWP0v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Mar 2021 11:26:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:46180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232538AbhCWP0g (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Mar 2021 11:26:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DC7161992;
        Tue, 23 Mar 2021 15:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616513196;
        bh=Bg5nmLqRTN6r7K5o6Hc9MDhzZ3Fzp4C87a2OvKXSAsE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PzkpQ9vYkav6ZSTYoe2y8S+wXme5IJ4GlupfZrQidP139Cxa7TVypLb1rhC0gwAn4
         ifKrcl6yIW325uKAAcHoEQ3LYebR431qe5afqjPMAomOwz0sLpRMwz9HreQ1XcqWRQ
         JIPLzTGmZj+txTwEBQBt0ItyxLpMe4uQlSCpU/XQ=
Date:   Tue, 23 Mar 2021 16:26:34 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Christian Kellner <christian@kellner.me>,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@google.com>,
        Diego Rivas <diegorivas@google.com>
Subject: Re: [PATCH v2 3/3] thunderbolt: Expose more details about USB 3.x
 and DisplayPort tunnels
Message-ID: <YFoIqi1hggi8xuYq@kroah.com>
References: <20210323145701.86161-1-mika.westerberg@linux.intel.com>
 <20210323145701.86161-4-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323145701.86161-4-mika.westerberg@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 23, 2021 at 05:57:01PM +0300, Mika Westerberg wrote:
> This exposes two new attributes under each device router: usb3 and dp
> that hold number of tunnels ending to this switch. These attributes are
> only available if the connection manager supports it (tunneling_details
> attribute reads 1). Currently only the software connection manager
> supports this.
> 
> Based on these userspace can show the user more detailed information
> what is going on.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  .../ABI/testing/sysfs-bus-thunderbolt         | 26 +++++++++++
>  drivers/thunderbolt/domain.c                  | 10 +++++
>  drivers/thunderbolt/switch.c                  | 29 ++++++++++++
>  drivers/thunderbolt/tb.c                      | 44 ++++++++++++++-----
>  drivers/thunderbolt/tb.h                      |  4 ++
>  include/linux/thunderbolt.h                   |  6 +++
>  6 files changed, 108 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-thunderbolt b/Documentation/ABI/testing/sysfs-bus-thunderbolt
> index c41c68f64693..1569be391ca6 100644
> --- a/Documentation/ABI/testing/sysfs-bus-thunderbolt
> +++ b/Documentation/ABI/testing/sysfs-bus-thunderbolt
> @@ -61,6 +61,14 @@ Description:	This attribute holds current Thunderbolt security level
>  			 the BIOS.
>  		=======  ==================================================
>  
> +What: /sys/bus/thunderbolt/devices/.../domainX/tunneling_details
> +Date:		July 2021
> +KernelVersion:	5.13
> +Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
> +Description:	The connection manager implementation may expose
> +		additional details about tunneling. If it supports this
> +		the attribute reads 1.
> +
>  What: /sys/bus/thunderbolt/devices/.../authorized
>  Date:		Sep 2017
>  KernelVersion:	4.13
> @@ -102,6 +110,15 @@ Contact:	thunderbolt-software@lists.01.org
>  Description:	This attribute contains 1 if Thunderbolt device was already
>  		authorized on boot and 0 otherwise.
>  
> +What: /sys/bus/thunderbolt/devices/.../dp
> +Date:		Jul 2021
> +KernelVersion:	5.13
> +Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
> +Description:	Only available if the domain tunneling_details attribute
> +		reads 1. If present means that the device router has
> +		DisplayPort sink. Contents will be number how many
> +		active DisplayPort tunnels end up to this router.
> +
>  What: /sys/bus/thunderbolt/devices/.../generation
>  Date:		Jan 2020
>  KernelVersion:	5.5
> @@ -169,6 +186,15 @@ Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
>  Description:	This attribute reports number of TX lanes the device is
>  		using simultaneusly through its upstream port.
>  
> +What: /sys/bus/thunderbolt/devices/.../usb3
> +Date:		Jul 2021
> +KernelVersion:	5.13
> +Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
> +Description:	Only available if the domain tunneling_details attribute
> +		reads 1. If present means that the device router has
> +		USB 3.x upstream adapter. Reads 1 if there is an active
> +		USB 3.x tunnel to this router.
> +
>  What:		/sys/bus/thunderbolt/devices/.../vendor
>  Date:		Sep 2017
>  KernelVersion:	4.13
> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> index 98f4056f89ff..d86b0864f870 100644
> --- a/drivers/thunderbolt/domain.c
> +++ b/drivers/thunderbolt/domain.c
> @@ -282,11 +282,21 @@ static ssize_t security_show(struct device *dev, struct device_attribute *attr,
>  }
>  static DEVICE_ATTR_RO(security);
>  
> +static ssize_t tunneling_details_show(struct device *dev,
> +				      struct device_attribute *attr, char *buf)
> +{
> +	const struct tb *tb = container_of(dev, struct tb, dev);
> +
> +	return sprintf(buf, "%d\n", !!(tb->cm_caps & TB_CAP_TUNNEL_DETAILS));

sysfs_emit() please.

thanks,

greg k-h
