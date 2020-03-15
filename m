Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2309185D56
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2020 15:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbgCOOFj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 10:05:39 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41656 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728089AbgCOOFj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 10:05:39 -0400
Received: by mail-pl1-f194.google.com with SMTP id t14so6621763plr.8;
        Sun, 15 Mar 2020 07:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PzS81B9JB3inb8Ed23Ced8WdwtLoJoOfnQI+PBFU1Nc=;
        b=DdEuSSNCnCbHADx8n/R2JUttC38SJH7dLZ8UFt+KkuMydzwSLDUOwENrXjb3Spxt3T
         ZUC/VLGzUS6nCB4yumG45gHzHo7eAtdgQei9Lpwodc+Z1tvg9p60+BaGxRTy/YWgY7Cx
         aWz/Hcyrg6cyyPZiGcc0740CddYRU0sgG86S2dOq0gfXs0gl9My6xq5g9xjqYUtATEza
         t15sh3FPUq+YEiHrwNw4/Xd1XbCdKzzoNNCp6bT5+Bh5jbngEds42G43wnkQ/IYPsUxQ
         +iFzCQFh7I1WibxOqR46sr5IdNUSECYHt8+TLp+kGm6tPDYxR7bLPGmWl80Dztu9vyqJ
         5IQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PzS81B9JB3inb8Ed23Ced8WdwtLoJoOfnQI+PBFU1Nc=;
        b=jxpGwXQh6JBYO2w2djGUtAZnRjQyKFFHGd0yA/OPx8pUhJb+6b+UoMYGMZ/1U78Q9t
         kzY1eN8YZ0QRwqHOQq7UNS8ucDu6BVPM1FMB894eFNWu+YMpsBzav/9TCThcXM7ztSq9
         mvx8BA0vN3k4BA0tjZFx/g+PeLfVTQLezcYszzjLTpJMqMBH1Au7b3X5kjSpIAqBE272
         PnIm9yxOOyGPgmm/bQvOsvWAFsIgKB7AdhKzyP4Umpa6ORLA/IHADCMBtjW5b599z+Fd
         mj7e+1rhGNLQLC4JstKrVWau8vXEGA8PQPj7u3ab/BTRFw8RPv/xXO6KWGgLT+8JygdO
         ksKw==
X-Gm-Message-State: ANhLgQ0XXR82uVNlB8RxMNhtRoeMjs5RauMezPIfPDW8QPFZApzTVfx3
        zNgYR23QOd9oExSuKDjK6wM=
X-Google-Smtp-Source: ADFU+vsGcMfSNF5YewPbw3Y0tGjdwxbm0o+IhR+e+KYNMqmU8+s1tTuZUY6mjSdmRbrIho1z9TDeqQ==
X-Received: by 2002:a17:90b:94a:: with SMTP id dw10mr20411808pjb.105.1584281131501;
        Sun, 15 Mar 2020 07:05:31 -0700 (PDT)
Received: from localhost (216.24.188.11.16clouds.com. [216.24.188.11])
        by smtp.gmail.com with ESMTPSA id l189sm22471420pga.64.2020.03.15.07.05.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Mar 2020 07:05:30 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     gregkh@linuxfoundation.org, rafael@kernel.org, hminas@synopsys.com,
        mathias.nyman@intel.com, bgolaszewski@baylibre.com, arnd@arndb.de,
        jeffrey.t.kirsher@intel.com, hdegoede@redhat.com,
        treding@nvidia.com, tglx@linutronix.de, tomas.winkler@intel.com,
        suzuki.poulose@arm.com, sergei.shtylyov@cogentembedded.com,
        geert@linux-m68k.org, linux-usb@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v3 0/5] drivers: new helper for ioremapping memory resources
Date:   Sun, 15 Mar 2020 22:05:20 +0800
Message-Id: <20200315140525.21780-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since commit "drivers: provide devm_platform_ioremap_resource()",
It was wrap platform_get_resource() and devm_ioremap_resource() as
single helper devm_platform_ioremap_resource(). but now, many drivers
still used platform_get_resource() and devm_ioremap_resource()
together in the kernel tree. The reason can not be replaced is they
still need use the resource variables obtained by platform_get_resource().
so provide this helper.

The first patch in this series adds a wrapper for these two calls and
the other uses it in a driver.

v2 -> v3:
	- rename the function to
	  devm_platform_get_and_ioremap_resource() by Sergei's suggestion.
	- make the last parameter res as optional by Geert's suggestion.
	- Reimplement devm_platform_ioremap_resource by calling
	  devm_platform_get_and_ioremap_resource() by Geert's suggestion.

v1 -> v2:
	- add some real users of this function (Thanks for greg k-h's reminder)

Dejin Zheng (5):
  drivers: provide devm_platform_get_and_ioremap_resource()
  usb: host: xhci-plat: convert to
    devm_platform_get_and_ioremap_resource
  usb: host: hisilicon: convert to
    devm_platform_get_and_ioremap_resource
  usb: dwc2: convert to devm_platform_get_and_ioremap_resource
  driver core: platform: Reimplement devm_platform_ioremap_resource

 drivers/base/platform.c         | 27 +++++++++++++++++++++++----
 drivers/usb/dwc2/platform.c     |  3 +--
 drivers/usb/host/xhci-histb.c   |  3 +--
 drivers/usb/host/xhci-plat.c    |  3 +--
 include/linux/platform_device.h |  3 +++
 5 files changed, 29 insertions(+), 10 deletions(-)

-- 
2.25.0

