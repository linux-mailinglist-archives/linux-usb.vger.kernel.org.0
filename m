Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6C5376FD7
	for <lists+linux-usb@lfdr.de>; Sat,  8 May 2021 07:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbhEHFvT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 May 2021 01:51:19 -0400
Received: from mail-eopbgr80044.outbound.protection.outlook.com ([40.107.8.44]:62119
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229473AbhEHFvT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 8 May 2021 01:51:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLbsXeOTutxARBmuhuVI1kugqu2Ov7lCLBNtw9RnMGrYrWxPQS13m3VIPMD5B6t+2Cq8XQVKkzU+aKKls9yeS+V5JX8JzKOwdba+pGplwjHfQ/vpPAdXY5pckFdrphgiF7O/SUFtf371L70BUHcn7ObPIjI189tlyaglt6f6pj9IB0EuQu+7Jy/urBBvQHJz6vtYmtAf0pIHFNJQS/dW4bh1nwPx0MxOSKLWvBDczU4igrqQ87auk4BM6dyLOarDADUk7raGR7ugNHfxUwghGdnO5xVqSR/osMp7YJkpwQJP1C2AMRYld0qE8PujcKdPXhUueftKa1tuCqm+1Emwjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xhjvczhnAWDdOFQA/3q2O6dWzBzDp9k4vft74qZJcI=;
 b=Srw9FZGQutefe32uz0klHtKRESyIlmMCQLjsiJxyYmQEzLFdJZxAs7hvLLh5jVvWfL4H0ukxd5JQ4MNi+ggv+aRmbBmvxRVH2+upefwbghbmfbWi8Q7hsFEGH3SQ5pILBwZSAA/0PM88+rY1MMyuHvPkHUqta7LGVw3d77vJ05QR30WnGT+cd0Kp8ha1G05YAsYL5stm8IVTkh2oWWcRHl4OxmmmTrwnpyO0dguNTCfGw4XpdtG9SVDsYrEW1sQGec3C6ez0+PecVRxPTqaGKO0ZFGSM0BiBmVpgKgXwO2GgXtRZZX5Rs+RNMAPHal5NqGtWKg7zh1tUA0uk6gA44A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xhjvczhnAWDdOFQA/3q2O6dWzBzDp9k4vft74qZJcI=;
 b=gg+HianQTyiMDrg4rH6R7ql7nfmNXHf37mQj1vEYlIxLC2Gc51UvYteAhc3mgE9eAQZDUFBpmozFKQOn6ngxoe2smFuUC//PVSfw6EtNZv0RRlG8jSdhVNsC2j77VGkK3Xm/ThIerNMB6FX274w0aYSsI/27oKDCCiy9xROsp8Y=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR0401MB2557.eurprd04.prod.outlook.com (2603:10a6:800:56::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Sat, 8 May
 2021 05:50:15 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4108.029; Sat, 8 May 2021
 05:50:14 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        mathias.nyman@intel.com
Cc:     peter.chen@kernel.org, jun.li@nxp.com, jackp@codeaurora.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v4 1/3] usb: host: move EH SINGLE_STEP_SET_FEATURE implementation to core
Date:   Sat,  8 May 2021 13:33:57 +0800
Message-Id: <1620452039-11694-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG3P274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::21)
 To VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG3P274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4108.24 via Frontend Transport; Sat, 8 May 2021 05:50:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c30982ff-1cf3-4b51-d7ae-08d911e52672
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2557:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2557143EEA59777EAEA56D7989569@VI1PR0401MB2557.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:132;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eLrO3H0OC+oI2W7/YtpkJelkpMmjpfwKrwjWjq72Tp65ZVGKD9woFzZcGTfgCvBrmFhTd6WZs08Y4UT0+DxVezAd9KjNCihFHsTOS1CREE9WAlpgDWlYlTDB3SWE/3RJPjd6q69g6RYwbL1ol5vNoUI0iFoOW+5Be4qVJ9KcylosA73CY0iqwOAsRJGMHOMSnSKIYLZFxqpUNAKErkdSSTLeZ6vxzVm9FVzw0hztxWgKhxe0htiunG2S2+CYL+ZsHi30qUDlS3i0iIT7MoAr6WlzhfFTyYhkHovpCB0eWRkJ2oXyB1BAXjKUB+mOP9Gbv2U2oFL3wPdATi/8FPwcZjx0QXD+DILE7MKXIlM1a4WnwEdkCKP/QySumTmUV5mOm5bZTlduQkgJR8b+sw4por3lfuS78ZYoxRifDNd24ECeSFz99SwagxYsSvh89QOeh5euiCSAbz+KxGFNZwuXg/gCOqeaY3fd8B48vt4w+oZ9T5HpO/myM+4aCgTzFmppDb5XpFCKQ2Bi2uAuFd+J4hpBp4k9ixcUE23hgp9CeEMhlosBB3bYwPzor0wVbip5HObx7y6xFXlDjbF1FCrChwjse2KsJbjzeirtHpWYDDVtu1mNH3poJcXappAA1IFmz7wqU8NTQzvZABkTGyNNwTe7TVbIa/RazQ2FJ9mLEzDuw1ESxeHTk9AjMByW5JO4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(2906002)(8936002)(52116002)(6506007)(4326008)(83380400001)(38350700002)(38100700002)(2616005)(66946007)(66476007)(66556008)(6666004)(956004)(8676002)(6512007)(16526019)(5660300002)(316002)(36756003)(478600001)(86362001)(30864003)(186003)(6486002)(26005)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UeeWXLeFYhzZmCCRGBwHsAwGRz0jboQRifxyOAFmOd1XIRaNOuueTEsO7sHf?=
 =?us-ascii?Q?9RHjYMXuhvZU3n50f9KKQYut5Tkt76chnvSGm1Qw8AhAzTmh/Q7G5THWRybR?=
 =?us-ascii?Q?9gLmCIZIlVPHExVVVW3IFBd+hFG+rCeyL7Z9Dwns8Ve7rYpxnrpi+y4/Ybbe?=
 =?us-ascii?Q?YX6Fubco1yHtFApcIIpSToP2bbFogvN5lg1A+v8pRLejqBrOWN8EUbYjHUc2?=
 =?us-ascii?Q?TCJ22WbourIRqAqKxJ83VLh1EM5rykJR4rKidnYWviO31tLXEY8JSmjlon0s?=
 =?us-ascii?Q?jHxtXOvT5ltAiuwoYZLMiELk/WUoO+JS7gBNEJszJI2P4DdaYlX9u2FIb52W?=
 =?us-ascii?Q?ZsQW1Nrh/yuhhmndSMIIRY/IJDkBpgoXbnrj5E8wdrNtSH2P49FzUGj0vvuq?=
 =?us-ascii?Q?nM1EYR+/qLSH4fMswjMfkvXr/zLvZ2gH+RWlYchPbM1/0+Yp9BZ6IhTO+CoG?=
 =?us-ascii?Q?IXYfzjqXttSYnWstCo3qChnLOJOir+o1Klf2SCR144fp5PbWoMm3CpCoo27Y?=
 =?us-ascii?Q?IInkwO3uidBPpBwDjpNzyEfsF5QQdbzRKi3wXCF46utYALoG6E4iSous8kmc?=
 =?us-ascii?Q?ijx7cQ0QvZYGeFGtNY1HAznYSB0qFJ9xN1Kf7sCnj/64hG3Hn4FZgrkDz8dv?=
 =?us-ascii?Q?z0mAI04LErf8cCHgHVTdEL7GYlsTYi/hKoEzOOt0FG9tOPp3HctY725Vkypu?=
 =?us-ascii?Q?JCwuUSEL2O7HtxcCj828ukBQP21SAOK4rtPY233VACmsutOCY9rhB+jxcV07?=
 =?us-ascii?Q?v8DT+xsQnxJMR3kCF7ubBsoiy6LpxAAePX2fXYmqXZrmDERQP4BF6UrwWN0i?=
 =?us-ascii?Q?6DZGJByEjXpSRcKS3DfMPSKOjnYyJG7eQzT1oC8Q6mupDlWXcwdmQbyeQMg1?=
 =?us-ascii?Q?wRz887KIn0bdAAazyJbhFMzEEUhpVI7n0aC8MSXD4xsac6e+3mSmEWXY/L9H?=
 =?us-ascii?Q?jZ5D0LQa5Fe3FJkquhrVrbWvPC/HhIKhIB0WvsK7euLfpFX+Jzv5Xqs756ta?=
 =?us-ascii?Q?mB7fd4Fy4WTN3sORCCLufP1mgA5Rxj1FnL08MSfd+d7JQ2dgKwVTFBzTMavr?=
 =?us-ascii?Q?2jThJBvMNMFsavkGIHx2Ag1cxyYtijutQwGMABtgJ0eHwj0aqADfpRqhqjn0?=
 =?us-ascii?Q?ZEepmby61j2hgF6nYrh9l5IMX8DcTCvdaGhZwegmzqSat/7ne546a56zi76a?=
 =?us-ascii?Q?jMUJ3m5dZ4xZBHWUU1FSVRz+tY+NC7zYLpe3FZnp/4Tyj3OzI46Wbpms9UDW?=
 =?us-ascii?Q?x472YOVCUtwINLhbUWglvBKAGDWwgUnltDPB8y3D74InRrSbaQNYyCkaehdD?=
 =?us-ascii?Q?usOnoWVUaqxkx4l5jCaBy+M1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c30982ff-1cf3-4b51-d7ae-08d911e52672
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2021 05:50:14.8444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BdW0mCL+ZROeKMnj6JyQLzsT0hsHjjS7pF7EokU/aI7MK0ExNv8QllqADBSegK90
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2557
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

