Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E987635BAE2
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 09:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbhDLHhW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 03:37:22 -0400
Received: from mail-db8eur05on2081.outbound.protection.outlook.com ([40.107.20.81]:18880
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230034AbhDLHhV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 03:37:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tx7yJn4GMaIsfeYbLNL7u+93w5ChA7gC8DeY1WAbEMyyTuRUVnWJlnqCaYW+Z/Yw2UTfXi0TvSCJW5Jpn1H6I/STSHv3ub/tITuO0Q77CTM/ob8D5TyJP0pziq59MJ1cGn/ddn3ODjUiY7/xd8Y5R+GDNWq0WI6gjkSvSAHoF8Ypqjf8/XJ8VFzTSDispNrnJ1rJzHpqdY/LAQbCWn41FNw+lqdtKFunHoxz41vOm0ttnTnNjuToEtrh50G/9y4JYvY9OR7vl6EPM9BGfTrg1IOe7FBagTtgSuUQY7MAWToFTKx/srOkXBToZPyvs9PnMbZ3rjhpGRMQd2wfZ3eeMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fq6ClAOK36DdmhaLzz064GfYkFeLaBKo860BeWqfV60=;
 b=bpir+qpRrd+Dx0j3bb4MAbdim1ztwhzHxSh7+aUP1A2mMr4CqEb8C6jksSPdbxXBUqPhvC9ZAYASR+1x4cCx/FhBWDqRMmm3lZTjOHK5hSoOJ0A3W/DoGzIaGyL2c34uOpUywAxtMhfeYIKCMxahN269RaqlLZbKL3Ty7AC+biVO1g6WWhNCipScHMrldZ/5gAb51ln2X1IePRd7nEhdDm6zdvi2UdeKchwJlsv49XPKbqXfsSoRqrIt6ko7wn18qV1ELX06D7jGZL9nJgqgiXAlE3Zni9DRmHBJcoJysuI8cjCjgU0bTvftrmweWYWX4Anoa1HmjbbICSKztSOZhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fq6ClAOK36DdmhaLzz064GfYkFeLaBKo860BeWqfV60=;
 b=BsF/FWCgZKrHCAl2BqMftfEVOrXeizMs3166m54XFAmW/G8d9crf5jnKGPZCs4NqI8ZA1pET3C4onS41U3kd8+wUcLtsGdK0E2DCDVT0VSDI/3mwkEgYcNLV5MMtkWtVCufisV2yZFwaWUcSGYUTJ2i2Ka1lIHFHGxGTQHV1aEc=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB6784.eurprd04.prod.outlook.com (2603:10a6:803:13e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Mon, 12 Apr
 2021 07:37:01 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::801f:563a:65e:8d12]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::801f:563a:65e:8d12%6]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 07:37:01 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        mathias.nyman@intel.com
