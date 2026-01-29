Return-Path: <linux-usb+bounces-32906-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLwVOikpe2nRBwIAu9opvQ
	(envelope-from <linux-usb+bounces-32906-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 10:32:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D11AE2D0
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 10:32:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16EEE3016492
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 09:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA11437FF47;
	Thu, 29 Jan 2026 09:32:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D359827B50F;
	Thu, 29 Jan 2026 09:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769679142; cv=none; b=GozmibO5AS24T7V0WPomaPEN9JtDFMB4kq8sh1sfheFvwNkGxQYN4kP/RXOIogrlQQg72f6YEKZhnC4s64xzKaa72pF0HoxEttk0ylfiTtrScPoIB5JUQlE6FYkQ0PYP70wxb3nXprvynGlGnqVm+1ULlvHbnKqfH7pwTRyITGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769679142; c=relaxed/simple;
	bh=avrIbqP2Cb/KKBMWNcxXP2cJkxlhZrWx5/p4IVSClg4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H5E5pw819LSZfK3amws0MwULj9b3n6ze6Fs/w16OHh8kmZlDHnCyoEtTkXM2t7jAkVJbBWgdNj5WHN+zhxuEpPS1xftVo/Z4NkIQKTnf87D0sqY6QDwjABw33q80ZhsGZdnV8e26Zq4yd5OgLpFPBf+bm8pKcxLMUoAz+b1RPWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 60e27fb2fcf511f0b0f03b4cfa9209d1-20260129
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9eb90131-31a2-4406-bff0-6bf9101b0403,IP:0,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:a9d874c,CLOUDID:1cb7682d1e8bbed1432ddffe244d4247,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 60e27fb2fcf511f0b0f03b4cfa9209d1-20260129
X-User: jindongyang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jindongyang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 974508643; Thu, 29 Jan 2026 17:32:07 +0800
From: jindongyang <jindongyang@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jindongyang <jindongyang@kylinos.cn>
Subject: [PATCH] drivers/usb: misc: use kmalloc_array() instead of kmalloc() to prevent overflow
Date: Thu, 29 Jan 2026 17:32:02 +0800
Message-Id: <20260129093202.595963-1-jindongyang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[kylinos.cn];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32906-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jindongyang@kylinos.cn,linux-usb@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kylinos.cn:mid,kylinos.cn:email]
X-Rspamd-Queue-Id: 29D11AE2D0
X-Rspamd-Action: no action

Documentation/process/deprecated.rst recommends against the use of
kmalloc with dynamic size calculations due to the risk of overflow.

Replace kmalloc() with kmalloc_array() in adutux.c to make the
intended allocation size clearer and avoid potential overflow issues.

No functional change intended.

Signed-off-by: jindongyang <jindongyang@kylinos.cn>
---
 drivers/usb/misc/adutux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
index ed6a19254d2f..000a3ade7432 100644
--- a/drivers/usb/misc/adutux.c
+++ b/drivers/usb/misc/adutux.c
@@ -680,7 +680,7 @@ static int adu_probe(struct usb_interface *interface,
 	in_end_size = usb_endpoint_maxp(dev->interrupt_in_endpoint);
 	out_end_size = usb_endpoint_maxp(dev->interrupt_out_endpoint);
 
-	dev->read_buffer_primary = kmalloc((4 * in_end_size), GFP_KERNEL);
+	dev->read_buffer_primary = kmalloc_array(4, in_end_size, GFP_KERNEL);
 	if (!dev->read_buffer_primary)
 		goto error;
 
@@ -690,7 +690,7 @@ static int adu_probe(struct usb_interface *interface,
 	memset(dev->read_buffer_primary + (2 * in_end_size), 'c', in_end_size);
 	memset(dev->read_buffer_primary + (3 * in_end_size), 'd', in_end_size);
 
-	dev->read_buffer_secondary = kmalloc((4 * in_end_size), GFP_KERNEL);
+	dev->read_buffer_secondary = kmalloc_array(4, in_end_size, GFP_KERNEL);
 	if (!dev->read_buffer_secondary)
 		goto error;
 
-- 
2.25.1


