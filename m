Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E94D71FD41
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 11:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235099AbjFBJMp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 05:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234728AbjFBJMU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 05:12:20 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3091BE
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 02:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685697052; x=1717233052;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wf2eZAu+s+joOTX+IWV7JA2fQkx2eEBQGOKkmlUQVk8=;
  b=EvyF07SDEYTE/yWTtQ4p0pRytnTpSCIemrBN+caHkFUOQQknAZoKqrnP
   DiQTG4M3g2tH/w5ZUG74ycW7U9uej+Ksi1Q/u8ZUckjUf+UEsk1ssC+XW
   hYzgrn81HAUCOJLbBExCumYBjLDUOfZXVM3YrxgoIEs7kWQJ5lKMEEReJ
   RCcXAT0G6pUxr/6lEHnQBvPecp6PsBI83jidDmPjG1GxfMpjhWQxqUHHh
   i1E+pNewgghaRXuRi0KawYkP2TjPu/lUldz/NuU1TKkANl+0MJvhPkCv4
   PjmULhg5MqnfeBpZfApc6Z1Zw4g6j6VCkSiypaUIOVH3QZ4OhdVakEmCg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="345402018"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="345402018"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 02:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="820211856"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="820211856"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 02 Jun 2023 02:10:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 2204D589; Fri,  2 Jun 2023 12:10:55 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Utkarsh H Patel <utkarsh.h.patel@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/3] thunderbolt: Few improvements for retimer access
Date:   Fri,  2 Jun 2023 12:10:52 +0300
Message-Id: <20230602091055.65049-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

These 3 patches improve the way we access retimers over sideband in
various situations, and make it more compliant with the USB4 spec.

Mika Westerberg (3):
  thunderbolt: Read retimer NVM authentication status prior tb_retimer_set_inbound_sbtx()
  thunderbolt: Do not send UNSET_INBOUND_SBTX when retimer NVM authentication started
  thunderbolt: Enable/disable sideband depending on USB4 port offline mode

 drivers/thunderbolt/retimer.c | 58 +++++++++++++++++++++++++++++------
 drivers/thunderbolt/tb.h      |  5 +++
 2 files changed, 54 insertions(+), 9 deletions(-)

-- 
2.39.2

