Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0624464A83B
	for <lists+linux-usb@lfdr.de>; Mon, 12 Dec 2022 20:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233349AbiLLTrw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Dec 2022 14:47:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233034AbiLLTrt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Dec 2022 14:47:49 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AE3612AA0
        for <linux-usb@vger.kernel.org>; Mon, 12 Dec 2022 11:47:46 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1p4om7-00034j-NG; Mon, 12 Dec 2022 20:47:43 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1p4om5-0045Uq-OV; Mon, 12 Dec 2022 20:47:42 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1p4om5-00CZJ7-Lv; Mon, 12 Dec 2022 20:47:41 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 1/5] usb: uvc: move media/v4l2-uvc.h to usb/uvc.h
Date:   Mon, 12 Dec 2022 20:47:12 +0100
Message-Id: <20221212194716.2995569-2-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221212194716.2995569-1-m.grzeschik@pengutronix.de>
References: <20221212194716.2995569-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since the headerfile is only used in usb devices it is better
placed with the other usb files.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/media/usb/uvc/uvc_ctrl.c              | 2 +-
 drivers/media/usb/uvc/uvc_driver.c            | 2 +-
 drivers/usb/gadget/function/uvc_v4l2.c        | 2 +-
 include/{media/v4l2-uvc.h => linux/usb/uvc.h} | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename include/{media/v4l2-uvc.h => linux/usb/uvc.h} (100%)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index c95a2229f4fa9f..454d4374990ea1 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -12,13 +12,13 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/usb.h>
+#include <linux/usb/uvc.h>
 #include <linux/videodev2.h>
 #include <linux/vmalloc.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 #include <linux/atomic.h>
 #include <media/v4l2-ctrls.h>
-#include <media/v4l2-uvc.h>
 
 #include "uvcvideo.h"
 
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 215fb483efb00b..13023cdd37e50b 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/usb.h>
+#include <linux/usb/uvc.h>
 #include <linux/videodev2.h>
 #include <linux/vmalloc.h>
 #include <linux/wait.h>
@@ -20,7 +21,6 @@
 
 #include <media/v4l2-common.h>
 #include <media/v4l2-ioctl.h>
-#include <media/v4l2-uvc.h>
 
 #include "uvcvideo.h"
 
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index a189b08bba800d..7435df0cf2a847 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/usb/g_uvc.h>
+#include <linux/usb/uvc.h>
 #include <linux/videodev2.h>
 #include <linux/vmalloc.h>
 #include <linux/wait.h>
@@ -18,7 +19,6 @@
 #include <media/v4l2-dev.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
-#include <media/v4l2-uvc.h>
 
 #include "f_uvc.h"
 #include "uvc.h"
diff --git a/include/media/v4l2-uvc.h b/include/linux/usb/uvc.h
similarity index 100%
rename from include/media/v4l2-uvc.h
rename to include/linux/usb/uvc.h
-- 
2.30.2

