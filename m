Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3471F9A12
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 16:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730269AbgFOO0t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 10:26:49 -0400
Received: from mga17.intel.com ([192.55.52.151]:19757 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729243AbgFOO0t (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 10:26:49 -0400
IronPort-SDR: +61CTUNMaS4WAQ44OemCM4FuSRDSPzdW7JrnaTv72VEZWPzQQj3MWtHggiNNDrPHunDBO2mqMa
 gtitD0SuDW+Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 07:26:48 -0700
IronPort-SDR: e+wEzyDCG+yZEv0p8CDR0J/Tlcr23sbrP95Mw1ONR9Xdu57MBOS6N5wbGzvYpoApM2sZx9dicO
 PwWRXx7bLqog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="290713056"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 15 Jun 2020 07:26:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id B28E1190; Mon, 15 Jun 2020 17:26:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 00/17] thunderbolt: Tunneling improvements
Date:   Mon, 15 Jun 2020 17:26:28 +0300
Message-Id: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

This series improves the Thunderbolt/USB4 driver to support tree topologies
that are now possible with USB4 devices (it is possible with TBT devices
but there are no such devices available in the market with more than two
ports).

We also take advantage of KUnit and add unit tests for path walking and
tunneling (in cases where hardware is not needed). In addition we add
initial support for USB3 tunnel bandwidth management so that the driver can
share isochronous bandwidth between USB3 and DisplayPort.

Mika Westerberg (17):
  thunderbolt: Fix path indices used in USB3 tunnel discovery
  thunderbolt: Make tb_next_port_on_path() work with tree topologies
  thunderbolt: Make tb_path_alloc() work with tree topologies
  thunderbolt: Check that both ports are reachable when allocating path
  thunderbolt: Handle incomplete PCIe/USB3 paths correctly in discovery
  thunderbolt: Increase path length in discovery
  thunderbolt: Add KUnit tests for path walking
  thunderbolt: Add DP IN resources for all routers
  thunderbolt: Do not tunnel USB3 if link is not USB4
  thunderbolt: Make usb4_switch_map_usb3_down() also return enabled ports
  thunderbolt: Make usb4_switch_map_pcie_down() also return enabled ports
  thunderbolt: Report consumed bandwidth in both directions
  thunderbolt: Increase DP DPRX wait timeout
  thunderbolt: Implement USB3 bandwidth negotiation routines
  thunderbolt: Make tb_port_get_link_speed() available to other files
  thunderbolt: Add USB3 bandwidth management
  thunderbolt: Add KUnit tests for tunneling

 drivers/thunderbolt/Kconfig   |    5 +
 drivers/thunderbolt/Makefile  |    2 +
 drivers/thunderbolt/path.c    |   38 +-
 drivers/thunderbolt/switch.c  |   25 +-
 drivers/thunderbolt/tb.c      |  378 ++++++--
 drivers/thunderbolt/tb.h      |   35 +-
 drivers/thunderbolt/tb_regs.h |   20 +
 drivers/thunderbolt/test.c    | 1626 +++++++++++++++++++++++++++++++++
 drivers/thunderbolt/tunnel.c  |  326 ++++++-
 drivers/thunderbolt/tunnel.h  |   37 +-
 drivers/thunderbolt/usb4.c    |  369 +++++++-
 11 files changed, 2709 insertions(+), 152 deletions(-)
 create mode 100644 drivers/thunderbolt/test.c

-- 
2.27.0.rc2

