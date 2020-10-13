Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A54E28CE90
	for <lists+linux-usb@lfdr.de>; Tue, 13 Oct 2020 14:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbgJMMnM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Oct 2020 08:43:12 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46124 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727077AbgJMMnM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Oct 2020 08:43:12 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3DB6BC0347;
        Tue, 13 Oct 2020 12:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1602592991; bh=wL1BJU6m2jy9lSYYmpV2etMteTnIvZvDitl4TiHkmo8=;
        h=Date:From:Subject:To:Cc:From;
        b=EZsJpm4t6J87RK9MgvbnJHr6rCahCrHxksoOYj8q739niaiOBIOlPI4GDEmoI70c4
         qYLkDD6YITMF16IMa/RNgTTanq+LgKH7SdXrmFVqPYosk3Ou0QAbE5uk94EVfUOUy7
         wNxzYy72bbLzKAuu2ltbqLiqPdXRDIE8CoXYLLNCv9emn9kuW/C9yKl64dTz2y9/1E
         RgMKWA+C9v4Ulj+k/zN5aU5thF0sZ0NzCUgWJHUPG7UYdFBtz3yQdm832dYMoAOb8b
         /RwLCPdqKekxRRz3xTM1cchJSHs1j8TLRrfRfCnXV1jRj7tHfjeA3NiNPH+O6Rn1AX
         fyQ3z8qVsuYJw==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.146.18.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 6906CA005E;
        Tue, 13 Oct 2020 12:43:07 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Tue, 13 Oct 2020 18:13:05 +0530
Date:   Tue, 13 Oct 2020 18:13:05 +0530
Message-Id: <cover.1602592488.git.joglekar@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [PATCH v4 0/3] Add logic to consolidate TRBs for Synopsys xHC
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Synopsys xHC has an internal TRB cache of size TRB_CACHE_SIZE for
each endpoint. The default value for TRB_CACHE_SIZE is 16 for SS and 8
for HS. The controller loads and updates the TRB cache from the
transfer ring in system memory whenever the driver issues a start
transfer or update transfer command.

For chained TRBs, the Synopsys xHC requires that the total amount of
bytes for all TRBs loaded in the TRB cache be greater than or equal to
1 MPS. Or the chain ends within the TRB cache (with a last TRB).

If this requirement is not met, the controller will not be able to
send or receive a packet and it will hang causing a driver timeout and
error.

This patch set adds logic to the XHCI driver to detect and prevent this
from happening along with the quirk to enable this logic for Synopsys
HAPS platform.

Based on Mathias's feedback on previous implementation where consolidation
was done in TRB cache, with this patch series the implementation is done
during mapping of the URB by consolidating the SG list into a temporary
buffer if the SG list buffer sizes within TRB_CACHE_SIZE is less than MPS.

Changes since v3:
 - Removed the dt-binding patch
 - Added new patch to pass the quirk as platform data
 - Modified the patch to set the quirk

Changes since v2:
 - Modified the xhci_unmap_temp_buffer function to unmap dma and c
   the dma flag
 - Removed RFC tag

Changes since v1:
 - Comments from Greg are addressed on [PATCH 4/4] and [PATCH 1/4]
 - Renamed the property and quirk as in other patches based on [PATCH 1/4]



Tejas Joglekar (3):
  usb: xhci: Set quirk for XHCI_SG_TRB_CACHE_SIZE_QUIRK
  usb: xhci: Use temporary buffer to consolidate SG
  usb: dwc3: Pass quirk as platform data

 drivers/usb/dwc3/host.c      |  14 ++++
 drivers/usb/host/xhci-plat.c |   3 +
 drivers/usb/host/xhci-ring.c |   2 +-
 drivers/usb/host/xhci.c      | 137 ++++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci.h      |   5 ++
 5 files changed, 159 insertions(+), 2 deletions(-)

-- 
2.28.0

