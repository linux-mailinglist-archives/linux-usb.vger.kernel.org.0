Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D910526D3F3
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 08:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgIQGux (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 02:50:53 -0400
Received: from forward1-smtp.messagingengine.com ([66.111.4.223]:42207 "EHLO
        forward1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726106AbgIQGus (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 02:50:48 -0400
X-Greylist: delayed 574 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 02:50:47 EDT
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailforward.nyi.internal (Postfix) with ESMTP id 6826319413AB;
        Thu, 17 Sep 2020 02:41:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 17 Sep 2020 02:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=SpMrt8
        Cv2dgWwH5+Ti/tgpGpm4GUdFZSeUucCaVp9tw=; b=er0H7CWNNTpMNTNv2Wy15U
        /uMSNMSTT0BhAq/miiY+xWsY2eNTemJkymmfAsDgvWs3os88Ls/RK9XZxjvZ/ws/
        2gek78dJJIz9cIH4NiJmWfwJtIxqWa81rnTnFPz/PTfAocJWCp04/6jt8/e0uKX6
        maAaRHf4Tp/DYyW1uF3nDWuHhA2bbMcK2E2cc7YVkhVuNt5LZPzWcdVi1G9rrS5k
        2QzMfjmhCQ7cSBB6uizVHgjATFpU1jHJTTL7SMudH+g2r1kQ1WCLnmE1lEwnuPu8
        P5Ak75hqx6hJzQQuME0EtcBYGAQF+bYpUK32kqxcTdolBJPQ1OJUQoyKsn9N8/Tw
        ==
X-ME-Sender: <xms:CAVjX8hTvvvxpOEiBCPPUFfgVGFb4fk7p5EjNgBMJgss82SIKu0qlQ>
    <xme:CAVjX1B4pSOvzv0MQ9qZ9QM0YfrHh3mTkBZ-LEegds8lw8byjF8QcliFATZ-pOek5
    37wOGAY9kMIOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdefgdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgmffjsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgqeenucggtf
    frrghtthgvrhhnpeetvdelgeffgfdutdelvddvtdetffejtefgveevueeggfellefhveev
    feduueduvdenucfkphepkeefrdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:CAVjX0FyrBgbcF-qu36vsNoCT66vHiMfXOi4WcfOAFygV6A-Tkax5w>
    <xmx:CAVjX9R34mbHHWhEvIo_9e3ViVCWlsjJ8dg_yp0lk1P2PlQ-dk4tRA>
    <xmx:CAVjX5xBydEYruUoOGfKUHRzzsafPOpM598admDjREjZUMt3_UE-JQ>
    <xmx:CAVjX3Y241O-MyWnykZZDhFjqgZzeyLo93zxfZHa1bvTE60ljGWMMg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id DA9853064685;
        Thu, 17 Sep 2020 02:41:11 -0400 (EDT)
Date:   Thu, 17 Sep 2020 08:41:45 +0200
From:   Greg KH <gregKH@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org, stern@rowland.harvard.edu
Subject: Re: [PATCHv2] base: force NOIO allocations during unplug
Message-ID: <20200917064145.GA3194762@kroah.com>
References: <20200916191544.5104-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916191544.5104-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 16, 2020 at 09:15:44PM +0200, Oliver Neukum wrote:
> There is one overlooked situation under which a driver
> must not do IO to allocate memory. You cannot do that
> while disconnecting a device. A device being disconnected
> is no longer functional in most cases, yet IO may fail
> only when the handler runs.
> 
> v2: extended section for NOIO until after second notifier chain
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/base/core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index bb5806a2bd4c..b79783454293 100644
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
> @@ -3114,6 +3117,7 @@ void device_del(struct device *dev)
>  	glue_dir = get_glue_dir(dev);
>  	kobject_del(&dev->kobj);
>  	cleanup_glue_dir(dev, glue_dir);
> +	memalloc_noio_restore(noio_flag);
>  	put_device(parent);
>  }
>  EXPORT_SYMBOL_GPL(device_del);
> -- 
> 2.16.4
> 

Thanks, now queued up.

greg k-h
