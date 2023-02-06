Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9103068BBF2
	for <lists+linux-usb@lfdr.de>; Mon,  6 Feb 2023 12:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbjBFLqD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Feb 2023 06:46:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjBFLqB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 06:46:01 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCD0923124
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 03:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675683957; x=1707219957;
  h=date:from:cc:subject:message-id:mime-version;
  bh=RshtNvQSwvr9zTM6Pcnh5AVcpHq0Tu4KJPpDYu4fOGI=;
  b=fTVL9ipb8a+xd03UdsRBywDrlYehciqdpQ9ej2C5c7IFD7/vzaBftbsY
   2Z/ZmdQLANM7/Sxf/3p4iATcDGksUAHDLtZqJnEToby6zgQ4bdwMbi67y
   65TpirLUB1mjrxrbLrobXmsanz/AeuLU1Kn7jAvDsdqFYGrj81VvyCUck
   N7qKRKP1heOnOI/6pUdrz//eaBclqJ8AWETL40/ISVxTeG7zsMXlN//PA
   dJOqgujOpO2LHtl6faS73nas+v73A+AXyzA+zPd0e2IBCcKY9BF62oF7/
   7aCXj+agHvXS1gMrGcp5EXQXx8MT1s5ySZex7m6EZ/5pCeLeR64I3CWjR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="327818613"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="327818613"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 03:45:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="840328610"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="840328610"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Feb 2023 03:45:55 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pOzwY-0002WU-2y;
        Mon, 06 Feb 2023 11:45:54 +0000
Date:   Mon, 6 Feb 2023 19:45:24 +0800
From:   kernel test robot <lkp@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 1/25]
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c:4161:38: error: format
 '%lu' expects argument of type 'long unsigned int', but argument 3 has type
 'size_t' {aka 'unsigned int'}
Message-ID: <202302061902.pINCtqmL-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MISSING_HEADERS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   fb6211f1584aad12c267c3333273f42f69438ced
commit: 924fb3ec50f5156d21e4f484358fb36f75b91ca8 [1/25] Merge 6.2-rc7 into usb-next
config: i386-randconfig-a012-20230206 (https://download.01.org/0day-ci/archive/20230206/202302061902.pINCtqmL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=924fb3ec50f5156d21e4f484358fb36f75b91ca8
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout 924fb3ec50f5156d21e4f484358fb36f75b91ca8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/intel_execlists_submission.c: In function 'intel_execlists_dump_active_requests':
>> drivers/gpu/drm/i915/gt/intel_execlists_submission.c:4161:38: error: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
    4161 |         drm_printf(m, "\tOn hold?: %lu\n",
         |                                    ~~^
         |                                      |
         |                                      long unsigned int
         |                                    %u
    4162 |                    list_count_nodes(&engine->sched_engine->hold));
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                    |
         |                    size_t {aka unsigned int}
   cc1: all warnings being treated as errors


vim +4161 drivers/gpu/drm/i915/gt/intel_execlists_submission.c

0212bdef5a4de3 drivers/gpu/drm/i915/intel_lrc.c                     Chris Wilson       2019-01-15  4150  
5bc4b43d5c6c96 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4151  void intel_execlists_dump_active_requests(struct intel_engine_cs *engine,
5bc4b43d5c6c96 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4152  					  struct i915_request *hung_rq,
5bc4b43d5c6c96 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4153  					  struct drm_printer *m)
5bc4b43d5c6c96 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4154  {
5bc4b43d5c6c96 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4155  	unsigned long flags;
5bc4b43d5c6c96 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4156  
5bc4b43d5c6c96 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4157  	spin_lock_irqsave(&engine->sched_engine->lock, flags);
5bc4b43d5c6c96 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4158  
5bc4b43d5c6c96 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4159  	intel_engine_dump_active_requests(&engine->sched_engine->requests, hung_rq, m);
5bc4b43d5c6c96 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4160  
5bc4b43d5c6c96 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26 @4161  	drm_printf(m, "\tOn hold?: %lu\n",
924fb3ec50f515 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Greg Kroah-Hartman 2023-02-06  4162  		   list_count_nodes(&engine->sched_engine->hold));
5bc4b43d5c6c96 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4163  
5bc4b43d5c6c96 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4164  	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
5bc4b43d5c6c96 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4165  }
5bc4b43d5c6c96 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4166  

:::::: The code at line 4161 was first introduced by commit
:::::: 5bc4b43d5c6c9692ddc7b96116650cdf9406f3da drm/i915: Fix up locking around dumping requests lists

:::::: TO: John Harrison <John.C.Harrison@Intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
