Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9E926FD20A
	for <lists+linux-usb@lfdr.de>; Wed, 10 May 2023 00:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236099AbjEIWE7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 May 2023 18:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235123AbjEIWE6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 May 2023 18:04:58 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2DC422B
        for <linux-usb@vger.kernel.org>; Tue,  9 May 2023 15:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683669895; x=1715205895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9/P81WHdTJbxaMSzeklpkHr2QdhoRoTstEJFSrWxSg8=;
  b=iUAoZyUct4cGyOgk49ZykvEAHUz4InqBAvQuNH4unnmcJoQbA0GZCXZk
   rtcwtTKXLQTu+Ws+I0h/8+hsyxnf4hU+twRq8PnWqymASnvztNQl6meSs
   8rGWaUQyxD0WzFA8Kst39vktVQvJkyRAJEbLZWBqtp5gPqA9BGDQs3qcC
   YxshgysoJF/jFh9HYqB9Y7yqDlxDJPnrDKY7bpKATZKKb8cUsSGQQLHRN
   F6PEy0WMSglrNxBExqCjrQ5jNoCVZRB77ivHBK0GO2CiI6Km/4iwDYNt7
   tdSSwXHyWS3NPLuhlwJ4udMxLvsRbJLAR5fiK/RNkmeuEQegij2vBXngo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="350095812"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="350095812"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 15:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="768674791"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="768674791"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 May 2023 15:04:53 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pwVS0-0002YC-15;
        Tue, 09 May 2023 22:04:52 +0000
Date:   Wed, 10 May 2023 06:04:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: Re: [PATCH v8] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
Message-ID: <202305100533.3s1xdH64-lkp@intel.com>
References: <20230504045052.22347-1-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504045052.22347-1-quic_ugoswami@quicinc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
[also build test WARNING on usb/usb-next usb/usb-linus driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus johan-usb-serial/usb-next johan-usb-serial/usb-linus linus/master v6.4-rc1 next-20230509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Udipto-Goswami/usb-dwc3-debugfs-Prevent-any-register-access-when-devices-is-runtime-suspended/20230504-125225
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230504045052.22347-1-quic_ugoswami%40quicinc.com
patch subject: [PATCH v8] usb: dwc3: debugfs: Prevent any register access when devices is runtime suspended
config: hexagon-randconfig-r024-20230509 (https://download.01.org/0day-ci/archive/20230510/202305100533.3s1xdH64-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1c53edaeee33380f0fc3e0d262829ffaa66f45e1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Udipto-Goswami/usb-dwc3-debugfs-Prevent-any-register-access-when-devices-is-runtime-suspended/20230504-125225
        git checkout 1c53edaeee33380f0fc3e0d262829ffaa66f45e1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/usb/dwc3/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100533.3s1xdH64-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/dwc3/debugfs.c:23:
   In file included from drivers/usb/dwc3/core.h:20:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/usb/dwc3/debugfs.c:23:
   In file included from drivers/usb/dwc3/core.h:20:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/usb/dwc3/debugfs.c:23:
   In file included from drivers/usb/dwc3/core.h:20:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/usb/dwc3/debugfs.c:720:3: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
                   return ret;
                   ^
   drivers/usb/dwc3/debugfs.c:718:2: note: previous statement is here
           if (ret < 0)
           ^
   7 warnings generated.


vim +/if +720 drivers/usb/dwc3/debugfs.c

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
   718		if (ret < 0)
   719			pm_runtime_put_sync(dwc->dev);
 > 720			return ret;
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
