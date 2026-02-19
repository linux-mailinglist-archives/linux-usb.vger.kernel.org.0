Return-Path: <linux-usb+bounces-33482-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xEplO3Bel2m2xQIAu9opvQ
	(envelope-from <linux-usb+bounces-33482-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 20:03:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C792161D8D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 20:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BDC0B30101C6
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 19:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5472D23B9;
	Thu, 19 Feb 2026 19:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VY8coU+f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FDB38D
	for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 19:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771527786; cv=none; b=b6Zghe93UpQzFjBKXSEh8b73ivyRBIdGcpj1V7QhejDLFQlXo7GEfY5dP5PdOQb+IEXnN/Vtjamo6MOFuEI2gGNRCQPohhqGd86cilQk+oecKUzU+AFlcVqBfTYsOMDkzloP/ZSOQ+EaE0aSJET1UYk2p17on610ZAJ4HIhcF/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771527786; c=relaxed/simple;
	bh=E4Y5VqKzl1sVgsFhDPR0shOlX8sziKBUs+VZBRTu/XI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mAtbQpMw9wFkb6ljeLTTqoZKpfHKjvvqF22cu+e7UF6oitQBJw/w1GB8sNOvx+U0lvKkI5MSZoh1BAxlp2DqsFlr58yUTiV6XiqND0GudQlQ0bBZXNpJyAEvhn7Bqi4vUbmU3y6zbxUqjSoC71JC+tE1BZ7UbEOh8JEFgwlGU0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VY8coU+f; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8947e17968eso14249236d6.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 11:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771527784; x=1772132584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=puO4dboL06pU7gk1TdqjNfV0tFpKk5xpYBh9Jtpdeoc=;
        b=VY8coU+fjK6kLU2fWShH3bjKnizzEBM01XRLgnI2dujMucKQY4Tq+wa/fzFaoJWE44
         7qL6JwDQdqAdAodmx7oBB3BSgWOCBQE2s6vM3n3S1KIs9Zu8btP50WKw9IczgPYbX90R
         Uw0SieRybBH3aChs1ONGKApBd0nRWhjFNqifTvXbHjrnO3ZkuAoKpnBGXaO7AxxdN6In
         mEEAZlYHZB+55LB1Ay8Iyt9bfuUWVm6PU8GE+zeOB1ZoUM1FJ2F0hxV4WUdRqhBQzrDC
         ob5HP/3BrPWbkVHMOHORNTetprxPBEJZb5kc8MuQYF56VW5UTVgSTDdqX1QXSa1bLZPI
         cqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771527784; x=1772132584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puO4dboL06pU7gk1TdqjNfV0tFpKk5xpYBh9Jtpdeoc=;
        b=diZFnCIN2ZDFGkzZq5hMdymxbTqcEt7Bhh6p61oqNzCZW/mmCmzo7JEXBg+OYoLLs0
         9eztsFQcq2FA5bcQuzWB2lcx3mTl3j3msKIOgE24ocTLuWX7odw7DNL3I2klnpdsyV3t
         XLJ2vW4lWXcviJ9e8JoUbZMGY1u75GfA02Paff6dSdwDkJVDNrI0kjvkzW0L/fgjYhkr
         TetgzBVZs02+dT7wgBsgdalEoVMYLBFmsNCvt88/HjPNevE4VDERa80DbUb+34CkHi68
         LEu/3XKALcIL0aGGxQ3mJVGnj7HKgPqwmjhdlEE4sG6OyjnrUH7DPHbQ/Gx41zHFUoan
         Co/g==
X-Gm-Message-State: AOJu0YwWwrIKbk5x3b8M4/Vo5WCim5RPq+9rqbPqMoAzwMKkxFeI6ey8
	PB4tG2oIOCZpfSUCaLDMxwDTPpyfPmCa1YmfwPRwgVe/137rDYtoHqoH97/JDQ==
X-Gm-Gg: AZuq6aItsxim52cnoWVzW2ermX7teZsc+ZMYb6UlTVp9QqERTl6rxKtxmm7l5+fO/IK
	I7TQsnUhvmCJTtZgsE6o5wFBk2ExEn62KmkGpgZc5HeTU/CsV49T0fpLi+DPeqbdEfjMRfSj/QL
	U9wvrrUkuiKTeCx57iMx1n2hYzWbIqJK6e3ahIN5RU1oVyZXvLXcpIfMIvOteg4qYvQ+IuZWiHS
	V3gUY9oCfl1Lg3WhJn6dnvACVDJwfR9cvbEuJHO10OJHNP0Uj60RgM3YY/P0WbfOBlV9jM0GHNd
	1EcDmnOKzw/BwFo9Qf+zZ8G/mQrnHK+gRnzjiobFPOiRI3N/koxDau+HmsrUT3qlMORldsoAlk/
	dCpseinVsBhq/lqAfzXd5Iy/L1GrskBKKy4fm64aXKpPZQkf21zUJYBaChrnMM9d5UIxcFaZSR2
	mbryRljL0FJsPgdLjAI9p8ulu+I/G2rNkqIi3t5EHO8CVWdeFeGVqrg3kZwb7QM5dnWzrNZwoJK
	FXgtDd4lS0TS0+4SIY=
X-Received: by 2002:a05:6214:1c09:b0:882:4be6:9ab9 with SMTP id 6a1803df08f44-89734948f9fmr332819466d6.54.1771527784008;
        Thu, 19 Feb 2026 11:03:04 -0800 (PST)
Received: from localhost.localdomain ([129.170.197.80])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc91eccsm218274026d6.13.2026.02.19.11.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 11:03:03 -0800 (PST)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	mitltlatltl@gmail.com,
	Nathan Rebello <nathan.c.rebello@gmail.com>
Subject: [PATCH] usb: typec: ucsi: add bounds check in gaokun_ucsi_handle_no_usb_event()
Date: Thu, 19 Feb 2026 14:02:51 -0500
Message-ID: <20260219190251.3422-1-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33482-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathancrebello@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7C792161D8D
X-Rspamd-Action: no action

gaokun_ucsi_handle_no_usb_event() uses the index derived from the CCI
connector number to access the ports array without bounds checking. The
index comes from UCSI_CCI_CONNECTOR(cci) - 1, which can range from -1
to 126, but the ports array is sized to num_ports (typically 2-4).

Other functions in the same driver validate the index before use
(e.g. gaokun_ucsi_connector_status, gaokun_ucsi_handle_altmode), but
this function was missed.

Add a bounds check to prevent out-of-bounds array access.

Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
Signed-off-by: Nathan Rebello <nathan.c.rebello@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index c5965656baba..9790296be0dd 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -349,6 +349,9 @@ static void gaokun_ucsi_handle_no_usb_event(struct gaokun_ucsi *uec, int idx)
 {
 	struct gaokun_ucsi_port *port;
 
+	if (idx < 0 || idx >= uec->num_ports)
+		return;
+
 	port = &uec->ports[idx];
 	if (!wait_for_completion_timeout(&port->usb_ack, 2 * HZ)) {
 		dev_warn(uec->dev, "No USB EVENT, triggered by UCSI EVENT");
-- 
2.43.0.windows.1


