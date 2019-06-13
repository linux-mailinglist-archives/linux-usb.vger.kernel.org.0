Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8FF6438B5
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2019 17:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732855AbfFMPHp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jun 2019 11:07:45 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:42478 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732387AbfFMOBO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jun 2019 10:01:14 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5DDoP6f020568;
        Thu, 13 Jun 2019 09:00:38 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=mkulkarni@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2t09ep7fpv-1;
        Thu, 13 Jun 2019 09:00:32 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail2.cirrus.com (Postfix) with ESMTP id 64FA2605A697;
        Thu, 13 Jun 2019 09:00:32 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 13 Jun
 2019 15:00:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 13 Jun 2019 15:00:31 +0100
Received: from mkulkarni-laptop.ad.cirrus.com (mkulkarni-laptop.ad.cirrus.com [198.90.199.28])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5E05645;
        Thu, 13 Jun 2019 15:00:31 +0100 (BST)
Message-ID: <1560434431.11184.13.camel@opensource.cirrus.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
From:   Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg KH <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <oneukum@suse.com>
Date:   Thu, 13 Jun 2019 15:00:31 +0100
In-Reply-To: <Pine.LNX.4.44L0.1906051655310.1788-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906051655310.1788-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906130106
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2019-06-05 at 17:02 -0400, Alan Stern wrote:
> On Wed, 5 Jun 2019, Greg KH wrote:
> 
> > 
> > On Fri, May 10, 2019 at 11:01:09AM +0100, Mayuresh Kulkarni wrote:
> > > 
> > > - The current driver increments the PM ref-count in its .open
> > > API and decrements it in its .close API.
> > > - Due to this, it is not possible for the usb_device to go into
> > > suspend (L2) even if all of its interfaces report idle to usb-core.
> > > - In order to allow the suspend, 2 new ioctls are added:
> > > 1. USBDEVFS_SUSPEND: calls auto-suspend and indicates to usb/pm core
> > > to attempt suspend, if appropriate. This is a non-blocking call.
> > > 2. USBDEVFS_WAIT_RESUME: waits for resume. This is a blocking call.
> > > The resume could happen due to:
> > > host-wake (i.e.: any driver bound to interface(s) of device wants to
> > > send/receive control/data)
> > > OR
> > > remote-wake (i.e.: when remote-wake enabled device generates a
> > > remote-wake to host).
> > > In both these conditions, this call will return.
> > > - It is expected that:
> > > 1. When user-space thinks the device is idle from its point-of-view,
> > > it calls USBDEVFS_SUSPEND.
> > > 2. After USBDEVFS_WAIT_RESUME call returns,
> > > the callers queries the device/interface of its interest to see
> > > what caused resume and take appropriate action on it.
> > I'm going to make a bunch of random comments on this patch, some
> > cosmetic...
> > 
> > First off, the above is horrible to try to read, please format things in
> > a sane way such that we can understand it well.
> > 
> > > 
> > > The link to relevant discussion about this patch on linux-usb is -
> > > https://www.spinics.net/lists/linux-usb/msg173285.html
> > You should not need to reference any external web site for a changelog
> > entry, just put the needed information in the changelog itself.
> > 
> > > 
> > > Signed-off-by: Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
> Mayuresh:
> 
> I'm sorry; I completely lost sight of this patch (distracted by too 
> many other things).
> 

Hi Alan,

Thanks for your review and apologies for late response from me. I was on PTO last week and then in a training this week.

> Aside from the issues Greg raised, it isn't right because it relies on 
> the suspend and resume callbacks for individual interfaces, not for the 
> whole device.  There are a few other things that should be changed as 
> well.

In our use-case, we open the USB device with our VID/PID and then using that fd
we bind to our interface. So this approach probably worked for our use-case.

