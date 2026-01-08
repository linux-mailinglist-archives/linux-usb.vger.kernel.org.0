Return-Path: <linux-usb+bounces-32049-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F31D03FE5
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 16:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E56BF361FAFB
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 15:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AC33EEFD4;
	Thu,  8 Jan 2026 09:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ax4a+ip4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f226.google.com (mail-yw1-f226.google.com [209.85.128.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BD3407570
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 09:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863444; cv=none; b=C21t1u/7EO/+DSWRQ2rlerUABrydNhd5W2yJc2CFVnmht1TZohq++lC5Rdl1LrI1dHJHjjaAC5lRhrORz2xjx/kUtgJFi6njJ/FjnTQ+u/7LXEnPJ3Vjna7JWHSJOgC8XkDPml+hCOANnlJb6Lj0+Lunrv97vVG4v2A2thiDZPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863444; c=relaxed/simple;
	bh=uq93U9o8JB9zbSTVh+vQQdETnho1x8xCHUG4yBJ991Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q46ysp3N6jEDclNywKDNr7gdRogFdgzakNIxcrjluCDtrAnk9t8UD/azWTG2EUzLLwYs4nGdxBS0QwoLwDIfqjIEbQAAVnrdyhUX4YUvN/oEepcBMp8brM4oM4maHHn1j3e7QybpKqhzWrR8/21hwjKYGQD0wA/wcyhq4EFPSRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ax4a+ip4; arc=none smtp.client-ip=209.85.128.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-yw1-f226.google.com with SMTP id 00721157ae682-790992528f6so28334097b3.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 01:10:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767863431; x=1768468231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1wGe4AzuWmLwc2h4fqRv3J8yQzipzJ9zvQmyQ9uhA4=;
        b=VBYQmHMvS4d+niaHJKO+FyHD+V27NYYKKa13zV2c3HY8wgLVUgkdJig1QtEm32bXXs
         MC7RJj8ABYpm2uUL/FtALKIHLEVFGc36+AHYDhLVi6zH7MBzkJQf2rG99Xu46u2EJThX
         MdTJHZfSUXsdHyXsftG0TUfaaboF4qDQ4oqIi2/jom1LCpKENt6QoFt/EUA8fpIj6ysB
         m59pPtrkBoThUD4mLTnGgzckDE+XhXbRSqyaZN1/RZ2W2rIV3rDF78TlRC9n626dvkl7
         iEQT9ZuaGRavxNTtI1V9sDzv2Dbg6zTwY+8WNOYtXclgFPquqI8jGgN6IU+AJoLXjZGL
         +vfg==
X-Forwarded-Encrypted: i=1; AJvYcCVgXxFmAXewtzp/PUe+rDcCmu5c4BkMAC0bTItVwOwsDY46cBA7ETWF8Wls983JHZaAinftIHcRt8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrsC0E8ap7uFi3lEfjTFc6SoCByGrj+pLeB53JX7ICEdhOB4W2
	yjx/kTwmTJxFns/4caak/Vm0HteofRd7NHsj4NIOeY7BTAZY+5WZxdfpGYNVYI3TlqetBAI/IiY
	F51fYRM59ye4kXQzLYiU+0slBtRP7dctJ9wyea3yaapmvQ3idOnpg2Vs4XHC745pIYwCauOvA50
	BhidRWvSTuhgntCoxa0ZNraF92Ko22NnCQ1roSdYtAUPS4cGzQXmrKeG3Qiv65NWw0uo3eFDBmt
	OrBbm4fmCzrrXhxFbq0IQ==
X-Gm-Gg: AY/fxX6oj3oNnYB7bnxd/NMJkGjtEDvnPFfNR410hzbm3U8Ffu2Q9ihbULP8zkLfQkL
	dA4A0MzAvk+8i2bjEsO619VDEdTdMEi89IuioGSypWy0VEjJ4cGkgnJYJhAQYdSHeBdGirnFkQu
	ciQ4s3CMktKQifQTESXy/koGVZB8dEUWG8+/7LfvbOA0w6ZDGsz/2Jko937QpBUzt4BnQ6jo6xU
	daLA9GzJlkdi9yU6hPi45U8oaB3h5Ctfaix8EyRSk32kejVEHai7/s4hxOJzG4+XMIi6DFuDdIm
	gvtoko1ruCrrVVeSrfw1S3tTQxHiyEwGWn0lIPPGVodxcRnbyZ+RGknQNGJdb1Xp7D8x6Zx+L/f
	jnwtLTnMDZsSGaqSKGW7kJCSkQzhmMeb/jYfHR8eB2mOgmVOdgMfaXH/glHOeA+9rIX3NNlo0IY
	3CGSHoNyZ8YBoZ02475TOsvZ8IYBvFU8NHWfrSdZjtsgFwKA==
X-Google-Smtp-Source: AGHT+IFJznOk/byR2mIugRp6gaOfrLw3EfCY1DAQw+E+CIXD6e8Z/4A6TG2HxCBUheBfGxSVJuGTzgaQvEv0
X-Received: by 2002:a05:690c:350a:b0:78c:6838:9462 with SMTP id 00721157ae682-790b5702ffbmr56061767b3.66.1767863430793;
        Thu, 08 Jan 2026 01:10:30 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-1.dlp.protect.broadcom.com. [144.49.247.1])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-790aa6e1c4esm5693297b3.24.2026.01.08.01.10.30
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:10:30 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b0530846d3so2202157eec.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 01:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1767863430; x=1768468230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1wGe4AzuWmLwc2h4fqRv3J8yQzipzJ9zvQmyQ9uhA4=;
        b=ax4a+ip4g4l4yfvuTcnabIcsykVjSS/IuuWmKcOm82Qu28E1W4qW5hGJlWkigY+Yn/
         rDGQ7r8ZzlF5zJi845R4vFZJi5aMwkRNg4r+cJWxPDMBZ5dI+39p9jAgdoZrGrhzcX+t
         TzZAQO1s0fVYDA9qU91IcIlFkhWQ1P80l7Yfc=
X-Forwarded-Encrypted: i=1; AJvYcCVcW6VpjTyqMbXEphYEj04IcaRqaOAvqeQpHSXZvnI7I0PBFqGWVKqP8rfWfFgeY5o1SO9Xt/u3Vuc=@vger.kernel.org
X-Received: by 2002:a05:7022:3c10:b0:119:e56b:98c0 with SMTP id a92af1059eb24-121f8b8bd9cmr3172453c88.39.1767863429605;
        Thu, 08 Jan 2026 01:10:29 -0800 (PST)
X-Received: by 2002:a05:7022:3c10:b0:119:e56b:98c0 with SMTP id a92af1059eb24-121f8b8bd9cmr3172435c88.39.1767863428998;
        Thu, 08 Jan 2026 01:10:28 -0800 (PST)
Received: from shivania.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f24985d1sm13267619c88.16.2026.01.08.01.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 01:10:28 -0800 (PST)
From: Shivani Agarwal <shivani.agarwal@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Shivani Agarwal <shivani.agarwal@broadcom.com>
Subject: [PATCH 1/2 v5.10-v6.1] usb: xhci: move link chain bit quirk checks into one helper function.
Date: Thu,  8 Jan 2026 00:49:26 -0800
Message-Id: <20260108084927.671785-2-shivani.agarwal@broadcom.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260108084927.671785-1-shivani.agarwal@broadcom.com>
References: <20260108084927.671785-1-shivani.agarwal@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Niklas Neronin <niklas.neronin@linux.intel.com>

commit 7476a2215c07703db5e95efaa3fc5b9f957b9417 upstream.

Older 0.95 xHCI hosts and some other specific newer hosts require the
chain bit to be set for Link TRBs even if the link TRB is not in the
middle of a transfer descriptor (TD).

move the checks for all those cases  into one xhci_link_chain_quirk()
function to clean up and avoid code duplication.

No functional changes.

[skip renaming chain_links flag, reword commit message -Mathias]

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Link: https://lore.kernel.org/r/20240626124835.1023046-10-mathias.nyman@linux.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[Shivani: Modified to apply on v5.10.y-v6.1.y]
Signed-off-by: Shivani Agarwal <shivani.agarwal@broadcom.com>
---
 drivers/usb/host/xhci-mem.c  | 10 ++--------
 drivers/usb/host/xhci-ring.c |  8 ++------
 drivers/usb/host/xhci.h      |  7 +++++--
 3 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 57f739f93321..42c12b382e9f 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -133,10 +133,7 @@ static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	if (!ring || !first || !last)
 		return;
 
-	/* Set chain bit for 0.95 hosts, and for isoc rings on AMD 0.96 host */
-	chain_links = !!(xhci_link_trb_quirk(xhci) ||
-			 (ring->type == TYPE_ISOC &&
-			  (xhci->quirks & XHCI_AMD_0x96_HOST)));
+	chain_links = xhci_link_chain_quirk(xhci, ring->type);
 
 	next = ring->enq_seg->next;
 	xhci_link_segments(ring->enq_seg, first, ring->type, chain_links);
@@ -326,10 +323,7 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 	struct xhci_segment *prev;
 	bool chain_links;
 
-	/* Set chain bit for 0.95 hosts, and for isoc rings on AMD 0.96 host */
-	chain_links = !!(xhci_link_trb_quirk(xhci) ||
-			 (type == TYPE_ISOC &&
-			  (xhci->quirks & XHCI_AMD_0x96_HOST)));
+	chain_links = xhci_link_chain_quirk(xhci, type);
 
 	prev = xhci_segment_alloc(xhci, cycle_state, max_packet, flags);
 	if (!prev)
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index cb0bf8b6e017..1f047f38ef46 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -250,9 +250,7 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
 		 * AMD 0.96 host, carry over the chain bit of the previous TRB
 		 * (which may mean the chain bit is cleared).
 		 */
-		if (!(ring->type == TYPE_ISOC &&
-		      (xhci->quirks & XHCI_AMD_0x96_HOST)) &&
-		    !xhci_link_trb_quirk(xhci)) {
+		if (!xhci_link_chain_quirk(xhci, ring->type)) {
 			next->link.control &= cpu_to_le32(~TRB_CHAIN);
 			next->link.control |= cpu_to_le32(chain);
 		}
@@ -3355,9 +3353,7 @@ static int prepare_ring(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
 		/* If we're not dealing with 0.95 hardware or isoc rings
 		 * on AMD 0.96 host, clear the chain bit.
 		 */
-		if (!xhci_link_trb_quirk(xhci) &&
-		    !(ep_ring->type == TYPE_ISOC &&
-		      (xhci->quirks & XHCI_AMD_0x96_HOST)))
+		if (!xhci_link_chain_quirk(xhci, ep_ring->type))
 			ep_ring->enqueue->link.control &=
 				cpu_to_le32(~TRB_CHAIN);
 		else
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index fd095ff9fc8b..07591a498b5e 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1788,9 +1788,12 @@ static inline void xhci_write_64(struct xhci_hcd *xhci,
 	lo_hi_writeq(val, regs);
 }
 
-static inline int xhci_link_trb_quirk(struct xhci_hcd *xhci)
+
+/* Link TRB chain should always be set on 0.95 hosts, and AMD 0.96 ISOC rings */
+static inline bool xhci_link_chain_quirk(struct xhci_hcd *xhci, enum xhci_ring_type type)
 {
-	return xhci->quirks & XHCI_LINK_TRB_QUIRK;
+	return (xhci->quirks & XHCI_LINK_TRB_QUIRK) ||
+	       (type == TYPE_ISOC && (xhci->quirks & XHCI_AMD_0x96_HOST));
 }
 
 /* xHCI debugging */
-- 
2.43.7


