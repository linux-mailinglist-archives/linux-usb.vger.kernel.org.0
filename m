Return-Path: <linux-usb+bounces-37941-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOQ1BWFwEGqgXQYAu9opvQ
	(envelope-from <linux-usb+bounces-37941-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 17:04:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB515B69FB
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 17:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8188530557F1
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 14:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72FE63B5F66;
	Fri, 22 May 2026 14:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJQcKVef"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EAC37DEBE
	for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 14:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779461692; cv=none; b=BkH7F5bAEo11edqaKcwgaql56tCPKZtLY6pQM6/17/BMJ/sp+xG55WhcdlhIKNx2QcUxE7Acz7ZbAXyQMDMdNElfKaFKNdCE+omvwk4yZMRPkBok0KpL8SZf50Bd8375YEFESTxYBGiKtHwTf0e9tbWiRTDH/fixo08ahAiCSIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779461692; c=relaxed/simple;
	bh=5ORvQ4Ljxuc0AAPzO1bFzRwDWeXjmg28dpHZodvCjaE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oVWhH2DPeYUuSUrINTnoHUa/zh0YZGlsNqMvaOD8wYEYsqr7fNjSwZY0/WBPtmxI8tSJgs9Z5nvW4A7KDf5fEZd4Z7xOMoqIfYcHhuzhab64ancgQ3e53ryIqVkBrIEUWJQBMEPkfjfuMyN4TiUqSzPr209IWdnFh6Bg62Hp3Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJQcKVef; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2ba17c8cfacso74380595ad.2
        for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 07:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779461690; x=1780066490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGx1H6sqJFRxmUcSTd3T7v7p1m8D3Mdv113iiWsjIvw=;
        b=cJQcKVefd6aWnQjGOE6XdA34ACvYV4E4JEioXFL+QQbQQZki7cfNMVm9EPAB0/vp1c
         Hcta5hjbPJuHhIJlRrDkTAGrdAA4YRM9d1/7MaRtaiyRDnUNYgfxx1lTQPC+/RmH7/fn
         PbHjDgXUQFMEyewiKUI5X8F2xDvJl9hZ36deQ2qogSAc+rnWQ6S7q8lsmIbhjnkfcqVM
         jyVup5Wymo1BurNE5sYlzvUH73z5srDJF1AOwG3Wom3j2tujfCPiPp/IJgpQTaYXG91Z
         n15Lk9Xr/Ks2/QPbYFMPYSjX82bszwSjQgdfxJ/BocOMuMhjdb0cspm6oiwZC31qlAvq
         j1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779461690; x=1780066490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGx1H6sqJFRxmUcSTd3T7v7p1m8D3Mdv113iiWsjIvw=;
        b=CGEmUHRr2aC6acitmAeDGd4XAtHLCvraiRYBIHUyt9s879b00tlmXYnMSpWOvXv+Ma
         wbJiQ4L02FsywamU7cKxUVRO8UeSxaIDxvtRkqRPGMtvYcMnKvnuoaj0nZvWueS5YSTl
         O/0q6IDs/FWZIHMcM7n0Ply4UB4JftxChxjvLUv2IYBa+jLlhduDogVkLySk16s3GdQV
         GU7M0M1eYMHlBV6dUhRk2+OWLSD8VNWiGH+4N/No3CzME6C/d1Ncd2BZtKqz9+NB3rME
         OQJ+LNGKymPiF1D7rz+vG4JfcEhht27QDbDNUGa47KMcTPzEwq8Q1HIq9RPdydzdROgh
         DqSQ==
X-Gm-Message-State: AOJu0YwMQ0AY/xNhBp40cw7H0unKc9mSRoCn9z7mueLvqcTRPbDFOAwh
	XkUWoaoAxlieJFyDakeZryju6Nd4y4tdjkiZ8Fpru5Kra9uz6yQA4bm2
X-Gm-Gg: Acq92OEkJmFfAbSr9fil6C9MWPD+hhMoEVT3wNi5vizgGWPTk9dtTWcwwX91gZvxXbS
	fSYBOGG17enihyXF2bJPPqlp7MqSbYsunE3M2l0hFGbfEQE0zj2aTfDBlusoLgCX9XZqMJStpk5
	nlPFOXC1vAwbRQXeG5dNNxsxziNOzbHYcOv5Q1VSfTSTvNKOmFc+588BC2lmaQE5AhivNtveA4I
	XS/x1MZ5mPfadpLw0IgxSzjznrdB1OZ3k+UiZg4XX4HLxJup/qnksKzUij9FDATRXmGOx6Q/NFX
	iZY1OHBpF9/PwknNAlCwTAGJW9uoSHbm1hhNyEkirIMf4eox+B1GBN0ODEf4Nm8aSg/6e89eKEM
	GztwZAVnf2sW3qSxSc0cDr772CTr4+c1j/KOSg2hnfC7DvnZKIcoxuLppemdXUPSr5cYBkaoUmx
	mVI3y1ON4cDerAVx4hQWQJxUm0u+u3WAA=
X-Received: by 2002:a17:903:3c63:b0:2ba:85:5827 with SMTP id d9443c01a7336-2beb05ff545mr53402765ad.26.1779461689768;
        Fri, 22 May 2026 07:54:49 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56958d3sm17634645ad.12.2026.05.22.07.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 07:54:49 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zerocling0077@gmail.com,
	2045gemini@gmail.com,
	Zhang Cen <rollkingzzc@gmail.com>
Subject: [PATCH v2] USB: serial: cypress_m8: validate interrupt packet headers
Date: Fri, 22 May 2026 22:54:42 +0800
Message-Id: <20260522145442.2868601-1-rollkingzzc@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37941-lists,linux-usb=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6CB515B69FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

cypress_read_int_callback() parses the interrupt-in buffer according to
the selected Cypress packet format. Format 1 has a two-byte status/count
header and format 2 has a one-byte combined status/count header. The
usb-serial core sizes the interrupt-in buffer from the endpoint
descriptor's wMaxPacketSize, and successful interrupt transfers can
complete short when URB_SHORT_NOT_OK is not set.

Check that the completed packet contains the selected header before
reading it. Malformed short reports are ignored and the interrupt URB is
resubmitted through the existing retry path, preventing out-of-bounds
header-byte reads.

KASAN report as below:
KASAN slab-out-of-bounds in cypress_read_int_callback+0x240/0x7f0
Read of size 1
Call trace:
  cypress_read_int_callback() (drivers/usb/serial/cypress_m8.c:1009)
  __usb_hcd_giveback_urb()
  dummy_timer()

Fixes: 3416eaa1f8f8 ("USB: cypress_m8: Packet format is separate from characteristic size")
Assisted-by: Codex:gpt-5.5
Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
---
v2:
Check only urb->actual_length before reading the packet-format header.
Reuse the existing i header-length variable instead of adding a new one.
Shorten the KASAN trace in the commit message.

 drivers/usb/serial/cypress_m8.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
index afff1a0f4298b..49c0f3e379bd0 100644
--- a/drivers/usb/serial/cypress_m8.c
+++ b/drivers/usb/serial/cypress_m8.c
@@ -1060,18 +1060,27 @@ static void cypress_read_int_callback(struct urb *urb)
 	default:
 	case packet_format_1:
 		/* This is for the CY7C64013... */
-		priv->current_status = data[0] & 0xF8;
-		bytes = data[1] + 2;
 		i = 2;
+		if (result < i)
+			break;
+		priv->current_status = data[0] & 0xF8;
+		bytes = data[1] + i;
 		break;
 	case packet_format_2:
 		/* This is for the CY7C63743... */
+		i = 1;
+		if (result < i)
+			break;
 		priv->current_status = data[0] & 0xF8;
 		bytes = (data[0] & 0x07) + 1;
-		i = 1;
 		break;
 	}
 	spin_unlock_irqrestore(&priv->lock, flags);
+	if (result < i) {
+		dev_dbg(dev, "%s - short packet received: %d bytes\n",
+			__func__, result);
+		goto continue_read;
+	}
 	if (result < bytes) {
 		dev_dbg(dev,
 			"%s - wrong packet size - received %d bytes but packet said %d bytes\n",
-- 
2.43.0

