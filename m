Return-Path: <linux-usb+bounces-30994-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 970E1C8DBA8
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 11:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 80F264E1228
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 10:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC6C324B3B;
	Thu, 27 Nov 2025 10:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cKBSUoLn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2AA231858
	for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 10:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764238826; cv=none; b=stFJW4hHqc4fsaFXaptdDUjVjPXi9FsC+2fKzrRcTKIno5F+Oy1c5cvpUYcv8YZcWuMHhZIis1IsJYy21bO+TrfIOtHIZClEn2EZ0+RVem5UNatBS33uCn9bhB9ABlUeLNdmAeqbZtqIH2I7K+XHcPJ1q75ubq7TMM0DMXoDFoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764238826; c=relaxed/simple;
	bh=aWy9b2WniteZWbmAgQNdLt701CO+AWxD/PpU6c3KdUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rLPr+lrhewK7yyEEy43ILY36vM7LQD3mrBURhPRUQnm+/yr6hfDTybL6cTrMqaLdjaFK+MRsr8Zsb+4IcXnWq+TzUyqKYc7GUut5lyj/DbEHlCwzcUymc33SD/mV2zrCnHXL8NAewFfUCvmVFf+PwIIrfRR2pzVPMTPN6y1S108=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cKBSUoLn; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so1378770a12.1
        for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 02:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764238823; x=1764843623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WXael2kskO/3R1ZxQAzOYQw/gwekIyPXo028Fn8LRLY=;
        b=cKBSUoLncQ3XyAA9Ghh1iXVAGiTjMGKBDTMLOMp5H5MRp/J6AwQMjHgSMyvvzYs91z
         W9RuQCICtYcQvwIyj84g4d1RkXF/VvRPqieCKwfBbQmi1+QlIxpM4IjGnpREWC1bIOPR
         2MsY/s31gd4VPwaihGgUYLTy4E3aw27KkFI+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764238823; x=1764843623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXael2kskO/3R1ZxQAzOYQw/gwekIyPXo028Fn8LRLY=;
        b=YY82yHidZwWkSfGBhtIj3kVbEgrpkEmE6pK4/uv4bhlJmDj5KMpShKkyR+J3wGGrdd
         QlZuJSbO0bWq3CBv//o6aRuj1gMQ24PnuydvjlcujqVSM8YBfGtPWnsk41zIIuwnOgqZ
         AqxsLWoE8P7vqO/OKumg109WeaI7ZlkImp3cpZaQ+RK5uYzwMDSqxEEsmvsgxw0Loi1p
         /IaiBISOxhpO7IS9RWY8WrpsWY2hK46/zGE7wmpmFuAGQPUjuMBAw+jV2qOXt3BgAgAA
         ECo0OweI3IIq4jIc7DKlv9LGCz7fvSJNvcpjeW2A1lyc7pkTViM9AkZ/eNPJHZ8WnwTP
         49Iw==
X-Gm-Message-State: AOJu0Yx6r4JAQXM+o3mTEeTlfgJu5oVKfDv1hGIoGK/UwsmnIKpDRdbz
	q132LwSfWB4syzXr5UNRTkjS0ahUQLApyvk39WQ0m9mXvHqmSUheYWPQKugXKBh9
X-Gm-Gg: ASbGncuNuzonMlyjE/GrIeXJUKOxUGhtHqF8UkKzZNlDfl1CcnhfUGdjZd8dlvxH4Di
	bEcyhIh4s+wW0rlNkizzQ+9bKa9caXhdz73C0wZh+YyCo8ZqmaWQ1vp8oSRleidtUWffqmitby/
	2dDc1Uh5HF9vaAjSfP80v4ALXBWC84LsnPw6+yq0Xt8+cBFX4hf4vCl+eEsrAL4YJkfKAq33Ns3
	xEsQhDqhaZ4LvHSQYd0s5j++0B8V01Eh4JJ9YS+Dquj4+m08rEcuDQOdRdf+kvMS1gLiNXF0NVZ
	NCMiLyzSDDZgqZQ6URa5zqW4y2jeY/reBmg5poGcCuwKYF47S4DR1GZYsuEGOS+gEi/eFvw7BXC
	DktubukOXFhzjmhBgV6tE9xUaM/BVOBQJMcTCVWgsVbAdvRSwSLVd33n0MIKT6qJEs8K2JcuY0W
	P3yVe5gkOZQTjNs8KiBlNr9GmzklXrvMKpK8t16ORFPnblQwOYQRj4J3n9wbChgM8=
X-Google-Smtp-Source: AGHT+IGELg7kvkOexg4sKdSKB8OuMlycie6qkcLhO6MRMl9ksPcVgTqDyXpKboubGU2fnS9D15WSaw==
X-Received: by 2002:a05:6402:510b:b0:640:ccb0:f4da with SMTP id 4fb4d7f45d1cf-6455469bf9fmr18707107a12.29.1764238822812;
        Thu, 27 Nov 2025 02:20:22 -0800 (PST)
Received: from januszek.c.googlers.com.com (5.214.32.34.bc.googleusercontent.com. [34.32.214.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751062261sm1289411a12.33.2025.11.27.02.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 02:20:22 -0800 (PST)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-usb@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1] xhci: dbgtty: fix device unregister: fixup
Date: Thu, 27 Nov 2025 10:19:04 +0000
Message-ID: <20251127101904.3097504-1-ukaszb@google.com>
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

Fixes: 1f73b8b56cf3 ("xhci: dbgtty: fix device unregister")
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
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


