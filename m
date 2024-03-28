Return-Path: <linux-usb+bounces-7648-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C570874B6B
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 10:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1538F284375
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 09:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D01E85275;
	Thu,  7 Mar 2024 09:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="k5CD1p26"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D8884FCF;
	Thu,  7 Mar 2024 09:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709805319; cv=none; b=fsmW3QGBxUzChj+oj+inVq9SSZgQPvBJBvpFnFgcU6vd6BWUaWFD7OoJwjg+6LaP7Icmb/ulULenfOVt4bjHcG7CdcxuFQmfTnYB0sKiMFHvq5xGw1n8ywNJQs3iThBD9bUa+H8m3PjOPfhTVGpYvzkMdGL2HtSZWOtsdszDHVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709805319; c=relaxed/simple;
	bh=HiXQrBsfMjb2fjnPjAaH+keyJAXsK+83DEOBx1prXAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gEirpYyMNrBgsArEzC7M8odUbLU1S+tsgHrOmfoazQb8l1YmU/3HAluhawu+GKE8cPneutfhn0u5oq+f6Ia3OB1EAR0ufp3qWcrXJH6MvOAT13ZhVJwcKdbupXmgwkk23p2iI1zWCjMD3Sl6XzgqBV8R0IDsw6KGDH/Zsm78B7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=k5CD1p26; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20B4D1C0007;
	Thu,  7 Mar 2024 09:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709805314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VBad9+782slCv5Qy3FoQAjnODyjhm1RvWeZ1RJq9nxg=;
	b=k5CD1p26mVRjdWhzTx+n0zObpEKSqgXeW1htxo1cDxzY6KFL5w5fIkE6zmyq021wepeUAs
	SM6bYG+VOTT5F2p6abg4uLFwonEiGK7RxUJm5amVo1F6fo4481e8nuf1N33PjWTgfMAVGO
	hhJ1qfyfLanmXMwqm/XPTgxld9lzUAkL/AWKwy36VGlS5IzjSFQjuTDd9wN7lZyQFh627X
	eBeLJbtfavMh1qX05pF77RuGBuPVYo8BebWMHaTOcomidaEShUlXdCsixmD/rugTOwSR1w
	0hBiyWIpxpb4gMb+jWCatDLMl6rhS0x7Vaz4o/yJcP0CSqIJSSE4U+TU2b0qvA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 07 Mar 2024 10:55:08 +0100
Subject: [PATCH v4 7/9] usb: cdns3-ti: add J7200 support with
 reset-on-resume behavior
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240307-j7200-usb-suspend-v4-7-5ec7615431f3@bootlin.com>
References: <20240307-j7200-usb-suspend-v4-0-5ec7615431f3@bootlin.com>
In-Reply-To: <20240307-j7200-usb-suspend-v4-0-5ec7615431f3@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Kevin Hilman <khilman@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: theo.lebrun@bootlin.com

Add ti,j7200-usb compatible. Match data indicates the controller resets
on resume meaning:
 - The cdns3-ti wrapper init sequence must be ran at resume.
 - Tell the cdns3 core that we reset on resume. This silences a xHCI
   warning visible in cases of unexpected resets.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/cdns3/cdns3-ti.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
index 29fb24c811b3..648243a27987 100644
--- a/drivers/usb/cdns3/cdns3-ti.c
+++ b/drivers/usb/cdns3/cdns3-ti.c
@@ -17,6 +17,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 
+#include "core.h"
+
 /* USB Wrapper register offsets */
 #define USBSS_PID		0x0
 #define	USBSS_W1		0x4
@@ -255,7 +257,25 @@ static const struct dev_pm_ops cdns_ti_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(cdns_ti_suspend, cdns_ti_resume)
 };
 
+static struct cdns3_platform_data cdns_ti_j7200_pdata = {
+       .quirks = CDNS3_RESET_ON_RESUME,
+};
+
+static const struct of_dev_auxdata cdns_ti_j7200_auxdata[] = {
+       {
+               .compatible = "cdns,usb3",
+               .platform_data = &cdns_ti_j7200_pdata,
+       },
+       {},
+};
+
+static const struct cdns_ti_match_data cdns_ti_j7200_match_data = {
+       .reset_on_resume = true,
+       .auxdata = cdns_ti_j7200_auxdata,
+};
+
 static const struct of_device_id cdns_ti_of_match[] = {
+	{ .compatible = "ti,j7200-usb", .data = &cdns_ti_j7200_match_data, },
 	{ .compatible = "ti,j721e-usb", },
 	{ .compatible = "ti,am64-usb", },
 	{},

-- 
2.44.0


