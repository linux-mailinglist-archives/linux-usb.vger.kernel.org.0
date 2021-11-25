Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0198845DC69
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 15:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355728AbhKYOhe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 09:37:34 -0500
Received: from mga09.intel.com ([134.134.136.24]:2368 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239448AbhKYOfe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 09:35:34 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="235345384"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="235345384"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 06:32:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="741301297"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2021 06:32:19 -0800
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH 0/7] thunderbolt: CLx support for USB4 and Titan Ridge
Date:   Thu, 25 Nov 2021 16:38:14 +0200
Message-Id: <20211125143821.16558-1-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In this series of patches we add support for link low power states (CLx).
Low Power states are used to reduce transmitter and receiver power
when a Lane is idle. First we enable it for USB4 devices, then for Titan Ridge
device. No other thunderbolt devices support CLx.

Gil Fine (7):
  thunderbolt: Add TMU unidirectional mode
  thunderbolt: Add CL0s support for USB4
  thunderbolt: Move usb4_switch_wait_for_bit() to switch.c
  thunderbolt: Enable TMU for Titan Ridge device
  thunderbolt: Rename Intel VSC capability
  thunderbolt: Enable CLx for Titan Ridge device
  thunderbolt: Add kernel param for CLx disabling

 drivers/thunderbolt/lc.c      |  27 ++
 drivers/thunderbolt/switch.c  | 527 +++++++++++++++++++++++++++++++++-
 drivers/thunderbolt/tb.c      |  23 +-
 drivers/thunderbolt/tb.h      |  62 +++-
 drivers/thunderbolt/tb_regs.h |  45 ++-
 drivers/thunderbolt/tmu.c     | 324 ++++++++++++++++++---
 drivers/thunderbolt/usb4.c    |  52 ++--
 7 files changed, 980 insertions(+), 80 deletions(-)

-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

