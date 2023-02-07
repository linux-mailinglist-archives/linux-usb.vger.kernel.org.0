Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6A3568D64E
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 13:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbjBGMTE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 07:19:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231661AbjBGMTD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 07:19:03 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A492916E
        for <linux-usb@vger.kernel.org>; Tue,  7 Feb 2023 04:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675772342; x=1707308342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=65Zile9WdO0Mi8LCaNFiWxLs0lzNOXy7iShOpkhjyz8=;
  b=CWKoZKpzf1+hXNU50Aq8l5iYWtGyhPh3hZiEWsOSYsx7BdKLVYXocdZE
   myukPwsjGZ/MahLTQnu0ipK+uPimEm2gtiVECvIRL+plmm4VmGb1tNbvN
   L3C+pUorvaM3g1VrKpuu8xfqJcWc7gBS43cB3jseSjugHMtxM5I34ThS0
   QXv3b9AQ8cwwZinayO2lKn+N06iQwmt8BEgj+EdTQ86qz+MadTRHQwuni
   9K6b4FjxJIhrZ29QeFR1njlyxx9RAy90G+g7l9onkCpwrXFMtP9BgX5ro
   HGhYtWREPxm2auBb4tuPKvpiBPYcA2YzvWM5VFZeoS7JmNxL2PqAWVKy3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="415709733"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="415709733"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 04:19:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="912309570"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="912309570"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Feb 2023 04:19:00 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pPMw8-0003XG-0j;
        Tue, 07 Feb 2023 12:19:00 +0000
Date:   Tue, 7 Feb 2023 20:18:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 34/39] drivers/usb/gadget/configfs.c:824:6:
 warning: variable 'ret' set but not used
Message-ID: <202302072028.rI3pAivq-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   cf13d6e4a9aa6639c173fd630d82d586a2322ff9
commit: 15a7cf8caabee4613764abe7814dd3162cb64137 [34/39] usb: gadget: configfs: Support arbitrary string descriptors
config: i386-randconfig-a004-20230206 (https://download.01.org/0day-ci/archive/20230207/202302072028.rI3pAivq-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=15a7cf8caabee4613764abe7814dd3162cb64137
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout 15a7cf8caabee4613764abe7814dd3162cb64137
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/usb/gadget/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/configfs.c:824:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret;
               ^
   1 warning generated.


vim +/ret +824 drivers/usb/gadget/configfs.c

   818	
   819	static ssize_t gadget_string_s_store(struct config_item *item, const char *page,
   820					     size_t len)
   821	{
   822		struct gadget_string *string = to_gadget_string(item);
   823		int size = min(sizeof(string->string), len + 1);
 > 824		int ret;
   825	
   826		if (len > USB_MAX_STRING_LEN)
   827			return -EINVAL;
   828	
   829		ret = strscpy(string->string, page, size);
   830		return len;
   831	}
   832	CONFIGFS_ATTR(gadget_string_, s);
   833	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
