Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB23FF637C
	for <lists+linux-usb@lfdr.de>; Sun, 10 Nov 2019 03:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729999AbfKJCv3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Nov 2019 21:51:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:36094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729991AbfKJCv2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 9 Nov 2019 21:51:28 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DEF8F22794;
        Sun, 10 Nov 2019 02:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573354287;
        bh=OQxAjtgjoRmh71w/KKY3w4GztgCDEsVjgMRHOe26tms=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1VcWbhDzXd88Vjrw2hxfKWy5/Nnng8PHKsETbX46icpbFWeqgYCqmK/gD6yXcizfq
         VBX+VgBFd7zS4jkB+ciTHJKkn2j6J7xdQBs8ea5AnF01DdOTmB4LV1AGq6WuLKxgo2
         hY7yJi94VjCalrWcSkYBqisSztHwLLFpnk17cduQ=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 29/40] usb: gadget: uvc: Only halt video streaming endpoint in bulk mode
Date:   Sat,  9 Nov 2019 21:50:21 -0500
Message-Id: <20191110025032.827-29-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110025032.827-1-sashal@kernel.org>
References: <20191110025032.827-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[ Upstream commit 8dbf9c7abefd5c1434a956d5c6b25e11183061a3 ]

When USB requests for video data fail to be submitted, the driver
signals a problem to the host by halting the video streaming endpoint.
This is only valid in bulk mode, as isochronous transfers have no
handshake phase and can't thus report a stall. The usb_ep_set_halt()
call returns an error when using isochronous endpoints, which we happily
ignore, but some UDCs complain in the kernel log. Fix this by only
trying to halt the endpoint in bulk mode.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/function/uvc_video.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 540917f54506a..d6bab12b0b47d 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -136,7 +136,9 @@ static int uvcg_video_ep_queue(struct uvc_video *video, struct usb_request *req)
 	ret = usb_ep_queue(video->ep, req, GFP_ATOMIC);
 	if (ret < 0) {
 		printk(KERN_INFO "Failed to queue request (%d).\n", ret);
-		usb_ep_set_halt(video->ep);
+		/* Isochronous endpoints can't be halted. */
+		if (usb_endpoint_xfer_bulk(video->ep->desc))
+			usb_ep_set_halt(video->ep);
 	}
 
 	return ret;
-- 
2.20.1

