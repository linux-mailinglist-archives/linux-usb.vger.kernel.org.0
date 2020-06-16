Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4CD1FB2F2
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jun 2020 15:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbgFPN4Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jun 2020 09:56:24 -0400
Received: from mga02.intel.com ([134.134.136.20]:13889 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729073AbgFPN4X (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Jun 2020 09:56:23 -0400
IronPort-SDR: //7bekTyesEz7JsCzYiwW6kkCCE8/IPuMAnHdq71tba2YAMMwKjjmpH6J7yGqoMu6FXGzT3kmK
 oajY7a0h30mQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 06:56:21 -0700
IronPort-SDR: TZNh4V95CpIToQVN8Vjgx8lrm68Hv9Li17i+IufbEICoShuBc6DywU8kVF0lIdfEJrHHuy66pT
 8gmNue7s9PsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; 
   d="scan'208";a="261432876"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 16 Jun 2020 06:56:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1200D217; Tue, 16 Jun 2020 16:56:17 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Kranthi Kuntala <kranthi.kuntala@intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Mario.Limonciello@dell.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 0/6] thunderbolt: Add retimer NVM upgrade support
Date:   Tue, 16 Jun 2020 16:56:11 +0300
Message-Id: <20200616135617.85752-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

USB4 added standard means for accessing retimers on the link. This access
is done through the side-band channel (two side-band wires in Type-C
cable). The retimer specification is part of USB4 spec and can be
downloaded here:

  https://www.usb.org/sites/default/files/USB4%20Specification_5.zip

On-board retimers are represented as devices and added under the router
they belong to with names like <device>:<port>.<index>. We re-use some of
the current NVM upgrade code for routers for retimers as well. Also we only
expose these when software connection manager is used. It is not clear if
firmware connection manager is going to support this (and what kind of
messaging it needs).

The user-space interface is the same we have for routers so that should
allow code re-use for tools such as fwupd.

Currently only Intel NVM format is supported but this will be relaxed once
we learn format of other vendors.

This series applies on top of the tunneling improvements series here:

  https://lore.kernel.org/linux-usb/20200615142645.56209-1-mika.westerberg@linux.intel.com/

Kranthi Kuntala (1):
  thunderbolt: Add support for on-board retimers

Mika Westerberg (4):
  thunderbolt: Add Intel USB-IF ID to the NVM upgrade supported list
  thunderbolt: Split common NVM functionality into a separate file
  thunderbolt: Generalize usb4_switch_do_[read|write]_data()
  thunderbolt: Retry USB4 block read operation

Rajmohan Mani (1):
  thunderbolt: Implement USB4 port sideband operations for retimer access

 .../ABI/testing/sysfs-bus-thunderbolt         |  33 ++
 Documentation/admin-guide/thunderbolt.rst     |  11 +-
 drivers/thunderbolt/Makefile                  |   1 +
 drivers/thunderbolt/domain.c                  |   2 +-
 drivers/thunderbolt/nvm.c                     | 169 ++++++
 drivers/thunderbolt/retimer.c                 | 485 +++++++++++++++++
 drivers/thunderbolt/sb_regs.h                 |  33 ++
 drivers/thunderbolt/switch.c                  | 122 +----
 drivers/thunderbolt/tb.c                      |  10 +
 drivers/thunderbolt/tb.h                      |  85 ++-
 drivers/thunderbolt/tb_regs.h                 |  10 +
 drivers/thunderbolt/usb4.c                    | 505 +++++++++++++++++-
 12 files changed, 1338 insertions(+), 128 deletions(-)
 create mode 100644 drivers/thunderbolt/nvm.c
 create mode 100644 drivers/thunderbolt/retimer.c
 create mode 100644 drivers/thunderbolt/sb_regs.h

-- 
2.27.0.rc2

