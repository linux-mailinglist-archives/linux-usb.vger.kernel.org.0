Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 426C2307630
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 13:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbhA1MbY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 07:31:24 -0500
Received: from mga11.intel.com ([192.55.52.93]:16761 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231465AbhA1MbX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 28 Jan 2021 07:31:23 -0500
IronPort-SDR: 3AgK2Ypei5yuCjwduD7OmRVTrcgZSxDLiOzDJcqoGl2p69gTOP6cwwgKq8A5CWMdBWMrlRxUBE
 JMfu8ozNW/hQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="176716882"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="176716882"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 04:29:37 -0800
IronPort-SDR: 8SuM/z3uVyW3Jw2IteuwUqeKHpm7LS0WuvSGMWgQQ3fCMCOF4DAKv6wlOQxzpvF6bksGCcIiqN
 57IO+EM61nHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="505283589"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 28 Jan 2021 04:29:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id B9F7514F; Thu, 28 Jan 2021 14:29:34 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/5] thunderbolt: Fix kernel-doc descriptions of non-static functions
Date:   Thu, 28 Jan 2021 15:29:29 +0300
Message-Id: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
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

Mika Westerberg (5):
  thunderbolt: ctl: Fix kernel-doc descriptions of non-static functions
  thunderbolt: eeprom: Fix kernel-doc descriptions of non-static functions
  thunderbolt: path: Fix kernel-doc descriptions of non-static functions
  thunderbolt: nhi: Fix kernel-doc descriptions of non-static functions
  thunderbolt: switch: Fix kernel-doc descriptions of non-static functions

 drivers/thunderbolt/ctl.c    | 47 ++++++++++++++++++++++++++++++++----
 drivers/thunderbolt/eeprom.c | 13 ++++++++--
 drivers/thunderbolt/nhi.c    |  2 ++
 drivers/thunderbolt/path.c   |  2 ++
 drivers/thunderbolt/switch.c |  7 ++++++
 5 files changed, 64 insertions(+), 7 deletions(-)

-- 
2.29.2

