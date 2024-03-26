Return-Path: <linux-usb+bounces-8421-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8AF88C69D
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 16:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3FBA1F388E2
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 15:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA1813C815;
	Tue, 26 Mar 2024 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsIHJmz8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7CB763E2
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 15:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711466218; cv=none; b=k2HDGShha9JM5xlKdkPM/pF3QT5l1YWNmKxAHtH719atBRy7Cxzs314qpTfWCf10Exex2Otl1hY0F8c8u9aN59M7JlUiJU8cS+6Yjk3gofJaBUlja33ffoyiEyzh6mf5EyI5xzSpGo38qpRlCbO9C1KtkLgS+rpL7JCT2g9+Myo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711466218; c=relaxed/simple;
	bh=25ja3x1kQAuuG/+Mw5q9lfNzi/huiNF/DdwRwMOVgBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gmhgH9c2w2ARm6ai3boqTZvTBN6w0KDJjTq/IsMseldceqTz2zVkNRvOP6EDp2auwpXWxsoIGWTZCIRQ/XHQfmDAOwzFQ768UkJ6AwnEBfGFV4jlkPyVe+uPuo9BBKoLjo+eXNbkolVXxuJcpkZXt43BSGDh+AgOdixskktBRd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsIHJmz8; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ea9a605ca7so1772756b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 08:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711466216; x=1712071016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrHyqXf79MEy0OV9vghuoVFTPea/Hzd4//h2fdHZj2M=;
        b=ZsIHJmz8OAvr27o1gxTKPMxKf/cBHAjFShiv44kHZALaP9+yjGneietaYmn9g3ZPWL
         X7wdyj529N7cehdeF7Hnau2avrcrtlBswDqFEwVVnvv6LJO7tQ5kgeqKfgAcOgayNZvZ
         +OCQvTaMknWJb3yOxTrK8sU36GL/Vw8yfgYNFY3qu0X75yRx+qbkR+VPVO2SbOe5cGPO
         vI8qE18HT/BOUzw2HXXfjPm2uI9ROS8pg0wj6QVmSTuZnVlnJ956jlpt7TZNpcVT1YLo
         tQW6xqaUKVZAmHEA+wesXS+71bDrF2WptBruQHJX4vkzuKb6lIR39lB7aJpR47Q+viMT
         WfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711466216; x=1712071016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IrHyqXf79MEy0OV9vghuoVFTPea/Hzd4//h2fdHZj2M=;
        b=KBlU3yl3OSdUzEtJ6arwDzcW3Uc0xJ3Hv0Yj6uSJ1gid2htKSxX1E3rWLOEpMjq4UT
         gSUNOLfSwoJ0LmyvKnc7iqp013bB2D1mFUasesDLt/zY6kUOGzeqN9BG6nO3gyp46q0f
         labGOpZH8BWCD9VdJsLWAnN4PXYR4nk/+vz4nzPFohPCRfwkLdjFVExzzs/WJGgM76Z5
         jeUigzi3PTKhplHKTMkahKMgwZpiu+3diFt5sI26xh6RfSn0DVPPUQoQaEbKjnTO2OPX
         XvUOwTr/T4UuqUfZo1v4FWfcdyyKn0rzZ7E0BZHACuIwiL2amSq9BTI4HG+ZiashuX5/
         p5/A==
X-Forwarded-Encrypted: i=1; AJvYcCVIXDnuRXenKNpB6Kg/HlAmkMmVxbFGAsjz/5ZoTFeAg54nthlOESNPbncnKRt7ebRGuiGA6d1Q8co7yTpON2y8jGCmKhEBYuhm
X-Gm-Message-State: AOJu0YxpA5HYiQPSt7zIrSVvpq/VnV60sFgbM/xbB7buGBgyqsxDrlsn
	XHH5LbnFkykeRo6vNVlILVjl8y5Z9j2f7/O3icD3zdtihQf15cQroRBDoQon
X-Google-Smtp-Source: AGHT+IF5RB7tglZLk02DcDBiYyt7SXYW2G3U7LCVpuaKtqHEKpftqhfwmu+RmA8fTJvF12TDdMzwlQ==
X-Received: by 2002:a05:6a20:840b:b0:1a3:a85c:44a5 with SMTP id c11-20020a056a20840b00b001a3a85c44a5mr2297204pzd.31.1711466215759;
        Tue, 26 Mar 2024 08:16:55 -0700 (PDT)
Received: from petra.lan ([2607:fa18:9ffd::c91])
        by smtp.gmail.com with ESMTPSA id s3-20020aa78283000000b006e631af9cefsm6073126pfm.62.2024.03.26.08.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:16:55 -0700 (PDT)
From: Alex Henrie <alexhenrie24@gmail.com>
To: linux-parport@lists.infradead.org,
	linux-usb@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	johan@kernel.org,
	daniel@gimpelevich.san-francisco.ca.us,
	hkzlabnet@gmail.com,
	reboots@g-cipher.net,
	mike@trausch.us,
	gregkh@linuxfoundation.org
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH v2 1/4] usb: misc: uss720: point pp->dev to usbdev->dev
Date: Tue, 26 Mar 2024 09:07:08 -0600
Message-ID: <20240326150723.99939-2-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326150723.99939-1-alexhenrie24@gmail.com>
References: <20240312055350.205878-4-alexhenrie24@gmail.com>
 <20240326150723.99939-1-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This avoids a "fix this legacy no-device port driver" warning from
parport_announce_port in drivers/parport/share.c. The parport driver now
requires a pointer to the device struct.

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 drivers/usb/misc/uss720.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
index b00d92db5dfd..1c940608deb5 100644
--- a/drivers/usb/misc/uss720.c
+++ b/drivers/usb/misc/uss720.c
@@ -720,6 +720,7 @@ static int uss720_probe(struct usb_interface *intf,
 	priv->pp = pp;
 	pp->private_data = priv;
 	pp->modes = PARPORT_MODE_PCSPP | PARPORT_MODE_TRISTATE | PARPORT_MODE_EPP | PARPORT_MODE_ECP | PARPORT_MODE_COMPAT;
+	pp->dev = &usbdev->dev;
 
 	/* set the USS720 control register to manual mode, no ECP compression, enable all ints */
 	set_1284_register(pp, 7, 0x00, GFP_KERNEL);
-- 
2.44.0


