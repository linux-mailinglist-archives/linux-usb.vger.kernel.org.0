Return-Path: <linux-usb+bounces-35444-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCpIA528w2kRtwQAu9opvQ
	(envelope-from <linux-usb+bounces-35444-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:44:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1195032337E
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 432AA305D4A2
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5863BA245;
	Wed, 25 Mar 2026 10:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s09pqUdG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3C23BA243
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 10:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435010; cv=none; b=FDwrXUwv5jpkrHHOb9IEJNZ1q4+tLKfBovLSjeT6YGPjhn46bLUuixCeExi8rkU3whn78Q99AUo0sVRqkam+cwPzz43U2dzYDKFb7z0GhExGByKppt4KY+vxD+1OVeUMGkzMKxy9k78ZH9DpIDIVzP2QKzhcy/qck8g6MA+gUnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435010; c=relaxed/simple;
	bh=aDCwn0qI0YEqhlF9ohMW9VqX+MrPVXhBbc9ci1BibzU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R9G/pLew3LIO+VW5QW0aigjgdJhphOEtnARECVSJDtXULISas2xIrwEb8oABiY6xF6jLs4hmFACcZCNYI+dVNLKOQYhtvniffX4glMueynwMulAeErFYddjUYxVV6XEDC7cpselNGB4ceAI1Z++ORDgZR4o7nAoqGqfV0tCFI9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s09pqUdG; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c6f21c2d81so201384885a.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 03:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774435008; x=1775039808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtluUl8d/Kurx3iRelP/lTdzsDEhoY4ch3ZOhe3ebzY=;
        b=s09pqUdGDsPVWgX36iCa4Clp1mIgnSI9CT8Zc7ueAqIxlrvtl5k4k55s4hpLBrtuL+
         tH0QYHY4IAsJSmvQnhuLu5HEVqfPajjCpxxqvVayNibT7DhraZLRa2SbRIojs5DG5/zZ
         zsA/crPxt/t/zQxktcN8GSPc482j5ewX/VAFBL1xLmEKtBeT6vGvsbmqXJSaeEbneSnv
         rlH/uVNrO0LDf/xRoydWnm/udv7eTJajT/x5MMXbubbhk7BrLuSmKzabiNei+uKOKff7
         xaBUGKBBcWSed1Wo3rt7vL10NRuSNMs69dbaIR5LCcjXZwYmVx014U7ssEBdGy+2IqZK
         417A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435008; x=1775039808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wtluUl8d/Kurx3iRelP/lTdzsDEhoY4ch3ZOhe3ebzY=;
        b=FeHpne5zFCimHEd3J59OaTOV54IiK9lwEMhSBm1h3bpTOYD8F+PpwzVpcmpN1YnNvd
         r3/9uqKsyYLPsTPIaRfA9wd3GytLWbIMoCvCekDK62kczoKrGZyuqxcEzY6m5y4Ih/tG
         KeM5Cgs1VPegXMTJBecA23+Mw/87h3RCBfAtb2JjCALqX8EA0NBWDGjFkaCp+PSpEiVe
         oLSKq8H8NiGQMXF2VXxrNJk2AM9dsoCWYSyodJtePkZwY/KVDDTfQ2qGU6XKCzaRMg5A
         H8ZnDLB/mP5eHB1cpyxYh6tYhWCpqVAjEDQ7d970cxXaNPceLvtcel0l6iKfw/da+tA9
         ckRw==
X-Gm-Message-State: AOJu0Yxga63HymjJ+D+MvQRpLwvkppLurNiOAeegOLlJFRydPxONVEzX
	49Z9bOixtw8WlavuSH6aKdwOmlNfW4PCH/80brgOCk0g2Iy71oEOMSFJ3Ydyabd5mZSdxZJb
X-Gm-Gg: ATEYQzy4xcDfNTe4Y9dzKe7X7r9T8QXXesOVmaLbVOUy4SzW8NQ7nn6V/5H7KffwhDv
	TVIIgIs17h9xJqzr9apu3CiAMR8a9XuZ5vmtvhyGPnsQdIJ8N2wXIpNgQQEp6g3h8CDGdK+wtYR
	U9hqVNcVG+WyztENS6t2BVJvDrJpveOVuNrqApnGTZiS3diJ7Whn4QcyC6QnW4N4zhesBlCvsc2
	4eLga2ATDu5sHsizLtMTtYVUmDMD4kQTPBBEKuTSp9A0u/xuOE+M9rhadFdYT2sse9paWy4Y+Y0
	UGMi9nzN+JBbOx04hZEFmmuwkrYnEdPdbKOvtSaSnQjIrsy3rNvWnxgnVgocgBckiieEMWkLXnb
	YjWgE4G2+jKwDEuiM6LsNyQwnE5KVQWmVqZIvZZBDmFDuSfLflXP9Lnn8tc0K5ibHb3ngEU2uzm
	eNTyOX9kZ260RHMFWtya1Hs5nO7DQz8fhsIEY9F0zCBqrJPjnOInwgy0KHCatC0PXmnGfslr4O+
	N+C+3bq
X-Received: by 2002:a05:620a:31a8:b0:8cd:81cc:5567 with SMTP id af79cd13be357-8d000f5dd23mr410583185a.32.1774435007981;
        Wed, 25 Mar 2026 03:36:47 -0700 (PDT)
Received: from AddContent.localdomain (static-23-234-101-108.cust.tzulo.com. [23.234.101.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8f5cd4csm1482760385a.5.2026.03.25.03.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 03:36:47 -0700 (PDT)
From: Kelvin Mbogo <addcontent08@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	Kelvin Mbogo <addcontent08@gmail.com>
Subject: [PATCH v2 2/3] usb: usbip: validate iso frame actual_length in usbip_recv_iso()
Date: Wed, 25 Mar 2026 13:36:39 +0300
Message-Id: <20260325103640.8090-2-addcontent08@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325103640.8090-1-addcontent08@gmail.com>
References: <20260325103640.8090-1-addcontent08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35444-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[addcontent08@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1195032337E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

usbip_recv_iso() sums each frame's actual_length into an int
accumulator without checking the individual values first:

    total_length += urb->iso_frame_desc[i].actual_length;

A malicious server can send actual_length = 0xFFFFFFFC for one frame
and a small value for the other, making the signed sum wrap around to
match urb->actual_length.  The sanity check passes, and usbip_pad_iso()
later computes a negative actualoffset, feeding it to memmove() as a
source pointer - reads before the allocation, leaked to userspace via
USBDEVFS_REAPURB.

Reject any frame whose actual_length exceeds transfer_buffer_length
(one frame can't carry more data than the whole buffer), and widen the
accumulator to u32 so that many moderately-large frames can't wrap it
either.

Signed-off-by: Kelvin Mbogo <addcontent08@gmail.com>
---
 drivers/usb/usbip/usbip_common.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
index 8b6eb74..fd620e9 100644
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -665,7 +665,7 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
 	int size;
 	int i;
 	int ret;
-	int total_length = 0;
+	u32 total_length = 0;
 
 	if (!usb_pipeisoc(urb->pipe))
 		return 0;
@@ -706,14 +706,23 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
 	for (i = 0; i < np; i++) {
 		usbip_iso_packet_correct_endian(&iso[i], 0);
 		usbip_pack_iso(&iso[i], &urb->iso_frame_desc[i], 0);
+		if (urb->iso_frame_desc[i].actual_length >
+				(unsigned int)urb->transfer_buffer_length) {
+			dev_err(&urb->dev->dev,
+				"recv iso: frame actual_length %u exceeds buffer %d\n",
+				urb->iso_frame_desc[i].actual_length,
+				urb->transfer_buffer_length);
+			kfree(buff);
+			return -EPROTO;
+		}
 		total_length += urb->iso_frame_desc[i].actual_length;
 	}
 
 	kfree(buff);
 
-	if (total_length != urb->actual_length) {
+	if (total_length != (u32)urb->actual_length) {
 		dev_err(&urb->dev->dev,
-			"total length of iso packets %d not equal to actual length of buffer %d\n",
+			"total length of iso packets %u not equal to actual length of buffer %d\n",
 			total_length, urb->actual_length);
 
 		if (ud->side == USBIP_STUB || ud->side == USBIP_VUDC)
-- 
2.34.1


