Return-Path: <linux-usb+bounces-36547-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CrUMJCF72lpCAEAu9opvQ
	(envelope-from <linux-usb+bounces-36547-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 17:49:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AE4475895
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 17:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3053730D1278
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 15:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8666D355F52;
	Mon, 27 Apr 2026 15:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lV5nh9+a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B6E34F498
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 15:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777304225; cv=none; b=d165B9z5sqxJgwKllOCfo9FaVZJK8MykieLQZayUwbCMzcm4gnqSRRIIEPpp2gO7AVF1YOX69WybXlNcYbGC5cWxaJhSCZ9ZqPwvOwOkbGsRre2isToiJExiAVENiqtMG4/JAzAdH5xydtU6jvf3ND704F8GspAoc0pb6KVbdT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777304225; c=relaxed/simple;
	bh=k2eHeOh1ypEyik00unMmMsD3cRYTWKvd5TA7e2KeNHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m2JDUIiNeLTyygVrBCyWdq4vUlgxXqqqW1f5VNbBlAu19JnRuUmlYg/ZsljU2kb19N/0/aSBAyYWrLrIoEMzhqbWADGRXzgFQqfSpfcL6j1YXW3oDOQnl2EfEh5WojLDdtP+MZONNydjV/L7UOx/W6V3cnSn8O3JIHAK7niKaX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lV5nh9+a; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso7012789a91.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 08:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777304223; x=1777909023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0hpvNH1EUa3cOnUyhzEEF6VXuaHHXz+8JvdcA+bX2rM=;
        b=lV5nh9+aI7CTiI2BJitPX84JGqexpETdo34LW164BUweNX9rd00KscHIfEPpIEnwwn
         lUuokwwr0ONpxQP5V+0AwLn+DO3co9hmmyLtfTko06c4RGrOqfN7rskZOoQMoSBQ7Gis
         EWcWrK4w5loTbuI/yFT0uhrzuFw2dvs6WiNdTwwUiopbMRsfwgszV6V8Zh1WMRRJK2FJ
         +0SO5T7vpd2CD3tGSXZeAe0umhbELe9BnN9XRFZPWSxsf4jb5sZxZvfYPs5x/4cS6Syv
         xS6My8cYM1e9B6GFpEa+tvIQIWzth2TXX9D3A2PsEPFREp7J1igWEcigN4mvgrx+TOLR
         R6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304223; x=1777909023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hpvNH1EUa3cOnUyhzEEF6VXuaHHXz+8JvdcA+bX2rM=;
        b=PRVa5rjENglS5Dy0watXrcmqq+t3QxC/o/0p5qjX3zUUhlzRRCCN/U1Yq4WwZXB7dV
         8hgTObELLTmOqY5m+Umd3G/rucZTcd2vURmm3BgwVQN//txlrfFZxHhWNO6lMwfkU4q+
         46vpZYFkvcYaWqGrLLHdn/HCt44Y+tXQf6NQ8ScieX2MynCS2ZHDK8FyclKkeDE0OGi5
         lFtyo2ubjZP5k/QZPgqwDGa3q4xhEsKf379r62Nc/zTuy9Ef3uywIEBzXWnHIp5SgIUO
         4x6xMuI6JVu05SHT538m6OkKgn13x1htjLjrxFgJCxpEKkSOa8T4DoWggx34Bvvfhaav
         evwg==
X-Forwarded-Encrypted: i=1; AFNElJ+vrL/FxbE4l0kkf94unkIyQpSsO1Wti7LNo/8Ll23fm18jtQy8CkbwjeossVo/yHIFY5ufImNdSf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxkWD2/3wMFh+1UifnrTaMGLYfLBKL483nGbLTHqXc4p2LQTTL
	G3PwiYinwox7XYmg+MpYZdCfh8T/PYhInbEzSgWotTkD2207x0WKbJQQ
X-Gm-Gg: AeBDievCVP/in4sDiWk5OyXbNwcnsXamegvax85UUFuGOXpAVxdrYxrd9MYvA9A901n
	Fdy12nzHRXpLpBhMhRLVKP8060l9afh/TLaf3wzY/w8FcA/WtjWiT0uCozls3rZYi6p58V1OJOg
	ZqRH2ROBk8gNUARG5CoXbgQeaQzVkqcXdC/KAzNICfThuoi0C4L+x7aegfeU64s9mDtLbyarcsx
	/pcRJu4GBdJ9qL4pVg4qinZq9Mwgkh4DeDgZp45MYvhqz0MPqQ/mPP6lqw0sWnmvsdA5xKqILex
	sEkxQ5qcZdMcd36f2Qiz3PK+ovTMQ0Mi94PNj1RZu+G+fesC+Ff8xTzVwgKz3AdYCLlSaCo1UI6
	RLnuSayMhHEHULpl0kHH6WqiB1enio4SZwQl6NSkYuNd7wAdfzKqOlOMcERnvLsmwNb/XQ66Ikc
	pBcji9xnz+LWz2c6eTgBGtWNQNQnlbTCVWeQI=
X-Received: by 2002:a17:90a:f09:b0:361:4521:d311 with SMTP id 98e67ed59e1d1-362e8d70725mr10652817a91.18.1777304223057;
        Mon, 27 Apr 2026 08:37:03 -0700 (PDT)
Received: from lgs.. ([2408:8418:1110:2369:e656:cc2d:236e:9079])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36146ae9cd8sm30014315a91.11.2026.04.27.08.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:37:02 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Alan Stern <stern@rowland.harvard.edu>,
	Felipe Balbi <balbi@kernel.org>,
	Peter Chen <peter.chen@nxp.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] usb: gadget: net2280: Fix double free in probe error path
Date: Mon, 27 Apr 2026 23:36:51 +0800
Message-ID: <20260427153651.337846-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 74AE4475895
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-36547-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com,kernel.org,iscas.ac.cn,rowland.harvard.edu,nxp.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

usb_initialize_gadget() installs gadget_release() as the release
callback for the embedded gadget device.  The struct net2280 instance is
therefore released through gadget_release() when the gadget device's last
reference is dropped.

The probe error path calls net2280_remove(), which tears down the
partially initialized device and drops the gadget reference with
usb_put_gadget().  Calling kfree(dev) afterwards can free the same object
again.

Drop the explicit kfree() and let the gadget device release callback
handle the final free.  This issue was found by a static analysis tool
I am developing.

Fixes: f770fbec4165 ("USB: UDC: net2280: Fix memory leaks")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Remove the unnecessary braces around the single-statement if block.
  - Correct the Fixes tag to f770fbec4165.

 drivers/usb/gadget/udc/net2280.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
index d02765bd49ce..7c5f30cfd24d 100644
--- a/drivers/usb/gadget/udc/net2280.c
+++ b/drivers/usb/gadget/udc/net2280.c
@@ -3790,10 +3790,8 @@ static int net2280_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	return 0;
 
 done:
-	if (dev) {
+	if (dev)
 		net2280_remove(pdev);
-		kfree(dev);
-	}
 	return retval;
 }
 
-- 
2.43.0


