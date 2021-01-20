Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2C32FC6EA
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 02:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbhATBhK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 20:37:10 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:57268 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728131AbhATBhF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 20:37:05 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DDE5240165;
        Wed, 20 Jan 2021 01:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1611106564; bh=WkdENdp1R+dSsxIwzxEkUY5SIW0WcdJoumVT9j8XDE8=;
        h=Date:From:Subject:To:Cc:From;
        b=g0beNNOuknYAI9Ql3rAem9nUaZ0HvgAPDG6r5wruvtEmgp6XMjWI5ZKfI8jjShhm1
         Ym40AEehBAUMcJVdOFlzfGuE3CS1vpZVKjtuNel88Tt2d+ZQ9j6SzXBcoDYwGHHaHw
         MD2eMKAmy/gtZTL/MWo+qqLnzlE+Ymw++NYDrVLEjHvH+gcjByO6EIjT714ENr+yO8
         Tknqm9FweU0VX0C+mJ2beLMb5VCAtqMui4C5IoHhR3WjY8GqkoieD/kekixK1Zp+4r
         J1KX+lXvYQeEd97TrZ0Jp0m+CtErimzN6CDqo/I35RH8lSOBLlhieJcwYUZI4dmEwv
         OBitnqgEubvfQ==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 45953A0096;
        Wed, 20 Jan 2021 01:36:01 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 19 Jan 2021 17:36:01 -0800
Date:   Tue, 19 Jan 2021 17:36:01 -0800
Message-Id: <cover.1611106162.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v7 0/6] usb: Support USB 3.2 multi-lanes
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
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

Changes in v7:
 - Greg picked up the first few patches of the series to his usb-testing
   branch. Rebase the remaining patches on Greg's usb-testing branch

Changes in v6:
 - Rebase on Greg's usb-testing branch
 - Update cover letter and title since there are many updates
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


Thinh Nguyen (6):
  dt-binding: usb: Include USB SSP rates in GenXxY
  usb: common: Parse for USB SSP genXxY
  usb: dwc3: core: Check maximum_speed SSP genXxY
  usb: dwc3: gadget: Implement setting of SSP rate
  usb: dwc3: gadget: Track connected SSP rate and lane count
  usb: dwc3: gadget: Set speed only up to the max supported

 .../devicetree/bindings/usb/usb.yaml          |  3 +
 drivers/usb/common/common.c                   | 26 +++++-
 drivers/usb/dwc3/core.c                       | 37 +++++++++
 drivers/usb/dwc3/core.h                       |  9 +++
 drivers/usb/dwc3/gadget.c                     | 80 ++++++++++++++++++-
 include/linux/usb/ch9.h                       | 11 +++
 6 files changed, 162 insertions(+), 4 deletions(-)


base-commit: 7a79f1f7f7e75e532c5a803ab3ebf42a3e79497c
-- 
2.28.0

