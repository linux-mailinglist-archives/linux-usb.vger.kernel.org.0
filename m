Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D08F47B450
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 21:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbhLTU0f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 15:26:35 -0500
Received: from mga03.intel.com ([134.134.136.65]:56635 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229461AbhLTU0e (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 15:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640031994; x=1671567994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QkGOH9bFv7PKUpKAjWUauZ9C3IGYX7VbYB5hAfh2CZo=;
  b=kiDHcREaznwhUezkKvMPhirbru8892QPtnW8AaXM/1+NxGHfvniG8e2k
   m2gd/Nvc/mIfXpd6FhvTZ2p8C/Fqpovo8ni5e4Jta+yJ2ZZLHvvQyBocg
   uHR8+mcRQg+hCU0GV0kPK+kB8QmlItdr3nvBnvUdF/OqMOoEhJWf0sATo
   WgT88Pnp7fr47eRJU1Hn5wispDhVQkqLklWuuCXtkqsxjNuhsnEIMdiO9
   mD+wi9+nqnhgBL4GiljLsE+qFvKK1M9ZhxZaopd11Q7yEn7K6heZJ2Ame
   t5XjjbKD5F+D8XCnPSU/A3I2sKTWd4vIxiamZqJT5XVoiiNzI/RsCfH26
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="240217584"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="240217584"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 12:26:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="520957686"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 20 Dec 2021 12:26:31 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mzPEj-0008CZ-8P; Mon, 20 Dec 2021 20:26:21 +0000
Date:   Tue, 21 Dec 2021 04:26:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>, linux-usb@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 04/11] usb: gadget: f_uac1: Support multiple sampling
 rates
Message-ID: <202112210422.0fC1uDBA-lkp@intel.com>
References: <20211220082542.13750-5-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220082542.13750-5-pavel.hofman@ivitera.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Pavel,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on linus/master v5.16-rc6 next-20211220]
[cannot apply to balbi-usb/testing/next peter-chen-usb/for-usb-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Pavel-Hofman/usb-gadget-audio-Multiple-rates-dyn-bInterval/20211220-162736
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: riscv-randconfig-r003-20211220 (https://download.01.org/0day-ci/archive/20211221/202112210422.0fC1uDBA-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/2b868f914e557058c0b5e749db604db56b77e353
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Pavel-Hofman/usb-gadget-audio-Multiple-rates-dyn-bInterval/20211220-162736
        git checkout 2b868f914e557058c0b5e749db604db56b77e353
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash drivers/usb/gadget/legacy/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/usb/gadget/legacy/audio.c: In function 'audio_bind':
>> drivers/usb/gadget/legacy/audio.c:287:25: error: 'p_srates_cnt' undeclared (first use in this function)
     287 |         for (i = 0; i < p_srates_cnt; ++i)
         |                         ^~~~~~~~~~~~
   drivers/usb/gadget/legacy/audio.c:287:25: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/usb/gadget/legacy/audio.c:288:42: error: 'p_srates' undeclared (first use in this function); did you mean 'p_srate'?
     288 |                 uac1_opts->p_srates[i] = p_srates[i];
         |                                          ^~~~~~~~
         |                                          p_srate
>> drivers/usb/gadget/legacy/audio.c:294:25: error: 'c_srates_cnt' undeclared (first use in this function)
     294 |         for (i = 0; i < c_srates_cnt; ++i)
         |                         ^~~~~~~~~~~~
>> drivers/usb/gadget/legacy/audio.c:295:42: error: 'c_srates' undeclared (first use in this function); did you mean 'c_srate'?
     295 |                 uac1_opts->c_srates[i] = c_srates[i];
         |                                          ^~~~~~~~
         |                                          c_srate


vim +/p_srates_cnt +287 drivers/usb/gadget/legacy/audio.c

   264	
   265	#ifndef CONFIG_GADGET_UAC1
   266		uac2_opts = container_of(fi_uac2, struct f_uac2_opts, func_inst);
   267		uac2_opts->p_chmask = p_chmask;
   268	
   269		for (i = 0; i < p_srates_cnt; ++i)
   270			uac2_opts->p_srates[i] = p_srates[i];
   271		uac2_opts->p_srate = p_srates[0];
   272	
   273		uac2_opts->p_ssize = p_ssize;
   274		uac2_opts->c_chmask = c_chmask;
   275	
   276		for (i = 0; i < c_srates_cnt; ++i)
   277			uac2_opts->c_srates[i] = c_srates[i];
   278		uac2_opts->c_srate = c_srates[0];
   279	
   280		uac2_opts->c_ssize = c_ssize;
   281		uac2_opts->req_number = UAC2_DEF_REQ_NUM;
   282	#else
   283	#ifndef CONFIG_GADGET_UAC1_LEGACY
   284		uac1_opts = container_of(fi_uac1, struct f_uac1_opts, func_inst);
   285		uac1_opts->p_chmask = p_chmask;
   286	
 > 287		for (i = 0; i < p_srates_cnt; ++i)
 > 288			uac1_opts->p_srates[i] = p_srates[i];
   289		uac1_opts->p_srate = p_srates[0];
   290	
   291		uac1_opts->p_ssize = p_ssize;
   292		uac1_opts->c_chmask = c_chmask;
   293	
 > 294		for (i = 0; i < c_srates_cnt; ++i)
 > 295			uac1_opts->c_srates[i] = c_srates[i];
   296		uac1_opts->c_srate = c_srates[0];
   297	
   298		uac1_opts->c_ssize = c_ssize;
   299		uac1_opts->req_number = UAC1_DEF_REQ_NUM;
   300	#else /* CONFIG_GADGET_UAC1_LEGACY */
   301		uac1_opts = container_of(fi_uac1, struct f_uac1_legacy_opts, func_inst);
   302		uac1_opts->fn_play = fn_play;
   303		uac1_opts->fn_cap = fn_cap;
   304		uac1_opts->fn_cntl = fn_cntl;
   305		uac1_opts->req_buf_size = req_buf_size;
   306		uac1_opts->req_count = req_count;
   307		uac1_opts->audio_buf_size = audio_buf_size;
   308	#endif /* CONFIG_GADGET_UAC1_LEGACY */
   309	#endif
   310	
   311		status = usb_string_ids_tab(cdev, strings_dev);
   312		if (status < 0)
   313			goto fail;
   314		device_desc.iManufacturer = strings_dev[USB_GADGET_MANUFACTURER_IDX].id;
   315		device_desc.iProduct = strings_dev[USB_GADGET_PRODUCT_IDX].id;
   316	
   317		if (gadget_is_otg(cdev->gadget) && !otg_desc[0]) {
   318			struct usb_descriptor_header *usb_desc;
   319	
   320			usb_desc = usb_otg_descriptor_alloc(cdev->gadget);
   321			if (!usb_desc) {
   322				status = -ENOMEM;
   323				goto fail;
   324			}
   325			usb_otg_descriptor_init(cdev->gadget, usb_desc);
   326			otg_desc[0] = usb_desc;
   327			otg_desc[1] = NULL;
   328		}
   329	
   330		status = usb_add_config(cdev, &audio_config_driver, audio_do_config);
   331		if (status < 0)
   332			goto fail_otg_desc;
   333		usb_composite_overwrite_options(cdev, &coverwrite);
   334	
   335		INFO(cdev, "%s, version: %s\n", DRIVER_DESC, DRIVER_VERSION);
   336		return 0;
   337	
   338	fail_otg_desc:
   339		kfree(otg_desc[0]);
   340		otg_desc[0] = NULL;
   341	fail:
   342	#ifndef CONFIG_GADGET_UAC1
   343		usb_put_function_instance(fi_uac2);
   344	#else
   345		usb_put_function_instance(fi_uac1);
   346	#endif
   347		return status;
   348	}
   349	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
