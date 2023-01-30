Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61E79681601
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 17:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236723AbjA3QKf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 11:10:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237153AbjA3QKb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 11:10:31 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C35623D0B9
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 08:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675095030; x=1706631030;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qP/xji/U4WCjQ8ujBJU9lFncC+QI6BbWZ3144OxqwM4=;
  b=iQXrGdxqKGeKf7bYYHwl3gmYy0t5eWynmD/MBDveqmqREAdnD9jsW69r
   IBLiy0OfW8DN/I5Pgxpe/VaqYoIM2RBI7yF68m4zn9MXiAVKRKzMe+dnH
   BDtIul9yglXcdttHdz+cFZ3ivjEg4AE20hSnO8/4kL3vkaE0JTSRAlso+
   5/ZurkKhPsMhaL0ta5NojaCUNOn3IO2LjyS+DxWPODDn5kOIbGtiZtBsD
   FbWuxcCFkuraDQZQlYOBG2gz6gzn65tX29EMaOAamLeln+Eb5fycdTABC
   D6I+8iacKOSULz5TTC+Xuhqq2SH9OrzTQtA6bdAhkepDm2n6KUBXUubcu
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="307942406"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="307942406"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 08:08:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="641597691"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="641597691"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Jan 2023 08:08:08 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pMWhT-0003jS-1L;
        Mon, 30 Jan 2023 16:08:07 +0000
Date:   Tue, 31 Jan 2023 00:07:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     oe-kbuild-all@lists.linux.dev, mgr@pengutronix.de,
        balbi@kernel.org, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, stern@rowland.harvard.edu,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v3 06/11] usb: gadget: configfs: Support arbitrary string
 descriptors
Message-ID: <202301302344.mwzUOCim-lkp@intel.com>
References: <20230130093443.25644-7-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130093443.25644-7-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-linus]
[also build test WARNING on westeri-thunderbolt/next linus/master v6.2-rc6 next-20230130]
[cannot apply to usb/usb-testing usb/usb-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/usb-gadget-uvc-Make-bSourceID-read-write/20230130-174215
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
patch link:    https://lore.kernel.org/r/20230130093443.25644-7-dan.scally%40ideasonboard.com
patch subject: [PATCH v3 06/11] usb: gadget: configfs: Support arbitrary string descriptors
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230130/202301302344.mwzUOCim-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/452304e81fac1427f314a4b0beef8561ef4ebf17
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Scally/usb-gadget-uvc-Make-bSourceID-read-write/20230130-174215
        git checkout 452304e81fac1427f314a4b0beef8561ef4ebf17
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/usb/gadget/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/configfs.c: In function 'gadget_string_s_store':
>> drivers/usb/gadget/configfs.c:811:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     811 |         int ret;
         |             ^~~


vim +/ret +811 drivers/usb/gadget/configfs.c

   805	
   806	static ssize_t gadget_string_s_store(struct config_item *item, const char *page,
   807					     size_t len)
   808	{
   809		struct gadget_string *string = to_gadget_string(item);
   810		int size = min(sizeof(string->string), len + 1);
 > 811		int ret;
   812	
   813		if (len > USB_MAX_STRING_LEN)
   814			return -EINVAL;
   815	
   816		ret = strscpy(string->string, page, size);
   817		return len;
   818	}
   819	CONFIGFS_ATTR(gadget_string_, s);
   820	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
