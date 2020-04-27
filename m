Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92281BB17C
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 00:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgD0W1t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 18:27:49 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:53190 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726251AbgD0W1t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Apr 2020 18:27:49 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E57A64054D;
        Mon, 27 Apr 2020 22:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588026468; bh=GYgGcq5MfHTVZagqCwHqNt4eM7bvue5TR7DDLuVdQfo=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=g5zD9pTGSNxwZ/UpqDrWXq9HdofQ8YNahShEjGG8SkUNVbsRwBHq6GBPNHw5FnNmL
         3mqubv8GWRsLGmXvbcs3Jii6ihdSqbIiVBfUsSdPqkMIQx6/6BNfoPyRbC43K72j1z
         skphDW1ejBQLazgUKiDeOhMMJAqk1O8dd+52QCAStiSJ4LV8zW6ckgGUJDIOM6WAkE
         0JlPMqjPFnVF1JWjaJElMUri3WholVgyzl74v7kkTuK8ApNrFJPIBYT5oSPJ1aatGn
         9pNP8MfjjonI3GnnaT6UPZgTxsRcGfvJFG0PT4YZE8yeHlelrgOTr4mSRDDYE10Jr2
         SV09yeUSxkgdQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id CE832A007B;
        Mon, 27 Apr 2020 22:27:47 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 27 Apr 2020 15:27:47 -0700
Date:   Mon, 27 Apr 2020 15:27:47 -0700
Message-Id: <d4cddd59d93b1b52c8a93072edd398ee4e1cfeda.1588025916.git.thinhn@synopsys.com>
In-Reply-To: <cover.1588025916.git.thinhn@synopsys.com>
References: <cover.1588025916.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 2/5] usb: gadget: f_tcm: Inform last transfer request
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
needs to know this info to properly allocate resource for different
streams. The current implementation of f_tcm uses a single request per
transfer, so every stream request is the last of its transfer.

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

