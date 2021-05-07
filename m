Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF589376104
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 09:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbhEGHPQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 May 2021 03:15:16 -0400
Received: from mail-eopbgr80071.outbound.protection.outlook.com ([40.107.8.71]:35204
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230070AbhEGHPP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 May 2021 03:15:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmr3/ANufpnLvZLQYaigWduueFfCkBUnJ8pU6aJ9DwdAWGKLzTv2poMjqf/i0uF1C3uzH89KbsQXtQnT9BH6VLvf/D3pxVAI7kHbkhXXaClazISlBfKrhDj+f2PejiPNSOhoeVqmtH7PlWWERFTJyv2VGJcQ1CiXjcPt5Uu4Z6WnfzY9MOZG5cXxZ3AftPs6mO4XkGqholL17s6Uefq/qaJw3V7/wWA3WOepwwQDwX7tAapkCLJWC9fvI2QEa1oVgOKCysaXilahlG3fRJvfKoC4CifvSfOLAiQIaWxLW93K76nrs+hQL94tO5e8gTeTsdUQYoFuZ76vzb44pNpllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTn3GB0q7w40ohzHeVnmyOYbILXYzjEC9Sbx6vN06uo=;
 b=jY0z9fa6NaQCjBec1TDDAjJeKPUgHW29fANA1HBo4Rc+S1odLkbL0U2heVpMs3jF2sLmMss3CDFkLFxSdnMYoz14RPSGXEztgunIvJYdyGJKxOWarRglVWSlVWYPiS+fnSZVmzyVJ82wulOlf1/ZvNWsp7YbtREC8stCSWvth5HfYQ5Z9dMVLQt+YzBV+4h7PPSXNS5qzGZlfWGvpctNEOUOHkboI2idJeZG+eBf6yZKVX9e5TyCIlPN3RXFpALnUiZ2n16AjvBpbB3fy/3Rg2NlqQ686JfL+hUehbz62eOwwVKKxflAUOhS0pOiMnjuFLrqhoRCkZ9oTq6Fzs0zGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTn3GB0q7w40ohzHeVnmyOYbILXYzjEC9Sbx6vN06uo=;
 b=AkuGHG5o6HdsruOT6/dlGiilaoochZexOe82n5CIBanHNm37WzSFyWu2uhmClA8ktfXKFjPx99/flL+72czGwFlDnQdDK+M+HafFWgMTuh9dMXFFz3+IvwzTtSQQryjAPmtBvURrCB17pTroa4gOLr0r3aCiv2om/+WqzG7ICh0=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR0401MB2639.eurprd04.prod.outlook.com (2603:10a6:800:58::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Fri, 7 May
 2021 07:14:13 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4108.029; Fri, 7 May 2021
 07:14:13 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        mathias.nyman@intel.com
Cc:     peter.chen@kernel.org, jun.li@nxp.com, jackp@codeaurora.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v3 1/3] usb: host: move EH SINGLE_STEP_SET_FEATURE implementation to core
Date:   Fri,  7 May 2021 14:58:00 +0800
Message-Id: <1620370682-10199-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0302CA0020.apcprd03.prod.outlook.com
 (2603:1096:3:2::30) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0302CA0020.apcprd03.prod.outlook.com (2603:1096:3:2::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4129.11 via Frontend Transport; Fri, 7 May 2021 07:14:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4597f6a7-0ca0-474b-f0e6-08d91127b791
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2639:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB26396506AA6CFEC63D187C5189579@VI1PR0401MB2639.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:132;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H8KK6k4N94YpKPmqk3bsAHhIYiv9cRP2EI7jR3BAduT8WurZs9LEbizY1j6qP5Nb8Cq0MgIiu+5p0kw8KbU2SmH9+6eRceQ2au1gG9h0bOvViKeclYqXAwlW+IXXdGgvy/2ltlg2oACp24cNPLT+k21U66Sd8f9qSNpueBnddTffMPDQ5a4rk51DRBLnWrwceU+8YXos9XnvAxBSFQRIpg3ESAZAqE6kSOM2TKXSRvxJj98pPL4x/6rJfFvdScYSovGmQPdgbDXbKafumqHXYm3QkoWI6pXPgMux4ZRfql3uTEHsGuCz7VlBS+K1Dd7qz0xwPwfNZ1zX7bFwA4ipbh/yXBxQOOC+5q6HrndL74WPMI+0DAUJoQDmJ65hOuhZ/i8rGBp+NnmvSfjRZ9AwSUu5jNYngt9WV5hui34hu886Z8pNaBeNaTGTwZxXeu8y6O8/+R8MbNM+MeG2gbjkZCq07V5wgbBHw+ifoKmkdrs9Q/2RE2biaqkuqpwF6TACPQK2KwSVT6GMWJqJz1aD1Lj1sko/cRml5lEM1284fCeXSa0bQ4KEx7GEMn6RS/nJ5DMmT/Xlv/MVUg5hWTfL9ui7Uql8RDfXwwRXEG8s8wH0PBJn4m+ShBdOHCdx3+N9sdr/XFRxarsuPdHj2ztWLJ+tWwLie/dFBx8bhjFEXFCI/bXS11X4rMr2ucQUrLpA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(956004)(2616005)(6512007)(66556008)(26005)(4326008)(66946007)(66476007)(478600001)(36756003)(38350700002)(316002)(86362001)(2906002)(38100700002)(83380400001)(30864003)(6506007)(186003)(8936002)(5660300002)(8676002)(6666004)(6486002)(52116002)(16526019)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DrVGAmftEhhxvNNYM6BU5px5NO6aYMgwhqAvE9yGNoQoQnj2jaSjm7zDNU+T?=
 =?us-ascii?Q?CpGwROyyHZwAykPzindRRI+ufIkIBWI4CGPBUH8XxYd0gCfHf30LX+9VE5Tt?=
 =?us-ascii?Q?7CM20TDpjIOGHgcLqRcKlvOA+n2VxcEd+HA4qkSOeDDHuW48IxmgxHeKrWId?=
 =?us-ascii?Q?iME6WeuP0dQvVdcdsYfl76U1TmbQzanY6/zbVjOdwTPcymu0IO2Y6Zxb+jY2?=
 =?us-ascii?Q?3DefoIMsDJZ9XqwjaWsyNGfy81piscCqpP2jrx+TR873Tlpzk0wH7nlvU6hF?=
 =?us-ascii?Q?BF8Cu/oPxsO7q4udACbznHIizSGNbcNfHzFft0F6nC90H4EvaoOPT2wc08MW?=
 =?us-ascii?Q?JSpD79akqgv28f0h9cI06KDmWHRkKyHekdelqCPAYM/t9BR65BMyaRtK8TXM?=
 =?us-ascii?Q?69SW3lurhSPtKt3MoEF9UApAcKmvmCTOFLw6rnbsM8dzlEgFf8tiaPRZoMME?=
 =?us-ascii?Q?rc6pihjEQcEUVjMHjIJ6BpcL0r1FULcQoO9BH+iqsgrpa5kPXq3rcruCnUij?=
 =?us-ascii?Q?Pd79jAmSdRm3Ambucy7m7+e4dGJPyYY1K444qW9YQLa6y6p1qKanfbwwWRiD?=
 =?us-ascii?Q?FJIx0H5piOGY5F+n0IZOTCpYgJRdBzKTYW7T/CUolWcq7T3RX0wsf0/PzKxS?=
 =?us-ascii?Q?gSj1w298yecoOrlJr5mmSp4u9qpom8qI2ml/OZxR3YWiIHPQVn5jw0MxZecB?=
 =?us-ascii?Q?mik3sb+VQNrfIwPFLtUNSBKElcjXEOhIUNY3WMHTUyAwHpRfeb7cCe3940YV?=
 =?us-ascii?Q?mpVq6bgbCQJq214zk8W5pAYN44EgDgLSNen8yBz83EAbI//tIWR8HPG0GJZ1?=
 =?us-ascii?Q?axT2SRzuCBoD/EXrHzL4S1aBVUU4VQeJYLe8kbJY1Z5SY9mQqLG04Ks9oXBV?=
 =?us-ascii?Q?lx7qflv2xW0YMD9ipuwNHxcBmZoN33ouK40qV6n85UgkcQor9O4kcqZRKP7o?=
 =?us-ascii?Q?GjTjLgaL7aXyKgmmdKX2Yx839Fq8I+jqyyiIxLdnNfwdRtiup8d+/5YGAIjl?=
 =?us-ascii?Q?HgqUlqHldkjN8/FoYs2qrp4BhJ1AJO+bxhGDdMqwwdZKXpWV+wI8LH6HdOWI?=
 =?us-ascii?Q?t4tBOmEHi4uRnSZscrlk3rU2XblM+RMW9pXdaJg4F73lLDTMM1/RWB1prgw5?=
 =?us-ascii?Q?c7bnrnTqJFBYPVV1W+sFfVeN9YtQj0NREX9NxADCqUuXenI81fhtswLKUNk/?=
 =?us-ascii?Q?T0lpn0qNW8BnomCnNk6ftijNQ7VxwuZC96Un7WQZiDfHkzgtAnSlSFPuZEey?=
 =?us-ascii?Q?f9CsPqP/puIaL214l121qee7jBMMnmfMiM8cMNcxXljFZvlVj7AziJ+JdT64?=
 =?us-ascii?Q?AslDYZssyv/iQ6USexQfraEh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4597f6a7-0ca0-474b-f0e6-08d91127b791
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 07:14:13.3815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/SCEeTNY+WfFwVEw72gbNhdgAvFHw5N2eQ+f7K7f74fVcqmC286JmPzDKE3dHgZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2639
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

