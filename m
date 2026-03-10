Return-Path: <linux-usb+bounces-34379-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL3QIWnQr2kfcgIAu9opvQ
	(envelope-from <linux-usb+bounces-34379-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 09:03:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B30246E53
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 09:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EBA1306E3F0
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 08:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398173ED127;
	Tue, 10 Mar 2026 08:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7xKq1sZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A573ECBE1
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129635; cv=none; b=CVn/OCeGC0ofUMtaYSt0psURwyLHYcLhgdmtPDwZUzLeW1L4pEZfaGopF4RX1to1O4kM4Z4IxVpRlR4tfUrbXqDZz5+XR4gx4i/H1f81sWg2xOxLIPJMx8pPN3XNfEPA/tP04Cs75ZFGq8y33wGq8Y4YfvVpjthKanrpvzAfDAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129635; c=relaxed/simple;
	bh=xVd2KkktmzKw76cEeI0oO0J3/DjTaqN/lKS7qxTDDIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jQA87BIms2eERPBjtyq1EDjgNb2HrZMeIGLIOenISLARtoBAim2RkZgiPnaI2LQEJlhgBfg6hw3b0Qmn5LppYYDfFQaJNeE6bc9kBjjnG36mfaZBOEl+CdNdQ72hiRmifZFGkaqCZ41QkaMlquRPdeYyrUz+mkKVsEPuX+pfxFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7xKq1sZ; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso4738771a12.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 01:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773129634; x=1773734434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TGL5zvBiqfkZiXMUWnmqLW+ywfahdDcPkg4MN2yXqeY=;
        b=i7xKq1sZn5lUuy9HHZLkqFYLzGOU0TTTZMN9kzR6WKc8sd8c05qZkrwvCFFMJBfL82
         KeeertXIQnezkrNTyE35eXnX17PC/wDwsAXb7KRocUyJ63XsXeS0rcR3ypSuaqjy1B53
         +JCYNFQ5wZIqD8nyGLNzsW1X1AdY7YYqYxtHaUdHRTQTDXeRcQX7+f5SL76+VmOh6N05
         yV76NHYKHI5JA1uskneqfAp+gPHDvlUFfNk8gYNXafW+hd7C0Cufe+yu62+V8aVnQv0I
         oRpDlcFV1SWuHc+uw2l6j19a2VM3mDf/DYwTvp1IezsxoUyPhnaKD2krjozoOUfegvL/
         6gMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773129634; x=1773734434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGL5zvBiqfkZiXMUWnmqLW+ywfahdDcPkg4MN2yXqeY=;
        b=pd7N/+njZWQOFICVc0530IgbSdx1PYlGIKp7+E3lg3Ub61WhzfYOfxJUhlAJjENZov
         /CGeqk2z36ThVlmBq03QjfEQpQjvbCUapd9Dc/y7wBGoTL29cDxAE46VTw+nWq50K+5I
         hCMNMNAF+B1e9zacHvHVSHZ/IO7ihwkuMF9WIk13T7g6DUp8nicxYrlb67BDwsAweKZ1
         9bgqMbEy3TG8HglO+GDietUuwIcNskvCSCHQj7ytJH+gWD3oGBWGhMIcjCYJQOKEMXkt
         cxm3wCZ7hANvtVO/XNoy5ek+FJZK4I/Rqe0P9GMHkIxXTtk/qsUH5ZEmV28W1U5Ood6u
         qmJA==
X-Gm-Message-State: AOJu0YygLsu0VD1QADfx4TyWAWSHJO+sjmXGgao+5v/byUA+YgQvoMq8
	MziN3JY/23Xb4bhSDdV0k3J9tBJudWzOc0oZcWGkvpOdtOrJ1/6WuQHk
X-Gm-Gg: ATEYQzxUH7+W7LLM4mMz6vNB+CL4Uu6TRgEu3LC8OkKfDbV3gEAizG2aMB9ZEObmaVE
	c/p2SF67jJwJXhm9XZjnmo4Nmd/gH/DNxzRx5Wsnk8ekYanSGu2IDXA/HAzREyZzCActYRHSJ9C
	hU4bKeWQ29jaC4k+TVmTDauOeFL36OiNt4UocEbz2jUit+V0SfgRdJiRC7O5mNmXUu/h6FZ3mzt
	0KeZNGFEaGL3WGloQUfYkGhNK+mfy4HxhodLYKK+9VfEITg8kw5XVc0+5oWRcl6alR02UcnU8Ab
	6qaFRys5xsMOf7yIewVObF8P8yiCoGGZcBRwQgRbAfmMq9ziE6jSH11j98c3qfcTXbdHmvWyp86
	RG2ZWE5x7B9QwwOLB1R51xUPLCoLX0wKDTjAYFlXVUjaptUOcdrImx61AjonilH7hwHmGy+/rPC
	D5YuG/+ZqzB5LIw369fcsi5MRADNlc6N3kXDtTM1zoj9Z3yCk=
X-Received: by 2002:a17:903:3904:b0:2ad:ab2c:d258 with SMTP id d9443c01a7336-2ae82385466mr154776925ad.14.1773129633523;
        Tue, 10 Mar 2026 01:00:33 -0700 (PDT)
Received: from mm2dtv06 (61-216-20-61.hinet-ip.hinet.net. [61.216.20.61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2130sm148689535ad.83.2026.03.10.01.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:00:33 -0700 (PDT)
From: xiaoxiao_li <lxxstone@gmail.com>
To: hminas@synopsys.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xiaoxiao_li <lxxstone@gmail.com>
Subject: [PATCH] usb: dwc2: exit clock_gating when stopping udc caused deadlock
Date: Tue, 10 Mar 2026 16:00:00 +0800
Message-ID: <20260310080000.3164692-1-lxxstone@gmail.com>
X-Mailer: git-send-email @GIT_VERSION@
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 34B30246E53
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-34379-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lxxstone@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.971];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

dwc2_gadget_exit_clock_gating invoke call_gadget to hold hsotg->lock,
causing dwc2_hsotg_ep_disable_lock unable to acquire the lock,
lead to a deadlock.

To ensure that enabling clock gating before stopping UDC does not
cause the deadlock, we lock exit_clock_gating using
spin_lock_irqsave and spin_unlock_irqrestore.

Signed-off-by: xiaoxiao_li <lxxstone@gmail.com>
---
 drivers/usb/dwc2/gadget.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index d216e26c7..c8b02c27d 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4607,7 +4607,9 @@ static int dwc2_hsotg_udc_stop(struct usb_gadget *gadget)
 	/* Exit clock gating when driver is stopped. */
 	if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_NONE &&
 	    hsotg->bus_suspended && !hsotg->params.no_clock_gating) {
+		spin_lock_irqsave(&hsotg->lock, flags);
 		dwc2_gadget_exit_clock_gating(hsotg, 0);
+		spin_unlock_irqrestore(&hsotg->lock, flags);
 	}
 
 	/* all endpoints should be shutdown */
-- 
2.35.1


