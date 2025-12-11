Return-Path: <linux-usb+bounces-31380-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 577B2CB4EFA
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 07:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00C71303091C
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 06:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944FD2BE622;
	Thu, 11 Dec 2025 06:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4lCIV7K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559B229B8C7
	for <linux-usb@vger.kernel.org>; Thu, 11 Dec 2025 06:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765435790; cv=none; b=MaLLLxsD6gUeN5yp4Bask3Q5cTY0h5QJLmRNnWk9LlHOne0Gsv2MxWlKe/PdKJFENrKw6xw6UkfF01gAHV+3x6MFa8dNs+upIhwKIJ3D8Y6+dfb77pr6rATwmJ/Wc9dDL1Xkqvah5SViVsESlDyFvTygI9GmHBNgepZP+W/yy9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765435790; c=relaxed/simple;
	bh=jLIEbOil8JUvwvgoHLS0xgagSdpZFVnP6mw3L4Fg5os=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lSTGUXgJEkR2pWRmH2FCj09CWhZRqkBiMCIpeFZWDodnBzt/T6y3it680GFKhqBOc8iOha3+1kv2/fz0JBP1JU+9yCHPYf0pEL0DTUaTUMHAUou5jLWC22vKOS8mmFzO721iC6fpoU/wTBJDpd/CST0qJmhAJOnBiqSrb/iK5Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4lCIV7K; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2980d9b7df5so9712705ad.3
        for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 22:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765435788; x=1766040588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A930R/Xs4QOYTiiYr4F9dDu2dd52LTZ9/1wSdEBmY94=;
        b=X4lCIV7KIkrdHL97r40ojr5tWwjy1SLV27XpVWFgLUDTyXT0E1BTgsPRsyGsKUq0BH
         3L3uq4xyMRakOPLe+PMUXAmZF0A8lveTiJ/I0Lev8Q2ml3q4oGMVOE4/fbTV3Um9Gqfs
         3okM/7vXTGxWUMxipkIUW91euh3Lnk/XKSOhzQu+4Cznb4cIA5fTvY21KkyhjGNjLpMp
         P0YKwasupl6R0WSvydYwkL1pvU58uFLb0hmcV8P0+NMjIBj9kAgYc0E/ekqwoyjen84c
         0LeacveXue4iNh0ZiburhIOhda6+QI7K4+TCbHpeteXjMTVmqVIXxLb5MVbzrGbcarv/
         KucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765435788; x=1766040588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A930R/Xs4QOYTiiYr4F9dDu2dd52LTZ9/1wSdEBmY94=;
        b=sZNLp+dYaEU1NccNXcBtkacymKHTWxrEfM2rcEU8XWN8qruRv5wd5IB+Y3K9sx161P
         +fezHCbksxl8o7+IKKQgfjNEt0FQcSt91Gp7agTjTSTw/3tEMl8lQ31KEy4W/DP3Ga+Z
         UTW7gOF0RYKQZsqiIFem7L4ayCvGpn9dZxhD+MDriT5u2jM6gZ2dECWfgDpOZsszpUF6
         Odx0ak0qzaLD10JUfD57MCY0WimByvkuylNj+5G+xl4ts/2k8LJ9ki8OkWFfx7K21rG5
         tsdDrrEddARznnCUGn8btn7xFerpF2T9jvkgWOH4D3DuorbVib5k6l/jjwowaN5mKA/T
         f9lg==
X-Forwarded-Encrypted: i=1; AJvYcCW6Wfm7J2wztEeNNDE//+p1S9gXPchSKP7ZxKSPeB2QgONpw9EudxDb4CP0tHPLWHPQvqTNnyFq2gU=@vger.kernel.org
X-Gm-Message-State: AOJu0YycQJ+S/bEQj3/iW1D68RG7HcZP8V/aLHL8Ki0lKOutY5Z3FHxP
	2IbSAFvs6XFA5eArTHFLfUUWqsdRyR6H9uOan8vkGQlS2/d3D7bZ23RB
X-Gm-Gg: AY/fxX6XvhTOHImMsU7tpbxL2XUaa8cliuu7C8YkBX1Hc5Yh9daXUJujyDPeHkFCs76
	PGmm/zwuWOOj7mQ6Zw9hZ/60GPhjb4VodSDhOCSSD29n5olq8FqUIE7/FKK4cqccxua91r5gfPI
	loet0d/na2+VMKdYY3oYjaqblzbuHx734vOWisLYAlwDWx9oVFAXK4zU+lhf/7eVQtL2BREb2sK
	nt810dUMQqBE+KFAT6rxxQTLhRt7JYBLppCq7XKcCniPj0am8zSbckvNhaMc5LRkRrTLNc9mPU7
	r7yurNGv3VDIR5/dhoL00PddIAcLHWEP2w4VI7biHUllgTd4zakwr8gjUaOSSN/FURm8GX/x03j
	yt5yAYEydjlL7PW+azviYvPuGvswJmQSoS8gBmnOxT58t0JjtOGIXiGVGiSQlYW27v1oiPkjxPS
	lmV0L/WmBOKfVA0+R/97EZqSFG8bzD/BulNA==
X-Google-Smtp-Source: AGHT+IHpmykci4B0OIJtBdbWIngC1cFWd1IKB2ZOgzuk8178NaUix/BQGoMHNT6ECQIxjsjZDCl8TQ==
X-Received: by 2002:a17:903:1904:b0:295:73f:90d0 with SMTP id d9443c01a7336-29ec27b8670mr40699845ad.50.1765435788379;
        Wed, 10 Dec 2025 22:49:48 -0800 (PST)
Received: from c45b92c47440.. ([202.120.234.58])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29eea016ef4sm13694335ad.56.2025.12.10.22.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:49:47 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] usb: dwc3: of-simple: fix clock resource leak in dwc3_of_simple_probe
Date: Thu, 11 Dec 2025 10:49:36 +0400
Message-Id: <20251211064937.2360510-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When clk_bulk_prepare_enable() fails, the error path jumps to
err_resetc_assert, skipping clk_bulk_put_all() and leaking the
clock references acquired by clk_bulk_get_all().

Add err_clk_put_all label to properly release clock resources
in all error paths.

Found via static analysis and code review.

Fixes: c0c61471ef86 ("usb: dwc3: of-simple: Convert to bulk clk API")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/usb/dwc3/dwc3-of-simple.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index a4954a21be93..c116143335d9 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -70,11 +70,11 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	simple->num_clocks = ret;
 	ret = clk_bulk_prepare_enable(simple->num_clocks, simple->clks);
 	if (ret)
-		goto err_resetc_assert;
+		goto err_clk_put_all;
 
 	ret = of_platform_populate(np, NULL, NULL, dev);
 	if (ret)
-		goto err_clk_put;
+		goto err_clk_disable;
 
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
@@ -82,8 +82,9 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_clk_put:
+err_clk_disable:
 	clk_bulk_disable_unprepare(simple->num_clocks, simple->clks);
+err_clk_put_all:
 	clk_bulk_put_all(simple->num_clocks, simple->clks);
 
 err_resetc_assert:
-- 
2.25.1


