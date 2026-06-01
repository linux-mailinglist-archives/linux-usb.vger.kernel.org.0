Return-Path: <linux-usb+bounces-38255-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Cy2CdOYHWoXcgkAu9opvQ
	(envelope-from <linux-usb+bounces-38255-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 16:36:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39714620F81
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 16:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14AAD3038F54
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 14:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824983BB105;
	Mon,  1 Jun 2026 14:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="irczHMkU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880853BADAA
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324125; cv=none; b=g3tKZd6ENDvzF8t9zQY7IrpiQoUmcb/Pihz9dkcOaDgmtuB6cllBUkYNZcY1+Dv4GVz0Z0vLsWybIlvlwh5wSzEWf9yk2X6VQxZJucGrBgTHk9fdxhP5dgVaBv/GqeivFIv47v7cta15khJ2mXtX8VkYLvv7ETqw7Ku2lqob/pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324125; c=relaxed/simple;
	bh=AbXhVcCd73fAAC58JhtFvSP0Bsn1GbJgoYS464W/nkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lUqxHB1uVbvcSInQm7IwZELw9UMr8A42ugQxQxv/99aJtj8G7I6NLByvqpSMIKQqyAcvj32uZP9xxyJmlsQVTWmjZZN2Zqd8ScxUR6cru3Su0AXTK5mW2k/Pu+GpwviBOd0BQ2V2z2Dkpni64zrkbD6a98hBPoFh8TWOMgpczRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=irczHMkU; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bec43ee8ff0so214744466b.1
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 07:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780324122; x=1780928922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0qgZZ2KjqH6+dykDseENzBvcCh7IAoqMA3tNRsz9qr8=;
        b=irczHMkUC7/OCVr5DE8M49rur/I8jbHqOwtkmZgd1/cvfDs/Yk6kdMy7PfyQY8DkFs
         LubOs+bazsXWZ4rHqI6HVWIWAnt1xXbyCBYkomfvFVA4el32mSyPCW60zFv62L2hgiQl
         V38XGEZPwNAna64i4x3Fjoae269fcLSeE/uCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324122; x=1780928922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qgZZ2KjqH6+dykDseENzBvcCh7IAoqMA3tNRsz9qr8=;
        b=ffiXlF5XQIazbklQbS5ukUXIaAYkWRHh+EPYssl8cdoVNucIcO9MOHPD1dpuzTe7/o
         UYwb7cOxAo+HUvdvc7bpr6e257ZLZg46DzkGZaZpP2wzqisSHHwWXMaOMAEQUXx3hf4g
         vMmleBireVkKoN6anHI9tEn8CA6s4wppDV/Gb/ySWgfUpVBNabv3iqdJxp6YOdCEaTMD
         4q2Tq/vTbMMaBuCsL1HKitDPGuKCh9r5BlKHcGS30SNS8SyCOROUoEh6rDYqXHDMfOHD
         iH7N35lBiMGeQADcXqzcP3T3B+Q6zdLePpjLFKLzWuQYu8nXqAZShAzT0SpQhmIZTkwD
         ATlA==
X-Forwarded-Encrypted: i=1; AFNElJ9oFtVG9Xl8vAAGw0hs/3LSE/9eCbeaXUPwRyWoEmwWYB8SHj1603u0mt3Qzl/scc7wBqFKFvmlUBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIXaO7SWd7LtzOrtfIycH8NWos6CuZXpVtvTJc+VxQNbRduoqt
	1nXwwwcO5tnfEhWC+lSC32b0kZeU07RMOBo9572li6enatIfNfQgHH9WxM5B1Qa778jwW8JsZck
	/m7s=
X-Gm-Gg: Acq92OG8D6MIK7KfvAQmTux3vZnK2lsCL3g+q0QuFvnWhk4oKEpxksUSBbHi1cLTrZo
	PDcszd5hIB6zZ2S2x6wRiQWwyaZq3VnX2swj0lqI6XtnQYYINh/CYOSPf1WTJsmRquK/t0qAXlN
	S5uf5Bkn23Aca6JE16upUxDmUQA0qXMFgdt4kCyPi4k/Djhvo0xzuNPUjPFVlkn088Mb/G4/6Za
	7lE8+qF/RDd+1ebzhN1NmdQ0E7FxzlqxWfExjvMJ7Kz5Cv9SGrRG37qA6HmLdq1IyuidgRivkOz
	gfPlDYR8c6QeDTM3A4g70rX495OdVxPwTuFPt4VMVyqIbcsvlXs4Hci5jASnO4vMGbBDg4C+kJk
	EKRXawCuwh9UWZ72SDZb5uVDCwZ2a3BRndUlZOlNb0D/k9y1eKvdUf6OGxLsJW8zu02U2dto5Rt
	AMfg01glJBTcx96pVe3pIGrQOMZJYhLrc+M1vnavPVU+EpIvIubeYBRQ0KybWxU2kau302IOyy0
	gynAXOAHREzTimhuxqfcsBX5uWR2jI=
X-Received: by 2002:a17:907:c16:b0:beb:f357:7755 with SMTP id a640c23a62f3a-bebf3579814mr370481766b.12.1780324121854;
        Mon, 01 Jun 2026 07:28:41 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bee7bdf4438sm46562766b.55.2026.06.01.07.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:28:41 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Invert DisplayPort role assignment
Date: Mon,  1 Jun 2026 14:28:37 +0000
Message-ID: <20260601142837.3240207-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
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
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38255-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akuchynski@chromium.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 39714620F81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The existing implementation assigned these flags backwards, configuring
the partner's DisplayPort role to match the port's role instead of
complementing it.
This prevents proper configuration during DP altmode activation, often
causing `pin_assignment` to remain 0 in `dp_altmode_configure()` and
resulting in VDM negotiation failures:

    [  583.328246] typec port1.1: VDM 0xff01a150 failed

Additionally, the fix ensures that the `pin_assignment` sysfs attribute 
displays the correct values.

Cc: stable@vger.kernel.org
Fixes: af8622f6a585 ("usb: typec: ucsi: Support for DisplayPort alt mode")
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/displayport.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 8aae80b457d74..669f08013c7ab 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -166,12 +166,12 @@ static int ucsi_displayport_status_update(struct ucsi_dp *dp)
 	 * that Multi-function is preferred.
 	 */
 	if (DP_CAP_CAPABILITY(cap) & DP_CAP_UFP_D) {
-		dp->data.status |= DP_STATUS_CON_UFP_D;
+		dp->data.status |= DP_STATUS_CON_DFP_D;
 
 		if (DP_CAP_UFP_D_PIN_ASSIGN(cap) & BIT(DP_PIN_ASSIGN_D))
 			dp->data.status |= DP_STATUS_PREFER_MULTI_FUNC;
 	} else {
-		dp->data.status |= DP_STATUS_CON_DFP_D;
+		dp->data.status |= DP_STATUS_CON_UFP_D;
 
 		if (DP_CAP_DFP_D_PIN_ASSIGN(cap) & BIT(DP_PIN_ASSIGN_D))
 			dp->data.status |= DP_STATUS_PREFER_MULTI_FUNC;
-- 
2.54.0.823.g6e5bcc1fc9-goog


