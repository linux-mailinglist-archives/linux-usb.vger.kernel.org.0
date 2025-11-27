Return-Path: <linux-usb+bounces-31001-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8BEC8DEDA
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 12:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE1E93B0F5C
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 11:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F26E30103A;
	Thu, 27 Nov 2025 11:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kAxInnwr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295342DC782
	for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764242228; cv=none; b=K5TctVoVysEeKx1JQewgksgRc2nCtctljhaCAwgjXYrR5j+uHmP+hYyAOcinknRhBv4F92KKh7pTUf67VVTwedpccL3kyW76cJyD6vHojtv0tDn+zzxpqO9MH75xM0B8OFNQJ697wiZWnW0prDXfum9KoJ8K87c1ulUEmZUbHYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764242228; c=relaxed/simple;
	bh=5eIN9fmc1QGV8trA/A9yTegASUpqMC9vmn8r3paozxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m4juffkwACY//I6pseWXprF+7/+pb7L2+xoKV++fWSI4LqNtNpb6OhIOYXaFexZAJ6ils2UsluY62d5+m1h+Zb7zof+vTv7tl6FjNvl+Me9ID+5U1T2PWh0MjK//5CcB/CDMFpwczDKcTCIzxP/5Iw0MirJUy2UuHCq53YGqV0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kAxInnwr; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-640e9f5951aso2530836a12.1
        for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 03:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764242224; x=1764847024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJVJA3oiVaBETKowUaWc1AtovR4cPiTo2+ur0NTpWtI=;
        b=kAxInnwrzrbnyQi6iANFodU1cLRlU5o8Hq3LYIw2UD02KUadQxIHmHbfu9SHvYJ5fn
         pvMIciZFq9JAAf4z44q/8yZydFiTurBGfzZ/2N3Fi7BCGCyvGtoJdCm702lCQ1YHAdrT
         BqOpHtCPLnVj7E/FsE/XcelPL/Pv4mAQKTI98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764242224; x=1764847024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJVJA3oiVaBETKowUaWc1AtovR4cPiTo2+ur0NTpWtI=;
        b=iCLo2848eRJ/d4UsVQCprajVBZeHnIlxPrlRX+xL76MuVdYrrTSZtisfZdyN3e++R1
         K2feyWIG3S/RaaClnFApISEisTbsMGiDZ3o5uNmetDRtAoltffNENMBWuBFupTMu2ZN3
         WzqIESLbhkpRcXPvm8MTIk50m6+7QwKiCKv/ONO/w4rZGidUogDlQZmNjK2Kq1X2E5bz
         mCjNoK8FNsXBxES6KH5eYel7mmBb0RqBZ3QatkELsvycGR0gQFfWt+80elv6x+fJ5xjg
         cGVYJN2AgASSXAiqSWYjYHpeFQVh/palKhufW3WHokFfOe+3nfL/YlK3CimJ5UWZSJYa
         gQPQ==
X-Gm-Message-State: AOJu0YxIknDpDGDvRlt/IHqOYi+BTZBa76s+n4KdOQzyBB2q6DpktQJr
	IQM++ZndxSbYYDXUFndUxjT+B6BSzJ0xRupvLaYK0XHgBD11MVH4WqgXs+te3eYIUql5d8UCQcG
	iiJXm
X-Gm-Gg: ASbGncs6+MLK3IGSoQbDocFDgoaTI2BtaEtYEYtF14jy05ZPz9UF8ggFFuadIg9AHIy
	o6uaBEh6I7OQ5uxJSmVA8EjiMs0lGoxBICvtSxY7dgT5qAX3K0eXxGzW2Rz6pBJNWJzG2ThS5Gl
	i8EmChRtlQLUPJuYLtLbVKGiq+HTMQa/hNoZiv935/zfPp1wbIZ8GNRXMftxPkWTzI9BXONrSv2
	ertP1TEdo1ZymYkF5t3sksNWaIli1k1zlrCtQSw7wTztIc6zMVRplcG8PhhEXM8ESMxIQfnjf7k
	t5geAie5S62jcYLRFKcKqTTssws/Dm3k11nu++fssu6//kqQkUJLY8ZJiALvxslTmx8krA48jKw
	TYFLawwP4E+acbOK9DJfuc3QVoxWMOJeqT/vFap+Hdb3LRkMbm4KN6dGA4zKukrNHFxH9quIpSS
	oM09Y5qHg5E0T0lodQ8apgCu40Drx3usPJSMXtjq3LYeLhFtuJlRpmAmWNAFIut2I=
X-Google-Smtp-Source: AGHT+IE+huPMKVkx99Dz9smUQr+C4LOMabu9B98nf9uQG/iI4ndCFTmSTFC7MWlwCN2ZTQviKYWA0w==
X-Received: by 2002:a17:907:7246:b0:b3a:8070:e269 with SMTP id a640c23a62f3a-b766ef1d667mr2775997566b.14.1764242224446;
        Thu, 27 Nov 2025 03:17:04 -0800 (PST)
Received: from januszek.c.googlers.com.com (5.214.32.34.bc.googleusercontent.com. [34.32.214.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a48c7bsm131702266b.64.2025.11.27.03.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 03:17:04 -0800 (PST)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-usb@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] xhci: dbgtty: fix device unregister: fixup
Date: Thu, 27 Nov 2025 11:16:44 +0000
Message-ID: <20251127111644.3161386-1-ukaszb@google.com>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Łukasz Bartosik <ukaszb@chromium.org>

This fixup replaces tty_vhangup() call with call to
tty_port_tty_vhangup(). Both calls hangup tty device
synchronously however tty_port_tty_vhangup() increases
reference count during the hangup operation using
scoped_guard(tty_port_tty).

Cc: stable@vger.kernel.org
Fixes: 1f73b8b56cf3 ("xhci: dbgtty: fix device unregister")
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
Link: https://lore.kernel.org/stable/20251127101904.3097504-1-ukaszb%40google.com
---
Changes in V2:
- Added CC: stable@vger.kernel.org

---
 drivers/usb/host/xhci-dbgtty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 57cdda4e09c8..90282e51e23e 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -554,7 +554,7 @@ static void xhci_dbc_tty_unregister_device(struct xhci_dbc *dbc)
 	 * Hang up the TTY. This wakes up any blocked
 	 * writers and causes subsequent writes to fail.
 	 */
-	tty_vhangup(port->port.tty);
+	tty_port_tty_vhangup(&port->port);
 
 	tty_unregister_device(dbc_tty_driver, port->minor);
 	xhci_dbc_tty_exit_port(port);
-- 
2.52.0.487.g5c8c507ade-goog


