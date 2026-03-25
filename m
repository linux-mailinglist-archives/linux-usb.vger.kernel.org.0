Return-Path: <linux-usb+bounces-35445-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A3vFP67w2kRtwQAu9opvQ
	(envelope-from <linux-usb+bounces-35445-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:42:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E79643232C9
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 54AEF308BC98
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95CAF3BA230;
	Wed, 25 Mar 2026 10:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCXM0xIK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05BE3BA235
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 10:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435013; cv=none; b=ai/UhhYg/+ovsf4fGtcO89Jt/rKJ03iaRgoZIzigNxoJtMUFZZwKfdX2kvTAjtEO3KkbvjzIsDjrDomk2clE1YrRADmc7TooaPKUVT//sP9uZIJcUIIxX3h85VaPOKFqZivpT3QMHaxdAkqwacdgwBowFKz/cxbhtvUu2yzXAio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435013; c=relaxed/simple;
	bh=FatE/wK9J7yDXMt0nj/XrzYzbc9G/22/6FOzRnqaSwY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bgI7e9betrobDYzVINS7BhD1Om0fd3b6UqcJ8DixAGOl8mdcIhuPow5YEx8U/pOXZn0eBCfLFS2KBCbMC4T63CQQRZkMsA5pE2Rf2gVdE3eYBdem+Nu6Q/F8bnFgID9zbGt5fiBlktUT+CiDBBZ7yvJYYnNXjbmI++UoO8nC/Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCXM0xIK; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cfc2d1fdbfso187193385a.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 03:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774435010; x=1775039810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZP3i3TTYy/eNIzw4A1vLXOZeRi+MZYB+jmMoKKIpEE=;
        b=YCXM0xIKEWW7DKe7pr8qN+GPWpljebCzAlLgn0TnRaQDjhBc0NFKEhRh60QaHqIlUS
         9ssZUEgHJb5UHoKJZVJJw2v3PCE+oJ2B4+QIzD4ONF4VSGnci2GTESVko8uXxsbhijVw
         v/e330IjdU+mYEfVIfYbWWHo58mXOdwXnImY5TxK7iJSPjYQYAx6n272TRKDGI0F5deh
         LuUPK5lwCQ6czWBI164gXXjasuFQqEalpTUN5NJN+M1DH8vcHxOCPvXjWBqjIbNMYI9S
         RaB6JyEImGs2hEFkQYkAEiasD+bqjfyV5rP8/8ANXy1NPRSxNSK3j1oT3UV1GjqhdBfK
         CCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435010; x=1775039810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SZP3i3TTYy/eNIzw4A1vLXOZeRi+MZYB+jmMoKKIpEE=;
        b=FoisnnBWcEung7CW1I35KH+/O0ilkU4Vs2+nm0Ozl1h5+UIjyCMlR7LbEVypdNIbmT
         oVc1u8u7f1jC3ZEwFEePGRCC9RV61KGYB+3zwaDv0AV0majzjqEBRgQ+O5R4Xo8q2d9E
         uI1sU6mBMXgg8UVQ5jn+RmZqdOYHpGFRuPwU9FDdEMzSLw53pUvPUZ4eaPut+LE9Z1x8
         Lk0ztrcCf8/2RhIaHg8rUtaE7+DbZl0Rv4BUaOboWqmwdO+boOFlQ50Hc8Ok0IUX3JH7
         YePrc/IKXoPlk0MHEbzhW5DfqyS25IMvMLZbvtBqUHuaFV1mXL6zX5UhAfQ+kVu+q9fM
         qepQ==
X-Gm-Message-State: AOJu0YwgOKBm4tI5uZjFkw2+HADyzI82G6xdp6Wp81/C35WH+FAAtjxw
	CIRew6k3GUnkbDifBQznynf1yF38/L6ZY6ddh4/81VDfbOUTpxX1rKLvuT1Jr/fcfZpbhZ8F
X-Gm-Gg: ATEYQzxaf5Rnt8MBXV6bnyIqgub/Midxh7Al4G5IMawPc07TcxFACjEKhFUg3zHq4oS
	ckOkQe/mOFFLF0Ik3zIz5/fnl8UWZCg9n490Fvzmg5ynqMqlhS0WYhZZaF5p6YmDRlvqrQbKjPk
	ISTCrmYqsGv+7ewDonTbPqVz3g23/LgtdZQxh1Cln0NuH51DR05OqvHx0kI2hJA4mP8ZUrsldKH
	I/QGEkh8SluomHS1hYpcrLjeA/T1a7s0VltJiV34wXHw3saeaEDS2lJymtVj1OYz73y5gYYpFqU
	PUiKnXFKavRgKRTOrjPYbtHBvA4XF1MUiggp7QpGrl01Gt8RTnavBtRCLziZwbZOzrAvuhCbmQo
	VD0345wzuk/0jEZ5YkBeTO2dDFqMWqqCZItjfJsGOqIrbUzIyOVIK3vKZQeXgyECffzAFD/92j6
	DkWH+sbHG0yFwMzcAyYR7mv7Y+/i3ioFnNG1vd4CKiFTDSqgUqPRV09e8pNAtWbnzo9JVYQZQe/
	lK/X3Gdda4RGHiGXcg=
X-Received: by 2002:a05:620a:408e:b0:8cb:3870:5c1e with SMTP id af79cd13be357-8d000f55fcamr374389585a.25.1774435010462;
        Wed, 25 Mar 2026 03:36:50 -0700 (PDT)
Received: from AddContent.localdomain (static-23-234-101-108.cust.tzulo.com. [23.234.101.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8f5cd4csm1482760385a.5.2026.03.25.03.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 03:36:50 -0700 (PDT)
From: Kelvin Mbogo <addcontent08@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	Kelvin Mbogo <addcontent08@gmail.com>
Subject: [PATCH v2 3/3] usb: usbip: fix OOB read/write in usbip_pad_iso()
Date: Wed, 25 Mar 2026 13:36:40 +0300
Message-Id: <20260325103640.8090-3-addcontent08@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35445-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E79643232C9
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


