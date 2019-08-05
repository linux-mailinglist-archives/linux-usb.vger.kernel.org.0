Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F07F817CB
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 13:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbfHELD5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 07:03:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:38702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727259AbfHELD4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Aug 2019 07:03:56 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 44E9720880;
        Mon,  5 Aug 2019 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565003035;
        bh=CibEku2s/JfcNr0S1FiQC7iDt4ERU6S6wHuC/JXH7uA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O2IdpbKdw0r5D6aJdKiHTOaZNfPowQs68JTCSsdK5FtDRsnf3b2WwGVWeyu+VR4Az
         gN0nYqK51l84B9RzPZFNPrdoMbIS0bhQ3mtgcPu14cGzAP19nkUazNDC9OpQVoF9dX
         m+ihzNxOc0Z2KS5Vf8MUFQG1zq7Vo8aRfne4cSCE=
Date:   Mon, 5 Aug 2019 13:03:53 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     =?iso-8859-1?Q?Thi=E9baud?= Weksteen <tweek@google.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Race condition when accessing authorized_default for a root hub
Message-ID: <20190805110353.GD1157@kroah.com>
References: <CA+zpnLehOG=agTtLkVZte-WJRpPwnGOvazum-o-=gLisSbe67A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+zpnLehOG=agTtLkVZte-WJRpPwnGOvazum-o-=gLisSbe67A@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 05, 2019 at 12:29:27PM +0200, Thiébaud Weksteen wrote:
> Hi,
> 
> I believe there is a race condition for userland in hcd.c where the
> kernel sends a uevent before the underlying sysfs is fully populated:
> 
> (drivers/usb/core/hcd.c)
>           /* starting here, usbcore will pay attention to this root hub */
>           retval = register_root_hub(hcd);
>           if (retval != 0)
>                   goto err_register_root_hub;
>           [...]
>           retval = sysfs_create_group(&rhdev->dev.kobj, &usb_bus_attr_group);
>           if (retval < 0) {
>                   printk(KERN_ERR "Cannot register USB bus sysfs
> attributes: %d\n",
>                          retval);
>                   goto error_create_attr_group;
>           }
> 
> Here, register_root_hub will call kobject_uevent(&dev->kobj, KOBJ_ADD)
> (via usb_new_device and device_add). This was found in userland (see
> https://github.com/USBGuard/usbguard/issues/321).
> 
> The fix is not as simple as swapping both blocks (that is, calling
> sysfs_create_group before register_root_hub) as device_add is
> responsible for calling kobject_add and kobject_uevent.
> 
> This can potentially be solved by adding the sysfs_create_group call
> to the bus_notifier list (blocking). Thoughts?

Yes, this type of race condition is _ALL_ over the kernel tree.  I am
working on solving these with the addition of the dev_groups pointer to
struct driver that went into linux-next last week.  I have a series of
patches I'm working on for all USB drivers to take advantage of this and
will post them later this week when they are done.

Ideally no driver should ever call sysfs_create_group(s) on their own,
their "parent" code should be the one doing it (either in the driver
core, or in the bus specific code.)  But, this one is a bit tricker as
root hubs are a bit different.  I'll add this to my list to fix up,
unless you want to send a patch earlier?

And as I said above, this is a well-known, and very old issue.  If you
are relying on sysfs attributes to always be present when KOBJ_ADD is
called, you _will_ race with the kernel at the moment.  Hopefully these
can all be fixed up so that next year you will not have to worry about
this :)

thanks,

greg k-h
