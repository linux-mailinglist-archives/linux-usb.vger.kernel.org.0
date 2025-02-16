Return-Path: <linux-usb+bounces-20690-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED548A37182
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 01:16:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B745B16D44B
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 00:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5C21C27;
	Sun, 16 Feb 2025 00:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgpvsNTV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2FB33FD
	for <linux-usb@vger.kernel.org>; Sun, 16 Feb 2025 00:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739664982; cv=none; b=MZHf4SvzyO1b9Vw+/TIrO5h+AK6nmFxfVkygoZBoYvjk7aE2sB8QFSJeXXa2k1ODkrdSqo1zDowoKzVd8sl7hd7ntcoN3xF53eMBXvyQMkJrR4ajBDxH5pOQRro5QaV4tmCWzhyAwMOY9bxEWCBmolQusXeL0bzbaH1JhYhL3oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739664982; c=relaxed/simple;
	bh=NEYCkONqT7Zvwjvde1wCYNW6B7PAhQKcAUb7V1rXGKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jx+rOLcD+8NGA69ZIRQKk30pyaz3n3Nf53ye+ktQ7p31Z7Heix9NND0b7DRpBmLA8Aknh7FKatyGv3JN2YQwQkd6cuMbuwlpYl6J/9FqgaQJirk9pVzdXgL5dJk/dTjICR07zT6T6qUTMfIa/Og1erG7oWQPMd80p6ETFD1PNzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgpvsNTV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220d601886fso42209105ad.1
        for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 16:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739664980; x=1740269780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0eVhK+STOowT9LYqWR7qJEZC6eW8Ae7KOk2j7sGt0I=;
        b=FgpvsNTVJYzlsIjVJW7oLl4VHl0AnthhYlrVBi3UO9eMaWRFG/8Upx8IVRiHho62kL
         ExBWzfvx6WkhaXJNFhhPzQqnF4XdgBIM6Aptghs+0bj0YdM9HjnxOeTmh8EkDWkkAwNU
         /krp8t5QRr2rRdIjzTWH5szIHP7RCYN/HnPZCpXoXPKR+kDg2CfMwExz7M2R+q1KQ23N
         laZ66ewQB+8LIPGL+3y1kk1BJoNIMXZ7lFPDedKAHYGqTsKLfBv+MyZkP3ulgmVmiKQy
         0sSyCAi4u8WkyqkbBkCkGxS3MlzqqAbns3dH1KPhnMa7jVldJDl/NOIm0ymMMznxKYW8
         BDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739664980; x=1740269780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u0eVhK+STOowT9LYqWR7qJEZC6eW8Ae7KOk2j7sGt0I=;
        b=ba0jdOf8Tk0bGNaYmWFCd5ELg267vqZtWLoAXVaC99Ym7/mH6gJqALMHtAMssjyCgi
         e9uqDmLv5d+kADd+A0PTpVp6KT0WR4yfURa50R1U37yJIk25dRy2RJWZZ/v7YCrUQfea
         L5ZkwtMXyWzBlbDXi1in1oW0zchDZ1eJ/1k/BgCamzK7jMlw2QDPIAn9fr37cP7Ujz/3
         SLV6MeJ6pLK35/AEnWKoSuYf/59JGeGxx/2yFtHr6ttvoy8S6fdFelND835V5hgpcB0l
         DnrpbrZLoeLaGsZJnlgYAb8RSte+EDYqK1wxhLZRTh4Jpvmf2kxNiGjGgtchIqB353VX
         StQg==
X-Forwarded-Encrypted: i=1; AJvYcCVdjPdwcWBGwg25heDC5iF/bep8bwmiDfI1iLvaM+BcLHubJBDnSUg1lSHZxMIgRV+j3qm+e3Xjptc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVJnWv5zelbE9aO8qHthXISBQ1e4gVHDliykZX37w3TZDmbHJN
	Y4jxVJtuTGxhNSDiDXp3loZKPaB70ULg/EkQjVjBVNT01E3hOZlL
X-Gm-Gg: ASbGncsfjprID+59DEkcMhuMscHtweh1rwN+3NuwbuJacF5tJlaw3MddaiMs0LSS/mb
	O6j0bDIEziQ/CuHe0E/XDbEjVc4TA1MS0dtQ5NdSIiH9ZZWj6xkm8oQv2tYtbgBnuRyGdhR0YYR
	99O57MNI118XW8+GQj/PjvRZpnq76gb3wWmrmcHhUC87wga2aVxHYWkeA8WarWenePDvDRuIRwb
	xHOpaA0BnEaJ6vswMAefFm3ZWsNl3RKi8QVGK0GjLh4hHi/DZt8ptt7IROgHPocr8+FzufgA9nF
	Bs8dx2eY63hAyhrDDJzrZjXTCHna0i20PCb0+BdnOYyw1pHOsnIpPchmwG659OeWUsLjVjPnVug
	8U+tF0zsZ
X-Google-Smtp-Source: AGHT+IGPyqhVKp1K14xieN5deZOF8fpJmossyThXxe6EyqW4qlQZ7+gTjuIBJgoBQHlhjGDOJEK2VQ==
X-Received: by 2002:a05:6a20:1586:b0:1e1:aa24:2e58 with SMTP id adf61e73a8af0-1ee8cb1f646mr8549912637.7.1739664979867;
        Sat, 15 Feb 2025 16:16:19 -0800 (PST)
Received: from test-suraj.qjz2hk5f2gku1a3adsvczrat5c.xx.internal.cloudapp.net ([20.9.134.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732746caf3fsm133820b3a.169.2025.02.15.16.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 16:16:19 -0800 (PST)
From: Suraj Patil <surajpatil522@gmail.com>
To: heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	Suraj Patil <surajpatil522@gmail.com>
Subject: [PATCH] usb: typec: displayport: Update outdated FIXME comment
Date: Sun, 16 Feb 2025 00:16:09 +0000
Message-ID: <20250216001609.106616-3-surajpatil522@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250216001609.106616-1-surajpatil522@gmail.com>
References: <20250216001609.106616-1-surajpatil522@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The port mode is intentionally fixed to DFP_U; remove the FIXME tag.

Signed-off-by: Suraj Patil <surajpatil522@gmail.com>
---
 drivers/usb/typec/altmodes/displayport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index ac84a6d64c2f..732ee9399921 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -727,7 +727,7 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	struct fwnode_handle *fwnode;
 	struct dp_altmode *dp;
 
-	/* FIXME: Port can only be DFP_U. */
+	/* Port mode is fixed to DFP_U. */
 
 	/* Make sure we have compatible pin configurations */
 	if (!(DP_CAP_PIN_ASSIGN_DFP_D(port->vdo) &
-- 
2.43.0


