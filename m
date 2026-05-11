Return-Path: <linux-usb+bounces-37265-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEPjOEzhAWptlgEAu9opvQ
	(envelope-from <linux-usb+bounces-37265-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 16:01:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CE63550F8DA
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 16:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E53AA3032FA9
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 13:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7555D40148F;
	Mon, 11 May 2026 13:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cF7H620Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B563FD15C
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 13:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507873; cv=none; b=G8TuyXY2M1QpCuhaO5AuNVa/VL90eHMaQR6gGy5WELwQPew5iMCGEPQEwySnq+nRYVPipAoP8ykSIlBytqWbz8tJcsMUohiS2KOrPY+jqeIxmReSYTtoJd+N24wPBPooVaFwy2rPXvvgYlmNSkNHORtVS3SY51q1mChs6vjI6wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507873; c=relaxed/simple;
	bh=//xeqBDO+FAC+aa1qPeAepE9RtXXW3YKKxu7v7xKkuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ljx5J3OsL2QkvbpkK9CSOFkKV5ML03qqhPylIh92xbHN03wplJDFzUWr/IUjpS914CILaS6TyioE5R+QNvGlpEIT7ZKoWV7/wnHyAs+J+jJDl4+TIVXT9l/rR7q6fL3GrEG4Nv58hzNKUzCo/EOZW1iCOjStPoV8AP3cZ+GGL8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cF7H620Y; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bcc1459daddso274505666b.1
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 06:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507857; x=1779112657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2O8Su9Gk1Lf9CS4xvd/yWBGZ4wDlTJeCYsl5Z1xTugo=;
        b=cF7H620YRQdAAB6av+O7l8dQp8lR1njATPv1q3DMnueWOX33L0/xEEN7Gr2Y7up8CK
         tzAr7mYz2wMEs+QttSiBu+7ddSAnjzpT7VCh/usSCX/MfMCbybBMRxLc0qK/gX1yz6qJ
         /BBZvl2To8Xkqlyg6lh+l2Y8k+FhTzAHQYTeEh3hd33LAbXREsdHpERz9jckZZIN7g2a
         vOt1rgXDkHsdBj5NEvJoAYQM5INfe/9zSQz20mG4TX4olcYtig99+8rRakm4vZ0ijNDF
         UmiJQodssNZrdJKdjMXQf9YluXVnuqUL1z5kjGtaNXYtNDcAD/aCCiGqWizX5+aRFIUW
         RrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507857; x=1779112657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2O8Su9Gk1Lf9CS4xvd/yWBGZ4wDlTJeCYsl5Z1xTugo=;
        b=pofpJ1WpaOSzgYyv81LqWoYpLRfF/Bc4yNQppYuQqmc6Ppn0+6FbqE23HJiKhGL0mW
         OXj3u8IkJd4PU/0nTMflOKZKvuCMx/BdmwlR9gkEfJ+q/7TAg7YJZCyGaRoxDOsaqTuQ
         SbM3AoM8r73BXqD6uEsw8nfGRBg0Nnh1EIiFE+AQAgQOATyEoXV2Gx00dhgLqxCGpSRr
         qNCol3Oh8/kTYJomRoGf0p7uEclPjDsPCYATMMseLzwMssBn0nL/eE4Pj5FsB6quoiZs
         VkNNcbQzKNPyQotA+w4LHBR3c5kkIn3r+NHFrOsiGaVvDBy5i4+BNM6vxQGSbvXgeW2R
         9aUA==
X-Forwarded-Encrypted: i=1; AFNElJ9sY6J530uKzDlGPYPlkexOUC+Ge8Y/E4VfhT0Fb6odGZGzzmbXoTGwAqq0/4n7dfcNNmMmLg3CS0o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt1yzy+xZjVOaXtSoxAoOvbPDfBtv+eRO/aXWV9A9MglG0Eadz
	7b2fq9Nv4gMoYe2zD3LvsWycZBfi0J4UuzaCOsJHjRMNdOIknJcXEdQN
X-Gm-Gg: Acq92OH/N7vtumHLtu3WxRoyezmNK0nT24p3xv01gBakIaxDmBx/1c8o7h9xjSY6q22
	rcUrWOghuIxCy8OLASfEOOmWmMPf6TUstBFXhoj7HnU8CZ8E+UGiik5YHyxgEefL4lVSFuze75s
	tFPudOnCKB3HEebxDk4myuXfwRuLQSW7jhJcziWbQ7ccyknupsc2dmNHGuA2Wy76NlFCRmkYbmw
	hls3LREqWECxIZKBnCGAUtjO1SqxAzz+ByGGNZMVVYzBk0MTB7/sEyZ5/3S6OVTq+nb/QgWjxXq
	UohBvUkiiszbuGO+CnrLhzKfNXitmdLdutxw+qPAdwoECwL6l4ORQixmIsGhHqx/x3YO+SyyFwo
	LNUCcRKW3O0RorJPn+EUAlXpk0Ur+otYuKc0n5M5DR2cCG2oPt4LvQ+yPkMli+gOwp0sVgprgWq
	HtSYaZtONXAPc5
X-Received: by 2002:a17:907:c18:b0:bb8:b536:55dd with SMTP id a640c23a62f3a-bc56d713f3bmr1489015866b.41.1778507856804;
        Mon, 11 May 2026 06:57:36 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3b904sm3685357a12.1.2026.05.11.06.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:57:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 6/6] phy: tegra: Add support for Nvidia Tegra XMM6260 PHY
