Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1BC865CE07
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 09:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbjADIH6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 03:07:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjADIH5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 03:07:57 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB81C11809
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 00:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672819676; x=1704355676;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KzBKojJbjt/RnqGa+W/aGF8iS28MU0ofOPxtVEoec+4=;
  b=SXFtwCzkBIUmvGX0ShrgWMtsQzqYHFPyJ8DfZPQaZIaZMUs0t7+XZGOd
   fqUehgIPZWlD4nykzuQhVDu6TJ/j7xGHklCpT9sILEwsUefABWRzgiqae
   imDsPayJ+KC3JJrMSrIVsg1fKryn+dwGo3rEPUYph5Xl/HGkZ9rmJgbyR
   eTH5pOElOxb51jaHlKTY8TEivfbmQFeQ5mD4Ar14zJ4uAh85HPnk02jTJ
   l2iWPpk55hRhbyOlqjUUSWvEFjwvS2uEnzKIbBeJAmIUyoXH1JYPbNnFh
   9eBNeIKQ66DrTZqIMz4I/W4fHbkc1MGfC+SoNBzd5tOwbsZdLb2RyYDCI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="302245441"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208";a="302245441"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 00:05:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="655113344"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208";a="655113344"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 04 Jan 2023 00:05:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id E447F162; Wed,  4 Jan 2023 10:06:01 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Utkarsh Patel <utkarsh.h.patel@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/3] thunderbolt: A couple of fixes for v6.2-rc
Date:   Wed,  4 Jan 2023 10:05:58 +0200
Message-Id: <20230104080601.45562-1-mika.westerberg@linux.intel.com>
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

This series includes a couple of fixes for issues found/reported.

Mika Westerberg (3):
  thunderbolt: Do not call PM runtime functions in tb_retimer_scan()
  thunderbolt: Use correct function to calculate maximum USB3 link rate
  thunderbolt: Disable XDomain lane 1 only in software connection manager

 drivers/thunderbolt/retimer.c | 17 +++--------------
 drivers/thunderbolt/tb.c      | 20 +++++++++++++++-----
 drivers/thunderbolt/tunnel.c  |  2 +-
 drivers/thunderbolt/xdomain.c | 17 ++++++++++++-----
 4 files changed, 31 insertions(+), 25 deletions(-)

-- 
2.35.1

