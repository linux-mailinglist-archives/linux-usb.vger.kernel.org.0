Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5665C5B98B3
	for <lists+linux-usb@lfdr.de>; Thu, 15 Sep 2022 12:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbiIOKYz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Sep 2022 06:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbiIOKYy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Sep 2022 06:24:54 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3EAC20F64
        for <linux-usb@vger.kernel.org>; Thu, 15 Sep 2022 03:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663237492; x=1694773492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kE1uE6ZYE+LQyM+ycahEV8ycIVV7EPs5tNfHhpItNCA=;
  b=QurgUpqC8ok/4q6QgnvmSSJQqdOneYN3iq53BVnMleLPffuhxxt/dIe5
   Jmnw4iJ8aoc2kfFast6u8/4hWX45UBJRRSbztGZG2VCIxtwN3XtsbsmVT
   vuylZcMgnWcHalIypXacRPa+PCweYtFhdlja4sw36uKPdkbtRV8kManDn
   lAm0lbUDz2QKimW+hp43Tf2iX1RmeaetigUWwOd7kmO5XBp66ATH73R2C
   l5Ub8RrFwlP1ojVgpeCJYb/B9c0bpjFMZyVjanuVXzR2bI7rFW6R2zdxs
   TVWAG8EZkvnB0+mlNPwEnKAbO48LhIxjWiIYrLq/xCx4f+384JceF/xWy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="298670417"
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; 
   d="scan'208";a="298670417"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 03:24:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; 
   d="scan'208";a="650429096"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 15 Sep 2022 03:24:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 13CF4F7; Thu, 15 Sep 2022 13:25:06 +0300 (EEST)
Date:   Thu, 15 Sep 2022 13:25:06 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fix for v6.0-rc6
Message-ID: <YyL9gsk0cFMeJBS3@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 7e18e42e4b280c85b76967a9106a13ca61c16179:

  Linux 6.0-rc4 (2022-09-04 13:10:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.0-rc6

for you to fetch changes up to 14c7d905283744809e6b82efae2f490660a11cda:

  thunderbolt: Add support for Intel Maple Ridge single port controller (2022-09-09 08:45:57 +0300)

----------------------------------------------------------------
thunderbolt: Fix for v6.0-rc6

This includes a single commit adding missing PCI ID for Intel Maple
Ridge Thunderbolt 4 single port controller.

This has been in linux-next with no reported issues.

----------------------------------------------------------------
Gil Fine (1):
      thunderbolt: Add support for Intel Maple Ridge single port controller

 drivers/thunderbolt/icm.c | 1 +
 drivers/thunderbolt/nhi.h | 1 +
 2 files changed, 2 insertions(+)
