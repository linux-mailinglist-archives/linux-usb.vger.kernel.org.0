Return-Path: <linux-usb+bounces-34682-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPIqIv+ysmmYOwAAu9opvQ
	(envelope-from <linux-usb+bounces-34682-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 13:35:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCD7271D9B
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 13:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 51F1C3017AAC
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 12:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F2430C618;
	Thu, 12 Mar 2026 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="sCT6cRlS";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="sCT6cRlS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787222D6E6C
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318885; cv=none; b=cG3boVQx2NSOCYqoQJcB+dS8p03J7mppqgHPIrAZZUSbrISx1WKJOoby/OBmHaHppajGQYMgnibR82HWg/n0YcdBvX3kSydL0OevzafiaexWlpgrAV+4Sqs7t0JMBuf3DYkvTaQ7FA0zvtqFqKFV94KnUbPbB64UXUaXBcrqafk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318885; c=relaxed/simple;
	bh=igItnAsSb1k+AhL+GwCFoP0GoYjYGPfESY7tck5+QgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O48ItEh5Aq8IDR5kgRYUkmzXOsplESPIYLTZZ4Pb/9TijFMSAh4LAQddcV35kWZtVLlM3qJNl5SByFJj1DZpwq7ULpjbODXTl2WG/hRFgZ79b5JATKPs7spso/bXxKM/g4cchPsAjiFJrYYAUwm/swUl/d/CrT4drvIu5ok0gpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=sCT6cRlS; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=sCT6cRlS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C227C4D1F6;
	Thu, 12 Mar 2026 12:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773318882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LGMNGuVLn0s6gxANSoH9qwtJjwT3xqJkugCEGrAjspc=;
	b=sCT6cRlS7+roZu2BllX7YLuLVMv50cQm6pcs6S3D/PN82HZlqk5rnn85BcMd6jtyLD2hXp
	MavbNcloBQqhjEjPb0S8Mt5gqlpN9dWr2CPLdJUM6SHGju12HqPXixOqtJTVbal+Dv32gi
	Y8Qal0LGHlgwjyW2+geo//mcdqFtlgw=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773318882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LGMNGuVLn0s6gxANSoH9qwtJjwT3xqJkugCEGrAjspc=;
	b=sCT6cRlS7+roZu2BllX7YLuLVMv50cQm6pcs6S3D/PN82HZlqk5rnn85BcMd6jtyLD2hXp
	MavbNcloBQqhjEjPb0S8Mt5gqlpN9dWr2CPLdJUM6SHGju12HqPXixOqtJTVbal+Dv32gi
	Y8Qal0LGHlgwjyW2+geo//mcdqFtlgw=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9DF4C3FF86;
	Thu, 12 Mar 2026 12:34:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2VV7JeKysmn/egAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 12 Mar 2026 12:34:42 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] USB: uas: give the error handler the correct name
Date: Thu, 12 Mar 2026 13:34:27 +0100
Message-ID: <20260312123435.2015029-1-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34682-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: 8CCD7271D9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A UAS device can in principle contain multiple busses.
A reset on the USB level will reset them all. We
cannot reset a single bus.
In practical terms this does not matter, as only
one method of reset is implemented, but we should
not lie.

Signed-off-by : Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/storage/uas.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 0a9902d2b118..265162981269 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -772,7 +772,7 @@ static int uas_eh_abort_handler(struct scsi_cmnd *cmnd)
 	return FAILED;
 }
 
-static int uas_eh_device_reset_handler(struct scsi_cmnd *cmnd)
+static int uas_eh_host_reset_handler(struct scsi_cmnd *cmnd)
 {
 	struct scsi_device *sdev = cmnd->device;
 	struct uas_dev_info *devinfo = sdev->hostdata;
@@ -918,7 +918,7 @@ static const struct scsi_host_template uas_host_template = {
 	.sdev_init = uas_sdev_init,
 	.sdev_configure = uas_sdev_configure,
 	.eh_abort_handler = uas_eh_abort_handler,
-	.eh_device_reset_handler = uas_eh_device_reset_handler,
+	.eh_host_reset_handler = uas_eh_host_reset_handler,
 	.this_id = -1,
 	.skip_settle_delay = 1,
 	/*
-- 
2.53.0


