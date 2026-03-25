Return-Path: <linux-usb+bounces-35443-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIZhLJa8w2kRtwQAu9opvQ
	(envelope-from <linux-usb+bounces-35443-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:44:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC64E323369
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 39D423028F74
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02823BA240;
	Wed, 25 Mar 2026 10:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbEwJocF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE723B9DBA
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 10:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435008; cv=none; b=KTR0RLTorErJRBeLsryaiyjpVPxGl/9gUENAJYlyy1VKI1izA/ahc/U/VUQeoMPc6ByWkm/q1XKsRBFj+akpKhAEtgXP+HGoKjrxkQV6lc0/h3t6KHtslf3wraRtCijTKXrYl+Vd/sHQWqe+pob+p06AfSrPRCBFyIviCXZbdeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435008; c=relaxed/simple;
	bh=jHk68LfuWe2NCEumQbItnVWR6G4BDunvlIS9+ySnIVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M2LcQzh7DDtabFdFGEBq22Zl1yXtztImp5vZJV3MFYRTjCbNMDjToYg/h0QPaAn1qj5FMAdOM/7pCh5rNGYdgj7FlNqWGTiuBz8K19rzo6WQuOHtJqZmSYA12sIEQ1z6HI2EnJcogc8Ia2FQ8xHT5BNcm9+7SQWsf/Iev8uK0i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbEwJocF; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cd80f56b27so587155485a.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 03:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774435006; x=1775039806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uF65yq8zVG82WNiBPpyaZlTnk9uC+n2WnmWd1TJCDB0=;
        b=CbEwJocFe75IXCYZim8JvaqU9/RvI3WA08CBQkgREgcyGFKutdVhxeafabkvksyYoK
         LRDJP0ICxFmsUxIu/roImwJc/IBas6s6mP1bDAT1LQ0QbZEezOrvSmHyPp/D0Uamk3zo
         eLSGUxAXQT8WTLRIZajOc63PC5gxwiIp5DYYSBFyTWmSyqqfMDs972CtKhsnWP3C4Zyd
         7ykNOPOdmX02Dt4sY/qZCJtEWaxbDAW/2rKZ15d1o/Ow/F1pwOtAdo5ctncrQBTxTefZ
         EqueAcdbGvC7p/WIZLsFIth2JHQe93SWDV1/8481O7Zy0CpOUbRY8Jy/N0QPgsrYcwB4
         nX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435006; x=1775039806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uF65yq8zVG82WNiBPpyaZlTnk9uC+n2WnmWd1TJCDB0=;
        b=RLWL80F7Ihsq8DfVO545oN1dVtKYjv42cI3EGJX697p6xPce4M5TOmwNeMZvIsCSNP
         am8JkZpvTxF0vD4Gr3+DFHzW3X5bzP9iQaQHu+HWYEXM0x6px5w5Cat12hM3wt0rig0n
         idmzk2iVxFJLuyoXpnZI5904XprdZTHHSxZFq/+fNhN8UHLc4hbgJDB+7DHjW2frG9sV
         /w3l7sLrbTYbqw5cuiurhidhbqg5LGtb6mAG5xK2/gID+iNGq+LWWRqSCNRgcTb3gbq6
         oCitN2ot0CyytVhDud9CXqlueDwbHBqPcGLd3kq1Q5ZUcummgx1m1kU9xeVum0Xf8kud
         zrIw==
X-Gm-Message-State: AOJu0Yz03+QyDVE7dj3DBx5Xf7nkJ2gnL9xfsOFOIRZc7M3kxmHpfSNc
	CBakwaYv9KWeV4kfRNbEfGsCqngA8ZYL6FTWYeMq6eSU1BDojEYnziz/ynSi3CdVNzHAB2Oy
X-Gm-Gg: ATEYQzxb98+sWRAgAHaTDJEAiIdZtppD+XgqxEbYt+ReuT01tsPEREf5DQU8Kwi1Vmn
	CxhAESXKyWNQSaWqPPkR6KSsBnW1R/7SnZwvreSShaJySaSQ0N0AMdFZl7/uF2n8vxmQ4Z/Q6ir
	Br7yBiJaBRKgM7Y3EGIfcHGdSv7agWCNHk+Po/+3atQdspxYES4OdSiJBuPA3WG9CE3r0cvJDLm
	nBlqfmpjUmQBHNk8iWRKG4c5Df2hpa1tLv4DgJeTDZ4itAt/LCyyui0A4xyOWeC9im1FRI0X2dZ
	Bsp6eMEuRNnZfEqo7N2U9oxh0B71TLP7jBEMQjLdhfm+NzGGZCLQ4vak97Bs1wnO5PaCU3rW0Mh
	KedUMUReBTpRzYHu+Qsoy5o1tauAqcjJjdsB3RH3t/Asv2/nsU2+IZkaWuAWsa83Yvedo9XM994
	oS/TdGNzkJS1sjLYsyrJKnMmCmJyaropulaV5EeheVpjxCBCmqHSK0BF91GZSNfxBQVwaN10YCR
	2gQSsGv
X-Received: by 2002:a05:620a:46aa:b0:8cf:ed8d:20a3 with SMTP id af79cd13be357-8d0010f03a6mr439027685a.42.1774435005606;
        Wed, 25 Mar 2026 03:36:45 -0700 (PDT)
Received: from AddContent.localdomain (static-23-234-101-108.cust.tzulo.com. [23.234.101.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8f5cd4csm1482760385a.5.2026.03.25.03.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 03:36:45 -0700 (PDT)
From: Kelvin Mbogo <addcontent08@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	Kelvin Mbogo <addcontent08@gmail.com>
Subject: [PATCH v2 1/3] usb: usbip: fix integer overflow in usbip_recv_iso()
Date: Wed, 25 Mar 2026 13:36:38 +0300
Message-Id: <20260325103640.8090-1-addcontent08@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35443-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: CC64E323369
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

Clamp np to [1, USBIP_MAX_ISO_PACKETS] and switch to kcalloc() so
the allocator itself can catch overflows in the future.  Fold the
existing np == 0 early return into the new bounds check.

usbip_pack_ret_submit() already copied the bogus np into
urb->number_of_packets before we run, so just returning -EPROTO is
not enough - processcompl() in the HCD will still iterate that many
iso_frame_desc entries when it completes the failed URB.  Zero out
urb->number_of_packets before bailing to prevent that secondary crash
(confirmed on 6.12.0, processcompl+0x63 with CR2 in unmapped slab).

Signed-off-by: Kelvin Mbogo <addcontent08@gmail.com>
---
 drivers/usb/usbip/usbip_common.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
index a2b2da1..8b6eb74 100644
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -662,7 +662,7 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
 	void *buff;
 	struct usbip_iso_packet_descriptor *iso;
 	int np = urb->number_of_packets;
-	int size = np * sizeof(*iso);
+	int size;
 	int i;
 	int ret;
 	int total_length = 0;
@@ -670,11 +670,21 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
 	if (!usb_pipeisoc(urb->pipe))
 		return 0;
 
-	/* my Bluetooth dongle gets ISO URBs which are np = 0 */
-	if (np == 0)
-		return 0;
+	if (np <= 0 || np > USBIP_MAX_ISO_PACKETS) {
+		dev_err(&urb->dev->dev,
+			"recv iso: invalid number_of_packets %d\n", np);
+		/*
+		 * usbip_pack_ret_submit() already set urb->number_of_packets
+		 * from the wire.  Zero it so processcompl() does not iterate
+		 * OOB descriptors on the way out.
+		 */
+		urb->number_of_packets = 0;
+		return -EPROTO;
+	}
+
+	size = np * sizeof(*iso);
 
-	buff = kzalloc(size, GFP_KERNEL);
+	buff = kcalloc(np, sizeof(*iso), GFP_KERNEL);
 	if (!buff)
 		return -ENOMEM;
 
-- 
2.34.1


