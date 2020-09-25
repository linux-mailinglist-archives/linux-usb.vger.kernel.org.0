Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A15F7277E0D
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 04:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbgIYClq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 22:41:46 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:49568 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726676AbgIYClq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 22:41:46 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 45569C0A93;
        Fri, 25 Sep 2020 02:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601001705; bh=9l32dHSYK55qvSZjbL0aoid+U7vBh2Nl0HIHNqXJpME=;
        h=Date:From:Subject:To:Cc:From;
        b=V1m8zTBq9n8jlQA52AX2oegHmh5hStjHRWzzVqpYjhVWW3DuD+XKaDTKbMphj/rix
         Z1lzdAoYTIbZ6e2K5hclD64o+suh7Z7vCdcAGEfjSrDUv/x8GFLZFGr/clJbIarFn2
         JjGburKKvvxdWuytZUlYa4p0XiW9biIj0GmdIFNCV4fctffCcTRvGboAx6cXrv7lJ3
         s3FBsYPqrUyoqT/CdhpNil3GR5bPj7QoIhCoUMQAZEtIW665legm9aGrfnPe+I9LkU
         V8WN6Y4obcjV82byLo6HnDRxeRCzAjnTfNJoq50nyOGcRuT+FEO5tZLlYbr7fmLf/o
         Ny21s9aCvY8yg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 2B750A0072;
        Fri, 25 Sep 2020 02:41:42 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 19:41:42 -0700
Date:   Thu, 24 Sep 2020 19:41:42 -0700
Message-Id: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v5 00/12] usb: Handle different sublink speeds
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Peter Chen <peter.chen@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dejin Zheng <zhengdejin5@gmail.com>, Jun Li <jun.li@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A USB super-speed-plus device may operate at different sublink speed and lane
count (e.g. gen2x2, gen1x2, or gen2x1). The usb gadget stack needs to be able
to handle a couple things:

1) Report the sublink speed attributes the device support
2) Select the sublink speed attribute

This series introduces sublink speed attribute structure to ch9.h to capture
the device capability of the gadget. It also introduces a new gadget ops
udc_set_num_lanes_and_speed to select a specific sublink speed.

DWC3 needs this support for DWC_usb32 IP. Implement the new changes for DWC3.

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


Thinh Nguyen (12):
  usb: ch9: Add sublink speed struct
  usb: gadget: composite: Avoid using magic numbers
  usb: gadget: Expose sublink speed attributes
  usb: gadget: Set max speed for SSP devices
  usb: composite: Properly report sublink speed
  usb: devicetree: Include USB SSP Gen X x Y
  usb: common: Add and update common functions for SSP speeds
  usb: dwc3: Initialize lane count and sublink speed
  usb: dwc3: gadget: Report sublink speed capability
  usb: dwc3: gadget: Implement setting of sublink speed
  usb: dwc3: gadget: Track connected lane and sublink speed
  usb: dwc3: gadget: Set speed only up to the max supported

 .../devicetree/bindings/usb/generic.txt       |  11 +-
 drivers/usb/common/common.c                   |  46 +++++-
 drivers/usb/dwc3/core.c                       |  29 ++++
 drivers/usb/dwc3/core.h                       |  14 ++
 drivers/usb/dwc3/gadget.c                     | 143 +++++++++++++++++-
 drivers/usb/gadget/composite.c                |  81 ++++++----
 drivers/usb/gadget/udc/core.c                 |  24 ++-
 include/linux/usb/ch9.h                       |  73 +++++++++
 include/linux/usb/gadget.h                    |  23 +++
 9 files changed, 403 insertions(+), 41 deletions(-)


base-commit: 1b28687a9c679499ddaa46dac6ca3660e46801c5
-- 
2.28.0

