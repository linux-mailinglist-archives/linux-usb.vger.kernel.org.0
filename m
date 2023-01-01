Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D02EE65ABEB
	for <lists+linux-usb@lfdr.de>; Sun,  1 Jan 2023 23:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbjAAWCC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 Jan 2023 17:02:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbjAAWB5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 Jan 2023 17:01:57 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9F82AC6
        for <linux-usb@vger.kernel.org>; Sun,  1 Jan 2023 14:01:56 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id u9so63092041ejo.0
        for <linux-usb@vger.kernel.org>; Sun, 01 Jan 2023 14:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGuxAnhfIj2x3uYPeVPB/2g8dAYaMTxAZOm/4EaT1sM=;
        b=IHI2I0hrCdk/wPaLBzx0rRhnvxOsyfb1P4hx6+3YwKy0MsZTBke7af+oKvOCzJ3AJb
         cQwc34Z3TntsucXweypdTpoTq7GWnPWgQ9OAEMIFhEnnbKiDeP/gBLQ6agIwH9PiLGaL
         RItHMyit/PzKf3E/Pa8c+HqiMdTRyjfNJ57UsNwNoVKuGiB52ce9A6rSIzOcTnvyJEHM
         VmdB9pviGVtczIS6OUNqJrVdWZ/e5roLSOzZ+Hpz7v3OhSaZ22GHpYMeL0dEq9so4uJh
         9CwmkYfvpmP7hOk/uOcsJePEcUWFoZfhVki7RqPLwBhT8WW7G6Y2FpauX2+JlHawC3EO
         VCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGuxAnhfIj2x3uYPeVPB/2g8dAYaMTxAZOm/4EaT1sM=;
        b=38TfuehXY8o9WBFOG2ofXaG4HH1CVYQatPja+BLkEY0/avaiaLN3jD+2wip51ff1iK
         vZ9MKWYask3uLJtSv4fAINUCiQLQyt+82mFPn2qGUaQbw6odmiCU0wQ5GXoWhKd0K8Bz
         t2vhJ1gkOHaAkQD573M9w2+DSVdWDP76Xqn47X0B/z7lHjVCGgD1avsJNfd5MGahnFco
         8erFdvrcK4JqWEy3g5jdUHvBYc7XDc0E4ioGVPq5o64WOhtnCzPAlU1dgqb13RAllKzZ
         7hNkIM2XSSitDiCXl+uKA57NUW29cpk5T+/rI+BnhrvYhDDteLpFG8CyX0xePs54Dxzm
         DJLA==
X-Gm-Message-State: AFqh2krDLlaTaOQKzDp3Lo/pIS+d/D1SZWw/TYE25zFm80k2APfciIGu
        kG2qVT0GKEz9f7Uzz7g4XEqs1g==
X-Google-Smtp-Source: AMrXdXs32JBof/lpRTYnXmbeljXudDdPP7qoRYzYk7ifPYzymvZflJgDnAUlRfiHkhTC28D9o4gVZw==
X-Received: by 2002:a17:906:6896:b0:7c1:4c46:30a0 with SMTP id n22-20020a170906689600b007c14c4630a0mr35114853ejr.65.1672610515397;
        Sun, 01 Jan 2023 14:01:55 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c23-7c55-d800-0fbe-25d2-487e-ae5c.c23.pool.telefonica.de. [2a01:c23:7c55:d800:fbe:25d2:487e:ae5c])
        by smtp.gmail.com with ESMTPSA id d12-20020a170906304c00b007c17b3a4163sm12486807ejd.15.2023.01.01.14.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 14:01:55 -0800 (PST)
From:   =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        tglx@linutronix.de, maz@kernel.org, lee@kernel.org,
        linus.walleij@linaro.org, matthias.bgg@gmail.com,
        chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org,
        angelogioacchino.delregno@collabora.com,
        allen-kh.cheng@mediatek.com, nfraprado@collabora.com,
        sean.wang@mediatek.com, zhiyong.tao@mediatek.com
Subject: [PATCH v7 3/7] dt-bindings: mfd: syscon: Add mt8365-syscfg
Date:   Sun,  1 Jan 2023 23:01:45 +0100
Message-Id: <20230101220149.3035048-4-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230101220149.3035048-1-bero@baylibre.com>
References: <20230101220149.3035048-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Document Mediatek mt8365-syscfg

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 1b01bd0104316..7beeb0abc4db0 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -50,6 +50,7 @@ properties:
               - marvell,armada-3700-usb2-host-misc
               - mediatek,mt8135-pctl-a-syscfg
               - mediatek,mt8135-pctl-b-syscfg
+              - mediatek,mt8365-syscfg
               - microchip,lan966x-cpu-syscon
               - microchip,sparx5-cpu-syscon
               - mstar,msc313-pmsleep
-- 
2.39.0

