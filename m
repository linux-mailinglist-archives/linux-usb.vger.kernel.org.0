Return-Path: <linux-usb+bounces-32703-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNapI40Sd2k5bwEAu9opvQ
	(envelope-from <linux-usb+bounces-32703-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 08:06:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABE484AE3
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 08:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0EB4300D94B
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 07:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC4428B40E;
	Mon, 26 Jan 2026 07:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObDE7EkE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C181D28850E
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 07:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769411189; cv=none; b=so4Ed7Pi1i/cbMvhPv2AYqsbVAhMrDKORfjdpPT5LBVroE8kRqsdxBNgbcI211vN2o3ESnsGDVrBz5UDwiogiiAJew3tuZBMmWlYGP5kkQhnsgwfAiNq0BR6gAJ3fXBUc6uxTeo0KWwfOaZT34+vqk2P87SQ610BBxgqPO2CXWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769411189; c=relaxed/simple;
	bh=BrGYfbKjFcWVBNtR1VCrwZ1sP+nBA2htFvw/QqIZpRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZA8K0yWQATEmZ5+wGCFEg0PziLvRahNdI+r6/QlRIsa5v8xBA60n16AinSUVgV5CALUSEvtMDx/lM2lALcpjhGay/5qPWM63zgrzeXdcX0/HaBUCPHKsZ/bYrd8vGA6jZASB/QFko6FJ8SRhZw/CuVLpBjsHdJdpRoNzXPMH5z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObDE7EkE; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2b7381d2d95so1517103eec.0
        for <linux-usb@vger.kernel.org>; Sun, 25 Jan 2026 23:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769411187; x=1770015987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnNSYAsSgZZKBbd6EX4AMUvPpqA2jWI9KkqGPjFXPC0=;
        b=ObDE7EkEzZCzM4l2WEmjfE/rIA9vOK9qUHkbpah/DiS7vwQ2W5ngVeG8SeLhGUwJBK
         C4xPHzWCNmgo9mU6KT9Ulkrsri/k2vqZq2SXI6BReyZba43OvSuSU5PHZmJ6g4z4b3+d
         zY+/JJfWYw+SrRnyDXiCkjswXIZDD+IR0clEjddTHWGqynUX1TEB81abhhQJuSdwFxBg
         /Zlr5H9MQa9ehv8hlMLP2rUHYWupuMnepV8KSF4G2YNpEoWOCz1M7a8ysZvYW0hs/u7w
         U8LXv6gpKHyM2FEUFwBNOOkvwpftyfb+5GxhJFXcL4yWqc7NHyaU0quhW71fyD9Es+nk
         hD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769411187; x=1770015987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnNSYAsSgZZKBbd6EX4AMUvPpqA2jWI9KkqGPjFXPC0=;
        b=hl0YxxlO3El/z/38vTJEKXCUqPHKz3qRuaZkIBTevHEYdsXfkJWjZ3WXVydMi1lJtm
         Z/F7ly5/lApezeh5A6zVoPL4W8FcUSEdwVnpGyrOdcYjJaFtqhrkLBagJ96A+U++xa+B
         /jbe1+bDNd+M7V+E015lI+xJGn6Ehc7Gqkce7ISzew2DtM3z3WgIh4HNM3Cgc8LWV9Lb
         jhfr5liDsctkdI/mwkUpPFQ/2pjDdhfG7gCoOMzaJlmd+RAHS55paSLBL90Tu5I3KFPx
         +SjnIT68XfI7aLAatqFdKX1y0wG8HDM8T9hKjTZSV71jQxdz0sfTkwgWFK3ap4TuCsZ8
         +vmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjOc7kP8TtlQguLnofAsNFY6Mub6QPGBNRPEr8nVk6wRE+RwLVPB2U7VZypMzkx2Vzl2sLVUzRiVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPQjXXykiTIruUzDimicyevBCj3oPFWym5pdlqe1BqnItdCd2R
	TWgbxO+jYSVABsynz8Ek+OxdBjosPfictuJ+DxVKskYNxmUGYAS6y1P6
X-Gm-Gg: AZuq6aITulz9IOngjPit3tbOck1OubjRRRiyNtZvJ0OgUwj6+1T+hlELwAGcbzCguOS
	4UOXQqCrbERrZbI4cwNetPJgCOkbq8El3+MTuB3eTYTWd7rhTNuumld1BqizgWqf/a/yoHlc3YM
	QhFvCrGYuDd6QWIis1m7keKHnWVDZnm69ovALq4Q2ng1is5QxC7uwbcLpIoWONAjbFs4HybU/YJ
	k96rUtiOpxuTqQVAto7p7fAAg5G+Lbcl4I/N3L4ntp27iilObKH7+vnp5NWOpewY+evsuSXlfSx
	EU9B1+xMXStUcph6KoYKHvQc189SnikG/ptFPv9KPqe+K0PYRMwB8hQWmPf5qZV5eYPuDpNleKy
	1xUa8gfunbcYlU0jqrMhMetM5UnTIbl9FJIeqQ/tRM+8dyp4C9qe5+Zn1NZAWkBfqZ42nZb29ME
	649BsLbrgSMQgsSDwQt1B+0S2UQj2mR2XP9SGvtlP2lEEj7qE0XWe6vlyy8LjvJ25aSDCH5Qv7m
	m4ePuoNsNrYAkQ7F+QbhaXkFdEpwYZEQDR77OV2i565/oa7Mi32JMUvkrFHMImTpbdJZfY8nqRz
	yL90/XMz
X-Received: by 2002:a05:7300:d511:b0:2ae:556b:76f2 with SMTP id 5a478bee46e88-2b7638a7f04mr1772945eec.6.1769411186616;
        Sun, 25 Jan 2026 23:06:26 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d91c52bsm18021503c88.6.2026.01.25.23.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:06:26 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: usb: int51x1: remove unused includes
Date: Sun, 25 Jan 2026 23:06:13 -0800
Message-ID: <20260126070618.53758-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32703-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0ABE484AE3
X-Rspamd-Action: no action

Most of the headers the int51x1 driver includes are not actually used.
Remove these unused includes.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/net/usb/int51x1.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/usb/int51x1.c b/drivers/net/usb/int51x1.c
index 6fde41550de1..317ae365277f 100644
--- a/drivers/net/usb/int51x1.c
+++ b/drivers/net/usb/int51x1.c
@@ -13,13 +13,8 @@
  */
 
 #include <linux/module.h>
-#include <linux/ctype.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
-#include <linux/ethtool.h>
-#include <linux/slab.h>
-#include <linux/mii.h>
-#include <linux/usb.h>
 #include <linux/usb/usbnet.h>
 
 #define INT51X1_VENDOR_ID	0x09e1
-- 
2.43.0


