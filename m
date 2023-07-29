Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95DA5767B79
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jul 2023 04:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbjG2CLs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jul 2023 22:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjG2CLr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jul 2023 22:11:47 -0400
Received: from mgamail.intel.com (unknown [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF143A8B
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 19:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690596706; x=1722132706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=afVEVL+qLb96uoYJzObpGi8s9n5ICgCEQNAZ6Gs8pNM=;
  b=SdrKWtxbzgg63WLzdxjIMmeKSypEyZ/1Ew3KP7YtHf82mcNDwW9PC656
   AOfqyPT//8e+zCAX2rs2YDtjIvobtpEUM7GcyD5h5qhSMqQFVdJpwsUgS
   7Ax3z3pZaOwGP29Gb/5MRnh4MB8fZInzUMLdi70Sx2Tx3U23fDHXRUdri
   oj81gRboPf37vTqkm+qZgK6r9xH2sdx7SbiosXCYj3FnUZVsz5VvZ/itX
   sP9zbplq/u8aQ1AJgG6JNZhNZaVPhsB/+iItlvdOIHq0OyzUwEfWEwYsK
   ITg3pJA1M/VZDu1VceHhJBZU9Ni2QumRMORr+PvNNemunWhVeXStMlSD4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="371419490"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="371419490"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 19:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="901499558"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="901499558"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 28 Jul 2023 19:11:44 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPZQm-0003kx-0r;
        Sat, 29 Jul 2023 02:11:44 +0000
Date:   Sat, 29 Jul 2023 10:11:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Stanley Chang <stanley_chang@realtek.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-next 27/67] drivers/phy/realtek/phy-rtk-usb3.c:349:
 undefined reference to `usb_debug_root'
Message-ID: <202307291022.3pVeTR9z-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   ba0b3af706305e5b11fd832eecd2c4a7fce57156
commit: adda6e82a7de7d6d478f6c8ef127f0ac51c510a1 [27/67] phy: realtek: usb: Add driver for the Realtek SoC USB 3.0 PHY
config: openrisc-randconfig-r005-20230728 (https://download.01.org/0day-ci/archive/20230729/202307291022.3pVeTR9z-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291022.3pVeTR9z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291022.3pVeTR9z-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/phy/realtek/phy-rtk-usb2.o: in function `create_phy_debug_root':
   drivers/phy/realtek/phy-rtk-usb2.c:715: undefined reference to `usb_debug_root'
   or1k-linux-ld: drivers/phy/realtek/phy-rtk-usb2.c:715: undefined reference to `usb_debug_root'
   or1k-linux-ld: drivers/phy/realtek/phy-rtk-usb2.c:717: undefined reference to `usb_debug_root'
   or1k-linux-ld: drivers/phy/realtek/phy-rtk-usb3.o: in function `create_phy_debug_root':
>> drivers/phy/realtek/phy-rtk-usb3.c:349: undefined reference to `usb_debug_root'
>> or1k-linux-ld: drivers/phy/realtek/phy-rtk-usb3.c:349: undefined reference to `usb_debug_root'
   or1k-linux-ld: drivers/phy/realtek/phy-rtk-usb3.o:drivers/phy/realtek/phy-rtk-usb3.c:351: more undefined references to `usb_debug_root' follow
   pahole: .tmp_vmlinux.btf: Invalid argument
   .btf.vmlinux.bin.o: file not recognized: file format not recognized


vim +349 drivers/phy/realtek/phy-rtk-usb3.c

   343	
   344	#ifdef CONFIG_DEBUG_FS
   345	static struct dentry *create_phy_debug_root(void)
   346	{
   347		struct dentry *phy_debug_root;
   348	
 > 349		phy_debug_root = debugfs_lookup("phy", usb_debug_root);
   350		if (!phy_debug_root)
   351			phy_debug_root = debugfs_create_dir("phy", usb_debug_root);
   352	
   353		return phy_debug_root;
   354	}
   355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
