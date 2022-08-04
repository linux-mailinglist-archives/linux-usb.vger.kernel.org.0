Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E869658A12F
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 21:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239937AbiHDT0H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 15:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239881AbiHDT0C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 15:26:02 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 668CE6D9ED
        for <linux-usb@vger.kernel.org>; Thu,  4 Aug 2022 12:26:00 -0700 (PDT)
Received: (qmail 675004 invoked by uid 1000); 4 Aug 2022 15:25:59 -0400
Date:   Thu, 4 Aug 2022 15:25:59 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Subject: Re: [RFC v2 1/2] USB: core: add a way to revoke access to open USB
 devices
Message-ID: <YuwdR19MtO+xzJjk@rowland.harvard.edu>
References: <20220804160306.134014-1-hadess@hadess.net>
 <20220804160306.134014-2-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804160306.134014-2-hadess@hadess.net>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 04, 2022 at 06:03:05PM +0200, Bastien Nocera wrote:
> There is a need for userspace applications to open USB devices directly,
> for all the USB devices without a kernel-level class driver[1], and
> implemented in user-space.
> 
> As not all devices are built equal, we want to be able to revoke
> access to those devices whether it's because the user isn't at the
> console anymore, or because the web browser, or sandbox doesn't want
> to allow access to that device.
> 
> This commit implements the internal API used to revoke access to USB
> devices, given either bus and device numbers, or/and a user's
> effective UID.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> 
> [1]:
> Non exhaustive list of devices and device types that need raw USB access:
> - all manners of single-board computers and programmable chips and
> devices (avrdude, STLink, sunxi bootloader, flashrom, etc.)
> - 3D printers
> - scanners
> - LCD "displays"
> - user-space webcam and still cameras
> - game controllers
> - video/audio capture devices
> - sensors
> - software-defined radios
> - DJ/music equipment
> - protocol analysers
> - Rio 500 music player
> ---
>  drivers/usb/core/devio.c | 105 ++++++++++++++++++++++++++++++++++++---
>  drivers/usb/core/usb.h   |   8 +++
>  2 files changed, 107 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index b5b85bf80329..a87fed12e307 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -78,6 +78,7 @@ struct usb_dev_state {
>  	int not_yet_resumed;
>  	bool suspend_allowed;
>  	bool privileges_dropped;
> +	bool revoked;
>  };

Have you considered what should happen if two processes share the same 
file descriptor (and hence the same usb_dev_state structure) and you want 
to revoke access for one of the processes but not the other?

