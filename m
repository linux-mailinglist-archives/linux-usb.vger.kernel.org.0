Return-Path: <linux-usb+bounces-36707-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEHpFLpG8mmTpQEAu9opvQ
	(envelope-from <linux-usb+bounces-36707-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:58:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1CA49869C
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2343630180A1
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 17:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A9F41B36D;
	Wed, 29 Apr 2026 17:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exolabs.net header.i=@exolabs.net header.b="esMDdbL9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB30E2F7AB0
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 17:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777485472; cv=none; b=MGtrlnhJsQTmV8Kl2p/8EuQj5EZSU6BESGi4wAuXvTaR0tTYcTSyJvHp9bBDS/yOPYmAB8CWa52WJTber+u6QYfILSBOuHrmTaed1gc4rACxpKOYQaF6yZuAncRhdQzuX6eQq4woTxHxOLrNh4IGLjatLN11EKAAni6on7uDFko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777485472; c=relaxed/simple;
	bh=dYrR3MI17KQdoNiO5C9/uKZ1P7EdorGQm+mkjzWQP2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZKgnuBUOMzEUjwrdO5uVnHaktZhAsJMV3+uCWeNrL1YttG1M/15QFRP6gXm1RqsmH+FdjNVeE6aLEF25eSLimq6w/cpYpBEc2teS1Y1lZqy1PX0fOApAialnB37IYg560gACEuYDbeDCUx5nu+wTgmzH/Sm+JnZ0PDSc1PVtT/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=exolabs.net; spf=pass smtp.mailfrom=exolabs.net; dkim=pass (2048-bit key) header.d=exolabs.net header.i=@exolabs.net header.b=esMDdbL9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=exolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exolabs.net
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891cd41959so225625e9.3
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exolabs.net; s=google; t=1777485469; x=1778090269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zmj87Zm4VqL2ScecOeVCpF59dcRWY4w4mExIZWF3a7c=;
        b=esMDdbL9UPUGz6fKH/V4+1UdwFu5qGMGQObEd2diXP/KVLZ9tZtQV1hCU7O1ad1A1k
         j1XYYtVgJPHDaZYa6kP4m0M5s97RvB0WrX3QP0VZ4m6mEUqmzOyLYQHv10qNwCcJ3E/c
         qHU46KLAjq6xQV3JuEGXvndbCeMY0fA3GLV88MatJV1YtMlt2cKmXOAgVGJ3r7I4rKKe
         aVdkehck8Qdiet1CxdkAyzFLStyVz65F7+c1K2UcWZUJ24lHGxwThj2QnT6NFSZn4ESp
         nUfEh8JuNvKsQhGKnyf8bZH3c9KoJYG8GGaAWQ6qP6p+WrXWC0gSfcFa2P/T+F8hDG4O
         nP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777485469; x=1778090269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zmj87Zm4VqL2ScecOeVCpF59dcRWY4w4mExIZWF3a7c=;
        b=r7H/LVcptaYO0IC3UW26iMTdDD00t86T8Z8Hho3wVcJpXc0gSXpBmqRpysdvRPzvAt
         wwlUE7+gKXrZJOUK09sxgkE8KjnIIGmEREREigNRxiYC50JNASBjL7Y9aAuiGTQ077P0
         SpFPOjXEb5jtwxtUvh6m44j4tCgNDDEtxwq507KOOLvMAfCALeJYxHOZ636/WW4iJiJj
         3a5OyxqG10+/P/xTSoMtHuNnZ+0Nj+5YWYyVmdQnlJCYXgteArqdVgGY1jnJ337rbGmn
         tMApfrMVMWRNksT/R6njgQRsRAZmL8f2fTv6GNrL9mqT6d7iZ39TQPU94BCaKnO6OkXp
         5ilg==
X-Forwarded-Encrypted: i=1; AFNElJ/2RCk/4et0S65vBgViT49zljoyF3aM2BZMTuhtJY0uzLieIKK+ZyapDf5iP7Y6UDWtwZpqF0CdI2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZksQobk+BOPhvZ3kJUv14g0N0DYhvU5LAJe43cW3iKHr3tGaD
	rKlmLbXz6up/mqSi4qmXwtCVyX402DBM2jYsKgI2RQ0ISknKgv0vr1FTzE3dgAFg6dM=
X-Gm-Gg: AeBDieuVEq5z9Rykb/wCYOaqBuI0O+H2xFRtJDkscr4RTjfWyuahySJx4Ppacw9IsEk
	yWPJWwoH6Ip7M2diqyYP0Q6SnIN9E1aJw83sbZEcAsVGE7/4wjOv7pcDhNDJ+paboqRgzFiakws
	zKiV92kFvsiXoueg4AdU9DmYAYnrNK7mmV8tHjqMaJwzhbKy+mVpRU3WAFAVjxOkCjuSFpCOMwU
	rRY10zce4Vub6qttFX08ZywI88qv9/khO9vMN94h8I2tIbFM38cSGm10RehW86kOk/CS2hD5kWY
	Z9ua3LLZYimGL8Nqoeixkb9tluDtulZESuQNHN4u9C9/Me2Co5tQY932YojjlBMwgEQU/GJaSgN
	K30WyE5eTMP3X1Er9pyMKKo31mC8K2HljoF269wGJrwgOD1P9ULOLV/Mmhi7ElE6igAf7iw+YZc
	8mjedpqsIpoGxU4JGYsilFTBkwfySGC0ZSeXdwM1YG1f8v1qRje/vx9EpHNj7AIKTlMrANTKRV
X-Received: by 2002:a05:600c:a11:b0:489:1a3a:9e45 with SMTP id 5b1f17b1804b1-48a77b1b405mr144142895e9.26.1777485469018;
        Wed, 29 Apr 2026 10:57:49 -0700 (PDT)
Received: from localhost ([62.64.187.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6bafsm11585895e9.2.2026.04.29.10.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:57:48 -0700 (PDT)
From: Alex Cheema <alex@exolabs.net>
To: oliver@neukum.org
Cc: bjorn@mork.no,
	oleavr@frida.re,
	kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: usb: cdc_ncm: add Apple Mac USB-C direct networking quirk
Date: Wed, 29 Apr 2026 18:57:39 +0100
Message-ID: <20260429175739.34426-1-alex@exolabs.net>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EB1CA49869C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[exolabs.net,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[exolabs.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[exolabs.net:+];
	TAGGED_FROM(0.00)[bounces-36707-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@exolabs.net,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[exolabs.net:email,exolabs.net:dkim,exolabs.net:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Apple Silicon Macs expose two CDC NCM "private" data interfaces over
USB-C with VID:PID 0x05ac:0x1905 and product string "Mac". This is the
same protocol Apple already ships on iPhone (0x05ac:0x12a8) and iPad
(0x05ac:0x12ab) for RemoteXPC since iOS 17 -- both data interfaces lack
an interrupt status endpoint, so they rely on the FLAG_LINK_INTR-
conditional bind path introduced in commit 3ec8d7572a69 ("CDC-NCM: add
support for Apple's private interface").

The id_table currently has entries for iPhone and iPad but not for the
Mac. Without a match, cdc_ncm falls through to the generic CDC NCM
class-match entry, which uses the FLAG_LINK_INTR-having cdc_ncm_info
struct, so bind_common() fails on the missing status endpoint and no
netdev appears.

Add id_table entries for both interface numbers (0 and 2) of the Mac,
bound to the existing apple_private_interface_info driver_info.

Verified empirically on a Mac Studio M3 Ultra running macOS 26.5: when
a Mac is connected via USB-C, ioreg shows VID 0x05ac, PID 0x1905,
product string "Mac", with two NCM data interfaces at numbers 0 and 2.
The same PID is presented by all current Apple Silicon Mac models
(MacBook Pro/Air, Mac mini, Mac Studio across the M-series), mirroring
Apple's single-PID-per-family pattern from iPhone/iPad.

After this patch, plugging a Mac into a Linux host running the patched
kernel produces two enx... interfaces (one per data interface),
"ip -br link" lists them as UP, and standard userspace networking
(DHCP, NetworkManager shared mode, etc.) works without any modprobe
overrides or out-of-tree modules.

Signed-off-by: Alex Cheema <alex@exolabs.net>
---
 drivers/net/usb/cdc_ncm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index bb9929727eb9..0223a172851e 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -2012,6 +2012,14 @@ static const struct usb_device_id cdc_devs[] = {
 		.driver_info = (unsigned long)&apple_private_interface_info,
 	},
 
+	/* Mac */
+	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x1905, 0),
+		.driver_info = (unsigned long)&apple_private_interface_info,
+	},
+	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x1905, 2),
+		.driver_info = (unsigned long)&apple_private_interface_info,
+	},
+
 	/* Ericsson MBM devices like F5521gw */
 	{ .match_flags = USB_DEVICE_ID_MATCH_INT_INFO
 		| USB_DEVICE_ID_MATCH_VENDOR,
-- 
2.47.1


