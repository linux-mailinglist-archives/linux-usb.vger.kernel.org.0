Return-Path: <linux-usb+bounces-33228-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPW9FwGcimmDMQAAu9opvQ
	(envelope-from <linux-usb+bounces-33228-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 03:46:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AEC1166CA
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 03:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 854AF3060286
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 02:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117682E8DFD;
	Tue, 10 Feb 2026 02:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="M3H0iwuL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6E32E2DDD
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 02:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691427; cv=none; b=PXJ/YyJTGmFtwStGd8xRi1lhG0AmpxvBtePtvwJ09eXdcAf6MwXfnR5pDUP+VHb2vuYUv4y/YaH3r9qvUA7EnIlAK2eqTTPrj4Ipy5OqWP+DtjwFYsS/ihkiv7hT7c7NeikNlC8mJsRIOBzLFKmMNEiz6njviTWrYVcpdz/JDuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691427; c=relaxed/simple;
	bh=b4xPWImOTlDajhrUG7eXtH2aZH7I0nVFi0jycnY3IPE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s5ckXO8SXgSrYdjD+fP/EoFYs257MQ0bauv4djOzeCis2sMnrgEGl4B0I9k32jf/uV8PMXy47i2DdbM1ILZ21vxEvtN8nrTraw88extXVH4ALk+ZklO3Sg3XXbD4fEDXmo3Wyx6rqfPg5QrzWGKyx8N3haO4E/OpBnAfyg1oadU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=M3H0iwuL; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-894674a4c4aso58350056d6.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 18:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770691424; x=1771296224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qvKGjQtrDpaNiZmMQcUWKgx5WOmlV0d55tFNLhvEBPw=;
        b=M3H0iwuL1syI+nG/M3a/AR6NS6HRLuuNbAF4IS61EgIGtMp0IgGqpzlqjR4JTctgl+
         Uab/E7KhfhAVk32VLZZTlavxezyGdpZbCvGVchQ7w6kyOAmEBiCzXFmcvTsFCNi5+Uf6
         1ZEulBwbljoUdjWob8AR8NUBX2RWifva3bWo1N8gC9VtA30fz0dSWcDT0NhP1MCL+Xwn
         8tyEPUQdg2OvpeWlEfxfstAFOD9VdEkXczHaqNIuJPOL+LIO1/dosZFU5w7aXZkIPp56
         MN1ckPE2H1U8n+TmwBOHUxK1jmUNzp1ehmfiGI+AxZRc00/VHNgezZP6zT+n95vprDS0
         yuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770691424; x=1771296224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvKGjQtrDpaNiZmMQcUWKgx5WOmlV0d55tFNLhvEBPw=;
        b=tK7F1EGurnJLRWasgKU1P1I+1rxwvbduWlxC1Kb3++WP++Nf6OzLIqjQbYuecGmAkg
         uvcCy8E8wf64UuG39TQfMGJqH1DlZ7WhnOBe1Or5Ezfj6Xs0wZ4V49PXHPg+rNNfgcSU
         s/oo6aOANMnhFdag/ggjkviAKnPT5Ufr2R97bPBIh2/Kh/q2umI7tTn2Fn7hJJ2GeD92
         tT6m5EtxfupEiHhA+TgFp07hv9koOXv9LS6PQlKmp4b7rEquwLoUXlkgkw57EPLZ6L/U
         wqLxpkGvalagjE0EA6M0+RXVmO16K16fjyMKJodU3mzY8jNRe8d/gZfvezL0JiNS3b43
         LbJA==
X-Gm-Message-State: AOJu0Yy4X5k2dxsaoeO1G2owSe+UgAy0jNZgV6E0tI4z/tOm8GRuVq87
	L5cfw9EERup4Vo40PFePsogG0a7hrpm+KRrf6reH6FQ56nwQsFug6Esx9LSVheRCGgQ=
X-Gm-Gg: AZuq6aIkTBDNDbg61YCIg9ZQ6b4KIQTaPBKhLfCw2P1/0djfp9jhzYVExtQJygA9Oi9
	zArBF6Eb3C856A8s87beIW6zyqiGaHh8q/FxAhp8v32pi8/mFpKlPYUoLiJ0+ACmeyQCQT2feI8
	0lWT5w/4v3IntXstWZKCZlfawkr2frgsQX7EkEXUJ4+UGLz8vRpg2JzSsZqpqXI64oMO2xik8h1
	t/Ng27wZk2hV8c0zCsBsUzSm6nqT0hhHCpX6GLOMY5lwxoA9SFuqFKX4eeBttu9bYmvyOQDmw6H
	ID7n0RyATMIGK/dA8fH4rq9mDSgy93dJGW2Z/+fDDckuzxV9IIiqh3eRR2zDRHlA2WqowiB/fMe
	k5GxJK9q1v89cLFlSjuxAen4a4Z7SMMWM9ocj2jnie2rrLWG6EPUGH0LQxzyz6xgUfGBPABORHq
	OA8wh7u9NPmxxS0ewGIllQhE7uLeYEgU9vLrzDCsqgEC7WgyVHefFt0nShjXm79AAbLaZtDGo74
	bKjFcEyUilWHh8MM5uuZiXIGOTj0XEniEZaZD0cs90=
X-Received: by 2002:a05:6214:518c:b0:895:c06:8cbe with SMTP id 6a1803df08f44-8953cfa19a3mr211943866d6.69.1770691424012;
        Mon, 09 Feb 2026 18:43:44 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953bf5b2ddsm88416486d6.18.2026.02.09.18.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:43:43 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH net] net: usb: catc: enable basic endpoint checking
