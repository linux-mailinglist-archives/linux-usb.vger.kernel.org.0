Return-Path: <linux-usb+bounces-34643-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG2yGg5WsmlvLwAAu9opvQ
	(envelope-from <linux-usb+bounces-34643-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 06:58:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB19526D749
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 06:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 073893082A70
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 05:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36358305E1F;
	Thu, 12 Mar 2026 05:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gX8Wu11H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A473F309F1D
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 05:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773295110; cv=none; b=otRbmEquVm/M3n+Hwkd6rSPuYuQolvmP1VlKNgYffBrFUQ5RDmfeXht/dsMASDpn8Z02pCsyC0t+8idbYPMnRFvj80yMgWWYciE03EVMwseACKF3TFPb2Ok8ZSSPxBWKvwTVj+ocjPgEIxi9umbJeodlBfOG3dn/1XPov5OVmlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773295110; c=relaxed/simple;
	bh=zppz/2A/YSmq/tJ/PgfROQN4F/stKqn6p3g1ccDsrb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A97qRkYkE9TYa72flw2luk3ycSNsXIo9mxiJPOysg0fN9FAkQKtMQH47FxIRPeSz98JjCumTE0c1mJaAYUenfw4PVFKaUvvWhJsaAyzMBW9/lBVY5LCx6oh/6br/q//4o5PnVWJFnp5yqLV0kUhgp7XV9wN1Je/C7kdnEK7wmoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gX8Wu11H; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-899f5d337f7so9387336d6.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 22:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773295109; x=1773899909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KvBDaTCURXHdnYEa2b3r1ntui5dSdoJ+7To4kAlDmi8=;
        b=gX8Wu11HY0t+dzPphLUIvuDABjddTj57Xdl2Ib77Dh890vu+0R1ntvyoEwX3pnWuAW
         ELgguK0So0GTpehlGviEnSqtsYT8QZEu2C//wu2ONUe38iRFCdAGRky1RCVTcFTfDM+U
         mb5W/fAwc9mKleX/Ribw2FHiD5uAcTgOe/FsidXQne2gz/fO52NNGc+QhF5xVjTd+lmE
         Zw/1qgVQcqv4BRzUPYPlaw5N1rc0lF9KeDJNLD5OctA+CJic8k15b4tbUBqL1gLzHYrC
         y5RfWQszCBU+ImGPvxWIMn5cLbHw1/bDkYKhaqjosMRdJk2c1/6u/iPCaJ+9paIBYUXb
         mIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773295109; x=1773899909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvBDaTCURXHdnYEa2b3r1ntui5dSdoJ+7To4kAlDmi8=;
        b=wSR1MvC5HaJ32GjaI4s8VzJ9/x631Y10m6K0Qv2/PTUglPU6/eT7y2rV8/vfsuRrYk
         MngeueFt2W1I+js0nIJwriAQ06Vjvefmb6jJmZs/0ab7DWh3z8QPaUTM09l95pnj8NUN
         AZt1wRKOo67kneJRpROnNnfgYkHkH4855hrrpYQ2deKrPtcL/s59Lu5qjew3rHRzHIzn
         uuSZvWyl0GebtOj6n52rUE+4Iqy9SfkvsH1aezKp8mI0ZvAszydSTh/BOZ7XnCoroDRV
         0+fqR6bgvTkWDOEHD+Vd1nzX31ltZgmmO1UZj0LmHcEazrHoXZS+V2BzYTfET3Pn/UIR
         l+iw==
X-Gm-Message-State: AOJu0Ywdlg7ApjmbrnxYuhEovRZQpJGUYcvPCqClJhClpZIKAl2Hcv/k
	Q6KJTpMV2142n1Ou7nTAkheeIMP+m0rjQxcxHF7Yq85Chfu/+lWmI11u
X-Gm-Gg: ATEYQzxbK0bI2fBvHQCF4QBHd45sHg8mCSK6/WSu/XX2EyX9/hcZnstYQm+6gfgUi71
	6QohZxAcOE83n7EM+jk+0Snqfv67GMVuMFDXE7Fp8eX0vRZ6yldpFxma3aw2we57t4CtVqCq2Ci
	W9UgigBVlSHNBK6ls8BjSpa+5gbHFOkWS9e5XIuJGaQnR3kIdASPUs5itYaTrFZaEptniN1fsA4
	q2QD1qGh8kaU3I/YctN1upIEHuS7kE147hpei+dP5Hzo0vnumGbalzwmf14erqIDdbkg1j2Zynr
	EpM7304w3aFdHkgHNWTw6CjvAJvSau02uCl77ubNkL+i21hMUzPXuF54Dpnbvc65MpNcz9lp8X+
	fzGkm2UwM0magjzjtlLltE7jNSxQAnfRfUm2i9golT241CQ+piRD8aEp1BB0ONyqUA/LIkjHTer
	0soRavSsI6rFcMhhBjyBKBzHr0SIStkyozzbzIGSbb3Cxpo+YMprYOTMZOvVRRJWnuxSC4j7dLi
	0unv+ccfA7PPlfyvteI
X-Received: by 2002:a05:6214:2126:b0:899:a586:2923 with SMTP id 6a1803df08f44-89a72a8d05dmr32299826d6.28.1773295108590;
        Wed, 11 Mar 2026 22:58:28 -0700 (PDT)
Received: from localhost.localdomain ([129.170.197.113])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65cfec56sm28890926d6.39.2026.03.11.22.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 22:58:27 -0700 (PDT)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	kyungtae.kim@dartmouth.edu,
	stable@vger.kernel.org,
	Nathan Rebello <nathan.c.rebello@gmail.com>
Subject: [PATCH v2] usb: typec: ucsi: validate connector number in ucsi_connector_change()
Date: Thu, 12 Mar 2026 01:58:15 -0400
Message-ID: <20260312055815.310-1-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,dartmouth.edu,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34643-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathancrebello@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CB19526D749
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ucsi_connector_change() uses the connector number from the CCI as an
index into the connector array without first verifying it falls within
the valid range. The connector number is extracted from the CCI register
via UCSI_CCI_CONNECTOR(), which returns a 7-bit value (0-127), but the
connector array is typically only 2-4 entries.

A malicious or malfunctioning device could report an out-of-range
connector number, causing an out-of-bounds array access.

Add a bounds check in ucsi_connector_change() itself, before the array
dereference, as it is the single function through which all connector
change events flow.

Fixes: bdc62f2bae8f ("usb: typec: ucsi: Simplified registration and I/O API")
Cc: stable@vger.kernel.org
Signed-off-by: Nathan Rebello <nathan.c.rebello@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index a7b388dc7fa0..b4f630154aba 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1345,7 +1345,14 @@ static void ucsi_handle_connector_change(struct work_struct *work)
  */
 void ucsi_connector_change(struct ucsi *ucsi, u8 num)
 {
-	struct ucsi_connector *con = &ucsi->connector[num - 1];
+	struct ucsi_connector *con;
+
+	if (num < 1 || num > ucsi->cap.num_connectors) {
+		dev_warn(ucsi->dev, "bogus connector change event: connector %u\n", num);
+		return;
+	}
+
+	con = &ucsi->connector[num - 1];
 
 	if (!(ucsi->ntfy & UCSI_ENABLE_NTFY_CONNECTOR_CHANGE)) {
 		dev_dbg(ucsi->dev, "Early connector change event\n");
-- 
2.43.0.windows.1


