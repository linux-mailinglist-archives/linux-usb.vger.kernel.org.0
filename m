Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50BB565395
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2019 11:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbfGKJQg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Jul 2019 05:16:36 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:9688 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727680AbfGKJQg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Jul 2019 05:16:36 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6B9EhMl027850;
        Thu, 11 Jul 2019 04:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=PODMain02222019;
 bh=ZA80+MU5qLVEvhNXoHLO8Moi41oac1Vfbw0DNINj1zM=;
 b=qHSOP3SO7Is74tQ17IQhnZYdfl6dCMA89P9tx3BOIFknB6sD53vmH9XCGA9lo3MgQu8n
 QuYdDi8alTc3rBowDeXlG7WCFsz6tVLX1IIMKH/wlFb+Qa6nmixP0HCPqV27jtRYx18m
 Tzi6iYwty8zH4Pe48WviLVTX7IE2AF4OBqVVKGgMEQsyw9cZFZQXXlp3wSqH0ZG4XVJX
 Ofu9sc+YJX/TOspWelubkiQymercSkGo878mMz416Dii/y73Z5/F9J8Yk3cw8nAeZJzc
 3Q7yEUZYyawIggsuh38WTWjFWNSr0iV6kSJbXmTe71tB/dUxDuIIV+uwDyUgrLj5RfrU /A== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=mkulkarni@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
        by mx0b-001ae601.pphosted.com with ESMTP id 2tjr2nyb7x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 11 Jul 2019 04:16:28 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 11 Jul
 2019 10:16:26 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 11 Jul 2019 10:16:26 +0100
Received: from mkulkarni-laptop.ad.cirrus.com (mkulkarni-laptop.ad.cirrus.com [198.90.199.28])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A092945;
        Thu, 11 Jul 2019 10:16:26 +0100 (BST)
Message-ID: <1562836586.4259.6.camel@opensource.cirrus.com>
Subject: Re: [RFC] usbfs: Add ioctls for runtime suspend and resume
From:   Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
To:     Alan Stern <stern@rowland.harvard.edu>, Greg KH <greg@kroah.com>
CC:     USB list <linux-usb@vger.kernel.org>
Date:   Thu, 11 Jul 2019 10:16:26 +0100
In-Reply-To: <Pine.LNX.4.44L0.1907051433420.1606-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1907051433420.1606-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907110110
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-07-05 at 14:51 -0400, Alan Stern wrote:
> On Wed, 3 Jul 2019, Mayuresh Kulkarni wrote:
> 
> > 
> > As you had mentioned in one of the comment before, the only addition
> > to
> > the patch I have locally is -
> > usbfs_notify_resume() has usbfs_mutex lock around list traversal.
> > 
> > Could you please send the patch for review? Please note, I think I
> > am
> > not a part of linux-usb mailing-list, so probably need to be in cc
> > to
> > get the patch email. Do let me know if something else is needed from
> > me.
> Here it is.  There are two changes from the previous version:
> 
> 1.	This is rebased on top of a separate patch which Greg has 
> 	already accepted:
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit?
> id=ffed60971f3d95923b99ea970862c6ab6a22c20f
> 
> 2.	I implemented Oliver's recommendation that the
> WAIT_FOR_RESUME
> 	ioctl should automatically do FORBID_SUSPEND before it returns, 
> 	if the return code is 0 (that is, it wasn't interrupted by a 
> 	signal).
> 

Hi Alan,

This patch looks good.
Let me know the next step(s) and if anything else is needed from me.

Thanks.

> Still to do: Write up the documentation.  In fact, the existing
> description of usbfs in Documentation/driver-api/usb/usb.rst is sadly
> out of date.  And it deserves to be split out into a separate file of
> its own -- but I'm not sure where it really belongs, considering that
> it is an API for userspace, not an internal kernel API.
> 
> Greg, suggestions?
> 
> Alan Stern
> 

A request -

I will highly appreciate if someone from Google/Android's USB team
comment on this patch. The reason being, when this is merged, I imagine
there will be suitable APIs in some future version of Google/Android's
USB manager to enable suspend/resume for apps.

Thanks.

