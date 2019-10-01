Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94D3FC357F
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 15:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388348AbfJANXr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 09:23:47 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51961 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388297AbfJANXr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Oct 2019 09:23:47 -0400
Received: by mail-wm1-f66.google.com with SMTP id 7so3392011wme.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Oct 2019 06:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SMP20nsut8K+lsuDT/dJwOJCmshErHGRxDa2UzJ4ZSA=;
        b=pNZ/xbdGWvMJsrR7LsXNQNn33ITo6LZWDWxKIj+23UfEU0tPa4OTxtwuulGSIiue/8
         X2z+ubrhvAbCxFXavidWWf2FPs1QLxu6krwSgY6PHudkSlKEaLZgDkBzc6NwYGIx6O2M
         gJGIhlJWhK/ZIkdZACSA7HXTfduo2+8gMtYCvMnjziBC0/HQAatX59iobBg6IKjSfjD3
         rLOizJzInMBqYjfpyAmLaTJjQd/MLnr733PVks/P89Tj53XeC/UQRVcWijRJ2aSPr0Ir
         ozuJWiz6IJXcSR2YFIfW3DBIud2oNsLgV3/FeBX2XdDnnadTVVJj4DyL8XYJNX/LsIH5
         V6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SMP20nsut8K+lsuDT/dJwOJCmshErHGRxDa2UzJ4ZSA=;
        b=qzgX6q5QqH530W6OyT40nSzOkdvQColIg55QxuI2VQLqm0TGv/SzpUf6Ugd6cY6WlT
         N2PNTeFkiOLVcIV0y6HCch44K9iDnoS+Ccn7dcl9JQamWQsK/XIJkGupkGExxCeeredt
         AapqFv7T75jGiJqRrsPmWNnHkVJZcd3hv/60cQpKCCRgy0zMIhoQ3v1DN9w2nHhlHxco
         WazpQnLOdfL1X0TqCYlnz/TGjeOdwF72ruJXmgFTnYIs/1EwCJxmqPUFQhjdXy68v0ro
         rtDz6EF8h25rlIsFSYS6N3YhKYNrfTcs5+GJdTlV/TUin32+OUNKp6J7KQ1FaJqupYDB
         87dA==
X-Gm-Message-State: APjAAAWEkJlJiQ5x3KLLp5qkxent8Qa3fy7YCe7YmNJ9z3/UkvxqieNH
        HSgXLR0m1fSuF1WGlOf6RFNq1w==
X-Google-Smtp-Source: APXvYqwyifTBE4GQLXEIzUj8q0mUZotz7tkb9kVX+0xOqDAooBCfQ0uylmeNHVo+z3S+VXuqNhiuhg==
X-Received: by 2002:a7b:c8d6:: with SMTP id f22mr3519152wml.173.1569936223907;
        Tue, 01 Oct 2019 06:23:43 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id o22sm41847990wra.96.2019.10.01.06.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 06:23:43 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jens Axboe <axboe@kernel.dk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/3] tegra: use regulator_bulk_set_supply_names()
Date:   Tue,  1 Oct 2019 15:23:30 +0200
Message-Id: <20191001132333.20146-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The regulator_bulk_set_supply_names() helper was merged upstream. Use it
in a couple tegra drivers.

Bartosz Golaszewski (3):
  ahci: tegra: use regulator_bulk_set_supply_names()
  phy: tegra: use regulator_bulk_set_supply_names()
  usb: host: xhci-tegra: use regulator_bulk_set_supply_names()

 drivers/ata/ahci_tegra.c      | 6 +++---
 drivers/phy/tegra/xusb.c      | 6 +++---
 drivers/usb/host/xhci-tegra.c | 5 +++--
 3 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.23.0