Cc:     peter.chen@kernel.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 1/2] usb: host: move EH SINGLE_STEP_SET_FEATURE implementation to core
Date:   Mon, 12 Apr 2021 15:22:13 +0800
Message-Id: <1618212134-20416-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:203:c8::11) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HKAPR03CA0006.apcprd03.prod.outlook.com (2603:1096:203:c8::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.8 via Frontend Transport; Mon, 12 Apr 2021 07:36:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b938d6e-0a23-41a9-7282-08d8fd85c29e
X-MS-TrafficTypeDiagnostic: VI1PR04MB6784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB678457061F34D837F8D5D9C189709@VI1PR04MB6784.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:132;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gHiYoPJIqhh3yF27hM8kU5NjhqARCWlBgCFSvZMUiKy4qnGEBySIJ1bI6+7UIwGAe9MJoVuBobt3T7+X8aLSFT6ZqHf1qKG2ASb7V2KWyaES/WUxIjiENRsYLVPma8qG/rB0IfdwWnhUVqOUIwQR9X6oKI0rwvcVPzIXS5v86ydSwp29FPYc4Lg+Ipv+fCsjrOwsOUOw7L0CrR0VT3RzioAvBSaHVF4bCPq/vUVj1PFs3aD9UuQRhsODOqp5oqJvuDC8kF9umew5CzoWtrsijs3/xxE+GjNNlZ6XYKt2+ferpir48mfwCCYTIQ4X8U7vaSkkqd1bav2nPIWB7F9VPs5DhIIYN7ZUVN6/QAn04nt/ToPS1WmQ7wThPMjkJDSAg4pUnHNv3x9GrDsITP65aqEFQCYKtGnNbAdJlRzLe6c1Txx6vNz2zXmMdyXllLN/P2CLdvNl4DptIjOEH6F7LCv7rgNlk+GZWOhPVBrww0iVuYnkPbIQ4uPOeqjrQYpOENcVDPNQwTYzKZSSdBKD9YpLt8vr5DheT4f1K2HLD6qLiVcflF4ni5dgEGr6ftLLbu6fiuFJb8oFtTtWLd6AF6W7BF+RZtBaSs/qLwhE1ZJahkeRbCYkP+rY3px/44NqICVlXGkz+WEW0EpJUDpwhbZfHX4A8/gKiJwz5H+2Q3YWQtLdXs1nN2XA9STed9/M
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(66556008)(2616005)(2906002)(26005)(956004)(316002)(6486002)(6506007)(66946007)(83380400001)(66476007)(4326008)(30864003)(52116002)(186003)(5660300002)(69590400012)(8936002)(6666004)(8676002)(6512007)(36756003)(478600001)(16526019)(38350700002)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0a0azTJLjhEcTz2cO4kGoD6ZTQALyjH5oLskGxeH/EZkwtE8xWnmSX8RDKm3?=
 =?us-ascii?Q?rXIS+GK99D41A3X7NW7hxABvYwRTuBdTuQrk0+nhFjU2tbFTiL7DtAlJ4rbk?=
 =?us-ascii?Q?1FoWj6kAmwzrkOI5/CBDeEB6+tYxyWdkzdTPPmYx5DSTQGRsI3t+Zyy/fAnU?=
 =?us-ascii?Q?dQ1lWfiyPDWyVeIsMRmthMcTMM0FqgOYtcC1dApPwnZ8RqSi7qHtjgzg1vO0?=
 =?us-ascii?Q?dv9Kgg6K+qBitRcGPgayv2KfjFh4A9XyNC9GJOum4XJPVrO8UNkuKMWZzJQw?=
 =?us-ascii?Q?22x4uwHNmX3fOgeSO1Csw+qaKS3ZiMhUnJaPI07qsf0DmVhXYx+2DA562cw4?=
 =?us-ascii?Q?rh/MlOhDS1HljptfwdwyHRKBfTVFoSzLi7QZpFDc7OvkzSfBXBmrGN5YeN8D?=
 =?us-ascii?Q?eJTkuY8zugBlyqMZ3CdwiW+TKR8Lf9FECG1cN8rb3hHLsWtJCdC7OGgKIqHe?=
 =?us-ascii?Q?ZazUkoGG5vdIn+UX2btYGHtZr0/+PbGWiIcKCwdAohdOGdvgs8YSx8ehnuLR?=
 =?us-ascii?Q?BbXdDfn/fe2H2+6OrV51e3r/mbKOOFnFfTPw2hunrE7YTIUCSghIUyZHSTRN?=
 =?us-ascii?Q?sb9lKwHHGEGfS+gUlO+8fJ8LsO4/Lf/pRNHjWv5M0dgBsI6/QbQeLUJfkH8z?=
 =?us-ascii?Q?hXRFNTuCp0Q3LoBX2gSuSvy6UfkP0gO7MgUFV/tBySfCjhSppQgmGwXF3Pkf?=
 =?us-ascii?Q?YM7pTsqEfKbsCZuujMRtO1HWEo9OHba2cawD6tBgh2iZzsub3A5Z2KPSPLpV?=
 =?us-ascii?Q?hrDp8NRf+NJN2LJ6Fd48Vn5kQLoZd/QLcsgtNZkw7QUIrIim374OzCqNXo80?=
 =?us-ascii?Q?AwLn9g8kOB2VEt4laZDx+MXqFwjdzLFlOCKZ7uYDPGOehN4ETRtUZGxKA82e?=
 =?us-ascii?Q?QrjfXIlSQUPaX/R80EwGaSafLKzPP8e8zVivvhcI3dSY/Qj1B5yLiuxu7nZF?=
 =?us-ascii?Q?zwwub9aYnVguMZn4MDpJ3V978fHu4aiLMevx8aDDNErvUsPOEYzf7PlL6XNu?=
 =?us-ascii?Q?h/+baiqt04r5B+nWWHdmqT0ThC7v38hb++H4fqZN7tHZNKZ1brhuF7WwdcAQ?=
 =?us-ascii?Q?FYLpvq+Mo5wDgQ2FcCoKyJ76kxwmvbbieFWF2l54CIknA0YkxBkcF+cK3JWx?=
 =?us-ascii?Q?cDp2MsaqbwraBOmuo3to4WA2WNYxk1rItGXYV6+aHff+SmboTcOqY6Ns9h/S?=
 =?us-ascii?Q?fFuH3iD42WZv6oq0+LPIFK+19avGC5v+ALtlO0GXTHjd+zR8ASz7V7Mywu6z?=
 =?us-ascii?Q?Co5r9cX1jmCC5vu1AR9WFVk3AMSDfedDj9a6k6H76zbg5epmcUfUxrPNaMdG?=
 =?us-ascii?Q?R1NReJIiUVCri0NwCdBxPubG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b938d6e-0a23-41a9-7282-08d8fd85c29e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 07:37:01.4084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rae1imlBJ6lTTsREzL4qEmIlAJGsobbSDun1GeA86N/J4PHNLF5jGNGjSCD467P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6784
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

It is needed at USB Certification test for Embedded Host 2.0, and
the detail is at CH6.4.1.1 of On-The-Go and Embedded Host Supplement
to the USB Revision 2.0 Specification. Since other USB 2.0 capable
host like XHCI also need it, so move it to HCD core.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Jun Li <jun.li@nxp.com>
---
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

