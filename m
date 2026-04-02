Return-Path: <linux-usb+bounces-35847-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCt0Ox8rzmnIlQYAu9opvQ
	(envelope-from <linux-usb+bounces-35847-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 10:38:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D5C386268
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 10:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99EBE304261F
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 08:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADAE27EFF7;
	Thu,  2 Apr 2026 08:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oCwcJAg7"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48561A2392;
	Thu,  2 Apr 2026 08:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775118750; cv=none; b=HVVtoFv3EnD+yOATaPk5v/QruY8/1gxo9zztSoxNSEbABcX7N9WO/x47ld/eAUj4S+Q1jTVwjhINL2zYorulevH/NLfFCXLnjolfrQDR6aUwuBRdsCKS77Lklhu/eXQ4MI/JR+GkTp461v32faXjaZ8j50rA175B9mOJkk07LOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775118750; c=relaxed/simple;
	bh=fOJfz8QaRTCWY3SH78d+BvA+X4yyBlHXy2JJ/+vuHdw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t5FeKj7o1t0Bc4iFTYDwf+elYQOrIlD7Yxo8GKyd+av/PFaaoRYc2IshggsPCDTIDcRstpdlFhXCYUW/zhNL5YgM0ylY8BOTnMWY0pRkqw2frDVV4UZxFLavn6jNj9kCSQb12OBMLCwgAzWW9SQJrUTyoLng81U/p26TL5ouzlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oCwcJAg7; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=us
	F5A5XHu71jCxuS8pXh3vH3U6H9eKPHBRdR5KQCpOw=; b=oCwcJAg7rydyEZUlf7
	jH6G2V3mYs2en5OYQX7VZ6BGGDMjmTZ8URauEeC2wK5Lbb9SKoRNOxxXO2NUazzA
	q9ExqEMXqQrDtY9rP4Nl2yWAs3jyuVwLLavXc37344QB1gNPqzAhU+deFsZ+YYYQ
	pUjGdMoWddLgUppl+HD7jzMi4=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3_WyGKc5p00YACw--.10390S2;
	Thu, 02 Apr 2026 16:32:07 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: skhan@linuxfoundation.org
Cc: gregkh@linuxfoundation.org,
	i@zenithal.me,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	valentina.manea.m@gmail.com,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH v4] usbip: tools: add hint when no exported devices are found
Date: Thu,  2 Apr 2026 16:32:04 +0800
Message-Id: <20260402083204.53179-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <8d7000a9-981c-468a-bd4b-60111e0b77e9@linuxfoundation.org>
References: <8d7000a9-981c-468a-bd4b-60111e0b77e9@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_WyGKc5p00YACw--.10390S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw17Xw13JFy7GFyxWrW5Awb_yoW5ZFy8pF
	WUJFW0krWUXFsxXw4qvF4xAFW0ganxX3y0gr1fJw15WrsFya4ag3sxtFnYkay7Ga1UXasF
	9Fsrt3yDGa4UXw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joBT5UUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC0Qh6JmnOKYjKUwAA3a
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zenithal.me,vger.kernel.org,gmail.com,kylinos.cn];
	TAGGED_FROM(0.00)[bounces-35847-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[min_halo@163.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kylinos.cn:email]
X-Rspamd-Queue-Id: 65D5C386268
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

When refresh_exported_devices() finds no devices, it's helpful to
inform users about potential causes. This could be due to:

1. The usbip driver module is not loaded.
2. No devices have been exported yet.

Add an informational message to guide users when ndevs == 0.

Also update the condition in usbip_host_driver_open() and
usbip_device_driver_open() to check both ret and ndevs == 0,
and change err() to info().

Message visibility by scenario:
- usbipd (console mode): Show on console/serial, this allows instant
  visibility for debugging.
- usbipd -D (daemon mode): Message logged to syslog, can keep logs for
  later traceability in production. Also can use "journalctl -f" to
  trace on console.

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
Changes in v4:
- Printing behavior adjusted as suggested.
Changes in v3:
- Just add an informational message when no devices are found.
Changes in v2:
- Use system calls directly instead of checking sysfs dir.

 tools/usb/usbip/libsrc/usbip_device_driver.c | 6 +++---
 tools/usb/usbip/libsrc/usbip_host_common.c   | 3 +++
 tools/usb/usbip/libsrc/usbip_host_driver.c   | 7 ++++---
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
index 927a151fa9aa..1dfbb76ab26c 100644
--- a/tools/usb/usbip/libsrc/usbip_device_driver.c
+++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
@@ -137,9 +137,9 @@ static int usbip_device_driver_open(struct usbip_host_driver *hdriver)
 	INIT_LIST_HEAD(&hdriver->edev_list);
 
 	ret = usbip_generic_driver_open(hdriver);
-	if (ret)
-		err("please load " USBIP_CORE_MOD_NAME ".ko and "
-		    USBIP_DEVICE_DRV_NAME ".ko!");
+	if (ret || hdriver->ndevs == 0)
+		info("please load " USBIP_CORE_MOD_NAME ".ko and "
+		     USBIP_DEVICE_DRV_NAME ".ko");
 
 	return ret;
 }
diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
index ca78aa368476..01599cb2fa7b 100644
--- a/tools/usb/usbip/libsrc/usbip_host_common.c
+++ b/tools/usb/usbip/libsrc/usbip_host_common.c
@@ -149,6 +149,9 @@ static int refresh_exported_devices(struct usbip_host_driver *hdriver)
 		}
 	}
 
+	if (hdriver->ndevs == 0)
+		info("Please load appropriate modules or export devices.");
+
 	return 0;
 }
 
diff --git a/tools/usb/usbip/libsrc/usbip_host_driver.c b/tools/usb/usbip/libsrc/usbip_host_driver.c
index 573e73ec36bd..bd8a6b84de0e 100644
--- a/tools/usb/usbip/libsrc/usbip_host_driver.c
+++ b/tools/usb/usbip/libsrc/usbip_host_driver.c
@@ -32,9 +32,10 @@ static int usbip_host_driver_open(struct usbip_host_driver *hdriver)
 	INIT_LIST_HEAD(&hdriver->edev_list);
 
 	ret = usbip_generic_driver_open(hdriver);
-	if (ret)
-		err("please load " USBIP_CORE_MOD_NAME ".ko and "
-		    USBIP_HOST_DRV_NAME ".ko!");
+	if (ret || hdriver->ndevs == 0)
+		info("please load " USBIP_CORE_MOD_NAME ".ko and "
+		     USBIP_HOST_DRV_NAME ".ko");
+
 	return ret;
 }
 
-- 
2.43.0


