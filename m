Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0A7264EE8C
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 17:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbiLPQHp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Dec 2022 11:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbiLPQHH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Dec 2022 11:07:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CC5164BC
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 08:05:48 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91FD8A31;
        Fri, 16 Dec 2022 17:05:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671206746;
        bh=mfUhP4g3clnJKLDMZir5N5/a3/1rLCI0FjNcXx8HdwI=;
        h=From:To:Cc:Subject:Date:From;
        b=HRa4LlvZWtoCxfoPXonyp13/27IIiyXuUNIl3v4m7+N3K/f9i8fzugWH1Wwr12GwE
         tD221/vqRFwxoFQE7VR+vleyKROdEY3eHwH1YcgoclQTQO4Lom3HQ+96tGoWLkimOg
         wzg9oS8vmkStgjkHEheUrZmDUcIFdqf7s2vLfV1o=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, kieran.bingham@ideasonboard.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH] usb: gadget: g_webcam: Send color matching descriptor per frame
Date:   Fri, 16 Dec 2022 16:05:28 +0000
Message-Id: <20221216160528.479094-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

Currently the color matching descriptor is only sent across the wire
a single time, following the descriptors for each format and frame.
According to the UVC 1.5 Specification 3.9.2.6 ("Color Matching
Descriptors"):

"Only one instance is allowed for a given format and if present,
the Color Matching descriptor shall be placed following the Video
and Still Image Frame descriptors for that format".

Add another reference to the color matching descriptor after the
yuyv frames so that it's correctly transmitted for that format
too.

Fixes: a9914127e834 ("USB gadget: Webcam device")
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/usb/gadget/legacy/webcam.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/legacy/webcam.c b/drivers/usb/gadget/legacy/webcam.c
index 53e38f87472b..c06dd1af7a0c 100644
--- a/drivers/usb/gadget/legacy/webcam.c
+++ b/drivers/usb/gadget/legacy/webcam.c
@@ -293,6 +293,7 @@ static const struct uvc_descriptor_header * const uvc_fs_streaming_cls[] = {
 	(const struct uvc_descriptor_header *) &uvc_format_yuv,
 	(const struct uvc_descriptor_header *) &uvc_frame_yuv_360p,
 	(const struct uvc_descriptor_header *) &uvc_frame_yuv_720p,
+	(const struct uvc_descriptor_header *) &uvc_color_matching,
 	(const struct uvc_descriptor_header *) &uvc_format_mjpg,
 	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_360p,
 	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_720p,
@@ -305,6 +306,7 @@ static const struct uvc_descriptor_header * const uvc_hs_streaming_cls[] = {
 	(const struct uvc_descriptor_header *) &uvc_format_yuv,
 	(const struct uvc_descriptor_header *) &uvc_frame_yuv_360p,
 	(const struct uvc_descriptor_header *) &uvc_frame_yuv_720p,
+	(const struct uvc_descriptor_header *) &uvc_color_matching,
 	(const struct uvc_descriptor_header *) &uvc_format_mjpg,
 	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_360p,
 	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_720p,
@@ -317,6 +319,7 @@ static const struct uvc_descriptor_header * const uvc_ss_streaming_cls[] = {
 	(const struct uvc_descriptor_header *) &uvc_format_yuv,
 	(const struct uvc_descriptor_header *) &uvc_frame_yuv_360p,
 	(const struct uvc_descriptor_header *) &uvc_frame_yuv_720p,
+	(const struct uvc_descriptor_header *) &uvc_color_matching,
 	(const struct uvc_descriptor_header *) &uvc_format_mjpg,
 	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_360p,
 	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_720p,
-- 
2.34.1

