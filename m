Return-Path: <linux-usb+bounces-34707-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Fu8LTQPs2k9SAAAu9opvQ
	(envelope-from <linux-usb+bounces-34707-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 20:08:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F6E277770
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 20:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BE993030ED9
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 19:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53ACE397E90;
	Thu, 12 Mar 2026 19:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Nt6+wKDY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5A63375C5
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 19:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773342513; cv=none; b=kph/Dm42O+gujG17WtZidF6VeQhgMgvBJAH5DCJG+FnNH9ZXZssRcs0srpU53k4lEF4fLg0JO302y09oxnA57zY7qp1LMqFF6U3HOvaa2jf+NT6maHSLbG9jL0tUl2DWyyBMZay9vXlNRdYpNvFXUiv00t9SlB/DBIGVn/eqMT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773342513; c=relaxed/simple;
	bh=rlw7vcJT6fYP+b9VD7DzcuKWSe2ilm2bxQ1uoV6+SPI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RUTzo7odDNMqAaRzOH+taF5p3uoEJyng2V5Y3hO+8Kp2OyS6zXvx1sicDS5kc1Nmibh4vfFBJqSvg/s2eekskYnonUjYHhEsZJfG3+IVIDdSe3PdbAvfPkVWZrBoviYYNeTmRcEYWSMsJK1ldZxFxSppBzDAtirhIsdSsEiMQPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Nt6+wKDY; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so738817a91.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 12:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773342512; x=1773947312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUXbea6QKRzDcqvVKEwxyV3TOlSzxbp6/w4bcFBJnaA=;
        b=ScNW7Ov0e8O4F6XwGpQKV19mOG2UXosB3XNH4kdyxEyQidXc4i4EHKTskt8eSGqh2q
         VHKtgwY1ydmTZEvOCbfx5Tx0f/4XMVsYQWApsnSJOpHL0x0ynIH6lHaxY+PBClZaQkqx
         n4mKngpQu6EfvMRGHXejWSm5KsyA25HdYo4oBz56uWPN3Eo7vsnM0OtaC5mAtIQTSJVl
         ysayBNgGNj7POQrzIFFNLdw4Hsjfx3HY3y7Hbhe/JlOlku3NmguIRyUQkotpSUquGUIG
         mR3J261Wjy35/DXjbaYTIQR1Y+IloRRURwFPKCrhJ/q6cXbpAuV7aYUY7tJmeu3B1i0e
         u2SQ==
X-Gm-Message-State: AOJu0YzNGuVS5zVnRgVEIe7zYGXYTbEYNTXF/xLYNVm9c7gfc1KJODu/
	1rOVRCuE6J6ZhmwWa1T31ttyDOFsSAgnC21H8H3F6/0AC+9cpoHz5T6Rfg+ayHUhKAzpr+OvF0/
	3lXh/IbavyA46gGos5saCsEd6Z+E9BRFPSoX922feXM4fL/AFAhQxD072BjJ+9G/Mit4JeTxKOR
	euCEI4uJW5BozVzLbWWUE08XKXFwhs9xeg7j9nsWC+8Hm31laByqlCwZmImB7V33YS9FGUd/bGH
	Y0Chogcj9WaJA==
X-Gm-Gg: ATEYQzwO1di4o6Ht3cLxqHLfn5i0XJvm1/WjOnX6Yrc5AWT6hMcihm7ztYT7UsCaasa
	7qq3NCWlBCQZ2tL4L2O1+QzPaSRtbzZHneH4LqIEQ0pKU8qaZtTo6aXBRaxETOJ2ae2bpmPEIKr
	9RfgKZwTT8Oaf6zHcT1o/PScPenoH1cTpETeLpcyGYzwbRlRJDoJQFvkjoB4mR6cWMlEE+jpwE0
	eHtqlvLcv/jMPg4vpYszG+33m+RxbWHIHaLavumELF7zmC+GyuKh19tK/OA/z6rSYlNO0dq4ufX
	2QYETv5BTfco2eCVO/KY0XlTF/nNZcfY9QhAzHo6mVAZZuWtTmg47WLgli0KM4BCzCQ0wolQEds
	1owT7mGRRRFlNoYQuAjgXsxfcnGvL6itruKcuP48U/qYQFbIwcqVJJ2FeNoU14jiJUCAvhZNE1U
	NWexFmYYhuMmCcIAkiJXGuRkucOgj/2FoXPrKfHD2P7/aF5Ng/PbCdb/s3RA==
X-Received: by 2002:a17:90b:1d09:b0:359:8dfd:64c8 with SMTP id 98e67ed59e1d1-35a22053575mr557834a91.24.1773342511961;
        Thu, 12 Mar 2026 12:08:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-35a23d9f3c4sm19690a91.6.2026.03.12.12.08.31
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Mar 2026 12:08:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1279caef718so2155285c88.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 12:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773342510; x=1773947310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUXbea6QKRzDcqvVKEwxyV3TOlSzxbp6/w4bcFBJnaA=;
        b=Nt6+wKDYO5zBz1qZnLkcPUmLG52htxQAit88swDlLKEKjcW1GKUmGwwYMDduIwfsvN
         4/PE4XlQbeY74Tc6wZ9AKn5GNSciSfeqpG9KH2kLTZ6qoN5zzFtOcbH8q1CbTwyPYXVS
         RzfV9c7/a/xgOZ3LbOiLqWHKwDONZsCCNjUy8=
X-Received: by 2002:a05:7022:f9a:b0:119:e55a:9be7 with SMTP id a92af1059eb24-128f3d01a1amr340042c88.3.1773342510177;
        Thu, 12 Mar 2026 12:08:30 -0700 (PDT)
X-Received: by 2002:a05:7022:f9a:b0:119:e55a:9be7 with SMTP id a92af1059eb24-128f3d01a1amr340011c88.3.1773342509418;
        Thu, 12 Mar 2026 12:08:29 -0700 (PDT)
Received: from stbsdo-bld-1.sdg.broadcom.net ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128e7cb558fsm9908113c88.10.2026.03.12.12.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:08:29 -0700 (PDT)
From: justin.chen@broadcom.com
X-Google-Original-From: justin.chen@broadcom.net
To: linux-usb@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	alcooperx@gmail.com,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	Justin Chen <justin.chen@broadcom.com>
Subject: [PATCH] usb: ehci-brcm: fix sleep during atomic
Date: Thu, 12 Mar 2026 12:08:25 -0700
Message-Id: <20260312190825.3596757-1-justin.chen@broadcom.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[broadcom.com,gmail.com,rowland.harvard.edu,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-34707-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[broadcom.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[justin.chen@broadcom.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 52F6E277770
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Justin Chen <justin.chen@broadcom.com>

echi_brcm_wait_for_sof() gets called after disabling interrupts
in ehci_brcm_hub_control(). Use the atomic version of poll_timeout
to fix the warning.

Fixes: ("9df231511bd6 usb: ehci: Add new EHCI driver for Broadcom STB SoC's")
Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
 drivers/usb/host/ehci-brcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
index 888e8f6670d2..5e3156f94cc6 100644
--- a/drivers/usb/host/ehci-brcm.c
+++ b/drivers/usb/host/ehci-brcm.c
@@ -31,8 +31,8 @@ static inline void ehci_brcm_wait_for_sof(struct ehci_hcd *ehci, u32 delay)
 	int res;
 
 	/* Wait for next microframe (every 125 usecs) */
-	res = readl_relaxed_poll_timeout(&ehci->regs->frame_index, val,
-					 val != frame_idx, 1, 130);
+	res = readl_relaxed_poll_timeout_atomic(&ehci->regs->frame_index,
+						val, val != frame_idx, 1, 130);
 	if (res)
 		ehci_err(ehci, "Error waiting for SOF\n");
 	udelay(delay);
-- 
2.34.1


