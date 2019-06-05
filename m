Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1396D359C5
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 11:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbfFEJlW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 05:41:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:46710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726690AbfFEJlV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jun 2019 05:41:21 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8EE82075C;
        Wed,  5 Jun 2019 09:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559727680;
        bh=tXrGqUaQKHyhNXKd74KtHi4wl0aXhkbM/QVI8uzhELU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PB6XzbOdijPuvNM9u9QIGq4Vw419iARqkFdtX8upEGF9iyxgPMjJQgslMbUZOsUMT
         W957kwwWJGJstQDe6muNKJnJYehASsurvGRJ+Tyw8VbzDWeWDe31NQ3ztc9SnfNprm
         9WR5VzbJ55vCxBwaWO/GH8XQDJT0nTft1pkj8sdk=
Date:   Wed, 5 Jun 2019 11:41:17 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
Cc:     linux-usb@vger.kernel.org, patches@opensource.cirrus.com,
        stern@rowland.harvard.edu, oneukum@suse.com
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
Message-ID: <20190605094117.GA24282@kroah.com>
References: <1557482469-6834-1-git-send-email-mkulkarni@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557482469-6834-1-git-send-email-mkulkarni@opensource.cirrus.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 10, 2019 at 11:01:09AM +0100, Mayuresh Kulkarni wrote:
> - The current driver increments the PM ref-count in its .open
> API and decrements it in its .close API.
> - Due to this, it is not possible for the usb_device to go into
> suspend (L2) even if all of its interfaces report idle to usb-core.
> - In order to allow the suspend, 2 new ioctls are added:
> 1. USBDEVFS_SUSPEND: calls auto-suspend and indicates to usb/pm core
> to attempt suspend, if appropriate. This is a non-blocking call.
> 2. USBDEVFS_WAIT_RESUME: waits for resume. This is a blocking call.
> The resume could happen due to:
> host-wake (i.e.: any driver bound to interface(s) of device wants to
> send/receive control/data)
> OR
> remote-wake (i.e.: when remote-wake enabled device generates a
> remote-wake to host).
> In both these conditions, this call will return.
> - It is expected that:
> 1. When user-space thinks the device is idle from its point-of-view,
> it calls USBDEVFS_SUSPEND.
> 2. After USBDEVFS_WAIT_RESUME call returns,
> the callers queries the device/interface of its interest to see
> what caused resume and take appropriate action on it.

I'm going to make a bunch of random comments on this patch, some
cosmetic...

First off, the above is horrible to try to read, please format things in
a sane way such that we can understand it well.

> The link to relevant discussion about this patch on linux-usb is -
> https://www.spinics.net/lists/linux-usb/msg173285.html

You should not need to reference any external web site for a changelog
entry, just put the needed information in the changelog itself.

