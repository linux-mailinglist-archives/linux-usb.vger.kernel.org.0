Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA1A76197DB
	for <lists+linux-usb@lfdr.de>; Fri,  4 Nov 2022 14:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231837AbiKDN2h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Nov 2022 09:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231844AbiKDN10 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Nov 2022 09:27:26 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B221A303C4
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 06:25:43 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so8197261pjk.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Nov 2022 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NOTt+uWk2ZToNMGO7O1EdD6mnGN+67PDaHwyai6cOo4=;
        b=LWtUeYEpcNvhKSMeUpw3oh4EeJqjbHi+ZcU0Tye+R2fwSdRopXwABAwLHyVZ6yhSQr
         4467oe7efnlbhp3xX1cQ4GRITJz96GqiOh6gRBSYTuqYT9LIF4Sj3cmqPlmpgoTu98Td
         f6XxqnLI0rFKx7+SIZ88+RD89AMcuCZmUQW7oJg40MXULr9Jp2hGJdGoB2m2GM5/RXes
         9w+Xh6xw6X4B3FSKFDvK930rNQdfroCOe06qIgqS72Es3gsalcqOAmqIN4otwq4S7eG5
         59kIRVK0VfbN0v1jFOZKIxSE5lGQ5n16Rse16YAYxh4TE+Usu4B7RFJWfBnVDOWNiXYH
         gGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOTt+uWk2ZToNMGO7O1EdD6mnGN+67PDaHwyai6cOo4=;
        b=mEH5sxuJQC7SgS05w4MqDKfYbkravRyfWtizNuXrnXDm6mgG5gTdWLsMCRwXG5LYuu
         3X5r66wo4GlUMqU2DxUE0iGmO46LzOPW6U+Ag8G04uz2ic6n8lCA0AMwCO6DRRb6BUBx
         xYEJO6+IhkP/VcuuulPOvW7BTWk5IPwN7a6gcEX/Dj8Xpqw6xuB4QIGOF05ydKwxGFpw
         EtBl2MoWkNtQa68ns500CofnZLSF8O9vkj5kotPT76WHXjhU2auyAFVWF23jbRAgQSmx
         E+0JNQNHJaoBkKS3YUsWhCWO3M5QkqmHskKkOgin9nvGFRJS/ANhlrvNATsLHnvf4n8y
         uHOg==
X-Gm-Message-State: ACrzQf1iRPUg8+GhGnSSvV5CkgOgjriQ3Uim6qpWFGFUKu1NDICNiTQk
        z6vweMALo7n7h87zzza39I0QrouhHM/B6lHR
X-Google-Smtp-Source: AMsMyM45Hcm2Yo3qy8x/7GP0YMSDO6FImnZNvx69mDQdOW1RoWKBf6WpN5DQ9fgJzLZjdEKsidSUhA==
X-Received: by 2002:a17:902:ecc1:b0:186:b57e:d229 with SMTP id a1-20020a170902ecc100b00186b57ed229mr36215993plh.167.1667568342940;
        Fri, 04 Nov 2022 06:25:42 -0700 (PDT)
Received: from albert-XPS-13-9360.. ([2405:6e00:490:8cdf:ad7d:ac3d:d463:5046])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b0017b264a2d4asm2655828pld.44.2022.11.04.06.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 06:25:42 -0700 (PDT)
From:   Albert Zhou <albert.zhou.50@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, nic_swsd@realtek.com,
        Albert Zhou <albert.zhou.50@gmail.com>
Subject: [PATCH net-next 0/2] Update R8152 module to version 2
Date:   Sat,  5 Nov 2022 00:25:24 +1100
Message-Id: <20221104132526.64530-1-albert.zhou.50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As per my discussion with Greg K H, here is a patch for the updated
R8152 module, version 2, obtained from Realtek website. This is my
first ever patch, I hope it's useful.

Albert Zhou (2):
  Reverse 744d49daf8bd3b17b345c836f2e6f97d49fa6ae8 so that the v2 r8152
    driver can use netif_set_gso_max_*
  Update R8152 module to v2 obtained from the Realtek website, included
    in a comment in r8152.c. The only other modification to r8152.c is
    amending netif_napi_add, see comment for explanation.

 drivers/net/usb/r8152.c               | 17938 +++++++++++++++++++-----
 drivers/net/usb/r8152_compatibility.h |   658 +
 include/linux/netdevice.h             |    21 +
 net/core/dev.h                        |    21 -
 4 files changed, 15151 insertions(+), 3487 deletions(-)
 create mode 100644 drivers/net/usb/r8152_compatibility.h


base-commit: ee6050c8af96bba2f81e8b0793a1fc2f998fcd20
-- 
2.34.1

