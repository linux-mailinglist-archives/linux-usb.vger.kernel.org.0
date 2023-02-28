Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95F776A5ECB
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 19:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjB1S32 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 13:29:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjB1S3W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 13:29:22 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 912E8196B8;
        Tue, 28 Feb 2023 10:29:16 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id s20so14382941lfb.11;
        Tue, 28 Feb 2023 10:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2bcj08kC8o+4SUDaeyJMOeT0BhDelLKMnxoq17lWA6A=;
        b=jbqod5Hwc2207VPo/RmCWkoc5DUb0QdmOzP7+6TC/xZwfkaxUA9IAP8fb/v28IWhJ7
         FDrGEAdiw1quhlwDLYVt7yrWT3XcC5UikIBj7Lk4m5AQLVs7zjOWv4S2w66SUgAu42e8
         2mtOK8bMrFaJaRcP8aEXXPxp35nm+LfKJpmOdGgaieDvXmQaanm2x9x9FsG8K8ZfAz6w
         9ldIs8Y2crfBrbYjAAB2nF1EPm6iNTpIYvM5Ixlks3XYNxkBQbm4M1wVGvy4+ZwMV2mK
         aruOPTeKVF34l3UHebPFdAxbd8o85nHnk1uEvnVKxrmugo0oH5hUepUwt9D36NH+eL44
         nysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bcj08kC8o+4SUDaeyJMOeT0BhDelLKMnxoq17lWA6A=;
        b=nq9PCAH/a/1UMlS95t+gH6n5nLZUqSaUv62XmTgt69u8C6Yc1mVZBi7nWEZS2jSX4a
         pTUXB7pjVJ/3yTxjx7pRsBUvP6yv7IvRT+9GaVb1uIYFnyV5279qOJcg7o08pP5hkGTT
         6d54KpPKK1d87tTwkd81K8iO3q9pvGWIISoRHyNlvKTJ1gcsP4uvBIudPTXU8a9MSPDp
         woQzxFcpjlSyjetP7mvZbOFO+2Vq3mj/tzsVEmzT6sRIB18JAZQOAbIeirLhPyJpSEhv
         xEAZsw0D6VDLyBCBU/dTBtI/IygNrOTDEE6Jx9jZKQIzSw9RcEr6Cz/vFOcuUqp3wlTT
         cloQ==
X-Gm-Message-State: AO0yUKVFbvW0Uy78pOffe/pz7rbPq62sYl6MapdDN1CV3xi3JrvklVyj
        9t764bPdYws6Oc9EuQPLPBw=
X-Google-Smtp-Source: AK7set/PnVvN2etmwgDXApp9AUtI1xupmxkTln6PG8xGU/GVTbwpXUCaeqe0dISnCkhiyXP+opxijA==
X-Received: by 2002:ac2:4c0d:0:b0:4d8:6e2b:10cc with SMTP id t13-20020ac24c0d000000b004d86e2b10ccmr838158lfq.10.1677608954702;
        Tue, 28 Feb 2023 10:29:14 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id q19-20020a19a413000000b004b53eb60e3csm1414487lfc.256.2023.02.28.10.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 10:29:13 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: usb: usb-device: make "compatible" optional
Date:   Tue, 28 Feb 2023 19:29:09 +0100
Message-Id: <20230228182909.1011-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Rafał Miłecki <rafal@milecki.pl>

This binding was originally meant to describe hard-wired USB devices but
in some situations we need to describe USB ports. That is needed e.g. if
USB port is meant to be used as a trigger source but it can have any
device plugged. It's a common case for home routers which have USB ports
(with no hard-wired devices) and USB LEDs to indicate ports state.

There is no point (and no easy way) to add separate binding covering
just USB ports. Adjust existing devices binding to allow describing
ports.

This fixes:
arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dtb: usb@21000: port@1: 'compatible' is a required property
        From schema: Documentation/devicetree/bindings/usb/generic-ehci.yaml
arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dtb: usb@21000: port@2: 'compatible' is a required property
        From schema: Documentation/devicetree/bindings/usb/generic-ehci.yaml
arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dtb: usb@21000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'port@1', 'port@2' were unexpected)
        From schema: Documentation/devicetree/bindings/usb/generic-ehci.yaml
arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dtb: usb@22000: port@1: 'compatible' is a required property
        From schema: Documentation/devicetree/bindings/usb/generic-ohci.yaml
arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dtb: usb@22000: port@2: 'compatible' is a required property
        From schema: Documentation/devicetree/bindings/usb/generic-ohci.yaml
arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'port@1', 'port@2' were unexpected)
        From schema: Documentation/devicetree/bindings/usb/generic-ohci.yaml
arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dtb: usb@23000: port@1: 'compatible' is a required property
        From schema: Documentation/devicetree/bindings/usb/generic-xhci.yaml
arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'phy-names', 'phys', 'port@1' were unexpected)
        From schema: Documentation/devicetree/bindings/usb/generic-xhci.yaml

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
I tried to add USB port binding but it didn't work because of $nodename.
Rob suggested to just make "compatible" optional:
[PATCH robh next] dt-bindings: usb: add USB controller port
https://www.spinics.net/lists/linux-usb/msg209553.html
---
 Documentation/devicetree/bindings/usb/usb-device.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
index 7a771125ec76..da890ee60ce6 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -76,7 +76,6 @@ patternProperties:
         maxItems: 1
 
 required:
-  - compatible
   - reg
 
 additionalProperties: true
-- 
2.34.1

