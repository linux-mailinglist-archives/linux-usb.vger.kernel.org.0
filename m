Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45B74155F61
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2020 21:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbgBGUSK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Feb 2020 15:18:10 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38148 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727546AbgBGURA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Feb 2020 15:17:00 -0500
Received: by mail-wm1-f66.google.com with SMTP id a9so4154655wmj.3
        for <linux-usb@vger.kernel.org>; Fri, 07 Feb 2020 12:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sAZggOAZ6xTvR/9Em9hZggbtITo/icBMwG27JPLcFiE=;
        b=D9Lvxc/3at5hslrlq/pIZIzZGtQVtPlwQX3yogd4Djh4AhuUEKeTD740m+/gG4OdvO
         2rHKGGJ1+Kyt8eh5SyrWi87TQ0h91JgvSnPBWgdZjtJ5LJm7lWnxfHl4xTUT08hpvd4e
         4JUYtcemiuEZZ6eZnRqYnefqpjeoek0GSnd71NFWF09WDK4lq9MDSLsHUb9VfpEQ+NIY
         cCfdl/OsVVRjv1ocz620H+8QsDKQ+9Z8MScBFemZ466h1MVfaICcvLTeDL/aohd/wiwX
         ChEmxvk/0tlhDBhb7q1sFNE0SSXvEjc3pMflj2oq2fOHUgX1AKXdZ7gt7DdLZylBWWNd
         DD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sAZggOAZ6xTvR/9Em9hZggbtITo/icBMwG27JPLcFiE=;
        b=L8l2HhxlqTVQop+6ojhSnZctn917vyw5hlXRDlWL9z32eylCaPfwhLxo4idEMIV5Dm
         3p8RFRk6Saq13ddvxsN1V/yeSNuvX4q8N96XIjYY6TWG4ZutQfLC/+lH8rOEiRSLPp2F
         u5m7tRpYvwesyTmpYuZeXanhkFNgEkL4K8DeKXOeOGD5uXx4AZTSRRaU78/M+Qgf8k14
         3c6JvEVyeV8WgRnZQYWp9BifuZK1uXYIu1l9N/AJz0XR+BeRZ44YUZDR8ZwSbhNX6oVQ
         9xNcrNYL6lpnhMSUKqkA89YlRrq72l3nosM4ax1ZqfjJUNWeUkRXLIy0ZHGPvvETlHM4
         ZTug==
X-Gm-Message-State: APjAAAVLHlx4aze5YcoyBE2fws44J8HVtEVuONjR8ObvYfT2nyJovZJg
        Qq7ttxYFsPRWxhw/nViW8JUZYIy18So=
X-Google-Smtp-Source: APXvYqwGZNyaOIJbSTtp9go0eLYghGXt59mgZyMgXxy9GPB2Jsqwlqq6lsZ3nh8qTgjHojNegLVyGQ==
X-Received: by 2002:a05:600c:cd:: with SMTP id u13mr62805wmm.24.1581106619355;
        Fri, 07 Feb 2020 12:16:59 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id h2sm5018542wrt.45.2020.02.07.12.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 12:16:58 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v5 08/18] dt-bindings: usb: dwc3: Add a usb-role-switch to the example
Date:   Fri,  7 Feb 2020 20:16:44 +0000
Message-Id: <20200207201654.641525-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
References: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds usb-role-switch to the example dwc3 given in the file.

Documentation/devicetree/bindings/usb/generic.txt makes this a valid
declaration for dwc3 this patch gives an example of how to use it.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 4e1e4afccee6..8c6c7b355356 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -121,6 +121,7 @@ dwc3@4a030000 {
 	interrupts = <0 92 4>
 	usb-phy = <&usb2_phy>, <&usb3,phy>;
 	snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
+	usb-role-switch;
 
 	usb_con: connector {
 		compatible = "gpio-usb-b-connector";
-- 
2.25.0

