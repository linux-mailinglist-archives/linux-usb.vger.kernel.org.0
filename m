Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA9B65A6833
	for <lists+linux-usb@lfdr.de>; Tue, 30 Aug 2022 18:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbiH3QVD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Aug 2022 12:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbiH3QUW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Aug 2022 12:20:22 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6CF7B79E
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 09:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661876417; x=1693412417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PUbt1FsjgPDaxO4q0Lxc0Bf9scd+0z99/5r+Pa2l/AQ=;
  b=e9BvfgCXZpsLFVUlqJ5mpJpoFpOZFxgVlm7LxX3kAJ7Z32uxwxquBrTa
   Dc8xre2eirKZLGSwAQnk0Wwc5sfvWeCr/EFp9yb92UI32xdBTx4kNkXxl
   pFoyooevZC4cQjqdeg7osRE/VByTtli1NSXNdm4L2TW3waDqQWu6mi18P
   Cr2SSfjkZoEGNcs0CT89efWPiKJprZntVLHLmEyf7owf8ZQ+4k+ieY1i6
   3tdFL4Lh5ADwEpFN37BiORbpgBKzZ/4oGANzWCDpBwFZSjK85+DAnIpAq
   lSiRzIxgKQAyq4TEMSBhSQMKvSiAYy0O1Y7JfKeCvrVOUTxQAutQu7fWd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="381520755"
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="381520755"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 09:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="857150657"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2022 09:11:23 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oT3pj-0000OU-12;
        Tue, 30 Aug 2022 16:11:23 +0000
Date:   Wed, 31 Aug 2022 00:10:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [usb:usb-testing 29/47] drivers/usb/host/ehci-platform.c:56:19:
 warning: 'hcd_name' defined but not used
Message-ID: <202208310007.6yJMsSYz-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   594b9411b4adceb59ca8a66997eec1eaa3756785
commit: 5cfdb45657c97315501316657e504298b381ceee [29/47] usb: reduce kernel log spam on driver registration
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220831/202208310007.6yJMsSYz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=5cfdb45657c97315501316657e504298b381ceee
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout 5cfdb45657c97315501316657e504298b381ceee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/host/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/host/ehci-platform.c:56:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]
      56 | static const char hcd_name[] = "ehci-platform";
         |                   ^~~~~~~~
--
>> drivers/usb/host/ohci-platform.c:44:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]
      44 | static const char hcd_name[] = "ohci-platform";
         |                   ^~~~~~~~


vim +/hcd_name +56 drivers/usb/host/ehci-platform.c

99f91934a907df Alan Stern 2012-11-01  55  
99f91934a907df Alan Stern 2012-11-01 @56  static const char hcd_name[] = "ehci-platform";
99f91934a907df Alan Stern 2012-11-01  57  

:::::: The code at line 56 was first introduced by commit
:::::: 99f91934a907df31ba878dfdd090002049dc476a USB: EHCI: make ehci-platform a separate driver

:::::: TO: Alan Stern <stern@rowland.harvard.edu>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
