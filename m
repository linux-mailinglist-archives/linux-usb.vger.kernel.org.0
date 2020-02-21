Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18CBA16791D
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2020 10:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbgBUJPl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Feb 2020 04:15:41 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42387 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbgBUJPk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Feb 2020 04:15:40 -0500
Received: by mail-wr1-f66.google.com with SMTP id k11so1102355wrd.9
        for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2020 01:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bEVtSXMN2wxEExI4lH+Up8MQyxBldRZrbHcNZQGtFA0=;
        b=cHgClTJ05Rp4GvKFcbANPp3eANEP91ZtAnQuF7p4BkIc2AZeGLyVVGDl/cmZjHCXBe
         kpC+5YEtNprjLE1VOU6R8Y/ypyBhlZXu1raolt9vSnki0QV4Q/5dCKVNW9ZLZ54mxgvC
         CJGctsijTZQfUB5Lp6oQf7/5dJrc7MwlyiW5z2N/rhORM9sRf8vzkgDakvPi5WoTgRmS
         +6RN+Jjt+dhFOV4uhtiadJldz3vQDm4r23F+nl+qBNGSPHpErOYMxFWh02GKcGPVfnRC
         Hr843caZYawjhvC+knNV98fWCceOc+0fyZIjJrM6H+Tzpmiu6E9Wbt5OT44LtEwbNzr3
         XVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bEVtSXMN2wxEExI4lH+Up8MQyxBldRZrbHcNZQGtFA0=;
        b=B+4IHBpNREf+D/DnU59omMDKRDILx5JMjhbBO7zpLEwITazlglF1uBRFcxr5qzTxQB
         QqWvaVa6aH4htvJaJcl2AnLI3x+wRq94ZjEaZitc0wllh9iVNE4I3O6VlHi+kRC4x+F9
         Vccjsoa3UyJ19poBD/A5XMJEfpynF2m/JVn+WVNmzu+ucy2xWoSax+aV4NdfZL/WYp/t
         oiJeg8Z+Y2MkifUmupuUwv442bWmxrsl5npyLLoSBmPQXUU7RVQdlgTs2IA1Q/b/OBxF
         lTV8BmnWf4270L7Yes2EuVSRVL12fRsO+cNx7rmFvwWwowNXxqI36osVWcczJW/bztnZ
         NMPg==
X-Gm-Message-State: APjAAAUN5YJ/e+0/q526dXqYaM9jcwLWzvVnPxtdH9l4W4JgaTOFLTE3
        dPQ2Td2OLG/YinZ57TdvD9e4bABppydCRA==
X-Google-Smtp-Source: APXvYqwWqLydfUTa++1rHDsmS2lwyqPlQNNoap63wh2ujfgZkGStivmdKat61euYqdKxWzpwpuFEiQ==
X-Received: by 2002:a5d:4447:: with SMTP id x7mr47327713wrr.393.1582276537677;
        Fri, 21 Feb 2020 01:15:37 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
        by smtp.gmail.com with ESMTPSA id o15sm3257837wra.83.2020.02.21.01.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 01:15:37 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     balbi@kernel.org, khilman@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] usb: dwc3: parkmode_disable_ss_quirk on DWC3 controller
Date:   Fri, 21 Feb 2020 10:15:29 +0100
Message-Id: <20200221091532.8142-1-narmstrong@baylibre.com>
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

Changes since v3 at [3]:
- fixed patch 3 subject

Changes since v2 at [2]:
- rebased on v5.6-rc2

Changes since v1 at [1]:
- added rob review tag
- added Thinh Nguyen in commit log

[1] https://lore.kernel.org/linux-usb/20191014141718.22603-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/linux-usb/20200109101535.26812-1-narmstrong@baylibre.com
[3] https://lore.kernel.org/linux-usb/20200219141817.24521-1-narmstrong@baylibre.com

Neil Armstrong (3):
  doc: dt: bindings: usb: dwc3: Update entries for disabling SS
    instances in park mode
  usb: dwc3: core: add support for disabling SS instances in park mode
  arm64: dts: g12-common: add parkmode_disable_ss_quirk on DWC3
    controller

 Documentation/devicetree/bindings/usb/dwc3.txt    | 2 ++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
 drivers/usb/dwc3/core.c                           | 5 +++++
 drivers/usb/dwc3/core.h                           | 4 ++++
 4 files changed, 12 insertions(+)

-- 
2.22.0

