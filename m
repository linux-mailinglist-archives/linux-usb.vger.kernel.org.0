Return-Path: <linux-usb+bounces-35433-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GENmL8Crw2nAtAQAu9opvQ
	(envelope-from <linux-usb+bounces-35433-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:32:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74989322465
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F329C310A566
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 09:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AAB3537D0;
	Wed, 25 Mar 2026 09:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6cX+H9F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B69352C39
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430778; cv=none; b=Td8Z6nHTVYYS8IcHLD73BvXimC7eLI+C5QF/J+GABEOwe8MVEmR6UYrI0G6G66juQyCjlu/mdmb5LSKDYXU/s9zRU6eN1y7lrpzu2SthH/r8DqnQXHcLEbmFcionPPdg1FvNHmifef05jgmIOQb1VIs6fzAs0GTF7WzK8g9+qdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430778; c=relaxed/simple;
	bh=fg2qjPq4MNPocOJQp1lJgXIZQGS1GprPbo5ftq1kEYY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OlCJxwfOPIqVQAVNjeQWX9C/sU9ZCjrCG+shQKHlGgZl81pdzLvaKNSa70J383Zg6/HWzzer70tKtJi469cmBoibgWAr82AYcLby046cCA1+57LRYnC5qiiQ/FjVePiWn6PFnyxtAiUOVJRy00cxbv3tDcSnum/H+eqMDRm4OlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6cX+H9F; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cbc593a67aso607533685a.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 02:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774430775; x=1775035575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VkkNMHZbpM7Iu258HGB7JwxAWpWbYfdYFszWdtxv60=;
        b=B6cX+H9FHVd9S+XU4+Yql/doU5FaiZM4a7VaYnnDkEDT2DLSxepP/pK/ND1WxOX4OI
         uP6O/Hdh6tnHYHyvlbdfnna4/P+FXUWEVRQUU7ZRXM+CH66+aNxU2/XAfDTf/E+lB93s
         Mxs1U6jCu7m1N0NgjTD8Ag9fiuUXyQsmVu3dkaifRwSExQV0xQIWVkBm6RXFUunnHumO
         Tzi6MsAQ6NJj7gOeYJN7ZMw9+cNQnX8arWi4E7g2/dxkIyrE2iCtII4Q/YJeWwVeaqZZ
         sXanC5FM1Mkmdiiyw9UWmLjvT5dqH//WLeTRR3lt5QY+FevmqaeY3BHQHrrOSj1WoWhn
         0vAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430775; x=1775035575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/VkkNMHZbpM7Iu258HGB7JwxAWpWbYfdYFszWdtxv60=;
        b=g2r7lpP/+zCUpdqJjQ1vewp2bPRQjysKvodkJlM/4nqeMewSSxzUktOIETWOe9P/dt
         hBZHWsnYwjfRugnunqlTKu6YKr5kt7puV8CmzKp7RXzvv3P5p5w//fIueUmfpQu/ccR+
         bbDXPo3SD6BEm6YzuluIg78qmW3I4KyWms1688QKusCuCsdiSoFNWQ9mTbew3VSCyC3K
         na5Ho5/upmsM5QJb18EiMDvZQtUjxB1FHm9Y49u4uQsOSgKiO/+DRNSHaYZep83mHqUT
         eU1lDTQev2NwOF9JXb0mSmaQPybuj452GMI+GMnEvY+JSJO3cOUaNW2589py/3J/CB68
         zokg==
X-Gm-Message-State: AOJu0YwWCe0mBuHR9aEAjW8bAXlcdegchw5myxQG07b7kE+7zBxepPy3
	EGMl377Egx/2WRbpvkLotKL0GMLk66fZp/JbmuobsYSdwozvAZtJp9sjbxn1CTvNyIaieWTL
X-Gm-Gg: ATEYQzzx7qFs0L+1ZULuMOS3kvZVIQ0s1N8Bain92NOIASByc/nRWW0pLURYfO+Gko2
	R5H55w75gjPES0MyXIg92O+zSun5rOSJjD5Q+2FrUS4/RaLUanrhLEzEkAcRj/w4XdgYCPAF95k
	sDkte7LDA0DeFmY2sFtuw66h3O3Bci14LfJ5sHkrKzvIQ/zOO/Xr3W6HNF0UH1Z/cdJKSIpjr4x
	OjlkFE+6Br5jmb5PZeQWuOkVJOxju0XnG9EZIRFGteR1NozqazBq1R77pGF/23Y7L+tNddBsBa4
	cBfLyc35GRiTsxNP9qDk4cxTvOfF8ADRv4mQ6ii/dS0FbSnb1/SuEEAXfWiT0TlG+6Gq7IZ5icL
	ix7vEZyhe74Juzxg5d7lTGJgQNxGJzFjaHwhv7Cc1exgsuzX70PhPANwODov51YdnQwSEVf6y/9
	vw5I5HL0/+3PszdaQKEowyWyFwd5aWP0H4Z66M5oFTI27MTaPJ8WcSik6CVAfit5eOQ08CgX6TT
	Qrg64xz
X-Received: by 2002:a05:620a:1983:b0:8cd:93b7:ebc7 with SMTP id af79cd13be357-8d0010ccc13mr381952485a.74.1774430775424;
        Wed, 25 Mar 2026 02:26:15 -0700 (PDT)
Received: from AddContent.localdomain (static-23-234-101-108.cust.tzulo.com. [23.234.101.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8f5dabasm1287525085a.3.2026.03.25.02.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:26:15 -0700 (PDT)
From: Kelvin Mbogo <addcontent08@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	security@kernel.org,
	Kelvin Mbogo <addcontent08@gmail.com>
Subject: [PATCH 2/3] usb: usbip: validate iso frame actual_length in usbip_recv_iso()
Date: Wed, 25 Mar 2026 12:26:05 +0300
Message-Id: <20260325092606.7474-2-addcontent08@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325092606.7474-1-addcontent08@gmail.com>
References: <20260325092606.7474-1-addcontent08@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-35433-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[addcontent08@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74989322465
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

Reported-by: Kelvin Mbogo <addcontent08@gmail.com>
Signed-off-by: Kelvin Mbogo <addcontent08@gmail.com>
---
 drivers/usb/usbip/usbip_common.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
index 549e34b..c79a90f 100644
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -664,7 +664,7 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
 	int np = urb->number_of_packets;
 	int i;
 	int ret;
-	int total_length = 0;
+	u32 total_length = 0;
 
 	if (!usb_pipeisoc(urb->pipe))
 		return 0;
@@ -705,14 +705,23 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
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


