Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 701154CEDDD
	for <lists+linux-usb@lfdr.de>; Sun,  6 Mar 2022 21:59:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbiCFVAr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Mar 2022 16:00:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbiCFVAq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 16:00:46 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C77326AD3
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 12:59:53 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id w4so14808103edc.7
        for <linux-usb@vger.kernel.org>; Sun, 06 Mar 2022 12:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=plQqywW49Fl/a6AW4mMf+FOFbqVTdp6ARZoJyCX2GbQ=;
        b=pyf8UTIJsWA+ucGrY+KUNwNtKPQjOc9Hz2l8gvRwnOjJZTw6rL3lK2tJh7hqbEKTaP
         quYPBjdRttuSzlHkKGXRBssMxWRJsoZo6mDKthLoIMF9CyoZncM3ox3UA7CiYTJNx75W
         cv86bMsHf6DUoNL9QSn+RA/YgjyQ8LiNS1fcGF/qliPwGA1YWkl4rymH2XKZj9hFYG7m
         ag0zQIFuedOUsUXZ2/zdJeL/PTvO/ZMa2LXlbToHbHrfpDZPnRkyPdC6TzgKtJpkFx13
         exK9bT2tu7AU4PuXMUOWwDJR6h5dLZ4KKSePPRnW/k8dDQRz1zVY6a8ICCe9YJAkuTLV
         osvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=plQqywW49Fl/a6AW4mMf+FOFbqVTdp6ARZoJyCX2GbQ=;
        b=ZKTq3eiyxuVZB4ORLXHG/JvEEBNhOIt+D0jbSih/qEMLVQPfJ2yJ9Lqv+uvDTi1OTS
         1pD42cu5Fq8qoRKoT5zRFHwF3/Ou1kJkboaw0J/zr9ydJYn1Zblm7FM9kt1OQ4kDcp/Q
         HwVPEgpke45vCuCGu0VBA2DIgjnjBbUNDf3t7B3pC9Ht1H1y5jKg4S0pkcjW06t9Koon
         UMqi84BbiaX6PiSSSf3tJios6t0qyH/Z64ju+w6Xg/uFsYi+W8jdNC8gUi7Cw3wcs5Jk
         MR2OcBADUf/LYKiWeBNUqimO6iLFDIzs0Pdxq6/zV9hscMtKQrFlzTySWb0v1aaxWA1u
         0wPA==
X-Gm-Message-State: AOAM531joxAzwnQom1OR3lg3rCyedD2sYOPbytJLQQqpVEcf17Ju9BZO
        5uv4JoQMEsBPLo9D/6cSIBU=
X-Google-Smtp-Source: ABdhPJyD2Vnhs2/E6VZbpv0keAUS4N9MYGqt0FD6DHxNxbOlqv44QyIE5wz4xtjeHsAkRqRhobvbXA==
X-Received: by 2002:a05:6402:1b90:b0:415:d7d0:d9bf with SMTP id cc16-20020a0564021b9000b00415d7d0d9bfmr8266435edb.17.1646600391623;
        Sun, 06 Mar 2022 12:59:51 -0800 (PST)
Received: from ?IPV6:2a01:c22:7720:f200:e6:1827:dd9f:3c0c? (dynamic-2a01-0c22-7720-f200-00e6-1827-dd9f-3c0c.c22.pool.telefonica.de. [2a01:c22:7720:f200:e6:1827:dd9f:3c0c])
        by smtp.googlemail.com with ESMTPSA id h8-20020a50ed88000000b004160630c980sm3557997edr.62.2022.03.06.12.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Mar 2022 12:59:50 -0800 (PST)
Message-ID: <a3c178c9-7c33-d7b8-9f6e-734dc28728ab@gmail.com>
Date:   Sun, 6 Mar 2022 21:59:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] usb: dwc3-meson-g12a: constify drvdata structs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Constify the drvdata structs. This also matches the definition of
member drvdata in dwc3_meson_g12a.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index bd814df3b..b282ad0e6 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -188,7 +188,7 @@ static int dwc3_meson_gxl_usb_post_init(struct dwc3_meson_g12a *priv);
  * reset to recover usage of the port.
  */
 
-static struct dwc3_meson_g12a_drvdata gxl_drvdata = {
+static const struct dwc3_meson_g12a_drvdata gxl_drvdata = {
 	.otg_switch_supported = true,
 	.otg_phy_host_port_disable = true,
 	.clks = meson_gxl_clocks,
@@ -202,7 +202,7 @@ static struct dwc3_meson_g12a_drvdata gxl_drvdata = {
 	.usb_post_init = dwc3_meson_gxl_usb_post_init,
 };
 
-static struct dwc3_meson_g12a_drvdata gxm_drvdata = {
+static const struct dwc3_meson_g12a_drvdata gxm_drvdata = {
 	.otg_switch_supported = true,
 	.otg_phy_host_port_disable = true,
 	.clks = meson_gxl_clocks,
@@ -216,7 +216,7 @@ static struct dwc3_meson_g12a_drvdata gxm_drvdata = {
 	.usb_post_init = dwc3_meson_gxl_usb_post_init,
 };
 
-static struct dwc3_meson_g12a_drvdata axg_drvdata = {
+static const struct dwc3_meson_g12a_drvdata axg_drvdata = {
 	.otg_switch_supported = true,
 	.clks = meson_gxl_clocks,
 	.num_clks = ARRAY_SIZE(meson_gxl_clocks),
@@ -229,7 +229,7 @@ static struct dwc3_meson_g12a_drvdata axg_drvdata = {
 	.usb_post_init = dwc3_meson_gxl_usb_post_init,
 };
 
-static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
+static const struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.otg_switch_supported = true,
 	.clks = meson_g12a_clocks,
 	.num_clks = ARRAY_SIZE(meson_g12a_clocks),
@@ -241,7 +241,7 @@ static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.usb_init = dwc3_meson_g12a_usb_init,
 };
 
-static struct dwc3_meson_g12a_drvdata a1_drvdata = {
+static const struct dwc3_meson_g12a_drvdata a1_drvdata = {
 	.otg_switch_supported = false,
 	.clks = meson_a1_clocks,
 	.num_clks = ARRAY_SIZE(meson_a1_clocks),
-- 
2.35.1

