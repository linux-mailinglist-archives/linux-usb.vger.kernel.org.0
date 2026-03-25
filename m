Return-Path: <linux-usb+bounces-35449-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDPTJFa/w2kRtwQAu9opvQ
	(envelope-from <linux-usb+bounces-35449-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:56:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7E3323603
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDA7530DCE66
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156713C3432;
	Wed, 25 Mar 2026 10:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGc6BckD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B583C4574
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435734; cv=none; b=EfRua9Zbfu2LAYx2BCHIZKh1qFgcuRYTuxjUCZyy8ZolG3FjeTodSwuyR3chHNMeVzfEegVZT+kUGg4Hld1tX5Lr5qJsaQF0fyY+tnx3hyC8ZNQg41LZ5DA+I4KhU8ahMVAsoXYoDGBZl9N8LTRltBCSsfqpSlDfNo5RRl5HFvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435734; c=relaxed/simple;
	bh=G9TgaM5WGSlHNO+fYmWN3OCWjuqhM8q+SX7Kfk7rw3o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cHedY9I7iWJ6A9tPrOl+V1KJ/AveeHVzfkkf1UaHWWV+vwOr6bzSVCdxhPxbXVmF9LH6boRVeeQT4nV2MoMRggae13FilZISPSYlOhoMWeu5ldtVCqxXqARmNKPHwrKWRgQbW6pjdf7v1+h+XIMEnQQV2wqPHqDfQJUw9N6JXBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGc6BckD; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-899ed41208fso67201176d6.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 03:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774435731; x=1775040531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7on4bif22PoqYdJy6Wi6xITBbN6AvVKD4UxVgAQCy34=;
        b=TGc6BckD/WGsxxMz7SpBAaUNQYP26QE5kzHUajl5s2j+nOQf/HSpFcQViCkFv3Vm0f
         UcMl3rZvBQyktuVngVNxwwpU15CZ1b9tmlu6fIb6lqt7c7qGqF/4mjAUS9QKT2+yJx2A
         WNYY9Tm6Sc0F69I2CXdNYLy8RWW78DjUyac4vY6XrYFr0kwdlmFE9BQd/lUDy3UmZ6in
         NgnueHC3amSfc4ere08rjUgz+Rzad0gUU4DgdXWl2IUpD96Fz+E4r723lAQj/8OmI9IM
         K7CGdQOZCX4j0/StdSjnWqOo3qJm3/O++jNs2X8/CmguOmczD2zXz03Sw6/Luzc5l3X2
         emog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435731; x=1775040531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7on4bif22PoqYdJy6Wi6xITBbN6AvVKD4UxVgAQCy34=;
        b=Amz2GRFCQcigTyYYHpopef7ijnnTftU9sRQtx2aCm3KrQ/g20YTqbnc66H9wuhC4ym
         e9hH05u4ovzxOULusKg61HRu3wpytM4B6Z79IEPp+pIhCWTtY8kQNSubiseCiSj33TpA
         YfHmJ6ZqI755BMk5MUj6GCaAOgTJqgs27X0jQ8NAfXWbpRPQZpFIV7BMD2/QibsYptaI
         q9SIBJhogjatZ60MA81fk6RMz8h59Dc+1Pv9Q8r+i+OTqA4lkanndiq5ZL3j+1lNxc3G
         viGk3gUq+RbWik4cJofxvAnv4dTFIq08rDsLgpGX7ifKr7dEkSd0lnGhlfBXO8WzXhVg
         ErRg==
X-Gm-Message-State: AOJu0Ywd0uNrjsTUAJOx+Q7+w0ajIRzI1bpIjTwrQ/1sGuAUcQNmj1yi
	CRg+6f+jwPJlpqadHhKwG5Pk4nuUihLwVML4IBSKyvsVblu2Arkj0JImiWNbdB2rSJj2qw==
X-Gm-Gg: ATEYQzxGUqWV6d1/7MQg0pAK/u+RE+uU/TDM4Mbr7ycTTLjDJqBV7Fq9fyDDaNv75xF
	j57d5SZWooLZWCTiqDeqVXAOonRA48qwZ7rzbReAdVrHzQ8GsX5AU4SNIWIUhLxHqcXA313Q7mK
	+nsZwleMASHD24CJM7SW58a8hoN0qcUAMdje9v8VQVtkrasJC9t1TDQIvfLBrnFy16klgl9BQ1i
	HSvTkOTAiIRqbf6KrstDMQeyoFI9beR4rE6dRH4bzcq5+5RVrehR/a710+YoNHgpkNgMxrzHT2l
	vPDKilQgPU3zwWbcy1qJR1gYzXWsmgOyPXmbIHnW17pfuK11BFygeIM6sbdOPAUXVA8/GRP8dAr
	bWdn0CmwL19HuSxBlnijI2ALKOEqSJveWimjSrnqGvfK2x3uK+wU7BBC7iHlllaArUCp18N64gQ
	wvCn0wCLF1A2pJ/cGc8sFJK5eK/oG5VgMbBnILIUUMo8xt9+k6bp5feXuUohukz4T8oHpAVs8LF
	RvTbIwu
X-Received: by 2002:a05:6214:ac2:b0:89c:4857:4f15 with SMTP id 6a1803df08f44-89cc4a4168dmr45949576d6.24.1774435731346;
        Wed, 25 Mar 2026 03:48:51 -0700 (PDT)
Received: from AddContent.localdomain (static-23-234-101-108.cust.tzulo.com. [23.234.101.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89cc8c1673asm11745456d6.38.2026.03.25.03.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 03:48:51 -0700 (PDT)
From: Kelvin Mbogo <addcontent08@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	Kelvin Mbogo <addcontent08@gmail.com>
Subject: [PATCH v2 3/3] usb: usbip: fix OOB read/write in usbip_pad_iso()
Date: Wed, 25 Mar 2026 13:48:41 +0300
Message-Id: <20260325104841.8282-3-addcontent08@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325104841.8282-1-addcontent08@gmail.com>
References: <20260325104841.8282-1-addcontent08@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35449-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D7E3323603
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

usbip_pad_iso() repositions ISO frame data within the transfer buffer
via memmove().  Neither the source offset (actualoffset, derived by
subtracting wire-supplied actual_length values) nor the destination
offset (iso_frame_desc[i].offset, taken directly from the wire) is
bounds-checked.

If a crafted actual_length wraps actualoffset negative through the
subtraction (see patch 2/3 for the root cause), the memmove source
points before the allocation - slab OOB read, data returned to
userspace.

Independently, iso_frame_desc[i].offset is never validated against
transfer_buffer_length.  Setting offset past the end of the buffer
gives a fully controlled OOB write into whatever sits next in the
slab - confirmed with offset=400 on a 392-byte buffer, 64-byte write.

Add bounds checks for both the source and destination ranges before
each memmove call.  Use unsigned comparisons after the sign check on
actualoffset to avoid signed/unsigned conversion surprises.

Signed-off-by: Kelvin Mbogo <addcontent08@gmail.com>
---
Changes in v2:
  - Fix indentation to pass checkpatch (Greg)
  - Reword comments to describe what is being validated (Greg)
  - Drop Reported-by (author is signer)

 drivers/usb/usbip/usbip_common.c | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
index fd620e9..8ebaaea 100644
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -770,6 +770,42 @@ void usbip_pad_iso(struct usbip_device *ud, struct urb *urb)
 	 */
 	for (i = np-1; i > 0; i--) {
 		actualoffset -= urb->iso_frame_desc[i].actual_length;
+
+		/*
+		 * Validate source range: actualoffset can go negative
+		 * via crafted actual_length values from the wire.
+		 */
+		if (actualoffset < 0 ||
+		    (unsigned int)actualoffset >
+				(unsigned int)urb->transfer_buffer_length ||
+		    urb->iso_frame_desc[i].actual_length >
+				(unsigned int)urb->transfer_buffer_length -
+				(unsigned int)actualoffset) {
+			dev_err(&urb->dev->dev,
+				"pad_iso: bad src off=%d len=%u bufsz=%d\n",
+				actualoffset,
+				urb->iso_frame_desc[i].actual_length,
+				urb->transfer_buffer_length);
+			return;
+		}
+
+		/*
+		 * Validate destination range: iso_frame_desc[i].offset
+		 * is wire-supplied and must not exceed the buffer.
+		 */
+		if (urb->iso_frame_desc[i].offset >
+				(unsigned int)urb->transfer_buffer_length ||
+		    urb->iso_frame_desc[i].actual_length >
+				(unsigned int)urb->transfer_buffer_length -
+				urb->iso_frame_desc[i].offset) {
+			dev_err(&urb->dev->dev,
+				"pad_iso: bad dst off=%u len=%u bufsz=%d\n",
+				urb->iso_frame_desc[i].offset,
+				urb->iso_frame_desc[i].actual_length,
+				urb->transfer_buffer_length);
+			return;
+		}
+
 		memmove(urb->transfer_buffer + urb->iso_frame_desc[i].offset,
 			urb->transfer_buffer + actualoffset,
 			urb->iso_frame_desc[i].actual_length);
-- 
2.34.1


