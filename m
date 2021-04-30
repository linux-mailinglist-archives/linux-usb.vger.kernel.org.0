Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32CF36F5B5
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 08:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbhD3GdQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 02:33:16 -0400
Received: from mail-eopbgr70078.outbound.protection.outlook.com ([40.107.7.78]:58595
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229482AbhD3GdP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Apr 2021 02:33:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9+hjR593M8KkElbv2kOXH+kj9h65XzNdF2U3CwMPwhT91FPidofPsmTY7DISjA2cC4s7ZhCiPfc5BpeieDyE2GxRxKMWUdUcYw1s+oVQIleUrikvewokIwrO4ZbD4c/irTY+e0FE2CoTaOCyKVqePvM1euycDcxluLm0lWiXORDpn+cMUzwdN8qQn+ZCGHOY9wydVKu4qcmhHj4RXBZywILAGRoZh7qpYw9uMEaATAQU/UcAhz3nNf6CLcaNsuBSRtUPNlxHAdWrY4xYt64jgWkvK5ziCJzZpL8oAxsilFZ+HSxwdGac2CFgDjUEliAkW3LTkzk5QnjPKqyExBlHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvqkXWHGh+Mm+m9O8ozsaSgt1PAxTzoicHFJ7e1+6q8=;
 b=Beli624jENBov+m3i22XMXyi9pUdSh/dshwCLcQR+wBM5PawOgXiNdbydgGedNlksY6uRU/ryy9DVT1l/4mgIPxzsqtTU6LorGhgm1eSYpjnkyeoDyLI0fC+VUXmZQxx3PMsdDpy6sIFwmjK0WxytWFCMLfGOaB0rSNO/lqWwbOfsKdAZeRIAa93FXqGf0hussYLMTPy3yYiTuDodDrRleNBUTZNqOXcnZFjsQQIwsFrxqXMt3eCVHZMtbHOdosdOdWMw6IyQK9JjZyanU8SDwglrIvHNIt48g9EqmQrIzYGjuGp5FW90GEn01clf0uUWp2YWGyELvXHT66l5d+2Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvqkXWHGh+Mm+m9O8ozsaSgt1PAxTzoicHFJ7e1+6q8=;
 b=eHZj9b9OFt/75IweoOAjr/cYXirwKvDwJr+4D9FKgWBXO6sJT3r12VAPVHI6YazbbdVsYppEaMJi+UP2J6Tof17mXLk9S5YIvwHoAjPQ3aRSPv7xt+FjxObQhz0RabbsAdyg1AyudANEwdB9NEHlIin7hQkxcPSJ7MSJfzVtLlg=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VE1PR04MB6749.eurprd04.prod.outlook.com (2603:10a6:803:129::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 30 Apr
 2021 06:32:23 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4065.032; Fri, 30 Apr 2021
 06:32:23 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        mathias.nyman@intel.com
Cc:     peter.chen@kernel.org, jun.li@nxp.com, jackp@codeaurora.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v2 1/3] usb: host: move EH SINGLE_STEP_SET_FEATURE implementation to core
Date:   Fri, 30 Apr 2021 14:16:31 +0800
Message-Id: <1619763393-20029-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:203:c8::15) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HKAPR03CA0010.apcprd03.prod.outlook.com (2603:1096:203:c8::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4108.10 via Frontend Transport; Fri, 30 Apr 2021 06:32:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e62e25c9-bf1c-4ad4-96ad-08d90ba1b671
X-MS-TrafficTypeDiagnostic: VE1PR04MB6749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6749BFC5A3F5B0F97F9B1FE5895E9@VE1PR04MB6749.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:132;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hqcm3R0J0cjBmzOCFkdVG941wcbg6MFIKpkxYi2ehlIA8LiQ9K37yuaV6LG76l0coUlqfFjzKBU2n1lqD3P5ZY3ZJ26Y8C2LeUyJpBtD4XybnLyIWIBtSLDb8MoUo2Pou+O/ZEyhKkq1Roxlb1ysQC5Kts5t099pjiuEo+KGho4L9n3JOtG2vYuWiKxUf8+kbDlsNT6D++NaW00X4OV+RA2kQHdGyRTtZG4yvS1B+fE87YZBu4K3P5BAPVV7UIZZE+XUScjf3AMdLlzVP4yPz9v8fi9oJI2fWRkxDHH6sv21XKs4iV9kHj6TIpcruUVkjUs3ezwE9PeAG4DbpxSSX99gYB/pJ5dUCzWRzfmGWJrFVkRE1/jGmuq23uoe420iYHvOvJAal5wfIpKNcqI9jNgye4s3r0Sc0VQFdUZ87C2SWi9k324s1TXarKs+g648dXyynb4HDiA1Pbi7VUtSuWhowiJbYxDB8Q2hjAh40n/GYuU3HoSkfgSnSC6N4zrSv83YjHJWl9SIANII6KjiY1e0Hw/7iudM/LDkAuCCncP8G4md55SlHKMN/Ld1dQYvZzJeyb5BdRKvUPJLcRh1orQec0UpJZ/APqi1vATTlSvOIjQl+Z3gDtbwKKgPCGQs+qyEvfhEVcrZh+frawUKKzhyECpdC9kFOGrcXJiu2i4tdCMAhR1uiKszf5owMKLm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(136003)(396003)(346002)(478600001)(8676002)(2616005)(66476007)(36756003)(5660300002)(6666004)(30864003)(86362001)(186003)(6486002)(8936002)(6512007)(2906002)(956004)(26005)(16526019)(52116002)(38350700002)(4326008)(83380400001)(66946007)(316002)(38100700002)(6506007)(66556008)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZF9MXGW2Zx/d/ZUs15Q8oe7lBSAbbA/HjAguFtj/kc1pM5PtFWYWfDTh9TO0?=
 =?us-ascii?Q?zRGCtkf7u5c9DvULgZ4ecrw+JB16DXfI3MrN5bBtHWEzDOzRXFyaSAvZJ1Yb?=
 =?us-ascii?Q?kwetjwt+frup6FTtuW1nNk5WZ8ZnEADWx2c0m4Xy5eaTMmGf8r2WVo6iopYw?=
 =?us-ascii?Q?Ksj2cGtz2DNBNWQ0+fB9IyZsiIlVoexOZwBPZt02y9qgRRBihgwCGEf24S69?=
 =?us-ascii?Q?K7hFcQ3ZlJPxMuviGnaGkOBBvqBs5+W0Sknqx8uMF5TLZP/iD/hOk7LeqRqR?=
 =?us-ascii?Q?2JbsLKsVAYLV+p0D3f1MahgrC3IOLjaPSl/HiL2fYfvWi8iEHwO2PNqRyvDH?=
 =?us-ascii?Q?pUrPO0Y+d2mwHAGK1wsHojZWDxdbAr21A2OCE/QV8lCc0AMNWlhEW5jzRd/c?=
 =?us-ascii?Q?9GnjH+IM4z3S6J10lSludr1Gotpq9CQ5gXv//WCssj/x0iV22fQDy+ZTUDti?=
 =?us-ascii?Q?RPxdCs83ZcKK3BVt3fy3KBixRH8lId4GbftmB1mxglNC/pLIw4SASRdhQjQj?=
 =?us-ascii?Q?0vK1c+eh7znOKBQs5O2WGv/M8yI1b11CVGZdwRRq56gdTTxE7svDTisbSMNg?=
 =?us-ascii?Q?lktr220PN02N0+S5F3fLAFf0EURs9Jml9GmlC7YGKqRXuwo3VfSFVDmh6iNn?=
 =?us-ascii?Q?9HaIh5ItJbGD5mxLiYyYg+6WF5oiPUkTkhEMYkT5ejtdMVlUIuJ8MjJiVsY0?=
 =?us-ascii?Q?0BkCasia4QSnqH5uq/rZjQgqjN9SIIeyX6jMLc+TedBnizu/McWmXmXkYFYP?=
 =?us-ascii?Q?KHdvGiQAORfsd01ajCsrFQ6knm8bHHIy3bZxwylTa7mFb7bR86VfADEVXW70?=
 =?us-ascii?Q?hz6EfiJkPXwORkDmOkvmto/0yvsrQD+SS9erh77S1blHscKNlLMq9H2bfTOt?=
 =?us-ascii?Q?kOGGloIUDOvD0qsSViOfO4yOrSmUeqJPOMRqqce3Hdht76TzYDSzHQpEJJaO?=
 =?us-ascii?Q?EzR2TYvMkDGGAxsoupT9ooyWshxhD41pHaUkW7lYopA25E63W4HnrkaVGINm?=
 =?us-ascii?Q?GEK7UW77q1UgCLIadr4n3GV9sjWmW1Kff0KLLfKj5L7Bblv8rl+/kV6VCP0V?=
 =?us-ascii?Q?DilRPohslHF0lcnEOidTrxrcT0BtCVnIxwKndS6Gnkx6pWccA+mo6bGvrYtE?=
 =?us-ascii?Q?UhXscPVpjbS+HTHcYDgI6+ab7ID+1dBOYJeHp25zYnMg8/Y9VPVuZzyaaVBq?=
 =?us-ascii?Q?+A4uL3BdyCUqdfh0lDFg3K3/s2rIWEolkEbIWd81GD2mtZ6NQ3VwC2+9lony?=
 =?us-ascii?Q?NSgFJVmskqq+iOqHTTm+4rEfxqwKbmOWTSYLzpxMw1xmLNG2opb6rbqkzrhJ?=
 =?us-ascii?Q?hL3P+k0KFUjl2qBbJN9vgJBH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e62e25c9-bf1c-4ad4-96ad-08d90ba1b671
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 06:32:23.0632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3PcAqvQxqPw91D8Roz2ta81ls6paoVJTmaQhFwF8BeuIx+Kn/vjGNrlrhprby5h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6749
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

It is needed at USB Certification test for Embedded Host 2.0, and
the detail is at CH6.4.1.1 of On-The-Go and Embedded Host Supplement
to the USB Revision 2.0 Specification. Since other USB 2.0 capable
host like XHCI also need it, so move it to HCD core.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
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

