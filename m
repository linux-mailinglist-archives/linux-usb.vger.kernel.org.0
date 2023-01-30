Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28BA8681330
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 15:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237627AbjA3O25 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 09:28:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237642AbjA3O2e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 09:28:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 244D83EFDE
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 06:27:08 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BCE8121A;
        Mon, 30 Jan 2023 15:26:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675088816;
        bh=WSWcsexcwcTvojhwvofeTyDhmtiElkwLC8iP6eqydfQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cpueFXH1pKwHf+vyaJFS0PDaD9taPm1KfjSJcn0sJFrOBd2j9FAPjt0cAOsdpnYXQ
         GUzXPmEc6i9wupm59b0oDrUb8/eiRezIC/D5UHjw8DYyxKLEZPe1eYwXDHo9OGwRlk
         pzHLzk6ofzwZB4KFgUJJD7SDsU47E2DG3AHyejjM=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 5/7] usb: gadget: uvc: Remove the hardcoded default color matching
Date:   Mon, 30 Jan 2023 14:26:37 +0000
Message-Id: <20230130142639.217885-6-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130142639.217885-1-dan.scally@ideasonboard.com>
References: <20230130142639.217885-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A hardcoded default color matching descriptor is embedded in struct
f_uvc_opts but no longer has any use - remove it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3:

	- None

Changes in v2:

	- None

 drivers/usb/gadget/function/f_uvc.c | 9 ---------
 drivers/usb/gadget/function/u_uvc.h | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 32f2c1645467..fbb57a0df57f 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -803,7 +803,6 @@ static struct usb_function_instance *uvc_alloc_inst(void)
 	struct uvc_camera_terminal_descriptor *cd;
 	struct uvc_processing_unit_descriptor *pd;
 	struct uvc_output_terminal_descriptor *od;
-	struct uvc_color_matching_descriptor *md;
 	struct uvc_descriptor_header **ctl_cls;
 	int ret;
 
@@ -852,14 +851,6 @@ static struct usb_function_instance *uvc_alloc_inst(void)
 	od->bSourceID			= 2;
 	od->iTerminal			= 0;
 
-	md = &opts->uvc_color_matching;
-	md->bLength			= UVC_DT_COLOR_MATCHING_SIZE;
-	md->bDescriptorType		= USB_DT_CS_INTERFACE;
-	md->bDescriptorSubType		= UVC_VS_COLORFORMAT;
-	md->bColorPrimaries		= 1;
-	md->bTransferCharacteristics	= 1;
-	md->bMatrixCoefficients		= 4;
-
 	/* Prepare fs control class descriptors for configfs-based gadgets */
 	ctl_cls = opts->uvc_fs_control_cls;
 	ctl_cls[0] = NULL;	/* assigned elsewhere by configfs */
diff --git a/drivers/usb/gadget/function/u_uvc.h b/drivers/usb/gadget/function/u_uvc.h
index 24b8681b0d6f..577c1c48ca4a 100644
--- a/drivers/usb/gadget/function/u_uvc.h
+++ b/drivers/usb/gadget/function/u_uvc.h
@@ -52,7 +52,6 @@ struct f_uvc_opts {
 	struct uvc_camera_terminal_descriptor		uvc_camera_terminal;
 	struct uvc_processing_unit_descriptor		uvc_processing;
 	struct uvc_output_terminal_descriptor		uvc_output_terminal;
-	struct uvc_color_matching_descriptor		uvc_color_matching;
 
 	/*
 	 * Control descriptors pointers arrays for full-/high-speed and
-- 
2.34.1

