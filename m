Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B464019F845
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2020 16:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbgDFOxe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Apr 2020 10:53:34 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:45104 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728734AbgDFOxd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Apr 2020 10:53:33 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 036Ell9d196039;
        Mon, 6 Apr 2020 14:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=byY9VeyrnweFJ09HQDv1m5oedqToHGYAZUh3KpcdKAg=;
 b=Zq+AyCbht8KJGrsPG5wpfGIkfwEvQ3btwuipTxRc382iOqGJWPj05RDFp55IgCu7p+MI
 NBGuIMddnLA7RkwTh8fYV357AlKBhsZ7gwAOfMsrYb+D3nTTOiNuY/DuRPgXMWHPTm3S
 lhnXrFjcndVKve0zwlizGM6SxaFOPREF3fNP0Qd+jPARRqoajiyXZ/ioYsgZ1BUAh1Xy
 zguGV0v3e0wc8pSRoECgSU20D7CSikRjzWVG5631XJASwQx50jbDudbjJfYp7l6VpCPH
 8SRqQJ/Mrv01ErcVg/3gxBYwukf/VoBD2Z/Ifi8osuE56deOm200l3B08M9PSCBxL7Cp 0Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 306hnqych6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Apr 2020 14:53:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 036EkaBM082804;
        Mon, 6 Apr 2020 14:51:29 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 3073sq2s9t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Apr 2020 14:51:28 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 036EpQ32032638;
        Mon, 6 Apr 2020 14:51:26 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 06 Apr 2020 07:51:25 -0700
Date:   Mon, 6 Apr 2020 17:51:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: raw-gadget: Fix copy_to/from_user() checks
Message-ID: <20200406145119.GG68494@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9582 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=2 adultscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004060123
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9582 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=2
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004060123
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The copy_to/from_user() functions return the number of bytes remaining
but we want to return negative error codes.  I changed a couple checks
in raw_ioctl_ep_read() and raw_ioctl_ep0_read() to show that we still
we returning zero on error.

Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/gadget/legacy/raw_gadget.c | 46 ++++++++++++++++++++++------------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 76406343fbe5..e490ffa1f58b 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -392,9 +392,8 @@ static int raw_ioctl_init(struct raw_dev *dev, unsigned long value)
 	char *udc_device_name;
 	unsigned long flags;
 
-	ret = copy_from_user(&arg, (void __user *)value, sizeof(arg));
-	if (ret)
-		return ret;
+	if (copy_from_user(&arg, (void __user *)value, sizeof(arg)))
+		return -EFAULT;
 
 	switch (arg.speed) {
 	case USB_SPEED_UNKNOWN:
@@ -501,15 +500,13 @@ static int raw_ioctl_run(struct raw_dev *dev, unsigned long value)
 
 static int raw_ioctl_event_fetch(struct raw_dev *dev, unsigned long value)
 {
-	int ret = 0;
 	struct usb_raw_event arg;
 	unsigned long flags;
 	struct usb_raw_event *event;
 	uint32_t length;
 
-	ret = copy_from_user(&arg, (void __user *)value, sizeof(arg));
-	if (ret)
-		return ret;
+	if (copy_from_user(&arg, (void __user *)value, sizeof(arg)))
+		return -EFAULT;
 
 	spin_lock_irqsave(&dev->lock, flags);
 	if (dev->state != STATE_DEV_RUNNING) {
@@ -530,20 +527,19 @@ static int raw_ioctl_event_fetch(struct raw_dev *dev, unsigned long value)
 		return -EINTR;
 	}
 	length = min(arg.length, event->length);
-	ret = copy_to_user((void __user *)value, event,
-				sizeof(*event) + length);
-	return ret;
+	if (copy_to_user((void __user *)value, event, sizeof(*event) + length))
+		return -EFAULT;
+
+	return 0;
 }
 
 static void *raw_alloc_io_data(struct usb_raw_ep_io *io, void __user *ptr,
 				bool get_from_user)
 {
-	int ret;
 	void *data;
 
-	ret = copy_from_user(io, ptr, sizeof(*io));
-	if (ret)
-		return ERR_PTR(ret);
+	if (copy_from_user(io, ptr, sizeof(*io)))
+		return ERR_PTR(-EFAULT);
 	if (io->ep >= USB_RAW_MAX_ENDPOINTS)
 		return ERR_PTR(-EINVAL);
 	if (!usb_raw_io_flags_valid(io->flags))
@@ -658,12 +654,13 @@ static int raw_ioctl_ep0_read(struct raw_dev *dev, unsigned long value)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 	ret = raw_process_ep0_io(dev, &io, data, false);
-	if (ret < 0) {
-		kfree(data);
-		return ret;
-	}
+	if (ret)
+		goto free;
+
 	length = min(io.length, (unsigned int)ret);
-	ret = copy_to_user((void __user *)(value + sizeof(io)), data, length);
+	if (copy_to_user((void __user *)(value + sizeof(io)), data, length))
+		ret = -EFAULT;
+free:
 	kfree(data);
 	return ret;
 }
@@ -952,12 +949,13 @@ static int raw_ioctl_ep_read(struct raw_dev *dev, unsigned long value)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 	ret = raw_process_ep_io(dev, &io, data, false);
-	if (ret < 0) {
-		kfree(data);
-		return ret;
-	}
+	if (ret)
+		goto free;
+
 	length = min(io.length, (unsigned int)ret);
-	ret = copy_to_user((void __user *)(value + sizeof(io)), data, length);
+	if (copy_to_user((void __user *)(value + sizeof(io)), data, length))
+		ret = -EFAULT;
+free:
 	kfree(data);
 	return ret;
 }
