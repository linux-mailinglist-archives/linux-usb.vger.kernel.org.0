Return-Path: <linux-usb+bounces-36199-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDziAr/W3GmcWQkAu9opvQ
	(envelope-from <linux-usb+bounces-36199-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 13:42:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0483EB704
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 13:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F0DB301C10C
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 11:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4057E3C3441;
	Mon, 13 Apr 2026 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="cAr3l21V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6BB3AB28F
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 11:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080558; cv=none; b=mjgJbb9W/FgSe1NbGzxxobtTFiKM2GC4ymtH0epdVF4W1u97GBbhOfswUGw74eO2/mdYfiQw6QPr4Q7eqwwX1kPSo8c58IkDbHQT2wDkVzgaCG8UuvYvYPIXYqHWxouexBpD/HAkjC+MVKT5gE/3pqTDkzk6D3Q2Qkbxh4LfP5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080558; c=relaxed/simple;
	bh=PnNMMbjwcKzVWP+m7FD53JqeYKvEanJzlNiXzEuxsp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQOUgiRGukGOtdl9yj5fnUGiMGdvVSuQ//xbYwtIWXm5pkFps0Qvr5j+A+lCgMjjErXKa2y5KIWczpuRyrJgl0+0Tl3TG6OgX2OWvlaPiKzSAgF7JXLzGROHligSildFUy+fmjbZpRagc/Oi2XJ7c0OGp5onFf/w5k2nEoca7hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=cAr3l21V; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a041eae5so31281705e9.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 04:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1776080556; x=1776685356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbrAMVuoymvOc0pbOyeM4Q5RieftEOwF5FE/RDRgc9A=;
        b=cAr3l21VklToYwJNBQlMpmkHi/IkaKzFZNR3zfRMRHDHD8AeOwM03n9e/+Tk0TMyOp
         krpOgQ/otkHzuDNYhKQOonYyTEwGfqyl5FlP8tgxDQyr6GwpUPZf3yp2QkU/cSHDE0Jb
         euLnduKsneFyppNarzFmJhW9kFnY8qPUaRoE+FPaztQuPa3db8LLQIlQTIZHqMVZHGlR
         l2Z6XzeAO1e+7edNDXNPFca3q/atkjigMGFSMLmbwrF+zcrFpecNmnZzjEoMlmXvjPWW
         /cWa2D6ZuE48wdFKeZN7757uW5gc6V1nmJ+4DbZKKT1WFe47J/SsWkHC5qaCP/1lPtn9
         6auQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776080556; x=1776685356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BbrAMVuoymvOc0pbOyeM4Q5RieftEOwF5FE/RDRgc9A=;
        b=l1ggzo0QhGfo5vWnn55ege6RNpOAd9OnedvBTe2EXXzHTUJPzOd1N38bRu455wM2NL
         xn2Kxtd2ZMqk+0bIsw/8xMTiDEZf+8GoL9PGWHgzzKu+JcXSz/VbDUbpqHXgZ/OuZDF6
         FDLaoQGKtNyOvN16Am9OpKxtIac8eE4mH2bbts75vMllmFXLAb8BVdvONnJpDcWax8Yw
         XgXboHbHzBcTckdheEeU0Kml3ft0egv5mJa76CGZkNyLInXnKudlgl6105OR7Mef6uef
         KjiH3kcgannU5QqUoYP/RqT/lFNi6gLrSpN41m10B2M1ULG52ujqDmvYVs4+h627ANTQ
         09qg==
X-Forwarded-Encrypted: i=1; AFNElJ8vBgWEGj9sNV0OoeEj26JafCkqW4mgsl0yTbD456tuJqVcFUdrmJqmAlPvoolMQ8hvUzGWE7t8SuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YytzQ5icqYT33mVWJvBhFOmnpP/ljg2PeY1sMhspQDIoluhixx4
	hxKVNbuqezPauBvHnayihDOLXXQWAwF+AL9eSRFRsr4PHgSid8W1YNBp3YMKSHdFZg==
X-Gm-Gg: AeBDiev2b6jbBlbjFLYxeu4DP1Nfifo3vX01jWocbW6Rxrfo54p5dXjSmmzFE3mthqr
	35J3MZO6PIjBbfEhu5hSqhOiwcF3wwA2VjB7gnOx9Tlh5vEi8R2TS05DCwVcv1bgmdzE1ahi7Yh
	VuS45XXO2FkeZqRk3l/zAjaN0KPiee772dwSkqUB5q0SnEg9kisZ4QwQIy+HLnoMJ40wRkBhj+n
	n6Cirq2pip46RIkaXncfQCTXqP4vsIXhdqyZGMnKywa/9oJNj2Qhd0RGn6+zNpfo9eUYGBGytMM
	HRs9EAUpId6TzzGGBzvyDu4yyWuaTyAIP32YUsmB/ZnXOyBWbwirWjrgcseullrk6B1qFYZT/km
	EdrhR63Za8j/QjC8ACT0XnqtUD+hgeiBJpOt2e9TnxGtR5UDsI3s8RosqOLARZ0fDQehyseC6ex
	Yfe2pDkJ80/RPdWP556UauUM7kPTx/Xb9bAePsAfUX73abCzW7DuK+sxtGdYCFG9o4R2Dh
X-Received: by 2002:a05:600c:3f0e:b0:485:3f72:323f with SMTP id 5b1f17b1804b1-488d67e6973mr177577725e9.11.1776080555721;
        Mon, 13 Apr 2026 04:42:35 -0700 (PDT)
Received: from horizon.localdomain ([212.105.128.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67b46ffsm126301165e9.6.2026.04.13.04.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 04:42:34 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Rhodes <sean@starlabs.systems>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Ricky Wu <ricky_wu@realtek.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-usb@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: [RFC PATCH 1/2] rtsx_usb: hold runtime PM during transfers
Date: Mon, 13 Apr 2026 12:42:30 +0100
Message-ID: <95a293902585bd43c6857b79bdcdb8be692ff687.1776080528.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1776080528.git.sean@starlabs.systems>
References: <cover.1776080528.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[starlabs-systems.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[starlabs.systems : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[starlabs-systems.20251104.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36199-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@starlabs.systems,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,starlabs.systems:email,starlabs.systems:mid]
X-Rspamd-Queue-Id: 6A0483EB704
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hold a runtime-PM reference across bulk transfers, and mark the device
busy afterwards.

When runtime PM is already in progress (e.g. from rtsx_usb_suspend()),
avoid forcing a runtime resume from within the PM path by using
usb_autopm_get_interface_no_resume() unless the interface is already
runtime-suspended.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/misc/cardreader/rtsx_usb.c | 38 ++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/cardreader/rtsx_usb.c b/drivers/misc/cardreader/rtsx_usb.c
index f65acf4d1164..c8badd0db87b 100644
--- a/drivers/misc/cardreader/rtsx_usb.c
+++ b/drivers/misc/cardreader/rtsx_usb.c
@@ -12,6 +12,7 @@
 #include <linux/usb.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/core.h>
+#include <linux/pm_runtime.h>
 #include <linux/rtsx_usb.h>
 
 static int polling_pipe = 1;
@@ -65,19 +66,42 @@ static int rtsx_usb_bulk_transfer_sglist(struct rtsx_ucr *ucr,
 }
 
 int rtsx_usb_transfer_data(struct rtsx_ucr *ucr, unsigned int pipe,
-			      void *buf, unsigned int len, int num_sg,
-			      unsigned int *act_len, int timeout)
+				      void *buf, unsigned int len, int num_sg,
+				      unsigned int *act_len, int timeout)
 {
+	int ret;
+	struct device *dev = &ucr->pusb_intf->dev;
+
 	if (timeout < 600)
 		timeout = 600;
 
+	/*
+	 * During runtime suspend/resume callbacks, avoid forcing a runtime resume
+	 * from within the PM path. The device is still active when
+	 * rtsx_usb_suspend() runs, but usb_autopm_get_interface() can block when
+	 * runtime PM is already in progress.
+	 */
+	if (pm_runtime_status_suspended(dev)) {
+		ret = usb_autopm_get_interface(ucr->pusb_intf);
+	} else {
+		usb_autopm_get_interface_no_resume(ucr->pusb_intf);
+		ret = 0;
+	}
+	if (ret)
+		return ret;
+
 	if (num_sg)
-		return rtsx_usb_bulk_transfer_sglist(ucr, pipe,
-				(struct scatterlist *)buf, num_sg, len, act_len,
-				timeout);
+		ret = rtsx_usb_bulk_transfer_sglist(ucr, pipe,
+						    (struct scatterlist *)buf,
+						    num_sg, len, act_len,
+						    timeout);
 	else
-		return usb_bulk_msg(ucr->pusb_dev, pipe, buf, len, act_len,
-				timeout);
+		ret = usb_bulk_msg(ucr->pusb_dev, pipe, buf, len, act_len,
+				   timeout);
+
+	usb_mark_last_busy(ucr->pusb_dev);
+	usb_autopm_put_interface(ucr->pusb_intf);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(rtsx_usb_transfer_data);
 

