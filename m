Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E14D65EA04
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 12:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbjAELfs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 06:35:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbjAELfa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 06:35:30 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4964658329
        for <linux-usb@vger.kernel.org>; Thu,  5 Jan 2023 03:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672918529; x=1704454529;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7CAOmRXKDg0GeVxR2X0gurjqvOzECHabA0IZeEi1y78=;
  b=KikLCOtDWy7K9f4P8k0BqqZsCSrkeCxQJzbmvOp7CChUB15Q+OsCmmcy
   tXBqc0MQz9YnLfeUT56uJiSmel4m9Oh08D2iwPaEcWIyH+W1EP4pbZ1Zd
   HdU4LZqOhU1a6TY65Ni1aUZWE31xtZGIQ7qtuN8Jwg76psbuqecFOFxRJ
   7SOGutReF9wlsYuheCmRxhxkJlenKs4+jEhDwKUZulWWvKkMMfmx09AFi
   qldtwFttxi1TqFci04zoM7HNS1Dduorf+oNUU0HS97xT5EL0P4D6Oys2m
   HyZJoVRC2wbVVJji5JaRfzogq0BCoHIQQej4kBhDFZZLa+q8l4RE4BMOp
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="319888857"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="319888857"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 03:35:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="829527651"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="829527651"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 05 Jan 2023 03:35:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 87382162; Thu,  5 Jan 2023 13:35:59 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/8] thunderbolt: Add support for DisplayPort bandwidth allocation mode
Date:   Thu,  5 Jan 2023 13:35:51 +0200
Message-Id: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

This series implements an optional feature in USB4 spec called
DisplayPort bandwidth allocation mode. This allows the graphics driver
to negotiate with the Thunderbolt driver the bandwidth requirements
dynamically through DP IN adapters of the host router (graphics driver
uses DP AUX registers for this). This enables more "fine grained"
bandwidth allocation.

Mika Westerberg (8):
  thunderbolt: Use decimal port number in control and tunnel logs too
  thunderbolt: Log DP adapter type
  thunderbolt: Improve debug logging in tb_available_bandwidth()
  thunderbolt: Take CL states into account when waiting for link to come up
  thunderbolt: Increase timeout of DP OUT adapter handshake
  thunderbolt: Add functions to support DisplayPort bandwidth allocation mode
  thunderbolt: Include the additional DP IN double word in debugfs dump
  thunderbolt: Add support for DisplayPort bandwidth allocation mode

 drivers/thunderbolt/ctl.c     |  52 +++-
 drivers/thunderbolt/ctl.h     |   2 +
 drivers/thunderbolt/debugfs.c |   5 +-
 drivers/thunderbolt/switch.c  |  42 ++-
 drivers/thunderbolt/tb.c      | 504 ++++++++++++++++++++++++++++--
 drivers/thunderbolt/tb.h      |  37 +++
 drivers/thunderbolt/tb_msgs.h |  11 +-
 drivers/thunderbolt/tb_regs.h |  36 +++
 drivers/thunderbolt/tunnel.c  | 496 ++++++++++++++++++++++++++---
 drivers/thunderbolt/tunnel.h  |  18 ++
 drivers/thunderbolt/usb4.c    | 571 ++++++++++++++++++++++++++++++++++
 11 files changed, 1689 insertions(+), 85 deletions(-)

-- 
2.35.1

