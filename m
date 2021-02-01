Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2CD30A76D
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 13:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbhBAMSU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 07:18:20 -0500
Received: from mga18.intel.com ([134.134.136.126]:57403 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231219AbhBAMST (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 07:18:19 -0500
IronPort-SDR: uEIOFw8KlX1WfeiWghYugrusdwGDeeo+NBww7yZT8gDCVko49+YarlMLrVD3WXcre17X+eFvm+
 90S4HeHILPww==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="168356410"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="168356410"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 04:16:34 -0800
IronPort-SDR: iGHSJX3lWxQlg94tuxYcUKOAtmxaioaR3lKIqaC+2McSVQGQrgqZ8F1cZvODLmkoAIM6TaD6X+
 bLsMzqS/y/TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="353975902"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 01 Feb 2021 04:16:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 75C3111E; Mon,  1 Feb 2021 14:16:29 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 0/6] thunderbolt: Fix kernel-doc descriptions of non-static functions
Date:   Mon,  1 Feb 2021 15:16:23 +0300
Message-Id: <20210201121629.76969-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

This series was inspired by the patch series from Lee Jones that fixed a
bunch of warnings with W=1 build:

  https://lore.kernel.org/linux-usb/20210127112554.3770172-1-lee.jones@linaro.org/

For non-static functions we fix missing kernel-doc descriptions
accordingly. This fixes the rest of the warnings with W=1 build.

Applies on top of thunderbolt.git/next.

v1 can be found here:

  https://lore.kernel.org/linux-usb/20210128122934.36897-1-mika.westerberg@linux.intel.com/

Changes from v1:

  * Drop @ before port in patch 5/6.
  * Added tags from Lee Jones.
  * New patch that clarifies router/adapter USB4 terms in structs
    tb_switch/port.

Mika Westerberg (6):
  thunderbolt: ctl: Fix kernel-doc descriptions of non-static functions
  thunderbolt: eeprom: Fix kernel-doc descriptions of non-static functions
  thunderbolt: path: Fix kernel-doc descriptions of non-static functions
  thunderbolt: nhi: Fix kernel-doc descriptions of non-static functions
  thunderbolt: switch: Fix kernel-doc descriptions of non-static functions
  thunderbolt: Add clarifying comments about USB4 terms router and adapter

 drivers/thunderbolt/ctl.c    | 47 ++++++++++++++++++++++++++++++++----
 drivers/thunderbolt/eeprom.c | 13 ++++++++--
 drivers/thunderbolt/nhi.c    |  2 ++
 drivers/thunderbolt/path.c   |  2 ++
 drivers/thunderbolt/switch.c |  7 ++++++
 drivers/thunderbolt/tb.h     |  5 ++++
 6 files changed, 69 insertions(+), 7 deletions(-)

-- 
2.29.2

