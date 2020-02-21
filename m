Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1953167920
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2020 10:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbgBUJPp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Feb 2020 04:15:45 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46566 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727188AbgBUJPo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Feb 2020 04:15:44 -0500
Received: by mail-wr1-f67.google.com with SMTP id z7so1083526wrl.13
        for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2020 01:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m6wyWMfpOh6h06xGncQF4ABfwmrzTVZCtOS7mfMUTXc=;
        b=CNFUz9XmIGI1z3rF1pEQXHmcssshI74bztcBFdr5a3SNe8JI0QnKTDTONXkWHH9iU/
         1eebI/r4y8loG5bVOhU6pdkLGCN5nrE/3kav0FjA3/aL2kZW+YnOi4bEfufZeb1YlMe2
         Vwvu4n7MSvGJTpXARLUUFFOnVPTgcNtI9q/afAfvgXfFAs6z8e8QmA5EoXZiVzZYOr+H
         tO8mSVpr+1CctLXYHLI58XWXawcWuBeLuWxDaEDInc8YpVYiJnDdPi2XAynDIlszY61M
         vumDIplpMEdW772nhgM3/9AqF4XsghWLQOM7sMw+GZGCmRJG+LWXJDKWwAGXw4hMqCWw
         7J7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m6wyWMfpOh6h06xGncQF4ABfwmrzTVZCtOS7mfMUTXc=;
        b=W87tyYjhlrYeo58QyRT0Bu/Jg48cbWv0lzOuzo2LG8L2moveLk1Y5U8uLCcmGN26I2
         +t8Vnpl8ILEGQeLlROcpSH/zWgYh3QdNCh5jNGaCB6xi5wcKokZbGGhY0/dRpVX+HOOX
         SPdNIYYMWj5po48v5BMTWgdJyUYVaH0fqGA5R7kDaIriknLFT19cWGpt+pKjS04YIIzu
         Vcio/o7edIYXpTOE21zK3HoM4YCvPVRDGgfvpIzacjJC88oi6DCKvPdQlc4ctVK5tycb
         9WPf7iVYKBGg3w2/6UwtH5ovGj/5cn6oCR2fUNYG6PUHGkG33bDy9qkBJCxtxeUcU/Y1
         DRJg==
X-Gm-Message-State: APjAAAUjCj3Fx4JZ5geuDM4ogtZgDl2Zr8O28II18sDr4nG+SoNEZO1E
        QhA2kEGCBwT9oLa8XmsbW0vpFA==
X-Google-Smtp-Source: APXvYqx/yoZp80GSQF39ZZMKaradH9pBESsqZ0SCSnPQWB0IlpiAxndOzpHoTVL08u7ug6/J7HxbTQ==
X-Received: by 2002:adf:db84:: with SMTP id u4mr48270400wri.317.1582276541693;
        Fri, 21 Feb 2020 01:15:41 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
        by smtp.gmail.com with ESMTPSA id o15sm3257837wra.83.2020.02.21.01.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 01:15:41 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     balbi@kernel.org, khilman@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dongjin Kim <tobetter@gmail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>, Tim <elatllat@gmail.com>
Subject: [PATCH v4 3/3] arm64: dts: g12-common: add parkmode_disable_ss_quirk on DWC3 controller
Date:   Fri, 21 Feb 2020 10:15:32 +0100
Message-Id: <20200221091532.8142-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200221091532.8142-1-narmstrong@baylibre.com>
References: <20200221091532.8142-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When high load on the DWC3 SuperSpeed port, the controller crashes with:
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
index abe04f4ad7d8..87b9a47a51b9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2220,6 +2220,7 @@
 				dr_mode = "host";
 				snps,dis_u2_susphy_quirk;
 				snps,quirk-frame-length-adjustment;
+				snps,parkmode-disable-ss-quirk;
 			};
 		};
 
-- 
2.22.0

