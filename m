Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3ED2AB2FC
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 10:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbgKIJAB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 04:00:01 -0500
Received: from mail-eopbgr60083.outbound.protection.outlook.com ([40.107.6.83]:56129
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726482AbgKIJAA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 04:00:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JrP3F3iJogMiiAOv18vdZ1CATglh6iRXWq3KRGTSwzcmQ/l9eItFZPvrTBV+h0OwYGcoDB9s11zcmTaQP9J6jNajxBm8UKS3QbPYDSi5UUp6/0orZXho7M5fvs8V737iEriYHW9dBHTTabNi/JGv7y9aqhkrfG45YhsnHl9ASZ+dP9A5eapIY9Q0iHOziCsM/0GeWSY6ZvW/kGyOmd5aq4C6rr4SDq9+cEe8qYBgoymzjb6iiBtCbdmJUIUDaRkx+E/mTVJ+U+A1BE5OCOx0BmsxF5o4ASIoqS7dOMhM7NGUuUoOsxD1sQ6/g+ZuE4jwHzoM0lHdfYi2y1JzgPUMRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAaRGyaFvUdcJKPlwWqr1+g4a2JlcA9m+B7TC3vgtMM=;
 b=DXwWH3dAFOHSKupbLItBQL+PaP3CVJ381ms0YP27nJMMuFnWBf96Q2gM6M8rbbywn2pZ63m9Bqc+OgW1TF7sGSPkNx3OOcAqVFG0oHCTjiLCwCR4lH/A9LU4LopKwzhuxFI01ZYsMr/56iwdQcgEQQl2Ia51YB3aovWovBDjCt85oPIFk7GWBLzyqnP9dZkjaZU5ty8GtK7lmGOliFxFO6ubTYSjGv5+Zx5EUFmLpHGt8e/TENXoLKwzlNbxAxmds5Pw5L9XLGsyyYyF/DwR7+C2MRTP8Wh0IMuHWC79CO8/agdtP+11/abnjsgkfGLCbHcbMJDui/86lhq1hZs9nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAaRGyaFvUdcJKPlwWqr1+g4a2JlcA9m+B7TC3vgtMM=;
 b=Mpv8NP0uZaPDlXEDn4Chl6m8Lx847wagegYD9SM0UE7CHwJy5t9xD4MAtQ582GPYyLwQL0yluZBPo40NP3Rw13YseFxQXPemQUqJOVoLGBnfid1wmoWivXpafkohk/JbIpY7fYsRCkLKNF2/LDOtlqbvqBd4Sr/Cwj7j+y4npzI=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=wolfvision.net;
Received: from AM0PR08MB4049.eurprd08.prod.outlook.com (2603:10a6:208:12c::33)
 by AM4PR0802MB2130.eurprd08.prod.outlook.com (2603:10a6:200:61::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 08:59:56 +0000
Received: from AM0PR08MB4049.eurprd08.prod.outlook.com
 ([fe80::ddaa:c243:6820:818a]) by AM0PR08MB4049.eurprd08.prod.outlook.com
 ([fe80::ddaa:c243:6820:818a%7]) with mapi id 15.20.3499.032; Mon, 9 Nov 2020
 08:59:56 +0000
From:   thomas.haemmerle@wolfvision.net
To:     laurent.pinchart@ideasonboard.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        m.tretter@pengutronix.de,
        Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
Subject: [PATCH v2] usb: gadget: uvc: fix multiple opens
Date:   Mon,  9 Nov 2020 09:59:41 +0100
Message-Id: <20201109085941.26194-1-thomas.haemmerle@wolfvision.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201105103758.GA4033354@kroah.com>
References: <20201105103758.GA4033354@kroah.com>
Content-Type: text/plain
X-Originating-IP: [91.118.163.37]
X-ClientProxiedBy: VI1PR10CA0101.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::30) To AM0PR08MB4049.eurprd08.prod.outlook.com
 (2603:10a6:208:12c::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wvls01.wolfvision-at.intra (91.118.163.37) by VI1PR10CA0101.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:28::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 08:59:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 112d8264-0120-4a2a-7db6-08d8848dd462
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2130:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR0802MB21304B9E266607DFEB800899EDEA0@AM4PR0802MB2130.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QuW0/IcFOFHY/UvqCHMWaSQc5HnmdBOSqJggVh1Nnn5v2sIiBg8DXitfUHr8+VmX2i/zvqXZbnAOkWbIXZqN/ouJQ7Ns7YqXDOXmNaVrjsj853hMCvUogWiQBEjzOh3PC2IVo4Q/vmpyBfTqHw0zC/KyAydAvMjxBpd6nQ6BlTIUvNJghjBb9+sBHlxWswjQhQynDHqoX7nAott6sMTTjPtKhqGQDxzTLOD9RcQhrXKmzXnjMgsmb3Jp+UeHcxUlZOmhjxea6MQXf/nDsvv4hc2dMIouxNnTooGf7W0QKsi0nrMnkkFabEDDUSlHCqekzOWDuL3YM3lFvKMjyf3bNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4049.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39840400004)(376002)(136003)(346002)(186003)(16526019)(26005)(6506007)(4326008)(6666004)(478600001)(2616005)(956004)(9686003)(6512007)(83380400001)(2906002)(36756003)(107886003)(52116002)(6916009)(66556008)(66476007)(66946007)(6486002)(1076003)(8676002)(5660300002)(8936002)(86362001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: e5J3gHHdE5TWaVU+OKEsIOMAJO0U1BVdraIGKNQ3faYI56FKItLMMGmMMihkgLUZS/u5vZfA4+KJVCuQag6lyZWeYtOfnD9Rs791uYxCllzRU5XyMERFz5TuJBIws6FCTq761tMExZPgoJe5V/XbgZ+ya6w+E/E08GJWlf0b7kLIpQWyWqxFoH+mPy4aMovEFHQ+oNOTAypFsIXcs3/ZYXneMkZoI17q4EGyxnJRG44Zu+9dZ9kRDfumlFM/pICmDONtiTMiYJFlQhk4Io907hCKPQjhPtlRSWt0LBz5VgHhlR82wqD6tKDo13WCOBmmw3HoSK30VM3kva0zEdJBjwZC3w6uSR5CshS6+KXO2hyVCraav2B4b+K20tRTPrFyqhbpSdXE+dKcHggOLbCe8HnRJj2HIV1ZR2aUfLv+zuNRKVyIEZ+nxAvrG3H+iDGjH6VOH5H1m9J1f44UWhwwzS+wvUUz5isKb5dopTzFZDSUU5kqMsiKy9KcHLmHkTJ36cBppKHKXY5C1f/YLYoW0jTCJEwZIPTVdIo5etfun8wQ3THmrcmPHkGbf2rxb26cmaBrshtdh0rDT3TRcfnuzIbUwxsQppOECEaqz3x+K2Icu73UczsTN4uFleZ6Zn+CCoDkgqerv7EfqVxce1w1VQ==
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 112d8264-0120-4a2a-7db6-08d8848dd462
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB4049.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 08:59:56.3933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvTsoqCwZ2GAOy9i72Im9rcOFt+ssjZ1DFg7SXE11Sg3qjcQMuxcWe5iJ5x3s8+TZdrjpT/IZn7/ZaWPdBnYm5ZhXBEd+W6vP2T/tmGhMN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2130
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>

Currently, the UVC function is activated when open on the corresponding
v4l2 device is called.
On another open the activation of the function fails since the
deactivation counter in `usb_function_activate` equals 0. However the
error is not returned to userspace since the open of the v4l2 device is
successful.

On a close the function is deactivated (since deactivation counter still
equals 0) and the video is disabled in `uvc_v4l2_release`, although
another process potentially is streaming.

Move activation of UVC function to subscription on UVC_EVENT_SETUP and
keep track of the number of subscribers (limited to 1) because there we
can guarantee for a userspace program utilizing UVC.
Extend the `struct uvc_file_handle` with member `bool connected` to tag 
it for a deactivation of the function.

With this a process is able to check capabilities of the v4l2 device
without deactivating the function for another process actually using the
device for UVC streaming.

Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
---
v2:
 - fix deadlock in `uvc_v4l2_unsubscribe_event()` (mutex is already
   locked in v4l2-core) introduced in v1
 - lock mutex in `uvc_v4l2_release()` to suppress ioctls and protect
   connected

 drivers/usb/gadget/function/uvc.h      |  2 +
 drivers/usb/gadget/function/uvc_v4l2.c | 56 +++++++++++++++++++++-----
 2 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 73da4f9a8d4c..0d0bcbffc8fd 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -117,6 +117,7 @@ struct uvc_device {
 	enum uvc_state state;
 	struct usb_function func;
 	struct uvc_video video;
+	unsigned int connections;
 
 	/* Descriptors */
 	struct {
@@ -147,6 +148,7 @@ static inline struct uvc_device *to_uvc(struct usb_function *f)
 struct uvc_file_handle {
 	struct v4l2_fh vfh;
 	struct uvc_video *device;
+	bool connected;
 };
 
 #define to_uvc_file_handle(handle) \
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 67922b1355e6..aee4888e17b1 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -228,17 +228,57 @@ static int
 uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
 			 const struct v4l2_event_subscription *sub)
 {
+	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
+	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
+	int ret;
+
 	if (sub->type < UVC_EVENT_FIRST || sub->type > UVC_EVENT_LAST)
 		return -EINVAL;
 
-	return v4l2_event_subscribe(fh, sub, 2, NULL);
+	if ((sub->type == UVC_EVENT_SETUP) && (uvc->connections >= 1))
+		return -EBUSY;
+
+	ret = v4l2_event_subscribe(fh, sub, 2, NULL);
+	if (ret < 0)
+		return ret;
+
+	if (sub->type == UVC_EVENT_SETUP) {
+		uvc->connections++;
+		handle->connected = true;
+		uvc_function_connect(uvc);
+	}
+
+	return 0;
+}
+
+static void uvc_v4l2_disable(struct uvc_device *uvc)
+{
+	if (--uvc->connections)
+		return;
+
+	uvc_function_disconnect(uvc);
+	uvcg_video_enable(&uvc->video, 0);
+	uvcg_free_buffers(&uvc->video.queue);
 }
 
 static int
 uvc_v4l2_unsubscribe_event(struct v4l2_fh *fh,
 			   const struct v4l2_event_subscription *sub)
 {
-	return v4l2_event_unsubscribe(fh, sub);
+	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
+	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
+	int ret;
+
+	ret = v4l2_event_unsubscribe(fh, sub);
+	if (ret < 0)
+		return ret;
+
+	if ((sub->type == UVC_EVENT_SETUP) && handle->connected) {
+		uvc_v4l2_disable(uvc);
+		handle->connected = false;
+	}
+
+	return 0;
 }
 
 static long
@@ -293,7 +333,6 @@ uvc_v4l2_open(struct file *file)
 	handle->device = &uvc->video;
 	file->private_data = &handle->vfh;
 
-	uvc_function_connect(uvc);
 	return 0;
 }
 
@@ -303,14 +342,11 @@ uvc_v4l2_release(struct file *file)
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
 	struct uvc_file_handle *handle = to_uvc_file_handle(file->private_data);
-	struct uvc_video *video = handle->device;
-
-	uvc_function_disconnect(uvc);
 
-	mutex_lock(&video->mutex);
-	uvcg_video_enable(video, 0);
-	uvcg_free_buffers(&video->queue);
-	mutex_unlock(&video->mutex);
+	mutex_lock(&uvc->video.mutex);
+	if (handle->connected)
+		uvc_v4l2_disable(uvc);
+	mutex_unlock(&uvc->video.mutex);
 
 	file->private_data = NULL;
 	v4l2_fh_del(&handle->vfh);
-- 
2.17.1

