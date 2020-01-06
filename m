Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0D2130BA3
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2020 02:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727533AbgAFBfP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Jan 2020 20:35:15 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39695 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbgAFBe6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Jan 2020 20:34:58 -0500
Received: by mail-lf1-f67.google.com with SMTP id y1so35321061lfb.6;
        Sun, 05 Jan 2020 17:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T1tQ+xYAMs7sw/VcDfuwxbYsSSijhyZ3PmmaB8fOUWw=;
        b=oH43961QjKKwgAhExzWn/iK2ChoNfbyxe4OxPEMFEnRZQ0JdT4EkmHxsln1CAHNqsz
         laZytevYs5rlRPOFg4XeRHEC3ISBbO+NWHjcHAD4KaPWs+3UZ9ZDpTy8OsyXmZotFtLd
         6jj2HnxDVqk+kg54dZnYLBVXScyPnDbWjr/c4mAXiSlO0tUx3winVw/fgcfuzWzUqjb+
         sBzlJ+PfprWVzycI99q/kUWlcCiJtwHUyEV5BTtdhLfkN6lJnSjPlV2cdl+q1UQH7JWG
         ftzEQYaGWFl8VRHLex62iAWwW7ve70SGyciyk9Kr71kgLvJwqNmDMkDBUCHxGH3Nza6C
         sFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T1tQ+xYAMs7sw/VcDfuwxbYsSSijhyZ3PmmaB8fOUWw=;
        b=HLjyLYzWwZQc4iaKeHOXjKGLeLnVQABoB3MMDmZq3yUUuGukrb/kx/o4FKJf6YDYRU
         QuqCuHauzZMUv3BYHBtwzeJEsUSBByKZCb/Rbn7lWvlhWruqXm3ALBcxAv6EbRbY3ab2
         2wpCKneT07wI0mn4bB8nStEQJkE7gq53PPJCGkdI7b8sb/zEcVwT9gAcE78B7czaEBow
         zB8wB/372AMacfPjT6e6mudrXVBvEGwn8Fi6gCjMqPIpJOb+S5IG1G1DG4xvmgdYz+8W
         i+UbStYfgLd1VWylTwNUQEFvyCl+7gbYfjE7t9qsxzXCIldQGlIYyr7/OhLKTcH76dHg
         pN6w==
X-Gm-Message-State: APjAAAUoZVu1qvR2rotu5R3OJya2BJCy1KYdhNPs8M7vr/JgpUtbeDYT
        gzbfrNYP4xqhhSm9oKHl6z8=
X-Google-Smtp-Source: APXvYqxOOqz5YzjHYMaBGXEd5DcEpONsaBhPPpGksHjhhiXZBiUxSfoSNymLCCopDIg18X+og+5Xsg==
X-Received: by 2002:ac2:47ec:: with SMTP id b12mr52883706lfp.162.1578274496528;
        Sun, 05 Jan 2020 17:34:56 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id h10sm28235739ljc.39.2020.01.05.17.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2020 17:34:56 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Felipe Balbi <balbi@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 18/20] usb: chipidea: tegra: Add USB_TEGRA_PHY to driver's dependencies
Date:   Mon,  6 Jan 2020 04:34:14 +0300
Message-Id: <20200106013416.9604-19-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200106013416.9604-1-digetx@gmail.com>
References: <20200106013416.9604-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add build dependency on USB_TEGRA_PHY since UDC driver isn't usable
without the PHY.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/chipidea/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
index ae850b3fddf2..d53db520e209 100644
--- a/drivers/usb/chipidea/Kconfig
+++ b/drivers/usb/chipidea/Kconfig
@@ -7,6 +7,7 @@ config USB_CHIPIDEA
 	select RESET_CONTROLLER
 	select USB_ULPI_BUS
 	select USB_ROLE_SWITCH
+	select USB_TEGRA_PHY if ARCH_TEGRA
 	help
 	  Say Y here if your system has a dual role high speed USB
 	  controller based on ChipIdea silicon IP. It supports:
-- 
2.24.0

