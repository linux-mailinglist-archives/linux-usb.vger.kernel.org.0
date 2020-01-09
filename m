Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0519B1356A3
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 11:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729007AbgAIKPk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 05:15:40 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46886 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728894AbgAIKPk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jan 2020 05:15:40 -0500
Received: by mail-wr1-f65.google.com with SMTP id z7so6676129wrl.13
        for <linux-usb@vger.kernel.org>; Thu, 09 Jan 2020 02:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OCtmiCqI2P9xqNVNxOtkPbW3MhGrPJGbIhxNJ1nkAW0=;
        b=lgrnbfU1H/MNfYfjNyPKCLX8Dupk4Xxp802m2khDE6FAH+jUO/Q3rujArNbNp2srK6
         AfNTQhK48EeK13IfM0XUEaJdZp95ZAuuWu9Pntf0yr3/sp6bThHoHwsonQ/DSRIRC0/l
         Iu5Gp1tC3S1tnQ/3MbLIqdHeOdxG7vfRUjitNgCPvGzAa8l94U+hzydiaLVTk8knZD/i
         N3HVpz8pngzUeuEzphEVCNcsRI7dzQPoQ87bbf2zHSgiyiyo77hRZhx3o/NvtzcV7/P6
         /fQx0nCINET1HpGXUBhr5qqwuRBsOOa0hullENg6hfApAy9N0TTTx0by95HdDWYRf/s0
         +A0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OCtmiCqI2P9xqNVNxOtkPbW3MhGrPJGbIhxNJ1nkAW0=;
        b=byWRfGBc8IVeU4flRnd6jnxVlOeo4uMRuUn56REjCM5vLRjwTT4aXuHEnvcKZpbE8n
         BDsTV2vtqcNFf1G8O5cyKccmWG5lcItld8/59I6tlr8IgXBhfj08QEv/mUP8qZplMrKu
         CGAQSPmC0NUeokT9sFlRvHosn6c62xm2bJ22pstKSNyU7HpjNxzKxNaSIYarBf3PB+45
         YpsLUT/RRPZ94gujWUwUs5gnPNV67m2dSEhpuLphBW4sd5+jaKe1m7qSWQ8rI7BN8XZV
         KEsetSW4HQwVNjXcTKynwb3Se9+SZvEycjHf8acid8LEagbPIFqFZqnWDXOOYQcDnHL4
         X87Q==
X-Gm-Message-State: APjAAAVrLLS+q/dzBBqWiL4FoWR+qqmW1wz2xwvMkQGP4t3mmvoWm0Rb
        AQ9U1rVvPEcC5T2U5Wr7YlWpUA==
X-Google-Smtp-Source: APXvYqztrhFHOZkOTr83Eod3hS6kUXgxLZedODaQHDCw+HCLHCGGyJQ6p/fPteX91I44SSRh4Tqxhg==
X-Received: by 2002:a05:6000:11c3:: with SMTP id i3mr9946380wrx.244.1578564937945;
        Thu, 09 Jan 2020 02:15:37 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q19sm2250460wmc.12.2020.01.09.02.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 02:15:37 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     balbi@kernel.org, khilman@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: g12-common: parkmode_disable_ss_quirk on DWC3 controller
Date:   Thu,  9 Jan 2020 11:15:32 +0100
Message-Id: <20200109101535.26812-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In certain circumstances, the XHCI SuperSpeed instance in park mode
can fail to recover, thus on Amlogic G12A/G12B/SM1 SoCs when there is high
load on the single XHCI SuperSpeed instance, the controller can crash like:
xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
xhci-hcd xhci-hcd.0.auto: Host halt failed, -110
xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
hub 2-1.1:1.0: hub_ext_port_status failed (err = -22)
xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
usb 2-1.1-port1: cannot reset (err = -22)

Setting the PARKMODE_DISABLE_SS bit in the DWC3_USB3_GUCTL1 mitigates
the issue. The bit is described as :
"When this bit is set to '1' all SS bus instances in park mode are disabled"

The bug has been reproduced by Jun Li <lijun.kernel@gmail.com> and confirmed
by Thinh Nguyen <Thinh.Nguyen@synopsys.com> with the explanation:
> The GUCTL1.PARKMODE_DISABLE_SS is only available in dwc_usb3 controller 
> running in host mode. This should not be set for other IPs.
> This can be disabled by default based on IP, but I recommend to have a 
> property to enable this feature for devices that need this.

Changes since v1 at [1]:
- added rob review tag
- added Thinh Nguyen in commit log

[1] https://lore.kernel.org/linux-amlogic/20191014141718.22603-1-narmstrong@baylibre.com

Neil Armstrong (3):
  doc: dt: bindings: usb: dwc3: Update entries for disabling SS
    instances in park mode
  usb: dwc3: gadget: Add support for disabling SS instances in park mode
  arm64: dts: g12-common: add parkmode_disable_ss_quirk on DWC3
    controller

 Documentation/devicetree/bindings/usb/dwc3.txt    | 2 ++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
 drivers/usb/dwc3/core.c                           | 5 +++++
 drivers/usb/dwc3/core.h                           | 4 ++++
 4 files changed, 12 insertions(+)

-- 
2.22.0

