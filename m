Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA20F767923
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jul 2023 01:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233800AbjG1Xst (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jul 2023 19:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjG1Xsr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jul 2023 19:48:47 -0400
Received: from mgamail.intel.com (unknown [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F17422C
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 16:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690588126; x=1722124126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S9IBxkNG+RbHBQj2Nn9W+yro3ABRrGiQH5vd15aoFAA=;
  b=CwaHD8HmQ0dzbrEVLZhfbMEw7B2AQ7ZF5pzaT+rm4vYvpRXw4vlk5veO
   RObTw05WW6m7BkGAhHQ9vB9aHRpfcLhvXtU1Mp2HXoB9lRoSi4Ml7lNM3
   rV8tvxTjvAzP5vfqvfyGeKL+qRQ3BMUw+kBcIhpbma5aT6v2LV3eNJZzp
   V7Kw+0n+lUvuENVwI1KRcSdZiwK8d2QJF5R6e9VB9unIxU+Gsogp5KvQW
   Noh1HeMvw2HOC+u4KwsamqrNEU0svBb5rY+lJ5B7kSJEqmi0RKqXo5u2r
   4EnNtgrTZ5X4i/TIimPlqaVQI3rNGOpCDLVCkiD9+nSsbP47+BXEZiJhJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="367590263"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="367590263"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 16:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="793075782"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="793075782"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jul 2023 16:48:45 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPXC3-0003fp-12;
        Fri, 28 Jul 2023 23:48:28 +0000
Date:   Sat, 29 Jul 2023 07:47:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Stanley Chang <stanley_chang@realtek.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-next 26/67] drivers/phy/realtek/phy-rtk-usb2.c:715:
 undefined reference to `usb_debug_root'
Message-ID: <202307290733.weSlHrGp-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   ba0b3af706305e5b11fd832eecd2c4a7fce57156
commit: 134e6d25f6bd06071e5aac0a7eefcea6f7713955 [26/67] phy: realtek: usb: Add driver for the Realtek SoC USB 2.0 PHY
config: openrisc-randconfig-r005-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290733.weSlHrGp-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290733.weSlHrGp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290733.weSlHrGp-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/phy/realtek/phy-rtk-usb2.o: in function `create_phy_debug_root':
>> drivers/phy/realtek/phy-rtk-usb2.c:715: undefined reference to `usb_debug_root'
>> or1k-linux-ld: drivers/phy/realtek/phy-rtk-usb2.c:715: undefined reference to `usb_debug_root'
   or1k-linux-ld: drivers/phy/realtek/phy-rtk-usb2.c:717: undefined reference to `usb_debug_root'
   pahole: .tmp_vmlinux.btf: Invalid argument
   .btf.vmlinux.bin.o: file not recognized: file format not recognized


vim +715 drivers/phy/realtek/phy-rtk-usb2.c

   709	
   710	#ifdef CONFIG_DEBUG_FS
   711	static struct dentry *create_phy_debug_root(void)
   712	{
   713		struct dentry *phy_debug_root;
   714	
 > 715		phy_debug_root = debugfs_lookup("phy", usb_debug_root);
   716		if (!phy_debug_root)
   717			phy_debug_root = debugfs_create_dir("phy", usb_debug_root);
   718	
   719		return phy_debug_root;
   720	}
   721	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
