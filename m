Return-Path: <linux-usb+bounces-33183-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNCdAjR4iWne9gQAu9opvQ
	(envelope-from <linux-usb+bounces-33183-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 07:01:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C08D10BEDC
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 07:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 452CC3009140
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 06:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4462D780A;
	Mon,  9 Feb 2026 06:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="AfuOD17Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F5225D53B
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 06:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770616877; cv=none; b=lFVivAwH7hBnnSNMNenMGcVQ+G4fffPLL1ePVosHSG4uzxXTnarzOqgC+ZkXbujHy4vXqZL4pPR92yen1AG3nXvI4HT7muFKcLmyYlU4dyAuQOVsvbq+AugfDCtSCCcfcYas97BWtQWeD1NXBOEumqi8DEsHwHRoD4Kx6QgFqp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770616877; c=relaxed/simple;
	bh=aJVXTQ4LY0IO1aalWkLVsdJepRGTZS7ylFoEV9fnajY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GurA0X6+MaoQRzytCMKuVcCPfDxQnoO9yzJcVtu5NRdi7Q6IUUz/zx5yWUWjJkuGUWM/QRRPfKQvqcIkf4sAbjBAGTt+5s3oR45tF9iPipC2S9veimKnERpB2ozfzplveH2hR6GnLUJuIVO9MSBeZgV6MyI0wsNVRiIb5FaONSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=AfuOD17Y; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-89505dd3e24so50979316d6.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 22:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770616876; x=1771221676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K2L0ut82NrQYDTfHRkdswzBih5D3osXVkQWNViM8MLk=;
        b=AfuOD17YPrsCNu9+Fusdn/rJxLfRg9V/ODZGJAtA8q3mkgzIrGKT3B+OIsQSyJfjE8
         2lyQslGRkW57HQlBReQ1JeDjMdsHkbj5YKdL/GbnztPX5z+RqfYfZ9lmP19VKU2+0jio
         kIMgcnH3iYdsM6WMWJwI7cGB1i+8Fe7E/rgpn14H42nWQdsXDuoRFhTIqSrJEUT0mWfI
         uxz3miwlHF3FyeL3e6gtUTjNHbc02q9p4QAMPNuoXEih6C3G8mjbSO5761YFP6/BeXGC
         PseXFIDgP3Y4CVpjLD7w7Drh08ABtu1esu4VQOU0qJJ48lMu6XzcYkqY+Gvm8XfMrrUL
         tYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770616876; x=1771221676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2L0ut82NrQYDTfHRkdswzBih5D3osXVkQWNViM8MLk=;
        b=ZGXN5KaXMaGX/dWJa9IuWA9JLi1zsXS2hst72RJ6ykccJ61rQg2RcbWG9kdO9RiKX3
         YaxtipjZiDDvmC0hnI7FrBx6K3rzFTYy4tWFXb6cRYbNoGUPFCeUaLC8fG71meaHHhXw
         f1txEUv60PC65nmOYWu8hFpoBRY3Unp9RSMFotFOCbgFYfNpXKrXVpEF26F8haqdL4E8
         4jBhCbxjV8IC8wkuSCl4curPrj+tQ3Isxk+eR5H99TupXJv9WsrRAAj/Ow0CkOhxWc2l
         9fc2803Py73XjTRBRmPEL08ODnoeQRFMwIlapgrR9TRmPZVey+WW/z37MeeVYflCWv3X
         q1xg==
X-Gm-Message-State: AOJu0YxDudWlZb5h2dt5CWp+AgNBryWAuyPi5WPxOqmQmD/WpTkjcSap
	Y7akGjF5U3oirUMx4DhD7FXQvjWhhAiYzTgkyR205uOZVHdKKhodWA8cEabowFQ/F7AM2Jd+pHd
	i+oWR
X-Gm-Gg: AZuq6aLAcrOkQ7PbVA5WMlY4AVS+Jr0cWifJbX67Aa6AIpaYL1CNj4+j7fdCDhA1vC7
	q8kWTDgz0MI1v4osMkH4TX6Nyzpqzk0MOQbM3JAG677Tb6yS1/bGA3RLtZTy4sK0TFZ2BE2QAyG
	O9Vri2MbN7czuxDYq5Sm37vKATHBwhvGFk6sboy6agYNQ+zCemD8EcwAjT1msPFuhWqViR+yWK5
	z+f+l9sJPxpdevQ7TLrh8JfvTReM8/SXUpprMKwqRkgr+9gHmNEALcJulePom12oc09dSn1Uz4U
	nBZjZIbVCo55SeCmaVkQrfn71RU1ZKyVCk/vMg8sRGvvVvcSafV1oh1l+LIH7Mp/BG48rcSha3t
	Q4YXhOks8yvvg+fWNMnGahinwq6za9R6W7M/v4Rbgta2WSaMmjDUU8LYlUSlC8RF3UepIWMR3Cf
	fyADS7GtJShlXKGPBOlvKyenbaDJlJu8xFaePfIlHhYYjjHMZylLY6Qlo97bZhn227OAQmbm5oT
	MrqN5XKdG40rdSgpl6s3lSN1TSI6Zg=
X-Received: by 2002:ac8:7f41:0:b0:4f1:cd72:f22b with SMTP id d75a77b69052e-506399ba43cmr153657071cf.52.1770616876621;
        Sun, 08 Feb 2026 22:01:16 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89546b09f77sm55007256d6.31.2026.02.08.22.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 22:01:16 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] usb: image: mdc800: kill download URB on timeout
Date: Mon,  9 Feb 2026 06:01:13 +0000
Message-Id: <20260209060113.1731338-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33183-lists,linux-usb=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,u.northwestern.edu:mid]
X-Rspamd-Queue-Id: 6C08D10BEDC
X-Rspamd-Action: no action

mdc800_device_read() submits download_urb and waits for completion.
If the timeout fires and the device has not responded, the function
returns without killing the URB, leaving it active.

A subsequent read() resubmits the same URB while it is still
in-flight, triggering the WARN in usb_submit_urb():

  "URB submitted while active"

Add usb_kill_urb() on the download timeout error path, mirroring
how the write path in the same driver already handles its URB
timeout (line 863).

Similar to
- commit 372c93131998 ("USB: yurex: fix control-URB timeout handling")
- commit b98d5000c505 ("media: rc: iguanair: handle timeouts")

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/usb/image/mdc800.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/image/mdc800.c b/drivers/usb/image/mdc800.c
index 7b7e1554ea20..c4df637b2a03 100644
--- a/drivers/usb/image/mdc800.c
+++ b/drivers/usb/image/mdc800.c
@@ -736,6 +736,7 @@ static ssize_t mdc800_device_read (struct file *file, char __user *buf, size_t l
 				mdc800->downloaded = 0;
 				if (mdc800->download_urb->status != 0)
 				{
+					usb_kill_urb(mdc800->download_urb);
 					dev_err(&mdc800->dev->dev,
 						"request download-bytes fails "
 						"(status=%i)\n",
-- 
2.34.1


