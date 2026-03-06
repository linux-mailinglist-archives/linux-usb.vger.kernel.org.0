Return-Path: <linux-usb+bounces-34135-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H3JDkJIqmlkOgEAu9opvQ
	(envelope-from <linux-usb+bounces-34135-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 04:21:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A83D21B018
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 04:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 644913074E35
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 03:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39EB36B067;
	Fri,  6 Mar 2026 03:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlwN4eXQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E002264B0
	for <linux-usb@vger.kernel.org>; Fri,  6 Mar 2026 03:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772767020; cv=none; b=GsDb30qQFNCjoWaOcLC9UxjOqe/Hp6GuysZZRvc4c8poxL35Zi+u0663vLscO+D8idFXvdsIjuMsc+PwEkM7cG/QXbBCdZShTuS8UsG4g0/9p/o6YALbX+4WZUN514i4HDT/g7oBr6SvSvMhceV4kv68fS7EDgqkywqYjeV8g98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772767020; c=relaxed/simple;
	bh=m68gnYmctKVpeghMNZk6qG10siwQrI61Fd4jyCWFufU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XlDcD5enclWIG8Ry0nEVxqi2JHTl2MCnfoX76YKGU5P59Y8kvrZPQTH2u88g/4TxrfYfKld/QTVJxwfoTmB21ElgiS1j9wU0TjA4/uM4vUyUdc42XRz/ntYhXDzu3J/HdUBqGPnIPJ41XOYAW5nA37bW9MmqKgrn38qyMwvs91w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlwN4eXQ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ae527552acso18993955ad.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 19:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772767018; x=1773371818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AoG/ryHBSZlzW7QNKPkSRF4IaoRTutm96Nzl+aL2qjM=;
        b=HlwN4eXQNE3ekE3YOv9efdQMuAI0mQ2cc5dTNpBIBDLPo+6ShBts0/5ABLbvDp8pzX
         MZ3tCAsrQaBmgOYvac5Q4EZlVQvfiIGl/1SRZLm7N7+ri46+l6hz1jJZRXLENenY4Oni
         7hBj60f3P6SjFhKYURdJs6Bao8NaubdHjoHRvxDSa8rwqMkz3tK/YQHD7fO93QuIP5P/
         PBG3xUXkC3IndBqcOVzl7bCnwYkHd5NDSzd7ClWdTHk6f2l70mU7qrrk3oIUhlxUEmRc
         QVObJT9g2qcbOKbNl8MqaNAlxq9RREAl280Y+gRWY/EYAJEeGP+6EPexivkKdBW7Emoe
         H2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772767018; x=1773371818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoG/ryHBSZlzW7QNKPkSRF4IaoRTutm96Nzl+aL2qjM=;
        b=DPwPITfAuWGngSmgd93dBFJfCo18IEHlhfXX/MUzVTetgojUEfMuK0rNIoGaeTdLv4
         U7zSVw9jxffUZIbtPFY5vIn/sSULkHegZDj33Ncj6tJeJn+3KQGhHy85QJoVjhGcNVO/
         Zmy9mCy19K2hD8BuDX6o5uUKM946e+SU3TlfbkBREXt09HQ0P+p0Qwy2vhbMBr4V2DJQ
         nF1vm687CUvyq6XIs9NMF7n/6m8FKtG052rg62OCtund8kkZUM2UyqvSgD8AY4/VuUMF
         du5+W8bDUY/fCfmmpDhAG6LB0Z4VcWJC19x9VmdtGWZubgmmLTU//akDk3K2IXSzjPsM
         A0FA==
X-Gm-Message-State: AOJu0YwLodAuOFUuImA1TlQM5sIwZ7A/HJhuQGmRfUfZu3XYKq4QDuW1
	73ESO0BQ7WF75Li1WKA27pU2ytUTWQFt9JDD+Tc68Mmfgvf9rZkhJOne4GS5VqDR
X-Gm-Gg: ATEYQzwsyAFKFYzxXMI2fj2xf2F4WxwP/RUpDZg/czGsgUyXFRMyWSa5IIkycGvK9pV
	b/P1e5h6zkOL2AtVeZksn5AOZ7IRHwKqRI8nauQPy49Ljf/0iN1vMtFaTfBYPI2Gp/lckOXQn7G
	wzFXg2dQq6cYdf5upUn0vlWvesj7s0NU0wPHY0gEO5YOlJ/R6rlbQ/ya6vSlC33gf2laiSza98Y
	PD51EUKq/LhwH5B8hV5vZqJodrQKYX2uxe0IiUu6FlBqt9iPhpTB1xhwImZxqRTYkFv8IfgX4oD
	Kep0CoYo6RHbxJq/jnGuvyhqZJ6hJoWAtcN/qLsq8Y2b8WBjiV7RmDxoIPJqJqg5hCp7Ii+XiWA
	aW10/LAjadiDHyS5jDDVy3GpXy6lLVH6qmsfIUrK53KvmBcqkqOytwZnNDHMU8MFJbV/ptSZRXS
	TEq7c59KSD0Ntptf8dlzRWCdDQaiBIYbIh5nUXHUn73tiT3mI8uqq0GB0=
X-Received: by 2002:a17:903:1b6c:b0:2ae:5345:89ee with SMTP id d9443c01a7336-2ae823fee84mr8684175ad.1.1772767017919;
        Thu, 05 Mar 2026 19:16:57 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f7864dsm1749235ad.49.2026.03.05.19.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 19:16:57 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] usb: typec: tcpm: kzalloc + kcalloc to kzalloc_flex
