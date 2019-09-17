Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72545B51D9
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 17:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729866AbfIQPyF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 11:54:05 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:38772 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729859AbfIQPyB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 11:54:01 -0400
Received: (qmail 5167 invoked by uid 2102); 17 Sep 2019 11:53:59 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 17 Sep 2019 11:53:59 -0400
Date:   Tue, 17 Sep 2019 11:53:59 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+7fa38a608b1075dfd634@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <gregkh@linuxfoundation.org>,
        <kai.heng.feng@canonical.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <mans@mansr.com>, <oneukum@suse.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: general protection fault in usb_set_interface
In-Reply-To: <000000000000a9f2870592c15dd3@google.com>
Message-ID: <Pine.LNX.4.44L0.1909171152520.1590-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 17 Sep 2019, syzbot wrote:

> Hello,
> 
> syzbot has tested the proposed patch but the reproducer still triggered  
> crash:
> possible deadlock in vidioc_querycap
> 
> ============================================
> WARNING: possible recursive locking detected
> 5.3.0-rc7+ #0 Not tainted
> --------------------------------------------
> v4l_id/3016 is trying to acquire lock:
> 0000000069c3004e (&usbvision->v4l2_lock){+.+.}, at:  
> vidioc_querycap+0x62/0x3b0 drivers/media/usb/usbvision/usbvision-video.c:456
> 
> but task is already holding lock:
> 0000000069c3004e (&usbvision->v4l2_lock){+.+.}, at:  
> __video_do_ioctl+0x3ba/0xba0 drivers/media/v4l2-core/v4l2-ioctl.c:2846

Heh.  That's what comes of trying to patch a driver when you aren't an 
expert on it already.

Okay, the lock is already held at this point so we don't need to 
acquire it.

Alan Stern

#syz test: https://github.com/google/kasan.git f0df5c1b

 drivers/media/usb/usbvision/usbvision-video.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

Index: usb-devel/drivers/media/usb/usbvision/usbvision-video.c
===================================================================
--- usb-devel.orig/drivers/media/usb/usbvision/usbvision-video.c
+++ usb-devel/drivers/media/usb/usbvision/usbvision-video.c
@@ -453,6 +453,9 @@ static int vidioc_querycap(struct file *
 {
 	struct usb_usbvision *usbvision = video_drvdata(file);
 
+	if (!usbvision->dev)
+		return -ENODEV;
+
 	strscpy(vc->driver, "USBVision", sizeof(vc->driver));
 	strscpy(vc->card,
 		usbvision_device_data[usbvision->dev_model].model_string,
@@ -1111,7 +1114,8 @@ static int usbvision_radio_close(struct
 	mutex_lock(&usbvision->v4l2_lock);
 	/* Set packet size to 0 */
 	usbvision->iface_alt = 0;
-	usb_set_interface(usbvision->dev, usbvision->iface,
+	if (usbvision->dev)
+		usb_set_interface(usbvision->dev, usbvision->iface,
 				    usbvision->iface_alt);
 
 	usbvision_audio_off(usbvision);

