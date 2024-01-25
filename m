Return-Path: <linux-usb+bounces-5516-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A83383CE53
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 22:17:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C9E11C21DF1
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 21:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C1913A255;
	Thu, 25 Jan 2024 21:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b="IsJwSWMU"
X-Original-To: linux-usb@vger.kernel.org
Received: from puleglot.ru (puleglot.ru [195.201.32.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E2E13A24B
	for <linux-usb@vger.kernel.org>; Thu, 25 Jan 2024 21:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.201.32.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706217412; cv=none; b=n/WOapvVrzFndEAV5Oa5wdHJJZhlua8i4z9EXSXGkZuXKMAZOcnFHwRW9WBtcvT9MJ8OxfgB7KRWSp8y7dT1E9t+sFcz2mP1NBnN/RGynDZkjvk/bfv4RotdMuF5TLfGu6tK1HgJbTybtWQ9ChNqxYjNwXbUb0JJs4pSvYwm2+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706217412; c=relaxed/simple;
	bh=9BX4GfaWlVGdFuP8hcd/12GQjY40a5YuX38egNVwEog=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ChkHOhtw4vqupK4YtBlCDrpUyyYbOqeyXGfReFApHuJmTL/gB+r7T9gzH48USZQGfGc9egp3ljbUdtTZEXSh9P5986wKJM3OIFQ8SaGfdr3u9uVl3ZXD7Il2CXGAP9RQFxtsAyah9O2rRkpQI6P0kzxnwfC6t+zThcI/+pAMeiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me; spf=pass smtp.mailfrom=puleglot.ru; dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b=IsJwSWMU; arc=none smtp.client-ip=195.201.32.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puleglot.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:To:From:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=39anHd/8cLPngARMB366vS0a6FcrARY1u4NWjNs7pDA=; b=IsJwSWMUAuCVOd6x76khpgyu4k
	UyyItdvmxjxcm/8/0fXWJi69P7lsvqAwri6LF8L0yS5DQLX23gamQM2Y6p8oODINQQSsVtWlFDzN/
	vfH2ZGbMhNUIrbNtYOOw41yqPmBrygyPYxb1e1JeTZJ7gRqFVckhVZGiTFJn9IRsGods=;
Received: from [2a00:1370:819a:c53:3baa:da0a:1172:ed3d] (helo=home..)
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rT75a-00000002EOb-0au8
	for linux-usb@vger.kernel.org;
	Fri, 26 Jan 2024 00:16:46 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: linux-usb@vger.kernel.org
Subject: [PATCH] usb: audio-v2: Correct comments for struct uac_clock_selector_descriptor
Date: Fri, 26 Jan 2024 00:16:35 +0300
Message-ID: <20240125211635.30140-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: puleglot@puleglot.ru

This is likely a copy-paste error. Replace "Source" with "Selector" where
appropriate.

Fixes: 7e847894039d7 ("linux/usb/audio.h: split header")
Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 include/linux/usb/audio-v2.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/usb/audio-v2.h b/include/linux/usb/audio-v2.h
index ca796dc1a984..6e5555610010 100644
--- a/include/linux/usb/audio-v2.h
+++ b/include/linux/usb/audio-v2.h
@@ -82,7 +82,7 @@ struct uac_clock_source_descriptor {
 #define UAC_CLOCK_SOURCE_TYPE_INT_PROG	0x3
 #define UAC_CLOCK_SOURCE_SYNCED_TO_SOF	(1 << 2)
 
-/* 4.7.2.2 Clock Source Descriptor */
+/* 4.7.2.2 Clock Selector Descriptor */
 
 struct uac_clock_selector_descriptor {
 	__u8 bLength;
@@ -91,7 +91,7 @@ struct uac_clock_selector_descriptor {
 	__u8 bClockID;
 	__u8 bNrInPins;
 	__u8 baCSourceID[];
-	/* bmControls and iClockSource omitted */
+	/* bmControls and iClockSelector omitted */
 } __attribute__((packed));
 
 /* 4.7.2.3 Clock Multiplier Descriptor */
-- 
2.43.0