Date: Mon, 11 May 2026 16:57:01 +0300
Message-ID: <20260511135703.62470-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511135703.62470-1-clamor95@gmail.com>
References: <20260511135703.62470-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CE63550F8DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37265-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,nvidia.com,linuxfoundation.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,netdev,dt];
	NEURAL_HAM(-0.00)[-0.987];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Nvidia Tegra XMM6260 PHY is a hardware configuration used in Tegra SoCs
to provide proper interaction between the application processor and the
modem, as well as control over one of the SoC's USB lines for the modem.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/phy/tegra/Kconfig             |  12 +++
 drivers/phy/tegra/Makefile            |   1 +
 drivers/phy/tegra/phy-tegra-xmm6260.c | 144 ++++++++++++++++++++++++++
 3 files changed, 157 insertions(+)
 create mode 100644 drivers/phy/tegra/phy-tegra-xmm6260.c

diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
index 342fb736da4b..41b5ce460f37 100644
--- a/drivers/phy/tegra/Kconfig
+++ b/drivers/phy/tegra/Kconfig
@@ -18,3 +18,15 @@ config PHY_TEGRA194_P2U
 	help
 	  Enable this to support the P2U (PIPE to UPHY) that is part of Tegra 19x
 	  and 234 SOCs.
+
+config PHY_TEGRA_XMM6260
+	tristate "NVIDIA Tegra XMM6260 PHY driver"
+	depends on ARCH_TEGRA && USB_NET_XMM6260 && USB_SUPPORT
+	select GENERIC_PHY
+	help
+	  Enable this to support XMM6260 modem found in various Tegra devices
+	  with cellular capabilities, like LG Optimus 4X P880, LG Optimus Vu
+	  P895, Google Nexus 7 (2012) 3G and ASUS Transformer Pad 3G TF300TG.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called phy-tegra-xmm6260.
diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
index eeeea72de117..829e298ee56c 100644
--- a/drivers/phy/tegra/Makefile
+++ b/drivers/phy/tegra/Makefile
@@ -9,3 +9,4 @@ phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_186_SOC) += xusb-tegra186.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_194_SOC) += xusb-tegra186.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_234_SOC) += xusb-tegra186.o
 obj-$(CONFIG_PHY_TEGRA194_P2U) += phy-tegra194-p2u.o
