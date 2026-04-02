Return-Path: <linux-usb+bounces-35907-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMO5IJO0zmlVpgYAu9opvQ
	(envelope-from <linux-usb+bounces-35907-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 20:25:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A9338D0F5
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 20:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E375305B484
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 18:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501E737B019;
	Thu,  2 Apr 2026 18:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wYkCW+Jq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD54355803
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 18:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154285; cv=none; b=t4VkKfVBHniVSm4EGlFBRbSn2pxXPIkqmS3aWBAIyEqYfilCMscOPMnXTIWRQTtFTDUWKcy3+7oc64r9dDVeWLMTvydXJ1R9lhcbKB6+c55O+1YvLvaWlxIVzwy0sz041QFbHL6L3K4yWKJ3kdMfYHQbcrlTN/D/2TNVwHIALN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154285; c=relaxed/simple;
	bh=neDYEmiq1jNlLVPfYr/DxMz6+oxLr+J/ArGBVyjHcfA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=thNNkFtY6Cd5wqcT/1zwINmJ4EVr7RU/TCAVor2fFpfjPMKMBLaaBWw4d3Iff8/GLG29irGiZHzFaDrOwrtLvLVZKd7dWyLlC1viutyXuO/EYKZ6uMTyboux3mgT68bNiiVfKK6ubIFvlwXHNZimlOAfRAGv7QV+AbNR/dG1wnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wYkCW+Jq; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2c72849f648so5211064eec.0
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 11:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775154283; x=1775759083; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H/GppnI5PJ9zcCt0/6kmbzD7q0Lab98aUuQ2hUohGxQ=;
        b=wYkCW+JqeoqqGckP8JBdNfVLuxVbo9dM3zu1Gb5A9t7QzjIGx//pEefKCgMtJyXVbT
         VvpkBWdmQEfynJ02oDxms02NrpMCdVGwBqkHDmH8FPXnAgEk+aadLQcgNygZ2p0znDHj
         bB+udLJDWAZ621HYI01v37Nlw6ejRvBTHXYitTu3TwAAVIn2CHy1hJT6oY7A1wvFVBud
         8ijEVT5uA4IV42J6r+YLGBmfb9RQrO4gJx9ewot5dHeYBbfauTXF9M+ABGfxfW0NWau7
         Z7AUkseXvAGLC5o4QchTYBjOBMMSe26hMib6khYenqRytGjWI68qbdbrTigydpnOl38q
         HdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154283; x=1775759083;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H/GppnI5PJ9zcCt0/6kmbzD7q0Lab98aUuQ2hUohGxQ=;
        b=iMNGrjRp8KSJ1PXyMN5qhe98Jimn4d8PnRfLhsLxem8TbX/eYQ6G7i73qSZJUeMlHV
         oi97FfIJUkl8TO/gXuICA3RBrqUIMhvIrpA2MTxoX7V2s5Y29imKLmig/dAyWs5kJYrl
         V509axLtfZP3WaGMKaC/64nj0xAk9X6Nbi7Z+8oulOpr2ULkKAPycBZ4hNGgtVF3fJYn
         H+Z4VtBDxhRNnpDMAlX12dqISG6d0v4KiPxYiigL/LhrTqpEqof9oI+ZgLPkSxbgAlK6
         sG6i7CrtskGC8rVVYxCyQrdOv7ScIAGC6HWJ91zrHPC1DE8fCdcAw8NPiupvZSn9gIcW
         1waw==
X-Forwarded-Encrypted: i=1; AJvYcCV13GgMcboN/BSJeG7+ESZnAuYTKJp7t9enDiG4hGYdBgbGzfzM1gXbfn8RbiNmzdZM2appvQ5Iz/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ0VcBKF52RFaC4G3Tq+whpPeWZwp+rWx36inAsB6ERrAD3wef
	A1lMWSZbDDxmtH0HIoiTbh9Rmz9Ug6GWVZ7o+3w23zTCQsJuSHTYC9VNDCeM2HlZW5P5Nudq/Ry
	Cr/eKPw==
X-Received: from dycmz22.prod.google.com ([2002:a05:7300:ea16:b0:2cb:45a9:2264])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1688:b0:2c6:cdb3:bd5e
 with SMTP id 5a478bee46e88-2cbfc365473mr100512eec.28.1775154282763; Thu, 02
 Apr 2026 11:24:42 -0700 (PDT)
Date: Thu,  2 Apr 2026 18:24:38 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260402182438.867396-1-jthies@google.com>
Subject: [PATCH v1] usb: typec: ucsi: Set usb mode on partner change
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, bleung@chromium.org, 
	gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35907-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jthies@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 28A9338D0F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently the partner usb_mode is only set in ucsi_register_partner().
If the partner enters USB4 operation after it is registered, this is not
reported to the typec class. The UCSI spec states that the Connector
Partner Changed bit can represent a Connector Partner Flags change. When
handling a UCSI partner change, check the partner flags for USB4
operation.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index fe1fb8a68a1d..e6fd2e2eba94 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1182,6 +1182,12 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 			if (UCSI_CONSTAT(con, PARTNER_FLAG_USB))
 				typec_set_mode(con->port, TYPEC_STATE_USB);
 		}
+
+		if (((con->ucsi->version >= UCSI_VERSION_3_0 &&
+		    UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN4)) ||
+		    (con->ucsi->version >= UCSI_VERSION_2_0 &&
+		    UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN3))) && con->partner)
+			typec_partner_set_usb_mode(con->partner, USB_MODE_USB4);
 	}
 
 	if ((!UCSI_CONSTAT(con, PARTNER_FLAG_USB)) &&

base-commit: 81ebd43cc0d6d106ce7b6ccbf7b5e40ca7f5503d
-- 
2.53.0.1213.gd9a14994de-goog


