Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB87497139
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jan 2022 12:17:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236346AbiAWLRM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jan 2022 06:17:12 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38438
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236237AbiAWLQz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Jan 2022 06:16:55 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B5C653F4B6
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 11:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936614;
        bh=grI5UfAEDAIP80sPof/wJdxtniWt65JOOqzZgKpwDAo=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=k8VVSXaVZzRHeU++RqQpP6MK+7ZJI972mw5gwv17+HFEKanQU/Sssb9zSL0Ljg6Go
         K1VGwKNSwK+tjtZqAmzzsyMDJ+siSPHofEumkTDvThrR9FmUy3/hS9NFJwm83fYDT6
         ai0JQDmjP/sgSiCdOBjOPXjLirrB1+iOJlXjibI7mwmsbzEOCOu8K405tqZIG4h7la
         /9+AnbygOYJLIEkjsUcQM48lj17wUti6D5NCV8LTkwIbBchWOq5L2Ad0wT/aRaPbK8
         SSneFHH6z2l13IwE2qq9puri9D7FFrbwSrPRa9en05zE5TNgkLMd42nvmBmv8hXDET
         bHPBKSWMAn8Iw==
Received: by mail-wm1-f71.google.com with SMTP id 7-20020a1c1907000000b003471d9bbe8dso6137576wmz.0
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 03:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=grI5UfAEDAIP80sPof/wJdxtniWt65JOOqzZgKpwDAo=;
        b=oEaE0Vw51vfmNMuF9kkpd2khnsY+waVoilzyCAdb3Vd44mZhN40fhUo8zOLXKFJp8r
         piDszEx1dnvarCrDQRiVhisOWILntpvfuumHz9ak6zDa2spd8NPV/TwKdPX0ikjenmdH
         w/uZSv+upST7nySrgka1TRjcJ1VgEO82gRvgFYmSi+swhSAfQUEpErK4Ju8dBuqGtBB4
         lbxr0pw9WXFrvx5B717DTscGcAW80cfo1SKbADJUAfzowXiLN4jgfQr5V6psJJvTGk94
         U6pifogEB//mYvkykBxfGrBeblCc9pWQkCP4YSMgCEryZhbP/3NWTUP3xYDik/wKN54t
         U0bQ==
X-Gm-Message-State: AOAM532pAijPS5MJWtpbUOXizs9lDampah1Qz9qpmhAKIj8/uHicJmz3
        uWekdNFWrPOnTwgNn0XxlJJtI38rAAr9G/uxoAvYhmtx9LdoHqMNIochnWe7Rpvvy+HsgVFL9SS
        LMEcBC9dgR09Hg7l1+dbcr4n4162R+DNw+tKcOA==
X-Received: by 2002:a5d:5887:: with SMTP id n7mr3788127wrf.95.1642936613068;
        Sun, 23 Jan 2022 03:16:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxdELQf6sIqrI/0YVD1AI+KkjLutbJQyLtovsY93KZNKsW7PHRBKT0U90IZXspsKI6wQudDQ==
X-Received: by 2002:a5d:5887:: with SMTP id n7mr3788117wrf.95.1642936612924;
        Sun, 23 Jan 2022 03:16:52 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:16:52 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/12] ARM: dts: exynos: add USB DWC3 supplies to Chromebook Snow
Date:   Sun, 23 Jan 2022 12:16:36 +0100
Message-Id: <20220123111644.25540-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add required voltage regulators for USB DWC3 block on Exynos5250
Chromebook Snow board.  Due to lack of board schematics, use same
regulators as on Arndale board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5250-snow-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
index 2335c4687349..ccb32d53d598 100644
--- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
@@ -698,6 +698,11 @@ &spi_1 {
 	cs-gpios = <&gpa2 5 GPIO_ACTIVE_HIGH>;
 };
 
+&usbdrd {
+	vdd10-supply = <&ldo15_reg>;
+	vdd33-supply = <&ldo12_reg>;
+};
+
 &usbdrd_dwc3 {
 	dr_mode = "host";
 };
-- 
2.32.0