It is needed at USB Certification test for Embedded Host 2.0, and
the detail is at CH6.4.1.1 of On-The-Go and Embedded Host Supplement
to the USB Revision 2.0 Specification. Since other USB 2.0 capable
host like XHCI also need it, so move it to HCD core.

Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
Change for v4:
- No change.

Change for v3:
- Add Alan's A-b tag.
 
Change for v2:
- No change.

 drivers/usb/core/hcd.c      | 134 ++++++++++++++++++++++++++++++++++
 drivers/usb/host/ehci-hcd.c |   4 ++
 drivers/usb/host/ehci-hub.c | 139 ------------------------------------
 drivers/usb/host/ehci-q.c   |   2 +-
 include/linux/usb/hcd.h     |  13 +++-
 5 files changed, 151 insertions(+), 141 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 6119fb41d736..d7eb9f179ca6 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2110,6 +2110,140 @@ int usb_hcd_get_frame_number (struct usb_device *udev)
 	return hcd->driver->get_frame_number (hcd);
 }
 
+/*-------------------------------------------------------------------------*/
+#ifdef CONFIG_USB_HCD_TEST_MODE
+
+static void usb_ehset_completion(struct urb *urb)
+{
+	struct completion  *done = urb->context;
+
+	complete(done);
+}
+/*
+ * Allocate and initialize a control URB. This request will be used by the
+ * EHSET SINGLE_STEP_SET_FEATURE test in which the DATA and STATUS stages
+ * of the GetDescriptor request are sent 15 seconds after the SETUP stage.
+ * Return NULL if failed.
+ */
+static struct urb *request_single_step_set_feature_urb(
+	struct usb_device	*udev,
+	void			*dr,
+	void			*buf,
+	struct completion	*done)
+{
+	struct urb *urb;
+	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
+	struct usb_host_endpoint *ep;
+
+	urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!urb)
+		return NULL;
+
+	urb->pipe = usb_rcvctrlpipe(udev, 0);
+	ep = (usb_pipein(urb->pipe) ? udev->ep_in : udev->ep_out)
+				[usb_pipeendpoint(urb->pipe)];
+	if (!ep) {
+		usb_free_urb(urb);
+		return NULL;
+	}
+
+	urb->ep = ep;
+	urb->dev = udev;
+	urb->setup_packet = (void *)dr;
+	urb->transfer_buffer = buf;
+	urb->transfer_buffer_length = USB_DT_DEVICE_SIZE;
+	urb->complete = usb_ehset_completion;
+	urb->status = -EINPROGRESS;
+	urb->actual_length = 0;
+	urb->transfer_flags = URB_DIR_IN;
+	usb_get_urb(urb);
+	atomic_inc(&urb->use_count);
+	atomic_inc(&urb->dev->urbnum);
+	urb->setup_dma = dma_map_single(
+			hcd->self.sysdev,
+			urb->setup_packet,
+			sizeof(struct usb_ctrlrequest),
+			DMA_TO_DEVICE);
+	urb->transfer_dma = dma_map_single(
+			hcd->self.sysdev,
+			urb->transfer_buffer,
+			urb->transfer_buffer_length,
+			DMA_FROM_DEVICE);
+	urb->context = done;
+	return urb;
+}
+
+int ehset_single_step_set_feature(struct usb_hcd *hcd, int port)
+{
+	int retval = -ENOMEM;
+	struct usb_ctrlrequest *dr;
+	struct urb *urb;
+	struct usb_device *udev;
+	struct usb_device_descriptor *buf;
+	DECLARE_COMPLETION_ONSTACK(done);
+
+	/* Obtain udev of the rhub's child port */
+	udev = usb_hub_find_child(hcd->self.root_hub, port);
+	if (!udev) {
+		dev_err(hcd->self.controller, "No device attached to the RootHub\n");
+		return -ENODEV;
+	}
+	buf = kmalloc(USB_DT_DEVICE_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	dr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_KERNEL);
+	if (!dr) {
+		kfree(buf);
+		return -ENOMEM;
+	}
+
+	/* Fill Setup packet for GetDescriptor */
+	dr->bRequestType = USB_DIR_IN;
+	dr->bRequest = USB_REQ_GET_DESCRIPTOR;
+	dr->wValue = cpu_to_le16(USB_DT_DEVICE << 8);
+	dr->wIndex = 0;
+	dr->wLength = cpu_to_le16(USB_DT_DEVICE_SIZE);
+	urb = request_single_step_set_feature_urb(udev, dr, buf, &done);
+	if (!urb)
+		goto cleanup;
+
+	/* Submit just the SETUP stage */
+	retval = hcd->driver->submit_single_step_set_feature(hcd, urb, 1);
+	if (retval)
+		goto out1;
+	if (!wait_for_completion_timeout(&done, msecs_to_jiffies(2000))) {
+		usb_kill_urb(urb);
+		retval = -ETIMEDOUT;
+		dev_err(hcd->self.controller,
+			"%s SETUP stage timed out on ep0\n", __func__);
+		goto out1;
+	}
+	msleep(15 * 1000);
+
+	/* Complete remaining DATA and STATUS stages using the same URB */
+	urb->status = -EINPROGRESS;
+	usb_get_urb(urb);
+	atomic_inc(&urb->use_count);
+	atomic_inc(&urb->dev->urbnum);
+	retval = hcd->driver->submit_single_step_set_feature(hcd, urb, 0);
+	if (!retval && !wait_for_completion_timeout(&done,
+						msecs_to_jiffies(2000))) {
+		usb_kill_urb(urb);
+		retval = -ETIMEDOUT;
+		dev_err(hcd->self.controller,
+			"%s IN stage timed out on ep0\n", __func__);
+	}
+out1:
+	usb_free_urb(urb);
+cleanup:
+	kfree(dr);
+	kfree(buf);
+	return retval;
+}
+EXPORT_SYMBOL_GPL(ehset_single_step_set_feature);
+#endif /* CONFIG_USB_HCD_TEST_MODE */
+
 /*-------------------------------------------------------------------------*/
 
 #ifdef	CONFIG_PM
diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 94b5e64ae9a2..35eec0c0edcd 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -1238,6 +1238,10 @@ static const struct hc_driver ehci_hc_driver = {
 	 * device support
 	 */
 	.free_dev =		ehci_remove_device,
+#ifdef CONFIG_USB_HCD_TEST_MODE
+	/* EH SINGLE_STEP_SET_FEATURE test support */
+	.submit_single_step_set_feature	= ehci_submit_single_step_set_feature,
+#endif
 };
 
 void ehci_init_driver(struct hc_driver *drv,
diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
index 159cc27b1a36..c4f6a2559a98 100644
--- a/drivers/usb/host/ehci-hub.c
+++ b/drivers/usb/host/ehci-hub.c
@@ -726,145 +726,6 @@ ehci_hub_descriptor (
 	desc->wHubCharacteristics = cpu_to_le16(temp);
 }
 
-/*-------------------------------------------------------------------------*/
-#ifdef CONFIG_USB_HCD_TEST_MODE
-
-#define EHSET_TEST_SINGLE_STEP_SET_FEATURE 0x06
-
-static void usb_ehset_completion(struct urb *urb)
-{
-	struct completion  *done = urb->context;
-
-	complete(done);
-}
-static int submit_single_step_set_feature(
-	struct usb_hcd	*hcd,
-	struct urb	*urb,
-	int		is_setup
-);
-
-/*
- * Allocate and initialize a control URB. This request will be used by the
- * EHSET SINGLE_STEP_SET_FEATURE test in which the DATA and STATUS stages
- * of the GetDescriptor request are sent 15 seconds after the SETUP stage.
- * Return NULL if failed.
- */
-static struct urb *request_single_step_set_feature_urb(
-	struct usb_device	*udev,
-	void			*dr,
-	void			*buf,
-	struct completion	*done
-) {
-	struct urb *urb;
-	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
-	struct usb_host_endpoint *ep;
-
-	urb = usb_alloc_urb(0, GFP_KERNEL);
-	if (!urb)
-		return NULL;
-
-	urb->pipe = usb_rcvctrlpipe(udev, 0);
-	ep = (usb_pipein(urb->pipe) ? udev->ep_in : udev->ep_out)
-				[usb_pipeendpoint(urb->pipe)];
-	if (!ep) {
-		usb_free_urb(urb);
-		return NULL;
-	}
-
-	urb->ep = ep;
-	urb->dev = udev;
-	urb->setup_packet = (void *)dr;
-	urb->transfer_buffer = buf;
-	urb->transfer_buffer_length = USB_DT_DEVICE_SIZE;
-	urb->complete = usb_ehset_completion;
-	urb->status = -EINPROGRESS;
-	urb->actual_length = 0;
-	urb->transfer_flags = URB_DIR_IN;
-	usb_get_urb(urb);
-	atomic_inc(&urb->use_count);
-	atomic_inc(&urb->dev->urbnum);
-	urb->setup_dma = dma_map_single(
-			hcd->self.sysdev,
-			urb->setup_packet,
-			sizeof(struct usb_ctrlrequest),
-			DMA_TO_DEVICE);
-	urb->transfer_dma = dma_map_single(
-			hcd->self.sysdev,
-			urb->transfer_buffer,
-			urb->transfer_buffer_length,
-			DMA_FROM_DEVICE);
-	urb->context = done;
-	return urb;
-}
-
-static int ehset_single_step_set_feature(struct usb_hcd *hcd, int port)
-{
-	int retval = -ENOMEM;
-	struct usb_ctrlrequest *dr;
-	struct urb *urb;
-	struct usb_device *udev;
-	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
-	struct usb_device_descriptor *buf;
-	DECLARE_COMPLETION_ONSTACK(done);
-
-	/* Obtain udev of the rhub's child port */
-	udev = usb_hub_find_child(hcd->self.root_hub, port);
-	if (!udev) {
-		ehci_err(ehci, "No device attached to the RootHub\n");
-		return -ENODEV;
-	}
-	buf = kmalloc(USB_DT_DEVICE_SIZE, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	dr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_KERNEL);
-	if (!dr) {
-		kfree(buf);
-		return -ENOMEM;
-	}
-
-	/* Fill Setup packet for GetDescriptor */
-	dr->bRequestType = USB_DIR_IN;
-	dr->bRequest = USB_REQ_GET_DESCRIPTOR;
-	dr->wValue = cpu_to_le16(USB_DT_DEVICE << 8);
-	dr->wIndex = 0;
-	dr->wLength = cpu_to_le16(USB_DT_DEVICE_SIZE);
-	urb = request_single_step_set_feature_urb(udev, dr, buf, &done);
-	if (!urb)
-		goto cleanup;
-
-	/* Submit just the SETUP stage */
-	retval = submit_single_step_set_feature(hcd, urb, 1);
-	if (retval)
-		goto out1;
-	if (!wait_for_completion_timeout(&done, msecs_to_jiffies(2000))) {
-		usb_kill_urb(urb);
-		retval = -ETIMEDOUT;
-		ehci_err(ehci, "%s SETUP stage timed out on ep0\n", __func__);
-		goto out1;
-	}
-	msleep(15 * 1000);
-
-	/* Complete remaining DATA and STATUS stages using the same URB */
-	urb->status = -EINPROGRESS;
-	usb_get_urb(urb);
-	atomic_inc(&urb->use_count);
-	atomic_inc(&urb->dev->urbnum);
-	retval = submit_single_step_set_feature(hcd, urb, 0);
-	if (!retval && !wait_for_completion_timeout(&done,
-						msecs_to_jiffies(2000))) {
-		usb_kill_urb(urb);
-		retval = -ETIMEDOUT;
-		ehci_err(ehci, "%s IN stage timed out on ep0\n", __func__);
-	}
-out1:
-	usb_free_urb(urb);
-cleanup:
-	kfree(dr);
-	kfree(buf);
-	return retval;
-}
-#endif /* CONFIG_USB_HCD_TEST_MODE */
 /*-------------------------------------------------------------------------*/
 
 int ehci_hub_control(
diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
index a826715ae9bd..2cbf4f85bff3 100644
--- a/drivers/usb/host/ehci-q.c
+++ b/drivers/usb/host/ehci-q.c
@@ -1165,7 +1165,7 @@ submit_async (
  * performed; TRUE - SETUP and FALSE - IN+STATUS
  * Returns 0 if success
  */
-static int submit_single_step_set_feature(
+static int ehci_submit_single_step_set_feature(
 	struct usb_hcd  *hcd,
 	struct urb      *urb,
 	int             is_setup
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 96281cd50ff6..22c5d1c0acf3 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -409,7 +409,10 @@ struct hc_driver {
 	int	(*find_raw_port_number)(struct usb_hcd *, int);
 	/* Call for power on/off the port if necessary */
 	int	(*port_power)(struct usb_hcd *hcd, int portnum, bool enable);
-
+	/* Call for SINGLE_STEP_SET_FEATURE Test for USB2 EH certification */
+#define EHSET_TEST_SINGLE_STEP_SET_FEATURE 0x06
+	int	(*submit_single_step_set_feature)(struct usb_hcd *,
+			struct urb *, int);
 };
 
 static inline int hcd_giveback_urb_in_bh(struct usb_hcd *hcd)
@@ -474,6 +477,14 @@ int usb_hcd_setup_local_mem(struct usb_hcd *hcd, phys_addr_t phys_addr,
 
 struct platform_device;
 extern void usb_hcd_platform_shutdown(struct platform_device *dev);
+#ifdef CONFIG_USB_HCD_TEST_MODE
+extern int ehset_single_step_set_feature(struct usb_hcd *hcd, int port);
+#else
+static inline int ehset_single_step_set_feature(struct usb_hcd *hcd, int port)
+{
+	return 0;
+}
+#endif /* CONFIG_USB_HCD_TEST_MODE */
 
 #ifdef CONFIG_USB_PCI
 struct pci_dev;
-- 
2.25.1

