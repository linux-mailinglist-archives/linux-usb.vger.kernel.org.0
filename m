Return-Path: <linux-usb+bounces-32599-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMPXKGUIcWmPcQAAu9opvQ
	(envelope-from <linux-usb+bounces-32599-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 18:09:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC715A52E
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 18:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 286CDACD5B6
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 17:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9025A481FC1;
	Wed, 21 Jan 2026 16:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="INLtldtP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0828481FD0
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 16:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014321; cv=none; b=DRU2NJsxOl5zl9+MgbIeD8wheHX8rS0+B/Q0eF1gqoADs1774JVMmrxDDlQaPiYsBCApSzOxcXqkTuPLDS6/qvjlVmaA+AjBZvR7MRIVeD7Y3IYAZNbstzYH/+NqEkLBk8Y6cpWgm7ZLjVBIKyfBj6kxlGUoXwXqjDYh+9CzGU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014321; c=relaxed/simple;
	bh=J2KlbxlXxnBv/Z3eotJpClvqg//zYndwVmqTs81NL30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=drX98ykQTwer4lG2TnHRc6e/ltajkmZJPEi0bC2PEAHIGpMBawPMY9iilaBeaBzQBVbQc+oiVpCfx+5CtEteLoZ0HPz/zWtAgw1wxV8ZEWD2BiiscW87M0EdP0j4WnrTFX1wcGEqhuTr31tn+ikRwFp8oSuOYebGXSZaS6dpgB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=INLtldtP; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d122733808so21414a34.2
        for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 08:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1769014317; x=1769619117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TpYUUbJ5aqOqspZ1DTvcPHqXjq9oGVafce549lbxQ6s=;
        b=INLtldtPuWc+TY6OVCojXtkKLAlCW5Gj7IadtcD7OtE0c1bt7muKUQflY+rmX3ueg5
         C+Wq1z3zIg95rO+cOniWO75bWSrCQepSHtZjKq7J06MPfGjc+rZG1MfNH6n8uH5O34F6
         D/0SQKZb+diMI9S+ae3t86XH9jdHZVLtQsHPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769014317; x=1769619117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpYUUbJ5aqOqspZ1DTvcPHqXjq9oGVafce549lbxQ6s=;
        b=IXWmKlbTf2gG15LhoyIivwrZKSnYTAjrSIHSYygzAUg00g2AUL68gjzYBLo0qiLKEb
         PNPAAz9HQ6rd2livGiYM8KPU4j0BG59YQpVbtmyKtDsPskRcL2cMgPQWdEdRNnQ+oO65
         JO/GZM817pNB4nDFez2H+4OWD6ex6LlQcXaji+JSAhH4j5xaixPrfwOLnNp6ui6Tputk
         F5YK9G2u2tDqPImWMagDM7zC/BE2Zu55SIVh5meukJcYDoOmhsc2qhVZhX/AZy9rdWoX
         IzY5MPS8WfLpkjccepEoEpSl27m5u6gRZK0qEPAS0LkTnatr5fntS49YEvkSZgBl1ON5
         bbIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkfaNdDXFg8KmIXxrREu+KyaaU2VmrL6aaVXzZOD7+0Qivm1H49Claia1n7ZR+C22PpTqFkORr8nI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaHT3K3bdcolDsW9MNxnxFfI4tSdefn6aXa/MNTkRxpOY/OFda
	43TBd2ceRnwyMChIsD8YJCehKjElQyJGIdik3dSEQkuBeCyAikMQz1y+tilimAwAgPU=
X-Gm-Gg: AZuq6aKIs65G1ZxWCst/hAK8XpKUNM162+XyPjtIcvyW7Sw3/f+aeEELRKdPgL2DvVK
	uR9PO+r26M0H//lw2iYOnVpqsBKVKZgk0M3CHC2W5PPt5Ri9pEGF+kT9+kbpvHIuP7tE6/2eey2
	rVNWxbHbWFrABdAVarUozqJ+A7OW3znKnzXvrU4I+uyxv+6mzAy+ki9VjtESju31rF8S1OuGJTt
	SYsj+CJNfCkFHPr5IqwnfUAg5rRnLIMgDxOJ2V6ss1hXzAtm1MdZXiN0Y4JD6lTIDI2xW0cdchw
	0oS4FZAe2GrHNw3HIBjqtgeWPIaM1CNN0Ku61z6xKzAMrNbr60/2V03xXs1gLWCHzplAk1fukb3
	7TRv3x2AZrjWW5v3LQWFdiOZIKshphLGDe6pTIv6vl2ZeLQjlih8JbLnu1LmCJmIAnSKvlLuOVc
	s41Z7VsUjmLRTb0fvL9kxXRHW1O39/F1nfatn0
X-Received: by 2002:a05:6830:6735:b0:7cf:d1b7:c319 with SMTP id 46e09a7af769-7cfe00d95aamr9993847a34.2.1769014317421;
        Wed, 21 Jan 2026 08:51:57 -0800 (PST)
Received: from shuah-framework.internal ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfdf000b80sm10830804a34.0.2026.01.21.08.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 08:51:56 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	gregkh@linuxfoundation.org,
	ignacio@hernandez-ros.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools: usb: usbip: remove dead-link from README
Date: Wed, 21 Jan 2026 09:51:54 -0700
Message-ID: <20260121165155.13550-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linuxfoundation.org,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32599-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,zenithal.me,linuxfoundation.org,hernandez-ros.com];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,linuxfoundation.org:dkim,linuxfoundation.org:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,hernandez-ros.com:email]
X-Rspamd-Queue-Id: DAC715A52E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove dead-link to Debug Tips document on usbip project wiki
http://usbip.wiki.sourceforge.net/how-to-debug-usbip

Tried and failed find the file in archives. It would be nice to
locate the file and add this to usbip tool.

Reported-by: Ignacio Hernandez-Ros <ignacio@hernandez-ros.com>
Closes: https://lore.kernel.org/all/0101019bdf6ca137-60344502-51d2-4767-a34b-6a7cf1bfdf4a-000000@us-west-2.amazonses.com/
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 tools/usb/usbip/README | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/usb/usbip/README b/tools/usb/usbip/README
index 2fc021c0eae1..11971538f03e 100644
--- a/tools/usb/usbip/README
+++ b/tools/usb/usbip/README
@@ -241,8 +241,6 @@ Detach the imported device:
 
 
 [Checklist]
-    - See 'Debug Tips' on the project wiki.
-	- http://usbip.wiki.sourceforge.net/how-to-debug-usbip
     - usbip-host.ko must be bound to the target device.
 	- See /sys/kernel/debug/usb/devices and find "Driver=..." lines of the device.
     - Target USB gadget must be bound to vudc
-- 
2.51.0


