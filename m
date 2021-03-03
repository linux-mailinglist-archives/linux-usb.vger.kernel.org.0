Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85AAE32C62A
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 02:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1449400AbhCDA1x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 19:27:53 -0500
Received: from netrider.rowland.org ([192.131.102.5]:53623 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S239240AbhCCROD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Mar 2021 12:14:03 -0500
Received: (qmail 1576814 invoked by uid 1000); 3 Mar 2021 12:13:15 -0500
Date:   Wed, 3 Mar 2021 12:13:15 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Pete Zaitcev <zaitcev@redhat.com>
Cc:     "Zhang, Qiang" <Qiang.Zhang@windriver.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: usblp: Add device status detection in usblp_poll()
Message-ID: <20210303171315.GB1574518@rowland.harvard.edu>
References: <20210301040300.20834-1-qiang.zhang@windriver.com>
 <YDyfL/yg9QNM4nku@kroah.com>
 <BYAPR11MB263268B5FD6EB3C3B80B63FBFF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
 <YDymu1AlS+8UjdXG@kroah.com>
 <BYAPR11MB2632AE1A6D78903112F86062FF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
 <YD3jlIR7UJjXT6Se@kroah.com>
 <BYAPR11MB263258B4BD102A08BF454D82FF999@BYAPR11MB2632.namprd11.prod.outlook.com>
 <20210302231254.7a0e32cb@suzdal.zaitcev.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302231254.7a0e32cb@suzdal.zaitcev.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 02, 2021 at 11:12:54PM -0600, Pete Zaitcev wrote:
> On Tue, 2 Mar 2021 07:41:07 +0000
> "Zhang, Qiang" <Qiang.Zhang@windriver.com> wrote:
> 
> > and also I find  similar usage in usb/class/usbtmc.c
> 
> Seems like a bug indeed, but I don't like the example in usbtmc.c.
> Please let me know if the following is acceptable:
> 
> commit 83591ac63bc666a44f250b43af6c0f5a1e001841
> Author: Pete Zaitcev <zaitcev@kotori.zaitcev.us>
> Date:   Tue Mar 2 23:00:28 2021 -0600
> 
>     usblp: fix a hang in poll() if disconnected
>     
>     Apparently an application that opens a device and calls select()
>     on it, will hang if the decice is disconnected. It's a little
>     surprising that we had this bug for 15 years, but apparently
>     nobody ever uses select() with a printer: only write() and read(),
>     and those work fine. Well, you can also select() with a timeout.
>     
>     The fix is modeled after devio.c. A few drivers check the
>     condition first, then do not add the wait queue in case the
>     device is disconnected. We doubt that's completely race-free.
>     So, this patch adds the process first, then locks properly
>     and checks for the disconnect.
>     
>     Reported-by: Zqiang <qiang.zhang@windriver.com>
>     Signed-off-by: Pete Zaitcev <zaitcev@redhat.com>
> 
> diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
> index fd87405adbed..5733a0067f5b 100644
> --- a/drivers/usb/class/usblp.c
> +++ b/drivers/usb/class/usblp.c
> @@ -494,16 +494,24 @@ static int usblp_release(struct inode *inode, struct file *file)
>  /* No kernel lock - fine */
>  static __poll_t usblp_poll(struct file *file, struct poll_table_struct *wait)
>  {
> -	__poll_t ret;
> +	struct usblp *usblp = file->private_data;
> +	__poll_t ret = 0;
>  	unsigned long flags;
>  
> -	struct usblp *usblp = file->private_data;
>  	/* Should we check file->f_mode & FMODE_WRITE before poll_wait()? */
>  	poll_wait(file, &usblp->rwait, wait);
>  	poll_wait(file, &usblp->wwait, wait);
> +
> +	mutex_lock(&usblp->mut);
> +	if (!usblp->present)
> +		ret != EPOLLHUP;

Typo: ! instead of |.  You have to look closely to see the difference.

alan Stern

> +	mutex_unlock(&usblp->mut);
> +
>  	spin_lock_irqsave(&usblp->lock, flags);
> -	ret = ((usblp->bidir && usblp->rcomplete) ? EPOLLIN  | EPOLLRDNORM : 0) |
> -	   ((usblp->no_paper || usblp->wcomplete) ? EPOLLOUT | EPOLLWRNORM : 0);
> +	if (usblp->bidir && usblp->rcomplete)
> +		ret |= EPOLLIN  | EPOLLRDNORM;
> +	if (usblp->no_paper || usblp->wcomplete)
> +		ret |= EPOLLOUT | EPOLLWRNORM;
>  	spin_unlock_irqrestore(&usblp->lock, flags);
>  	return ret;
>  }
> 
