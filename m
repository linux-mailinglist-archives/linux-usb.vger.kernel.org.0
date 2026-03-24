Return-Path: <linux-usb+bounces-35378-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBo+IGZowmmecAQAu9opvQ
	(envelope-from <linux-usb+bounces-35378-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 11:33:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 396333067AE
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 11:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4497430254D4
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 10:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDC93DFC90;
	Tue, 24 Mar 2026 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nonF8wNc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8798B3E2746
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 10:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348157; cv=none; b=Hjxvp0PuYDq84m//WtmFYinNUBNOXqPrKdd5V/rPak6XOGHnsIlw+LtvLQ9MCd3MchSh+0tmnHxDu1Yl5kz565bb6SkWu9wqZBXliPRhphjr4jaF7HgTaMJ4pyTZmlv1MNO1KlOYjY1Qy9mQoNe/1xMlI2PP7OQxB60Q3Z3aEIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348157; c=relaxed/simple;
	bh=i5EI1moGymL06UGxUyHFrUJcTR0LqBMbRoOOYGvAgAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M7hn9COOXTHzvG56QC0911SqNi4PPpVzlV98PKZQF70e8R2V/vBtowydvOQJkpiVIYtPZYGqJsXKq9JMZOoNdxFSwNbvtCDEbjWqAT5qP6h+BimwKhkXGBBoyxbwR+UdyteHhbj3vfv0j1B2vah0IhePVaJ9JqHSMTpBgiZFtRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nonF8wNc; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-667f8794e97so8781950a12.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 03:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774348151; x=1774952951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aRMqYkzH2ATFPczINkjP7Gb8RPcC4sgJ7rhsMNlJdGU=;
        b=nonF8wNcSzbhAdrGjDSpHWvz90fBdE4A61pfCFXNzNqK8IupaWr9JpfdpNONNI7H70
         ked3K6QM+m+7sih8kf1eusyqFEHsd+/EnuHW8udR+GL205/zQMsljxa9Iu2uQtPXRWdo
         DRqdj3B2LcyVtlsWQ7iuTbN1hiiLP4wMenCMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774348151; x=1774952951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRMqYkzH2ATFPczINkjP7Gb8RPcC4sgJ7rhsMNlJdGU=;
        b=arv+8ofYZzxq0zMEFuZIbitopZ+GKkfG1n/kpZD0AiA8g2744dhLbddTa9gQP9voKu
         XOZXiTZC8sTIVGiEcu4wLRqKmdUdJtkxD8HL48oKZLFbiko9HxyKVjp+p9JXpCUJNTiv
         YisrTocSgaKB7Ek7iKfjU6CtHau3Jd73wFWhWFsSHIiAkv5YEMhH4AGfruv8sfFrP0Dl
         0oR50AfdgzIlAWTnFNONy5yyHablVfHlL64BALczOiCLLhp0djatGPH+5MPkXXu6yx13
         XC8289KWVJybilJ6tVVu1YvaeL+UuZUXW6B6vFerR0xjcwef/tpei2ci2LJR6JUtF/96
         3Z5Q==
X-Forwarded-Encrypted: i=1; AJvYcCURdQumLlt9BjuRDWEqBlTlW/mV2tKHVs6MSPbWLVCyP1wTlQlgR6DXc9GTGtqapFp3MzrCmlzonfY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7oM8eiph3962OEKJbpObIw0bHz0lEKI90V4zuliIIW5N026BM
	pblMkmsyDOSQLaYsIWvv9A3mS03xwh3SZttNAo1RgucpyJgaC8MyeO2vz8pPYwLxXA==
X-Gm-Gg: ATEYQzzWw+KkJ4dNBzc6hKcg0VXtv6WSKXvawQgF7wA8arI0ifRv8lIKlVR0V+49xGq
	/Qlt2AVSL7RORe4o6PEPvtCYBoJQkY99wZ96w5cBw+0R0771stW5VZabBT/JANZJZdXXJve+buj
	TIWEOiC1tEIPihl3sHJo+1WtBzLo6VYwq6RhTsilOtEpVNZzQcw6PSfi6VX6cPyiTuiq/tkcdz+
	uQqFBZrffgDDx6jUIYOfwHNMEMDUj39G5C2VYlyoBnp7ncVu8HOmgbFOr1BMJhgXgkiFEiSb6Iq
	Obdcaovtg7IYrBoQu3RNeBiiJ7ki30ldnSHZiEbUtI+sx9BexhlCRMTQluBwnixc/qxtbrvAMbM
	X3RG176Lglo3YWojDXf1nMjSvaC8PqGoyUMT4JINFtDXF4VKKe3zxVSb7mFVWHtZnCsI8z0hk1D
	7UoUolR1kaorDB0NDa2WFmE4Vk3tBK5oUHvQH/X26zaHrG/ezhS4ha+9792tnTnmuTUJ9MJlyde
	c4HtX0xh66+a6X6OBkOIgrpkhcF6dpdMw==
X-Received: by 2002:a17:907:60d6:b0:b98:4a7a:d5f8 with SMTP id a640c23a62f3a-b984a7ae58cmr861028866b.46.1774348151375;
        Tue, 24 Mar 2026 03:29:11 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43a65sm613162366b.7.2026.03.24.03.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 03:29:10 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	stable@vger.kernel.org,
	Madhu M <madhu.m@intel.corp-partner.google.com>
Subject: [PATCH v2] usb: typec: Remove alt->adev.dev.class assignment
Date: Tue, 24 Mar 2026 10:29:03 +0000
Message-ID: <20260324102903.1416210-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35378-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akuchynski@chromium.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,chromium.org:mid]
X-Rspamd-Queue-Id: 396333067AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The typec plug alternate mode is already registered as part of the bus.
When both class and bus are set for a device, device_add() attempts to
create the "subsystem" symlink in the device's sysfs directory twice, once
for the bus and once for the class.
This results in a duplicate filename error during registration,
causing the alternate mode registration to fail with warnings:

cannot create duplicate filename '/devices/pci0000:00/0000:00:1f.0/
  PNP0C09:00/GOOG0004:00/cros-ec-dev.1.auto/cros_ec_ucsi.3.auto/typec/
  port1/port1-cable/port1-plug0/port1-plug0.0/subsystem'
typec port0-plug0: failed to register alternate mode (-17)
cros_ec_ucsi.3.auto: failed to registers svid 0x8087 mode 1

Cc: stable@vger.kernel.org
Fixes: 67ab45426215 ("usb: typec: Set the bus also for the port and plug altmodes")
Tested-by: Madhu M <madhu.m@intel.corp-partner.google.com>
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
Changes in V2:
- Marked as a Fix

 drivers/usb/typec/class.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 8314309094719..0977581ad1b6e 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -686,10 +686,6 @@ typec_register_altmode(struct device *parent,
 
 	alt->adev.dev.bus = &typec_bus;
 
-	/* Plug alt modes need a class to generate udev events. */
-	if (is_typec_plug(parent))
-		alt->adev.dev.class = &typec_class;
-
 	ret = device_register(&alt->adev.dev);
 	if (ret) {
 		dev_err(parent, "failed to register alternate mode (%d)\n",
-- 
2.53.0.983.g0bb29b3bc5-goog


