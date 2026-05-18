Return-Path: <linux-usb+bounces-37647-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HsQCJWXC2oxJwUAu9opvQ
	(envelope-from <linux-usb+bounces-37647-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 00:49:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC03574CC6
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 00:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7CCE53007A5D
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 22:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF8A31618C;
	Mon, 18 May 2026 22:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIcKTQdO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A5C2D8391
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 22:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779144579; cv=none; b=pDdhQi35natB/kUEgD4UWtGnGvme5SRlbAnjYk/q7WjMhP6jQyx6+ov+sKHfzfU6qcH3/OV9oD2sUeE1ADgvprYZyvmkMl00yXzHF5GwvEcV3OjWvSJ3LCRO045azj7CiekWtm3+V9fDw3uu/L1szbKLkllhUkS+r+abFRProx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779144579; c=relaxed/simple;
	bh=obvmUuH9tGA1XvVGBjUQeAiWSZlvr7iIRG8Y4fqxxAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JcobrRJfcGrDdzSTazBWkL4llIqf1Zs1uBuVgkiHUfg6mfffc0KPZU/4BI4uO6aOV1i5eGBsmJ4l0BGFkm8BsKdLtVrGdeIu5HsuoinJG5FFGDrloV5k6D9wsEA4x+lM7uEaAMXJurAvsaOLlpAiZ+0UT9nq+gh/wehtoZSxays=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIcKTQdO; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50faeb8317bso27344781cf.2
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 15:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779144575; x=1779749375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkcB4m8RZ7/R+/GSiMnKRnb7AxtDaYWk7VjkoGqlKOw=;
        b=kIcKTQdOzvKGyDgpLF5+PfqbO6n4QUfDY9SbuTUIMv3S5sh4o61VyZsBtr+77VN8dE
         2ql0/NmZ/YgUQQ1ENSTmS52SAl0WeGD4yQrMEAdJOs6rdJ3xDEenLn3WUJd2UQH2Vm0t
         yRnSnoNRtOI/fQ5xmzLxhj4drde5j8d0A9DBobIEHWB+Qfo79zsSlEHYIqe38ebS6Kyb
         i0l+SzRRo7PiQaR1caGm5qY57B0YzS930VAXhb1a2McOTvODAUUgb5IOmKH1e/ca0qeS
         cR8rSW5b8Fj+9o1kk5LmxNkzo7lqyJGsIcOzcTtCUkaopRwCTNXJMCuh39TXI8YgzseH
         ScWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779144575; x=1779749375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SkcB4m8RZ7/R+/GSiMnKRnb7AxtDaYWk7VjkoGqlKOw=;
        b=YhXvxiL6SCvsaBN1Q1UmwYNKnI2peD2ZKYjQJa+jA7zWrR3FZtQcajyhgOGrUD+ZTD
         Ny4vNSfEn42LRZ2s6vByb6DREwzJWZIZrIP6+nYlN+aJdftGKHXT2uDiflCd7mxFxAXQ
         /up+ZV+1nnBFdhKjt7zZRGhleDqP6tEvq5UePPJVsxHdmZeSv58koUp05YzOoPSlcJcB
         xgzb28zksOzNlCFCRxDXwfOJoBbiLjkXVeHgn6D+Jbp3014SX9hE/9waXCCo3tVMccZ8
         HTj17b1l2RLUPnJEXKNmSmrA3FzxEulqYBnN9qQVrdgYmT5y9600F/R6/GAYx3xyTT0e
         AhLw==
X-Forwarded-Encrypted: i=1; AFNElJ8qZeo7eIx4Cfm7w/JWEXfYuUZSGAW5fviF1XcIgL6Vh5TjxDybDY9ECFqU5JONlUvd89Hmx0L/W44=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1+UhbTaek5+P9tetzdxGUJNEzAYhj6zGfdiBkW1/dybJOZfBx
	DEEINF7MvBsDtmFcxLThS3FruMKa+rCE3a77D6fk6WWwgWm+sG/knYJt
X-Gm-Gg: Acq92OEeOvitW9n644NyOeo0rB7P7qhJr9n9f5GJGONvxQJ+/tKm8BkjqlajE3qUKmh
	D8efmzQAIwb1MI9K1UrkIjS1ZfCecvgAI6yO9nDW2l7+j7jGycAz7hYH3QtMMtlQc5pKekSdSxC
	Z0Ks600BWeTpVRt3FrAauzzu2AL7W50J91al9kzwuI3EQMVSZAFuEQ9+XMhITAkNJou37RPhIr2
	0foesmBJHdxftnqbnMLnuf0n2Yq63VPtkpG+SBFlx6EKXD2/uOEfgKNt7R8XLtWkaPfbZwL08Fd
	8KhEpvekkvB5NGqe11HW7C9vm7gehqcN4bk/7enwiNR8a/8YOVdpjRP2zkMiQIBzjWcM+3a+d9g
	rEEgfy3wgEP3E69SKCBt33RaXyGGt5lMqngEjpRxfaPFc5HYiZzBIT3aLHAjO3G622thsMT27Ym
	uRBgoAnpwPejNx87ZmFLOQ39b7lvzyPC6akqUJ5NNngjESHERIz997onkLVcvclxWDRO2IjavYs
	RNV/XI6wtc=
X-Received: by 2002:ac8:5a93:0:b0:50f:b790:96ab with SMTP id d75a77b69052e-5165a219020mr241010061cf.48.1779144575270;
        Mon, 18 May 2026 15:49:35 -0700 (PDT)
Received: from mango-teamkim.. ([129.170.196.167])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51645687d30sm154720631cf.4.2026.05.18.15.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:49:34 -0700 (PDT)
From: pip-izony <eeodqql09@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Alan Stern <stern@rowland.harvard.edu>,
	Kees Cook <kees@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	David Mosberger <davidm@egauge.net>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] usb: host: max3421: Reject hub port requests for non-existent ports
Date: Mon, 18 May 2026 18:49:02 -0400
Message-ID: <20260518224901.1887013-3-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518224901.1887013-1-eeodqql09@gmail.com>
References: <20260517190308.1876316-1-eeodqql09@gmail.com>
 <20260518224901.1887013-1-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,dartmouth.edu,rowland.harvard.edu,kernel.org,linaro.org,egauge.net,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37647-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eeodqql09@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[harvard.edu:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1DC03574CC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Seungjin Bae <eeodqql09@gmail.com>

The `max3421_hub_control()` function handles USB hub class requests
to the virtual root hub. The `GetPortStatus` case correctly rejects
requests with `index != 1`, since the virtual root hub has only a
single port. However, the `ClearPortFeature` and `SetPortFeature`
cases lack the same check.

Fix this by extending the `index != 1` rejection to both cases,
matching the existing behavior of `GetPortStatus`.

Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host driver.")
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 v3: New patch in v3, suggested by Alan Stern.
 v3 -> v4: No functional changes.

 drivers/usb/host/max3421-hcd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 3d6b351dcb1a..73e76d0e6973 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1685,6 +1685,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
 	case ClearHubFeature:
 		break;
 	case ClearPortFeature:
+		if (index != 1)
+			goto error;
 		switch (value) {
 		case USB_PORT_FEAT_SUSPEND:
 			break;
@@ -1728,6 +1730,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
 		break;
 
 	case SetPortFeature:
+		if (index != 1)
+			goto error;
 		switch (value) {
 		case USB_PORT_FEAT_LINK_STATE:
 		case USB_PORT_FEAT_U1_TIMEOUT:
-- 
2.43.0