> Signed-off-by: Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
> ---
>  drivers/usb/core/devio.c          | 114 ++++++++++++++++++++++++++++++++++++--
>  include/uapi/linux/usbdevice_fs.h |   2 +
>  2 files changed, 112 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index fa783531..67dc326 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -68,6 +68,9 @@ struct usb_dev_state {
>  	u32 disabled_bulk_eps;
>  	bool privileges_dropped;
>  	unsigned long interface_allowed_mask;
> +	bool runtime_active;
> +	bool is_suspended;
> +	wait_queue_head_t wait_resume;

That's some crazy alignment issues, please don't waste bytes for no good
reason.

And can you document these fields somewhere?


>  };
>  
>  struct usb_memory {
> @@ -444,6 +447,23 @@ static struct async *async_getpending(struct usb_dev_state *ps,
>  	return NULL;
>  }
>  
> +static int async_getpending_count(struct usb_dev_state *ps)
> +{
> +	struct async *as;
> +	int count;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ps->lock, flags);
> +	if (list_empty(&ps->async_pending))
> +		count = 0;
> +	else
> +		list_for_each_entry(as, &ps->async_pending, asynclist)
> +			count++;

Doesn't list_for_each_entry() work just fine on an empty list?  Just set
count to 0 up above, right?

> +	spin_unlock_irqrestore(&ps->lock, flags);

So, right after you call this function, and drop the lock, the entries
can change, making your "count" invalid and stale.  So you can not trust
the value at all, right?

> +
> +	return count;
> +}
> +
>  static void snoop_urb(struct usb_device *udev,
>  		void __user *userurb, int pipe, unsigned length,
>  		int timeout_or_status, enum snoop_when when,
> @@ -699,16 +719,26 @@ static void driver_disconnect(struct usb_interface *intf)
>  	destroy_async_on_interface(ps, ifnum);
>  }
>  
> -/* The following routines are merely placeholders.  There is no way
> - * to inform a user task about suspend or resumes.
> - */
>  static int driver_suspend(struct usb_interface *intf, pm_message_t msg)
>  {
> +	struct usb_dev_state *ps = usb_get_intfdata(intf);
> +
> +	ps->is_suspended = true;

No locking needed?

> +	snoop(&ps->dev->dev, "driver-suspend\n");

Why?  Does anyone use the snoop api anymore?

> +
>  	return 0;
>  }
>  
>  static int driver_resume(struct usb_interface *intf)
>  {
> +	struct usb_dev_state *ps = usb_get_intfdata(intf);
> +
> +	ps->runtime_active = true;
> +	wake_up(&ps->wait_resume);
> +
> +	snoop(&ps->dev->dev, "driver-resume: runtime-active = %d\n",
> +		ps->runtime_active);

What does runtime_active give userspace here?  Again, who is using
snoop?  And isn't runtime_active a bool?  It's always going to be "true"
here.  Is this just debugging code left in?

> +
>  	return 0;
>  }
>  
> @@ -718,6 +748,7 @@ struct usb_driver usbfs_driver = {
>  	.disconnect =	driver_disconnect,
>  	.suspend =	driver_suspend,
>  	.resume =	driver_resume,
> +	.supports_autosuspend = 1,
>  };
>  
>  static int claimintf(struct usb_dev_state *ps, unsigned int ifnum)
> @@ -963,6 +994,27 @@ static struct usb_device *usbdev_lookup_by_devt(dev_t devt)
>  	return to_usb_device(dev);
>  }
>  
> +/* must be called with usb-dev lock held */
> +static int usbdev_do_resume(struct usb_dev_state *ps)
> +{
> +	int ret = 0;
> +
> +	if (!ps->runtime_active) {
> +		snoop(&ps->dev->dev, "suspended..resume now\n");

Again snoop?

> +		ps->is_suspended = false;
> +		if (usb_autoresume_device(ps->dev)) {
> +			ret = -EIO;
> +			goto _out;
> +		}
> +		snoop(&ps->dev->dev, "resume done..active now\n");
> +		ps->runtime_active = true;
> +		wake_up(&ps->wait_resume);

No locking at all?

> +	}
> +
> +_out:

Why is this even needed, just return -EIO above and all is good.

But again, is any locking needed here?


> +	return ret;
> +}
> +
>  /*
>   * file operations
>   */
> @@ -1008,6 +1060,9 @@ static int usbdev_open(struct inode *inode, struct file *file)
>  	INIT_LIST_HEAD(&ps->async_completed);
>  	INIT_LIST_HEAD(&ps->memory_list);
>  	init_waitqueue_head(&ps->wait);
> +	init_waitqueue_head(&ps->wait_resume);
> +	ps->runtime_active = true;
> +	ps->is_suspended = false;
>  	ps->disc_pid = get_pid(task_pid(current));
>  	ps->cred = get_current_cred();
>  	smp_wmb();
> @@ -1034,6 +1089,10 @@ static int usbdev_release(struct inode *inode, struct file *file)
>  	struct async *as;
>  
>  	usb_lock_device(dev);
> +
> +	/* what can we can do if resume fails? */

You tell me!

