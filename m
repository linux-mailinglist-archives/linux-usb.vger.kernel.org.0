Return-Path: <linux-usb+bounces-36817-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEE8IW6p9GlWDQIAu9opvQ
	(envelope-from <linux-usb+bounces-36817-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 15:23:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3004ACA2C
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 15:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D2244300AB0F
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2026 13:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289E83A75A4;
	Fri,  1 May 2026 13:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=1a38-nl.20251104.gappssmtp.com header.i=@1a38-nl.20251104.gappssmtp.com header.b="iZtDD8C0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C283A6F07
	for <linux-usb@vger.kernel.org>; Fri,  1 May 2026 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777641834; cv=none; b=cBfXHwmNLP/6gNZAMGK5PrQWbBk0sGI2U2lkKJUs+uREZ3FDHL2OPWXm2gE1jCaVvtzyDOj7TqVn4O4Xj6wZkYKsJQc60kT25eFL4sZjGHGs+f24Z6ZzggXYggzxYrOWTTg+pJ4gkHvQPL9JPKpcdf+udsfBEeuUHBPjmKa84vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777641834; c=relaxed/simple;
	bh=KkJ59wIwf803wUCq56acbPa9jdImG5Nv1yy8+xg3Qa0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fNRSaco0oIkJb4ya2qydemnqFfgpB88hkUgoj4hOmN1FzskBNpMraJF9neLMY/ToEO5Hu4n20YGbaj1uuLaAI9hI12opNf+yvvGPKkDBQD4WBSd09UzdFV7sDK2vsxnC3vxzX1Sq0t/VYadwJnQ7g0vMa9Nl0cQcIskEbStuhC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1a38.nl; spf=pass smtp.mailfrom=1a38.nl; dkim=pass (2048-bit key) header.d=1a38-nl.20251104.gappssmtp.com header.i=@1a38-nl.20251104.gappssmtp.com header.b=iZtDD8C0; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1a38.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1a38.nl
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9c01854477so282340166b.0
        for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 06:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1a38-nl.20251104.gappssmtp.com; s=20251104; t=1777641830; x=1778246630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SfM+ROdCoG3QX9O4D4H7t/FkLNVxxldQTJPmoG6uyTk=;
        b=iZtDD8C0siySg0IQLXK+GwhIFOMJhS46xogNjlZLa2PXX+m5keORLEvwTUqaP/pjxb
         xBK7h/dUTvKXodQs4nkO06tZtwHYLF1iBsbJJBRGZ3ElxmxPkTWfTqGV38jJZ1akJB6I
         PAYvqKwdrduww2xFqpHCjhO/ZFlJZf2LaMSPV49IY3WrJFt/XmoudJI9PDVDzwT50CyA
         deCF1SIUdrdLT3B4eKOefFWh1JHa2TMLgJ3LGA5qB8az0jrHZA4B5F2VnUQhr/Un6QiI
         CveKwThuaX4iam6GU4sMYR+GbiqbKLNiiinQPxC2k4ExWuQH12JFhgsFCYu/TYGsIjOd
         pt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777641830; x=1778246630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfM+ROdCoG3QX9O4D4H7t/FkLNVxxldQTJPmoG6uyTk=;
        b=ky8U1dmXmYP979LTMRY6II31+AciKVE63seUnUZjIm1L7gtKd2NGD89x/k+AbDo1qq
         DddVa/LzH/7P9lAiHjdwZer86X2VJIHBlvcPDrIjPO68nFL5EmfvMAs8zBjGKkNE2tag
         iZ6cMAh2fWHOLmyqCazcHh+x0PkQ6w6OgeEDL9fyif8JTnqiRhlSkFWqSODH/GGSA8QF
         nzzw+v3CbY9tG8yRaFNX+WTL3B+z7tpwaOWYp6mfw/gSA97R1OxjFkJWi+MgEySEp6qL
         5SJGdFEMq3DlOVDWkKVkTKnSxTLA9qkJjZF96aqPmOqQ09mxhW7o49h+ecT+7CJrMtmU
         GFbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dXAAXr3xZ8ISHjIqTvFGI4FV/J0NOtAAzjHdjzBaa5AxyvBuzTWYUR+kXW8TvD4QkirdNHM0t75U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC8DHX12Y3gW4ibdXsxN1bnpTtNRuYaNziucSAgLEN3/lM799r
	KoV86VPg8/7QrkWz1dk+PkFTrJT7JQTyvETiKpKBjAcXy/2J9TrtJS0+tu3IeUWTR44OFU597UA
	67iI78Ng=
X-Gm-Gg: AeBDieubpW7F2wxZ2R+Opbd0Anm1nx6Q3YRhkKpG9vEkuWF9IxGBg3DSHeVszgVusvR
	uFldFzt5vi4K9PSXCRZJBjChE+8c3UKEpkW9Ij1seY4MxU0vkukHfetE46nJ2yj6UyktNoHGP6M
	iSXX4Jbu4VzBaPmGBUQTQd/ExtavqOgWkaUp1si7rFZEkjGG48aPTQRGgHU2cRKE82IOsoNmTIm
	7Rokyyagf4IlhGONxxPjYr8SiSrjQlmc6Dg8jur8o2Dt3eQMOZ794qo/6lRNPn4jWTrEtvBXSe8
	zp6MiDiOQeMRl1lUB2gbl2IMcuun6YiVCivPyN+mEoE1HDl4ObDA0SF//IZr64wNOObMuV48mRR
	Z9ZKucpnhBZbwbRCJwqLuDtUpqjBnLb82UjR26tDh7kATvFJLZbheVcJKlqVHHpqDyutCSAjQEJ
	324iyVYXAoJQzbT9wLqsdsiSPBPquc6ZsVlOS00Ve1DOMj3OAD66mff0O43s/vjcaX6EnXwg==
X-Received: by 2002:a17:907:3eaa:b0:bb9:120f:965 with SMTP id a640c23a62f3a-bbb68d119e0mr449232666b.7.1777641829904;
        Fri, 01 May 2026 06:23:49 -0700 (PDT)
Received: from crackbook.im.os-support.eu (77-160-61-170.fixed.kpn.net. [77.160.61.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe69f6dc3esm107013766b.10.2026.05.01.06.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:23:49 -0700 (PDT)
From: Sam Burkels <sam@1a38.nl>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	Sam Burkels <sam@1a38.nl>
Subject: [PATCH] usb: storage: Add quirks for PNY Elite Portable SSD
Date: Fri,  1 May 2026 15:23:46 +0200
Message-ID: <20260501132346.86572-1-sam@1a38.nl>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1E3004ACA2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[1a38-nl.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[1a38.nl : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[1a38-nl.20251104.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36817-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sam@1a38.nl,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,1a38-nl.20251104.gappssmtp.com:dkim]

The PNY Elite Portable SSD (USB ID 154b:f009) is a sibling of the
already-quirked PNY Pro Elite SSDs (154b:f00b and 154b:f00d). Like its
siblings, it uses a Phison-based USB-SATA bridge that exhibits
firmware bugs when bound to the uas driver.

Without quirks, the device fails to complete READ CAPACITY commands
when accessed over UAS on a SuperSpeed (USB 3) port. The device
enumerates and reports as a SCSI direct-access device, but reports
zero logical blocks and never finishes spin-up:

    usb 2-3: new SuperSpeed USB device number 8 using xhci_hcd
    usb 2-3: New USB device found, idVendor=154b, idProduct=f009
    usb 2-3: Product: PNY ELITE PSSD
    usb 2-3: Manufacturer: PNY
    scsi host0: uas
    scsi 0:0:0:0: Direct-Access     PNY      PNY ELITE PSSD   0
    sd 0:0:0:0: [sda] Spinning up disk...
    [...10+ seconds of polling, no progress...]
    sd 0:0:0:0: [sda] Read Capacity(16) failed: hostbyte=DID_ERROR
    sd 0:0:0:0: [sda] Read Capacity(10) failed: hostbyte=DID_ERROR
    sd 0:0:0:0: [sda] 0 512-byte logical blocks: (0 B/0 B)

Tested each individual quirk to find the minimum that fixes this:
  - US_FL_NO_ATA_1X alone: device hangs on spin-up
  - US_FL_NO_REPORT_OPCODES alone: works on USB 2.0, hangs on USB 3.0
  - US_FL_NO_ATA_1X | US_FL_NO_REPORT_OPCODES: works on both

With both quirks the device enumerates correctly while still using
the uas driver, and delivers full UAS throughput (~281 MB/s
sequential read on a USB 3.0 Gen 1 port).

The existing PNY Pro Elite entries (f00b, f00d) only set NO_ATA_1X,
but this device additionally chokes on REPORT OPCODES under
SuperSpeed.

Signed-off-by: Sam Burkels <sam@1a38.nl>
---
 drivers/usb/storage/unusual_uas.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index 939a98c2d..d6f86d5db 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -132,6 +132,13 @@ UNUSUAL_DEV(0x152d, 0x0583, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_REPORT_OPCODES),
 
+/* Reported-by: Sam Burkels <sam@1a38.nl> */
+UNUSUAL_DEV(0x154b, 0xf009, 0x0000, 0x9999,
+		"PNY",
+		"PNY ELITE PSSD",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_ATA_1X | US_FL_NO_REPORT_OPCODES),
+
 /* Reported-by: Thinh Nguyen <thinhn@synopsys.com> */
 UNUSUAL_DEV(0x154b, 0xf00b, 0x0000, 0x9999,
 		"PNY",
-- 
2.51.0


