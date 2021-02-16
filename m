Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F24C531CADA
	for <lists+linux-usb@lfdr.de>; Tue, 16 Feb 2021 14:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhBPNFY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Feb 2021 08:05:24 -0500
Received: from mga03.intel.com ([134.134.136.65]:42238 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229796AbhBPNFY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Feb 2021 08:05:24 -0500
IronPort-SDR: GmboY/7kGYQgZtdRvNHjjwqNlDc4WuY86rjotox27vBFE5ryvSJl/po1ecfwenNN9W7y8ZV7/c
 4lP2EU4ldV3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="182951201"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="182951201"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 05:04:40 -0800
IronPort-SDR: U1uP5EoziXkGXGI7CdUKreczvobXUrO5ngD5PJzoF+Bd2KDDTxdn7NWcl+87S/yZFGxx3iQAJ3
 JdoCR1D55V/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="512524003"
Received: from ccdtglu46.jer.intel.com ([10.12.50.142])
  by orsmga004.jf.intel.com with ESMTP; 16 Feb 2021 05:04:38 -0800
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v2 0/2] thunderbolt: debugfs: handle fail reading block 
Date:   Tue, 16 Feb 2021 15:04:25 +0200
Message-Id: <20210216130427.7317-1-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Applies on top of thunderbolt.git/next.

v1 can be found here:

  https://lore.kernel.org/linux-usb/20210201214637.2158-1-gil.fine@intel.com/

Changes from v1:

  * Split the previous patch into two patches so that
    dropping of the unused functions reside in a separate patch

Gil Fine (2):
  thunderbolt: debugfs: handle fail reading block
  thunderbolt: drop unused functions for TGL and ICL

 drivers/thunderbolt/debugfs.c | 38 +++++++++++++++++++++++------------
 drivers/thunderbolt/tb.h      | 26 ------------------------
 2 files changed, 25 insertions(+), 39 deletions(-)

-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

