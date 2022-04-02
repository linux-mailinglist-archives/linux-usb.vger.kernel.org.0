Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB0B64F1159
	for <lists+linux-usb@lfdr.de>; Mon,  4 Apr 2022 10:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241065AbiDDIvh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Apr 2022 04:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239164AbiDDIva (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 04:51:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C841EAEF
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 01:49:35 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nbIOz-0004pL-9m; Mon, 04 Apr 2022 10:49:33 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nan9p-000dDZ-1L; Sun, 03 Apr 2022 01:27:47 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nan9m-00FCQn-LM; Sun, 03 Apr 2022 01:27:46 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: [PATCH v2 3/3] usb: gadget: uvc: improve sg exit condition
Date:   Sun,  3 Apr 2022 01:27:44 +0200
Message-Id: <20220402232744.3622565-4-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220402232744.3622565-1-m.grzeschik@pengutronix.de>
References: <20220402232744.3622565-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The exit condition to quit iterating over the sg_list, while encoding
the sg entries, has to consider the case that the dma_len of the entry
could be zero. This patch takes this condition to account.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 - >v2: - new patch

 drivers/usb/gadget/function/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index ceeabc4ba3b167..a9bb4553db847e 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -155,7 +155,7 @@ uvc_video_encode_isoc_sg(struct usb_request *req, struct uvc_video *video,
 	sg = sg_next(sg);
 
 	for_each_sg(sg, iter, ureq->sgt.nents - 1, i) {
-		if (!len || !buf->sg)
+		if (!len || !buf->sg || !sg_dma_len(buf->sg))
 			break;
 
 		sg_left = sg_dma_len(buf->sg) - buf->offset;
-- 
2.30.2

