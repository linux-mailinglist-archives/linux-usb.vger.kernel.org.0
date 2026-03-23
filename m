Return-Path: <linux-usb+bounces-35306-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KAMMBD3wGkwPAQAu9opvQ
	(envelope-from <linux-usb+bounces-35306-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 09:17:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDBC2EE304
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 09:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 791CD3099810
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 08:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C65836EAAE;
	Mon, 23 Mar 2026 08:08:51 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78A51DED4C;
	Mon, 23 Mar 2026 08:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774253330; cv=none; b=T0TAwyaoWfBKIaHSualisFseVUwQM/nvjMKv2bpLGhYbjOy2NxCidWRJYAxne5qVHFSYuHbJzKSM2eb0DmRPFgpB+XmWjXSC67mcKcyWkXDkJSEPe+80YTH980d8qaiuOCc1qeNYfwObrhcfFkJLmNif7kV3Jp/+Yr5jsEEM4Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774253330; c=relaxed/simple;
	bh=lq17LlRq3ghjiIK1g8G0CFSZ+ZYA5oq1kqQKY0BLXtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d0NkXr8o4E6VeSzklOSLjeorKp2yXA2IWDkAlo8MKIjViAOxhgtoN09a3dlKr59iaFGtEeGeZo1/q1bhQKatfql+V0zQ+MoD4q5o3X1dSuOwXapKhW+NvBqfw7Z2gSodSf3vz4a2hJe7AQaijtxJ/MTI2sSaVp3/86/bWWGxqz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowABXdt0N9cBpO0eHCw--.11897S2;
	Mon, 23 Mar 2026 16:08:46 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] usb: gadget: rndis: validate query and set message buffers
Date: Mon, 23 Mar 2026 16:08:45 +0800
Message-ID: <20260323080845.40045-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABXdt0N9cBpO0eHCw--.11897S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKw47Zr1fWry7Gr4rXF47Arb_yoWxXrW7pF
	48W3WIyr45Gr4DZrWvgrs5JFy5u3s2qFWUKFW7t3sI9F17JryvgFykCFyY9F15Kr9xAr1x
	ta1DKr4UW3Z7C37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUjAwsUU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35306-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-usb@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email,iscas.ac.cn:mid]
X-Rspamd-Queue-Id: 1CDBC2EE304
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

rndis_set_response() already checks the host-controlled
InformationBufferOffset/InformationBufferLength pair before using it,
but the QUERY path still passes the same fields straight into
gen_ndis_query_resp(). The parser also does not verify that MsgLength
fits the actual EP0 request buffer before dispatching the message.

Pass the actual request size into rndis_msg_parser(), reject messages
whose MsgLength exceeds the received buffer, and apply the same offset
and length validation to QUERY and SET requests before dereferencing the
embedded information buffer.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
v2:
- add commit message context and fix rationale
- no code changes

 drivers/usb/gadget/function/f_rndis.c |  2 +-
 drivers/usb/gadget/function/rndis.c   | 49 +++++++++++++++++++--------
 drivers/usb/gadget/function/rndis.h   |  2 +-
 3 files changed, 37 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/gadget/function/f_rndis.c b/drivers/usb/gadget/function/f_rndis.c
index 8b11d8d6d89c..4878b1133582 100644
--- a/drivers/usb/gadget/function/f_rndis.c
+++ b/drivers/usb/gadget/function/f_rndis.c
@@ -443,7 +443,7 @@ static void rndis_command_complete(struct usb_ep *ep, struct usb_request *req)
 
 	/* received RNDIS command from USB_CDC_SEND_ENCAPSULATED_COMMAND */
 //	spin_lock(&dev->lock);
-	status = rndis_msg_parser(rndis->params, (u8 *) req->buf);
+	status = rndis_msg_parser(rndis->params, (u8 *)req->buf, req->actual);
 	if (status < 0)
 		pr_err("RNDIS command error %d, %d/%d\n",
 			status, req->actual, req->length);
diff --git a/drivers/usb/gadget/function/rndis.c b/drivers/usb/gadget/function/rndis.c
index 3da54a7d7aba..3f3201934c12 100644
--- a/drivers/usb/gadget/function/rndis.c
+++ b/drivers/usb/gadget/function/rndis.c
@@ -588,9 +588,22 @@ static int rndis_init_response(struct rndis_params *params,
 	return 0;
 }
 
