Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C42751FA5D
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 12:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbiEIKvR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 06:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbiEIKur (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 06:50:47 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2F12229CB
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 03:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652093164; x=1683629164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fGy4BHaibkEWIiCQTkP5rqs5MJxFAxQjwU/NNrJdp0I=;
  b=O+VN/6qh8kpBQNoUxRPqkxPd4fsPqlZ5Mlw/ExswlF8LCWp/Ljk61xY1
   1jGX7FQ2Szw7Cxsqrzc3/D7d+uIno7pyqqxeeoKGxSlssR1phpFmELMWO
   nPc4H1joNL3IX5rxYDAhV7FhegUFfm8H+jAbYweugsCZ44MuiK5x6ppBe
   cAtsUTazP+I2TD1fCeIEBHjhfSarLk8faWKRbsx9Fad0xNSy2cFzHujDH
   ESvpGS7GHn8y/ZcZNXRph53ooT3cBsFI+HnrPookX7LFeqGL6LSVrIBfw
   KhZiK1uNxPzq8WRKY8Req7a+OwJPFXNjCDVSKgTLgUX+Zu5+eGEkA6DNq
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="294236131"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; 
   d="scan'208";a="294236131"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 03:46:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; 
   d="scan'208";a="696410822"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 May 2022 03:45:58 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1no0tp-000GQu-Ra;
        Mon, 09 May 2022 10:45:57 +0000
Date:   Mon, 9 May 2022 18:45:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Jack Pham <quic_jackp@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: Re: [PATCH v2] usb: gadget: update DECLARE_USB_FUNCTION(_INIT) macro
Message-ID: <202205091809.29x90X9b-lkp@intel.com>
References: <1652077685-30622-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652077685-30622-1-git-send-email-quic_linyyuan@quicinc.com>
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
[also build test ERROR on balbi-usb/testing/next peter-chen-usb/for-usb-next v5.18-rc6 next-20220506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Linyu-Yuan/usb-gadget-update-DECLARE_USB_FUNCTION-_INIT-macro/20220509-144542
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: x86_64-randconfig-a011-20220509 (https://download.01.org/0day-ci/archive/20220509/202205091809.29x90X9b-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/5c9f589ea23bf995436cde6bd39f1c5b2cc1ec4f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Linyu-Yuan/usb-gadget-update-DECLARE_USB_FUNCTION-_INIT-macro/20220509-144542
        git checkout 5c9f589ea23bf995436cde6bd39f1c5b2cc1ec4f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: drivers/usb/gadget/function/f_sourcesink.o: in function `sslb_modinit':
>> drivers/usb/gadget/function/f_sourcesink.c:1270: multiple definition of `init_module'; drivers/usb/gadget/function/f_loopback.o:drivers/usb/gadget/function/f_loopback.c:586: first defined here
   ld: drivers/usb/gadget/function/f_sourcesink.o: in function `sslb_modexit':
>> drivers/usb/gadget/function/f_sourcesink.c:1283: multiple definition of `cleanup_module'; drivers/usb/gadget/function/f_loopback.o:drivers/usb/gadget/function/f_loopback.c:586: first defined here


vim +1270 drivers/usb/gadget/function/f_sourcesink.c

cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1245  
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1246  static struct usb_function_instance *source_sink_alloc_inst(void)
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1247  {
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1248  	struct f_ss_opts *ss_opts;
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1249  
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1250  	ss_opts = kzalloc(sizeof(*ss_opts), GFP_KERNEL);
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1251  	if (!ss_opts)
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1252  		return ERR_PTR(-ENOMEM);
25d8015177ae7ba drivers/usb/gadget/f_sourcesink.c          Andrzej Pietrasiewicz     2013-11-07  1253  	mutex_init(&ss_opts->lock);
9890e33013fae0d drivers/usb/gadget/f_sourcesink.c          Andrzej Pietrasiewicz     2013-04-18  1254  	ss_opts->func_inst.free_func_inst = source_sink_free_instance;
25d8015177ae7ba drivers/usb/gadget/f_sourcesink.c          Andrzej Pietrasiewicz     2013-11-07  1255  	ss_opts->isoc_interval = GZERO_ISOC_INTERVAL;
25d8015177ae7ba drivers/usb/gadget/f_sourcesink.c          Andrzej Pietrasiewicz     2013-11-07  1256  	ss_opts->isoc_maxpacket = GZERO_ISOC_MAXPACKET;
25d8015177ae7ba drivers/usb/gadget/f_sourcesink.c          Andrzej Pietrasiewicz     2013-11-07  1257  	ss_opts->bulk_buflen = GZERO_BULK_BUFLEN;
0d6c3d96678d115 drivers/usb/gadget/function/f_sourcesink.c Peter Chen                2015-11-19  1258  	ss_opts->bulk_qlen = GZERO_SS_BULK_QLEN;
0d6c3d96678d115 drivers/usb/gadget/function/f_sourcesink.c Peter Chen                2015-11-19  1259  	ss_opts->iso_qlen = GZERO_SS_ISO_QLEN;
25d8015177ae7ba drivers/usb/gadget/f_sourcesink.c          Andrzej Pietrasiewicz     2013-11-07  1260  
25d8015177ae7ba drivers/usb/gadget/f_sourcesink.c          Andrzej Pietrasiewicz     2013-11-07  1261  	config_group_init_type_name(&ss_opts->func_inst.group, "",
25d8015177ae7ba drivers/usb/gadget/f_sourcesink.c          Andrzej Pietrasiewicz     2013-11-07  1262  				    &ss_func_type);
25d8015177ae7ba drivers/usb/gadget/f_sourcesink.c          Andrzej Pietrasiewicz     2013-11-07  1263  
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1264  	return &ss_opts->func_inst;
544aca39e670421 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1265  }
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1266  DECLARE_USB_FUNCTION(SourceSink, source_sink_alloc_inst,
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1267  		source_sink_alloc_func);
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1268  
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1269  static int __init sslb_modinit(void)
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23 @1270  {
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1271  	int ret;
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1272  
5c9f589ea23bf99 drivers/usb/gadget/function/f_sourcesink.c Linyu Yuan                2022-05-09  1273  	ret = usb_function_register(&SourceSink_usb_func);
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1274  	if (ret)
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1275  		return ret;
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1276  	ret = lb_modinit();
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1277  	if (ret)
5c9f589ea23bf99 drivers/usb/gadget/function/f_sourcesink.c Linyu Yuan                2022-05-09  1278  		usb_function_unregister(&SourceSink_usb_func);
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1279  	return ret;
544aca39e670421 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1280  }
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1281  static void __exit sslb_modexit(void)
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1282  {
5c9f589ea23bf99 drivers/usb/gadget/function/f_sourcesink.c Linyu Yuan                2022-05-09 @1283  	usb_function_unregister(&SourceSink_usb_func);
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1284  	lb_modexit();
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1285  }
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1286  module_init(sslb_modinit);
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1287  module_exit(sslb_modexit);
cf9a08ae5aece88 drivers/usb/gadget/f_sourcesink.c          Sebastian Andrzej Siewior 2012-12-23  1288  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
