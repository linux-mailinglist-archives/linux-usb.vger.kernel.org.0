Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 304C338C3D
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 16:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729349AbfFGOKe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 10:10:34 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:55977 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727840AbfFGOKe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jun 2019 10:10:34 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 9DCE6620;
        Fri,  7 Jun 2019 10:10:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 07 Jun 2019 10:10:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=xAnYgbuAMFj0Fp9K735YG2C/Ud6
        R10q8pKEXU59D698=; b=Uvg6AaPNvHyOxmPTJq6GlJbf+GCqTOSaltfsWt1Sfjy
        iYXJwjsFtNknTVsB1Ef4w9Jch22XxnWBdhx2YyBtCmM09jC9pAOln4ezoPeT8Z09
        quxw3h/Nf5yMikfisCuEEIyTh5+IVDV1wdQMdXhTID9VeFvUzS5s/wABG6Rb40Os
        L4HkdoKCNKlWKcpQLy12EjjmPI/fcGjyH1mbXArhjIbC9IxG7P+JdPXr9UtUYPub
        0ItOoCxIyh0ypeJy8lesubd68dvErpURd0L8rZVoKCJXOnVxNpDIZg3dFNjJcvhM
        m0GPjXuNfGTzL3k58uYkmL04KH/9nKOjAls8IqQCyVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xAnYgb
        uAMFj0Fp9K735YG2C/Ud6R10q8pKEXU59D698=; b=tgIftbtRgQ2Va8PajRUwgJ
        C5eUN9jcCJxmiWZnJHDrQK7NNEQJ3TfGa+7+cAkRMp/Ag61uDybXWiaSYHB0J1Dt
        czUc1YlhoIk+VQMvgy/QxZ8KY5QrHFlFv5SoNPTcTKpUA/f+eGKQW+jcumApCdSB
        KO6V+p10E7LNbA3oT0cOqxjcUTHcN783JF3C8sQh5yl6ReEYvEwv8Xef8uUJe68k
        yAQt/rrfkigF0ziHB8nAo67uaeodf5XS+sCJiUIJBG+ee6wiAxKLAAfHdd4qr4te
        dCZorsF5yu4pFEw8lMeNaWjC/znw/i5y55ZXXy8OH0xJnsQPMA7otzdc8KBYwrPQ
        ==
X-ME-Sender: <xms:V3D6XAptNMBm8b5b-bb-Bt_0kYmS0XMOlsXPg_ieLoMzYPyNr6yG0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudegiedgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledrud
    dtjeenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmnecu
    vehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:V3D6XOTEW5VYKPMneZMOTKFTNu6aN5Xl3jCLwqeXkGYV15lIQA2trA>
    <xmx:V3D6XC2okNMBmwTKhsR9l6ABPS9hdnEox-64HxbirRWHZiaRshLcHg>
    <xmx:V3D6XCDHuK7tVUwKHOXC2OhxWpoTQTQFmyc2pyvWQgShIwUI8KCfjg>
    <xmx:WHD6XHJfpKQAQZ-ayP8eDvF537eUeXWgL1h7N20fl41qSbUxL18o3g>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2613F380083;
        Fri,  7 Jun 2019 10:10:31 -0400 (EDT)
Date:   Fri, 7 Jun 2019 16:10:29 +0200
From:   Greg KH <greg@kroah.com>
To:     Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
Cc:     linux-usb@vger.kernel.org, mathias.nyman@intel.com,
        rajaram.regupathy@intel.com, abhilash.k.v@intel.com,
        m.balaji@intel.com
Subject: Re: [PATCH 3/5] usb: xhci: dbc: Provide sysfs option to configure
 dbc descriptors
Message-ID: <20190607141029.GF14665@kroah.com>
References: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
 <20190607063306.5612-4-prabhat.chand.pandey@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607063306.5612-4-prabhat.chand.pandey@intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 07, 2019 at 12:03:04PM +0530, Prabhat Chand Pandey wrote:
> From: "K V, Abhilash" <abhilash.k.v@intel.com>
> 
> Show the active dbc function and dbc descriptors, allowing
> user space to dynamically modify the descriptors
> 
> The DBC specific sysfs attributes are separated into two groups,
> in the first group there are dbc & dbc_function sysfs attributes and in
> second group all other DBC descriptor specific sysfs attributes.
> 
> First group of attributes will be populated at the time of dbc_init and
> second group of attributes will only be populated when "dbc" attribute
> value is set to "enable".
> 
> Whenever "dbc" attribute value will be "disable" then second group
> of attributes will be removed.
> 
> Signed-off-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
> Signed-off-by: Gururaj K <gururaj.k@intel.com>
> Signed-off-by: K V, Abhilash <abhilash.k.v@intel.com>
> Signed-off-by: Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
> Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  .../testing/sysfs-bus-pci-drivers-xhci_hcd    | 112 ++++++
>  drivers/usb/host/xhci-dbgcap.c                | 339 ++++++++++++++++++
>  2 files changed, 451 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> index 0088aba4caa8..b46b6afc6c4a 100644
> --- a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> +++ b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> @@ -23,3 +23,115 @@ Description:
>  		Reading this attribute gives the state of the DbC. It
>  		can be one of the following states: disabled, enabled,
>  		initialized, connected, configured and stalled.
> +
> +What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_function

You are putting xhci-specific files in a pci device directory.  why not
put it in your host controller device instead?  That's the best place
for this, and what about xhci drivers that are NOT pci?

Don't abuse the pci device for things that are not pci.

> +static struct attribute *dbc_descriptor_attributes[] = {
> +	&dev_attr_dbc_manufacturer.attr,
> +	&dev_attr_dbc_product.attr,
> +	&dev_attr_dbc_serial.attr,
> +	&dev_attr_dbc_protocol.attr,
> +	&dev_attr_dbc_vid.attr,
> +	&dev_attr_dbc_pid.attr,
> +	&dev_attr_dbc_device_rev.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group dbc_descriptor_attrib_grp = {
> +	.attrs = dbc_descriptor_attributes,
> +};

ATTRIBUTE_GROUPS()?

> +
>  static ssize_t dbc_store(struct device *dev,
>  			 struct device_attribute *attr,
>  			 const char *buf, size_t count)
> @@ -938,6 +1270,10 @@ static ssize_t dbc_store(struct device *dev,
>  			goto err;
>  		}
>  		xhci_dbc_start(xhci);
> +		ret = sysfs_create_group(&dev->kobj,
> +					 &dbc_descriptor_attrib_grp);

If you EVER have to make a sysfs call within a driver, that is a HUGE
red flag that you are doing something wrong.

You are doing something wrong here, you just raced with userspace and
created a bunch of new files that userspace will not see.

Please do this correctly by setting the default device group for the
driver.

> +		if (ret)
> +			goto err;
>  	} else if (!strncmp(buf, "disable", 7) && dbc->state != DS_DISABLED) {
>  		if (!dbc_registered_func)
>  			return -EINVAL;
> @@ -945,6 +1281,7 @@ static ssize_t dbc_store(struct device *dev,
>  		if (dbc_registered_func->stop)
>  			dbc_registered_func->stop(dbc);
>  		module_put(dbc_registered_func->owner);
> +		sysfs_remove_group(&dev->kobj, &dbc_descriptor_attrib_grp);

Same here.

And does this really remove the files for when the PCI device is removed
from the system?  Or the driver from the device?  It doesn't seem like
it, but I might be missing a codepath here...

thanks,

greg k-h
