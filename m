Return-Path: <linux-usb+bounces-36893-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFOELl+K+Gl+wQIAu9opvQ
	(envelope-from <linux-usb+bounces-36893-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 14:00:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 127D84BCB40
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 14:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22E953037457
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 11:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBB93C2763;
	Mon,  4 May 2026 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHDiEtWf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D0E3C1966
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 11:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777895976; cv=none; b=Ylv+txHSCCL3w5mN24nccJw0iYtL1o+euuAuLvBTdnQAX93Tz40DbkSSwUcbaBewPZ8CiJmIcpb5EX5gPb8m0ufmuT16DnkjFClnSEswSv1k2PVvJIU6JVBBnVRDGDtLloQqYzOTgNYown/VDYrmmaySOK2vPUJu2sHI7XxXvro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777895976; c=relaxed/simple;
	bh=Q/7DI/418Z9BXvFQ898YzPEBILzR4ohpk0WcU0PIjM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GHKDy5aAudPTqJL0dKD+jBZNWCrgF2w4z3Nw8p/4VISaCBTACJWM9oylykhqk/sIt5lJ2nW/sQLCLG/wDHdBt23o9hRBhuMREyo7Q+0OV8oxnWyI/g7uN769Vjqa17BAZrek8idEl62/2hEOWpa+IPltsrKW6IxIyUaB8K+wwnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHDiEtWf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso42016975e9.0
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 04:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777895973; x=1778500773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzVsgDZby9PDM2/13YNZf1kQ3sR73SnBQtInxpnAz7s=;
        b=gHDiEtWfL572iSPq6xYZWPTZdkqAoF0arvSJR6DOxtixQieTiqMKbom+YZ4tGZ5ole
         h6BdMqhsVUCEg3i9XH4S+O2Ao6X7cAPmgsCo+ZTgUYQYb/vc/vUPCei9AJDeUrw1vMHu
         viVjO8oEoQnoGGugi7/QRa0B47zZ37YbkVo2cSh5BQIisrdVspn8+4N+ZIKi9r4QnFxB
         wHRdkYjqx4M8zMViP7GrwEuDI+hLAo+bmhoUSXQqWERci4SbBTHJtSoHIYxlPeV4U32X
         uNlbL4bxuPsS/BL7UeTDBNlzKHBACgLxD8c/orx0R/jkVv2nS9OHPF9sHcqft8eC33yI
         fSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777895973; x=1778500773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gzVsgDZby9PDM2/13YNZf1kQ3sR73SnBQtInxpnAz7s=;
        b=Z/vszpwMLAFdg3jEvm/NfWof46tuX2nuBm0/WqC1Mh0m6pqwltPh9W36JZmkNzYDNo
         OCoj+cg2MzcYO7MBCe/rN63b0rQ72YBU2icbxJ//HE6avnMtK8TyqQOjjrJwDj0nXgPU
         S0iTaArcOQlwPSZHLINAoE4WVJDCVG0//fnaPL2p2uVk8o+kNHsRUy4FBkhh/XvXrZsQ
         VFagUJtCBxwypTFCWpHgqewg8ye3zEcpaLcdugOXC3nTHVaQcspKnpcHNvufIKBWwoiz
         iVtDSXHnt9HKK5WDYnL5w2H43C03nsyT7un/O/D09cAWJnWmz/nPa2cheeFcYmBWwlvq
         nHbQ==
X-Gm-Message-State: AOJu0Yzzj7DcsfCfekGTooCUeZtgOSrTf1YZ7rsKarDJvqhBg6Z0P3OB
	llUFicCLjX8pQysTKu9s0yJO6VQSrYyKkPaBsMs6C4nvWkaB1livbLkz
X-Gm-Gg: AeBDieun4aV3+5V4e6SBaZ63NPhOcap/BAhibSdc7KS2K2s12HDxcYpeCnYcAiUG529
	XNVrvvgaAj5CEkRQVPcxR3rdpOFFmMicfhb4LN8CDN62VVsrWUa1lTZeCPBVDvch8KYGkI2xYmg
	cT9YKHQucmfHQUGgeTS+2xyvet1qRUlQu3EV9FJO6ucHTH94bbrT5qA3p9b1I9Xb7Op3N2fDBHk
	y4I6i1tbs4x5hGTltbm+JLWRutcb9EXPIpu8cg/K21I3e6ShzCVveQM7nY9aR13rv++YQSpL9Z2
	NwPieOX/GlUeEoAxSg57/mUPjinf8NJtWnvp8yuYwNfzvgZtE1dVnhMTQ2YaZgAQBeYrPraeMos
	3E8uTZIsfGz0pEkEvI0fLxM3v4URLFKkMwy8k/OFbltJVW1n8TamxZYR45qVCtI5iAUxZhfLc8q
	JXoBCXCFHi4NftOoi4g8s2D9Gqa22L
X-Received: by 2002:a05:600c:4f8a:b0:48d:46a:6e43 with SMTP id 5b1f17b1804b1-48d046a7074mr94626235e9.5.1777895972981;
        Mon, 04 May 2026 04:59:32 -0700 (PDT)
Received: from localhost ([213.229.133.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fee5033sm78729095e9.22.2026.05.04.04.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 04:59:32 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jameson Thies <jthies@google.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] usb: typec: ucsi: yoga_c630: Remove redundant duplicate altmode handling
Date: Mon,  4 May 2026 19:59:26 +0800
Message-ID: <20260504115927.48925-3-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260504115927.48925-1-acelan.kao@canonical.com>
References: <20260504115927.48925-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 127D84BCB40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36893-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-usb@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[]

This reverts commit e0c48e42d818 ("usb: typec: ucsi: yoga-c630: remove
duplicate AltModes").

The yoga_c630 driver previously implemented its own duplicate altmode
detection in yoga_c630_ucsi_update_altmodes() to work around buggy EC
firmware that returns duplicate AltModes instead of empty ones.

With the introduction of the common ucsi_altmode_is_duplicate() helper
in both the standard and nvidia registration paths, duplicate detection
is now handled automatically in the core UCSI code. This makes the
yoga_c630-specific implementation added in e0c48e42d818 redundant.

Remove yoga_c630_ucsi_update_altmodes() and its callback to eliminate
code duplication and simplify the driver. Note that this causes the
driver to switch back from the nvidia registration path to the standard
path, which is the original behavior before e0c48e42d818. Both paths
now include duplicate detection, ensuring the firmware bug is still
properly handled.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
--
v4. rebase
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 0187c1c4b21ab..dae2f41f8d823 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -137,28 +137,6 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
 	return ret;
 }
 
-static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,
-					   u8 recipient,
-					   struct ucsi_altmode *orig,
-					   struct ucsi_altmode *updated)
-{
-	int i;
-
-	if (orig[0].svid == 0 || recipient != UCSI_RECIPIENT_SOP)
-		return false;
-
-	/* EC is nice and repeats altmodes again and again. Ignore copies. */
-	for (i = 1; i < UCSI_MAX_ALTMODES; i++) {
-		if (orig[i].svid == orig[0].svid) {
-			dev_dbg(ucsi->dev, "Found duplicate altmodes, starting from %d\n", i);
-			memset(&orig[i], 0, (UCSI_MAX_ALTMODES - i) * sizeof(*orig));
-			break;
-		}
-	}
-
-	return false;
-}
-
 static void yoga_c630_ucsi_update_connector(struct ucsi_connector *con)
 {
 	if (con->num == 1)
@@ -172,7 +150,6 @@ static const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.read_message_in = yoga_c630_ucsi_read_message_in,
 	.sync_control = yoga_c630_ucsi_sync_control,
 	.async_control = yoga_c630_ucsi_async_control,
-	.update_altmodes = yoga_c630_ucsi_update_altmodes,
 	.update_connector = yoga_c630_ucsi_update_connector,
 };
 
-- 
2.53.0


