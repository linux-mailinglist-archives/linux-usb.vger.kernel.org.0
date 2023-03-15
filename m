Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4311C6BA609
	for <lists+linux-usb@lfdr.de>; Wed, 15 Mar 2023 05:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbjCOEML (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Mar 2023 00:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbjCOELu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Mar 2023 00:11:50 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 338624ECD1;
        Tue, 14 Mar 2023 21:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678853472; x=1710389472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NmlTEcB7miDnUD/zT191iNoKNj9ysREtbMNV9yeHARU=;
  b=JQeK6C6dF9PG3BnMhgJ7DjzuBWXHKhP71rtMDgZ1TNulTsGw95bOss8T
   neDSHD7gtpk0cUzg3HxlVh7A6NDrgGpYTVSpghXY/QUiS16+dYqI6ZZ9N
   awfV8TwRjJi21ZgHCQNZMvgePLPQMu9tqIxaF0Xp3334IbtEZn4R+2yNz
   WHHThrwJkyWNgDr2H0gvg2l5AjofPX2E3rKZVhuiPJVFAPMqrraRAZUcS
   ZyNPYJ6uqjACOiKc6P4tvFN9/IxAhXb1F/2G6x8eyIbwxqgndsVlqXVw9
   efpc8Ay1JUr5S3IIGY5Wvvi+y56+eggrtzo61b49wAJzbyFUGA7y4oCBE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="400191839"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; 
   d="scan'208";a="400191839"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 21:11:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="672591554"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; 
   d="scan'208";a="672591554"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Mar 2023 21:11:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pcITj-0007Pz-0h;
        Wed, 15 Mar 2023 04:11:07 +0000
Date:   Wed, 15 Mar 2023 12:10:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Paul Cercueil <paul@crapouillou.net>,
        michael.hennerich@analog.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        nuno.sa@analog.com, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: functionfs: Add DMABUF import interface
Message-ID: <202303151116.lxbyxGM6-lkp@intel.com>
References: <20230314105257.17345-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314105257.17345-3-paul@crapouillou.net>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Paul,

I love your patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.3-rc2 next-20230314]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/usb-gadget-Support-already-mapped-DMA-SGs/20230314-185522
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230314105257.17345-3-paul%40crapouillou.net
patch subject: [PATCH 2/2] usb: gadget: functionfs: Add DMABUF import interface
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230315/202303151116.lxbyxGM6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4ee364ed5d112c4550344fd037f4e1ef7cc41878
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paul-Cercueil/usb-gadget-Support-already-mapped-DMA-SGs/20230314-185522
        git checkout 4ee364ed5d112c4550344fd037f4e1ef7cc41878
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303151116.lxbyxGM6-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module usb_f_fs uses symbol dma_buf_attach from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module usb_f_fs uses symbol dma_buf_map_attachment from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module usb_f_fs uses symbol dma_buf_unmap_attachment from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module usb_f_fs uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module usb_f_fs uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module usb_f_fs uses symbol dma_buf_detach from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
