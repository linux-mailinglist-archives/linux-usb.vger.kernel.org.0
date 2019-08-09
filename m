Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A27B87589
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 11:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405964AbfHIJSE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 05:18:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:44930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727063AbfHIJSE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Aug 2019 05:18:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE81C21882;
        Fri,  9 Aug 2019 09:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565342283;
        bh=k35+4suczSKeSDG6TKpUbwUFlEXa+fQwwumKg9mmHuI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hnuTbLBm0xTGvy+CxNgaBIUvsNgoVpsB66wmkZfV2sf5372NfwCO3gUYBBHO4aTWp
         9DuxOAhzHWw08SbsD6w7UGde/21BkTqpqyB4Ogv28EoI+qY4NYW+0/aJZYejCju5f2
         x+wzkTZnS/X8OHyuXEHFu0MlZK6EdAQp1Eu6Pg00=
Date:   Fri, 9 Aug 2019 09:55:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Andrey Konovalov <andreyknvl@google.com>,
        Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Hillf Danton <hdanton@sina.com>
Subject: Re: KASAN: use-after-free Read in usbhid_power
Message-ID: <20190809075555.GA20409@kroah.com>
References: <CAAeHK+wb8=Z65_1CGcj0ShT6+NiQSDKhEkBVx+8vPe3kJF8+6g@mail.gmail.com>
 <Pine.LNX.4.44L0.1908081522290.1319-100000@iolanthe.rowland.org>
 <caf422aebd314ab8a5dd96ac2d9bb198@SVR-IES-MBX-03.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caf422aebd314ab8a5dd96ac2d9bb198@SVR-IES-MBX-03.mgc.mentorg.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 09, 2019 at 07:35:32AM +0000, Schmid, Carsten wrote:
> Hi all having use-after-free issues in USB shutdowns:
> I hunted for a similar case in the intel_xhci_usb_sw driver.
> What i have found and proposed is (from yesterday):
> ---
> [PATCH] kernel/resource.c: invalidate parent when freed resource has childs
> 
> When a resource is freed and has children, the childrens are
> left without any hint that their parent is no more valid.
> This caused at least one use-after-free in the xhci-hcd using
> ext-caps driver when platform code released platform devices.
> 
> Fix this by setting child's parent to zero and warn.
> 
> Signed-off-by: Carsten Schmid <carsten_schmid@mentor.com>
> ---
> Rationale:
> When hunting for the root cause of a crash on a 4.14.86 kernel, i
> have found the root cause and checked it being still present
> upstream. Our case:
> Having xhci-hcd and intel_xhci_usb_sw active we can see in
> /proc/meminfo: (exceirpt)
>   b3c00000-b3c0ffff : 0000:00:15.0
>     b3c00000-b3c0ffff : xhci-hcd
>       b3c08070-b3c0846f : intel_xhci_usb_sw
> intel_xhci_usb_sw being a child of xhci-hcd.
> 
> Doing an unbind command
> echo 0000:00:15.0 > /sys/bus/pci/drivers/xhci_hcd/unbind
> leads to xhci-hcd being freed in __release_region.
> The intel_xhci_usb_sw resource is accessed in platform code
> in platform_device_del with
>                 for (i = 0; i < pdev->num_resources; i++) {
>                         struct resource *r = &pdev->resource[i];
>                         if (r->parent)
>                                 release_resource(r);
>                 }
> as the resource's parent has not been updated, the release_resource
> uses the parent:
>         p = &old->parent->child;
> which is now invalid.
> Fix this by marking the parent invalid in the child and give a warning
> in dmesg.
> ---
>  kernel/resource.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/kernel/resource.c b/kernel/resource.c
> index 158f04ec1d4f..95340cb0b1c2 100644
> --- a/kernel/resource.c
> +++ b/kernel/resource.c
> @@ -1200,6 +1200,15 @@ void __release_region(struct resource *parent, resource_size_t start,
>                         write_unlock(&resource_lock);
>                         if (res->flags & IORESOURCE_MUXED)
>                                 wake_up(&muxed_resource_wait);
> +
> +                       write_lock(&resource_lock);

Nit, should't this be written so that you only drop/get the lock if the
above if statement is true?

> +                       if (res->child) {
> +                               printk(KERN_WARNING "__release_region: %s has child %s,"
> +                                               "invalidating childs parent\n",
> +                                               res->name, res->child->name);

What can userspace/anyone do about this if it triggers?

Can't we fix the root problem in the xhci driver to properly order how
it tears things down?  If it has intel_xhci_usb_driver as a "child"
shouldn't that be unbound/freed before the parent is?

thanks,

greg k-h
