Return-Path: <linux-usb+bounces-35434-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHFgB8arw2nAtAQAu9opvQ
	(envelope-from <linux-usb+bounces-35434-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:32:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F3032246C
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4631E310DB96
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 09:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13852351C3E;
	Wed, 25 Mar 2026 09:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xe/h1qMD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B44B30AD05
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430780; cv=none; b=gIdOBeTxVpj9JfWHls75Kr5LVgWyWogys2i3efwmdMYcGtZiQGKp5xE9vsSms+PLN+/Ku1v6sTJ3JwfhPV/r3QJCiucLkQD89o/35AIadtmYoOQaHoAFT9b8liBXO3fuwihhLrVViHC6fOyq+AO8pzEYaX2aK0qfDJ6I5sM2/sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430780; c=relaxed/simple;
	bh=Xggtp9fbvwh3zGvZ0o1F8PEq3i3lH21FS7msqM5mcj8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kWxbnEjaDzHZ+zwT/61gtMfORDQZBu/O84hU6casmvvO9ZR4ZY80rQxLyAbA6XPKRF865+EUiJ0E1V6NzL/Hr+vHEr6Ws6VWe6V48qwoSyYvNma8JqE9Zc+LEfEKiwERkBF4wezi/miKSsvEa4lTjsB0n8aAg9gNKq8rae5makc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xe/h1qMD; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cfc795ca97so198978085a.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 02:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774430778; x=1775035578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDVI1OMNbAREKVZuY7Zg+9JEyRLJEIuaC/jZ1V8sQxM=;
        b=Xe/h1qMDxbSbbv4fWjAU/Ad2O0OCD84acPJL1n++sJ0hceo3HbbhtRKCqX1nGqN9/M
         kYohAHES0hhF53St870Nx75pE88CiT2P69emRTuo/9quMh7IYeuu2kqdwCIYzXxo2Km9
         XOpyE/aupzimMsGOqBuKGmHa+DOEblw6UCz3+geREHlj6tDKT3AzNAyW168A7Tt62BsB
         NiXCJIAO8Ps0sK1/S1w0Mho2bwHsGjoaoTxiad3pdX0TubjSTvdBB4SyY6jgLJjL+Za+
         bH5MY7o0xcx6OzOsADh9ZQJh2oP+xxfSTlOtH/f0KGaWfeqe3qaI9J58AmlQHX7dgOfR
         vMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430778; x=1775035578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XDVI1OMNbAREKVZuY7Zg+9JEyRLJEIuaC/jZ1V8sQxM=;
        b=Fysvnn7u2BXI2MsQUCWClwnK50omM2z36m4lq0UAWaywhtH0GZx9mRsZ4iVn8UNSAC
         mtjbP4PcAP8BZB/i14+Rr6xYG2EVPmfWoe5PTtIHMA3RnNmahwArhZ6U/qTIKbD2iBfX
         WeFkNe4ZhUCsEvcTRqzLK8rn5yQtvZbJehlRmYjVNdvSY7yCjhL59CQAFeeE16U9jOzn
         Xvvi4FIkXwRVlP83RuHEzKfDV+5adEEBHTOxKYQButdJV61n27qkWPv6DNKwKTtIVPSr
         gia3RZZeuWWlf8urOrKhK41ZKNLhMsnHL0qT5hzZjcUWq4QPlT2h8ubMAK6RwZ0XCqwO
         LlAQ==
X-Gm-Message-State: AOJu0YzslecN4WmL8HbyCspl++BEqV65Jtc+Eef1r3W9frsK4sZa+Oo7
	in+9j3e1ehgwaiz7qazRFOkrPJ1n2bHCBOIT4M3nbSX40kLydz8/0VPAiKQ8AnhtxZnwvDVp
X-Gm-Gg: ATEYQzxenpNb9TbRb87ixt3vjOAPLI8T8tzDnmb7WsIBwWOv3owOsWYPsdgEpbWLGin
	rdYMH07CWsuffwyPHLiUTHRY4wOMQwZKtWZy+2hACDZ/GLTrEWyszF+28tGlEL3+kbofHdX513r
	EriJncC7Enfa41FNcOs2FW2cBT2QBXHvW0T42k1iWywvqqUYO75Tyc2FLMXF97UZ/vW+fPWSMFi
	n3m5k3KRvuhSEHtjqRQCf1881WCoCMpH5Jfpmt1kuKSzOCkqYARd4jFQv3f5ZaVlhZ3fJrc0/ew
	rvRwRPdG1xKhnQNCmVD6eucak5hG4HMEM1sdkpOw7OBfdADcyEWskNj8RZoDLtdriqpWuz2ATZ9
	67Zc/9J3h0qG2Cw4jtYTBh8Q0DJEMWfqOP7P6BZtaeuI5Qu5pkbG0eQVXkrPfx2m1myo/SKVlD8
	F4sZr7q1v6mIr3k1zdJBsVca4VAHveHxFWTQsJPX4VNxXyF7v9f8sQja5dVd/F9UlkDHnfIUssv
	ed023bO
X-Received: by 2002:a05:620a:4050:b0:8cd:827a:2ab3 with SMTP id af79cd13be357-8d00103ba9emr343140285a.55.1774430777965;
        Wed, 25 Mar 2026 02:26:17 -0700 (PDT)
Received: from AddContent.localdomain (static-23-234-101-108.cust.tzulo.com. [23.234.101.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8f5dabasm1287525085a.3.2026.03.25.02.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:26:17 -0700 (PDT)
From: Kelvin Mbogo <addcontent08@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	security@kernel.org,
	Kelvin Mbogo <addcontent08@gmail.com>
Subject: [PATCH 3/3] usb: usbip: fix OOB read/write in usbip_pad_iso()
Date: Wed, 25 Mar 2026 12:26:06 +0300
Message-Id: <20260325092606.7474-3-addcontent08@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-35434-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: C5F3032246C
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

Reported-by: Kelvin Mbogo <addcontent08@gmail.com>
Signed-off-by: Kelvin Mbogo <addcontent08@gmail.com>
---
 drivers/usb/usbip/usbip_common.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
index c79a90f..e95e63f 100644
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -769,6 +769,36 @@ void usbip_pad_iso(struct usbip_device *ud, struct urb *urb)
 	 */
 	for (i = np-1; i > 0; i--) {
 		actualoffset -= urb->iso_frame_desc[i].actual_length;
+
+		/* source: actualoffset can go negative via crafted
+		 * actual_length - catch that plus any overshoot */
+		if (actualoffset < 0 ||
+		    (unsigned int)actualoffset > (unsigned int)urb->transfer_buffer_length ||
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
+		/* dest: offset comes straight from the wire, never checked */
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


