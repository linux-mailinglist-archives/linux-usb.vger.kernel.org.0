Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECD47741B6
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 19:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232114AbjHHR0o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 13:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbjHHR0S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 13:26:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C53BF205F8
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 09:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691511076; x=1723047076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GVdmK3TFoox+ljHnqsIW3IE/YB5ygMhjXKJGeLF6NK4=;
  b=GRTyzewI/ML76bVBn7H4axm33RMcEQ/X6urtY6JV/rzX34GxwD4JlcP/
   n+T9D6H8ucKJFCaZ8FWpzoT86d1vF10mBpII9t73/RKfr7V1QLudtomfU
   E8ceh77HONlFLPi8KZYZFkP+JOKOEHIZChLtV1a3NlVTKTiYyxGWXfE1l
   cTAf43RYmkm6eXXzcPAhjGCp4ZD6W5hq7Uw1ho1RytBhtFT+ezzgGAxfM
   27tIuyMxs4JfHUDg6+objtfj6kiWwJf0A3bhlNLPIDFHMtDkOD5J4mH8x
   NkG0zEaZSEYUiXpsqI/0xWHs3nio07UtFpTRVp4aMsPeFQqZ1i3sxpNxY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="355661658"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="355661658"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 22:27:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="724774246"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="724774246"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 07 Aug 2023 22:27:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1187415C; Tue,  8 Aug 2023 08:30:01 +0300 (EEST)
Date:   Tue, 8 Aug 2023 08:30:01 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fixes for v6.5-rc6
Message-ID: <20230808053001.GF14638@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4:

  Linux 6.5-rc4 (2023-07-30 13:23:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.5-rc6

for you to fetch changes up to 596a5123cc782d458b057eb3837e66535cd0befa:

  thunderbolt: Fix memory leak in tb_handle_dp_bandwidth_request() (2023-08-04 16:17:47 +0300)

----------------------------------------------------------------
thunderbolt: Fixes for v6.5-rc6

This includes two fixes for v6.5-rc6:

  - Correct display flickering when connecting a Thunderbolt 3 device to
    an AMD USB4 host controller
  - Fix a memory leak in bandwidth allocation request.

Both have been in linux-next with no reported issues.

----------------------------------------------------------------
Mika Westerberg (1):
      thunderbolt: Fix memory leak in tb_handle_dp_bandwidth_request()

Sanjay R Mehta (1):
      thunderbolt: Fix Thunderbolt 3 display flickering issue on 2nd hot plug onwards

 drivers/thunderbolt/tb.c  | 2 ++
 drivers/thunderbolt/tmu.c | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