> +	usbdev_do_resume(ps);
> +
>  	usb_hub_release_all_ports(dev, ps);
>  
>  	list_del_init(&ps->list);
> @@ -2355,6 +2414,18 @@ static int proc_drop_privileges(struct usb_dev_state *ps, void __user *arg)
>  	return 0;
>  }
>  
> +static int proc_wait_resume(struct usb_dev_state *ps)
> +{
> +	int ret;
> +
> +	snoop(&ps->dev->dev, "wait-for-resume\n");
> +	ret = wait_event_interruptible(ps->wait_resume,
> +		(ps->runtime_active == true));
> +	snoop(&ps->dev->dev, "wait-for-resume...done\n");

This is just debugging code, right?  Please remove.

> +
> +	return ret;
> +}
> +
>  /*
>   * NOTE:  All requests here that have interface numbers as parameters
>   * are assuming that somehow the configuration has been prevented from
> @@ -2373,6 +2444,25 @@ static long usbdev_do_ioctl(struct file *file, unsigned int cmd,
>  
>  	usb_lock_device(dev);
>  
> +	if (cmd != USBDEVFS_WAIT_RESUME) {
> +		ret = usbdev_do_resume(ps);

do resume for all ioctl commands?  are you sure?

> +		if (ret)
> +			goto done;
> +	} else {
> +		usb_unlock_device(dev);
> +		ret = proc_wait_resume(ps);
> +
> +		/* Call auto-resume to balance auto-suspend of suspend-ioctl */
> +		usb_lock_device(dev);
> +		if (ps->is_suspended) {
> +			ret = usb_autoresume_device(ps->dev);
> +			ps->is_suspended = false;
> +		}
> +		usb_unlock_device(dev);
> +
> +		goto _done;

What is the difference between _done and done?  Please have descriptive
labels if you are going to have any at all.

Why isn't this part of the switch statement below?

> +	}
> +
>  	/* Reap operations are allowed even after disconnection */
>  	switch (cmd) {
>  	case USBDEVFS_REAPURB:
> @@ -2549,10 +2639,26 @@ static long usbdev_do_ioctl(struct file *file, unsigned int cmd,
>  	case USBDEVFS_GET_SPEED:
>  		ret = ps->dev->speed;
>  		break;
> +	case USBDEVFS_SUSPEND:
> +		ret = 0;
> +
> +		/* we cannot suspend when URB is pending */
> +		if (async_getpending_count(ps)) {
> +			snoop(&ps->dev->dev, "ioctl-suspend but URB pending\n");

You do not know this, your value is stale :(

And again, you are using snoop() calls for debugging, not for actual USB
traffic, which is what it was designed for.  These all need to be
removed/rewritten.

> +			ret = -EINVAL;
> +		} else {
> +			if (ps->runtime_active) {
> +				snoop(&ps->dev->dev, "ioctl-suspend\n");
> +				ps->runtime_active = false;
> +				usb_autosuspend_device(ps->dev);
> +			}
> +		}
> +		break;
>  	}
>  
> - done:
> +done:
>  	usb_unlock_device(dev);
> +_done:

See, horrid names :(

>  	if (ret >= 0)
>  		inode->i_atime = current_time(inode);
>  	return ret;
> diff --git a/include/uapi/linux/usbdevice_fs.h b/include/uapi/linux/usbdevice_fs.h
> index 964e872..ae46beb 100644
> --- a/include/uapi/linux/usbdevice_fs.h
> +++ b/include/uapi/linux/usbdevice_fs.h
> @@ -197,5 +197,7 @@ struct usbdevfs_streams {
>  #define USBDEVFS_FREE_STREAMS      _IOR('U', 29, struct usbdevfs_streams)
>  #define USBDEVFS_DROP_PRIVILEGES   _IOW('U', 30, __u32)
>  #define USBDEVFS_GET_SPEED         _IO('U', 31)
> +#define USBDEVFS_SUSPEND           _IO('U', 32)
> +#define USBDEVFS_WAIT_RESUME       _IO('U', 33)

No documentation for what these do?

thanks,

greg k-h
