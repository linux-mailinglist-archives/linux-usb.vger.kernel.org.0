Return-Path: <linux-usb+bounces-37725-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAyOH5SUDGp1jAUAu9opvQ
	(envelope-from <linux-usb+bounces-37725-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:49:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB25D5829E6
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCB003017BD7
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 16:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28F04921B0;
	Tue, 19 May 2026 16:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6/cFMes"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DC63AFD1A
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779209361; cv=none; b=IgqzccrLeDEKOQqfbjHCdLfHR1wshvYQFfmnX6ADrPhgtRGgnkaRtR5b9O3fbgb4B8AjouB11FbUsNahWFWKbwpur4M209Mm1Bl/ZVb9b0Ipxa9aCWuvdV828x+I2hLiXav8dJQ6V5hvBU065vN1eXAuxusJJmOJxEAKhNSKm/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779209361; c=relaxed/simple;
	bh=BqWmqbIymMlfVNWbvmSljObTXD5GdoQeWqXu6DOgk9I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=TqCrX6ThDuXJBSnYPpAm71Ne4JOHU4Gz0WcWXElywweCP4CNdv5vXvgGWuiUi6HDxII6wO3pq5GER31fIA/HzAO5Y6+xHVnYinAyaBJEZLelDyf52EnX1ToLCzDz92LbDy7ylCGyWqiWAjIeiFFTatuLe7Q8CMN4KiOFDuUm2so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6/cFMes; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-448528f4e69so2622265f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 09:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779209358; x=1779814158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=T/0bai3Xdf7UWDukLtuJ1LrZKkul+G+jvkhV2iLmMDk=;
        b=X6/cFMes73XCMWCB1EcUNHPMqbDWl6+ouL/D0pKvZn3MEbPYf/GEw6EK5DjKQN1etK
         EBsfCHveGoUnEQz1FC2T9iHWoFM6vqYHrbAUC63EVYltNlcP10X/aiGg6BxyfDMRJWa1
         pm+2Rf6fW5LZ/nVslXiQHSjfV1B0DQtZSlyccf72do38TrJIScfTNLYdcPOMjqw+fPoE
         XgxD4ELiAwgH8BSyaGJpGB5ZCjRVdozaOpurKZ0Pv6CmGZWmfeGKCwTlLlD+s8fLbevj
         9mLeWptTCcWQxUo82fJfNzEycAfXWu8lmI/tBNAVfKjIRungWp5Nam+dYvAGeXCOEgNZ
         mGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779209358; x=1779814158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/0bai3Xdf7UWDukLtuJ1LrZKkul+G+jvkhV2iLmMDk=;
        b=nKSeSJlqm/ZbZHWaT71o63St7e7zE0MfwC2A4A85SeKeymOS36XbCZpozKg2NVqYQD
         JZwxYhtnlYcluqEqgU36ekoR3F3nnhYGtuizNxfyEDyNtV9Qc3a+XaWYs/FwKzCCuXPx
         fVne6ra16Gx9C5zWH9CEAvHRvuUrP8dzTE4r1GEbJTwf2KnDslYNx+GQcwBkB88FjXf6
         V6KA2yKnNsf83FK7cX0sODvYxIBCU1Fi/6GLxrb1AHDoPpWgLS0VHwlyYVJPHItN1SyF
         e+OcSQ4il3c2UBuNDU4SU1esyiiH9YcdPdeMxALfl+Z3JeemzCZxSQVAm9t3kgkidp9E
         aYJw==
X-Forwarded-Encrypted: i=1; AFNElJ/af493vwNT608r36vjFcZf52TVI7haqzzx8wlspboXfAQl/y6cxs3nVtnLu3f13xz314HCqMPnrs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKZ8s9KwMxPgutrl+YnXEFap4T4BRfwo9hS0sp4L1vZznZs7sz
	BXWiA968hFOp57jr0Tm+fudVx63GXv6Fhw+501EJdaSAPXjIUzw0ZQMd
X-Gm-Gg: Acq92OFUNNkhnVLekcZ3XUhTqrfKDSlVT2AyVYBPnCYnUl0fS6mA9je7dU8rdx7UpjP
	SB0ZtmFZw0AUUz5yaAPXH1rdY3naIcbZQbAIFDfDmyy9Zzp3WFO/aV7wArxjX6srkFXWe1EMZMx
	WihCoqan6BSjx9OPTHfpMsVXYBhyqUrrjx7m1ikm3FvpKtr/jqiQzf+cyNBo6Q1JoVvyGg0oe/u
	dVgv6eKn4E+uQyFFwHzrqEyiuplBFjM7Kx/r6hzJ3wh4hWqTjPamsznhVq2babtoa3Y5WByZ8h9
	LZ2vppEa27G+KPJ4iZ0fyJ5JAfVvMDRf58Z9eSqLZB8kJ72y0qJNKIf4GReyLHD6iKJq1OQnYp1
	6jwc4x0VGgUQVoP2eIQ6kMoX4t06cmciYIWtKVEgEFqFbMUBiQIcqxZqk1tLMEHvYHq04OtRksX
	YDQcG3+8Y7ihygqcRVYhOsYgZ7lEXZt+U5qCSU3WHiXMDDWjGnyYHB/2Kz8tqslrh3BOZ+afE=
X-Received: by 2002:a05:600c:a309:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-48fe61f2bedmr254642435e9.19.1779209358095;
        Tue, 19 May 2026 09:49:18 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48febe7543asm111906895e9.28.2026.05.19.09.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:49:17 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: host: add ARCH_AIROHA in XHCI MTK dependency
Date: Tue, 19 May 2026 18:49:02 +0200
Message-ID: <20260519164903.31258-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37725-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,bp.renesas.com,gmail.com,mleia.com,oss.qualcomm.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ansuelsmth@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EB25D5829E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Airoha SoC use the same register map and logic of the Mediatek xHCI
driver, hence add it to the dependency list to permit compilation also
on this ARCH.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/usb/host/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 0a277a07cf70..62d9f3ccc645 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -71,7 +71,7 @@ config USB_XHCI_HISTB
 config USB_XHCI_MTK
 	tristate "xHCI support for MediaTek SoCs"
 	select MFD_SYSCON
-	depends on (MIPS && SOC_MT7621) || ARCH_MEDIATEK || COMPILE_TEST
+	depends on (MIPS && SOC_MT7621) || ARCH_MEDIATEK || ARCH_AIROHA || COMPILE_TEST
 	help
 	  Say 'Y' to enable the support for the xHCI host controller
 	  found in MediaTek SoCs.
-- 
2.53.0


