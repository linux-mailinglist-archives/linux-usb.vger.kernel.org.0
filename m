Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1AA5B5137
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 17:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729314AbfIQPQd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 11:16:33 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:38690 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727437AbfIQPQd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 11:16:33 -0400
Received: (qmail 4216 invoked by uid 2102); 17 Sep 2019 11:16:32 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 17 Sep 2019 11:16:32 -0400
Date:   Tue, 17 Sep 2019 11:16:32 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+7fa38a608b1075dfd634@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <gregkh@linuxfoundation.org>,
        <kai.heng.feng@canonical.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <mans@mansr.com>, <oneukum@suse.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: general protection fault in usb_set_interface
In-Reply-To: <000000000000dcade20592b1edc7@google.com>
Message-ID: <Pine.LNX.4.44L0.1909171115310.1590-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 16 Sep 2019, syzbot wrote:

> Hello,
> 
> syzbot has tested the proposed patch but the reproducer still triggered  
> crash:
> general protection fault in vidioc_querycap

Same problem in a different part of the code.

Alan Stern

#syz test: https://github.com/google/kasan.git f0df5c1b

 drivers/media/usb/usbvision/usbvision-video.c |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

Index: usb-devel/drivers/media/usb/usbvision/usbvision-video.c
===================================================================
--- usb-devel.orig/drivers/media/usb/usbvision/usbvision-video.c
+++ usb-devel/drivers/media/usb/usbvision/usbvision-video.c
@@ -453,6 +453,12 @@ static int vidioc_querycap(struct file *
 {
 	struct usb_usbvision *usbvision = video_drvdata(file);
 
+	mutex_lock(&usbvision->v4l2_lock);
+	if (!usbvision->dev) {
+		mutex_unlock(&usbvision->v4l2_lock);
+		return -ENODEV;
+	}
+
 	strscpy(vc->driver, "USBVision", sizeof(vc->driver));
 	strscpy(vc->card,
 		usbvision_device_data[usbvision->dev_model].model_string,
@@ -464,6 +470,7 @@ static int vidioc_querycap(struct file *
 		vc->capabilities |= V4L2_CAP_RADIO;
 	if (usbvision->have_tuner)
 		vc->capabilities |= V4L2_CAP_TUNER;
+	mutex_unlock(&usbvision->v4l2_lock);
 	return 0;
 }
 
@@ -1111,7 +1118,8 @@ static int usbvision_radio_close(struct
 	mutex_lock(&usbvision->v4l2_lock);
 	/* Set packet size to 0 */
 	usbvision->iface_alt = 0;
-	usb_set_interface(usbvision->dev, usbvision->iface,
+	if (usbvision->dev)
+		usb_set_interface(usbvision->dev, usbvision->iface,
 				    usbvision->iface_alt);
 
 	usbvision_audio_off(usbvision);


