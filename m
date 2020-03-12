Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7E218336D
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2020 15:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727744AbgCLOm6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 10:42:58 -0400
Received: from mga09.intel.com ([134.134.136.24]:50332 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727486AbgCLOm5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Mar 2020 10:42:57 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 07:42:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; 
   d="scan'208";a="443955714"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 07:42:55 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/9] xhci features for usb-next
Date:   Thu, 12 Mar 2020 16:45:08 +0200
Message-Id: <20200312144517.1593-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A set of xhci features for usb-next.
Turning on LPM support for a couple controllers, and finishing USB3
root port suspend and resume requests based on actual port link
states transitions instead of waiting for some default time.

-Mathias

JC Kuo (1):
  usb: host: xhci-tegra: Tegra186/Tegra194 LPM

Kai-Heng Feng (2):
  xhci: Ensure link state is U3 after setting USB_SS_PORT_LS_U3
  xhci: Wait until link state trainsits to U0 after setting
    USB_SS_PORT_LS_U0

Mathias Nyman (4):
  xhci: bail out early if driver can't accress host in resume
  xhci: Add a separate debug message for split transaction errors.
  xhci: Show host status when watchdog triggers and host is assumed
    dead.
  xhci: Finetune host initiated USB3 rootport link suspend and resume

Mika Westerberg (1):
  xhci-pci: Allow host runtime PM as default for Intel Tiger Lake xHCI

Nicolas Saenz Julienne (1):
  usb: xhci: Enable LPM for VIA LABS VL805

 drivers/usb/host/xhci-hub.c   | 61 +++++++++++++++++++++++++++++------
 drivers/usb/host/xhci-mem.c   |  1 +
 drivers/usb/host/xhci-pci.c   |  7 +++-
 drivers/usb/host/xhci-ring.c  |  9 ++++++
 drivers/usb/host/xhci-tegra.c |  7 ++++
 drivers/usb/host/xhci.c       |  4 ++-
 drivers/usb/host/xhci.h       | 30 +++++++++++++++++
 7 files changed, 107 insertions(+), 12 deletions(-)

-- 
2.17.1

