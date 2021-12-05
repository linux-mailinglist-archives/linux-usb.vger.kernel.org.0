Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B4B468D83
	for <lists+linux-usb@lfdr.de>; Sun,  5 Dec 2021 22:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233397AbhLEWC1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Dec 2021 17:02:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhLEWC0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Dec 2021 17:02:26 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C5F7C061714
        for <linux-usb@vger.kernel.org>; Sun,  5 Dec 2021 13:58:59 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id e3so35205548edu.4
        for <linux-usb@vger.kernel.org>; Sun, 05 Dec 2021 13:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BxkF5ybR0sSk2Qc7tg8NydRESBO95j6lxDt9gByhy1g=;
        b=w/G4sML9qUsb7KLbUWLibhRlfiQ80RPjmTxdQ3gAzGDCWFkY393BkGlykTq9AHPlk9
         pvE7QEZ/DkNJ0UiB02hi9PX7jHkeusq6HShRuJhdg2APdxaehEU9ial5VdD2UUvAKL6o
         HamHUMqhHG0k13SElimqCk0AY1ERiXlxfNGW1s0nIcf2MUwShPAb30pzzcx//i07Nznv
         dr0l+mofibJTUpmoM061AXi1E5v8TjQEPV4tvnFzyyUxiW6kYxuaFsDGpY+ZWjEByCc5
         itjRhNzgluXdhKyTbgJvdWAZHsALFhtOnE304y9Nx0StLWh20tY6cixNzJNlKg7yD+xa
         FuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BxkF5ybR0sSk2Qc7tg8NydRESBO95j6lxDt9gByhy1g=;
        b=G0TC1wDpu1b71GPxEpEO+mbXQYGfV+hrlIMdxmDBuAwHE8NAvk9G3nhtEpJ68WUlLd
         fG8RiQb9BcKcBM5CrP7Y20s3lwXf4FiQXPh7RUD0HBikkIiSFyn0GvsGNYs4qgkBm1eI
         UL7FxTy/yLC0d/J6KnCXwpzAWfXJUHg6R4s3FX4twpgWD2JSnI4xW3P0zsDNCTbTlqMS
         IEAH5XZbNISeTeInINtTQ94FDhdIWqisKOoYG/NfdFvrP9K/e581O6Z3L0vqZ9Mu3dS/
         P80BvyjR0dAl413PNXSZTqGyccOhfJ8sWrYu8f/HAQj+SOk9Q5qG7OinO86FR0lLYgcg
         9N3w==
X-Gm-Message-State: AOAM5338aemId9OANTtXHy50VUf1acTdqgw25ujyhDDOys+u1YTVTTZQ
        7XcFb2wIUayuFCOlP4ZyDTCWqw==
X-Google-Smtp-Source: ABdhPJzLotjrC5Ff3Uclo/otA6yvJQAalYclQgEKqqe/Z2wTloRzKQO0F2RjuK9Ctb39xg6oa/xEqQ==
X-Received: by 2002:a17:907:94c7:: with SMTP id dn7mr40207945ejc.470.1638741537718;
        Sun, 05 Dec 2021 13:58:57 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net. [78.120.247.203])
        by smtp.googlemail.com with ESMTPSA id nc29sm5724291ejc.3.2021.12.05.13.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 13:58:57 -0800 (PST)
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
To:     khilman@baylibre.com
Cc:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        p.zabel@pengutronix.de, balbi@kernel.org, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v4 0/3] usb: meson: fix shared reset control use
Date:   Sun,  5 Dec 2021 22:58:43 +0100
Message-Id: <20211205215846.153703-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patchset fixes a usb suspend warning seen on the libretech-cc by
using reset_control_rearm() call of the reset framework API. 
This call allows a reset consummer to release the reset line even when 
just triggered so that it may be triggered again by other reset
consummers.

reset_control_(de)assert() calls are called, in some meson usb drivers, 
on a shared reset line when reset_control_reset has been used. This is not
allowed by the reset framework.

Finally the meson usb drivers are updated to use this new call, which
solves the suspend issue addressed by the previous reverted 
commit 7a410953d1fb ("usb: dwc3: meson-g12a: fix shared reset control
use").

changes since v3:
- Remove unnecessary reset_control_rearm() after reset_control_reset() 
failure.
- Use dev_err_probe().

Amjad Ouled-Ameur (3):
  phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
  phy: amlogic: meson8b-usb2: Use dev_err_probe()
  phy: amlogic: meson8b-usb2: fix shared reset control use

 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 1 +
 drivers/phy/amlogic/phy-meson8b-usb2.c   | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.25.1

