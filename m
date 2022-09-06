Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C96165AE29F
	for <lists+linux-usb@lfdr.de>; Tue,  6 Sep 2022 10:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232989AbiIFIam (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Sep 2022 04:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238938AbiIFIaS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Sep 2022 04:30:18 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85CA41EAC0
        for <linux-usb@vger.kernel.org>; Tue,  6 Sep 2022 01:29:44 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id b5so14276156wrr.5
        for <linux-usb@vger.kernel.org>; Tue, 06 Sep 2022 01:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ag0Y+EQIkm3caOuaKM30n3HJdggDuJOlXZNX6+vxs2w=;
        b=yCtyUBlBUP90Y0r1QmlYqGJtv8wN6AooN8WOUb8meg5h75hG0meajI93vKDLd0jCWA
         xQWhWLdt/tHoPygfyFx4sgy4HqxC82bFA3udMSACii0wElKEohBBzUr8B6zZ7GZ024qR
         QJznxfTAE+H1mK7+DqgSaMNqrzNacAxhOdvAn/ASys1NYFmMKLgjtL+hf2RWNAbMoKvk
         EiK4v7Y79AQdu1qSsXSgAXdmf5qebx5fFRiD7JdiVptiN7NNYq9lWyFWncib3yStmP7V
         l609ONBBhL0GeKeL5cJR0JSfToyKUe3sOEM64PTNH95sEB8M65FRNt93kYtIBIgCy9rv
         0j7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ag0Y+EQIkm3caOuaKM30n3HJdggDuJOlXZNX6+vxs2w=;
        b=EbzSsQ8JzGvIVLquQ9ZHzXTr1tqbezNRXCrNFSuRCLsdGMrilVFnuPfQOKEejPzltn
         MTR+IPGHzqT0X6dzpGCYSj5/mgCFiX1Df8blM8nfFtU1ZYg7cn3xLYi+eZPk++eaCFQI
         lErMoKevR0Hq8shz1yJMrZJ9R+EK0Mdl2b/dQjlPHjxAgt4Y3U0FSOwR10zdP7irYz67
         5ysl8trHRO4rI99HwBBf8GYhwrvQsQNQxg2S/ue7LpynxDqB5TzOep/hwRY8R5gR0FF4
         MObupCQdYGusBWxqAIW/u3PHt9parCBqJMZvXny6oSqGZHdIIfVEL8MPkCUitSf8xzQA
         99iw==
X-Gm-Message-State: ACgBeo05Aug//EXtocBLZjJRXK6XHNq8+u2XGux5y0Ts4+c+RqpwfvBN
        AauNTFA79+0PnDvO2bkHAvZZcQ==
X-Google-Smtp-Source: AA6agR4W39ALx1oiGMIKCCQFM1rTe73Hs5Dvr3lFTkB2BcU9M3YMtVDLFAuW4VDsrLkaL0ANuTtKyg==
X-Received: by 2002:a05:6000:1883:b0:228:5fa8:202e with SMTP id a3-20020a056000188300b002285fa8202emr8213911wri.519.1662452982787;
        Tue, 06 Sep 2022 01:29:42 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id q10-20020adff78a000000b0021e6277bc50sm13752248wrp.36.2022.09.06.01.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 01:29:42 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        neil.armstrong@linaro.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 0/2] usb: serial: add CH348 driver
Date:   Tue,  6 Sep 2022 08:29:32 +0000
Message-Id: <20220906082934.2046584-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
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

Corentin Labbe (2):
  usb: serial: add support for CH348
  usb: serial: add myself as maintainer of ch348

 MAINTAINERS                 |   5 +
 drivers/usb/serial/Kconfig  |   9 +
 drivers/usb/serial/Makefile |   1 +
 drivers/usb/serial/ch348.c  | 709 ++++++++++++++++++++++++++++++++++++
 4 files changed, 724 insertions(+)
 create mode 100644 drivers/usb/serial/ch348.c

-- 
2.35.1

