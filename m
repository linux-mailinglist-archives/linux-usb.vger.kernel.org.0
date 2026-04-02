Return-Path: <linux-usb+bounces-35904-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIDfA/6nzmkgpQYAu9opvQ
	(envelope-from <linux-usb+bounces-35904-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 19:31:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA5B38C890
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 19:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C38C63085F12
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 17:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156C13DEFF6;
	Thu,  2 Apr 2026 17:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p48x7C+m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB633D904B
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 17:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775150709; cv=none; b=Uzcfc7+/AVwiHQyARHmmSliFHeHXKJsxY6BUKUN5GSsLN0K35WsgBblBF/xVWSFYsL7itPqLYyGovXHkmeRuQLCsZ1dPuq3Uvf4lgi36Lga5Dtoz22iQHJq1kDTH7y2TG1xnvIN1BTy4Hqbtxe5KwTEm4LsMpADj8LpAwOcgRi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775150709; c=relaxed/simple;
	bh=xFTtdl0INtzmZuTBgshMsPe6/i29cuHnLmIVlT8f9lM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Bje/uHDvvKTyqBaMX4sZs+NbUHUsrUFbDgJJFYne7sd1CAmkhVPcrWksb9CoMBIGlzKzmovcHoUwReeJs1WUarINr7I7JODVm5qTGiZnG5Dx4AX4U8MNHDpcQzBcs7y8vQyV6VshyyDwt8sfzE1v4REc6Ii1ju3emVKHc2VG6g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p48x7C+m; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso11046135e9.1
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 10:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775150706; x=1775755506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/s3YP1+w5CIUcOZyOXsmFt5ma0YGzEEXw58qL3h7ZJ8=;
        b=p48x7C+mrD1MWhIWkzVGSXkk0yaNddz4h/a05hsT4fIEhikkq6jx5rpImTkX6ifVD+
         uL0hbAWjgsDE6eAEw0KK2G13j2WTfcCWQJq/j7hsl5CQfa4xrVn/0/dHivSphoFlB8tk
         GOQOFvFzqlBe9GwqYjCLYNQ0/9lv43+nDNi+trlN4G5bBClhxHdpdXeKGJFLcKnBXPlN
         BBngKliumjJJDR/vWM5kpHy0WVA+2o8JvodzlT3Al6SWprZj9ioMTGYz1xbNpERfkoBc
         bw+zqWWlkvMFhabZAFEco3b1FTx9saf3mL0PeSKMgJCDh6tmc5Wt/XJM/vZmyYpC9cgP
         tdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775150706; x=1775755506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/s3YP1+w5CIUcOZyOXsmFt5ma0YGzEEXw58qL3h7ZJ8=;
        b=SBz0JhiL+m0kYrJOSCi870nxwOqMDwdHqz0xSJwP6evzP4aeBgdFgJHto8TEK7m4xm
         B+1nGBsuFLHDZ8ooypCXmNGyKjhTwlGAtusCNExOv8554InyEzXEhpiZcSVf/quOCzZ/
         2FuNmwEd6YAuB7EPA4LBZZO0Ge4uSocSQhVkXQHap93xZDg+CNJMZPNeaz2JhdNLpxXQ
         2nd9fkDNmn0LWPVygnR1eHTUSTPOwTXCx0A4aOwBEGSnkdSHEyuStlB2cv08MjYK84lc
         Nj/jlNCfdG/Z4ta90Zdg4VNYjLhM1U74vOAFIZRlB55qp4LB4DocR2cZ7DDbqoP2wl9o
         3Dag==
X-Gm-Message-State: AOJu0YyT3ibGF00TDTxcgzTruyLAdYKqosv++wDm2qsnBexSsbILnfom
	D62h7TtgegbfHQwEwiPVJ66k1Ft/0TqRTI/cCqdS5UJZs08mGyIWZx6cakrFDRJd
X-Gm-Gg: ATEYQzykxa8Np4bYXNf177ilPKl16X+u6yqZhY6cxdI9AV3ym1xLeAZD9kio9QYovDK
	3keTiaBd0CVey5G7kGGyuULfcfR/kmW7HpG1Tg7qOt0+NJWzRCORXKyfGYrnGamDR0ZWsK9ligq
	PUrCx1xNF+Twt1QlXRJBBkrbC9MsxbEq4Nc0o721oFFLyVbykciVMQ0W/ZYYNYV9T6X9k3u412D
	WWEeG7COxR1xMolB1AFbY5rf13p8BrcATQ06SBHgonmyw9wzmKlCq+pa/UJmVjJr6naL1R/JjB7
	wMLxWDJifj5OnVlW0vc7Psk82HL1/2ayYQEiuL4OyCmfZSqXNVaSWhsI4Ed9snDzcGcdRchvsbW
	aAYjRZbIfA5HDIlTwe6vdw3aIHThlYiifSTpWr4mBM16jaQAbBitUQApGP2Fh0+UuxDuFBTF0X2
	KG+fq+f8Ykc6HEWQX6tyFyAg60q5jXkla4eer0vpkIxLM1+lxwd35QCifiGFWGyENZOvp055dkY
	cvAuHe/Yg==
X-Received: by 2002:a05:600c:858e:b0:487:467:4276 with SMTP id 5b1f17b1804b1-488835cd391mr112384525e9.30.1775150705508;
        Thu, 02 Apr 2026 10:25:05 -0700 (PDT)
Received: from PC-BRAT-W10.intra.eskon.cz (mx1.eskon.cz. [83.240.30.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48897fd5f3csm1769155e9.2.2026.04.02.10.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 10:25:05 -0700 (PDT)
From: =?UTF-8?q?Daniel=20Br=C3=A1t?= <danek.brat@gmail.com>
To: linux-usb@vger.kernel.org
Cc: =?UTF-8?q?Daniel=20Br=C3=A1t?= <danek.brat@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: storage: Expand range of matched versions for VL817 quirks entry
Date: Thu,  2 Apr 2026 19:24:33 +0200
Message-Id: <20260402172433.5227-1-danek.brat@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35904-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,rowland.harvard.edu,linuxfoundation.org,lists.one-eyed-alien.net,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danekbrat@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vacharakis.de:email]
X-Rspamd-Queue-Id: 5FA5B38C890
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Expands range of matched bcdDevice values for the VL817 quirk entry.
This is based on experience with Axagon EE35-GTR rev1 3.5" HDD
enclosure, which reports its bcdDevice as 0x0843, but presumably other
vendors using this IC in their products may set it to any other value.

Signed-off-by: Daniel Brát <danek.brat@gmail.com>
---
 drivers/usb/storage/unusual_devs.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
index 47f50d7a385c..255968f9ca42 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -2350,10 +2350,11 @@ UNUSUAL_DEV(  0x2027, 0xa001, 0x0000, 0x9999,
 		US_FL_SCM_MULT_TARG ),
 
 /*
- * Reported by DocMAX <mail@vacharakis.de>
- * and Thomas Weißschuh <linux@weissschuh.net>
+ * Reported by DocMAX <mail@vacharakis.de>,
+ * Thomas Weißschuh <linux@weissschuh.net>
+ * and Daniel Brát <danek.brat@gmail.com>
  */
-UNUSUAL_DEV( 0x2109, 0x0715, 0x9999, 0x9999,
+UNUSUAL_DEV( 0x2109, 0x0715, 0x0000, 0x9999,
 		"VIA Labs, Inc.",
 		"VL817 SATA Bridge",
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
-- 
2.39.5


