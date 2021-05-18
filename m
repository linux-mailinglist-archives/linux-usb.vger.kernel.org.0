Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE926387AB7
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 16:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349816AbhEROLL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 10:11:11 -0400
Received: from mga04.intel.com ([192.55.52.120]:3122 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349808AbhEROLK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 10:11:10 -0400
IronPort-SDR: 2jxrUl3GQBaD8YOBPqxGsBQrojreqglT6aarV4ysplaKm9+Uwjb51z20C+0dp5HVynnVO4lD3K
 F0IEBmRZD1uA==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="198769233"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="198769233"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 07:09:43 -0700
IronPort-SDR: hKFyPKrM62nw2X+PSlZnLk0L8p9mhgFH11b/Oy6em0L6qjk/SYbwT5QvbBsF5t4VOj8IsnamQ4
 Iens4nP/okWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="393968693"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 18 May 2021 07:09:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 696FB348; Tue, 18 May 2021 17:10:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        Casey G Bowman <casey.g.bowman@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/8] thunderbolt: Add credit allocation for USB4 devices
Date:   Tue, 18 May 2021 17:09:54 +0300
Message-Id: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

USB4 spec requires that routers expose their credit (buffer) allocation
preferences through a special router operation. Furthermore the Connection
Manager guide (as part of the USB4 spec bundle) provides some guidance how
the credits should be allocated between different tunneled protocols. This
series adds the credit allocation support for USB4 routers. For Intel
Thunderbolt 1-3 devices we keep using the existing hard-coded scheme.

We also add some KUnit tests for the credit allocation.

Mika Westerberg (8):
  thunderbolt: Make tb_port_type() take const parameter
  thunderbolt: Move nfc_credits field to struct tb_path_hop
  thunderbolt: Wait for the lanes to actually bond
  thunderbolt: Read router preferred credit allocation information
  thunderbolt: Update port credits after bonding is enabled/disabled
  thunderbolt: Allocate credits according to router preferences
  thunderbolt: Add quirk for Intel Goshen Ridge DP credits
  thunderbolt: Add KUnit tests for credit allocation

 drivers/thunderbolt/path.c    |   4 +-
 drivers/thunderbolt/quirks.c  |  29 +-
 drivers/thunderbolt/switch.c  | 151 +++++++++-
 drivers/thunderbolt/tb.h      |  44 ++-
 drivers/thunderbolt/tb_regs.h |   1 +
 drivers/thunderbolt/test.c    | 545 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/tunnel.c  | 401 ++++++++++++++++++++-----
 drivers/thunderbolt/tunnel.h  |   2 +
 drivers/thunderbolt/usb4.c    | 155 ++++++++++
 drivers/thunderbolt/xdomain.c |  10 +
 10 files changed, 1253 insertions(+), 89 deletions(-)

-- 
2.30.2

