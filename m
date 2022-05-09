Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D48F51F7FF
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 11:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234711AbiEIJ1o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 05:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238373AbiEIJIx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 05:08:53 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 518AA1F68D4
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 02:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652087088; x=1683623088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XHjKel1jGmEKeYL1JxEVErQG7gKbNDEg2TKyyul7CQM=;
  b=SaHrvySt1dfrvM8eYgT+eHKwx+7q+gEXmds1l5+4cCpifVxSCD1tnjDX
   5vmVNwqW0uos6ezMY2j3kbV1y7n+5RbkWJZlq9UT98EG8Pce+/wDrzd82
   rWTls9iAfwYSU5dp8SGf1kFBn2sZuZr5RXCzpd5defBTLBbFZ5ZX/7y/s
   FzxatwIG+biMySwyD62SWcRvHaxtD2pVTCYtQdT0vBpcv1QQah8gi3Tj3
   VU2oxzbz+1SmKwThRxjhfqU5Wv1il5MfZjK0pwaQ0L6QD8YO2q+fP/7r3
   r1Mn32nco8Q6yLDSlCT0ArUECePT1CSBmHSDWbJDY5pVQwYQX3vNsMBNJ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="268650716"
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; 
   d="scan'208";a="268650716"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 02:04:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; 
   d="scan'208";a="540071439"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 May 2022 02:04:35 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nnzJj-000GNC-6v;
        Mon, 09 May 2022 09:04:35 +0000
Date:   Mon, 9 May 2022 17:04:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Jack Pham <quic_jackp@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: Re: [PATCH v2] usb: gadget: update DECLARE_USB_FUNCTION(_INIT) macro
Message-ID: <202205091634.SZNjdkFo-lkp@intel.com>
References: <1652077685-30622-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652077685-30622-1-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
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
[also build test ERROR on v5.18-rc6 next-20220506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Linyu-Yuan/usb-gadget-update-DECLARE_USB_FUNCTION-_INIT-macro/20220509-144542
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: nios2-randconfig-r035-20220509 (https://download.01.org/0day-ci/archive/20220509/202205091634.SZNjdkFo-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5c9f589ea23bf995436cde6bd39f1c5b2cc1ec4f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Linyu-Yuan/usb-gadget-update-DECLARE_USB_FUNCTION-_INIT-macro/20220509-144542
        git checkout 5c9f589ea23bf995436cde6bd39f1c5b2cc1ec4f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/usb/gadget/function/f_sourcesink.o: in function `sslb_modinit':
>> f_sourcesink.c:(.init.text+0x0): multiple definition of `init_module'; drivers/usb/gadget/function/f_loopback.o:f_loopback.c:(.init.text+0x0): first defined here
   nios2-linux-ld: drivers/usb/gadget/function/f_sourcesink.o: in function `sslb_modexit':
>> f_sourcesink.c:(.exit.text+0x0): multiple definition of `cleanup_module'; drivers/usb/gadget/function/f_loopback.o:f_loopback.c:(.exit.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