Date: Tue, 10 Feb 2026 02:43:41 +0000
Message-Id: <20260210024341.3216007-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33228-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[u.northwestern.edu:mid,u-northwestern-edu.20230601.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,northwestern.edu:email]
X-Rspamd-Queue-Id: C8AEC1166CA
X-Rspamd-Action: no action

catc_probe() fills three URBs with hardcoded endpoint pipes without
verifying the endpoint descriptors:

  - usb_sndbulkpipe(usbdev, 1) and usb_rcvbulkpipe(usbdev, 1) for TX/RX
  - usb_rcvintpipe(usbdev, 2) for interrupt status

A malformed USB device can present these endpoints with transfer types
that differ from what the driver assumes.

Add usb_check_bulk_endpoints() and usb_check_int_endpoints() calls
after usb_set_interface() to verify endpoint types before use, rejecting
devices with mismatched descriptors at probe time.

Similar to
- commit 90b7f2961798 ("net: usb: rtl8150: enable basic endpoint checking")
which fixed the issue in rtl8150.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/net/usb/catc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/usb/catc.c b/drivers/net/usb/catc.c
index 6759388692f8..e92773cbf5f9 100644
--- a/drivers/net/usb/catc.c
+++ b/drivers/net/usb/catc.c
@@ -770,6 +770,13 @@ static int catc_probe(struct usb_interface *intf, const struct usb_device_id *id
 	struct net_device *netdev;
 	struct catc *catc;
 	u8 broadcast[ETH_ALEN];
+	static const u8 bulk_ep_addr[] = {
+		USB_DIR_OUT | 1,	/* EP 1 OUT (TX) */
+		USB_DIR_IN | 1,		/* EP 1 IN  (RX) */
+		0};
+	static const u8 int_ep_addr[] = {
+		USB_DIR_IN | 2,		/* EP 2 IN  (interrupt) */
+		0};
 	u8 *macbuf;
 	int pktsz, ret = -ENOMEM;
 
@@ -784,6 +791,14 @@ static int catc_probe(struct usb_interface *intf, const struct usb_device_id *id
 		goto fail_mem;
 	}
 
+	/* Verify that all required endpoints are present */
+	if (!usb_check_bulk_endpoints(intf, bulk_ep_addr) ||
+	    !usb_check_int_endpoints(intf, int_ep_addr)) {
+		dev_err(dev, "Missing or invalid endpoints\n");
+		ret = -ENODEV;
+		goto fail_mem;
+	}
+
 	netdev = alloc_etherdev(sizeof(struct catc));
 	if (!netdev)
 		goto fail_mem;
-- 
2.34.1


