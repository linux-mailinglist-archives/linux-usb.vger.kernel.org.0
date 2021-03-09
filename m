Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 676FD332835
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 15:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbhCIOKa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 09:10:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:60196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230118AbhCIOKD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Mar 2021 09:10:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2614965238;
        Tue,  9 Mar 2021 14:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615299002;
        bh=UPqzRTV5icLwa9ePe4g5RGs0CdVyltXNU7Ph2eBJ5U0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZgfMcddxxwtIrDc4E17eT1Z7KNvrrLVVm0tPLHGvgpaRTSyKDehnPjYzoApDfx3/G
         BQOdx+APLBgNpUk8JCjfCDB/MpD/Snpzq6OrKJkBc+IqvUvORt4UrW/XfpEHHwcGbM
         e8JuTS415jWw78bxEs4Fp7c6SpEr3XzQd9a88gFU=
Date:   Tue, 9 Mar 2021 15:09:59 +0100
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
Subject: Re: [PATCH 3/3] thunderbolt: Expose more details about USB 3.x and
 DisplayPort tunnels
Message-ID: <YEeBt+fHt1MdyEBz@kroah.com>
References: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
 <20210309134818.63118-4-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309134818.63118-4-mika.westerberg@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 09, 2021 at 04:48:18PM +0300, Mika Westerberg wrote:
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
>  .../ABI/testing/sysfs-bus-thunderbolt         | 26 ++++++++++
>  drivers/thunderbolt/domain.c                  | 10 ++++
>  drivers/thunderbolt/switch.c                  | 41 ++++++++++++++++
>  drivers/thunderbolt/tb.c                      | 49 ++++++++++++++-----
>  drivers/thunderbolt/tb.h                      |  4 ++
>  include/linux/thunderbolt.h                   |  6 +++
>  6 files changed, 125 insertions(+), 11 deletions(-)
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
> index a7d83eec3d15..3a1fb7a39f90 100644
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

sysfs_emit() please.  For all of these attributes.


