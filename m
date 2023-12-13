Return-Path: <linux-usb+bounces-4139-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D1C81205B
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 22:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 893601C2125A
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 21:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE9B7E79E;
	Wed, 13 Dec 2023 21:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbZr29YL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F340FB2
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 13:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702501456; x=1734037456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PpMrmW5HF4EtNlNBApCPLwVPgeMZlNGAAVBGM7lh0rQ=;
  b=IbZr29YLa8QG0JbPF9yadqm9iF9vaiDCJze4GgMDigyb3HJnR3cUptl0
   LxHkim6Dwdc+V+VZw/x/od3WOGB0aUGMzl8WQyBNyrQO8RFIdZvHATnjO
   Kg6w0ElUoS5PqYV6eN/p6BJYPSrus3rGZgckfD3vwWchw0N17BLP3D38U
   pQ7aALZmCVJSRyREV4xFl0+fkHcOHX9p9VM3n+Jd54hLqgH0mo1kyegJv
   Z6BJYTxFbeLeok1fX7oE9HVmDxmwutagl9KEUGMuWD8OtXyBJbmqh7SxO
   5o1tiYNHgT3RTDI2I1GASqqbWiTC3He4FFIhPnkZQee2RIFa4toABWTh7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="461495914"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="461495914"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 13:04:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="947311373"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="947311373"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Dec 2023 13:04:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDWOp-000L8D-2u;
	Wed, 13 Dec 2023 21:04:11 +0000
Date: Thu, 14 Dec 2023 05:03:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>,
	Udipto Goswami <quic_ugoswami@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>
Subject: Re: [PATCH] usb: gadget: f_fs: fix fortify warning
Message-ID: <202312140411.KJ3yiKt5-lkp@intel.com>
References: <20231212112923.61799-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212112923.61799-1-dmantipov@yandex.ru>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.7-rc5 next-20231213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Antipov/usb-gadget-f_fs-fix-fortify-warning/20231212-193946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231212112923.61799-1-dmantipov%40yandex.ru
patch subject: [PATCH] usb: gadget: f_fs: fix fortify warning
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231214/202312140411.KJ3yiKt5-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312140411.KJ3yiKt5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312140411.KJ3yiKt5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/usb/functionfs.h:76:2: error: type name requires a specifier or qualifier
           struct_group(IDs,
           ^
>> ./usr/include/linux/usb/functionfs.h:77:3: error: unexpected type name '__u8': expected identifier
                   __u8    CompatibleID[8];
                   ^
>> ./usr/include/linux/usb/functionfs.h:77:8: error: expected ')'
                   __u8    CompatibleID[8];
                           ^
   ./usr/include/linux/usb/functionfs.h:76:14: note: to match this '('
           struct_group(IDs,
                       ^
>> ./usr/include/linux/usb/functionfs.h:76:15: error: a parameter list without types is only allowed in a function definition
           struct_group(IDs,
                        ^
   ./usr/include/linux/usb/functionfs.h:79:2: error: type name requires a specifier or qualifier
           );
           ^
>> ./usr/include/linux/usb/functionfs.h:79:2: error: expected member name or ';' after declaration specifiers
>> ./usr/include/linux/usb/functionfs.h:78:27: error: expected ';' at end of declaration list
                   __u8    SubCompatibleID[8];
                                              ^
                                              ;
   7 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

