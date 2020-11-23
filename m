Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90F862C10CC
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 17:39:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390151AbgKWQhy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 11:37:54 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:34226 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389998AbgKWQhx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 11:37:53 -0500
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4F92DC0967;
        Mon, 23 Nov 2020 16:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1606149473; bh=BDQQGsx1D/3to3/IPzokt1sFXRDovgGtV2i4G8UHGvk=;
        h=Date:From:Subject:To:Cc:From;
        b=bNvvtKg8kdjV/2jF/DYAAqorYkAkueCH0PobW1//D5o+HtJttClUAAYwQ1D/N+Qr/
         mb1qjN9HFNRExK4o4XwL9OtrEJNeRLEM7nCOKfCsDKdjJLerF6Lyjf6I+A0GP6MnMr
         RNROdBNRtABtgC/oRekViTvxOMMYvsMz5p/za0yaMUpPfvSES3B+gEG53Z8LNsYBvG
         FcT9579jaiJK8RpytpfnpfT3jbs5XL/vzcES7sh6cFZ2fjuU1Anbe5YIirp+2LfVF/
         l/am0Y3bJNeo0VIbBbxKet53Sz9mrIkM8cFo1LDNMqyNMT9nbDFjd7Mu9kie89uTiX
         1EdPZlg/1Me2Q==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.146.24.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id E1171A005D;
        Mon, 23 Nov 2020 16:37:48 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Mon, 23 Nov 2020 22:07:46 +0530
Date:   Mon, 23 Nov 2020 22:07:46 +0530
Message-Id: <cover.1606149078.git.joglekar@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [PATCH v6 0/3] Add logic to consolidate TRBs for Synopsys xHC
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

Changes since v5:
 - Update the quirk macro to have next number [Patch 1/3]
 - Fixed the issues reported by kernel test robot [Patch 2/3]

Changes since v4:
 - Updated [Patch 3/3] platform data structure initialization
 - Trivial changes in commit wordings

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

 drivers/usb/dwc3/host.c      |  10 +++
 drivers/usb/host/xhci-plat.c |   3 +
 drivers/usb/host/xhci-ring.c |   2 +-
 drivers/usb/host/xhci.c      | 129 ++++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci.h      |   5 ++
 5 files changed, 147 insertions(+), 2 deletions(-)

-- 
2.28.0

