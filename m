Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EECDB48AADC
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jan 2022 10:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347741AbiAKJxR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jan 2022 04:53:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236654AbiAKJxQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jan 2022 04:53:16 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BBCC06173F
        for <linux-usb@vger.kernel.org>; Tue, 11 Jan 2022 01:53:16 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id h10so21704073wrb.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Jan 2022 01:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hG9rUK4IkVrQ+8ACrhWPxZRakkSjKpRWQoFCkTNn/X8=;
        b=DFFuwIP1QgjMS3n63C11s7si82MBSKADwXDsS6TttMcsW/l7YvB4ym40GSsD2V+znz
         ABi6b5LyWhV0M7JYJCuGU2JJCu6YMwDcP6pDnCAGx17QJxSXaptukJviXcrBGtLVx/xT
         A78CeKN/nP9s3tRxbekgxmuNFJ0BrhKuTEYNYB8UjRPlSz4xw/zhvPqOZoD7ntmFSF45
         Y4pyJuunlxo09nA9LuD9NzGasP+DTw26KFLJsdMNH+Sg1c+IvLPQAuk33JwLqH047A+4
         JB3xwuFQXa65G3sRtEwG0YN6YUrarvT3V51QmKVrt7cwPZe8PXvodzzCvEAwOPSppFg1
         2p3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hG9rUK4IkVrQ+8ACrhWPxZRakkSjKpRWQoFCkTNn/X8=;
        b=Au1DyGWj5V8DSYy+wMJDsGzwBzQVvp7U43zwWRt+U43jgVucYLN8JvuswMXU5rRBmG
         TyWCn7om2U4z8uBVAoUiGixAeZ67/JHbBsb25f0lvOCJvV76d3nG4CB8od+7aTayBq+5
         uYTKt2G0J4BC+qGnWbx0a60XtuysorHk8XDGBOEIT3YAMW5+4kLZxjMY3N1VQaTQsvjY
         VP+8yJaoRazbGfp5fV/MTTRaRXDRVtAA/6Gq/uhwmfvhTvXMacKOY4iNXZuEAZr3D7vg
         /+s4hI/9NDwUo/aeKDJPdWMx2TZTpcBJ0HutCWIFNUdPWgTiJsDZ0J6v78npAC1XL+nB
         avew==
X-Gm-Message-State: AOAM533WhZuoxJFMnuiqj0ZJHiPmK8n3anV5nqbZD/I94JiF7BpX1UQ1
        A5aBgeWgUAzlW1je9BxkAsGh2qyI7UdJ1Q==
X-Google-Smtp-Source: ABdhPJxvFffbttIKz7Na7DPiLiYm3YnyCQTdRoBJ+lM//JF3O1XkLpBPZEnlqZ/8dg6bspbaSdHVAA==
X-Received: by 2002:a5d:6f18:: with SMTP id ay24mr3114077wrb.694.1641894794812;
        Tue, 11 Jan 2022 01:53:14 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net. [78.120.247.203])
        by smtp.googlemail.com with ESMTPSA id l18sm1248916wms.24.2022.01.11.01.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 01:53:14 -0800 (PST)
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
To:     kishon@ti.com
Cc:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        p.zabel@pengutronix.de, balbi@kernel.org, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        vkoul@kernel.org, khilman@baylibre.com
Subject: [PATCH v6 0/3] phy: amlogic: fix shared reset control use
Date:   Tue, 11 Jan 2022 10:52:52 +0100
Message-Id: <20220111095255.176141-1-aouledameur@baylibre.com>
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

changes since v5:
- No changes.

Amjad Ouled-Ameur (3):
  phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
  phy: amlogic: meson8b-usb2: Use dev_err_probe()
  phy: amlogic: meson8b-usb2: fix shared reset control use

 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 5 ++++-
 drivers/phy/amlogic/phy-meson8b-usb2.c   | 9 +++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.25.1

