Return-Path: <linux-usb+bounces-35849-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCrNAf0vzmnIlQYAu9opvQ
	(envelope-from <linux-usb+bounces-35849-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 10:59:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DE038663C
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 10:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BF763040750
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 08:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF7E3CAE65;
	Thu,  2 Apr 2026 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5tHyB74"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859A33C73C0
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 08:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119996; cv=none; b=abEF7nZn3lyh3wWM9lZCSu+EHFL0ACFNFDfbas/3RtOOr2pblz1qDwp9lhzMnTJsGO8Q/pn+oSYj6jG3thCaxUJnrgjpPrUvfxg11rB5Z0I7lHTJ8KF5nONJNRTlxaxei0ll9WlieVNogZ52WCv9QuGd5ZjNHQ/FnOQOM+Mzc4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119996; c=relaxed/simple;
	bh=nD5pJ6t0iPgbSDk4MiAKLhLc2K497D4OPy81R4OU6T4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YE6ozhmfyiBxw4DRQN9OKFcvhSV0+cooeE4CrzMjqEZbl8PEaR0SNiqKj+bSNrGw4shIDTkzWy0tlENqxAiziSgMkiDT9ZKwtpd1IEhepaQ5TiuDsKdkpAwNCK1o+mN6SGv8eEdOLuIu7EHEImF8ss6Sa4sscwH71X3QK9FGVyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5tHyB74; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50b2b2aa276so5494631cf.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 01:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775119993; x=1775724793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OwBCIwxrNlJiEdT3Pl3xjUbsa64rptRCzck0YDPH76w=;
        b=N5tHyB74XFUK61ze43qVIwy/4AH9uBtLYxt/ZEddYZthFLLnYXyD1DpCIDeh3+S261
         OVCQQdSXwSCXmrXoWrKWQbYxqNtRi9vSf87Mxnkb1WNW/KuLdoPxbce66a3KxKdHWfTp
         oqYevYy5Zv+Fe5qgLRNOtZ3M6MlUkwe+iBZhLIxAXE4X4Z8NK4kksiuDNtWD7kvQa5wa
         RVqlN1anm30RLrdyi7EUGtIuYtDNCaja4706rRv48QirN5AivwIx6VeZhVlue3TMD5hS
         xppKb4DSD/uuMEOQQfUlN4pWqUIElOwXzLKmwiooVCUWjm3PDyJ5L1Oa0qyS7nIorenx
         dmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119993; x=1775724793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwBCIwxrNlJiEdT3Pl3xjUbsa64rptRCzck0YDPH76w=;
        b=he9qrwslauvrkO3jkNx+Q7h/8H2gyURFIb/4lF4+SMBDHXEYVJAErn5h8C8OLZ5LSu
         KTy/J/UCzm8OWKp9hurMuZKyh4a9FSAaDxlYuMwFTm6T25ORhFopdVFT5P4mQdgTh9qP
         MqE11N4x8EYExWcwmpv4GJjzSDrAQXr8L+3qwNwFhBML65ow/PJOalc4VEDTGfUSu2x9
         AG6K1eeXITrMoDRaULYIgaM10VgMS1adxMl5mzDqJqkX//AiZEnpbTjqLY25ZXyIIfBW
         83Nzoubc+cO+a1YzB8E6FbTLOk+8hU2VaOU5C7cwlYu+RWkhIhfVDCSafHvPWFn+68/X
         dC+w==
X-Gm-Message-State: AOJu0YwFXLlXro9AgfcR6puEfPsIrRMeVm5W6Yole9HT8sr5SGfR4SRY
	GhdoDW+Vfs8N1hqc4FtxGPFiiGsgRc3GgGFbLjNZr90beBULRV4BteAPAHi36/yY
X-Gm-Gg: ATEYQzy8uZZhmWypWHPuJefrs8X8Qy4PDH6b2HRwpvbTPr504HUnwoWiFNviHe3rR/s
	hpx5VUPhyQ7mDM3AZollQtjJBw1BbPS/5160dH7M1V3A0h28Zp6gAYpB+3iCa8pZprN7S+TQTka
	1ynZRfTYpi1sRhRkcM0+RWU0CnZXyU5Ow0Li4UUz3lv0RhRf43TN8kRvFLufVzAw7PSSSfzeS6v
	NZgaN2qIJd2vQCy00+pNo89yl1quqjohaxppuCO8f6dJhE36e7nEftMd749xdLiJ2t9aX1vt3Tv
	8Y3ik3Le4qKWnMiiaStYuR1CJhzUKn4/UySvW6MTUF+VDILrVX6DTxA7hdkT2Qu99oz/S8EO42l
	kGTHUu7C3apR3CwscljFvwFCTxV+BGeiiwATd8WHqild0r4XQgjSpY7OglbRyeIo7syY/aMTK9y
	2Q+hFeYqK2e3bFulDiEcuckJ9c+/fjEukcHjDdZ8Sh0n/4Xz8v/OKXypjLBs+Sh4oN7KfrQ4pRb
	CKsJa24HZffvS2lhBCJ
X-Received: by 2002:a05:622a:259a:b0:509:379b:d4e with SMTP id d75a77b69052e-50d3bcd2630mr105863161cf.32.1775119992828;
        Thu, 02 Apr 2026 01:53:12 -0700 (PDT)
Received: from localhost.localdomain ([129.170.197.116])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b88914csm18051841cf.23.2026.04.02.01.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:53:12 -0700 (PDT)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	addcontent08@gmail.com,
	skhan@linuxfoundation.org,
	kyungtae.kim@dartmouth.edu,
	stable@vger.kernel.org,
	Nathan Rebello <nathan.c.rebello@gmail.com>
Subject: [PATCH v2] usbip: validate number_of_packets in usbip_pack_ret_submit()
Date: Thu,  2 Apr 2026 04:52:59 -0400
Message-ID: <20260402085259.234-1-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,dartmouth.edu,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35849-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathancrebello@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 63DE038663C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When a USB/IP client receives a RET_SUBMIT response,
usbip_pack_ret_submit() unconditionally overwrites
urb->number_of_packets from the network PDU. This value is
subsequently used as the loop bound in usbip_recv_iso() and
usbip_pad_iso() to iterate over urb->iso_frame_desc[], a flexible
array whose size was fixed at URB allocation time based on the
*original* number_of_packets from the CMD_SUBMIT.

A malicious USB/IP server can set number_of_packets in the response
to a value larger than what was originally submitted, causing a heap
out-of-bounds write when usbip_recv_iso() writes to
urb->iso_frame_desc[i] beyond the allocated region.

KASAN confirmed this with kernel 7.0.0-rc5:

  BUG: KASAN: slab-out-of-bounds in usbip_recv_iso+0x46a/0x640
  Write of size 4 at addr ffff888106351d40 by task vhci_rx/69

  The buggy address is located 0 bytes to the right of
   allocated 320-byte region [ffff888106351c00, ffff888106351d40)

The server side (stub_rx.c) and gadget side (vudc_rx.c) already
validate number_of_packets in the CMD_SUBMIT path since commits
c6688ef9f297 ("usbip: fix stub_rx: harden CMD_SUBMIT path to handle
malicious input") and b78d830f0049 ("usbip: fix vudc_rx: harden
CMD_SUBMIT path to handle malicious input"). The server side validates
against USBIP_MAX_ISO_PACKETS because no URB exists yet at that point.
On the client side we have the original URB, so we can use the tighter
bound: the response must not exceed the original number_of_packets.

This mirrors the existing validation of actual_length against
transfer_buffer_length in usbip_recv_xbuff(), which checks the
response value against the original allocation size.

Kelvin Mbogo's series ("usb: usbip: fix integer overflow in
usbip_recv_iso()", v2) hardens the receive-side functions themselves;
this patch complements that work by catching the bad value at its
source -- in usbip_pack_ret_submit() before the overwrite -- and
using the tighter per-URB allocation bound rather than the global
USBIP_MAX_ISO_PACKETS limit.

Fix this by checking rpdu->number_of_packets against
urb->number_of_packets in usbip_pack_ret_submit() before the
overwrite. On violation, clamp to zero so that usbip_recv_iso() and
usbip_pad_iso() safely return early.

Fixes: 1325f85fa49f ("staging: usbip: bugfix add number of packets for isochronous frames")
Cc: stable@vger.kernel.org
Acked-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Nathan Rebello <nathan.c.rebello@gmail.com>
---
Changes in v2:
  - Fixed patch whitespace corruption
  - Corrected Fixes tag commit hash

 drivers/usb/usbip/usbip_common.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
index 8ebaaeaf848e..a5837c0feb05 100644
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -470,6 +470,18 @@ static void usbip_pack_ret_submit(struct usbip_header *pdu, struct urb *urb,
 		urb->status		= rpdu->status;
 		urb->actual_length	= rpdu->actual_length;
 		urb->start_frame	= rpdu->start_frame;
+		/*
+		 * The number_of_packets field determines the length of
+		 * iso_frame_desc[], which is a flexible array allocated
+		 * at URB creation time. A response must never claim more
+		 * packets than originally submitted; doing so would cause
+		 * an out-of-bounds write in usbip_recv_iso() and
+		 * usbip_pad_iso(). Clamp to zero on violation so both
+		 * functions safely return early.
+		 */
+		if (rpdu->number_of_packets < 0 ||
+		    rpdu->number_of_packets > urb->number_of_packets)
+			rpdu->number_of_packets = 0;
 		urb->number_of_packets = rpdu->number_of_packets;
 		urb->error_count	= rpdu->error_count;
 	}
-- 
2.43.0.windows.1


