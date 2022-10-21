Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B79760789A
	for <lists+linux-usb@lfdr.de>; Fri, 21 Oct 2022 15:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbiJUNiK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Oct 2022 09:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbiJUNiI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Oct 2022 09:38:08 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 721FB275198
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 06:38:06 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id b4so4940948wrs.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 06:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UbUGLzx95uGCyDlhKABUDk0TwFKBK1rRFm9Lq1bvWhQ=;
        b=Cztud/XNPRfILkeYrDGH7fD8D/44agAxp7x2SuaOpkBbOzEm6vowqmYgkH9gRN8SqA
         KXTP5EooRHITXkNczVUXmVGX0rB4DmcteoTH3TdIMK8RcY6G5bkyXWnMb7ADnVLkmeq8
         N9XNz2l2tmiwNlyFHz1FFxVKOmYSTeMLrtGqs7TwTEchbAJ/rVmxqMqt1cU1PLrNx6rN
         T3lM6BneGF/FoKJuZUXw5qP5M/o9Vj5O8xiT4NThcFernyw0cj5aha9bvCprmpFEslc3
         61ye4j09ZLyS5AvzUaOqtFHAPWq8qMvP94x5xP8n/73306oLNumKYfgG64lbRXcUWSGZ
         FkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbUGLzx95uGCyDlhKABUDk0TwFKBK1rRFm9Lq1bvWhQ=;
        b=DiFaFFiETwCqs2XSa2kWD6DfYZgNyxwGp5mdeZVoiwf17fPYBCw5xpnRq5bQlj9YdV
         rJFkIOVW5+5uDuglgGSRTT2yiWvjBEx8UoIZ46ontj7h20kFaHDB0Ls5v06bcB7jx425
         a/UCBnWc2syuqJ7dXjtmZ5OTbmH5WL7LvxxI9ei5veA4U4b2vqXVljo9tBHBTe68ja7m
         xW7bpV7uYsgqq10mAWb5gKZ/HIKE7YmHKoGoP5RWzMoPb6vuo+fft9KIQxpE00Dd1OYr
         ehf7g6cNt1YJk5JyABe4h2JOhKYgnDk2BtFb8lG8EZlj4h2jOVbca+JycVI+tZgs7Rrn
         qO3Q==
X-Gm-Message-State: ACrzQf2xGqdVg/wzl7wPG0Kpg9fw/RqcXRBzxp1vPxH73Qo9cp89mTJo
        DWcIV0QwTWJ6pQpKD/xAyXpv6A==
X-Google-Smtp-Source: AMsMyM7qEGEFybZQ/s1vwsv5EnaCGOXvocUhKwgK8vrYIiDHjtFPPAIasFVplw2SF1mw3CbgefYa2w==
X-Received: by 2002:a5d:42c7:0:b0:236:4ddd:3576 with SMTP id t7-20020a5d42c7000000b002364ddd3576mr4144203wrr.289.1666359485075;
        Fri, 21 Oct 2022 06:38:05 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id l35-20020a05600c1d2300b003b477532e66sm10462313wms.2.2022.10.21.06.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:38:04 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        neil.armstrong@linaro.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 0/2] usb: serial: add support for CH348
Date:   Fri, 21 Oct 2022 13:37:56 +0000
Message-Id: <20221021133758.1881904-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello

The CH348 is an octo serial to USB adapter.
The following patch adds a driver for supporting it.
Since there is no public datasheet, unfortunatly it remains some magic values.

It was tested with a large range of baud from 1200 to 1500000 and used with
success in one of our kernel CI testlab.

Regards

Changes since v1:
- use a data structure for encoding/decoding messages.
- check if needed endpoints exists
- fix URB leak in ch348_allocate_status_read error case
- test for maximum baud rate as stated by datasheet

Corentin Labbe (2):
  usb: serial: add support for CH348
  usb: serial: add myself as maintainer of CH348

 MAINTAINERS                 |   5 +
 drivers/usb/serial/Kconfig  |   9 +
 drivers/usb/serial/Makefile |   1 +
 drivers/usb/serial/ch348.c  | 738 ++++++++++++++++++++++++++++++++++++
 4 files changed, 753 insertions(+)
 create mode 100644 drivers/usb/serial/ch348.c

-- 
2.37.4