>  struct usb_memory {
> @@ -237,6 +238,13 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
>  	dma_addr_t dma_handle;
>  	int ret;
>  
> +	usb_lock_device(ps->dev);
> +	if (!connected(ps) || ps->revoked) {
> +		usb_unlock_device(ps->dev);
> +		return -ENODEV;
> +	}
> +	usb_unlock_device(ps->dev);

I'm not certain this check is needed at all.  But if you want to add it, 
I don't see any reason for grab the lock.

Also, here and in all the other places, instead of manually adding "|| 
ps_revoked" to all the "!connected(ps)" checks, why not just change the 
definition of connected(ps)?

> +
>  	ret = usbfs_increase_memory_usage(size + sizeof(struct usb_memory));
>  	if (ret)
>  		goto error;
> @@ -298,6 +306,15 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
>  	return ret;
>  }
>  
> +static loff_t usbdev_llseek(struct file *file, loff_t offset, int whence)
> +{
> +	struct usb_dev_state *ps = file->private_data;
> +
> +	if (!connected(ps) || ps->revoked)
> +		return -ENODEV;

Like the case above, this check is not present in the current code so 
it's not clear why it needs to be added now.

> +	return no_seek_end_llseek(file, offset, whence);
> +}
> +
>  static ssize_t usbdev_read(struct file *file, char __user *buf, size_t nbytes,
>  			   loff_t *ppos)
>  {
> @@ -310,7 +327,7 @@ static ssize_t usbdev_read(struct file *file, char __user *buf, size_t nbytes,
>  
>  	pos = *ppos;
>  	usb_lock_device(dev);
> -	if (!connected(ps)) {
> +	if (!connected(ps) || ps->revoked) {
>  		ret = -ENODEV;
>  		goto err;
>  	} else if (pos < 0) {
> @@ -2117,7 +2134,7 @@ static int proc_reapurbnonblock(struct usb_dev_state *ps, void __user *arg)
>  		retval = processcompl(as, (void __user * __user *)arg);
>  		free_async(as);
>  	} else {
> -		retval = (connected(ps) ? -EAGAIN : -ENODEV);
> +		retval = (connected(ps) && !ps->revoked ? -EAGAIN : -ENODEV);
>  	}
>  	return retval;
>  }
> @@ -2262,7 +2279,7 @@ static int proc_reapurbnonblock_compat(struct usb_dev_state *ps, void __user *ar
>  		retval = processcompl_compat(as, (void __user * __user *)arg);
>  		free_async(as);
>  	} else {
> -		retval = (connected(ps) ? -EAGAIN : -ENODEV);
> +		retval = (connected(ps) && !ps->revoked ? -EAGAIN : -ENODEV);
>  	}
>  	return retval;
>  }
> @@ -2580,6 +2597,82 @@ static int proc_wait_for_resume(struct usb_dev_state *ps)
>  	return proc_forbid_suspend(ps);
>  }
>  
> +static int usbdev_revoke(struct usb_dev_state *ps)
> +{
> +	struct usb_device *dev = ps->dev;
> +	unsigned int ifnum;
> +	struct async *as;
> +
> +	if (ps->revoked) {
> +		usb_unlock_device(dev);
> +		return -ENODEV;
> +	}
> +	ps->revoked = true;
> +
> +	for (ifnum = 0; ps->ifclaimed && ifnum < 8*sizeof(ps->ifclaimed);
> +			ifnum++) {
> +		if (test_bit(ifnum, &ps->ifclaimed))
> +			releaseintf(ps, ifnum);
> +	}
> +	destroy_all_async(ps);
> +
> +	as = async_getcompleted(ps);
> +	while (as) {
> +		free_async(as);
> +		as = async_getcompleted(ps);
> +	}
> +
> +	wake_up(&ps->wait);
> +
> +	snoop(&dev->dev, "%s: REVOKE by PID %d: %s\n", __func__,
> +	      task_pid_nr(current), current->comm);

I would put this snoop call before all the other activities, so that any 
debugging output they generate will come after the REVOKE entry in the 
kernel log.

> +
> +	return 0;
> +}
> +
> +int usb_revoke(struct usb_device *udev,
> +		struct usb_revoke_match *match)
> +{
> +	struct usb_dev_state *ps;
> +	int ret = -ENOENT;
> +
> +	usb_lock_device(udev);
> +
> +	if (match->devnum >= 0 &&
> +	    match->busnum >= 0) {
> +		int devnum, busnum;
> +
> +		devnum = udev->devnum;
> +		busnum = udev->bus->busnum;
> +		if (match->busnum != busnum ||
> +		    match->devnum != devnum) {
> +			ret = -ENODEV;
> +			goto out;
> +		}
> +	}

I have the feeling that this part of the function (matching the busnum 
and devnum values) doesn't belong here but rather with the iteration 
routines in your 2/2 patch.  Filtering of devices generally is done as 
part of the iteration.  As an added bonus, doing it that way means you 
don't need to pass around pointers to usb_revoke_match structures.

> +
> +	list_for_each_entry(ps, &udev->filelist, list) {
> +		if (match->euid >= 0) {
> +			kuid_t kuid;
> +
> +			if (!ps || !ps->cred)
> +				continue;
> +			kuid = ps->cred->euid;
> +			if (kuid.val != match->euid)
> +				continue;
> +		}
> +
> +		if (ret == 0)
> +			usbdev_revoke(ps);
> +		else
> +			ret = usbdev_revoke(ps);

You probably don't need this elaborate handling of return codes.  In 
fact, you probably don't need either of these functions to return 
anything.

Alan Stern

> +	}
> +
> +out:
> +	usb_unlock_device(udev);
> +	return ret;
> +}
> +
>  /*
>   * NOTE:  All requests here that have interface numbers as parameters
>   * are assuming that somehow the configuration has been prevented from
> @@ -2623,7 +2716,7 @@ static long usbdev_do_ioctl(struct file *file, unsigned int cmd,
>  #endif
>  	}
>  
> -	if (!connected(ps)) {
> +	if (!connected(ps) || ps->revoked) {
>  		usb_unlock_device(dev);
>  		return -ENODEV;
>  	}
> @@ -2819,7 +2912,7 @@ static __poll_t usbdev_poll(struct file *file,
>  	poll_wait(file, &ps->wait, wait);
>  	if (file->f_mode & FMODE_WRITE && !list_empty(&ps->async_completed))
>  		mask |= EPOLLOUT | EPOLLWRNORM;
> -	if (!connected(ps))
> +	if (!connected(ps) || ps->revoked)
>  		mask |= EPOLLHUP;
>  	if (list_empty(&ps->list))
>  		mask |= EPOLLERR;
> @@ -2828,7 +2921,7 @@ static __poll_t usbdev_poll(struct file *file,
>  
>  const struct file_operations usbdev_file_operations = {
>  	.owner =	  THIS_MODULE,
> -	.llseek =	  no_seek_end_llseek,
> +	.llseek =	  usbdev_llseek,
>  	.read =		  usbdev_read,
>  	.poll =		  usbdev_poll,
>  	.unlocked_ioctl = usbdev_ioctl,
> diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
> index 82538daac8b8..b12c352869f0 100644
> --- a/drivers/usb/core/usb.h
> +++ b/drivers/usb/core/usb.h
> @@ -9,6 +9,11 @@
>  struct usb_hub_descriptor;
>  struct usb_dev_state;
>  
> +struct usb_revoke_match {
> +	int busnum, devnum; /* -1 to match all devices */
> +	int euid; /* -1 to match all users */
> +};
> +
>  /* Functions local to drivers/usb/core/ */
>  
>  extern int usb_create_sysfs_dev_files(struct usb_device *dev);
> @@ -34,6 +39,9 @@ extern int usb_deauthorize_device(struct usb_device *);
>  extern int usb_authorize_device(struct usb_device *);
>  extern void usb_deauthorize_interface(struct usb_interface *);
>  extern void usb_authorize_interface(struct usb_interface *);
> +extern int usb_revoke(struct usb_device *udev,
> +		struct usb_revoke_match *match);
> +extern int usbdev_get_uid(struct usb_dev_state *ps);
>  extern void usb_detect_quirks(struct usb_device *udev);
>  extern void usb_detect_interface_quirks(struct usb_device *udev);
>  extern void usb_release_quirk_list(void);
> -- 
> 2.36.1
> 
