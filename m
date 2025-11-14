Return-Path: <linux-usb+bounces-30521-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B5CC5DC54
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 16:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 6EF4C241BF
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 15:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A4C32572D;
	Fri, 14 Nov 2025 15:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OCaSqo1J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FD732143A
	for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 15:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132529; cv=none; b=hraPHzze9tehbNrTs88VUjN76F39pbKVt14P05joosW2ajXcib+iLqTKWA90rfQo0I7TmjbP64Y4uYh7DcTbeZiSfaXdjHSMEMcWqnMzaq98Ts5vo8gXTCo66zxsWkUpDMjFnsy19uodk00I1G8zrxgAAbbVJ5fuTh5s+480SBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132529; c=relaxed/simple;
	bh=7hDIzYuRMaUA+CS6rtwwNGgsxQ6FJEV9z4I0sOXi9tM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KEJrZaZn3syWZraT2LzWYH3vwEqv/uwywT/djvppBANVMkzEf3BAoWQrg35+oD3xtFZXYCpOyl2sT5kTQekYbNHRMRGnw9PLHrObBNQzgJR6SiHGQozC6ohVVAr4qpDsYJC5rf0FFmEgD9RqnpB27RFnV31qVT/wP9FK94QwnNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OCaSqo1J; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so3508903a12.0
        for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 07:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763132526; x=1763737326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U955yxDhLV946qB6zlVvcTRyppSCB6Gss13CWqZKxx0=;
        b=OCaSqo1JXxeR+iZjyNdXkt36ka51fgtbzwH/nsRrdKOKj+Ss3CjiSkr0klgw0597dd
         AiQkC2MmC4z2c428TXJdtl3JL2HQf0XihOhp68Tqa2rrnZO+1GA5GP4/1WchR6D0FUW1
         n+anwD6ZcxfGc5QbmnsFulXq8JQm4ztst2qQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763132526; x=1763737326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U955yxDhLV946qB6zlVvcTRyppSCB6Gss13CWqZKxx0=;
        b=Wpbe/WywkGfNHn4VXLgxxVzvE+TmzdfGhFhcBV46htTSqhrMdngim+UIE/VYBdz/S7
         tPjQ6GFwyMhYbzFJ1uVT4pTN369h2RCrSm2I70R/DTvwcpbV9t5iboUHW6b2vF71/9pe
         wawiOpwlvAnxX9vrrWEz3hQTg8qgqF8Ofuf48fqfooneePL4nWzdGYuvEzCo9lSayAU2
         mhOV4Pfv0NjjKQqsvN/F94p/nuSKTSP7JyGZ07VHrDjJ9O+OYFZDnDZ6ox+vWdMB5+5H
         NpXFjBFC2iA8mZSBHi8t0Pb3+I9oxFokNaIEYfcxeNzXtMol3GaTD+kWoDHMOjFe6a15
         bjag==
X-Gm-Message-State: AOJu0YyvwNYQC7UzNa3wGUw9J6derHIWmzVcvJ3/kqzUaHJjJcUmBHgT
	XzVE5JZStBaSI+a6KclGtryVJzdEtprV3F1OAgx5F6fUH8awPtoeXJHoLi3p1PP6
X-Gm-Gg: ASbGnctRD0KFCoPHfGe9ononnlnt8rTMVIu4gayWrZ2kGOaEM1e17qh3jN+Hb6EVQc/
	h9kbdog0r9jJgqX+VkRktI68qzHAY44Akmx3Pv/YQ3562b5AiSQNWdWPv1c68xrRP1FDzkE0a1B
	/7k4nOyOMa2uS9qlI9ILpuRqJ0SdN2lqSq7ECSHwKbyfsEpco4r4w9C+Iv0rWUtgfXrXDexXe5z
	uSy1v0ps7kOFkt8IY4wfNSACk7mCSXwqgflfuM7zNwujs33LSBfAULF065MRUF+I/gN62uQ+x48
	23aWWf3Ok0oYwMEQPJ+CsTCG9Mt01bVwmL5U6kXHl1QQgPWdazmhcsToskoJsvHDdZCXu5lkGa6
	Msp8KAjGrR4hV67zFC5DC7wyfvaRHimdZA/2mt3Rl7KA/VNFp75dZEQUqkbI0xWrr+7Pg0vjX+m
	tkSO2S7I3TUzgSMrqFyqYwPSaYCQAaRkPW9xCuljX/Fm4Rzfy3yS4y
X-Google-Smtp-Source: AGHT+IH1ZaD0cNEUmxmsSbxX1WsTY12b7jEcC0kAdBTSwfSu4aGWBZLsKMlZ0rahA9JVz3cwyWG2Ig==
X-Received: by 2002:a17:907:86a2:b0:aff:c306:de51 with SMTP id a640c23a62f3a-b736787e24amr358333266b.4.1763132525486;
        Fri, 14 Nov 2025 07:02:05 -0800 (PST)
Received: from januszek.c.googlers.com.com (5.214.32.34.bc.googleusercontent.com. [34.32.214.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80d27sm403941966b.40.2025.11.14.07.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 07:02:04 -0800 (PST)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH v1] xhci: dbgtty: fix device unregister
Date: Fri, 14 Nov 2025 15:01:47 +0000
Message-ID: <20251114150147.584150-1-ukaszb@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Łukasz Bartosik <ukaszb@chromium.org>

When DbC is disconnected then xhci_dbc_tty_unregister_device()
is called. However if there is any user space process blocked
on write to DbC terminal device then it will never be signalled
and thus stay blocked indifinitely.

This fix adds a tty_hangup() call in xhci_dbc_tty_unregister_device().
The tty_hangup() wakes up any blocked writers and causes subsequent
write attempts to DbC terminal device to fail.

Cc: stable@vger.kernel.org
Fixes: dfba2174dc42 ("usb: xhci: Add DbC support in xHCI driver")
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 drivers/usb/host/xhci-dbgtty.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index d894081d8d15..6ea31af576c7 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -535,6 +535,13 @@ static void xhci_dbc_tty_unregister_device(struct xhci_dbc *dbc)
 
 	if (!port->registered)
 		return;
+	/*
+	 * Hang up the TTY. This wakes up any blocked
+	 * writers and causes subsequent writes to fail.
+	 */
+	if (port->port.tty)
+		tty_hangup(port->port.tty);
+
 	tty_unregister_device(dbc_tty_driver, port->minor);
 	xhci_dbc_tty_exit_port(port);
 	port->registered = false;
-- 
2.52.0.rc1.455.g30608eb744-goog


