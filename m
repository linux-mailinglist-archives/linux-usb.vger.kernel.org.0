Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C27F8127BD4
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2019 14:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbfLTNiy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Dec 2019 08:38:54 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:43230 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727351AbfLTNix (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Dec 2019 08:38:53 -0500
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C5B71C093A;
        Fri, 20 Dec 2019 13:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576849133; bh=fXOESg+PMRHni6n265DYyXnlnzraHfFiUxZDkz0WIKU=;
        h=Date:From:Subject:To:Cc:From;
        b=a89/D0QuWn7TwTPwsUp/MbLqbtXXR57m4HXaAXHjFEHd5/OKuoB3PWtrLhOB6OmMU
         KOzlpY8L5ZIpQGLTZAql3vAvlRIhTS9Y7A5/8yzYA6W4De2bAOK4FLzKzYlxM8F8Ii
         0C4BFUK/q4Uj0UpQ0/hvZAh3ny2fskIzT3HsD+GHRNP0l0xgOL7hGvLGQgAf/X+HnS
         3eOBT08bTVQ0nk8Zai5bawi2xrODbdXZdWzzENptQFOlpO+/xaDICwGTmfKl7Lvamt
         RIHZ4/pX0MsM1R2owPMofCo6mYnCV710I718ti7qaMSeGhL6mmCVG/lBh46gvVIFQI
         eTG9yCf0gEjiw==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.144.133.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id AB177A0057;
        Fri, 20 Dec 2019 13:38:48 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Fri, 20 Dec 2019 19:08:46 +0530
Date:   Fri, 20 Dec 2019 19:08:46 +0530
Message-Id: <cover.1576848504.git.joglekar@synopsys.com>
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [RFC PATCH 0/4] Add logic to consolidate TRBs for Synopsys xHC
To:     Felipe Balbi <balbi@kernel.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
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


Tejas Joglekar (4):
  usb: xhci: Synopsys xHC consolidate TRBs
  usb: dwc3: Add device property consolidate-trbs
  usb: xhci: Set quirk for XHCI_CONSOLIDATE_TRBS
  dt-bindings: usb: Add snps,consolidate-trbs & consolidate-trbs

 Documentation/devicetree/bindings/usb/dwc3.txt     |   6 +
 Documentation/devicetree/bindings/usb/usb-xhci.txt |   1 +
 drivers/usb/dwc3/core.c                            |   2 +
 drivers/usb/dwc3/core.h                            |   2 +
 drivers/usb/dwc3/dwc3-haps.c                       |   1 +
 drivers/usb/dwc3/host.c                            |   3 +
 drivers/usb/host/xhci-pci.c                        |   3 +
 drivers/usb/host/xhci-plat.c                       |   3 +
 drivers/usb/host/xhci-ring.c                       | 278 ++++++++++++++++++++-
 drivers/usb/host/xhci.c                            |   3 +
 drivers/usb/host/xhci.h                            |  23 ++
 11 files changed, 317 insertions(+), 8 deletions(-)

-- 
2.11.0

