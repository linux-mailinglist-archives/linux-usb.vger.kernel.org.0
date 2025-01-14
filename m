Return-Path: <linux-usb+bounces-19346-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC33A111A6
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 21:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BD5B1679B4
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 20:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE5D20A5CA;
	Tue, 14 Jan 2025 20:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w9wWM7is"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA13F1FDE05
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 20:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736885147; cv=none; b=t90tKcgNB6fIFbl5138MUUVMYmSuamNidHbdx0JqM+irhGEB75HjEX5fxrVfTY77aQV32bigbhSCK3XXyM763FAH3heIOwF6J/VMFu/5QaX7LtxV5i+pOL28FTEaEKkXQj01LdvTRP+35W3JUA7WvB6bnuViq5NJCQD8P38EmiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736885147; c=relaxed/simple;
	bh=nmJr11UuY4Bfe29oETroChEz/oyxl2OwFdz3Ug4E48g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Tmy6GzeFosToNbt+35YpvNbJm/k0XXydX6SxoEktkxhDTc3cHrp6cSc/LQHYnSNYRX9nKUsJP/gaTJGWsKUjMh33gsBFWBpQTky0tuvTj+7ThyxZb2vrx7aF7ozqP5apaKTTumVha9xk+S9sOzwLe6yiPCfndNPon7EY9Ct0vqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w9wWM7is; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so7442565e9.3
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 12:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736885144; x=1737489944; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v/k2E/bpxZ+0pCBE5McUXWaXdlpSIskBjR60ldq6c2s=;
        b=w9wWM7is3ZNr4BQm23R7uZ6zgi+kO+0+hHs9b75JEhmVpJ1jQHR5Rk28uux7SKFZhm
         n9OQn2BVtmNP/vUF423NFlY5kAef4yN9IHNESl4Wx8tBE7H+eVXPOAOTpJ15nZ0/QAYF
         wlnPRy/V8YotdZZvDYDJYMLzmf4kTs3UFXuSOXzQMIb7W1k+Ko4Ch5VpU+v0PBmQaiwP
         MEP1VIeCUGZK9cK6Y5RCT4yWZ/flqVoLagcf1fGDc+Lr2o6E2MSWjDEKtlx4Tar0u1xV
         f59L3Yg63nSIQrBqa8lt9TOFh75FJIRHmKD8WMTJEluW1eYrqjqggO6K22mwOtW96X3j
         kiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736885144; x=1737489944;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/k2E/bpxZ+0pCBE5McUXWaXdlpSIskBjR60ldq6c2s=;
        b=LUPcWHzK1OK11pJTKZfJvRDLhR8j1rfHP6TVTbIrQzyzHacdTQzTZSZF/k+HyOe9pz
         PfXf1Ybv2gVPsL1nN2VT0fTGYGHO31CgLg2UHgUzhDW88iWaUF1C48RO6kjQvqQy08wO
         wwYBM/r69o6RU4SxEE6fasX+abrYHKBVKcx50PN8CNYcZVfVj8y+Lx/LzMKH3JrLSwZT
         CHybiVJrJUPnmSXwjceOupBmzeDSBXUT5wO72qctmoLgWIKWsIjtFwpqcp5AiRkMwGtr
         EyTGPca2WEORcutjIx8fAQ+zoqxJSOYv8WcKcZ2rXtI35onR8yalyDQRBl+17uhl1Rhq
         kEQQ==
X-Gm-Message-State: AOJu0YwhsWRMLpCMOtAm6a8/ep2++KSwghS2Ic2ifTc6YkFLpkyzhOdv
	XcHrfRqJT85ZzH2qYvvkpw7mPJ6WfJID67njPACYp2HspZT+yPv8SsgVjOY9I80=
X-Gm-Gg: ASbGnctzGQqaEObr1HzUey4Ct+HL/l/3ecU1tK7Mi3LNMDsUTLlsUqCQPDtpwmS1jIW
	SNeVvSdA5imoPJBZqhh3+3s8dn+Njy4xQsBpA0UBiYR2sF746qN8rrgR9bfBE8/csbIbamWGQBs
	7CcC6ObYN/f5hVKQBNLgI/uluxyQgMSx4QOlBVMV03BWRyRLm8pcZgVWVMAQ9uNlrpMViAy3J89
	pPUkIhpd1jN35ZgMWJT1U7GQX/oKXT+VIvBimYEg/nnjs6D4mXiSKyna8rv8F62WNSQcfbJ
X-Google-Smtp-Source: AGHT+IHQMFwAoalDWM0t8+KU0jhne3GD/Sut85D+9uJNbmultBlgnPxiNQp2M4n9ZB0UX+KLHBYV7A==
X-Received: by 2002:a05:600c:3b83:b0:434:f586:7535 with SMTP id 5b1f17b1804b1-436e256093dmr93862205e9.0.1736885144276;
        Tue, 14 Jan 2025 12:05:44 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dc8802sm184622025e9.10.2025.01.14.12.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:05:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/6] USB: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 21:05:33 +0100
Message-Id: <20250114-str-enable-disable-usb-v1-0-c8405df47c19@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI7DhmcC/x2MQQqAIBAAvxJ7bkGzQPpKdMjcaiEs3IpA/HvSa
 ZjDTAKhyCTQVwkiPSx8hCK6rmDeprASsi8OjWo6pXWLckWkMLmd0LP8vMWhsdbPzhilrYcSn5E
 Wfv/xMOb8AVcM1WBoAAAA
