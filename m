Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4626E6349C0
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 23:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234134AbiKVWGD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 17:06:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232491AbiKVWGB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 17:06:01 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB3E11A26
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 14:06:01 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id p12so14964177plq.4
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 14:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+rjcB3paNSLnVx7wDun/ydpcrulGpWbgAQ0wZgSMTwc=;
        b=fhVhrAbUQAozQOw3rZzn3le3iR2sZgNc9jsB/pGPrDYoJwzn8AYHaMHq1M+0xLzGsq
         hTBHU8jkcHaq3Vk3j7czc3Cs2VA0ymPvj+TU1OHvh2MN4WuQYe7bLhCrHM+zXJ3y8Cv/
         FrYqzZ4YnQPq6HWoFZjBz95XOxm3gK2egmPPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rjcB3paNSLnVx7wDun/ydpcrulGpWbgAQ0wZgSMTwc=;
        b=IoPGO6Uo0iCiCpE22eBSm2CPCmgDDUXRrg3IRB11Cz4uTAVqdJ9o9gr90/4UokP3Mq
         6XIM7t6tFioYntnAliwjysTRJ2t7M6JK75xbAFKqgkT9eOb3V8WtcDoZZgBQIK6yz6kj
         BfraVMeaYjx1rA4LOf/IS88tSVEMrI7KpjoXf6Ne6gLe5gG7RPmTA1vKwQae7FSCSSB8
         Sblu/k1mPhyxMOJ3Jmm9F9dTmQ7wa7dtFf+fCDY+72QVYE2hhwJle8dYU6bqjLvOYBUF
         +4PShLEIWRXlR1fLhrBai+R7PS5kvIbCo1nnK/MVmTzo+J4oihYGBxI+fQGYzZPuOGSC
         hztA==
X-Gm-Message-State: ANoB5pk3YME1aBoTTvN0ku6t8qwLPSBwf+b0VrA5eik/TzUfneKEWLhz
        P3W7Yr6Y2rSYNNU2UWimIGQspQ==
X-Google-Smtp-Source: AA0mqf4xYcYH7pBUiKBGUWee0mkH+YicFCSXQNr4GbtcvcjPqCUYr09kip6jpZNtWk3hN3Won6aSPA==
X-Received: by 2002:a17:902:ab08:b0:189:dc3:ee83 with SMTP id ik8-20020a170902ab0800b001890dc3ee83mr16773684plb.58.1669154760766;
        Tue, 22 Nov 2022 14:06:00 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id i24-20020a63e458000000b0042988a04bfdsm9640497pgk.9.2022.11.22.14.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 14:06:00 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        chrome-platform@lists.linux.dev
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v2 0/2] platform/chrome: cros_ec_typec: Link PD object to partner
Date:   Tue, 22 Nov 2022 22:05:35 +0000
Message-Id: <20221122220538.2991775-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a short series to link a registered USB PD object to its associated
partner device. This is helpful for userspace services (the ChromeOS Type-C
daemon, for example), to identify which Type-C peripheral a PD object belongs to,
when a uevent for the PD object arrives.

The first patch adds a wrapper to the Type-C class code to register a PD object
with a Type-C partner as its parent. The second patch uses that wrapper to
register the Type-C partner USB PD object in the port driver code.

There was an earlier patch[1] to solve this issue, but it's been jettisoned (on advice from
GregKH) in favor of the current approach.

[1] https://lore.kernel.org/linux-usb/Y3vNZEuNI3CWzZ0L@chromium.org/T/#m7521020f64d878313d7dd79903ec0e9421aa8737

Series submission suggestions (if the approach is OK):
- Patch 1 goes throug the USB tree and Patch 2 goes in the next release cycle
  through the chrome-platform tree.
- Patch 1 and 2 both go through the USB tree.

v1: https://lore.kernel.org/linux-usb/20221121201337.2772216-1-pmalani@chromium.org/

Changes since v1:
- Drop Patch 1 from v1, and instead introduce a new Patch 1 which uses the wrapper
  function suggested by Heikki Krogerus.
- Update Patch 2 to use the new wrapper.

Prashant Malani (2):
  usb: typec: Add partner PD object wrapper
  platform/chrome: cros_ec_typec: Set parent of partner PD object

 drivers/platform/chrome/cros_ec_typec.c |  2 +-
 drivers/usb/typec/class.c               | 19 +++++++++++++++++++
 include/linux/usb/typec.h               |  4 ++++
 3 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.38.1.584.g0f3c55d4c2-goog

