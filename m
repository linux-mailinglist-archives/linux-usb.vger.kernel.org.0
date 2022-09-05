Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3A525AD209
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 14:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiIEMCI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 08:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236488AbiIEMB5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 08:01:57 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1BA5B7B4
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 05:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662379313; x=1693915313;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J5+T9D1PsG1Ayne1H5fLoKKZJZM9WU2gkzfYst/qkWI=;
  b=I/Ia1Q6lqyb6ykZPD4ClFqVJY1l24eVHz4i3ZjodL2b/aLpEywydjlom
   yKNqM4xixvC74BVKBpSOD5xvg+pWR3ny9coLv7PucEyQAjjizkbWxPjJw
   A5jAAoQmDCpv6dTn/kSyiPLhOjGf/Umysr4vxVFAFn6AbNTH3VQ8vprnT
   kV7goVzekck01rmC4myZmmjneWdTlMdGfJz3dcc+2l+Aufcsg0QWHspBK
   phUdZzzjERGv+o//xuN/3TYju9wwUnikG8aCD23owynWA0NPxMVh+9agq
   OT8bu9lSUqoTYFlYAz9XLNfdaalEEemBjb4y5K5+izwfZvnQvd+SBBE6c
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="279390032"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="279390032"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 05:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="646879460"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 05 Sep 2022 05:01:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1F588128; Mon,  5 Sep 2022 15:02:05 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Szuying Chen <Chloe_Chen@asmedia.com.tw>
Cc:     gregkh@linuxfoundation.org, mario.limonciello@amd.com,
        andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Yd_Tseng@asmedia.com.tw,
        Richard_Hsu@asmedia.com.tw, Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v9 0/6] thunderbolt: Add support for ASMedia NVM firmware image format
Date:   Mon,  5 Sep 2022 15:01:59 +0300
Message-Id: <20220905120205.23025-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

This series adds support for ASMedia NVM images. It is based on the work
of Szuying Chen with a couple of changes from me. The first patches move
Intel specific NVM validation into nvm.c and adds a vendor table for
both routers and retimers that can be extended to support different
vendor NVM image formats. Once that is done the ASMedia NVM image format
support is added.

The previous version of the patch series can be found here:

  https://lore.kernel.org/linux-usb/20220902094010.2170-1-chensiying21@gmail.com/

Changes from the previous version:

  * Shuffled the ordering of the patches a bit
  * Add tb_retimer_nvm_read() and tb_switch_nvm_read()
  * Add ->write_headers() callback that is used with Thunderbolt 2
    routers
  * Cover retimers too
  * Minor cleanups and tweaks

I have tested this on Intel Thunderbolt 3 and Thunderbolt 4 routers.
ASMedia folks, can you try this also on your side and let me know if it
works or not?

Mika Westerberg (1):
  thunderbolt: Provide tb_retimer_nvm_read() analogous to tb_switch_nvm_read()

Szuying Chen (5):
  thunderbolt: Allow NVM upgrade of USB4 host routers
  thunderbolt: Extend NVM version fields to 32-bits
  thunderbolt: Rename and make nvm_read() available for other files
  thunderbolt: Move vendor specific NVM handling into nvm.c
  thunderbolt: Add support for ASMedia NVM image format

 drivers/thunderbolt/nvm.c     | 385 +++++++++++++++++++++++++++++++++-
 drivers/thunderbolt/retimer.c | 105 ++++------
 drivers/thunderbolt/switch.c  | 162 +++++---------
 drivers/thunderbolt/tb.c      |   5 +-
 drivers/thunderbolt/tb.h      |  30 ++-
 5 files changed, 498 insertions(+), 189 deletions(-)

-- 
2.35.1