Date: Thu,  5 Mar 2026 19:16:39 -0800
Message-ID: <20260306031639.46942-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8A83D21B018
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34135-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Simplifies allocation and allows using __counted_by for extra runtime
analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 1d2f3af034c5..272f9187b12d 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -605,9 +605,9 @@ struct altmode_vdm_event {
 	struct kthread_work work;
 	struct tcpm_port *port;
 	u32 header;
-	u32 *data;
 	int cnt;
 	enum tcpm_transmit_type tx_sop_type;
+	u32 data[] __counted_by(cnt);
 };
 
 static const char * const pd_rev[] = {
@@ -1653,7 +1653,6 @@ static void tcpm_queue_vdm_work(struct kthread_work *work)
 	tcpm_queue_vdm(port, event->header, event->data, event->cnt, event->tx_sop_type);
 
 port_unlock:
-	kfree(event->data);
 	kfree(event);
 	mutex_unlock(&port->lock);
 }
@@ -1662,35 +1661,27 @@ static int tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
 				   const u32 *data, int cnt, enum tcpm_transmit_type tx_sop_type)
 {
 	struct altmode_vdm_event *event;
-	u32 *data_cpy;
 	int ret = -ENOMEM;
 
-	event = kzalloc_obj(*event);
+	event = kzalloc_flex(*event, data, cnt);
 	if (!event)
 		goto err_event;
 
-	data_cpy = kcalloc(cnt, sizeof(u32), GFP_KERNEL);
-	if (!data_cpy)
-		goto err_data;
-
 	kthread_init_work(&event->work, tcpm_queue_vdm_work);
+	event->cnt = cnt;
 	event->port = port;
 	event->header = header;
-	memcpy(data_cpy, data, sizeof(u32) * cnt);
-	event->data = data_cpy;
-	event->cnt = cnt;
+	memcpy(event->data, data, sizeof(u32) * cnt);
 	event->tx_sop_type = tx_sop_type;
 
 	ret = kthread_queue_work(port->wq, &event->work);
 	if (!ret) {
 		ret = -EBUSY;
-		goto err_queue;
+		goto err_data;
 	}
 
 	return 0;
 
-err_queue:
-	kfree(data_cpy);
 err_data:
 	kfree(event);
 err_event:
-- 
2.53.0


