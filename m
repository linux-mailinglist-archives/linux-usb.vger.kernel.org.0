Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52E707060FC
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 09:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjEQHT6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 03:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjEQHTl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 03:19:41 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB52B1BE3
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 00:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684307980; x=1715843980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ciM4+RloAH7ceuZWwtu37YX8votPz633HjA1kfic8k=;
  b=NoDXwYPJ21veGwtDWsmUaDOyvh2d12o85yYHS34to/tHvcIfMzsbUyuD
   BrDZ6DuSy8oVSKrUpRo2QxcmmJILE6JXNV5MziLpDLK1JWvANmuaDMhGR
   TggzVaU5Oz62fQgywrH301ILBX6hidwHzMxfpBiX4GYknU4Piz/4A+ZKr
   LBSkDUOuprzJwjsLPLhEGY1ZySB0JEPAP+dKrG/YDpdnPwKGWAUe+mSDP
   oCtr7MQZz24w9kazK+cXLKfKEJteKd8AdgpxnYNi72NZeDN+dGUCt/u1J
   0fGExTTSXWilzkaaP/PyJGH0Fm72ycr9Ne51XY43QwlnQdvuqrKASBE0T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="379876761"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="379876761"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 00:19:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="652124200"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="652124200"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 17 May 2023 00:19:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 88A38618; Wed, 17 May 2023 10:19:49 +0300 (EEST)
Date:   Wed, 17 May 2023 10:19:49 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fix for v6.4-rc3
Message-ID: <20230517071949.GV66750@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.4-rc3

for you to fetch changes up to c4af8e3fecd03b0aedcd38145955605cfebe7e3a:

  thunderbolt: Clear registers properly when auto clear isn't in use (2023-05-09 09:39:03 +0300)

----------------------------------------------------------------
thunderbolt: Fix for v6.4-rc3

This includes a single fix that fixes an error when resuming from
hibernation if the driver is built into the kernel. This has been in
linux-next with no reported issues.

----------------------------------------------------------------
Mario Limonciello (1):
      thunderbolt: Clear registers properly when auto clear isn't in use

 drivers/thunderbolt/nhi.c      | 29 ++++++++++++++++++++++++-----
 drivers/thunderbolt/nhi_regs.h |  2 ++
 2 files changed, 26 insertions(+), 5 deletions(-)
