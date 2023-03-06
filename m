Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34EE56ABE4D
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 12:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjCFLhA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 06:37:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjCFLg6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 06:36:58 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A17A5C0
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 03:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678102615; x=1709638615;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kYqE3y/i0MbGMGO9Wo7NIrVFhjQ3YAoIZbGjNZxWU50=;
  b=mlyRQxp5wXxPzbYSPvZnn50lTKRNgavamb3lf8dquFo844x+2EKDXF6+
   99XoKkqV/BZ9EcTrYmzxF+2M5KDbtibkyiU0rnHS7NXGRWy0oa0GzMY2M
   DCKsIwS6GiFkQDFQ+RROhqAf+vAU5/J/fo8vrm1/QsoU7iXL4mTz80qBG
   YkKDIOYyanqd+wQc/ucighRoVp+ZQXcfB2OvnHzYXdSLXPSag4MvKHqcd
   rVC4GAZsSx5S8upot7rAZznurpMd1lwZjiNymgOuJ5IKvaaoRRM/HHOmr
   3mpI2iKgT2iUVuz+iT1YcPAeb4g9pmmsZLSH9/DhA6VZKGfdfQ+bdnxk4
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="363147591"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="363147591"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 03:35:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="745024097"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="745024097"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 06 Mar 2023 03:35:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 0ECFA143; Mon,  6 Mar 2023 13:36:05 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        =?UTF-8?q?Christian=20Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/5] thunderbolt: A couple of fixes
Date:   Mon,  6 Mar 2023 13:36:00 +0200
Message-Id: <20230306113605.46137-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

This series includes a couple of fixes for issues found. I'm planning to
get these into v6.3-rc.

The first one is a memory leak fix.

The second one is fixing a reboot time issue reported by Christian that
we finally were able to reproduce in the lab. The reason this happened
only in Linux is that we enumerate retimers during link bring up and
there is certain step missing after the enumeration that leads the link
to not come up properly after soft-reboot. This should be fixed with
issuing UNSET_INBOUND_SBTX after retimer access and this works in the
lab.

@Christian, can you check that it solves the issue for you too?

The third one is a quirk that is needed for Intel hardware to limit the
USB3 bandwidth accordingly.

Gil Fine (2):
  thunderbolt: Add missing UNSET_INBOUND_SBTX for retimer access
  thunderbolt: Limit USB3 bandwidth of certain Intel USB4 host routers

Mika Westerberg (3):
  thunderbolt: Fix memory leak in margining
  thunderbolt: Call tb_check_quirks() after initializing adapters
  thunderbolt: Use scale field when allocating USB3 bandwidth

 drivers/thunderbolt/debugfs.c | 12 ++++----
 drivers/thunderbolt/quirks.c  | 31 ++++++++++++++++++++
 drivers/thunderbolt/retimer.c | 23 +++++++++++++--
 drivers/thunderbolt/sb_regs.h |  1 +
 drivers/thunderbolt/switch.c  |  4 +--
 drivers/thunderbolt/tb.h      |  4 +++
 drivers/thunderbolt/usb4.c    | 53 ++++++++++++++++++++++++++++++-----
 7 files changed, 111 insertions(+), 17 deletions(-)

-- 
2.39.1