> Below is my attempt at doing the same thing (not tested, and it doesn't
> answer all of Greg's objections).  It is very similar to your patch.  
> Does it work for your application?
> 

I am checking your code-changes and will get back to you on this by next week.

> (Note: I imagine you might run into trouble because devices generally 
> do not get put into runtime suspend immediately.  So if you call the 
> USBDEVFS_SUSPEND ioctl and then the USBDEVFS_WAIT_FOR_RESUME ioctl, the 
> wait will return immediately because the device hasn't yet been 
> suspended.)
> 

For this point, I am suggesting below -
How about we return "udev->dev.power.usage_count" from suspend ioctl?
count = 0 -> suspend success so good to call wait-for-resume ioctl
count != 0 -> don't call resume since suspend did not happen.

Will that work?

> Alan Stern
> 
> 
>  drivers/usb/core/devio.c          |   66 +++++++++++++++++++++++++++++++++++-
> --
>  drivers/usb/core/generic.c        |    5 ++
>  drivers/usb/core/usb.h            |    3 +
>  include/uapi/linux/usbdevice_fs.h |    2 +
>  4 files changed, 72 insertions(+), 4 deletions(-)
> 
> Index: usb-devel/drivers/usb/core/devio.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/devio.c
> +++ usb-devel/drivers/usb/core/devio.c
> @@ -60,14 +60,17 @@ struct usb_dev_state {
>  	struct list_head async_completed;
>  	struct list_head memory_list;
>  	wait_queue_head_t wait;     /* wake up if a request completed */
> +	wait_queue_head_t wait_for_resume;   /* wake up upon runtime resume
> */
>  	unsigned int discsignr;
>  	struct pid *disc_pid;
>  	const struct cred *cred;
>  	void __user *disccontext;
>  	unsigned long ifclaimed;
>  	u32 disabled_bulk_eps;
> -	bool privileges_dropped;
>  	unsigned long interface_allowed_mask;
> +	bool privileges_dropped;
> +	bool is_suspended;
> +	bool suspend_requested;
>  };
>  
>  struct usb_memory {
> @@ -699,9 +702,7 @@ static void driver_disconnect(struct usb
>  	destroy_async_on_interface(ps, ifnum);
>  }
>  
> -/* The following routines are merely placeholders.  There is no way
> - * to inform a user task about suspend or resumes.
> - */
> +/* We don't care about suspend/resume of claimed interfaces */
>  static int driver_suspend(struct usb_interface *intf, pm_message_t msg)
>  {
>  	return 0;
> @@ -712,12 +713,32 @@ static int driver_resume(struct usb_inte
>  	return 0;
>  }
>  
> +/* The following routines apply to the entire device, not interfaces */
> +void usbfs_notify_suspend(struct usb_device *udev)
> +{
> +	struct usb_dev_state *ps;
> +
> +	list_for_each_entry(ps, &udev->filelist, list)
> +		ps->is_suspended = true;
> +}
> +
> +void usbfs_notify_resume(struct usb_device *udev)
> +{
> +	struct usb_dev_state *ps;
> +
> +	list_for_each_entry(ps, &udev->filelist, list) {
> +		ps->is_suspended = false;
> +		wake_up_all(&ps->wait_for_resume);
> +	}
> +}
> +
>  struct usb_driver usbfs_driver = {
>  	.name =		"usbfs",
>  	.probe =	driver_probe,
>  	.disconnect =	driver_disconnect,
>  	.suspend =	driver_suspend,
>  	.resume =	driver_resume,
> +	.supports_autosuspend = 1,
>  };
>  
>  static int claimintf(struct usb_dev_state *ps, unsigned int ifnum)
> @@ -1008,6 +1029,7 @@ static int usbdev_open(struct inode *ino
>  	INIT_LIST_HEAD(&ps->async_completed);
>  	INIT_LIST_HEAD(&ps->memory_list);
>  	init_waitqueue_head(&ps->wait);
> +	init_waitqueue_head(&ps->wait_for_resume);
>  	ps->disc_pid = get_pid(task_pid(current));
>  	ps->cred = get_current_cred();
>  	smp_wmb();
> @@ -1034,6 +1056,8 @@ static int usbdev_release(struct inode *
>  	struct async *as;
>  
>  	usb_lock_device(dev);
> +	if (ps->suspend_requested)
> +		usb_autoresume_device(dev);
>  	usb_hub_release_all_ports(dev, ps);
>  
>  	list_del_init(&ps->list);
> @@ -2355,6 +2379,17 @@ static int proc_drop_privileges(struct u
>  	return 0;
>  }
>  
> +static int proc_wait_for_resume(struct usb_dev_state *ps)
> +{
> +	int ret;
> +
> +	usb_unlock_device(ps->dev);
> +	ret = wait_event_interruptible(ps->wait_for_resume, !ps-
> >is_suspended);
> +	usb_lock_device(ps->dev);
> +
> +	return ret;
> +}
> +
>  /*
>   * NOTE:  All requests here that have interface numbers as parameters
>   * are assuming that somehow the configuration has been prevented from
> @@ -2373,6 +2408,17 @@ static long usbdev_do_ioctl(struct file
>  
>  	usb_lock_device(dev);
>  
> +	/* Almost all operations require the device to be runtime-active */
> +	if (cmd != USBDEVFS_SUSPEND && cmd != USBDEVFS_WAIT_FOR_RESUME &&
> +			ps->suspend_requested) {
> +		if (usb_autoresume_device(dev) == 0) {
> +			ps->suspend_requested = false;
> +		} else {
> +			ret = -EIO;
> +			goto done;
> +		}
> +	}
> +
>  	/* Reap operations are allowed even after disconnection */
>  	switch (cmd) {
>  	case USBDEVFS_REAPURB:
> @@ -2549,6 +2595,16 @@ static long usbdev_do_ioctl(struct file
>  	case USBDEVFS_GET_SPEED:
>  		ret = ps->dev->speed;
>  		break;
> +	case USBDEVFS_SUSPEND:
> +		if (!ps->suspend_requested) {
> +			usb_autosuspend_device(dev);
> +			ps->suspend_requested = true;
> +		}
> +		ret = 0;
> +		break;
> +	case USBDEVFS_WAIT_FOR_RESUME:
> +		ret = proc_wait_for_resume(ps);
> +		break;
>  	}
>  
>   done:
> @@ -2620,6 +2676,8 @@ static void usbdev_remove(struct usb_dev
>  		ps = list_entry(udev->filelist.next, struct usb_dev_state,
> list);
>  		destroy_all_async(ps);
>  		wake_up_all(&ps->wait);
> +		ps->is_suspended = false;
> +		wake_up_all(&ps->wait_for_resume);
>  		list_del_init(&ps->list);
>  		if (ps->discsignr) {
>  			clear_siginfo(&sinfo);
> Index: usb-devel/drivers/usb/core/generic.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/generic.c
> +++ usb-devel/drivers/usb/core/generic.c
> @@ -257,6 +257,8 @@ static int generic_suspend(struct usb_de
>  	else
>  		rc = usb_port_suspend(udev, msg);
>  
> +	if (rc == 0)
> +		usbfs_notify_suspend(udev);
>  	return rc;
>  }
>  
> @@ -273,6 +275,9 @@ static int generic_resume(struct usb_dev
>  		rc = hcd_bus_resume(udev, msg);
>  	else
>  		rc = usb_port_resume(udev, msg);
> +
> +	if (rc == 0)
> +		usbfs_notify_resume(udev);
>  	return rc;
>  }
>  
> Index: usb-devel/drivers/usb/core/usb.h
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/usb.h
> +++ usb-devel/drivers/usb/core/usb.h
> @@ -95,6 +95,9 @@ extern int usb_runtime_idle(struct devic
>  extern int usb_enable_usb2_hardware_lpm(struct usb_device *udev);
>  extern int usb_disable_usb2_hardware_lpm(struct usb_device *udev);
>  
> +extern void usbfs_notify_suspend(struct usb_device *udev);
> +extern void usbfs_notify_resume(struct usb_device *udev);
> +
>  #else
>  
>  static inline int usb_port_suspend(struct usb_device *udev, pm_message_t msg)
> Index: usb-devel/include/uapi/linux/usbdevice_fs.h
> ===================================================================
> --- usb-devel.orig/include/uapi/linux/usbdevice_fs.h
> +++ usb-devel/include/uapi/linux/usbdevice_fs.h
> @@ -197,5 +197,7 @@ struct usbdevfs_streams {
>  #define USBDEVFS_FREE_STREAMS      _IOR('U', 29, struct usbdevfs_streams)
>  #define USBDEVFS_DROP_PRIVILEGES   _IOW('U', 30, __u32)
>  #define USBDEVFS_GET_SPEED         _IO('U', 31)
> +#define USBDEVFS_SUSPEND           _IO('U', 32)
> +#define USBDEVFS_WAIT_FOR_RESUME   _IO('U', 33)
>  
>  #endif /* _UAPI_LINUX_USBDEVICE_FS_H */
> 
