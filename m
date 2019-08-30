Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAC1FA30AF
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2019 09:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbfH3HRv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Aug 2019 03:17:51 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44260 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfH3HRv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Aug 2019 03:17:51 -0400
Received: by mail-wr1-f66.google.com with SMTP id b6so3061069wrv.11
        for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2019 00:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FpbAWeVajE7jbJxx72Z5QEPjasF1SzZQc9KND43zWKM=;
        b=NPaPVEvAlEP1JwwBNRmZqQu1oXjgq7Ehu6IWBk/Gm3+47TQiElN7qNOrM8NdxNJUuY
         8DW4Wrl4pGsO/FwXlQ28jwaPDg7vIjLNOf6/dDceSHDcw6t452DKc72rkFpL5vLXJw9z
         bxHQsUHERyRczWxhfjNaoEdhqrFm0OuM17Ek+8MIkp8+MW8aItdbwahIw5ASVWUERoje
         SwmdYGGcXSqH9DUAZTxDfsiQXxXy7TqNKuA2PQ0SCakmDuySWzcw8FZO4n6cncx/pLlD
         C0nd8nKnnjLOle0TdsfC5KolLs4Sn9BaEX2McZqo6rx0UpNcxTGCy7z79ZyOK6OAyP7C
         bcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FpbAWeVajE7jbJxx72Z5QEPjasF1SzZQc9KND43zWKM=;
        b=nz5mFghwAHXKlwjJhJlkWFVdjB2CUPBESoLvkZjPiHKD7jto+EHT/Iu777UF0KQkLF
         Tsfpxnhy1/q7O4h4ReSU54yTQkaA5hisU85v+Insx1Eu1zzSjT+hoAe2VSrK/i2KHeZE
         /GnPbKycGQR/WxucN+b+zHRksvfzj7jHd9xkStRo19cn9t8SYcsAr1lZp5joAxgokuzd
         JLpQGF8Jq2Aq5M/3cpdRFhB5u8feRDSi5Kasl9EsJNBJBAnC+aI5L4u46xI2xDaXe/hD
         kFn9qui4XGa+9myBIj9r5bmvR97TiB2T62CUzfsD5j2aFFxdkRU3msBzps/QmmUrc9zO
         lcaA==
X-Gm-Message-State: APjAAAXAhUh5DidbRWIXdUBFqdS2dfIljIzMNDiaMIENjwp+ytcw3OoA
        Y0fstL5JXx1NHNzxXCwsNdevWg==
X-Google-Smtp-Source: APXvYqytZc9V3iUoascFuNBlkNrDdlZGsMbx4k8y04BWHaakkVhzfSq61JeOcecviPSZKeU4s3zm4w==
X-Received: by 2002:adf:aa85:: with SMTP id h5mr4534823wrc.329.1567149469792;
        Fri, 30 Aug 2019 00:17:49 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id x6sm7637529wrt.63.2019.08.30.00.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 00:17:49 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jens Axboe <axboe@kernel.dk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/4] regulator: add and use a helper for setting supply names
Date:   Fri, 30 Aug 2019 09:17:36 +0200
Message-Id: <20190830071740.4267-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There are ~80 users of regulator bulk APIs that set the supply names
in a for loop before using the bulk helpers.

This series proposes to add a helper function for setting supply names
and uses it in a couple tegra drivers. If accepted: a coccinelle script
should be easy to develop that would address this in other drivers.

Bartosz Golaszewski (4):
  regulator: provide regulator_bulk_set_supply_names()
  ahci: tegra: use regulator_bulk_set_supply_names()
  phy: tegra: use regulator_bulk_set_supply_names()
  usb: host: xhci-tegra: use regulator_bulk_set_supply_names()

 drivers/ata/ahci_tegra.c           |  6 +++---
 drivers/phy/tegra/xusb.c           |  6 +++---
 drivers/regulator/helpers.c        | 21 +++++++++++++++++++++
 drivers/usb/host/xhci-tegra.c      |  5 +++--
 include/linux/regulator/consumer.h | 12 ++++++++++++
 5 files changed, 42 insertions(+), 8 deletions(-)

-- 
2.21.0

