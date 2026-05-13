Return-Path: <linux-usb+bounces-37409-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Jj6BGK3BGqKNQIAu9opvQ
	(envelope-from <linux-usb+bounces-37409-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 19:39:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 897F853829E
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 19:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BCF2319D5A6
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 17:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4464D4DBD70;
	Wed, 13 May 2026 17:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NoJk58hK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39894DB56B
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 17:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692466; cv=none; b=Trqo1nX7N2ML7hwKv3kQyXkTjikWSY1OzQb6q8AHaxluh6oYt3Pr2yCDqso+RWt/p94x0l/+1sYy2sm4oORWjrfBkUSJgN5hM8LQrztCcLm/JbTe9p2MNH3CnnAXxhFqOBr8whtdxOw5iGa1VStnSkc9eyZ5o6Yx+yJ8LiWD4CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692466; c=relaxed/simple;
	bh=iKeWzjXgVgJZSlhoA7v8h5tpKEAamJAN9TlarN8/rfc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TKq5Vn0UBT5l02Eyh/bLQfVVCLTFAciDlgxRh5ZrYpO4WPFpThiC+csgIuQQEMnKFDKp+Ooi0X2tpqMh5d4pOGkruoiF3x/8iv8SNo/A44aXdNFH6RLcwUA0XGGNV0XnPB/cVjfk6YoDuWERk61pljPUdRPzic1pgTdTmU8hiQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NoJk58hK; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8acb1f75435so4528096d6.1
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 10:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778692461; x=1779297261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=atyHDLXGzMnMgHFcHtRTpHcYjDNE+LB6RZeNY5wBGB4=;
        b=NoJk58hKzkbmBXAH4eobR4ZaF5sui4saBrRN9UFlQjB4LFaQcEtGZhz7rb/1p+9pqG
         lWjyQ7WcHnT2IYZyyKwpsfyyJ92HSA6IxC5K2i75vFd3lO0XBuuGVCSa5605QYKExqTt
         iHqbXUcau8TikrR5wsm6QINWwAfh4slktkQ4b3FkH74ufbxR95M+DJ779KptuPqdc5un
         X8PMZhui11vflSZIlWzCToZD3qhwn6/7hOHS+PAJ902uNqhKcbuemFfgTfpGShKjZNLu
         kKxvkxTopdBX5+cUo6CY+0zm65bPGdjNVMNq4rxotWRcaBGuhThvCcfb36AmkPhSN7mI
         0bRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692461; x=1779297261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atyHDLXGzMnMgHFcHtRTpHcYjDNE+LB6RZeNY5wBGB4=;
        b=mFiGrIrpcHGXdGGzrJwJe0Tq9bk78Et5jb2dxlifyEt6q871qt7TjO5JYH9CF+oX5Q
         39cnyY6J4stsYmt5jrCvZjdz+et9Wmb8tj5bKx5p0QUvNlF78qdqswsLE9MYfutw/Dxt
         klKQ67lElHcFjNSswSqvKH1T91yyJhh7E5Fr7R/c9H6KzlNFkYViWtq1xukOdeAC5n/8
         j3lphaCiWtrinb4vwZpe2p52+4x8k5veVDN/Kf2l8Wj99O8eqh35IVhgHSvTTIMWnZTp
         bw0eacdl5IM/gH+sN+0Z1eSTth8gfG6XrOyB5ubhSfBVlm2BREo/sGCRXF1sWMMhFaTL
         DsDA==
X-Gm-Message-State: AOJu0YwBjEs0szxRmE6HtnQ3w3vi0/D1lVXYeignxc2FHSudLXBp3HMp
	WTkB6XFDM6HTJg2g5NSwXImuk6CjhQ/cGf7De/yIRkOAp1XdKXPdkrBQ
X-Gm-Gg: Acq92OFVS5iWKVxdXMgq37Zk790KyDG8+uZ9Ah+qVAH41rhvmCcWrNcEEjA4nm2KoD6
	iPQmn47FsXsJrNl5MT9SBE2mXI2YlC9kOxNPMrgjDsC344/BwgJNudAufYiKUm08HmLrl4RAkHw
	KKJiyTr/MblE+3amFVCEq3BYyWKHfrM7bK21gCLdZT+d0ENaLSzejFn1qgYm0xLh27cBmzpDj8a
	Rw6xBSdyk5xVMAkSbwoNeTdTnkHacwMOB+Dpni5AM/9KuhPZiKDCt75mWXVOfF86I3g3vLwD+yN
	Jr+CZVDGw6DI7FqpkmayNXXOtCfIkUqTld/Xf3/+T06j3HSDh6tTigjOxfbuJTTWVZyDyPc9d6T
	EFtb7/cMCDyAt/6BWPgql6w6StwpTet6isMu6h40QmRZRtnWQoN9pcvF0cS59v/jw/H91z5k1cn
	LOADUYiNvvlmY+PtD3DHkiOFAQTdoS/IJoAk74Hpgwo3fxtWQOHcLufmOUQNhLq136E4MqDHFqF
	cF5SXmOj10=
X-Received: by 2002:a05:6214:e45:b0:89a:5129:510f with SMTP id 6a1803df08f44-8c7b5e3804cmr46391166d6.0.1778692461472;
        Wed, 13 May 2026 10:14:21 -0700 (PDT)
Received: from debian-t14-gen1-fuhrysteve.fuhry.app (73.sub-97-137-122.myvzw.com. [97.137.122.73])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c35cdb1sm793836d6.46.2026.05.13.10.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:14:20 -0700 (PDT)
From: "Stephen J. Fuhry" <fuhrysteve@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Stephen J. Fuhry" <fuhrysteve@gmail.com>
Subject: [PATCH] USB: quirks: add NO_LPM for Lenovo ThinkPad USB-C Dock Gen2 hub controllers
Date: Wed, 13 May 2026 13:14:19 -0400
Message-ID: <20260513171419.44849-1-fuhrysteve@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 897F853829E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37409-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fuhrysteve@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The Lenovo ThinkPad USB-C Dock Gen2 (17ef:a391, 17ef:a392) hub
controllers exhibit link instability when USB Link Power Management
is enabled, similar to the dock's Ethernet adapter (17ef:a387) which
already carries USB_QUIRK_NO_LPM.

When the dock reconnects after a transient disconnect, the hub
controllers enter LPM states between re-enumeration retries, causing
repeated disconnect/reconnect cycles lasting up to two minutes.
Disabling LPM for these devices restores stable enumeration.

Signed-off-by: Stephen J. Fuhry <fuhrysteve@gmail.com>
---
 drivers/usb/core/quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 0ffdaefba..87810eff9 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -513,6 +513,10 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Lenovo ThinkPad USB-C Dock Gen2 Ethernet (RTL8153 GigE) */
 	{ USB_DEVICE(0x17ef, 0xa387), .driver_info = USB_QUIRK_NO_LPM },
 
+	/* Lenovo ThinkPad USB-C Dock Gen2 USB 3.1 and USB 2.0 hub controllers */
+	{ USB_DEVICE(0x17ef, 0xa391), .driver_info = USB_QUIRK_NO_LPM },
+	{ USB_DEVICE(0x17ef, 0xa392), .driver_info = USB_QUIRK_NO_LPM },
+
 	/* BUILDWIN Photo Frame */
 	{ USB_DEVICE(0x1908, 0x1315), .driver_info =
 			USB_QUIRK_HONOR_BNUMINTERFACES },
-- 
2.47.3