> 
>  drivers/usb/core/devio.c          |   96
> ++++++++++++++++++++++++++++++++++++--
>  drivers/usb/core/generic.c        |    5 +
>  drivers/usb/core/usb.h            |    3 +
>  include/uapi/linux/usbdevice_fs.h |    3 +
>  4 files changed, 102 insertions(+), 5 deletions(-)
> 
> Index: usb-devel/drivers/usb/core/devio.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/devio.c
> +++ usb-devel/drivers/usb/core/devio.c
> @@ -48,6 +48,9 @@
>  #define USB_DEVICE_MAX			(USB_MAXBUS * 128)
>  #define USB_SG_SIZE			16384 /* split-size for
> large txs */
>  
> +/* Mutual exclusion for ps->list in resume vs. release and remove */
> +static DEFINE_MUTEX(usbfs_mutex);
> +
>  struct usb_dev_state {
>  	struct list_head list;      /* state list */
>  	struct usb_device *dev;
> @@ -57,14 +60,17 @@ struct usb_dev_state {
>  	struct list_head async_completed;
>  	struct list_head memory_list;
>  	wait_queue_head_t wait;     /* wake up if a request completed
> */
> +	wait_queue_head_t wait_for_resume;   /* wake up upon runtime
> resume */
>  	unsigned int discsignr;
>  	struct pid *disc_pid;
>  	const struct cred *cred;
>  	void __user *disccontext;
>  	unsigned long ifclaimed;
>  	u32 disabled_bulk_eps;
> -	bool privileges_dropped;
>  	unsigned long interface_allowed_mask;
> +	int not_yet_resumed;
> +	bool suspend_allowed;
> +	bool privileges_dropped;
>  };
>  
>  struct usb_memory {
> @@ -696,9 +702,7 @@ static void driver_disconnect(struct usb
>  	destroy_async_on_interface(ps, ifnum);
>  }
>  
> -/* The following routines are merely placeholders.  There is no way
> - * to inform a user task about suspend or resumes.
> - */
> +/* We don't care about suspend/resume of claimed interfaces */
>  static int driver_suspend(struct usb_interface *intf, pm_message_t
> msg)
>  {
>  	return 0;
> @@ -709,12 +713,32 @@ static int driver_resume(struct usb_inte
>  	return 0;
>  }
>  
> +/* The following routines apply to the entire device, not interfaces
> */
> +void usbfs_notify_suspend(struct usb_device *udev)
> +{
> +	/* We don't need to handle this */
> +}
> +
> +void usbfs_notify_resume(struct usb_device *udev)
> +{
> +	struct usb_dev_state *ps;
> +
> +	/* Protect against simultaneous remove or release */
> +	mutex_lock(&usbfs_mutex);
> +	list_for_each_entry(ps, &udev->filelist, list) {
> +		WRITE_ONCE(ps->not_yet_resumed, 0);
> +		wake_up_all(&ps->wait_for_resume);
> +	}
> +	mutex_unlock(&usbfs_mutex);
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
> @@ -999,9 +1023,12 @@ static int usbdev_open(struct inode *ino
>  	INIT_LIST_HEAD(&ps->async_completed);
>  	INIT_LIST_HEAD(&ps->memory_list);
>  	init_waitqueue_head(&ps->wait);
> +	init_waitqueue_head(&ps->wait_for_resume);
>  	ps->disc_pid = get_pid(task_pid(current));
>  	ps->cred = get_current_cred();
>  	smp_wmb();
> +
> +	/* Can't race with resume; the device is already active */
>  	list_add_tail(&ps->list, &dev->filelist);
>  	file->private_data = ps;
>  	usb_unlock_device(dev);
> @@ -1027,7 +1054,10 @@ static int usbdev_release(struct inode *
>  	usb_lock_device(dev);
>  	usb_hub_release_all_ports(dev, ps);
>  
> +	/* Protect against simultaneous resume */
> +	mutex_lock(&usbfs_mutex);
>  	list_del_init(&ps->list);
> +	mutex_unlock(&usbfs_mutex);
>  
>  	for (ifnum = 0; ps->ifclaimed && ifnum < 8*sizeof(ps-
> >ifclaimed);
>  			ifnum++) {
> @@ -1035,7 +1065,8 @@ static int usbdev_release(struct inode *
>  			releaseintf(ps, ifnum);
>  	}
>  	destroy_all_async(ps);
> -	usb_autosuspend_device(dev);
> +	if (!ps->suspend_allowed)
> +		usb_autosuspend_device(dev);
>  	usb_unlock_device(dev);
>  	usb_put_dev(dev);
>  	put_pid(ps->disc_pid);
> @@ -2346,6 +2377,47 @@ static int proc_drop_privileges(struct u
>  	return 0;
>  }
>  
> +static int proc_forbid_suspend(struct usb_dev_state *ps)
> +{
> +	int ret = 0;
> +
> +	if (ps->suspend_allowed) {
> +		ret = usb_autoresume_device(ps->dev);
> +		if (ret == 0)
> +			ps->suspend_allowed = false;
> +		else if (ret != -ENODEV)
> +			ret = -EIO;
> +	}
> +	return ret;
> +}
> +
> +static int proc_allow_suspend(struct usb_dev_state *ps)
> +{
> +	if (!connected(ps))
> +		return -ENODEV;
> +
> +	WRITE_ONCE(ps->not_yet_resumed, 1);
> +	if (!ps->suspend_allowed) {
> +		usb_autosuspend_device(ps->dev);
> +		ps->suspend_allowed = true;
> +	}
> +	return 0;
> +}
> +
> +static int proc_wait_for_resume(struct usb_dev_state *ps)
> +{
> +	int ret;
> +
> +	usb_unlock_device(ps->dev);
> +	ret = wait_event_interruptible(ps->wait_for_resume,
> +			READ_ONCE(ps->not_yet_resumed) == 0);
> +	usb_lock_device(ps->dev);
> +
> +	if (ret != 0)
> +		return ret;
> +	return proc_forbid_suspend(ps);
> +}
> +
>  /*
>   * NOTE:  All requests here that have interface numbers as parameters
>   * are assuming that somehow the configuration has been prevented
> from
> @@ -2540,6 +2612,15 @@ static long usbdev_do_ioctl(struct file
>  	case USBDEVFS_GET_SPEED:
>  		ret = ps->dev->speed;
>  		break;
> +	case USBDEVFS_FORBID_SUSPEND:
> +		ret = proc_forbid_suspend(ps);
> +		break;
> +	case USBDEVFS_ALLOW_SUSPEND:
> +		ret = proc_allow_suspend(ps);
> +		break;
> +	case USBDEVFS_WAIT_FOR_RESUME:
> +		ret = proc_wait_for_resume(ps);
> +		break;
>  	}
>  
>   done:
> @@ -2607,10 +2688,14 @@ static void usbdev_remove(struct usb_dev
>  	struct usb_dev_state *ps;
>  	struct kernel_siginfo sinfo;
>  
> +	/* Protect against simultaneous resume */
> +	mutex_lock(&usbfs_mutex);
>  	while (!list_empty(&udev->filelist)) {
>  		ps = list_entry(udev->filelist.next, struct
> usb_dev_state, list);
>  		destroy_all_async(ps);
>  		wake_up_all(&ps->wait);
> +		WRITE_ONCE(ps->not_yet_resumed, 0);
> +		wake_up_all(&ps->wait_for_resume);
>  		list_del_init(&ps->list);
>  		if (ps->discsignr) {
>  			clear_siginfo(&sinfo);
> @@ -2622,6 +2707,7 @@ static void usbdev_remove(struct usb_dev
>  					ps->disc_pid, ps->cred);
>  		}
>  	}
> +	mutex_unlock(&usbfs_mutex);
>  }
>  
>  static int usbdev_notify(struct notifier_block *self,
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
>  static inline int usb_port_suspend(struct usb_device *udev,
> pm_message_t msg)
> Index: usb-devel/include/uapi/linux/usbdevice_fs.h
> ===================================================================
> --- usb-devel.orig/include/uapi/linux/usbdevice_fs.h
> +++ usb-devel/include/uapi/linux/usbdevice_fs.h
> @@ -197,5 +197,8 @@ struct usbdevfs_streams {
>  #define USBDEVFS_FREE_STREAMS      _IOR('U', 29, struct
> usbdevfs_streams)
>  #define USBDEVFS_DROP_PRIVILEGES   _IOW('U', 30, __u32)
>  #define USBDEVFS_GET_SPEED         _IO('U', 31)
> +#define USBDEVFS_FORBID_SUSPEND    _IO('U', 32)
> +#define USBDEVFS_ALLOW_SUSPEND     _IO('U', 33)
> +#define USBDEVFS_WAIT_FOR_RESUME   _IO('U', 34)
>  
>  #endif /* _UAPI_LINUX_USBDEVICE_FS_H */
> 
