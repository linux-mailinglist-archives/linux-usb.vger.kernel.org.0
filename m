Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9B596A2BFA
	for <lists+linux-usb@lfdr.de>; Sat, 25 Feb 2023 23:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjBYWCs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Feb 2023 17:02:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjBYWCr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Feb 2023 17:02:47 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018EF61AF
        for <linux-usb@vger.kernel.org>; Sat, 25 Feb 2023 14:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677362565; x=1708898565;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DP+iz1Hn2/7DUwfWJgDMNGRwaTqASEADi1gZrzBhuwg=;
  b=VmEN/ukeimqpAsxah5ibdupSzZdesb9x7iF2F2YF7ryw67NkIhpm8Hxu
   1E+La6//ly2WrWJ1g20K1Wogid1db6D3pKQowVHUGKe0+lQ484vodQNZl
   uqs/0XF6PkjdxNCZi6BHnb/kHZZI3pbKjqqlY+wjf02wsX+cwGeuaWPrN
   0kexQewDe3m8Xk4XjgCwDb8r2WBZCftq3UPKZ0sGuMeZch7sOXicXJBL1
   P5BvtLXZ2hEN7TIPDgEyicpxi6BujIzJIoG+b0uTqdSTZ0wk0nuWg7VeG
   Stcg1EZi6iOXPpOJOYusEymidpL9Of3I2AS4bM9tBOuMkf3kjQyHnLXjg
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="361215904"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="361215904"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 14:02:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="703558190"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="703558190"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 Feb 2023 14:02:43 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pW2cs-0003QR-34;
        Sat, 25 Feb 2023 22:02:42 +0000
Date:   Sun, 26 Feb 2023 06:02:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 30bdc1e366b976744354c5c54d8e251b31cf0d35
Message-ID: <63fa855c.CTJ54kGkrV9LcMoh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: 30bdc1e366b976744354c5c54d8e251b31cf0d35  USB: disable all RNDIS protocol drivers

elapsed time: 720m

configs tested: 19
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
clang                                   alpha   defconfig
gcc                                       arc   defconfig
gcc                                       arm   defconfig
gcc                                     arm64   defconfig
gcc                                      csky   defconfig
gcc                                      i386   defconfig
gcc                                      ia64   defconfig
gcc                                 loongarch   defconfig
gcc                                      m68k   defconfig
gcc                                     nios2   defconfig
gcc                                    parisc   defconfig
gcc                                  parisc64   defconfig
gcc                                     riscv   defconfig
gcc                                     riscv   rv32_defconfig
gcc                                      s390   defconfig
gcc                                     sparc   defconfig
gcc                                        um   i386_defconfig
gcc                                        um   x86_64_defconfig
gcc                                    x86_64   defconfig
gcc                                                  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
