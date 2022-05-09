Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5356A5204AA
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 20:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240257AbiEISoc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 14:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240216AbiEISob (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 14:44:31 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E6427E3DF
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 11:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652121636; x=1683657636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZJrJlhZhMrrkTlXLyOF5UrIzeEttb+GY8glYwnxFkiw=;
  b=NFFsf5wxHj1+8cvlkWlzjreii12huP/jGRTNMIqFG1gkHl5OuKqah71C
   Pe9muLXg+ZxiP6WLFsSVMDyQH3l5C7HYGbERkzB2Hk7JZ2HEP9Fz+rU7m
   EmHRSvEQKloGWBcVKnH7KfaDEy1vA+k9y/eHpjyVD0aML1RMgbqdNV8iR
   JYSuxznD08x3BzGmq2swrJipKqYB8D4TT5XOeUnVQ2rzDJ8qpZ/POGJ9P
   sL0hYLl5eK4pgffpr2tjYSHDbgmdBlQo2Mru3EGRgBNOAjnq6ZDKP+32Q
   1E74kPuxG+Sa78wW20UGQshgsYU5gLsG60Q6eCzrmicpDAEOcJdLSa7nU
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="294364050"
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="294364050"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 11:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="657261256"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 May 2022 11:39:52 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1no8IR-000GmK-J4;
        Mon, 09 May 2022 18:39:51 +0000
Date:   Tue, 10 May 2022 02:39:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Jack Pham <quic_jackp@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: Re: [PATCH v3 3/4] usb: gadget: f_loopback: use
 DECLARE_USB_FUNCTION_INIT() macro
Message-ID: <202205100203.Eqt29eI6-lkp@intel.com>
References: <1652097288-19909-4-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652097288-19909-4-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Linyu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on v5.18-rc6 next-20220509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Linyu-Yuan/usb-gadget-update-DECLARE_USB_FUNCTION-_INIT-macro/20220509-200328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: sparc-randconfig-m031-20220509 (https://download.01.org/0day-ci/archive/20220510/202205100203.Eqt29eI6-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9af25f078e024028630e40f8b81ae7e9d3b29554
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Linyu-Yuan/usb-gadget-update-DECLARE_USB_FUNCTION-_INIT-macro/20220509-200328
        git checkout 9af25f078e024028630e40f8b81ae7e9d3b29554
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sparc-linux-ld: sparc-linux-ld: DWARF error: could not find abbrev number 9829
   drivers/usb/gadget/function/f_sourcesink.o: in function `SourceSinkmod_init':
>> f_sourcesink.c:(.init.text+0x0): multiple definition of `init_module'; sparc-linux-ld: DWARF error: could not find abbrev number 198689821
   drivers/usb/gadget/function/f_loopback.o:f_loopback.c:(.init.text+0x0): first defined here
   sparc-linux-ld: drivers/usb/gadget/function/f_sourcesink.o: in function `SourceSinkmod_exit':
   f_sourcesink.c:(.exit.text+0x0): multiple definition of `cleanup_module'; drivers/usb/gadget/function/f_loopback.o:f_loopback.c:(.exit.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
