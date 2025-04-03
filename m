Return-Path: <linux-usb+bounces-22497-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4943FA79CFC
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 09:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F238172CE7
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 07:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607F82405F8;
	Thu,  3 Apr 2025 07:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yR2OhGUJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A85319E97C
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665385; cv=none; b=WfR0Mtnoz+/m3rhT2JfH7n9ZcEJiTL7Y1pxmb2K63Y6rSNz7/9Dv3MI3coC2UPaBRcHm7RBIYSP7kxBaFH6LnW2kX5JVeX/hx/hRWQTLsRDddX1yVkKqSBDgCpDkWHG9wWmKQUueUdl2wWDznw+P8hC3f86YIS+roVD03WOrkxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665385; c=relaxed/simple;
	bh=gPgYbaL+rhOQ9fSKgtZrjLnPUZeu+nsmZ0Ecrf1wPtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P9aYPhwwESo3Rip64qihbJFja2ufSCdFiXhxNrLRowKTzgefeMwMoQzWVRfXGhdGLpcC3FycPHLJJVb69dTNlOZ0Nk9iS9qwpfC+iXCUzya5tZdHLfQuN7J4+gIbCzYa0+t2nn/FQyQgk3tye4DO2XE7a/P+cQVQlrIZf+p/E5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yR2OhGUJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe574976so2971765e9.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Apr 2025 00:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743665381; x=1744270181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0sRQ76srbv8D7/R1qXBY2wavN01HHK5lciers8r4d0E=;
        b=yR2OhGUJYwZFUmtlVjT9dsuo9Dew3HYopvtcmgCSNpg0GJWPVHbYYwFPVnBp2RRcgv
         Z0Z0b3MEGUfmG8Jl4815BdKWCH3SxBhFrWMvTpcJg01+J5N/RgHaDLM0lD/0iCTwa4oz
         3YMz5XzCf+j4EQcOKCBgfXwmm1Aryy6tbB7n00PnfzixRH1NTORGTgH2d2WLvGXlxiGp
         itlXNHJBRTcYq4Gh4A8uOkJ2Y3TngFgdFIdOjbTAcvjEai4jrnlaFSVSbhzCSqjWkw5h
         JPe6jG5NSWyEik44YDL6FQnxESHfsvqPTFcNp0Qs8a8ra2idyBCTHVoOCD5a1w6vkfin
         H7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743665381; x=1744270181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sRQ76srbv8D7/R1qXBY2wavN01HHK5lciers8r4d0E=;
        b=QpUUudSXxQPUJc5NfGLjngLKrDveLBD/4NMfzksfdlH9fN1Yo6KdWemRWNRDC/S+EY
         2ew7lbRAHC0G8ElPnr6it6jkZ/Mqhaxs5OecakryHyplK/bB3yDJCmeJmYSuH+ZqTQWC
         zMlumUgGAMYS4gY0hehZIwmqJm8/LtGW+8HDTNFRz+mw+iLtVjcLbGvfZAf0BYyzeMIf
         65jfANtBPZQRVRPYIid+C0TMCe2D0y38VqQoyu+VbAlYw1i91KtYe2OVt3UqpMbZVWuN
         +hUSeOsOypK74KVCQzKQw1lhMwCpVpsiJB9H3jyrR6ClDcdpa5PcoG7GcAYvpdGPwMnK
         2Tjg==
X-Gm-Message-State: AOJu0YzcYHjP9S8/rGywqYd3jZt72AhWqmKVhgwkgrm0BGbc2Eb3fW2n
	ie+84b5Jra1yVcabVEx3jZiHjBUI4Q1Ni98Oy9aCkG6V6NSV2f6Roc1p6JqPErArLrwAJtfq/sB
	9K9s=
X-Gm-Gg: ASbGnct3GqjgVNuJIVYQ92v1OV9qldxHq/XhZ/JsdMlvfKRInhyaSV9wiTMiRfdl+Gz
	CCdpTYaZUis65RXSW+Wv65MADK3HoYMQui5oew9awF6l9asiiB/VROVmDxH1OS/nnWf6pG/eFBU
	wR9yIqbKy7OlI8DkXURpTDx/3OOKwLQvwJuvhzOiy3moCeznUyB8PmKTRavP56mmMQCQfJTFXdz
	JEBo1RI9NzqoktoBuKQKN9vptffKKEwHZ/pu8LGRKEuvLvm+TpoVvMo3MnjDwlsf7BIBIWW1lEP
	JA4freU9iS2aDlVhS7V0Cf4GpMPfRcWigcCQYA3UdEKQIGsIkHtjsyurSubH1A==
X-Google-Smtp-Source: AGHT+IEK0NpzRIdpqLlvwUQOGPVY8za1RLz3sOqZ86LJdKiJXmK3wLJ1S9B5P6HVxD40Xla2VSb1kg==
X-Received: by 2002:a05:600c:4586:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-43ec42b9616mr7733425e9.19.1743665380662;
        Thu, 03 Apr 2025 00:29:40 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:355:6b90:e24f:43ff:fee6:750f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1794e94sm13460735e9.31.2025.04.03.00.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:29:39 -0700 (PDT)
From: Frode Isaksen <fisaksen@baylibre.com>
To: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	krishna.kurapati@oss.qualcomm.com,
	Frode Isaksen <frode@meta.com>,
	stable@vger.kernel.org
Subject: [PATCH v5] usb: dwc3: gadget: check that event count does not exceed event buffer length
Date: Thu,  3 Apr 2025 09:28:03 +0200
Message-ID: <20250403072907.448524-1-fisaksen@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frode Isaksen <frode@meta.com>

The event count is read from register DWC3_GEVNTCOUNT.
There is a check for the count being zero, but not for exceeding the
event buffer length.
Check that event count does not exceed event buffer length,
avoiding an out-of-bounds access when memcpy'ing the event.
Crash log:
Unable to handle kernel paging request at virtual address ffffffc0129be000
pc : __memcpy+0x114/0x180
lr : dwc3_check_event_buf+0xec/0x348
x3 : 0000000000000030 x2 : 000000000000dfc4
x1 : ffffffc0129be000 x0 : ffffff87aad60080
Call trace:
__memcpy+0x114/0x180
dwc3_interrupt+0x24/0x34

Signed-off-by: Frode Isaksen <frode@meta.com>
Fixes: 72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver")
Cc: stable@vger.kernel.org
---
v1 -> v2: Added Fixes and Cc tag.
v2 -> v3: Added error log
v3 -> v4: Rate limit error log
v4 -> v5: Changed Fixes tag

 drivers/usb/dwc3/gadget.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 89a4dc8ebf94..b75b4c5ca7fc 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4564,6 +4564,12 @@ static irqreturn_t dwc3_check_event_buf(struct dwc3_event_buffer *evt)
 	if (!count)
 		return IRQ_NONE;
 
+	if (count > evt->length) {
+		dev_err_ratelimited(dwc->dev, "invalid count(%u) > evt->length(%u)\n",
+			count, evt->length);
+		return IRQ_NONE;
+	}
+
 	evt->count = count;
 	evt->flags |= DWC3_EVENT_PENDING;
 
-- 
2.49.0


