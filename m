Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED83949712B
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jan 2022 12:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236383AbiAWLRP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jan 2022 06:17:15 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56048
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236242AbiAWLQ6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Jan 2022 06:16:58 -0500
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5EC883F1C4
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 11:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936616;
        bh=mZrAftbEtCYMgTENBFFGXCuFnaLbp5VnVYmLha/DMRk=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=q7Wf+b82yeRbxpLxTEj7U9g6qKmjrY6Q/kSdOKdTtkmZtij4HztQ33mX+ltyPMCSV
         MCu9ce/9f1GvgzHaFeHvdWZbcYSY9W5zbIpoCe1UDMYgtBrr2dlLHPPteExpvPfRTD
         ugy/QFSTrth2lSDsjvI8N+ZlFd0mHOuxDkBNnnX6DSFjHlpf83JEpl6ZojkyIGZ3vx
         lBhvBzmMaUI5YA+M9QII6eLi3CuJ8E7TtGJ4Hx5elTUD+pe7Zn4VONCZ3vAEhu6Tfn
         o2QwAu1Wta1Vr9x92WC8d64nlLK7TMeLTDD8Ho4pBJRJgfv1T5hyYEg5jXhqTNnZt6
         f0hB9vuESDD2A==
Received: by mail-wm1-f69.google.com with SMTP id v185-20020a1cacc2000000b0034906580813so12949629wme.1
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 03:16:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mZrAftbEtCYMgTENBFFGXCuFnaLbp5VnVYmLha/DMRk=;
        b=rIr0UDvmDtaBQv6KC7COJOQj4pKm1uMJkoyU1Mw0sWVhb6exeAODlz5iKYt08aatZs
         UWtSlEgmf2e9p902T6wBtCIooXovaRgvuzL7fdoDkPr0vVFi8a7+WOLQUTv9hNuCv6Fx
         DRKWANLGL+Rq6FdcFMQUgcKpSaGWU9JjPhn19UUR6GLv++q+t1q3FABKyftHtaAtiwxQ
         ZYjwU6cJcY9vkHb3focdddBPfNpCaHLGqI5EIDwsKMzUFE/a6CzdCHf4Qcgik+IbpCX6
         i3b6iM7IcQk5LTkGjBFc2B/xbHFD1KSWipmzfXgfguWbehjmox0HKi8kSvn7NrYDSJ//
         Lhuw==
X-Gm-Message-State: AOAM531QjDsMfB3fXh5hlWd6ZpEkD/7aUVQVN37vJi/1sxS+kv9lxpwv
        LBPSKMI2FellzaSvfJmIvPGC/2TpOVcYjea6apxSmC/JrDwpjnpnapshr7D2flk/9hzw5l+DS4R
        TUHrFQwpnZiTNwU08EQYtUcEAsKeDbpoQueX3jg==
X-Received: by 2002:a5d:64a5:: with SMTP id m5mr2349927wrp.596.1642936614110;
        Sun, 23 Jan 2022 03:16:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbgZpejnF9FsaGyv4Km9SlVIA0mLrJyWVOdw4PpZPzd2pNEg41zEEfiODSBE5ZfvFaMZwUFg==
X-Received: by 2002:a5d:64a5:: with SMTP id m5mr2349911wrp.596.1642936613937;
        Sun, 23 Jan 2022 03:16:53 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:16:53 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/12] ARM: dts: exynos: add USB DWC3 supplies to Chromebook Spring
Date:   Sun, 23 Jan 2022 12:16:37 +0100
Message-Id: <20220123111644.25540-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add required voltage regulators for USB DWC3 block on Exynos5250
Chromebook Spring board.  Due to lack of board schematics, use same
regulators as on Arndale board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5250-spring.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dts/exynos5250-spring.dts
index e0feedcf54bb..138f51f974c7 100644
--- a/arch/arm/boot/dts/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/exynos5250-spring.dts
@@ -553,4 +553,9 @@ &spi_1 {
 	num-cs = <1>;
 };
 
+&usbdrd {
+	vdd10-supply = <&ldo15_reg>;
+	vdd33-supply = <&ldo12_reg>;
+};
+
 #include "cros-ec-keyboard.dtsi"
-- 
2.32.0

