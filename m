Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3AA19786A
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 12:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728831AbgC3KKr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Mar 2020 06:10:47 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39124 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728257AbgC3KKq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Mar 2020 06:10:46 -0400
Received: by mail-wr1-f65.google.com with SMTP id p10so20859906wrt.6;
        Mon, 30 Mar 2020 03:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+/OiP3IrTXRaETyI/Szx0OX8g4yVPoEKfJQOBIYCi+s=;
        b=kiVwKO3CGmLG+W/hvEl7SZiv9Bg080MAonIK7Nk3f4sp7/NOLSnx/OfScjEgPYJ5Xn
         cEqcLz5jIL/rpheCWie1X6559P9zslICadBfwyJQ6phBFPOoaas8GMo6JFwaFjTpsAck
         j05XoEm4Ld4uYoD45Sd0JVl0IyY8Zr6piUh+cKApSfImliCdM4MeInViPghPzht1G6bo
         YPjFRDHC+7jOSZRm6FGVrUmnh7mQfwe5Va3FAgo7PXmL8GhtMGTYdnyWl43YiQOXVj5Z
         A6QB74Fp7CTddKEkPyTOXYqdAsK6RiXrlYc5UkWAPsh5riX43B8b6G6YFq0sB6kVGkq+
         cZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+/OiP3IrTXRaETyI/Szx0OX8g4yVPoEKfJQOBIYCi+s=;
        b=IfWtF3/PiDcPa0DHcKdWBmjvdcKhEJMmDIroxbTzXPZyNNRp0iPVqb4pP9ux6AglOp
         Zz0YIfkbx7WUfNvn0A/dUygcqtwjEBvM68XQkFf56mmIXnOkkh+j7Gnqi0DM5By7S6+R
         JAgXkzE7jiOBfaxgk7bFqxFxXfXsR1+6mSqf88x+1CHIj4B1ljs+oI2/AXZlhGM8NVx1
         +TNplOYJH7PKU6397aOhPL6NBicO6L5/zNddXJkATI2Pj4UKe5SrbHuaiz6X1IpBJYUM
         6UzaMvh1YyohfZpi8r9D8+VNorfGwk4RYa+fBAMFkz+pAn5A8IYznoEmn4d8bYxzzJWr
         6clg==
X-Gm-Message-State: ANhLgQ0nnGRY4aEyXIKVCWRYODrW7SJL+uBMib54S3HRmRLK36nIiBnL
        DmpYN1HD9j7AUqIwWobWlv3qW5j3
X-Google-Smtp-Source: ADFU+vvDOblHlUCaSMIjsXbLudeMKIE4BrCTaGzg/cXgRATKA9/SfZ4zHiqO2AZ2HEnIDX58uFyRug==
X-Received: by 2002:adf:ee52:: with SMTP id w18mr13982859wro.245.1585563044298;
        Mon, 30 Mar 2020 03:10:44 -0700 (PDT)
Received: from localhost (p200300E41F4A9B0076D02BFFFE273F51.dip0.t-ipconnect.de. [2003:e4:1f4a:9b00:76d0:2bff:fe27:3f51])
        by smtp.gmail.com with ESMTPSA id r17sm21327486wrx.46.2020.03.30.03.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 03:10:43 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, kbuild test robot <lkp@intel.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] phy: tegra: Select USB_COMMON for usb_get_maximum_speed()
Date:   Mon, 30 Mar 2020 12:10:38 +0200
Message-Id: <20200330101038.2422389-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The usb_get_maximum_speed() function is part of the usb-common module,
so enable it by selecting the corresponding Kconfig symbol.

While at it, also make sure to depend on USB_SUPPORT because USB_PHY
requires that. This can lead to Kconfig conflicts if USB_SUPPORT is not
enabled while attempting to enable PHY_TEGRA_XUSB.

Reported-by: kbuild test robot <lkp@intel.com>
Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Hi Greg,

sending this directly to you since it fixes a build issue introduced in
the pull request that you merged last week, so it needs to be applied on
top of that.

Thierry

 drivers/phy/tegra/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
index a208aca4ba7b..c591c958f1eb 100644
--- a/drivers/phy/tegra/Kconfig
+++ b/drivers/phy/tegra/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config PHY_TEGRA_XUSB
 	tristate "NVIDIA Tegra XUSB pad controller driver"
-	depends on ARCH_TEGRA
+	depends on ARCH_TEGRA && USB_SUPPORT
+	select USB_COMMON
 	select USB_CONN_GPIO
 	select USB_PHY
 	help
-- 
2.24.1

