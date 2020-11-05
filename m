Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E432A7BDE
	for <lists+linux-usb@lfdr.de>; Thu,  5 Nov 2020 11:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729783AbgKEKbz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Nov 2020 05:31:55 -0500
Received: from mail-eopbgr130078.outbound.protection.outlook.com ([40.107.13.78]:34628
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726152AbgKEKby (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Nov 2020 05:31:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDjTpzBAh2yzvq4JmRqw3ULNPxB5P+n06dlvrabQ4xmM2ksF9SW9g2+V0NU/TemdLhnTXPyFokykLwe22XhM8amlQ5F/e0UzPF0CRkWv19SA2t00dR0xNwNTrr/HgyCbjgOzHgEyiYbIzLCM+fGueveROfboXm7hCOun1vBjgeGHW9O/EBj7tZBjjCfF1bEK6cvu9H/AaQ3fM/bLylBmRHXMc1C0+YhxuhS92jnSUo3NwHiMr+jGlx4+DK151Sjz3TWvuyAslLTAlb+rUyjNeOU4eD98VOdnZ2HHc64x0GkBRlYRjnF5ZWuGmIFmCFoM4LmNU0tMtDKP3xBOdS0HLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgAKnibtHANhf1yqSQzIIAd+Hk2q3xzVwx7/DR1ND+w=;
 b=co040U12KySXgqg4vSV2/1e8EWJ6JHR+YZhf4R54j4psAIiQTZsOMOvBGGhs5iFRZMMCEpBpsbdTpPhVQEtmqPDAFF+j8wmiApOkUNaxSUgwboOTQD+Ta9UMJwQWAXxOH+8Cjzfoe2GRHSlXMalGePisnSR4VAXsFbkKo1mYYfiinQx+ymu990jewr0hliEfCVvF3lUUwka1ZNRATwj3gDZDb5wuzPiG7LqnFeaLqVJfUrfHOhFPZl7Gcm5UEge6F4WB/6P2Y22Et/yQTesLlnmhGZ6MjX+D4YCUDgPJws9pHl71QLGW5w3YOHjLr4PxkPWOFdzQdoxb5X4CK2KzFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgAKnibtHANhf1yqSQzIIAd+Hk2q3xzVwx7/DR1ND+w=;
 b=zl6usQXeqSRF4BK4m/NHAvqU3dcmmS1VZjjFVt8sDIB3SQ2k598X3lKKrrq6pG+ZjWJeBspDzgRRRRY8D41TkUABnUcoQ6a5KwI9uxpbqPzOKWEk5WkaH1lLRMVhWBljoW4MUOHxujQSBhChhkHhZwqz2sZbGVKxMzXOmnJUXhM=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=wolfvision.net;
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com (2603:10a6:803:e5::10)
 by VI1PR08MB5390.eurprd08.prod.outlook.com (2603:10a6:803:13d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Thu, 5 Nov
 2020 10:31:50 +0000
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::2443:235:9005:87a8]) by VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::2443:235:9005:87a8%4]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 10:31:50 +0000
From:   thomas.haemmerle@wolfvision.net
To:     laurent.pinchart@ideasonboard.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        m.tretter@pengutronix.de,
        Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
