Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B3A45D5A4
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 08:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236523AbhKYHmo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 02:42:44 -0500
Received: from mga11.intel.com ([192.55.52.93]:7786 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236691AbhKYHko (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 02:40:44 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="232957908"
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; 
   d="scan'208";a="232957908"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 23:37:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; 
   d="scan'208";a="497974759"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 24 Nov 2021 23:37:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 14E84B8; Thu, 25 Nov 2021 09:37:33 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/6] thunderbolt: Improvements for PM and USB4 compatibility
Date:   Thu, 25 Nov 2021 10:37:27 +0300
Message-Id: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

This series consists of improvements around power management and USB4
compatibility. We also add debug logging for the DisplayPort resource
allocation.

Mika Westerberg (6):
  thunderbolt: Runtime PM activate both ends of the device link
  thunderbolt: Tear down existing tunnels when resuming from hibernate
  thunderbolt: Runtime resume USB4 port when retimers are scanned
  thunderbolt: Do not allow subtracting more NFC credits than configured
  thunderbolt: Do not program path HopIDs for USB4 routers
  thunderbolt: Add debug logging of DisplayPort resource allocation

 drivers/thunderbolt/acpi.c    | 13 +++++++
 drivers/thunderbolt/path.c    | 42 +++++++++++++---------
 drivers/thunderbolt/retimer.c | 28 +++++++++------
 drivers/thunderbolt/switch.c  | 27 ++++++++++++--
 drivers/thunderbolt/tb.c      | 68 ++++++++++++++++++++++++++---------
 drivers/thunderbolt/tb.h      |  5 ++-
 drivers/thunderbolt/tunnel.c  | 27 ++++++++------
 drivers/thunderbolt/tunnel.h  |  9 +++--
 8 files changed, 159 insertions(+), 60 deletions(-)

-- 
2.33.0

