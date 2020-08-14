Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B402444AD
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 07:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgHNFzK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Aug 2020 01:55:10 -0400
Received: from smtp12.smtpout.orange.fr ([80.12.242.134]:54243 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgHNFzK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Aug 2020 01:55:10 -0400
Received: from localhost.localdomain ([93.23.15.18])
        by mwinf5d35 with ME
        id FHv3230030PNgoV03Hv3rb; Fri, 14 Aug 2020 07:55:08 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 14 Aug 2020 07:55:08 +0200
X-ME-IP: 93.23.15.18
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        sudhakar.panneerselvam@oracle.com, jpawar@cadence.com,
        gustavoars@kernel.org, Thinh.Nguyen@synopsys.com,
        bigeasy@linutronix.de, nab@linux-iscsi.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] usb: gadget: f_tcm: Fix some resource leaks in some error paths
Date:   Fri, 14 Aug 2020 07:55:01 +0200
Message-Id: <20200814055501.763821-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If a memory allocation fails within a 'usb_ep_alloc_request()' call, the
already allocated memory must be released.

Fix a mix-up in the code and free the correct requests.

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/gadget/function/f_tcm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index d94b814328c8..184165e27908 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -753,12 +753,13 @@ static int uasp_alloc_stream_res(struct f_uas *fu, struct uas_stream *stream)
 		goto err_sts;
 
 	return 0;
+
 err_sts:
-	usb_ep_free_request(fu->ep_status, stream->req_status);
-	stream->req_status = NULL;
-err_out:
 	usb_ep_free_request(fu->ep_out, stream->req_out);
 	stream->req_out = NULL;
+err_out:
+	usb_ep_free_request(fu->ep_in, stream->req_in);
+	stream->req_in = NULL;
 out:
 	return -ENOMEM;
 }
-- 
2.25.1

