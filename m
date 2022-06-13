Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77D5754801C
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jun 2022 09:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236412AbiFMG7I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jun 2022 02:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236451AbiFMG7C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jun 2022 02:59:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82FFC17064
        for <linux-usb@vger.kernel.org>; Sun, 12 Jun 2022 23:59:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1o0e2N-0001Du-Tk; Mon, 13 Jun 2022 08:58:59 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1o0e2N-000FHw-4L; Mon, 13 Jun 2022 08:58:58 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1o0e2L-004JxK-Cv; Mon, 13 Jun 2022 08:58:57 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: [PATCH] fixup! usb: gadget: uvc: calculate the number of request depending on framesize
Date:   Mon, 13 Jun 2022 08:58:44 +0200
Message-Id: <20220613065844.1029977-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YqDlP3uy33+WPphJ@pendragon.ideasonboard.com>
References: <YqDlP3uy33+WPphJ@pendragon.ideasonboard.com>
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

---
In Patch "c5d337a3: usb: gadget: uvc: Fix comment blocks style" the overall
comment style was fixed to use a consistent format.

Laurent suggested to fix the comment format and to drop the extra
parantheses around video->ep->mult in this patch. But it was already
taken without those changes.

Greg, could you fix this up in usb-next?

Thanks,
Michael
---
 drivers/usb/gadget/function/uvc_queue.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index ec500ee499eed1..267474225ee409 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -56,9 +56,10 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 
 	req_size = video->ep->maxpacket
 		 * max_t(unsigned int, video->ep->maxburst, 1)
-		 * (video->ep->mult);
+		 * video->ep->mult;
 
-	/* We divide by two, to increase the chance to run
+	/*
+	 * We divide by two, to increase the chance to run
 	 * into fewer requests for smaller framesizes.
 	 */
 	nreq = DIV_ROUND_UP(DIV_ROUND_UP(sizes[0], 2), req_size);
-- 
2.30.2

