Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34E272F58B3
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 04:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbhANCxq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 21:53:46 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:54674 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726773AbhANCxo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 21:53:44 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 327D1C00E8;
        Thu, 14 Jan 2021 02:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610592763; bh=JQkSfj7ArjC0HQQtFSF+OfzyKFWDdGDn0SFzGjg0EAA=;
        h=Date:From:Subject:To:Cc:From;
        b=czQyr4UOdSheJDd5zq0aKEEWdgBQhgYSmvW801Do0I6WIP+VKcD5A7JmCsCu5x1Ae
         zRwrxprV3FnFsCfft5Q0oVmD6rKMBEmP5BjqFHWMnbggorWTYcNdXoXBfro5BwdVRk
         D/O5YxiepzBX0il0QnpuBvKRCyQJ9NWCV7lbIlSzvp1s+gmunYoIvykHtHHzbE0ThZ
         7lPRfi0uu8IP7imVZqFDPdQ1kDDGzN7p5ohuSsDAQbsyUHVaj4vy5ui4t4GmEo5eOh
         VhKl79QhPxDxJLq7LwIQ5Sh2smKPygzCqJDIDELgkxqRFBwzXdVX60cmEhBH7DX78Q
         Dtk7sJdHgGuOQ==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 9561BA007C;
        Thu, 14 Jan 2021 02:52:37 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 13 Jan 2021 18:52:37 -0800
Date:   Wed, 13 Jan 2021 18:52:37 -0800
Message-Id: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v6 00/11] usb: Support USB 3.2 multi-lanes
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>, Thinh.Nguyen@synopsys.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Peter Chen <peter.chen@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rob Gill <rrobgill@protonmail.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        Dejin Zheng <zhengdejin5@gmail.com>, Bin Liu <b-liu@ti.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A USB SuperSpeed Plus device may operate at different speed and lane count
(i.e. gen2x2, gen1x2, or gen2x1). The DWC_usb32 IP supports SuperSpeed Plus
gen2x2. To support this, this series update a few things to the USB gadget
stack and dwc3 driver:

* Accept and parse new maximum_speed devicetree property strings
* Introduce enum usb_ssp_rate to describe the speed in SuperSpeed Plus genXxY
* Capture the connected and max supported usb_ssp_rate
* Report the device sublink speeds base on the usb_ssp_rate in the BOS
  descriptor
* Introduce gadget ops to select SuperSpeed Plus various transfer rate and lane
  count
* Update dwc3 driver to support the above changes

Changes in v6:
 - Rebase on Greg's usb-testing branch
 - Update the cover letter and title
   * Previous version 5: https://lore.kernel.org/linux-usb/cover.1601001199.git.Thinh.Nguyen@synopsys.com/
 - To simplify things, use usb_ssp_rate enum to specify the signaling rate
   generation and lane count instead of separately tracking them.
 - Convert the sublink speed attributes to macros and move it to uapi
 - Remove usb_sublink_speed struct
 - Remove "usb: dwc3: gadget: Report sublink speed capability"
 - Update dwc3 to support the new changes

Changes in v5:
 - Rebase on Felipe's testing/next branch
 - Changed Signed-off-by email to match From: email header
 - Add Rob's Reviewed-by

Changes in v4:
 - Instead of using a single function to parse "maximum-speed" property for
   speed, gen X, and number of lanes, split those tasks to separate common
   functions
 - Revise DWC3 driver to use those new common functions
 - Fix checkpatch warnings for using "unsigned" rather than "unsigned int" and
   missing identifier name in udc_set_num_lanes_and_speed gadget ops

Changes in v3:
 - Remove "num-lanes" and "lane-speed-mantissa-gbps" common properties
 - Remove "num-lanes" and "lane-speed-mantissa-gbps" properties validation in dwc3
 - Update "maximum-speed" to support variations of SSP Gen X x Y
 - Update common function to parse new strings for "maximum-speed"
 - Update commit messages for the new changes

Changes in v2:
 - Move usb_sublink_speed attribute struct and enum to include/linux/usb/ch9.h
 - Use "num-lanes" and "lane-speed-mantissa-gbps" as common properties instead
 - Add common functions to get num-lanes and lsm properties
 - Fix missing gen1x2 sublink speed attribute check report in dwc3


Thinh Nguyen (11):
  usb: ch9: Add USB 3.2 SSP attributes
  usb: gadget: composite: Use SSP sublink speed macros
  usb: gadget: Introduce SSP rates and lanes
  usb: gadget: Introduce udc_set_ssp_rate() for SSP
  usb: gadget: composite: Report various SSP sublink speeds
  dt-binding: usb: Include USB SSP rates in GenXxY
  usb: common: Parse for USB SSP genXxY
  usb: dwc3: core: Check maximum_speed SSP genXxY
  usb: dwc3: gadget: Implement setting of SSP rate
  usb: dwc3: gadget: Track connected SSP rate and lane count
  usb: dwc3: gadget: Set speed only up to the max supported

 .../devicetree/bindings/usb/usb.yaml          |  3 +
 drivers/usb/common/common.c                   | 26 +++++-
 drivers/usb/dwc3/core.c                       | 37 +++++++++
 drivers/usb/dwc3/core.h                       |  9 ++
 drivers/usb/dwc3/gadget.c                     | 80 +++++++++++++++++-
 drivers/usb/gadget/composite.c                | 83 +++++++++++++------
 drivers/usb/gadget/udc/core.c                 | 16 ++--
 include/linux/usb/ch9.h                       | 20 +++++
 include/linux/usb/gadget.h                    | 11 +++
 include/uapi/linux/usb/ch9.h                  | 13 +++
 10 files changed, 263 insertions(+), 35 deletions(-)


base-commit: 67004e130aafad4c9e0ad3fff9cf67227b6347be
-- 
2.28.0

