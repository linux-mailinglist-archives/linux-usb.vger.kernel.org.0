Return-Path: <linux-usb+bounces-17002-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 516549BAE18
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 09:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD46DB210D2
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 08:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871F618A6D9;
	Mon,  4 Nov 2024 08:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="oYMZYNrt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222993214
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 08:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730709071; cv=none; b=n3+xrkqhImqo9Sg19kIcTO14Ag9PKIW74u5W7Ih3wajdnIyM2tNzKi/lL5ILUA6SjQ+1mCSYwPeALdKBB1Px649cIvMpEMnD3jofnkil9cuR9ZyBpfwM54sZyqxpT9Cm8XmTCO+iLNKFoFa4yt4dkvEtuRUc978xlIGhZ6jJD1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730709071; c=relaxed/simple;
	bh=m7bNrzT64LR4aULd/xQ7bLyaKGR9MRRBFZeqco8jZCM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tzGWBCc5g51fFVsERiPzNawgX/jmufcZ7COBbzD3JBdE5knAvDxVfiuvqVrLTr9rrmR/G9efB96I5wvaJtKzRV9HuBxVXWbGPMuXEAeB0UUOgSAKi7M1IX19GBHZngnZ0kaiVhimyJLzMj1/878Hu4jb4pWf8jFOVBUIHs0Qobw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=oYMZYNrt; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-720be27db74so2449509b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2024 00:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1730709067; x=1731313867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XDtl/CUWwg6aUbky7XDXGE1CPeuCpGLMrN6Io2cHBfk=;
        b=oYMZYNrtcLdkdmNZIt2GAVq3AY52yKt9E51/rJgTI0nCk4F1b7knu4JO2WJ1LScA8h
         OrCiQhFXqd0fTAAZRbKy8uO563fUAJXluvwwqYG9ZKW39pR/JWmX5iIjDfBi1+ZYyl3r
         C05GSw2Hzcf3iodN31fO9BeoP+fUEAk5J7b7iyhnCCbcHWoYjlwwPWdM3dFs0gPdK9z4
         sstm7eckw1Jo0MNliW4HJhk9Ud+L4y5HAzV76YqWRceeQMZVw9BO0aaKcl+9m8ZkXl78
         b8usE1l18bI4QuO4DilIuaDFFc91HCL5e/linNxe719OHoyNg9GAoNPsRarhH+5mIQZj
         3Q0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730709067; x=1731313867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDtl/CUWwg6aUbky7XDXGE1CPeuCpGLMrN6Io2cHBfk=;
        b=PSiancfNxk7euqXM4D4yPG8ibkIkvexkJbzpCYWNfhI8enAz0EiUwU4mvjCe22QmJv
         v0DoyEAVynnLARucjUU7B85w9a0b+9lDIpR4ZV7SUrPGu4j4UD+tAZT1mb2j9DTqWT90
         Y0X+/i/5DTfWDpYbnV6siYFpDHI5BhfzYpfTHAezKPgitzvq/ubX/fEpK+Ezk5JtCrx8
         9q5MstalM03O2tbqanUhW2g5n6LRa1yeOfc7neopSgoQH0UICWxDU6v3RPE61f2Uft8u
         xP5BdZwic/Rtb6AI6IaHQ25DHAbPD0y7sG+0dJxXDNaBSA1AoBAtUSDmocEOqRKMm9a4
         7Iqw==
X-Gm-Message-State: AOJu0YyegEEgnMaDqOy+7TvIc3aVnI73IQ8+JDL7ZyXtxCenbWlBIfxS
	wgk5/fsYuWAojYHsNPI0aziCU7IavYLSPup+o3GFXcGGqQuNT9pbkz3iV8oTNgoN2QiVd0+SdvV
	BBDQ=
X-Google-Smtp-Source: AGHT+IHLD2ra885kPSAdddYY3WSLtRoo3oMZMuztSbqXZ6K6njxEOeePMT6F3coH5lzlcImsTnBWKw==
X-Received: by 2002:aa7:92c7:0:b0:71e:7174:3a6 with SMTP id d2e1a72fcca58-720bc39e4f0mr18540982b3a.0.1730709067131;
        Mon, 04 Nov 2024 00:31:07 -0800 (PST)
Received: from localhost.localdomain (133-32-133-31.east.xps.vectant.ne.jp. [133.32.133.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e5625sm6872011b3a.53.2024.11.04.00.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 00:31:06 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com
Cc: linux-usb@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: typec: Drop reference to a fwnode
Date: Mon,  4 Nov 2024 17:30:45 +0900
Message-Id: <20241104083045.2101350-1-joe@pf.is.s.u-tokyo.ac.jp>
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
Cc: stable@vger.kernel.org
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changes in v2:
- Add the Cc: stable@vger.kernel.org line.
---
 drivers/usb/typec/class.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 58f40156de56..145e12e13aef 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -2343,6 +2343,7 @@ void typec_port_register_altmodes(struct typec_port *port,
 		altmodes[index] = alt;
 		index++;
 	}
+	fwnode_handle_put(altmodes_node);
 }
 EXPORT_SYMBOL_GPL(typec_port_register_altmodes);
 
-- 
2.34.1


