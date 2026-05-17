Return-Path: <linux-usb+bounces-37541-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDweMJgGCWouFgQAu9opvQ
	(envelope-from <linux-usb+bounces-37541-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 02:06:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2610D55E8D1
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 02:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29930304C887
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 00:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AE678F29;
	Sun, 17 May 2026 00:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3h4W2Q0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FE1175A7E
	for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 00:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778976161; cv=none; b=BCfeJXhTw5rcfuM/kzAyDbVN4KSvtE0pEMNadQp9hAejtdVI5JP6KuaLcJeyRRWTNolmKAOCmcPUkFXk5fRWdRQpEfnBm2oZ0wdArAQ4Lql3I9CIcbQLw1bFBmTVaxZvaeLk1jny5pN3GdTzA0DFjQ9j9TrjxAlxGRikxPSs4Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778976161; c=relaxed/simple;
	bh=oQJngmEu0j3+tcN/u4AN3DlXYKxuepMSFr6Cvgon1iA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HklbpcLHFHqKPTkkjCTooj2YviNci4UuwIJq+LDrMdkbD9Y3bTa+Jz6FRfzFjwLT+BSwZYxUbO5In4V66N90CgJIj2Z3gS25z4wz7+Sxl8x6zi3JXI+yYtG/ZPFXyHZHltESunekXtaqmpB3T3steS8mmH0Nly5+HrRz19KA/wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3h4W2Q0; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8c64d635955so12071806d6.3
        for <linux-usb@vger.kernel.org>; Sat, 16 May 2026 17:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778976158; x=1779580958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJ2BXWX+6MupH7Oh26vJ/9N7l3A/xSH7CB0Vx9j5o38=;
        b=K3h4W2Q0UL3EqLBl8pzwIxM80sSqPBiDRv2nf2ad+9hmDsAk8MAIvJnbGIfK3lcYvq
         Umi4JiC7rAa3W4z0c3Nt2zt6TGpukole5mbPq4yl1ga7RRwi0xPbQdkVGOnSQiFPTU1m
         qJtZQxmNc4Es2mQ3E72CuPkJn2j1u8CSYOu0NOzl060WzV0i2VB86s7zJEwO7ExiYbvh
         t3kVIZSj2kkvA94drArJr5ZjFo2m61GT7HpTec+TAwJNiAeKpMDt6/gJGSe9VbvM3fwa
         uOLUsc00XNm0uOUS5mLXB//8qBKmQ8PJ8Wlo8QZv4v9cc6RfM+83UuE/eHsXVyR6LZHe
         tCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778976158; x=1779580958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJ2BXWX+6MupH7Oh26vJ/9N7l3A/xSH7CB0Vx9j5o38=;
        b=NUEyP5G/HmIPl1m0K+jq9m0XQJ4exQOwdqEitkuRDNxX08mslzWz4o58chbq9l1S9q
         L+lGXuXJIB6UaOshxqD32xCinhVtYCNLFIA4QIABu/OgHCtOuTe0Np1fuuu8Gy7vp4ab
         bqeUhiA/qKZYxyysvcEFOYgGFRuKvwtRH2eNEG0FKtmtAK7saMej+PrzQVA0Czwz1qH2
         rUN1bAeXtVnJZjPb+4yymfyf53fsGBIOPiw6RVB3sDVoMTXQYC5sV6bJ5vwtOy4E4chp
         MpDa7yILGjWEKHsHOVcNt/8D5bEsQWnxcTqWRoMrn2QhkET0qfFKs9Brjih27K9VXwFb
         onuw==
X-Forwarded-Encrypted: i=1; AFNElJ/wAsiTlyEeROv9PBbDkbDjAZI6Hhv7vEcWZtZm8oVJacQtkUJWInhjVBueNZGR55ed8TM2ENNbl6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWvllhVhX641HkTXk9GK/sDQieROql2a0J9IhXxj9B5EMQutvb
	FrgnYqeg6M5C2WlRXqgAjDMZtcrkCw5uoO1tBZRHHSmArivGGcZDP3gl
X-Gm-Gg: Acq92OEvon3kkWKGwzEC/XHceuFGzG6vMWKcrcpwKIrio2OBKdM8pWhdcXNouRnuuAE
	MeW5sBiBx2LIutrJ/2sISHnHbJSUUIAuDdp/WQm/iWlh/JLqdEyTYMSb8PQtkEPDZg3XOSulHHt
	pQguf8sITkA4hyPU4LWvbvFWqXAWdkwNDvX2462eHBcPPfLmFt5dLnMfHOj0L/Xdnnxkfk4lOQP
	APEFre7naTwuT85lYy4wBtnpK7yFl+Wgk1bdjIOfXNncesLLC3nl6cx2EpaQlBuYXRvlOMso+um
	pXX5Db8w35zvJO1tvOmPIG0y8AAj8PHpaM2pqqZNRTyA+9lVtofsztGUly+jj7pFjHGVZAH05X0
	hJKJOGyKtdZmawk9xlCSkPNNR+gb6TSUkj+cAHY/DIWhVwMA0xmNixwTHiDuYeTBaxwe2dR1sAq
	B1e8wru99+aqBN+TV7T2wvLLQyFWQgLXYwmHnQK5ZqAiQaQ829hedbM5ySOQeVvQ==
X-Received: by 2002:ad4:5bef:0:b0:8ca:25c1:ec45 with SMTP id 6a1803df08f44-8ca25c1ef16mr70226216d6.10.1778976158578;
        Sat, 16 May 2026 17:02:38 -0700 (PDT)
Received: from mango-teamkim.. ([129.170.196.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca361b8b10sm2980956d6.46.2026.05.16.17.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 17:02:37 -0700 (PDT)
From: pip-izony <eeodqql09@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Kees Cook <kees@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	David Mosberger <davidm@egauge.net>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: host: max3421: Fix shift-out-of-bounds in max3421_hub_control()
Date: Sat, 16 May 2026 20:01:46 -0400
Message-ID: <20260517000145.1868817-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2610D55E8D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,dartmouth.edu,kernel.org,linaro.org,egauge.net,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37541-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eeodqql09@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Seungjin Bae <eeodqql09@gmail.com>

So if a malicious userspace task with access to the root hub via
/dev/bus/usb/.../001 issues a USBDEVFS_CONTROL ioctl with `wValue`
greater than or equal to 32, the left shift operation invokes
shift-out-of-bounds undefined behavior. This results in arbitrary
bit corruption of `port_status`, including the normally-immutable
change bits, which can bypass internal state checks and confuse the
hub status.

Fix this by rejecting requests whose `value` exceeds the shift width
before performing the shift.

Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host driver.")
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 drivers/usb/host/max3421-hcd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 0e17c988d36a..3d6b351dcb1a 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1694,6 +1694,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
 						!pdata->vbus_active_level);
 			fallthrough;
 		default:
+			if (value >= 32)
+				goto error;
 			max3421_hcd->port_status &= ~(1 << value);
 		}
 		break;
@@ -1747,6 +1749,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
 			max3421_reset_port(hcd);
 			fallthrough;
 		default:
+			if (value >= 32)
+				goto error;
 			if ((max3421_hcd->port_status & USB_PORT_STAT_POWER)
 			    != 0)
 				max3421_hcd->port_status |= (1 << value);
-- 
2.43.0


