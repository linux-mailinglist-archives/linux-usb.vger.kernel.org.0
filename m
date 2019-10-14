Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7D8D64E5
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2019 16:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732630AbfJNOR0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Oct 2019 10:17:26 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51169 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732601AbfJNORZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Oct 2019 10:17:25 -0400
Received: by mail-wm1-f65.google.com with SMTP id 5so17497806wmg.0
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2019 07:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WhPSwUwjAsJRbhdmE0cVGRUouZ5x8oaruQHda5jd55I=;
        b=qw+2kp/+fl6kXsLl22YjrO0TyQy+b2qOG96cAr18nh3mIUcQO2wxOniKBJRga3bv6p
         9gVO175nSljYfUAcAjw9jxTI1QDAAsmlRxihaiHD0ltMTQcWkjfZASaKg7Zrg0rKzyc5
         kFWR35CpMP10S6rBiE0sZlidqw2c81x70/pVS9YXFWxXbQfXDv3Z/TWitlohxBSSLH0I
         P34TlcmfOwb0nOjj/iyY8JJLUbbJhcr7bPt+yGE4VFH0VxHjbSW13cTO9VLCyNOU4x1F
         GyW1IX/y5/Gt5n10NogGoISQkc3ykn+ouY3KCXlxf+UvVSWFnjKjQKKwexoQVmbk7g8u
         mwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WhPSwUwjAsJRbhdmE0cVGRUouZ5x8oaruQHda5jd55I=;
        b=D20g9AWuZc7DnWsIPIpoMLxWim7okHcM4wNfvyGpbiGvj1b/DDGOKyAu+oMXM8bxFh
         1Z8KtBvtDiinoLpEvEmuWe+HFglvqy2vlk5xJwBanvPeFts2W3XrfLliSaJ9Hil0RgVJ
         B8ZZWsTIE+DA5Ai8GZW/D3c03eD3za1t17nbYq+M85rxuwneXnToNePYDV8KAvihrJ01
         MYY9D/BqmyvKu1EC0z3C1PjB807JmzlcPodyIfTg1cvoOsBQGZukcnG85XUqh5JlouJu
         J5NvZS7QRi9GghbJ6DKmrc4AThvdxGMbQU+jjQ/mAMGe9BGUWLjEAIrxeuEscsxK9qEI
         QUVQ==
X-Gm-Message-State: APjAAAXA3FLinWE7X4Rx/NE0dHQyJlQTtw3hUZktb8XJ9FWtSTTGzvOG
        rY4UBnGEYv+guvGvKDfHAzMAeQ==
X-Google-Smtp-Source: APXvYqwyLKkJs7kEVRKHW2iMVF8t8Y3SI49VubmuzAmVzLaKXolT83XHyMDU/m35t26Bb9WZbO3Sjg==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr15817487wmb.125.1571062643202;
        Mon, 14 Oct 2019 07:17:23 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t83sm42708624wmt.18.2019.10.14.07.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 07:17:22 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     balbi@kernel.org, khilman@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dongjin Kim <tobetter@gmail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>, Tim <elatllat@gmail.com>
Subject: [PATCH 3/3] arm64: dts: g12-common: add parkmode_disable_ss_quirk on DWC3 controller
Date:   Mon, 14 Oct 2019 16:17:18 +0200
Message-Id: <20191014141718.22603-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191014141718.22603-1-narmstrong@baylibre.com>
References: <20191014141718.22603-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When high load on the DWC3 SuperSpee port, the controller crashed as:
[  221.141621] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
[  221.157631] xhci-hcd xhci-hcd.0.auto: Host halt failed, -110
[  221.157635] xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
[  221.159901] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
[  221.159961] hub 2-1.1:1.0: hub_ext_port_status failed (err = -22)
[  221.160076] xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
[  221.165946] usb 2-1.1-port1: cannot reset (err = -22)

Setting the parkmode_disable_ss_quirk quirk fixes the issue.

CC: Dongjin Kim <tobetter@gmail.com>
Cc: Jianxin Pan <jianxin.pan@amlogic.com>
Reported-by: Tim <elatllat@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 3f39e020f74e..4b002e799e5c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2381,6 +2381,7 @@
 				dr_mode = "host";
 				snps,dis_u2_susphy_quirk;
 				snps,quirk-frame-length-adjustment;
+				snps,parkmode-disable-ss-quirk;
 			};
 		};
 
-- 
2.22.0

