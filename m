Return-Path: <linux-usb+bounces-31581-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9836CCC454
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 15:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B3CA310ACE4
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 14:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68D82BD5B4;
	Thu, 18 Dec 2025 14:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwjlvC7n"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE6529B224;
	Thu, 18 Dec 2025 14:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766067648; cv=none; b=q4+CwgjRl2LLZH0qhMZik6ntXUns4pFhGWIOFph/iOtPdjdY8W+OKBICqAJjOVxq9UIvRhvBbRSwi/WyZWEozVD0L1hygh3KBolhwRRemjbdA/GSsGD44NWz5RWU1MsSEXWObnnarDF8XEWALVNA3PSmWEPB8l7jS7wF6OtttUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766067648; c=relaxed/simple;
	bh=KfWqZQnauiqwFE7v8YKMYdmDoE/S3EJ0zM4G0/EWpHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AHPm5bIO9qxpkSdN9oi+yJUc6CXjv7DJE83gsNovVUzFZRd+JjIo8WKWvMevbTqvy6BzTb9/1XEw9o6txc5jlPwMzkZoYLnkAK9ylDy2YpP8wAuC91qT+vWV8Yqs1Rrgv1QBE1d6y9XpdYKec2dG4dhmvyjNlDrqTCYMegGk+Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwjlvC7n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3D3C19424;
	Thu, 18 Dec 2025 14:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766067646;
	bh=KfWqZQnauiqwFE7v8YKMYdmDoE/S3EJ0zM4G0/EWpHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hwjlvC7ns3ixwufX737E7YMyx7F3jfRBHTgzkHxqH6NgDSZAI6ZwFaT9Z9rdXq7RR
	 AIOOHfxaOrYqz8vZ28YIdybMiO7YuVvm+cUYEMvVLtY/8tUTHIHj3r3Sv/4dU1xqjA
	 64nBWbTyfPKmiqNDE2vQqs6k02TUmA4X/EZ4dfjptCoWW7Qrxt3hKQEy5jJDrNskmr
	 di7nlOUrp0hRumtcrPOVoTl4Hi0UoCEl/LW216Xz0lgIson0300Aq0+oasn8Lw6HET
	 9I+7Wnur/K1fR4H0Ro8dqicetY6TnNqZlfo2Nyngx85DnouwVAtJ0tMw9CY8eEj3Iz
	 O0kC5FKwfPnAg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWEs1-000000001YR-0Db3;
	Thu, 18 Dec 2025 15:20:45 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Ma Ke <make24@iscas.ac.cn>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 5/5] usb: ohci-nxp: clean up probe error labels
Date: Thu, 18 Dec 2025 15:19:45 +0100
Message-ID: <20251218141945.5884-6-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251218141945.5884-1-johan@kernel.org>
References: <20251218141945.5884-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Error labels should be named after what they do rather than after from
where they are jumped to.

Rename the probe error labels for consistency and to improve
readability.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/host/ohci-nxp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
index 9a05828bbba1..7663f2aa35e9 100644
--- a/drivers/usb/host/ohci-nxp.c
+++ b/drivers/usb/host/ohci-nxp.c
@@ -198,7 +198,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
 	hcd->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(hcd->regs)) {
 		ret = PTR_ERR(hcd->regs);
-		goto fail_resource;
+		goto err_put_hcd;
 	}
 	hcd->rsrc_start = res->start;
 	hcd->rsrc_len = resource_size(res);
@@ -206,7 +206,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = -ENXIO;
-		goto fail_resource;
+		goto err_put_hcd;
 	}
 
 	ohci_nxp_start_hc();
@@ -220,7 +220,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
 	}
 
 	ohci_nxp_stop_hc();
-fail_resource:
+err_put_hcd:
 	usb_put_hcd(hcd);
 err_put_client:
 	put_device(&isp1301_i2c_client->dev);
-- 
2.51.2


