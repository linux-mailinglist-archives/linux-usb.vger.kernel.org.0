Return-Path: <linux-usb+bounces-35432-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6P7pKcurw2nAtAQAu9opvQ
	(envelope-from <linux-usb+bounces-35432-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:32:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C22322473
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0ECC307E0BB
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 09:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20633358387;
	Wed, 25 Mar 2026 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f370A5GI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523693537C6
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 09:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430775; cv=none; b=QVn4Y47gLBov1eL1CT4ClipiKTWFIYXDA/yCVGwCrmoEzBnPi7c4AmyF0ViHTs1yH3G9vhSGnx1V5AD1RBG5rc1SfcOdsbabhSbpalRLQbSc7fN0Zi15pE8CtohMrmXz2wSaqIk/PrMjY8QIcaOeOSM23CrC47dZUIEHZJzzhec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430775; c=relaxed/simple;
	bh=ZmvqgTFWaGKMAXmXyLcAAz5wXUFrHvKEHYA4hbYZ59Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sNpsPPpYIregw68jfppQ+Q+RQNVUd1p/U1oJze4U5wVoOVrkltWJ7qtTFirzRTSQcgD0lNMm4YI6lBXbjgvq1mk2PVXw4n3qSz/GpcWKnltuntJOhHaF/gF5L90lDbRvSpGokQXkQ/cpcYF8CgQb8/i8fG/obeg5FhGuwDxgMp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f370A5GI; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cb5c9ba82bso756255585a.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 02:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774430773; x=1775035573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SacAaeI15ps9TFZN5fr++lDc4/4uJ2KggRWKXYoPEog=;
        b=f370A5GIUcheycKOpaOCDfpplPnmGzCUZepEj4fXECqKqxOllC7RDmz8UKZBkMPNtf
         uGdCp56pbFjSpLRmSqy/t5avEU691XLAJe2bir9SOfas4WhgIOusOi9BoBwTSh88cctr
         VcO/jaMCa0Rsj3F5sklbD44el/kqZhps8XXnMB6DnOuXRqHyW03DO+sqekMPIZ6nhWsC
         Gv9nD1LY57Im349C7o6Nk86wdVL7jyOChdz4vuyAJ/fhCi2qBcr5cFQ6Q0XGYFf6xI96
         JiC3sr7tjgC2DMF/mGHNhRK11j337OPUZiCdtHoNR0WFuWTv1FlJnVd3MpLGukRGTS0y
         VP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430773; x=1775035573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SacAaeI15ps9TFZN5fr++lDc4/4uJ2KggRWKXYoPEog=;
        b=YxAagPKbfauSymP8e/cqKyndI6GE95/fBGzocjNzD+CPPyrgsUrPEpyaVrqHP+Mnu0
         xySUVqOZDFacxNp1SktefgtklEnHrRMJ7S9Z6CFiRt0ueMIMFr+2yOUeYjFCxiF8Bswl
         Q6PmFnuEDPbhhOrHvehP8UZ7+tbOdc3L/CfIEd9jEEwVStK9pjXHZ8ttxiiLXN3Bz/8J
         zaG5p0CsyXM0Vcd10wGy6TzUBzuVws+CxsZIY2uyLGIPoFvASM/L8KpWwOFvU3Nu5eDJ
         HdLfaO3qerTjx8+430Ca1CRqbGSLVFjB6eCKtDWloxRtZTckskQpyd2O0hTCQMwgdody
         rcrQ==
X-Gm-Message-State: AOJu0YyTBHMMoeIKbAPvIV0/JS5nBYbfXnkOUAB83fZSQJtQpVXHgROJ
	RjwEPGPBtr60msC6Tk9x1RJPk8qEVA2Kq6YUbT2MO+JYimpjaUNgyH3B0Ngtuhf86WdLwgMS
X-Gm-Gg: ATEYQzwl6SCOmNDQlXyoiRx0MdP6RUV53DW6ZsgM2hVhlIZWbDNqrnnjTVjiuokexXq
	gppaTqjSuSOOHqS6mfquz1jnYJ1fqU5D9l5CV+AbsnivebLpnW0BFr3N5eV1cVVty+rm7aULu+j
	CkN2+dXySFwesM5dloMtgl7Z79M9vfLcx0Ap4E18JWFVlQMwVspdlR5YHgB83E1OaIrAS8i+d3G
	y7dWNuI9X442JwvqB00ZLeI7nH3pcDXQik2vsywtfYBdtJzrQdacCd5BQI9MNAy/52cZsi7mYJ+
	LAr10vqNb0HH7Zy27ir9jfcxCxMa1kAqoMaYPQ0s3D9hQU47xpIP4hSTSl3B8vl0/6RTsnjv/7a
	TrclcQrsQ1swZPWn4gKIIWzF2XdbmKinAlw6nsEiXhNfNWGUjX29EURHUyWQ4sTFpgqGKzafCZM
	bUUxNuakYcgWsvOMOHM2tEL11XaU6bEZ3sng0I4oreSmqaGIQq7zRzY7Om5RM4KFIqarYJSKDeR
	bvaeMJ5
X-Received: by 2002:a05:620a:25d0:b0:8cf:ebd2:f8e1 with SMTP id af79cd13be357-8d0010ccb9fmr373957185a.53.1774430772889;
        Wed, 25 Mar 2026 02:26:12 -0700 (PDT)
Received: from AddContent.localdomain (static-23-234-101-108.cust.tzulo.com. [23.234.101.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8f5dabasm1287525085a.3.2026.03.25.02.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:26:11 -0700 (PDT)
From: Kelvin Mbogo <addcontent08@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	security@kernel.org,
	Kelvin Mbogo <addcontent08@gmail.com>
Subject: [PATCH 1/3] usb: usbip: fix integer overflow in usbip_recv_iso()
Date: Wed, 25 Mar 2026 12:26:04 +0300
Message-Id: <20260325092606.7474-1-addcontent08@gmail.com>
X-Mailer: git-send-email 2.34.1
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-35432-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 10C22322473
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

usbip_recv_iso() computes the iso descriptor buffer size as:

    int size = np * sizeof(*iso);

where np comes straight from the wire (urb->number_of_packets, set by
usbip_pack_ret_submit() before we get here).  With np = 0x10000001 and
sizeof(*iso) == 16 the product is 0x100000010 which truncates to 16 on
a 32-bit int.  kzalloc(16) succeeds but the following receive loop
writes np * 16 bytes into it - game over.

USBIP_MAX_ISO_PACKETS (1024) already exists in usbip_common.h for the
submit path but was never enforced on the receive side.

Clamp np to [1, USBIP_MAX_ISO_PACKETS] and switch to kmalloc_array()
so the allocator itself can catch overflows in the future.

One subtlety: usbip_pack_ret_submit() already copied the bogus np into
urb->number_of_packets before we run, so just returning -EPROTO isn't
enough - processcompl() in the HCD will still iterate that many
iso_frame_desc entries when it completes the failed URB.  Zero out
urb->number_of_packets before bailing to prevent that secondary crash
(confirmed on 6.12.0, processcompl+0x63 with CR2 in unmapped slab).

Reported-by: Kelvin Mbogo <addcontent08@gmail.com>
Signed-off-by: Kelvin Mbogo <addcontent08@gmail.com>
---
 drivers/usb/usbip/usbip_common.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
index a2b2da1..549e34b 100644
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -662,7 +662,6 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
 	void *buff;
 	struct usbip_iso_packet_descriptor *iso;
 	int np = urb->number_of_packets;
-	int size = np * sizeof(*iso);
 	int i;
 	int ret;
 	int total_length = 0;
@@ -674,12 +673,22 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
 	if (np == 0)
 		return 0;
 
-	buff = kzalloc(size, GFP_KERNEL);
+	if (np < 0 || np > USBIP_MAX_ISO_PACKETS) {
+		dev_err(&urb->dev->dev,
+			"recv iso: invalid number_of_packets %d\n", np);
+		/* usbip_pack_ret_submit() already set urb->number_of_packets
+		 * from the wire - zero it so processcompl() does not iterate
+		 * OOB descriptors on the way out. */
+		urb->number_of_packets = 0;
+		return -EPROTO;
+	}
+
+	buff = kmalloc_array(np, sizeof(*iso), GFP_KERNEL);
 	if (!buff)
 		return -ENOMEM;
 
-	ret = usbip_recv(ud->tcp_socket, buff, size);
-	if (ret != size) {
+	ret = usbip_recv(ud->tcp_socket, buff, np * sizeof(*iso));
+	if (ret != np * (int)sizeof(*iso)) {
 		dev_err(&urb->dev->dev, "recv iso_frame_descriptor, %d\n",
 			ret);
 		kfree(buff);
-- 
2.34.1