> +}
> +static DEVICE_ATTR_RO(tunneling_details);
> +
>  static struct attribute *domain_attrs[] = {
>  	&dev_attr_boot_acl.attr,
>  	&dev_attr_deauthorization.attr,
>  	&dev_attr_iommu_dma_protection.attr,
>  	&dev_attr_security.attr,
> +	&dev_attr_tunneling_details.attr,
>  	NULL,
>  };
>  
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index e73cd296db7e..b72589eabf0c 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -1487,6 +1487,21 @@ device_name_show(struct device *dev, struct device_attribute *attr, char *buf)
>  }
>  static DEVICE_ATTR_RO(device_name);
>  
> +static ssize_t dp_show(struct device *dev, struct device_attribute *attr,
> +		       char *buf)
> +{
> +	struct tb_switch *sw = tb_to_switch(dev);
> +	int ret;
> +
> +	if (!mutex_trylock(&sw->tb->lock))
> +		return restart_syscall();

Huh?  Why?

> +	ret = sprintf(buf, "%u\n", sw->dp);
> +	mutex_unlock(&sw->tb->lock);

Why is the lock needed?  It's an attribute, can it change quickly?  Can
it change at all?  What happens if it changes _right_ after you read the
value?  What happens?

I don't think you need locking here, do you?

> +
> +	return ret;
> +}
> +static DEVICE_ATTR_RO(dp);
> +
>  static ssize_t
>  generation_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
> @@ -1693,6 +1708,21 @@ static ssize_t nvm_version_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(nvm_version);
>  
> +static ssize_t usb3_show(struct device *dev, struct device_attribute *attr,
> +			 char *buf)
> +{
> +	struct tb_switch *sw = tb_to_switch(dev);
> +	int ret;
> +
> +	if (!mutex_trylock(&sw->tb->lock))
> +		return restart_syscall();

Same here for locking comment.

> +	ret = sprintf(buf, "%u\n", sw->usb3);
> +	mutex_unlock(&sw->tb->lock);
> +
> +	return ret;
> +}
> +static DEVICE_ATTR_RO(usb3);
> +
>  static ssize_t vendor_show(struct device *dev, struct device_attribute *attr,
>  			   char *buf)
>  {
> @@ -1725,6 +1755,7 @@ static struct attribute *switch_attrs[] = {
>  	&dev_attr_boot.attr,
>  	&dev_attr_device.attr,
>  	&dev_attr_device_name.attr,
> +	&dev_attr_dp.attr,
>  	&dev_attr_generation.attr,
>  	&dev_attr_key.attr,
>  	&dev_attr_nvm_authenticate.attr,
> @@ -1734,6 +1765,7 @@ static struct attribute *switch_attrs[] = {
>  	&dev_attr_rx_lanes.attr,
>  	&dev_attr_tx_speed.attr,
>  	&dev_attr_tx_lanes.attr,
> +	&dev_attr_usb3.attr,
>  	&dev_attr_vendor.attr,
>  	&dev_attr_vendor_name.attr,
>  	&dev_attr_unique_id.attr,
> @@ -1757,6 +1789,7 @@ static umode_t switch_attr_is_visible(struct kobject *kobj,
>  {
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct tb_switch *sw = tb_to_switch(dev);
> +	const struct tb *tb = sw->tb;
>  
>  	if (attr == &dev_attr_authorized.attr) {
>  		if (sw->tb->security_level == TB_SECURITY_NOPCIE ||
> @@ -1769,6 +1802,10 @@ static umode_t switch_attr_is_visible(struct kobject *kobj,
>  	} else if (attr == &dev_attr_device_name.attr) {
>  		if (!sw->device_name)
>  			return 0;
> +	} else if (attr == &dev_attr_dp.attr) {
> +		if (!(tb->cm_caps & TB_CAP_TUNNEL_DETAILS) ||
> +		    !has_port(sw, TB_TYPE_DP_HDMI_OUT))
> +			return 0;
>  	} else if (attr == &dev_attr_vendor.attr)  {
>  		if (!sw->vendor)
>  			return 0;
> @@ -1788,6 +1825,10 @@ static umode_t switch_attr_is_visible(struct kobject *kobj,
>  		if (tb_route(sw))
>  			return attr->mode;
>  		return 0;
> +	} else if (attr == &dev_attr_usb3.attr) {
> +		if (!(tb->cm_caps & TB_CAP_TUNNEL_DETAILS) ||
> +		    !has_port(sw, TB_TYPE_USB3_UP))
> +			return 0;
>  	} else if (attr == &dev_attr_nvm_authenticate.attr) {
>  		if (nvm_upgradeable(sw))
>  			return attr->mode;
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 7e6dc2b03bed..32b79dce134f 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -104,10 +104,39 @@ static void tb_remove_dp_resources(struct tb_switch *sw)
>  	}
>  }
>  
> +static void tb_add_tunnel(struct tb *tb, struct tb_tunnel *tunnel)
> +{
> +	struct tb_switch *sw = tunnel->dst_port->sw;
> +	struct tb_cm *tcm = tb_priv(tb);
> +
> +	if (tb_tunnel_is_usb3(tunnel)) {
> +		sw->usb3++;
> +	} else if (tb_tunnel_is_dp(tunnel)) {
> +		sw->dp++;
> +		/* Inform userspace about DP tunneling change */
> +		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);

What really "changed" here about this device that userspace now needs to
know about it?


> +	}
> +
> +	list_add_tail(&tunnel->list, &tcm->tunnel_list);
> +}
> +
> +static void tb_remove_tunnel(struct tb_tunnel *tunnel)
> +{
> +	struct tb_switch *sw = tunnel->dst_port->sw;
> +
> +	if (tb_tunnel_is_usb3(tunnel) && sw->usb3) {
> +		sw->usb3--;
> +	} else if (tb_tunnel_is_dp(tunnel) && sw->dp) {
> +		sw->dp--;
> +		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);

Same here, what causes tunnels to be added or removed?

thanks,

greg k-h