Subject: [PATCH] usb: gadget: uvc: fix multiple opens
Date:   Thu,  5 Nov 2020 11:31:19 +0100
Message-Id: <20201105103119.11419-1-thomas.haemmerle@wolfvision.net>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [91.118.163.37]
X-ClientProxiedBy: VI1PR09CA0126.eurprd09.prod.outlook.com
 (2603:10a6:803:78::49) To VI1PR08MB4064.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wvls01.wolfvision-at.intra (91.118.163.37) by VI1PR09CA0126.eurprd09.prod.outlook.com (2603:10a6:803:78::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 10:31:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e32e4d3-93aa-4281-a67f-08d881760136
X-MS-TrafficTypeDiagnostic: VI1PR08MB5390:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB5390F3649E75CC7C338448EFEDEE0@VI1PR08MB5390.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SWGfqefZQn5HJi4YmpX3hqO8GKVHAvza+IEed9CTaOxdZLO9ySWQ7GCTVLyNPopwxTNTQuuXdPL9hJVd9b1D9GQyoCYYXeavO3wYR0JanvzQN1ZitzV62zQEqohaNAnfU07P8vHJvyrY4q6Olioa+s7O67EfxEHFienJ5FUUELx9VgkvD6TeP8JmPXtHY5xkWqhmWLxVobc9Qr5p7Y//DlVj6GcDRdE9h0SKqlgwN/QAgG1vsflPVPzzZ79LRQqDQVB7klsxJC0p4ICJqf6B1kHX851oxRmlbakpGKS/WvAOk6HN56jRwI6d6mDrocDNy38/vQS6Pc2rno2BSQdPYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB4064.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39840400004)(346002)(396003)(376002)(9686003)(2906002)(478600001)(6512007)(4326008)(6916009)(6666004)(6486002)(316002)(6506007)(66476007)(26005)(86362001)(956004)(52116002)(186003)(8676002)(107886003)(36756003)(66556008)(2616005)(66946007)(1076003)(16526019)(83380400001)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 5yom51FWyQozk8j7l5jZqnnysPI7C5xR03RbSf5lSE6I+X+wQwXMGNWJP76X8+T00B14WiNv0skj2C80zm5D4dLrmH9Un7NC3dmE1Luz6dQJmGTOg7bePee1xosuw5P78ZA9pAxLExluH43saSrPac/sw88mHeiYRwblIKcCnDZFhHbPDra5Ei3A1uNN3bIaCYb8U6qi3OdrdGXS3DRTALx/fwFhmtefjTQPyw6ysltg4DLlKgT72U1GezewgQacELZ6CyOYXRVQyEtSxN40lDjMMxAx+6CJ+enrRTAqyxwSPri4BNgFmQhlP2i84C1GpZtahw/ZK5/ar7DG8JmvIIJlPomlNlr+5ysXtw5ZdFXS/90MvA3IX+hoCzCaPlaDFPVSlMd7J5BTtyxidIcpk0KQr6i7t0epC9DretTyetAzaJ70zvZs+4f0sSbok3pITn4FaLHtm58cYbAlUYpmNnGytBYiW++y1MvRePya5mbFg+EmpoJ6LA7Qg+EXthOKL1Wwayml+Pq/X0dvYZkSJrpjmhldNB46KH8yjkI6+ZK7GUc+3SfrHVakHI0riMI7FovCk16x20J6S+Q/xxycYwGP2nBzF7ZVrPX+3Kv5gB0imTcZcG9zAkxf5ic9HWN2VDdUSyyZYPzKPZnycs+Xng==
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e32e4d3-93aa-4281-a67f-08d881760136
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4064.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 10:31:50.1466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCZU1g8TuQ0771T92/wcUMfzN/m+9X95nC5ndvzSGiDAJL2bk6QklU2xewwTY7XEpTKtBPoucBzXOLKj7x9wNSUt7dO3WSvFFUhZKbk9Egg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5390
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
Extend the `struct uvc_file_handle` with member `bool setup_subscriber`
to tag it for a deactivation of the function.

With this a process is able to check capabilities of the v4l2 device
without deactivating the function for another process actually using the
device for UVC streaming.

Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
---
 drivers/usb/gadget/function/uvc.h      |  2 +
 drivers/usb/gadget/function/uvc_v4l2.c | 57 +++++++++++++++++++++-----
 2 files changed, 49 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 23ee25383c1f..deeec2b80786 100644
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
index 4ca89eab6159..c0c2588b0efb 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -227,17 +227,60 @@ static int
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
+
+	mutex_lock(&uvc->video.mutex);
+	uvcg_video_enable(&uvc->video, 0);
+	uvcg_free_buffers(&uvc->video.queue);
+	mutex_unlock(&uvc->video.mutex);
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
@@ -292,7 +335,6 @@ uvc_v4l2_open(struct file *file)
 	handle->device = &uvc->video;
 	file->private_data = &handle->vfh;
 
-	uvc_function_connect(uvc);
 	return 0;
 }
 
@@ -302,14 +344,9 @@ uvc_v4l2_release(struct file *file)
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
+	if (handle->connected)
+		uvc_v4l2_disable(uvc);
 
 	file->private_data = NULL;
 	v4l2_fh_del(&handle->vfh);
-- 
2.17.1