X-Change-ID: 20250114-str-enable-disable-usb-388dcb33018d
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Peter Chen <peter.chen@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb-storage@lists.one-eyed-alien.net, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3465;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nmJr11UuY4Bfe29oETroChEz/oyxl2OwFdz3Ug4E48g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnhsOQUrWOP1qt6ZaAtaAURvG8jnYVem92OdTKj
 NPA4ew2kaqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4bDkAAKCRDBN2bmhouD
 14N9D/9J6AaiLvv8QH+8H2cFh6pdmm/rQfg4Frl5WMv096NwDBf/uAl0OEVqaGylkk8cdPx7rUU
 3hBYhQmcLC5M/2+8Mo1AWu/CHY9Mcs5jm9bNvxAGg3jCJkJutCGxrXXZ0ZNyLT9MaaJvdVQf2JF
 80P4moM43/4fZDeaPo6q/VZes+cT+SpLCwbs9yX5eqgm/h9PPYGzsr/7shMxY7i5hrLDYV2mGUQ
 rpsQa44S7n6O5R4A4Tt+6ymJJzeoK9bEvs843GBlgaayhVTt6EmyzZkn+734u1peR1WDyj7oKNS
 4RgXHZngvusbGWjqueO3MNqy1bONr2+mclpIqnXHDeEuhA1lhbWfK0iiwrgy0jIrAJSm6Nuv/6w
 Bk6m/V4WhIO47l9UUcSoTKPrNbl0EGq+Z4pKF5VBV8gFgMtWMV527L4sdZzzaR+P+Hr22jZAdQm
 Mr82TWOFHJBZmRnieYa03lVXHGE6Te9SNOXK6E3Y4anz9NRJXfJ/fbq34pbmav3FjnXvn67CayC
 xW5JBsFXs92jzLXES7dcmncDS3SkC4ID6Hy2lK+9nYslS2uA0IDkrkP4ngMFPSYPBKd0Lnxf18z
 dQ/EhSJTd+8aBdYz/g0thsoW+VjBDZOXs8pMWAIchZ3Y2p96bHaCaG1k38Dk5g0ttv3jeZlcWHj
 8kEXX7jBl9sCL5A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simple refactoring to replace ternary operator for string pairs like
"enable/disable".

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      USB: Replace own str_plural with common one
      USB: host: Use str_enable_disable-like helpers
      USB: typec: Use str_enable_disable-like helpers
      USB: phy: Use str_enable_disable-like helpers
      USB: gadget: Use str_enable_disable-like helpers
      USB: Use str_enable_disable-like helpers

 drivers/usb/cdns3/cdnsp-gadget.c                   | 13 ++++++------
 drivers/usb/chipidea/host.c                        |  3 ++-
 drivers/usb/common/usb-conn-gpio.c                 |  3 ++-
 drivers/usb/core/config.c                          | 19 +++++++----------
 drivers/usb/core/generic.c                         | 12 ++++-------
 drivers/usb/core/hub.c                             | 10 ++++-----
 drivers/usb/core/port.c                            |  3 ++-
 drivers/usb/fotg210/fotg210-core.c                 |  5 +++--
 drivers/usb/gadget/function/f_ecm.c                |  4 ++--
 drivers/usb/gadget/function/f_ncm.c                |  3 ++-
 drivers/usb/gadget/function/u_serial.c             |  3 ++-
 drivers/usb/gadget/legacy/inode.c                  |  3 ++-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c           |  3 ++-
 drivers/usb/gadget/udc/at91_udc.c                  |  3 ++-
 drivers/usb/gadget/udc/cdns2/cdns2-gadget.c        | 13 ++++++------
 drivers/usb/gadget/udc/dummy_hcd.c                 |  3 ++-
 drivers/usb/gadget/udc/fsl_udc_core.c              |  3 ++-
 drivers/usb/gadget/udc/omap_udc.c                  |  3 ++-
 drivers/usb/gadget/udc/pxa27x_udc.c                |  3 ++-
 drivers/usb/host/oxu210hp-hcd.c                    |  3 ++-
 drivers/usb/host/sl811-hcd.c                       |  3 ++-
 drivers/usb/host/xhci-ring.c                       |  5 +++--
 drivers/usb/host/xhci-tegra.c                      |  5 +++--
 drivers/usb/host/xhci.c                            |  3 ++-
 drivers/usb/mtu3/mtu3_debugfs.c                    |  3 ++-
 drivers/usb/mtu3/mtu3_dr.c                         |  3 ++-
 drivers/usb/mtu3/mtu3_gadget.c                     |  3 ++-
 drivers/usb/musb/da8xx.c                           |  3 ++-
 drivers/usb/musb/musb_core.c                       |  3 ++-
 drivers/usb/musb/musb_dsps.c                       |  3 ++-
 drivers/usb/musb/musb_gadget.c                     |  3 ++-
 drivers/usb/musb/musb_host.c                       |  3 ++-
 drivers/usb/phy/phy-fsl-usb.c                      |  3 ++-
 drivers/usb/phy/phy-mv-usb.c                       |  3 ++-
 drivers/usb/phy/phy-tahvo.c                        |  3 ++-
 drivers/usb/storage/shuttle_usbat.c                |  4 ++--
 drivers/usb/typec/class.c                          |  7 ++++---
 drivers/usb/typec/tcpm/fusb302.c                   | 24 +++++++++++-----------
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c    |  3 ++-
 .../typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c   |  3 ++-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c |  4 +++-
 drivers/usb/typec/tcpm/tcpm.c                      |  7 ++++---
 drivers/usb/usbip/vhci_hcd.c                       |  3 ++-
 43 files changed, 124 insertions(+), 95 deletions(-)
---
base-commit: 114d4ae3196721b07f1159730665e0c3f032058a
change-id: 20250114-str-enable-disable-usb-388dcb33018d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


