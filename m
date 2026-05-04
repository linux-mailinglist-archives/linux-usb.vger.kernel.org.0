Return-Path: <linux-usb+bounces-36892-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJW8LjeK+Gl+wQIAu9opvQ
	(envelope-from <linux-usb+bounces-36892-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 13:59:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5BD4BCB30
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 13:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E703A3014955
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 11:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7346A3C198E;
	Mon,  4 May 2026 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ql2BJgCo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884563B9D84
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777895973; cv=none; b=qQrHV0sVkznXFu4SuSg/b7hxoi1er9E5LD2OcM4Lbf0QOYKzoEC0icfP+RbR0y6SJTra3kgNg8fGiOu2IFexOzqBjzR/B6OFWgceIoDQEpLZG/2+j92EVYACH1Bf7CnA+ykVdEbF3EAWresHqfLBLJ9X9HNueawfAU0n8iyMBjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777895973; c=relaxed/simple;
	bh=gxIVz6v/ET7Eev5nv45n/2zI/3S5TJKaur5H9cvkAfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBj9hWzc+1e3Wv3mpXP2ajuej6sK/aTHWlhw6LgbfcE47nwBzYhVdCIoxQ9jy6skkVPSHZPUHrN/ZYJwt5Ly9i94T8GOYZj1i8AXgmVUZVgCs84cG5wP5NCo1uO230/hgUvIrqUFgHmJeawqgvz+ZdWMkOusetPoZgBTnMho/ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ql2BJgCo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48374014a77so45976735e9.3
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 04:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777895970; x=1778500770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVhPtrPHdRHuxb645S6FLaLUXRRG1MXeQGA4YiY17gE=;
        b=ql2BJgCoMx82gfzeDZc3xnL2+hUsYGy/EKbRrJ7JB+QPWWc8LvE3803WM5ar6v6u8k
         V4QvK367WtsBsDgpXFUKW0Zf6jt26pSr/rIzvLv0R/fzxfPFeD8Jp7BySwZPwvUxH5cB
         N2yIdaVTGw6VwtmDM1HoAKCEpJ2HBs569SRwUvaotNpB4LfPOHNBFF1ICUs+9mBc97EA
         ocAUTGF0HMTe2lLVpcwfJ0cZ6DiSPCZJQZRH9zbwEPQq0/1i5HKMSuE4e+gQ6ORgk31t
         Uz8ttS0z3e+VzYAzb05BHwokkrLy/yKr+xyogmq/JuJAmBBOqyVPOGUlHYqETNYrPlll
         9sRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777895970; x=1778500770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVhPtrPHdRHuxb645S6FLaLUXRRG1MXeQGA4YiY17gE=;
        b=QUQa7ccq/StnoeKON7anFrlgbKSSFaUFK+e8TqozWtExMjP0YUkdisGtj/Nhyx5kDA
         NiHHr15N7p7iIBeeGkwB3awUt5M73RVCB3QeBA8Nqok90rcYIT1gN4bbyz2TzONN/YsU
         Y2qg8eKszIoCswkVEA0UMTU5oN9DsoHxJ+u0Wa5etOVfuUUiUie1v75udNJ0JvqeGVmP
         M6r2cN4ni9bWU+dWh77Am2/0HlBUiKrcG6lpazsNYJURKmEBJAYn3f4EBJR0Cvl2eDUB
         dlHSCJThBFUDDw0dIK2Bl931xEvD7yV8RRXJczAIUyKGijOK5tJjp6m4gGiG5CrV7lT1
         nnZg==
X-Gm-Message-State: AOJu0YxoRjZExWfN7kjgpgKs3/BEjyX7D8bdXlwALBv6uAsLjviXDMT5
	u26XJRoAbcYVuTR8eK+q+Kr8vgSIwTOG1KWhi1Mc127CUUuYbkHz3bBF
X-Gm-Gg: AeBDiesOXgH7R3W4L6Wb6X9KDEtePCO+OGCJCBsIesBWbB01ZJpPgdHhX7e/tqmBctq
	sL3FO6jAXM3EeuRPJRXW61CqeLgKv/mFlmKjTVbfX41RgiUqbj93ICslHevNXuLavgY9x/fmjmt
	VFN3P5QvrQpvIzWcdhM5VCB2qbIVqh0nlRj6vg+ARhzjlDqlO+5pP1pU1gYym4N12IwNnMWvMEM
	e80S9A521nhhavKBQgBoUShlndRmHbfKuIsAsYlb6OjRlpKbb/HZMA0BQiAnMwRkv2X6hJVpqAJ
	GsZ7GC0sB0vsArEO2EUN6FobmK1N22rtgDIwlQFnkUGqACeWUXNbOY0zAGA0pU8KS/sYWWEMKHq
	TiLBGRkG9uQa+HVIlmFY8azGqvKBT3uSqFtYFrwGClnqINXlAxWYiFcSNsWDHORbcPdPmnTdXL5
	Q/y+7dUsdvoCC4MwKbwfcq1txp/0FMEj4yZCqnK30=
X-Received: by 2002:a05:600c:8906:b0:48a:5574:3a5b with SMTP id 5b1f17b1804b1-48a9867a7dfmr109896855e9.27.1777895969913;
        Mon, 04 May 2026 04:59:29 -0700 (PDT)
Received: from localhost ([213.229.133.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba6f83sm259294125e9.9.2026.05.04.04.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 04:59:29 -0700 (PDT)
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
Subject: [PATCH v5 2/3] usb: typec: ucsi: Add duplicate detection to nvidia registration path
Date: Mon,  4 May 2026 19:59:25 +0800
Message-ID: <20260504115927.48925-2-acelan.kao@canonical.com>
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
X-Rspamd-Queue-Id: 2C5BD4BCB30
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
	TAGGED_FROM(0.00)[bounces-36892-lists,linux-usb=lfdr.de];
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

Extend the duplicate altmode detection to ucsi_register_altmodes_nvidia()
which is used when a driver provides the update_altmodes() callback.

This ensures all drivers benefit from duplicate detection, whether they
use the standard registration path or the nvidia path with update_altmodes
callback.

Without this fix, drivers using the nvidia path (like yoga_c630) would
still encounter duplicate altmode registration errors from buggy firmware.

Fixes: a79f16efcd00 ("usb: typec: ucsi: Add support for the partner USB Modes")
Cc: stable@vger.kernel.org
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
--
v4. rebase
---
 drivers/usb/typec/ucsi/ucsi.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 9f75c7efd5497..eb01a6a86778a 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -627,19 +627,25 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 
 	/* now register altmodes */
 	for (i = 0; i < max_altmodes; i++) {
-		memset(&desc, 0, sizeof(desc));
-		if (multi_dp) {
-			desc.svid = updated[i].svid;
-			desc.vdo = updated[i].mid;
-		} else {
-			desc.svid = orig[i].svid;
-			desc.vdo = orig[i].mid;
-		}
-		desc.roles = TYPEC_PORT_DRD;
+		struct ucsi_altmode *altmode_array = multi_dp ? updated : orig;
 
-		if (!desc.svid)
+		if (!altmode_array[i].svid)
 			return 0;
 
+		/*
+		 * Check for duplicates in current array and already
+		 * registered altmodes. Skip if duplicate found.
+		 */
+		if (ucsi_altmode_is_duplicate(con, recipient, altmode_array, i,
+					      altmode_array[i].svid,
+					      altmode_array[i].mid, i))
+			continue;
+
+		memset(&desc, 0, sizeof(desc));
+		desc.svid = altmode_array[i].svid;
+		desc.vdo = altmode_array[i].mid;
+		desc.roles = TYPEC_PORT_DRD;
+
 		ret = ucsi_register_altmode(con, &desc, recipient);
 		if (ret)
 			return ret;
-- 
2.53.0


