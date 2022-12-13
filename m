Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5F264B146
	for <lists+linux-usb@lfdr.de>; Tue, 13 Dec 2022 09:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234524AbiLMIh7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Dec 2022 03:37:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234634AbiLMIhz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Dec 2022 03:37:55 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C050117E1C
        for <linux-usb@vger.kernel.org>; Tue, 13 Dec 2022 00:37:54 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8659BBE;
        Tue, 13 Dec 2022 09:37:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670920668;
        bh=1qrbOpdGaB5UPX+lRYmb5K1hYlJia4Z/fKuVi61kslw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hDiW+iRW2ctdxtN4o58/dpBnLEDKyqczrLtOt73+9hvw/H5vwDdYAhDrdmFxvKjbJ
         hGNxnFw953e0NHc/iFiMwwLdtTqH1KigRpaEw/Z9i8LjyXUmEG1+2bBdwOqUaytr6h
         Mj2640MimJfKqE4dha4E40eI7IX5cs4Q7gTKVTGU=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 4/6] usb: gadget: uvc: Remove the hardcoded default color matching
Date:   Tue, 13 Dec 2022 08:37:34 +0000
Message-Id: <20221213083736.2284536-5-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
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

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/usb/gadget/function/f_uvc.c | 9 ---------
 drivers/usb/gadget/function/u_uvc.h | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 6e196e06181e..46bdea73cdeb 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -793,7 +793,6 @@ static struct usb_function_instance *uvc_alloc_inst(void)
 	struct uvc_camera_terminal_descriptor *cd;
 	struct uvc_processing_unit_descriptor *pd;
 	struct uvc_output_terminal_descriptor *od;
-	struct uvc_color_matching_descriptor *md;
 	struct uvc_descriptor_header **ctl_cls;
 	int ret;
 
@@ -842,14 +841,6 @@ static struct usb_function_instance *uvc_alloc_inst(void)
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

