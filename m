Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84CB76686CC
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jan 2023 23:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240623AbjALWW7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Jan 2023 17:22:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240416AbjALWWj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Jan 2023 17:22:39 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8611869A
        for <linux-usb@vger.kernel.org>; Thu, 12 Jan 2023 14:16:20 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id 141so13776966pgc.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Jan 2023 14:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QGhHJVbzLQd0GesoU/hL3GlEfg47qZVAEKWQkmB7laM=;
        b=iy/oF9SD9ZVgH/AexFVr9sY3eB/gQIexg5CxAG+6NgIwr7bsGfaehW3siLiPOlsEpg
         LBaRGB+f7ghihju+lIqxQGxnMSnoVwizV92xwK7t2FqyKBUUfZrM2iBbRx62rIze95Nb
         WHjC5bFxWgXQaRfrsWbtR1MkGd7MqITZXMEUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGhHJVbzLQd0GesoU/hL3GlEfg47qZVAEKWQkmB7laM=;
        b=Biur4c5i+u2yB5U8ROqkamiD/F0JOR1Mg5aW/xSctdjhA30xkizNRP41fmx1RRKfIQ
         /gtdUJ1eJopuqxHT9fNUKWi9aBCHmw0t3/hV9A6RKxb9ao9diNuhwNrQTe0csEFGRozn
         ZGo/tbeAfMhHs238zugPWs2iewFJ6eqGJp1P8PYDfLZs0T9aCRd9QeGW3qe5jlJplZiI
         URlqrxw/cvrYRjt/dGDz+2X6eHwCqzmlKIv/G4iVPqX3mpJ7O1g9ZujvCl7xBuVBUgqx
         JFNBTaaHLF4SClt+V8xqWaAfcrkGgfPXXhldVCNbEjRzYX06dEbbRxs81jQRkgV9Vwxf
         6iFg==
X-Gm-Message-State: AFqh2kp82tXfhz4gdIdKaPT/UiXXFwC6lb1IDi2nEt+J2yzQzjAbFhFf
        Z9Mfcg5NK1IQ/bW7dBfnCFpWpw==
X-Google-Smtp-Source: AMrXdXujDfTwMKvjVqf14H0DNRGOHXKXjfzghMDmp0bxMIc5txPi9nb6YcOnDzFrXSlwxFQ/IGE2yA==
X-Received: by 2002:a62:6102:0:b0:578:3bc0:57d7 with SMTP id v2-20020a626102000000b005783bc057d7mr72602961pfb.13.1673561779847;
        Thu, 12 Jan 2023 14:16:19 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id d191-20020a621dc8000000b0058193135f6bsm12330658pfd.84.2023.01.12.14.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 14:16:19 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     bleung@chromium.org, heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/3] usb: typec: Add retimer support to bus code
Date:   Thu, 12 Jan 2023 22:16:05 +0000
Message-Id: <20230112221609.540754-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
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

This is a short series which introduces retimer control to Type-C bus
code, chiefly in the context of alternate mode drivers.

Patch 1/3 adds retimer handles to the altmode struct.

Patch 2/3 introduces a wrapper where all Type-C switch commands can be
placed; this is a foundation patch for Patch 3/3. No functional changes
are introduced by this patch.

Patch 3/3 introduces the typec_retimer_set() call to the switch wrapper.

Prashant Malani (3):
  usb: typec: Add retimer handle to port altmode
  usb: typec: Add wrapper for bus switch set code
  usb: typec: Make bus switch code retimer-aware

 drivers/usb/typec/bus.c     | 33 +++++++++++++++++++++++++++++++--
 drivers/usb/typec/bus.h     |  2 ++
 drivers/usb/typec/class.c   | 15 +++++++++++++--
 drivers/usb/typec/retimer.h |  2 +-
 4 files changed, 47 insertions(+), 5 deletions(-)

-- 
2.39.0.314.g84b9a713c41-goog