+obj-$(CONFIG_PHY_TEGRA_XMM6260) += phy-tegra-xmm6260.o
diff --git a/drivers/phy/tegra/phy-tegra-xmm6260.c b/drivers/phy/tegra/phy-tegra-xmm6260.c
new file mode 100644
index 000000000000..7511de1333aa
--- /dev/null
+++ b/drivers/phy/tegra/phy-tegra-xmm6260.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/usb.h>
+#include <linux/usb/chipidea.h>
+#include <linux/usb/phy.h>
+
+struct tegra_usb_device {
+	struct ci_hdrc_platform_data data;
+	struct platform_device *dev;
+};
+
+struct tegra_xmm6260_phy {
+	struct device *dev;
+	struct platform_device *usb_dev;
+	struct usb_phy *usb_phy;
+	struct gpio_desc *enable_gpio;
+};
+
+static int tegra_xmm6260_phy_power_on(struct phy *phy)
+{
+	struct tegra_xmm6260_phy *mphy = phy_get_drvdata(phy);
+	struct tegra_usb_device *usb = platform_get_drvdata(mphy->usb_dev);
+	int ret;
+
+	gpiod_set_value_cansleep(mphy->enable_gpio, 1);
+
+	ret = usb_phy_init(mphy->usb_phy);
+	if (ret) {
+		gpiod_set_value_cansleep(mphy->enable_gpio, 0);
+		return dev_err_probe(mphy->dev, ret,
+				     "failed to init USB PHY\n");
+	}
+
+	usb->dev = ci_hdrc_add_device(&mphy->usb_dev->dev,
+				      mphy->usb_dev->resource,
+				      mphy->usb_dev->num_resources,
+				      &usb->data);
+	if (IS_ERR(usb->dev)) {
+		gpiod_set_value_cansleep(mphy->enable_gpio, 0);
+		usb_phy_shutdown(mphy->usb_phy);
+		return dev_err_probe(mphy->dev, PTR_ERR(usb->dev),
+				     "failed to register USB controller\n");
+	}
+
+	return 0;
+}
+
+static int tegra_xmm6260_phy_power_off(struct phy *phy)
+{
+	struct tegra_xmm6260_phy *mphy = phy_get_drvdata(phy);
+	struct tegra_usb_device *usb = platform_get_drvdata(mphy->usb_dev);
+
+	ci_hdrc_remove_device(usb->dev);
+	usb_phy_shutdown(mphy->usb_phy);
+
+	gpiod_set_value_cansleep(mphy->enable_gpio, 0);
+
+	return 0;
+}
+
+static const struct phy_ops tegra_xmm6260_phy_ops = {
+	.power_on = tegra_xmm6260_phy_power_on,
+	.power_off = tegra_xmm6260_phy_power_off,
+	.owner = THIS_MODULE,
+};
+
+static int tegra_xmm6260_phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct device_node *usb_node;
+	struct phy *generic_phy;
+	struct tegra_xmm6260_phy *mphy;
+
+	mphy = devm_kzalloc(dev, sizeof(*mphy), GFP_KERNEL);
+	if (!mphy)
+		return -ENOMEM;
+
+	mphy->enable_gpio = devm_gpiod_get_optional(dev, "enable",
+						    GPIOD_OUT_LOW);
+	if (IS_ERR(mphy->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(mphy->enable_gpio),
+				     "failed to get enable GPIO\n");
+
+	usb_node = of_parse_phandle(dev->of_node, "nvidia,usb-bus", 0);
+	if (IS_ERR(usb_node))
+		return dev_err_probe(dev, PTR_ERR(usb_node),
+				     "failed to parse modem USB bus\n");
+
+	mphy->usb_dev = of_find_device_by_node(usb_node);
+	of_node_put(usb_node);
+	if (!mphy->usb_dev)
+		return dev_err_probe(dev, -ENODEV,
+				     "failed to get modem USB bus\n");
+
+	mphy->usb_phy = devm_usb_get_phy_by_phandle(dev, "nvidia,usb-bus", 1);
+	if (IS_ERR(mphy->usb_phy))
+		return dev_err_probe(dev, PTR_ERR(mphy->usb_phy),
+				     "failed to get USB PHY");
+
+	generic_phy = devm_phy_create(dev, NULL, &tegra_xmm6260_phy_ops);
+	if (IS_ERR(generic_phy))
+		return dev_err_probe(dev, PTR_ERR(generic_phy),
+				     "failed to create PHY\n");
+
+	phy_set_drvdata(generic_phy, mphy);
+	mphy->dev = dev;
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider))
+		return dev_err_probe(dev, PTR_ERR(phy_provider),
+				     "failed to register PHY\n");
+
+	return 0;
+}
+
+static const struct of_device_id tegra_xmm6260_phy_match[] = {
+	{ .compatible = "nvidia,tegra-xmm6260" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tegra_xmm6260_phy_match);
+
+static struct platform_driver tegra_xmm6260_phy_driver = {
+	.driver = {
+		.name = "tegra-xmm6260-phy",
+		.of_match_table = tegra_xmm6260_phy_match,
+	},
+	.probe = tegra_xmm6260_phy_probe,
+};
+module_platform_driver(tegra_xmm6260_phy_driver);
+
+MODULE_AUTHOR("Svyatolsav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("Tegra XMM6260 PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0


