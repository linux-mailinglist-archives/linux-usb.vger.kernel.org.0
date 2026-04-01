Return-Path: <linux-usb+bounces-35807-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AWwL0lvzWlsdgYAu9opvQ
	(envelope-from <linux-usb+bounces-35807-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 21:17:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A58837FC1F
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 21:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 546F03010499
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 19:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F72361666;
	Wed,  1 Apr 2026 19:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Llcyirrv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4237825393B
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 19:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070850; cv=none; b=Opp/2X8WuGdeY6jFXPPYNpE8HfJbS0yyvIm8zBEg3mAzoAADVUy5fbYiU0S5X6Tc2usYSQzU5/UqUkm+IZRMnOfwVedwZfymPKcfCrs6LqaTKZdYCB5JJLcUqZ/sucYx0jztoz77O60Ew5PaO66amNpxdiFT4BVOzme8VM43V+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070850; c=relaxed/simple;
	bh=zRuJ5o8tdW5dlLPvEGoqcoJIBcdbmVXWBTGvi8lZMjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MfAnpuir/iX1p6wpHgzRvrJjufgYukQKxZ6tzL0tutWPWMT6BSYq/V0aAEtW1pFglZTI7CTz2YaOEC3j9e8UxmMZ6/xb06BijK7eJLOnTmHW3BoaZnVrjy1QELi6VZjbO70G8SG2SHaNLLEiyp+lFpq4FeKtOpg7fLlKyJDjAWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Llcyirrv; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b0c8362d93so287685ad.3
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 12:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775070849; x=1775675649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=089NM6K8HZ+2v5XiWNSn3Tdv7OaoknH1bLQ2DPBPikE=;
        b=LlcyirrvHNB+8kS4prLGI7V4wqFZ4nH7PH8dN4+M94/pnACUNqf/G6aCp6/3UbOSIt
         i+X8cH/sw9oEhUvzqsJegdXd4NO3NdhgVu0OIyYwaqwEfjNZmwA53sywmXg8U9JUEDFW
         fK9HTFEx/qfQHo7ybeAVDKhwiqb+x2M9rVFFILv7fqtjCnmqqbHpbGDiFbmrykyMfSER
         Jqg1s0ELIAvWfKTm6r5DInb7xjV/LxqxLIRrTLvTGh6ptXWdoqZBuSSskAZPG/qdis/C
         aJtpgIIis2zXqxGDo+ung3Lwr3Rb9tNT4Ad6ueDn8EwMscPmGV5OpxXZO+yHLVPrZYmi
         Zarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070849; x=1775675649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=089NM6K8HZ+2v5XiWNSn3Tdv7OaoknH1bLQ2DPBPikE=;
        b=Nh9zGcsnJfV/oAI55aIJviDVRmlLd/k2wcNlo/AOzJOlEBLZqDFqBcgsQ/ZMqOfQ9K
         vtl1H5v2tbaqt01g/LMlP3RRxenzWXh9l9ur/BmFVQdPh2Zt0fLHgG6j0zZefTFfZhdh
         q5Mv4gd8ot70+RNlKB//MleefOwmdBB2jlreIAmKEprb1Hb3h8EpWEHH5mmC0vkM2+Tm
         OIWtXLFJkqvMvCMRIJRpClhysuoM8wztQ1G9tqd/22VIULOqHeo+X3Nl4wPQQhkOZZ74
         iH9cerEvpDFr6MM9XuMQsKsAX/5heo99BQJEiAIF70mh6gZn6jisg4jY6e47y3rRDh7V
         D7zw==
X-Gm-Message-State: AOJu0YzupNsjsWFhNs0YD0jvwe8x8n9yiobfnRTqZL0G36lbgEVYBmey
	ueGaG7qLVPsWXAEMh6UIn2PsR58hTaq81B745bP6RE17yhAqFPsnfIKl+s1+WixC
X-Gm-Gg: ATEYQzwR24oF7dabjfzoFbIkcjEGLJXLZF/CDcU7vV9JJk0FIEch9CqaeOpGc+mj1rn
	G4SiT/+FBusbss6C3QWkhGUjKcRfseIWc/H928v7ivNbermqUiuEa2HaH/cUW38TD9wuyqokOqW
	5UUix4SjuYPJqljDwfEL414P4ystJjZhm1mc37qgZAIPRn60LYUGst0Hbie1EhEuaR8AKsFHm+e
	UGtZEbUruVK5KLeb3F1i/7XifbUsHc7cKL5TY3V4RCZg48kku50ngZ89w+foVw2TuTDyW9ZC7VQ
	zGZ7Kuw24fVNAGoCbAxWLMDCbykVDbtFCEpsM5kzaRFS1vZYHds4p7nGfsfllY6TkPi5M3vPNis
	q2tECtGJQezzIRJrWFFKfZCxYR74eYPY/CJrpAhnAUkoYVnp+BS9YcK1XVqzZG5GUsFs+SYCCWh
	j31HjlKNBnM5/aC8hnQsZV2X2F66uYvxOEGKMi
X-Received: by 2002:a17:903:37c3:b0:2ae:6457:3099 with SMTP id d9443c01a7336-2b275b67596mr3456115ad.26.1775070848422;
        Wed, 01 Apr 2026 12:14:08 -0700 (PDT)
Received: from localhost.localdomain ([220.83.29.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd9fsm4711625ad.75.2026.04.01.12.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:14:07 -0700 (PDT)
From: Taegu Ha <hataegu0826@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Taegu Ha <hataegu0826@gmail.com>
Subject: [PATCH v3] usb: gadget: f_uac1_legacy: validate control request size
Date: Thu,  2 Apr 2026 04:13:11 +0900
Message-ID: <20260401191311.3604898-1-hataegu0826@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026040144-gratitude-haven-f28a@gregkh>
References: <2026040144-gratitude-haven-f28a@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35807-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hataegu0826@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3A58837FC1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

f_audio_complete() copies req->length bytes into a 4-byte stack
variable:

  u32 data = 0;
  memcpy(&data, req->buf, req->length);

req->length is derived from the host-controlled USB request path,
which can lead to a stack out-of-bounds write.

Validate req->actual against the expected payload size for the
supported control selectors and decode only the expected amount
of data.

This avoids copying a host-influenced length into a fixed-size
stack object.

Signed-off-by: Taegu Ha <hataegu0826@gmail.com>

Changes in v3:
- drop the unnecessary zero-initialization of data
- build-test the updated change
- add KUnit coverage for valid and malformed mute/volume payload sizes

Build-tested: make drivers/usb/gadget/function/f_uac1_legacy.o
Runtime-tested: KUnit on x86_64 with KASAN
- malformed mute/volume payload sizes are rejected
- valid 1-byte mute and 2-byte volume payloads still reach the setter

---
 drivers/usb/gadget/function/f_uac1_legacy.c | 47 ++++++++++++++++-----
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index a0c953a99727..5d201a2e30e7 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -360,19 +360,46 @@ static int f_audio_out_ep_complete(struct usb_ep *ep, struct usb_request *req)
 static void f_audio_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	struct f_audio *audio = req->context;
-	int status = req->status;
-	u32 data = 0;
 	struct usb_ep *out_ep = audio->out_ep;
 
-	switch (status) {
-
-	case 0:				/* normal completion? */
-		if (ep == out_ep)
+	switch (req->status) {
+	case 0:
+		if (ep == out_ep) {
 			f_audio_out_ep_complete(ep, req);
-		else if (audio->set_con) {
-			memcpy(&data, req->buf, req->length);
-			audio->set_con->set(audio->set_con, audio->set_cmd,
-					le16_to_cpu(data));
+		} else if (audio->set_con) {
+			struct usb_audio_control *con = audio->set_con;
+			u8 type = con->type;
+			u32 data;
+			bool valid_request = false;
+
+			switch (type) {
+			case UAC_FU_MUTE: {
+				u8 value;
+
+				if (req->actual == sizeof(value)) {
+					memcpy(&value, req->buf, sizeof(value));
+					data = value;
+					valid_request = true;
+				}
+				break;
+			}
+			case UAC_FU_VOLUME: {
+				__le16 value;
+
+				if (req->actual == sizeof(value)) {
+					memcpy(&value, req->buf, sizeof(value));
+					data = le16_to_cpu(value);
+					valid_request = true;
+				}
+				break;
+			}
+			}
+
+			if (valid_request)
+				con->set(con, audio->set_cmd, data);
+			else
+				usb_ep_set_halt(ep);
+
 			audio->set_con = NULL;
 		}
 		break;
-- 
2.43.0


