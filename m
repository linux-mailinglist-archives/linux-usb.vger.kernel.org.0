Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB2C15392EC
	for <lists+linux-usb@lfdr.de>; Tue, 31 May 2022 16:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238778AbiEaOI7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 May 2022 10:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235071AbiEaOI6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 10:08:58 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76E4D64D14
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654006135; x=1685542135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g8yB06U9TLwlLfoPbc1h4ZMro1Lr80KxlF52ngpWHcI=;
  b=OFbcyrANapYDCc9pF0cMLJycoTbc6uGFtVjX8X4m+qvdCKdGC3C5259p
   Sc7Cxf+0t4LML0BaLFaxs/I48EA6f6jjWLaU8p1liEF2n/bbWRuANQd2g
   RGlQ/VfYlPTqu81hcPpavhyDmFLSYikczg889vKvDCWikjL+fL9T4HhTO
   Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 31 May 2022 07:08:54 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 07:08:53 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 07:08:53 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 07:08:51 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>,
        Michael Wu <michael@allwinnertech.com>,
        "John Keeping" <john@metanate.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 1/2] usb: gadget: f_fs: change ep->status safe in ffs_epfile_io()
Date:   Tue, 31 May 2022 22:08:38 +0800
Message-ID: <1654006119-23869-2-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654006119-23869-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1654006119-23869-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If a task read/write data in blocking mode, it will wait the completion
in ffs_epfile_io(), if function unbind occurs, ffs_func_unbind() will
kfree ffs ep, once the task wake up, it still dereference the ffs ep to
obtain the request status.

Fix it by moving the request status to io_data which is stack-safe.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: correct interrupted assignment

 drivers/usb/gadget/function/f_fs.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 4585ee3..d4d8940 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -122,8 +122,6 @@ struct ffs_ep {
 	struct usb_endpoint_descriptor	*descs[3];
 
 	u8				num;
-
-	int				status;	/* P: epfile->mutex */
 };
 
 struct ffs_epfile {
@@ -227,6 +225,9 @@ struct ffs_io_data {
 	bool use_sg;
 
 	struct ffs_data *ffs;
+
+	int status;
+	struct completion done;
 };
 
 struct ffs_desc_helper {
@@ -707,12 +708,12 @@ static const struct file_operations ffs_ep0_operations = {
 
 static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
 {
+	struct ffs_io_data *io_data = req->context;
+
 	ENTER();
-	if (req->context) {
-		struct ffs_ep *ep = _ep->driver_data;
-		ep->status = req->status ? req->status : req->actual;
-		complete(req->context);
-	}
+
+	io_data->status = req->status ? req->status : req->actual;
+	complete(&io_data->done);
 }
 
 static ssize_t ffs_copy_to_iter(void *data, int data_len, struct iov_iter *iter)
@@ -1050,7 +1051,6 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 		WARN(1, "%s: data_len == -EINVAL\n", __func__);
 		ret = -EINVAL;
 	} else if (!io_data->aio) {
-		DECLARE_COMPLETION_ONSTACK(done);
 		bool interrupted = false;
 
 		req = ep->req;
@@ -1066,7 +1066,8 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 
 		io_data->buf = data;
 
-		req->context  = &done;
+		init_completion(&io_data->done);
+		req->context  = io_data;
 		req->complete = ffs_epfile_io_complete;
 
 		ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);
@@ -1075,7 +1076,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 
 		spin_unlock_irq(&epfile->ffs->eps_lock);
 
-		if (wait_for_completion_interruptible(&done)) {
+		if (wait_for_completion_interruptible(&io_data->done)) {
 			/*
 			 * To avoid race condition with ffs_epfile_io_complete,
 			 * dequeue the request first then check
@@ -1083,17 +1084,18 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 			 * condition with req->complete callback.
 			 */
 			usb_ep_dequeue(ep->ep, req);
-			wait_for_completion(&done);
-			interrupted = ep->status < 0;
+			wait_for_completion(&io_data->done);
+			interrupted = io_data->status < 0;
 		}
 
 		if (interrupted)
 			ret = -EINTR;
-		else if (io_data->read && ep->status > 0)
-			ret = __ffs_epfile_read_data(epfile, data, ep->status,
+		else if (io_data->read && io_data->status > 0)
+			ret = __ffs_epfile_read_data(epfile, data, io_data->status,
 						     &io_data->data);
 		else
-			ret = ep->status;
+			ret = io_data->status;
+
 		goto error_mutex;
 	} else if (!(req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC))) {
 		ret = -ENOMEM;
-- 
2.7.4

