Return-Path: <linux-usb+bounces-29664-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DC4C0A533
	for <lists+linux-usb@lfdr.de>; Sun, 26 Oct 2025 10:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 090C04E4C4C
	for <lists+linux-usb@lfdr.de>; Sun, 26 Oct 2025 09:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C083D2877E7;
	Sun, 26 Oct 2025 09:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNoXStkk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61F022CBD7
	for <linux-usb@vger.kernel.org>; Sun, 26 Oct 2025 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761469757; cv=none; b=OuGe0yANnNGalSb5GB42Tics5PgK9WhM+sX4kZdCSzhjbQqgCvAmjr7yUYd+8gKNpRfdObrpl/fcgAGM8JOuh7NQY1YYqHge4lQjCHBOR9FA1kUVQGKxc8n0o1w/RI9taZkLoG6IQVe1HUoKCFCLLquSwzl2dbKfustKkzijB5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761469757; c=relaxed/simple;
	bh=rhvUQQ1aDLIgY9l5Xbthj+I3M2mzo0BNAfDOxjdvxS4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=owr3ZZWeqTTTCvh0dzVBSyNAC6hRnU0uE2Ti2jHe5c7JtoY2aWRJ8pBvlLO4KJnRwyMpQMEuv8KLDPaI7FVEIUbrnth/lIMIfiS8lcDnSZ5gsVyZE03ILnujE23RwBORkVL6C8JTEXCGJKFETO4iCW3YEhFzc9vTc4QTfnef+2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNoXStkk; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b67684e2904so2580820a12.2
        for <linux-usb@vger.kernel.org>; Sun, 26 Oct 2025 02:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761469755; x=1762074555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XDgBxVdEbTdr5iOqBlPvDWxYT4j0U5j6kRWBLPDFwas=;
        b=QNoXStkkgsY4pho1HMXuuLiPrtSIgXcbhdyz+4isjbnNhpi5t9B5RgxKgvbfRYNeVM
         LDsLBzSblXbY/Dsu5nC+ZMubDVj0T7Qb+lGWBDYQ5PI85GTkmMUbDxriWiXzNhXNqgRh
         A5uBA6fRENpD1Mg1zVGCnXnC2lJJzNvFVxFhv7d7TdY5O9pTWhLM94XH0UvmNXSgYk9E
         OYIDgstyJAQTy+ydE+0X5mqTyPad65KYyWdS37oZ6AVLlACSGfXfbjc0qa7a2SB0b4DH
         OFeAz5pCLGs5Yhf72nv/y3A3qFXbEYzCEJiVi0XaBGXnEWIUHPrHburyyAmstanfLOt+
         Ircw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761469755; x=1762074555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDgBxVdEbTdr5iOqBlPvDWxYT4j0U5j6kRWBLPDFwas=;
        b=xCwWCYUnghLVvgqbXxipu4FBXm1H4xTNrz6iU70jxFX9aE9zimGn41CfhwnnT4YqbO
         +WS3MYw8AmViR2EL8MdgivL1FHS2590+N6zAHyYRqghF3ecRZB2TCmev690jNzZGEdYz
         fpJfg7GGC62MbRKHTAieZHXcLZn1c0HyEOHdgaZTpkSzgjPB570lEr68x7lme9l7YOpy
         rlmgeWZZbCZ+UB6bdI+Vxo8Z7Enl1O4Pc1jdih2e6dVQsRFj8ji+roU2UBjt1rKwyDek
         iaAogBSfnbWSpDDi9cmG37eVZFDQr7lZQIyx9A40koQQUHfr9o8ZTCnKs1mcJCu8E6E4
         psmw==
X-Forwarded-Encrypted: i=1; AJvYcCVEBsbD2uiXYQIOlE1T+tkGp6TZUx8qZm57HwVR3qcTHI4H80G+9mti09t93IQ+0SkSc11MjKpQzGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhBqbX3tvOQvfS2iF2nKNTzTBFDvT6xqKy3smQSEv83oogXdqH
	w+a5ziCW6E+OJRKCClG4reSu4k8s8V9EBO0jp7CF2O8dDO4zPi+oRdmF
X-Gm-Gg: ASbGncs56ngo/1tjWa9xyvtOoRsEZUn1LmtyWZdtMkbnPmk5eNreaCiKU4tPKtxYk+v
	1bqixU5h0iAyqbnkDrJU/Y751zNzKGPX6nizoUqpV2hllanoGNAxnnaffl4EtoiLq1tuIyXotmn
	9SaVpaIF+WBo1Y75z9Z8EmVbihg0G8K1WsSbrgvTjGShpWLVjO9OCurWyGANoP2g0ME/4QNhUpm
	6k60+RorfrtDbIemGRJRwgIHvO2mdK6iEbTq6ar8J7dPMxaKy2/B6r6df3UBlIdBZtzAJm2hINp
	H5hPCrivK+FhBLBxbNbDHelg6xiu2v2xF9V4v6WtV+S80niGE5NFPUXC2T7lXVYcGEDPO40zg8y
	trQFs1LYTULjzUNTZDxmJQ/0Tc9ewyuEI4i+gxxKCIFtjp/YKxIgHyTEtBaIiWrlc0rhkhWYNgS
	FFBslFe8Xfe0FcvzEsm3huGw==
X-Google-Smtp-Source: AGHT+IHoQyB3vduskRb0VU1yRtEZxt+TCgaYNmvXlhRvC3wwf/9MqRK9WnjLi1uyYkvh8yX+068xAw==
X-Received: by 2002:a17:902:d512:b0:290:9ebf:211b with SMTP id d9443c01a7336-2948ba3d94emr87342155ad.40.1761469755256;
        Sun, 26 Oct 2025 02:09:15 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29498d230basm45238555ad.46.2025.10.26.02.09.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Oct 2025 02:09:14 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] usb: cdns3: Fix double resource release in cdns3_pci_probe
Date: Sun, 26 Oct 2025 17:08:59 +0800
Message-Id: <20251026090859.33107-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver uses pcim_enable_device() to enable the PCI device,
the device will be automatically disabled on driver detach through
the managed device framework. The manual pci_disable_device() calls
in the error paths are therefore redundant and should be removed.

Found via static anlaysis and this is similar to commit 99ca0b57e49f
("thermal: intel: int340x: processor: Fix warning during module unload").

Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/usb/cdns3/cdns3-pci-wrap.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3-pci-wrap.c
index 3b3b3dc75f35..57f57c24c663 100644
--- a/drivers/usb/cdns3/cdns3-pci-wrap.c
+++ b/drivers/usb/cdns3/cdns3-pci-wrap.c
@@ -98,10 +98,8 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
 		wrap = pci_get_drvdata(func);
 	} else {
 		wrap = kzalloc(sizeof(*wrap), GFP_KERNEL);
-		if (!wrap) {
-			pci_disable_device(pdev);
+		if (!wrap)
 			return -ENOMEM;
-		}
 	}
 
 	res = wrap->dev_res;
@@ -160,7 +158,6 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
 		/* register platform device */
 		wrap->plat_dev = platform_device_register_full(&plat_info);
 		if (IS_ERR(wrap->plat_dev)) {
-			pci_disable_device(pdev);
 			err = PTR_ERR(wrap->plat_dev);
 			kfree(wrap);
 			return err;
-- 
2.39.5 (Apple Git-154)


