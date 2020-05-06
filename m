Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD9481C65F4
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 04:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgEFCqX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 22:46:23 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:50070 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725915AbgEFCqW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 22:46:22 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5BD07C1324;
        Wed,  6 May 2020 02:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588733182; bh=6nEFgLMiGfghXIIIhHOa/3OHX63NMi6tx7ygjwoLhjI=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=OrMo32hB2VaIxbdu5u4cIxz4/JBFOFkckjU3LZmfZQStFG2NaGjTDxPG3Is1gGS6p
         qWoXnS6vpl6pIAZLXxXBhIRcXVJZ1M1x+/7KquYD22Y8bKAnNuv439Fwt8Da7lqM9k
         g4oyvsz35w7+z+oUYTxZV4+kyRybKDnApNpzmsFhshOQj4h9KA8mxr8Sa4kj1kfyJv
         hSeR2b9ujHbJS5dInbOa3eS2lhMAyO7hpRiPZMtUJRJMU8lyrcCV3TNtThFG1H6WBh
         j2N96hfAG4UfN0lYWlsuQfiGstLCaz9k8oc2qOe9Mu62xvrJPwy70SUvK2Cwj9bbOh
         CrHO38eEou/cg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 0E432A0252;
        Wed,  6 May 2020 02:46:19 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 05 May 2020 19:46:19 -0700
Date:   Tue, 05 May 2020 19:46:19 -0700
Message-Id: <b0d80021efedbf189b85f8c0f1e0baeaf7543d2c.1588732815.git.thinhn@synopsys.com>
In-Reply-To: <cover.1588732815.git.thinhn@synopsys.com>
References: <cover.1588732815.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 02/11] usb: gadget: f_tcm: Inform last stream request
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Set the request->is_last to each stream request to indicate that the
request is the last stream request of a transfer. The DWC3 controller
needs to know this info to properly switch streams. The current
implementation of f_tcm uses a single request per transfer, so every
stream request is the last of its stream.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 36504931b2d1..2979cbe4d95f 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -531,6 +531,7 @@ static int uasp_prepare_r_request(struct usbg_cmd *cmd)
 		stream->req_in->sg = se_cmd->t_data_sg;
 	}
 
+	stream->req_in->is_last = 1;
 	stream->req_in->complete = uasp_status_data_cmpl;
 	stream->req_in->length = se_cmd->data_length;
 	stream->req_in->context = cmd;
@@ -554,6 +555,7 @@ static void uasp_prepare_status(struct usbg_cmd *cmd)
 	 */
 	iu->len = cpu_to_be16(se_cmd->scsi_sense_length);
 	iu->status = se_cmd->scsi_status;
+	stream->req_status->is_last = 1;
 	stream->req_status->context = cmd;
 	stream->req_status->length = se_cmd->scsi_sense_length + 16;
 	stream->req_status->buf = iu;
@@ -991,6 +993,7 @@ static int usbg_prepare_w_request(struct usbg_cmd *cmd, struct usb_request *req)
 		req->sg = se_cmd->t_data_sg;
 	}
 
+	req->is_last = 1;
 	req->complete = usbg_data_write_cmpl;
 	req->length = se_cmd->data_length;
 	req->context = cmd;
-- 
2.11.0

