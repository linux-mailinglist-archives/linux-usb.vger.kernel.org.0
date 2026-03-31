Return-Path: <linux-usb+bounces-35723-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHVfAPOby2loJgYAu9opvQ
	(envelope-from <linux-usb+bounces-35723-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 12:03:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE1F36787C
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 12:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06DE2305F3CA
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 09:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178A33ED5CA;
	Tue, 31 Mar 2026 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HlYo5aOW"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4F53CEB95;
	Tue, 31 Mar 2026 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951134; cv=none; b=JTr8yE6MdE1KZM4KZfCw2RztTSVUFyKAm1dieyJo1ZHZ+13Jov0u59qwE6SGTIT7uQOukoYGjdmtVawbZ9BBpm7gu/GefziC6WNETBeRRiqTuwyWlF+OJK/h30+xUuw/RAypjqTl3bhJr553LMZW+LWS9cgF13YdpQml0HgX3jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951134; c=relaxed/simple;
	bh=0NawNje/+pvf6Q6m+KPbRXlZmC4DkAHWvaROaCKr6co=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IpVw6yzTfdEx87jmMZm82M4Fz+zF9yNsUlUuw9pfbJkDdkqXg4G3o0nlNnlkkik5Kk+tLELZTlfMTnWEqkK6ZJmcDCYwvtv+gqLhREB7OrgT/FHZaJ09jfkJHQBhuzGzWnbOoxZ4TwvMxKj8Bg8z3udX1H0GUivd4U8T7DWTVF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HlYo5aOW; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=kr
	ZVscrKa/upqABA+IvbisLz9PdxJNYlhS+Lp6nvk6w=; b=HlYo5aOWC+LQZUtC82
	upBNbB+QEoQlrm8sl0vsIg9CrORpU0BiIV8QzDdwM7FA/Vkw2/VH3H7An6hFRvC/
	U97CXGbryfB5KHgJ0PcqenABydoMIM4bG13MPgA4KUMuoWgu+NhihMx/LE6Touyx
	0t7D+q/fFxskbO3MHK9jj4YiY=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCHZZLImstp55AwBg--.30556S2;
	Tue, 31 Mar 2026 17:58:36 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: skhan@linuxfoundation.org
Cc: gregkh@linuxfoundation.org,
	i@zenithal.me,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	min_halo@163.com,
	valentina.manea.m@gmail.com,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH v3] usbip: tools: add hint when no exported devices are found
Date: Tue, 31 Mar 2026 17:58:30 +0800
Message-Id: <20260331095830.124543-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3ff00e2e-1c45-45be-a65c-16da9b2ae5a5@linuxfoundation.org>
References: <3ff00e2e-1c45-45be-a65c-16da9b2ae5a5@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgCHZZLImstp55AwBg--.30556S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar1rKFW8Xr47Xr17CF13CFg_yoW8WFy8pF
	WUJFWrKrW5AFnxua10yF48WFy0gws8t3y0gr1xGw1UuFnIyasIvr9ay3ZYka4rJr45Ja4I
	vFWDt3y7CFyUW3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pELvtJUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC8wwn0mnLmszxswAA38
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zenithal.me,vger.kernel.org,163.com,gmail.com,kylinos.cn];
	TAGGED_FROM(0.00)[bounces-35723-lists,linux-usb=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kylinos.cn:email]
X-Rspamd-Queue-Id: 2BE1F36787C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

When refresh_exported_devices() finds no devices, it's helpful to
inform users about potential causes. This could be due to:

1. The usbip driver module is not loaded.
2. No devices have been exported yet.

Add an informational message to guide users when ndevs == 0.

Message visibility by scenario:
- usbipd (console mode): Show on console/serial, this allows instant
  visibility for debugging.
- usbipd -D (daemon mode): Message logged to syslog, can keep logs for
  later traceability in production. Also can use "journalctl -f" to
  trace on console.

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
Changes in v3:
- Just add an informational message when no devices are found.
Changes in v2:
- Use system calls directly instead of checking sysfs dir.

 tools/usb/usbip/libsrc/usbip_host_common.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
index ca78aa368476..cd92baee310c 100644
--- a/tools/usb/usbip/libsrc/usbip_host_common.c
+++ b/tools/usb/usbip/libsrc/usbip_host_common.c
@@ -149,6 +149,13 @@ static int refresh_exported_devices(struct usbip_host_driver *hdriver)
 		}
 	}
 
+	if (hdriver->ndevs == 0) {
+		if (!strcmp(hdriver->udev_subsystem, "usb"))
+			info("Please check if %s driver is loaded or export devices.",USBIP_HOST_DRV_NAME);
+		else
+			info("Please check if %s driver is loaded or export devices.",USBIP_DEVICE_DRV_NAME);
+	}
+
 	return 0;
 }
 
-- 
2.34.1


