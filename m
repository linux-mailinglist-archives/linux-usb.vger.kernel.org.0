Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4417E79A519
	for <lists+linux-usb@lfdr.de>; Mon, 11 Sep 2023 09:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234737AbjIKHy7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 03:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbjIKHy4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 03:54:56 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88EB9100
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 00:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694418891; x=1725954891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rw+1GpQVF2iqb5KxEMblRebBygcxvlmM9MdvNnizhls=;
  b=LxN7B/hYVjQ3uFuU2BpgWBZvY9BNaSXEjRUTdaL+KSk59gDfkE2/5ziK
   ShpC5TRGAPLftIctdc/ezFqkJ24XnaoMlXU5fIeKjBmMmImcO03XoNQJa
   sFfaVbMyL6lwxzsR3vabyTGO4B6iYvZvliRBZFw4D057MXWMVvEAOmuqy
   UNRf1i/B2Pvwv9UjOvs7MWyvMd/6i+gfwGqbvfGj2nrEhIKuq/AKShPnl
   fd81/g/bqxlnGug86DcRiqeGfFTIN8ZaQ58/pF0ieIK6CrxAIaI/11cfq
   kHQrhDXPnklpozpW1yJOPnQNDn3xiJ9vcQqSTmalrn+VgrxWlyzNxbMLN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="444436832"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="444436832"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 00:54:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="693003165"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="693003165"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Sep 2023 00:54:44 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qfbkn-0005xL-2S;
        Mon, 11 Sep 2023 07:54:41 +0000
Date:   Mon, 11 Sep 2023 15:54:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Neal Liu <neal_liu@aspeedtech.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Bin Liu <b-liu@ti.com>, Kevin Cernekee <cernekee@gmail.com>,
        Justin Chen <justin.chen@broadcom.com>,
        Al Cooper <alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Herve Codina <herve.codina@bootlin.com>,
        hierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <monstr@monstr.eu>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Hongren Zheng <i@zenithal.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: Re: [PATCH 04/11] usb: udc: assign epnum for each usb endpoint
Message-ID: <202309111507.a1IUZf1O-lkp@intel.com>
References: <20230911042843.2711-5-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911042843.2711-5-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Linyu,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus tegra/for-next linus/master v6.6-rc1 next-20230911]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Linyu-Yuan/usb-gadget-add-anonymous-definition-in-struct-usb_gadget/20230911-123307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230911042843.2711-5-quic_linyyuan%40quicinc.com
patch subject: [PATCH 04/11] usb: udc: assign epnum for each usb endpoint
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230911/202309111507.a1IUZf1O-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111507.a1IUZf1O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111507.a1IUZf1O-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/gadget/udc/tegra-xudc.c: In function 'tegra_xudc_alloc_ep':
>> drivers/usb/gadget/udc/tegra-xudc.c:3176:19: error: 'struct tegra_xudc_ep' has no member named 'ep'
    3176 |                 ep->ep.epnum = index / 2;
         |                   ^~
   drivers/usb/gadget/udc/tegra-xudc.c:3190:19: error: 'struct tegra_xudc_ep' has no member named 'ep'
    3190 |                 ep->ep.epnum = 0;
         |                   ^~


vim +3176 drivers/usb/gadget/udc/tegra-xudc.c

  3150	
  3151	static int tegra_xudc_alloc_ep(struct tegra_xudc *xudc, unsigned int index)
  3152	{
  3153		struct tegra_xudc_ep *ep = &xudc->ep[index];
  3154	
  3155		ep->xudc = xudc;
  3156		ep->index = index;
  3157		ep->context = &xudc->ep_context[index];
  3158		INIT_LIST_HEAD(&ep->queue);
  3159	
  3160		/*
  3161		 * EP1 would be the input endpoint corresponding to EP0, but since
  3162		 * EP0 is bi-directional, EP1 is unused.
  3163		 */
  3164		if (index == 1)
  3165			return 0;
  3166	
  3167		ep->transfer_ring = dma_pool_alloc(xudc->transfer_ring_pool,
  3168						   GFP_KERNEL,
  3169						   &ep->transfer_ring_phys);
  3170		if (!ep->transfer_ring)
  3171			return -ENOMEM;
  3172	
  3173		if (index) {
  3174			snprintf(ep->name, sizeof(ep->name), "ep%u%s", index / 2,
  3175				 (index % 2 == 0) ? "out" : "in");
> 3176			ep->ep.epnum = index / 2;
  3177			ep->usb_ep.name = ep->name;
  3178			usb_ep_set_maxpacket_limit(&ep->usb_ep, 1024);
  3179			ep->usb_ep.max_streams = 16;
  3180			ep->usb_ep.ops = &tegra_xudc_ep_ops;
  3181			ep->usb_ep.caps.type_bulk = true;
  3182			ep->usb_ep.caps.type_int = true;
  3183			if (index & 1)
  3184				ep->usb_ep.caps.dir_in = true;
  3185			else
  3186				ep->usb_ep.caps.dir_out = true;
  3187			list_add_tail(&ep->usb_ep.ep_list, &xudc->gadget.ep_list);
  3188		} else {
  3189			strscpy(ep->name, "ep0", 3);
  3190			ep->ep.epnum = 0;
  3191			ep->usb_ep.name = ep->name;
  3192			usb_ep_set_maxpacket_limit(&ep->usb_ep, 512);
  3193			ep->usb_ep.ops = &tegra_xudc_ep0_ops;
  3194			ep->usb_ep.caps.type_control = true;
  3195			ep->usb_ep.caps.dir_in = true;
  3196			ep->usb_ep.caps.dir_out = true;
  3197		}
  3198	
  3199		return 0;
  3200	}
  3201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
