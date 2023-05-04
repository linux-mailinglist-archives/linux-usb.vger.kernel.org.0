Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3716F65B6
	for <lists+linux-usb@lfdr.de>; Thu,  4 May 2023 09:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjEDH3I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 May 2023 03:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjEDH3H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 May 2023 03:29:07 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC082711
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 00:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683185345; x=1714721345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qqog3UgR/OdjR+4dTD7w94qHYBgJVGzAhZla4LARuBQ=;
  b=lksoB9JyRuc9eAARD9I9BYSFwQ9ZVxaKjNVLvAUX0KagyqKNtDYdf/Ok
   zk6ZiGnEKDKn+n9/9bQQRBGJW2V4o9V0TofUwcSI0MhQHWswb2eJmAItl
   LXl6oRtbuWuLKPj6mnHsjuRkE4/kuKHXgykm47+lQo9M0tbjn9+SMpNu5
   1D+J4eIx0KJSHOUBKQ3TBhCQ+fCtm4keeC3CpeohKoKC0j+Qp543ddqdY
   jW9QGPSsCJTRDcinTeg1Fbzj4bCQh6xWtTg0yP2iPN/8tBB4jc0WPVUhF
   nwGzURObkoFYjNjfv/0tCoGyBoqGzCn2qJIpV0IFF9xnJEp7wviranfb1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="351847513"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="351847513"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 00:29:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="786414616"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="786414616"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 May 2023 00:29:02 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1puTOf-0002gK-2J;
        Thu, 04 May 2023 07:29:01 +0000
Date:   Thu, 4 May 2023 15:28:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     oe-kbuild-all@lists.linux.dev,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: Re: [PATCH v8] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
Message-ID: <202305041526.hBiM1g2W-lkp@intel.com>
References: <20230504045052.22347-1-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504045052.22347-1-quic_ugoswami@quicinc.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Udipto,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus johan-usb-serial/usb-next johan-usb-serial/usb-linus linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Udipto-Goswami/usb-dwc3-debugfs-Prevent-any-register-access-when-devices-is-runtime-suspended/20230504-125225
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230504045052.22347-1-quic_ugoswami%40quicinc.com
patch subject: [PATCH v8] usb: dwc3: debugfs: Prevent any register access when devices is runtime suspended
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230504/202305041526.hBiM1g2W-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1c53edaeee33380f0fc3e0d262829ffaa66f45e1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Udipto-Goswami/usb-dwc3-debugfs-Prevent-any-register-access-when-devices-is-runtime-suspended/20230504-125225
        git checkout 1c53edaeee33380f0fc3e0d262829ffaa66f45e1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/usb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305041526.hBiM1g2W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/dwc3/debugfs.c: In function 'dwc3_rx_fifo_size_show':
>> drivers/usb/dwc3/debugfs.c:718:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     718 |         if (ret < 0)
         |         ^~
   drivers/usb/dwc3/debugfs.c:720:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     720 |                 return ret;
         |                 ^~~~~~


vim +/if +718 drivers/usb/dwc3/debugfs.c

   707	
   708	static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
   709	{
   710		struct dwc3_ep		*dep = s->private;
   711		struct dwc3		*dwc = dep->dwc;
   712		unsigned long		flags;
   713		u32			mdwidth;
   714		u32			val;
   715		int			ret;
   716	
   717		ret = pm_runtime_resume_and_get(dwc->dev);
 > 718		if (ret < 0)
   719			pm_runtime_put_sync(dwc->dev);
   720			return ret;
   721	
   722		spin_lock_irqsave(&dwc->lock, flags);
   723		val = dwc3_core_fifo_space(dep, DWC3_RXFIFO);
   724	
   725		/* Convert to bytes */
   726		mdwidth = dwc3_mdwidth(dwc);
   727	
   728		val *= mdwidth;
   729		val >>= 3;
   730		seq_printf(s, "%u\n", val);
   731		spin_unlock_irqrestore(&dwc->lock, flags);
   732	
   733		pm_runtime_put_sync(dwc->dev);
   734		return 0;
   735	}
   736	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
