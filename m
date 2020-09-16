Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFB2D26CBCE
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 22:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgIPUfQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 16:35:16 -0400
Received: from forward1-smtp.messagingengine.com ([66.111.4.223]:44489 "EHLO
        forward1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726885AbgIPRK5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Sep 2020 13:10:57 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailforward.nyi.internal (Postfix) with ESMTP id DDD741940C9B;
        Wed, 16 Sep 2020 11:24:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 16 Sep 2020 11:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=HN8qKO
        wB+t8DL49LcVLpo1otYPRmS/hrPL8n5jdfGD0=; b=pEXX1g2upe6I5VYMHwVLGb
        FbwksNJbc+HTYrAt008MWVc9DaEj2N8r67LJKTncyAUneWwXt7XYHAwnJhq26hV7
        hUXEImI2T491yZp2bAHoxVY06mZzCfb7Zq2U4vzvCDDVktZG88Udy9xDq1nlFU0d
        1Z4PbS4QG8pNJJSOHqOqatoFaECL/Zh87zMW4FVXGMbHhbr3Ryo2uhEB7X0aXMXH
        +xWuyXSTcLN/CfRjHX4WnLf6XgbhDwwyFtisu+k3AFE2B1ERHXO1Ray6sSnjkHBk
        EoJDgNXwBFUOASVbZkdQl1lcPEISY0G243CWKIWg+sFqDIVYQ9D7jf+197bY0cjw
        ==
X-ME-Sender: <xms:QS5iXzRRv353yNIXVkxgIz6pYp4EIy1YzUz5bWwK0kwssjz6SVRG4Q>
    <xme:QS5iX0xnUBZytdF1vSupd-f_olB6KCgsYyJOH5iQczCIpWOozeAnQfjIYNVLtR0Jo
    Noie1Y3KS_LnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtddvgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvghfmjfeslhhinhhugihfohhunhgurghtihhonhdrohhrgheqnecuggftrf
    grthhtvghrnheptedvleegfffguddtledvvddtteffjeetgfevveeugefgleelhfevveef
    udeuuddvnecukfhppeekfedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:QS5iX42betYAJoiuia6yjnISi6R5rvYcnA2nNPvy7lk9wKubhx1hwg>
    <xmx:QS5iXzBV1GpK4no-UXHj9LHwmAqPtnSCbSeJ9_sC0yVIrwHI6TVOfg>
    <xmx:QS5iX8gpdaVE_wFv53Gv5vfg40cfHQ4Uvv0Xmo0eOxSd5KixzU8Zow>
    <xmx:QS5iX0K9GAOLUNeHYycMW3dRf69QN0D34Ab7XL7IPx8cWofPzvRU_g>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4CD2A3280066;
        Wed, 16 Sep 2020 11:24:49 -0400 (EDT)
Date:   Wed, 16 Sep 2020 17:25:16 +0200
From:   Greg KH <gregKH@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.de>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: memory allocations dring device removal
Message-ID: <20200916152516.GC3018065@kroah.com>
References: <1600266411.2424.32.camel@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600266411.2424.32.camel@suse.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 16, 2020 at 04:26:51PM +0200, Oliver Neukum wrote:
> Hi,
> 
> I am cleaning up house, electronically speaking.
> Reading the thread about the keyboard with the storage device
> reminded me about a potential issue. What happens if you
> allocate memory during disconnect()?

Does any driver do that today?

If so, I think we might have seen issues there already, but perhaps not,
it's a tricky codepath...

> If the storage device is second, the storage driver will
> still be bound and the SCSI device will still exist. The
> kernel may use it to launder pages. This will fail, as the
> device is physically gone. So can we deadlock?

The notifier callback worries me, who knows what can happen on that code
path.  So yes, I think your patch might be needed :(


> 
> Is this patch necessary?
> 
> 	Regards
> 		Oliver
> 
> >From 97b7e91af588b7489795e3eaf773be032bc91b70 Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Tue, 28 May 2019 11:43:02 +0200
> Subject: [PATCH] base: force NOIO allocations during unplug
> 
> There is one overlooked situation under which a driver
> must not do IO to allocate memory. You cannot do that
> while disconnecting a device. A device being disconnected
> is no longer functional in most cases, yet IO may fail
> only when the handler runs.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/base/core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index bb5806a2bd4c..509306a4ea89 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -26,6 +26,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/netdevice.h>
>  #include <linux/sched/signal.h>
> +#include <linux/sched/mm.h>
>  #include <linux/sysfs.h>
>  
>  #include "base.h"
> @@ -3062,6 +3063,7 @@ void device_del(struct device *dev)
>  	struct device *parent = dev->parent;
>  	struct kobject *glue_dir = NULL;
>  	struct class_interface *class_intf;
> +	unsigned int noio_flag;
>  
>  	device_lock(dev);
>  	kill_device(dev);
> @@ -3073,6 +3075,7 @@ void device_del(struct device *dev)
>  	/* Notify clients of device removal.  This call must come
>  	 * before dpm_sysfs_remove().
>  	 */
> +	noio_flag = memalloc_noio_save();
>  	if (dev->bus)
>  		blocking_notifier_call_chain(&dev->bus->p->bus_notifier,
>  					     BUS_NOTIFY_DEL_DEVICE, dev);
> @@ -3106,6 +3109,7 @@ void device_del(struct device *dev)
>  	device_platform_notify(dev, KOBJ_REMOVE);
>  	device_remove_properties(dev);
>  	device_links_purge(dev);
> +	memalloc_noio_restore(noio_flag);
>  
>  	if (dev->bus)
>  		blocking_notifier_call_chain(&dev->bus->p->bus_notifier,

Can you move memalloc_noio_restore() down below here, odds are it should
just go after the last put_device(parent) to be safe.

thanks,

greg k-h
