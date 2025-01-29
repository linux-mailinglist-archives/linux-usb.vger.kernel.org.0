Return-Path: <linux-usb+bounces-19841-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D1DA21B67
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 11:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CE071888C91
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 10:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B601DE3CB;
	Wed, 29 Jan 2025 10:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kYj2yifV"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693221D0F5A;
	Wed, 29 Jan 2025 10:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738148189; cv=none; b=ibpFEiPeqFbUBXNkPqGDZIoZy+BzyYO2MqGJfg5B2Oq30juxD1BlxpayG8jbW36iH+p/ZXtnnsbBkq+XiGVPskHserXbk3yM0AcODsWuwX2OvXB5E+5OtnWpT6gQCIzzRi0uwOENOKnZHXs1slkHgxR51Il83e9C+s4qCyCrL+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738148189; c=relaxed/simple;
	bh=eBy2wZc03fg5WLGtOI3rz810FtgqWGk5IdPSV5cMmfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SBTyGkD4cJSwUvz3qul+qm/6dt9/wNFqFRJvfNEgRiEuigBnNiFI+i4ZSqwaFSNvaOvO90MiSrH8KdlTuBJBEzihvrZQ9gCXI2Nt1OrM1eAXbWkIomFjmmVvqLry9P1CvpElNA7yq/Ql9xarQ0vf/445RLx/nYO9BAlrYwbs5JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kYj2yifV; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56DC3FF80F;
	Wed, 29 Jan 2025 10:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738148179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gtY/ue4tP/7qgGhS7KR0RiR9xU44j3m0SPzMgH7vv6k=;
	b=kYj2yifVjxgkvFuBDsmLSo1bstPtMfxsnN8kr+CMQ/xVeJ73ND9BqQBMKtckJ7XjBlRY5U
	j9QrtZNLSIopVkadra7tYkTXfVMD39pinyUNLPOgo/EdkiHqUkCdw4jSk9oJIWouiD3H9E
	8YLSnk7Lc8Y5OHqFEV509+upBri+dwcYB7ohxD0qcIfO2vYWWP2K5f0w1gN6+VBssRRAHU
	EyuNhTBgnLWsr0NHKqogzbI+q4FdytI9a7+0nDQ5ZKqDkOsfA78EjLl3WOB9rVW0h16G4b
	7teJlBwVNqeMD0Z7FZ2iFeGq68wlaTm/mMNL+Cb43wJgnqJu4xSHdDVcp8/r2Q==
From: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
To: theo.lebrun@bootlin.com,
	mathias.nyman@linux.intel.com
Cc: rogerq@kernel.org,
	peter.chen@kernel.org,
	pawell@cadence.com,
	gregkh@linuxfoundation.org,
	mathias.nyman@intel.com,
	gregory.clement@bootlin.com,
	thomas.petazzoni@bootlin.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] usb: host: cdns3: forward lost power information to xhci
Date: Wed, 29 Jan 2025 11:56:13 +0100
Message-ID: <20250129105613.403923-9-theo.lebrun@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <D7EHVKGXIFM4.3IDSI7TDG85AV@bootlin.com>
References: <D7EHVKGXIFM4.3IDSI7TDG85AV@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: theo.lebrun@bootlin.com

cdns3-plat can know if power was lost across system-wide suspend.
Forward that information:

 - Grab the lost_power bool from cdns_role_driver::resume(). Store it
   into the power_lost field in struct xhci_plat_priv.

 - xhci-plat will call xhci_resume() with that value (ORed to whether we
   are in a hibernation restore).

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/cdns3/host.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index 7ba760ee62e3..f0df114c2b53 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -138,6 +138,16 @@ static void cdns_host_exit(struct cdns *cdns)
 	cdns_drd_host_off(cdns);
 }
 
+static int cdns_host_resume(struct cdns *cdns, bool power_lost)
+{
+	struct usb_hcd *hcd = platform_get_drvdata(cdns->host_dev);
+	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+
+	priv->power_lost = power_lost;
+
+	return 0;
+}
+
 int cdns_host_init(struct cdns *cdns)
 {
 	struct cdns_role_driver *rdrv;
@@ -148,6 +158,7 @@ int cdns_host_init(struct cdns *cdns)
 
 	rdrv->start	= __cdns_host_init;
 	rdrv->stop	= cdns_host_exit;
+	rdrv->resume	= cdns_host_resume;
 	rdrv->state	= CDNS_ROLE_STATE_INACTIVE;
 	rdrv->name	= "host";
 
-- 
2.48.1


