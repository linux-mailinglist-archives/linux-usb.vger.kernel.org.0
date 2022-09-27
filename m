Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC8085EBD97
	for <lists+linux-usb@lfdr.de>; Tue, 27 Sep 2022 10:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbiI0Ijk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Sep 2022 04:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbiI0Ijf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Sep 2022 04:39:35 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 781272AFE
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 01:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664267972; x=1695803972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fAyM5SsvFz9pwr7uaU7tf9X7Xa33VrF6xq+2ziCEjGk=;
  b=nnqN22ZpF7xcOr+O4/U6AAV+TlnK+t//+LYkYAo1eQavAnfvf/VHrFtP
   gE2oqzfrSpy0VvbuVRm19xb6iDQA2DLY4o8l6frJKvXqv1h5rlNmrP+l7
   wteIxblafs7we1IRyfTxa0y3XcLsWpOXEdZRpe4mmZtnE3IZI+Mwejrds
   ayJx8AoSU6w9E1O1o+hbaVWaoQ7wDRYCQC0HA75xCIJcx+1/pGUn8yF9x
   /05fM7wLCffwofQODY4440vkYkYnCE5BixKHm/gTN4mUYbAfzfrUM3WRd
   CZW5ToafvL8DblL49DAMbKnseO6HCqW8i7JCNp4ftK3sepuEMuyJvTDT/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="302740117"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="302740117"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 01:39:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="866488541"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="866488541"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 27 Sep 2022 01:39:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 4FEE4F7; Tue, 27 Sep 2022 11:39:48 +0300 (EEST)
Date:   Tue, 27 Sep 2022 11:39:48 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fix for v6.0 final
Message-ID: <YzK21K7xBm0a2Vbo@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 521a547ced6477c54b4b0cc206000406c221b4d6:

  Linux 6.0-rc6 (2022-09-18 13:44:14 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.0

for you to fetch changes up to 31f87f705b3c1635345d8e8a493697099b43e508:

  thunderbolt: Explicitly reset plug events delay back to USB4 spec value (2022-09-22 14:32:16 +0300)

----------------------------------------------------------------
thunderbolt: Fix for v6.0 final

This includes a single fix from Mario that resets the plug event delay
back to the USB4 spec value.

This has been in linux-next with no reported issues.

----------------------------------------------------------------
Mario Limonciello (1):
      thunderbolt: Explicitly reset plug events delay back to USB4 spec value

 drivers/thunderbolt/switch.c | 1 +
 1 file changed, 1 insertion(+)
