Return-Path: <linux-usb+bounces-33621-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AjJAMBUnWk2OgQAu9opvQ
	(envelope-from <linux-usb+bounces-33621-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 08:35:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F58C18316B
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 08:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE7DF30BEE65
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 07:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210C936402C;
	Tue, 24 Feb 2026 07:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpCXJcaA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A783230BBBF
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 07:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771918384; cv=none; b=u/uy1rBjPBXIYFXxdBAp1Toc5b8xdqd38rtsKcipU7PBEAhYYVm8xHcm9TCfr8wW3F7cvLTMXVFDRctPO/O3rNb87F0WYCqW5FLzY/VtFCfS+MT8oGxwSCl/BjyXTuyOaTa6klP7a6Ra1hpfykGQo82qoddRq3r5aV7yl+DkjNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771918384; c=relaxed/simple;
	bh=dGJkN6SnVshmKW6KFF4UVx9o8lSkn1Lt8gx8YuivxlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EKOixeBQaKj9iGa4Dq0uDpHY4ygpDc5d9RrLG8f9m9RMzDGKgrwvFtsJ49Do3OYTp1vFMvvLdX9iaCnuY6VnhmTZv66eHJR1YjgQSoyw1ko7h/7KWn49lR+hQUsVLhdcUKIJ9SxT/zKOuy9v8HebDxbWaDdej0cY9qS77MPi6F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpCXJcaA; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-8220bd582ddso2348837b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 23:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771918383; x=1772523183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1j2htuqmQpTTkLQ6035xROAKmDGpEfPVgSnXewPmtLo=;
        b=IpCXJcaAK7k0hT6f4MwikAdkW+l7zxShjxPvEpC2htMGtQOgaqMZnr9giLDTsH//fh
         ytpldfUj2cs1t5mPEL0aAFrtfK2epgtX/P/grDXIPEeMyvrwB92m0cTdjlyVJp8OuTsH
         e9wSN8MrRR33M4Q8JbNG1visBoAv2rXgIeoMHemWBZgPTMpf2lVWk1NSt3Wp5jnQ8Vrk
         Aqu+I6jWvxqkepKcXWCCUuOf53K5gMIwOCKs8G3XDXvM1n9n1C7ka4tDqAi7plMfey6J
         71uWVrmzb3LG6eVaOJsBu9jC3wbL9KmXrq2tpqBxk7OatCdP0btoxj/5zwOBNttxfFuw
         Ay2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771918383; x=1772523183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1j2htuqmQpTTkLQ6035xROAKmDGpEfPVgSnXewPmtLo=;
        b=Vm2KXh0AotzS6Z5IocHrnfVNVAYlSfyFD1nXguViMyxptrePhrkC4XgSGGkQG7ji5Q
         caFFi0vp0+Gw5WsgBr3SgouxEs+qzaAx55e4UH1JoW1r9j4JH77Rs4hw9Bd49Fb1IW4q
         jOqShWQcbehYJRkCUarAB02953YZaSXG5dIpZyxMGh2PW27arQYZkFvgUfmtsPXwvdKH
         l2WmIC7nxg8Iw3obEy2E3yw2UcWywx+beGzG4NSucTPCHdpTl1BkQXFDWrwwDgTf+hTt
         Bn76QQipIRzXHVpGLNgnveuNByLRTKwz0iSlRH39+BEMJ8klnuUPeMbc9o9S8u1MjRtj
         yJHA==
X-Forwarded-Encrypted: i=1; AJvYcCVkVFUNmgDp0EnFkwEI78xFm4zxSJddJYi+/+VlQdhM5lsVXU2as1WcYawTQjbne62wvHI8slzDvvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAioSncEB9Wnc8QM4OgjcnIa35+pJV1Al7BF6QM/bIaj535Eiz
	JfRdLM0+bbPq6osEwi1k+z1+/t0PUfu1DePseyF4EXP4yaQt5rHCaU0B
X-Gm-Gg: ATEYQzy2nMNx1PRWS0Ws4b5ID+v+1cFR8CCP1czvl5m+eLhl3VrPrvJSDIkYFSvmah/
	Pl/FjxZldUk7o4eH+98EoYvcHyA1dMeZe/zRyCRLd4EAEaLCDVxbm2G8FLmDJT9BKbJhN2MVvYl
	JojtwfVpblsIsHtXeFgwtCQun6TvBi6154Nq6HqkU2uynzJxsfk2VfPceYu67nQXSwxl30Hu6pw
	JZOLFAi/Yvq069hB5JYFgz2nWKeE2sPgTe9rn1zzbH8ExcTTyBU6aU3wkjwgtCCwQDd90LcIWYq
	QsAFs4gc8BfJC33qmalYFWdh2mmmlQ9wxtC2yt/aCHTSDAJxf6uSigDzPjPwWmc3UnXtEhjltTZ
	8/puQ0efatILUGg6eqaKxCeGzI/qsmJbWKaFE3z+KhbNttOeQsRjVMnyBcbVo18iRS2GfLzx0n8
	sjKUjtobwJSkkX6kCgf0jLTRP+0exs66VEbiirsYMlkUjcqUh6XZO0lSV24PnQMSIlukBw
X-Received: by 2002:a05:6a00:2886:b0:81f:4294:6080 with SMTP id d2e1a72fcca58-826da8f1ab5mr11354487b3a.20.1771918383031;
        Mon, 23 Feb 2026 23:33:03 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8cbb02sm9994587b3a.57.2026.02.23.23.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 23:33:02 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-usb@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH] usb: dwc3: qcom: simplify error check in dwc3_qcom_find_num_ports()
Date: Tue, 24 Feb 2026 12:32:43 +0500
Message-ID: <20260224073243.9053-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-33621-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8F58C18316B
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


