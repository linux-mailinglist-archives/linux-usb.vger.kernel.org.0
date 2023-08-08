Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D60A77420B
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 19:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234713AbjHHRcp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 13:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234626AbjHHRbu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 13:31:50 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645E97ED3
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 09:13:48 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fe4cdb72b9so31217325e9.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Aug 2023 09:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691511200; x=1692116000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKTM65Hk6mGoUuD04O4aN5AQ3hEPhlqNZbHsqhxOlFc=;
        b=QGeAp9bM8QDClzlyLAomcV8NbeEkiYUVnPxu6iIgrHVc15Mpn5V/XTnCWPFYcGwrGj
         E1Ej3HeBruvfH+2wAh5DkT820ptpXNfK6gRjvdwfTCjiUODwMnaKkSs6PDpp4zI+tsrr
         zh9+B3EPF3nsGAAXldGhLHamc/vuVvkaPdzgUjT5kxoX2uoOBHTvrRSihZhb6NqlreWg
         0no0oDUICwP0VdgJ2zspFjJHMAnSqzdy6Tv7l2VasjvJ0pFHD9FNO9YqmfZUzG9L/B0n
         IEEBTZzHtosm7XDao2W7DH/mo51i2iHlpwkg1BVpiu9OzUIsC3uj77ETR609zutbVpyN
         JW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511200; x=1692116000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKTM65Hk6mGoUuD04O4aN5AQ3hEPhlqNZbHsqhxOlFc=;
        b=QsKVUnn2P+WiZExZpJgwWqb9+kaRid1K5zSMKanRwEvkMLZLxbdj38RK5HHtYMTpdl
         MNYsw5vLTlBZJCtKunQwzKTOqL5K2Vp74LWnFihOTlFQNnoRuSZye9SJ6jhZrWG0TcKq
         mqME8+w4vNd8jwtFRV/MzSqfH1XG+iOiMUeQynpp15NCafTQ2LLf8Itqk1jR1qobS6xc
         n0tAHnNnMn/75G7wRfQfmGdMhjHRB3hsjkKLR9W7UrpKpt4njP/j83BUJFpv2vtcddP6
         ENaUc2VVivS+jgqa89xsScgFsFWXwHTzA9J+dBJ49w/zZ2SiKre+2HYBOMirq+aiQ6fj
         sugg==
X-Gm-Message-State: AOJu0Yxv4kvr4o1UOgBZOAZQHV7Kgc0E08/lymF18kxa5qEvp7SOPjyq
        E7jk+3F5D4kYdfE4FF2G3wTcEWgqiyy6biKJZE8=
X-Google-Smtp-Source: AGHT+IHCg6jK5QeAQL7ZbDp7JHMdEJbqOK7NfrBs1E2JWLSE/ov+AA3/Bp6bD/RPcGzaSByaM3IqVA==
X-Received: by 2002:adf:ffc3:0:b0:317:5b99:d3d8 with SMTP id x3-20020adfffc3000000b003175b99d3d8mr7412543wrs.20.1691489280387;
        Tue, 08 Aug 2023 03:08:00 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:efd4:f3df:2c50:1776])
        by smtp.googlemail.com with ESMTPSA id e11-20020a5d500b000000b003143c9beeaesm13109420wrt.44.2023.08.08.03.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 03:08:00 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, Da Xue <da@libre.computer>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] usb: misc: onboard_usb_hub: add Genesys Logic gl3510 hub support
Date:   Tue,  8 Aug 2023 12:07:46 +0200
Message-Id: <20230808100746.391365-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230808100746.391365-1-jbrunet@baylibre.com>
References: <20230808100746.391365-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for the gl3510 4 ports USB3.1 hub. This allows to control its
reset pins with a gpio.

No public documentation is available for this hub. Using the same reset
duration as the gl852g which seems OK.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/usb/misc/onboard_usb_hub.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index aca5f50eb0da..4b94ea375d45 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -22,6 +22,10 @@ static const struct onboard_hub_pdata ti_tusb8041_data = {
 	.reset_us = 3000,
 };
 
+static const struct onboard_hub_pdata genesys_gl3510_data = {
+	.reset_us = 50,
+};
+
 static const struct onboard_hub_pdata genesys_gl850g_data = {
 	.reset_us = 3,
 };
@@ -41,6 +45,7 @@ static const struct of_device_id onboard_hub_match[] = {
 	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
 	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
 	{ .compatible = "usb5e3,610", .data = &genesys_gl852g_data, },
+	{ .compatible = "usb5e3,626", .data = &genesys_gl3510_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
-- 
2.40.1

