Return-Path: <linux-usb+bounces-36913-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC7BFiBM+Wnt7gIAu9opvQ
	(envelope-from <linux-usb+bounces-36913-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 03:47:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B33EB4C5D44
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 03:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 857B3301CA75
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 01:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62794357A40;
	Tue,  5 May 2026 01:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="il85HRkE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84071D61B7
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 01:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777945624; cv=none; b=EBff0+CBGGYfGkdtlMxn/4cZHPk8alsjzH1kgTTfs2bvuAEx7TGdxjpO4nxsKk6laTfx2uQ5jTr48ki0smGJBMXkVX58z+oYliuyagq5tPlDdLizxD3edE6ySfTud0Mbb+6Hi+cXsWnzQXKv5oAewRYF2cypt7F40sPRYXmF4kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777945624; c=relaxed/simple;
	bh=xaD8YBLyzNsHJm9/b7lK3y9pjsbIP17mG8EUOH9QUJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FTlnlwDVRnVXy0e0yYXNlQwbGMiXwDnepXIEC0vqVuDMyf6heCrPQzEPMjjaqkkvkoK/eYIlNSZgo1UVmsWPv927WyH80SExAIFUCCyOPpVC+/jRuXrdSo1Qf7bSP9asaEx+h6SEQV4k1yVVH0HbxQ0eBB6ICD8vp/V4LsA8Lx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=il85HRkE; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-1309f4ee973so1049036c88.1
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 18:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777945622; x=1778550422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1prNxGjvUSN5AMOPmrkHQUe6tyhve21JS0LFJgrx/Ek=;
        b=il85HRkEwD/oFc7eIJz3rKHamNOf9cyQ/MGNsCzRIQCtxhl8ZPXc0k0Jo1lha43n9E
         EnWhjMo95Y4O2bA3ZUDlgt0D8VegitR8787yPNEIP8vAlmWt938GyMkLSJJG0VgubBQj
         ilXRLi4W8555cbv3IPV3ZkVpoIuPEQeVcHeQewj4SfO/XBL1tYXZXPTiTrXwvPsirJtC
         UBQBgJWMSfMHsq8qrnsLSuWDvWkFWBvS/mjKwtssI5wJFq7mrqIs/ncYXtAvTox81cQe
         WmDQJVU+WAZ6cAeGc6EVQWTSykEpnolWoYyBNvfCDjzrH1CWvU9usdmlM8Yo783IZUE8
         pXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777945622; x=1778550422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1prNxGjvUSN5AMOPmrkHQUe6tyhve21JS0LFJgrx/Ek=;
        b=Q4pCuhmR6RHn/C6oijELyOVExDUKQbazvtpARt4s6wNre66EbV8wB8ps2Rxj2mXlzW
         Tu7SBN5pE7WalDHyN3QNurDUJHhTKN/y35hVg0JZl8NfbhzOCuNwwG1KcubgW+Z7IjOS
         0vj67MMVb10Aff4wYeWw9WuuvqoLMBsdJmKQrbm70ZtHYU2QH3onZ1xL/dmgr9tfgrvS
         /pYW4iaXIFInnT8raMgKMYZV4ZI3+DsJDjnkNQMpAhFnwF0+Ijb0AlAsuZadoRH+DKOY
         7g7QqnInMFtDxQXoJxz4150D6evOAhQdvMSOYLCPB0ximozg5hCHAf8u17Yfa5KS7Kfa
         J+jw==
X-Gm-Message-State: AOJu0Yxv/I4zqv6TkW9dUFksit3uj5Bh+hJ3/7zKnXUoVKJi31U/zfl5
	4yWC3BkTEXhy0h18O8s0yIHN6t7bjZ65fr6uzaxyEz0HThhAiiySsduUgMPK7zk6
X-Gm-Gg: AeBDieubQxRWkq/P2J2zf196ixAV+0hXMBArdGYYfJrQDYoOLhAfWFJVZneNEZYnooL
	q5bG05cUoNMyS3h+LANb4ItnaiNz8GIp0pknkwQbZOSQt7TqAU2rdSymEy7aIUVf1ZwiiUKSvIb
	0JsRbeeZm5mC2MLmeTkn0yoSn0A2RN7kgRNzkmoI8O5RBEIEM2R47wUmXAPm0NX3CVUlIAnpsOa
	nCESdKAQtkr0NCMTOExpWlU2fQl6TMFk2cvRdDMa/GQEoO0cuaKhKVMVfXPI1mgJQ3Oc5+Uk8I1
	xxjOpiy1mAgsSxHpAbMRTIuIhogPTo6lZFUQ05bETebJckJEA6O/RLMExl7Xc6igCSN/a9DScaB
	xpzAXsQd6wCBuMOH9zT//pEjCCOOm4zK2Q9qYRVMn7sLOlxSARgjBK274vJWlKsO5aHfqxMlyA1
	a30RO53C4BLrnJ/r3gJY8m58qxKbNkNdFkm3pFhTwCbFAZYw/CPH97gEOdAJl5mUCODNiCTY9WF
	RPdKbAGlvWpx+uf5DbTABj7CVUjvKp3EWfQrL63CDwXfjnc9tdU1U6hUjk4QUJXEX+4uRPd16fd
	fF+HXLalxMquMhoMzscXCbQpmemw
X-Received: by 2002:a05:7022:6093:b0:119:e56c:18b1 with SMTP id a92af1059eb24-12dfd821b1bmr5903248c88.25.1777945621785;
        Mon, 04 May 2026 18:47:01 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm24874944eec.8.2026.05.04.18.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 18:47:01 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peter Korsgaard <peter@korsgaard.com>
Subject: [PATCH net-next] net: usb: mcs7830: adjust incorrect comment implying a vulnerability
Date: Mon,  4 May 2026 18:46:30 -0700
Message-ID: <20260505014634.49100-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B33EB4C5D44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linux.intel.com,korsgaard.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36913-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The mcs7830 driver contains a comment indicating that mcs7830_get_regs
leaks uninitialized memory to user space on some devices. If true, this
would indicate a security vulnerability. However, I investigated the
issue and found that it is not true because ethtool_get_regs (in
net/ethtool/ioctl.c) uses vzalloc to allocate its buffer, which zeroes
the memory. Update the comment to explain this behavior.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/net/usb/mcs7830.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/mcs7830.c b/drivers/net/usb/mcs7830.c
index d6698f30218d..dfdc7bd74166 100644
--- a/drivers/net/usb/mcs7830.c
+++ b/drivers/net/usb/mcs7830.c
@@ -22,7 +22,8 @@
  * - implement get_eeprom/[set_eeprom]
  * - switch PHY on/off on ifup/ifdown (perhaps in usbnet.c, via MII)
  * - mcs7830_get_regs() handling is weird: for rev 2 we return 32 regs,
- *   can access only ~ 24, remaining user buffer is uninitialized garbage
+ *   can access only ~ 24; this is not a security vulnerability because
+ *   ethtool_get_regs allocates a zeroed buffer
  * - anything else?
  */
 
-- 
2.43.0


