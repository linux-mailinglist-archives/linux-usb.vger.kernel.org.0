Return-Path: <linux-usb+bounces-16965-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6179B9C58
	for <lists+linux-usb@lfdr.de>; Sat,  2 Nov 2024 03:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9567C1C20CAA
	for <lists+linux-usb@lfdr.de>; Sat,  2 Nov 2024 02:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E4E130AC8;
	Sat,  2 Nov 2024 02:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="GXdB6kTk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DD676410
	for <linux-usb@vger.kernel.org>; Sat,  2 Nov 2024 02:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730514576; cv=none; b=ELwGh38iOXKwP1ZJp0lIXyEW9e7Tm9+roW6aiPJhBcw8sjaGAoHDCIZSHTlJEgd4T9y9f/OJcdhfB1D0966OKgrSc+XA2Uxste2sCrlHPdaZh+vbR87E724xJ4XFiHKOnbU0SNSih47Xiw32HMsVSFuLI/uTvoiExHrhPJJOqWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730514576; c=relaxed/simple;
	bh=km3PNaAAIRNpdwmpcpiyD+2yqP0lYrA1vNUO8vbia6M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lgO3QVt5UPzq2zDJlVNnICqT7mdrFDfr1TPW9wRpPpWdbml58KwSZ2APnBSIVP81Bu2TvkrwcCZln9Rg5q4Brl5ZfgK88NSEXxr3ya2ccV3llNLQcQ+T5jopSdoC9ogW0YxRoHlfZf5eCEklysrsx5hZ6ch2C6hbTuNgh/Q6Ljk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=GXdB6kTk; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7ea9739647bso1894425a12.0
        for <linux-usb@vger.kernel.org>; Fri, 01 Nov 2024 19:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1730514573; x=1731119373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2sw+doSKk3iEawNJDVR1qDdo6BnE5xCSQsj+7NJ1G24=;
        b=GXdB6kTkQsEIsAjpwcy5osK8IVcuybGYpB0D0IlX8QAZgiO2RVZAp3wNHQAaQNxg01
         6S9+rWjCr5OFWiH/pv3Vuk+T04Lxo5k5P4QJRTIuuB/LtMRFHNy1dJSRPd8v7AZ8kHE6
         dJS+fduakXzROQBbxuE1C7MjxFom9p3T1/C5JxLu0WG9FSkbMjTBlYufOUYElM/C7S/m
         s2W6Evu1g6uCPmlUU0hVQyZwAx1Xp8+IidJxAe0omZz7OmYrRsAm51unmn4dl2J0YYcy
         jd/rm8SkdesDFewbFW8OHVfr7aVIbGDWyD1zVBa4QNxSnA958E2h1WxYUbv90pe4jU6l
         rcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730514573; x=1731119373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sw+doSKk3iEawNJDVR1qDdo6BnE5xCSQsj+7NJ1G24=;
        b=jpEsJB5JA0v238Hx+KOAX4VAi8ogaRGddQUwIo9zksl4732NdbpvP2SODp2KRz/DSE
         eJQiuqaUyJaQ1B7EXsjAURTm9V3aS+HrODgortCK5v5lytQDm4hvke/cuZcjlTN8jE94
         hQBdbHiZ0p7KTwOAMhvkbNz3jQP0iqEfSIkJ4kGw8gD0nDP3POOwbqKwuwc8iKCxRPCP
         Eo31EGkba3C7/+vX7Wb6+YeGK3+qVgfDAb4/mkqWlgmjZFezj0YcZFALobUOlQlS10C1
         7qJU8rfG4fIj/qo9lBk/hBaRWfdAqb1j2mo0iTdzjAjYgTLnebdj+u0BdppVu0c4kaYE
         61Kw==
X-Gm-Message-State: AOJu0YyMt3z0uOBX3kD3nPil7gkOFUD+aoUoLYJgvz3e89+hrSNKi4ga
	gImu23AyQYHjdEJk0ostQdEzCY0jH8RVSk8mpKR+5hyjc/9Ja0IE8QkwXJBVmtMKz6n222/0FQr
	vY78=
X-Google-Smtp-Source: AGHT+IFp/G9J738wIC8b/UGdAw571EnbsG+Z6xKDCzLR+VrkJ+v9h35ol0LdjSd3wrvFGl92U9esgw==
X-Received: by 2002:a05:6a21:3a84:b0:1d9:a90:8879 with SMTP id adf61e73a8af0-1d9a8404d7fmr34583183637.21.1730514573147;
        Fri, 01 Nov 2024 19:29:33 -0700 (PDT)
Received: from localhost.localdomain (133-32-133-31.east.xps.vectant.ne.jp. [133.32.133.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c3dd5sm3337803b3a.119.2024.11.01.19.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 19:29:31 -0700 (PDT)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com
Cc: linux-usb@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] usb: typec: Drop reference to a fwnode
Date: Sat,  2 Nov 2024 11:29:14 +0900
Message-Id: <20241102022914.208634-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In typec_port_register_altmodes(), the fwnode reference obtained by
device_get_named_child_node() is not dropped. This commit adds a call to
fwnode_handle_put() to fix the possible reference leak.

Fixes: 7b458a4c5d73 ("usb: typec: Add typec_port_register_altmodes()")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/usb/typec/class.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index d61b4c74648d..1eb240604cf6 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -2341,6 +2341,7 @@ void typec_port_register_altmodes(struct typec_port *port,
 		altmodes[index] = alt;
 		index++;
 	}
+	fwnode_handle_put(altmodes_node);
 }
 EXPORT_SYMBOL_GPL(typec_port_register_altmodes);
 
-- 
2.34.1