+static bool rndis_check_query_set_msg_len(u32 msg_len, u32 buf_offset,
+					  u32 buf_length, size_t min_len)
+{
+	if (msg_len < min_len || msg_len > RNDIS_MAX_TOTAL_SIZE)
+		return false;
+
+	if (buf_offset > msg_len - 8)
+		return false;
+
+	return buf_length <= msg_len - buf_offset - 8;
+}
+
 static int rndis_query_response(struct rndis_params *params,
-				rndis_query_msg_type *buf)
+				rndis_query_msg_type *buf, u32 msg_len)
 {
+	u32 buf_length, buf_offset;
 	rndis_query_cmplt_type *resp;
 	rndis_resp_t *r;
 
@@ -598,6 +611,12 @@ static int rndis_query_response(struct rndis_params *params,
 	if (!params->dev)
 		return -ENOTSUPP;
 
+	buf_length = le32_to_cpu(buf->InformationBufferLength);
+	buf_offset = le32_to_cpu(buf->InformationBufferOffset);
+	if (!rndis_check_query_set_msg_len(msg_len, buf_offset, buf_length,
+					   sizeof(*buf)))
+		return -EINVAL;
+
 	/*
 	 * we need more memory:
 	 * gen_ndis_query_resp expects enough space for
@@ -614,9 +633,7 @@ static int rndis_query_response(struct rndis_params *params,
 	resp->RequestID = buf->RequestID; /* Still LE in msg buffer */
 
 	if (gen_ndis_query_resp(params, le32_to_cpu(buf->OID),
-			le32_to_cpu(buf->InformationBufferOffset)
-					+ 8 + (u8 *)buf,
-			le32_to_cpu(buf->InformationBufferLength),
+			buf_offset + 8 + (u8 *)buf, buf_length,
 			r)) {
 		/* OID not supported */
 		resp->Status = cpu_to_le32(RNDIS_STATUS_NOT_SUPPORTED);
@@ -631,7 +648,7 @@ static int rndis_query_response(struct rndis_params *params,
 }
 
 static int rndis_set_response(struct rndis_params *params,
-			      rndis_set_msg_type *buf)
+			      rndis_set_msg_type *buf, u32 msg_len)
 {
 	u32 BufLength, BufOffset;
 	rndis_set_cmplt_type *resp;
@@ -639,10 +656,9 @@ static int rndis_set_response(struct rndis_params *params,
 
 	BufLength = le32_to_cpu(buf->InformationBufferLength);
 	BufOffset = le32_to_cpu(buf->InformationBufferOffset);
-	if ((BufLength > RNDIS_MAX_TOTAL_SIZE) ||
-	    (BufOffset > RNDIS_MAX_TOTAL_SIZE) ||
-	    (BufOffset + 8 >= RNDIS_MAX_TOTAL_SIZE))
-		    return -EINVAL;
+	if (!rndis_check_query_set_msg_len(msg_len, BufOffset, BufLength,
+					   sizeof(*buf)))
+		return -EINVAL;
 
 	r = rndis_add_response(params, sizeof(rndis_set_cmplt_type));
 	if (!r)
@@ -788,13 +804,13 @@ EXPORT_SYMBOL_GPL(rndis_set_host_mac);
 /*
  * Message Parser
  */
-int rndis_msg_parser(struct rndis_params *params, u8 *buf)
+int rndis_msg_parser(struct rndis_params *params, u8 *buf, u32 buflen)
 {
 	u32 MsgType, MsgLength;
 	__le32 *tmp;
 
-	if (!buf)
-		return -ENOMEM;
+	if (!buf || buflen < 2 * sizeof(*tmp))
+		return -EINVAL;
 
 	tmp = (__le32 *)buf;
 	MsgType   = get_unaligned_le32(tmp++);
@@ -803,6 +819,9 @@ int rndis_msg_parser(struct rndis_params *params, u8 *buf)
 	if (!params)
 		return -ENOTSUPP;
 
+	if (MsgLength > buflen || MsgLength > RNDIS_MAX_TOTAL_SIZE)
+		return -EINVAL;
+
 	/* NOTE: RNDIS is *EXTREMELY* chatty ... Windows constantly polls for
 	 * rx/tx statistics and link status, in addition to KEEPALIVE traffic
 	 * and normal HC level polling to see if there's any IN traffic.
@@ -828,10 +847,12 @@ int rndis_msg_parser(struct rndis_params *params, u8 *buf)
 
 	case RNDIS_MSG_QUERY:
 		return rndis_query_response(params,
-					(rndis_query_msg_type *)buf);
+					(rndis_query_msg_type *)buf,
+					MsgLength);
 
 	case RNDIS_MSG_SET:
-		return rndis_set_response(params, (rndis_set_msg_type *)buf);
+		return rndis_set_response(params, (rndis_set_msg_type *)buf,
+					  MsgLength);
 
 	case RNDIS_MSG_RESET:
 		pr_debug("%s: RNDIS_MSG_RESET\n",
diff --git a/drivers/usb/gadget/function/rndis.h b/drivers/usb/gadget/function/rndis.h
index 6206b8b7490f..cbb016fdad97 100644
--- a/drivers/usb/gadget/function/rndis.h
+++ b/drivers/usb/gadget/function/rndis.h
@@ -178,7 +178,7 @@ typedef struct rndis_params {
 } rndis_params;
 
 /* RNDIS Message parser and other useless functions */
-int  rndis_msg_parser(struct rndis_params *params, u8 *buf);
+int  rndis_msg_parser(struct rndis_params *params, u8 *buf, u32 buflen);
 struct rndis_params *rndis_register(void (*resp_avail)(void *v), void *v);
 void rndis_deregister(struct rndis_params *params);
 int  rndis_set_param_dev(struct rndis_params *params, struct net_device *dev,
-- 
2.50.1 (Apple Git-155)


