Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D89156D6B0
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jul 2022 09:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiGKHXk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jul 2022 03:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiGKHXj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jul 2022 03:23:39 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 810291113
        for <linux-usb@vger.kernel.org>; Mon, 11 Jul 2022 00:23:38 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id y14-20020a17090a644e00b001ef775f7118so7478154pjm.2
        for <linux-usb@vger.kernel.org>; Mon, 11 Jul 2022 00:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MEJ/hqMimN4a6BWdX8wrAtk4YGGTAOomy2QG8zFa0Sk=;
        b=JsBNDLxSiQKyWMztSLBCTECeA3K1onS/X+Stsxf7Hb//MaIFXVG2xcGNGgWHsbkwR8
         DcTU2AyCw7pBv1WZapTZq9nDE4n5r33uwAui5FNB7yGgBxD/rcjMot+dAN35rIl15hJT
         oO0f28H1G2AZyql3cE4wKDCUrGiyxPjRwErpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MEJ/hqMimN4a6BWdX8wrAtk4YGGTAOomy2QG8zFa0Sk=;
        b=RVdf9IHCu9hkBMX/FZVJWMilwcpm24f8wcfqwswdzztTcBTYgWyjT9pclWEnZ8rct2
         zebPAYtF2okGMKur31Sdh39qixg7NxrrW+9if9OeHyH+AzBpLgr+tUZcHQvlpJLwVjmH
         Qiyug8vcq4WcRxeWeeWr8/wTtoZpFXHvSTC9k8tsMeVRQgDoRbMsXeEzDEdMGW1Up3OB
         Jo2GhOx/ELOTG7+9r3/vbpkRqZ//Q92ySNyH6JWtI2axReufvLzeJPgwToj8WT5nHIbU
         IoLSsSiOXCDLG4M7GzREZVPAUr8dBH0fyoMrRV1NFoKNiarqAnCJjHFpXt/aInGVnUYg
         wUpQ==
X-Gm-Message-State: AJIora/ApcuC95F7PIvnsaiNBKlQrEN1KlJiYiaNfheZa8LXdqz09Zd4
        mzeUXmYfze/the8fw4Zzh4IHmA==
X-Google-Smtp-Source: AGRyM1u1WXLZ9QcxqwlVQlitWLXmlWLZbo7OYjJCN2WotXPOMB3vzYDRgczBBfFtt6CC997VjU8CVA==
X-Received: by 2002:a17:90b:1c12:b0:1f0:2836:7799 with SMTP id oc18-20020a17090b1c1200b001f028367799mr9190065pjb.139.1657524217972;
        Mon, 11 Jul 2022 00:23:37 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id z8-20020aa79e48000000b0051bc5f4df1csm4012839pfq.154.2022.07.11.00.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 00:23:37 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        chrome-platform@lists.linux.dev
Cc:     bleung@chromium.org, heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>,
        Daisuke Nojiri <dnojiri@chromium.org>,
        "Dustin L. Howett" <dustin@howett.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v4 0/9] Type-C switch driver and Type-C framework updates
Date:   Mon, 11 Jul 2022 07:22:54 +0000
Message-Id: <20220711072333.2064341-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series introduces a retimer class to the USB Type-C framework,
It also introduces a Chrome EC (Embedded Controller) switch driver which
registers the aforementioned retimer switches as well as mode-switches.

Patch 1 and 2 introduce the retimer class and associated functions to
the Type-C common code.

Patches 3-7 add the cros-typec-switch driver.

Patches 8-9 update cros-ec-typec to get and use retimer switch handles.

Submission suggestion (as always, open to better suggestions):
- Patch 1 and 2 can go through the USB repo.
- Patch 3-9 can go through the chrome-platform repo. Since they depend
  on patches 1 and 2, we can create an "topic branch" off of usb-next
  once Patch 1 and 2 are submitted, and then apply Patches 3-9 on top
  of that "topic branch" before merging it back into chrome-platform's
  for-next branch

v3: https://lore.kernel.org/linux-usb/20220707222045.1415417-1-pmalani@chromium.org/

Changes since v3:
- Updated Commit message of Patch 1 to mention that no new
  class-specific sysfs files are being created.

Changes since v2:
- Fixed missing "static" declarations, and removed newlines from
  function signatures.

Changes since v1:
- Changed class name and retimer device type name, and fixed
  retimer reference release issue.

Prashant Malani (9):
  usb: typec: Add support for retimers
  usb: typec: Add retimer handle to port
  platform/chrome: Add Type-C mux set command definitions
  platform/chrome: cros_typec_switch: Add switch driver
  platform/chrome: cros_typec_switch: Set EC retimer
  platform/chrome: cros_typec_switch: Add event check
  platform/chrome: cros_typec_switch: Register mode switches
  platform/chrome: cros_ec_typec: Cleanup switch handle return paths
  platform/chrome: cros_ec_typec: Get retimer handle

 MAINTAINERS                                   |   1 +
 drivers/platform/chrome/Kconfig               |  11 +
 drivers/platform/chrome/Makefile              |   1 +
 drivers/platform/chrome/cros_ec_typec.c       |  50 ++-
 drivers/platform/chrome/cros_typec_switch.c   | 332 ++++++++++++++++++
 drivers/usb/typec/Makefile                    |   2 +-
 drivers/usb/typec/class.c                     |  18 +-
 drivers/usb/typec/class.h                     |   2 +
 drivers/usb/typec/retimer.c                   | 168 +++++++++
 drivers/usb/typec/retimer.h                   |  15 +
 .../linux/platform_data/cros_ec_commands.h    |  18 +
 include/linux/usb/typec_retimer.h             |  45 +++
 12 files changed, 654 insertions(+), 9 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_typec_switch.c
 create mode 100644 drivers/usb/typec/retimer.c
 create mode 100644 drivers/usb/typec/retimer.h
 create mode 100644 include/linux/usb/typec_retimer.h

-- 
2.37.0.144.g8ac04bfd2-goog

