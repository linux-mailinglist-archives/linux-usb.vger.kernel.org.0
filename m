Return-Path: <linux-usb+bounces-31870-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A2099CED9E0
	for <lists+linux-usb@lfdr.de>; Fri, 02 Jan 2026 04:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60A633004CED
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jan 2026 03:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7455E1EEA55;
	Fri,  2 Jan 2026 03:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTSpnP65"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D58072639
	for <linux-usb@vger.kernel.org>; Fri,  2 Jan 2026 03:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767323955; cv=none; b=oyvTPAzZZbl6bzF7odtvjiokPjWaMavZYekpwwShvXrKLls0AaVOQ6GA5SmBw9LwWOrotnh6Da19is+t9AKYsAxBXv8IPssuE06cIkKPIzjGXLGlJ5rd6Q69GWMo8WcDjtu+5r+M+3AcCKwn+NQPAHN/W1oujF+m0fSGC8OARro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767323955; c=relaxed/simple;
	bh=Mf8J5qmsAHAJdJQjjuQFS9ySQRt9ffULCZDxv0ZZgDo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=nBrstNYf7iMuET10kgvg8/IIorzsJ2wLSU7n3/3+WpazNLqM0ED7odiy8POzHYbHxWsSimADUj/jSkZrzD/RkEDFwgtjCbQYOJGJlPrb36aD5rm7z/c2LPGJQCcn1ywIMNO2q4kg/wkjaprUhao6CqkWGu1K+TNqXzAANkWZvSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTSpnP65; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47d493a9b96so23384825e9.1
        for <linux-usb@vger.kernel.org>; Thu, 01 Jan 2026 19:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767323951; x=1767928751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RXIbZbmVL5aob0CGYAVwj4rorrq4kmy9zuIwG/cSSPo=;
        b=iTSpnP65NcYdg7HsBT1DDE+ynBZdFCiCJlBcspSHDm7rIL6EO4uWRGuyNavdG0+ZK0
         MEaXE1vWWfGxP7CMTxJtLp/Zkzfh9XSNv0z1tt1bYQskp2B/QITEVx8fTWx1KPhkbDx3
         Um/eOYEuR2MViWvhqF5Yr2hiwlAP/FBi2XqfgyRwRTZ5FOH3QynOSIqsh5mn2Kgg5DEy
         O6bfaRmasEL/2d5TNIDRQVhIb4dBAYQohyjcijMK8mZd5aIFcWVHPB5h92hq9l2B6U8K
         2BHgkuDzNyKB4u6DyuAkF8j7VrqmcQlrzVR6jJvdSOeUMEFwvfQLJFbBZNy7fqMptPZ7
         VUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767323951; x=1767928751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXIbZbmVL5aob0CGYAVwj4rorrq4kmy9zuIwG/cSSPo=;
        b=t2P6bwGVja6VCEb8HC5BC9RYji7HTciyVv3/reruKJxbG4bemNCXWFxmzahy/hPjFj
         V5sv45o7sa5IOmX5uD2VBI+KTqpa4O4ZJIUcr6JzQ9kG2lnQp3O89Bn29vLRJwBk1zCS
         iawFmJ/UK3tSIaFqwqdo8AzoLg/Ft0CJFk4pAlY3+tKhmbVHS+Up46Kl7FixHSY1zpXP
         MRj9CFAf6UA+Pd9kBH3PjIZlPdCMIPfhxPBYMH/tb19PZ711Zw/xhngCJiTi+l60Sowx
         iN8yiR6/vptR/reuWxoijNK6w1X6r0P9k4xj0Cl03vswMRXEYCVzsJLva1LG8uAj2dLd
         OiLw==
X-Forwarded-Encrypted: i=1; AJvYcCXvlmkCthzxmiAkrzb8KcZWmF474n8akKU80s4KzPHjxR9eoYo/94F2x1qB+s74QUjytnMi1fPDRYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY4Qn2A5BTJybkdXcdI2l6j4QeIZ+rH+Z11eS8AS7NSaAKg65o
	IoMExG9Hub0RIFnQ6Kq4c0+t1ttmWDNrsrKECXHeTSGLk1bhwGIWM6hY
X-Gm-Gg: AY/fxX53hW8D6YZ8H8TQJMTjj64BJW2v7S4npi/uE6VXZWW0eeks/KhXMI4/2bpBbQo
	dLcK/I28ad+7iLhWmqpqpkNw7BA2Zleb6hbCHZYgG9XZNmT/x4tHhH1RMJn83MznBHlPEcBkc+w
	4yOtxe3xyyuSAJ8aQ9JAr5rMdHrFAJbLPm2hu7OZFd9khVHiaiub2OKHh6PJlk58kPf5EI911Uz
	RMluH4iK8WajIAc7paYwWfOCEbEfiEQoBee8mU/TUPWUv/M3509EwcDdkRnvhZMK/uFjEpcTSdu
	684HHCbwggTEAPOw4faJx6uWQXjx7Cs3zczbYaljDDDTfA2QXPP+Vx7/7bdsxsssqzXdwsM1FqM
	RVGfGc62GioM1MMaqqpQlSbgoAZMj+byRg8U+EWjtYXVmZHr5BRhQBv7PzUlyzOLwhRbIpF1n4F
	ug/of+OqaBZiXAmReTCJotmjKG+TIgHzYSYG326gMhvovmttuaf20=
X-Google-Smtp-Source: AGHT+IEmP+CjMTwa8bcfa2ehuVQFG2zxiJypBd7KDVBwsdmirid6sXl64mB90EZnMqE4y/HrrF5YCw==
X-Received: by 2002:a05:600c:35c4:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-47d195869e7mr560606275e9.28.1767323951301;
        Thu, 01 Jan 2026 19:19:11 -0800 (PST)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be279c5f8sm742090205e9.9.2026.01.01.19.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 19:19:10 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] thunderbolt: log path activation failures without WARN backtraces
Date: Fri,  2 Jan 2026 11:19:05 +0800
Message-ID: <20260102031905.27416-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tb_path_activate() currently logs failures with tb_WARN(), which triggers
a stack trace. Transient conditions such as lane bonding or Type-C link
hiccups can fail path activation briefly, and the resulting backtraces are
noisy without aiding diagnosis.

Switch to tb_warn() for all path activation failures. The error code is
already returned to callers, and the warning still shows the message
without the backtrace.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/thunderbolt/path.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index f9b11dadfbdd..50659bd55d7b 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -586,7 +586,7 @@ int tb_path_activate(struct tb_path *path)
 	tb_dbg(path->tb, "%s path activation complete\n", path->name);
 	return 0;
 err:
-	tb_WARN(path->tb, "%s path activation failed\n", path->name);
+	tb_warn(path->tb, "%s path activation failed: %d\n", path->name, res);
 	return res;
 }
 
-- 
2.43.0


