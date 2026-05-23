Return-Path: <linux-usb+bounces-37967-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJ0zC1FmEWo2lgYAu9opvQ
	(envelope-from <linux-usb+bounces-37967-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 10:33:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D85F5BDEF2
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 10:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B016301DBAC
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 08:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FAD3672A2;
	Sat, 23 May 2026 08:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imnVYIMh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09E3362130
	for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 08:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779525049; cv=none; b=IXlfO/XqEN0KoaTuuii+axEx9T1TGqZ3kTW/m3ITD8eg0NoCmzXwsyId7Isl14+3wz+SpN0zpcma/k13ADILlGQdWSb+0m1BZW/41Jx7FKtWoeWLnLydABb0lfU8tzUokQM1yFLHBXzK16Nqn/aV+G70MsE+nZXqaXCz49SwFLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779525049; c=relaxed/simple;
	bh=O4o9ol0z9p1ozuLH8y297KGzgYwC2IgBRXVV6czRJHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvOeOgHj+ZrDp4pVKFDcG0quXEDySRHZL1H4ldM69NadZsgK5K/XCrO7zRCARZEqDDqQny+aD6muE96Xh69r1jcPNl2r+kcMJk9YWFAhPLqvoNUd9xqMiYDnhTdB5x90okK/nW9K7E0Rrb2NfA1zSCqLFv2erhbTYv2ZzbeOyWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imnVYIMh; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so13273024a12.1
        for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 01:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779525046; x=1780129846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWj8ptSzNBKrFt1mxoQKUyY2RzDOkBP4g8UuTE+1+DQ=;
        b=imnVYIMhBy80+n7Te9lWyG3Wzocdx/9S3tLruB550EhYCV7vdCLl3PxPqaWxqFBIif
         8zSzmZJNXVGN4nl1AvL1qfzzW7mFxt1jzmKAELjnhYDomx4NAyKpxtj4HygbSVD+dIkB
         omInIBLYdW4t+mCSCmAsiReu8LQ+EbKwV0/T4Pxn+N+ACD3UZ7Bmwns83CLVbXtRlK7s
         1B3unh30uHX/yvuQDfOw8ddYGp/ROIu+v4DBbRKpZRROBte5CUYv9zZBnD1C34qbUzwH
         4R7e8DfybL1GNBFT4ihZbtbnQhHXPtXtNT7MprS/F9vl7fpYx43K1nb4VFuPMba9DzSf
         sCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779525046; x=1780129846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IWj8ptSzNBKrFt1mxoQKUyY2RzDOkBP4g8UuTE+1+DQ=;
        b=M1UAwYsiNQZhmg/Wm+iycRx16xU61auYg0WOOtIec62ItsS3tm4QGbcdEsE7wzmewQ
         ulmfvJ25OWIGlgHeT079u1TPif5rHA7KeK3tCxVIkyQx/zW8jwIVwGu2eJszu0cnDPx+
         2R4q5zQOT8YxIIEjnoGrDcQqpuk7BjfnHmcupoolHJXWKBALeInYoY5JdH+o8OTTi4cr
         R/i2ildFDG2Gx0XE1JWloGBKz3QENdz1o8bP3u0Kjm1QVuGPCnoxtqee9p2kiOcLbu6F
         heg0I+RefxuvwBD+ijAvow7v7TzLdE37FQ3Xea6DWNBBaT2t1FyNOu68MlYXMBgIukFx
         IaFA==
X-Gm-Message-State: AOJu0Yw56xLMRJnKhVK/F3nhsoerkDGmcTOoKqxXpAT20MOgatPUZtcw
	hxq7NJuiT2p8MbvZRzZcbEsCcR8zpk/7L9Y1F5cPssCkKwUGwfX+11VvaVCNiQ==
X-Gm-Gg: Acq92OFS/rBVODjp2Xt5uQaMytKnFxKhYU+hxlVcA9G7y2cz6MUxPN+x74ExBpWCF+F
	ep+oJ0d2vneUfY63qWwJ6k8Y/Av9ruHWl28r3d/H7DLsgUq4IXfUyW5kkoFPKEcYaf/oXC94asv
	1oCZC8wxXjax2UvOXGvqnme7JVIOVOoYM0MSwvI3b96sh0XN+1szIY5H4Cg27lbu35MYbgtUgIF
	3u261Syu33GQV0vWmrhs6qRexz8e8ITtVkUJC+l8ByA2/KSok9Y+JCURQ1BC4C/E3Uliq893wv4
	bSUGdK5K2DY7ur8jieWszEYF39FU2tsyXcpxJ5Ma7L7r+0rVzdoOyGTCoCLxy64jZF2AlSQ0Gx6
	1XdInWw8EF0sRGU0q5yZyF7vKJZluGsvkoe3xxaySIco7mI3M7H3kzEaMOID4ts1E198TJdx3C/
	TdB/gnQT1j1VQM2bEs7DfK0ig=
X-Received: by 2002:a05:6402:3719:b0:687:285d:44a8 with SMTP id 4fb4d7f45d1cf-6889c453fa1mr3595245a12.14.1779525045838;
        Sat, 23 May 2026 01:30:45 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm1651856a12.30.2026.05.23.01.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:30:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] usb: chipidea: tegra: Expose tegra_usb structure
Date: Sat, 23 May 2026 11:30:12 +0300
Message-ID: <20260523083013.46372-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260523083013.46372-1-clamor95@gmail.com>
References: <20260523083013.46372-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37967-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,nvidia.com,gmail.com,nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-0.963];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1D85F5BDEF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The tegra_usb structure is platform data of USB controller and is required
for proper controller malipulation if its init/deinit is externally
controlled.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 13 +------------
 include/linux/usb/tegra_usb_phy.h    | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index a19cb3b33bf3..109c4afdee4a 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -16,6 +16,7 @@
 #include <linux/usb/hcd.h>
 #include <linux/usb/of.h>
 #include <linux/usb/phy.h>
+#include <linux/usb/tegra_usb_phy.h>
 
 #include <soc/tegra/common.h>
 
@@ -23,18 +24,6 @@
 
 #include "ci.h"
 
-struct tegra_usb {
-	struct ci_hdrc_platform_data data;
-	struct platform_device *dev;
-
-	const struct tegra_usb_soc_info *soc;
-	struct usb_phy *phy;
-	struct clk *clk;
-
-	bool needs_double_reset;
-	bool externally_controlled;
-};
-
 struct tegra_usb_soc_info {
 	unsigned long flags;
 	unsigned int txfifothresh;
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index 6343f88df5de..ba74b7ebfba0 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/usb/chipidea.h>
 #include <linux/usb/otg.h>
 
 struct gpio_desc;
@@ -62,6 +63,20 @@ enum tegra_usb_phy_port_speed {
 	TEGRA_USB_PHY_PORT_SPEED_HIGH,
 };
 
+struct tegra_usb_soc_info;
+
+struct tegra_usb {
+	struct ci_hdrc_platform_data data;
+	struct platform_device *dev;
+
+	const struct tegra_usb_soc_info *soc;
+	struct usb_phy *phy;
+	struct clk *clk;
+
+	bool needs_double_reset;
+	bool externally_controlled;
+};
+
 struct tegra_xtal_freq;
 
 struct tegra_usb_phy {
-- 
2.51.0


