Return-Path: <linux-usb+bounces-33688-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF+CLiycnmkZWgQAu9opvQ
	(envelope-from <linux-usb+bounces-33688-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 07:52:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF8F192898
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 07:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E63CE30259B1
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 06:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905502C0F91;
	Wed, 25 Feb 2026 06:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBzfC6y1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F877296BD5
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 06:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772002340; cv=none; b=KgYkTQcjNjd27qwEB9KntRKGujwIyMPEUOIMO7anMkUnNCwGkvAdZDu5VupNhCM8dsa+6C4p8vEq/g4Vmzsjshs0BwA3tFiXOKk8XFzueKlv/GYYYOtdtkZzvnhrXl1vO/qSRaCf2OqnAaDfcglB+IVyo4Opdtf3N6neud9PK00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772002340; c=relaxed/simple;
	bh=wWlnhUKYqV8Wx/7Onzg/8pKZVFcNwdYvLbRKD8COaVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GpvfhLJPc4gxSrJrhGoNA5uaJoHxTcSq73oha7HNOcmCYgpFEE8dN3eNamUd5Bz8DhnlyWIhZkc7P9Ar2iYgVTu8o8789Cmp7ANTbzsVLrPpPLkXVRLH1Ej8LIEnhtDOHl3/R6jbISofoJ862Wt6NT26G5G0wKUM8IlTRuPhGTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBzfC6y1; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-c6e248aa446so2560978a12.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 22:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772002338; x=1772607138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDedFaVY+KaOvNB2BxP1xWzhD01NDhi5iX3Ein+K0U8=;
        b=VBzfC6y1tatOMh7V65zNo4ttdmTWe25uBOx9JVQvyY3rWhLbYqjTa7ocg3QFnp2U4P
         gL8NBL67BJuKRU3GnKtMRLHGBAh9hv0dynzCMdSp4/SA0Xvd09GRq7dXjCJsebe/CfYq
         BLGRoIyF4s4Pf459H6joid/9zAPGmfeHCGA+Xma3E09K/J0+LyIW14jCza7njj+QtuNN
         SFfWdMGV3MKzm74oxb4/LgyYO3EzZt9HuFKqpsLeca772omb8xpu53+vQUDaoBWDfMCP
         9KS3iqbg5ZUw8GpvAxgNQlCkZQs7BTPo6elOaPv2X9t66KkXC3o8gxTaDEK0UG9iD1NS
         G8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772002338; x=1772607138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pDedFaVY+KaOvNB2BxP1xWzhD01NDhi5iX3Ein+K0U8=;
        b=nahqePe2KRqcNy/pv9ZsDHsbHUge/q7Nrm1ceIwGRWaPwayiQvIymHx1fxWX84LI9u
         YgCyGQZeg1b3lSL387z+5T9excTjsXlm6GZAzggLmJ5jLScG2O7CIriSDd/HoHsWF7zX
         U6O+wQ8lzpuL1sMDDizFCY1F0mgYAJjpof/ySCANZOq/P5GVy/RiYoEAGNHpV9jB32P1
         r1sh/rTsKVm3T2k+S6X1RCOhNA/WYXK5INUFR9gMrWHjVMC4Y+djKHt/gRV3nXNWl+Hz
         Gqi0TjBoPSyHKE1MQCD8L2qzjdhco5vKeXu40UUX3xir1jCRZFJ8t7lMIb2mPpUsjvjG
         +RHw==
X-Forwarded-Encrypted: i=1; AJvYcCWgr9Blwn6VKMwxuNjUSVBAUAg81oGvO/Q2zpaHkB4q1kq7lUecC9ev+5k48G8E6Pb6CZRC5OUcWX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YybeiTq+V50gHEjVMsYqppAD1TYVQzQTt2uuy9Hl90Op+H+tkmK
	JzWns33PZZQh2gss6P34bree4KIChYcy5sVbtXXOT7JSSC8715sTnWoK
X-Gm-Gg: ATEYQzwCPYP/pbdZL3bjdGHZNWKrOhP8Y52frDmmZSpBHv6XVNpZYi96u5KtbcmM5CP
	YMnSfF1Xr96jSCRVY8rGSMXrm6udggf0YMeoZYDs1qkNHcU5KrXPAGZYUqYlWwd24oG9K8Tq5S4
	hg+hJ/l7829ewzsjDKm7GvnZCBeYESwXRldUtKGE3/pOHbejub5FQn61GkHvOOfwvOJ0wWAPLTX
	lRyKz/UZ/RFO5VgfNNnnUbdfz4GeSen4TjWPxBgZmCQPuyxA5g/zxr8WLmq5fAeuA4JVzadXna5
	rkYeu49kHpsDZ+D+PXQ9J+QcVuo/pCiCk9NhwxcYD/a10z/QNye/RY3jeoeflj+BcPvgfXq06Ja
	VV3aUJl4IN+86sf+/jtSQ+SN032FLfjIr+bb+DzTtzb4WY6cHszT0/kbDUQ0WsoRfuL086zTJgX
	WTyhbkMeoVJXFLvaj5P+IjoCfSpW80dTXdYAsPh/uasnOj5epkwekGPHOS08Y8yeLIXotED3Uow
	wEHrGY=
X-Received: by 2002:a05:6a21:b8f:b0:393:c607:9d3c with SMTP id adf61e73a8af0-39545f79318mr12151549637.47.1772002338417;
        Tue, 24 Feb 2026 22:52:18 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3591349c87bsm434207a91.2.2026.02.24.22.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:52:17 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-usb@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH v3] usb: dwc3: qcom: simplify error check in dwc3_qcom_find_num_ports()
Date: Wed, 25 Feb 2026 11:51:57 +0500
Message-ID: <20260225065157.8952-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225064245.8833-1-zeeshanahmad022019@gmail.com>
References: <20260225064245.8833-1-zeeshanahmad022019@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-33688-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zeeshanahmad022019@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EBF8F192898
X-Rspamd-Action: no action

The platform_get_irq_byname_optional() function returns a non-zero
IRQ number on success and a negative error code on failure. It
never returns zero.

The current implementation in the modern dwc3-qcom driver checks for
a return value less than or equal to zero. Since zero is not a
valid return value, simplify the check to only look for negative
error codes. This aligns the logic with the standard return contract
of the platform IRQ APIs.

Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
---
v3:
 - Fix missing version changelog in the v2 submission.
v2:
 - Targeted the modern dwc3-qcom.c driver instead of the legacy one 
   as suggested by Thinh Nguyen.
 - Audited the modern driver to confirm the same redundant error 
   check exists there.
 - Updated the commit message to specifically mention the modern 
   dwc3-qcom driver.

 drivers/usb/dwc3/dwc3-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9ac75547820d..f43f73ac36ff 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -526,14 +526,14 @@ static int dwc3_qcom_find_num_ports(struct platform_device *pdev)
 	int irq;
 
 	irq = platform_get_irq_byname_optional(pdev, "dp_hs_phy_1");
-	if (irq <= 0)
+	if (irq < 0)
 		return 1;
 
 	for (port_num = 2; port_num <= DWC3_QCOM_MAX_PORTS; port_num++) {
 		sprintf(irq_name, "dp_hs_phy_%d", port_num);
 
 		irq = platform_get_irq_byname_optional(pdev, irq_name);
-		if (irq <= 0)
+		if (irq < 0)
 			return port_num - 1;
 	}
 
-- 
2.43.0


