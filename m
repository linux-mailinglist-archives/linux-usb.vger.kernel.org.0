Return-Path: <linux-usb+bounces-4293-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E744E8163DC
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 01:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D7851C21474
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 00:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE1E111F;
	Mon, 18 Dec 2023 00:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkVP9MCM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B41210E7
	for <linux-usb@vger.kernel.org>; Mon, 18 Dec 2023 00:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702860905; x=1734396905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SX321zBiEBN7jztDpGT8OAdI61LrNKGSl+Ax97mksgM=;
  b=nkVP9MCMFLNzJXrzj9JQp03cjjLZxDiMpr85aD341reCzHAzdCQNT+LV
   UVUqTE8D2eb1hSeVkplMXgEbxBqs926QBDi04mucDT5I5/sDIcaCQc/GD
   RChsaWxwXA+IjDE99wDP+I5hiTpOOilrvdoTr4Hgzwo+Ll6un00bMmeWV
   YC/ARAxujrCZtnchi/XCKng1Qojc7Zka4BnNoT8AC2em5OAXb8BEAMhfW
   DegMhqB1y9or/d9zG2qVB5+HTRcXBB39ooPjSsmLA1FArIx5YNFkhwD1v
   m3AV3QqLnebw5EyV6E3XXHiUg6ZRLQ0/6lCTuLYyS0vy4D6/vx11q8eaz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="461894411"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="461894411"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 16:55:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="768654948"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="768654948"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Dec 2023 16:55:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF1uO-0003bA-0M;
	Mon, 18 Dec 2023 00:55:00 +0000
Date: Mon, 18 Dec 2023 08:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal.kopec@3mdeb.com>,
	linux-usb@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	=?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Subject: Re: [PATCH] platform/x86: serial-multi-instantiate: allow single
 GpioInt IRQ for INT3515
Message-ID: <202312180832.j4FO9TyV-lkp@intel.com>
References: <20231212103823.546118-2-michal.kopec@3mdeb.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212103823.546118-2-michal.kopec@3mdeb.com>

Hi Michał,

kernel test robot noticed the following build warnings:

[auto build test WARNING on westeri-thunderbolt/next]
[also build test WARNING on linus/master v6.7-rc5 next-20231215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Kope/platform-x86-serial-multi-instantiate-allow-single-GpioInt-IRQ-for-INT3515/20231212-184116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20231212103823.546118-2-michal.kopec%403mdeb.com
patch subject: [PATCH] platform/x86: serial-multi-instantiate: allow single GpioInt IRQ for INT3515
config: i386-randconfig-r112-20231217 (https://download.01.org/0day-ci/archive/20231218/202312180832.j4FO9TyV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312180832.j4FO9TyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312180832.j4FO9TyV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/serial-multi-instantiate.c:79:37: sparse: sparse: dubious: !x & y

vim +79 drivers/platform/x86/serial-multi-instantiate.c

    51	
    52	static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
    53			       const struct smi_instance *inst)
    54	{
    55		int ret;
    56	
    57		switch (inst->flags & IRQ_RESOURCE_TYPE) {
    58		case IRQ_RESOURCE_AUTO:
    59			ret = acpi_dev_gpio_irq_get(adev, inst->irq_idx);
    60			if (ret > 0) {
    61				dev_dbg(&pdev->dev, "Using gpio irq\n");
    62				break;
    63			}
    64			ret = platform_get_irq_optional(pdev, inst->irq_idx);
    65			if (ret > 0) {
    66				dev_dbg(&pdev->dev, "Using platform irq\n");
    67				break;
    68			}
    69			break;
    70		case IRQ_RESOURCE_GPIO:
    71			ret = acpi_dev_gpio_irq_get(adev, inst->irq_idx);
    72			break;
    73		case IRQ_RESOURCE_APIC:
    74			ret = platform_get_irq_optional(pdev, inst->irq_idx);
    75			break;
    76		default:
    77			return 0;
    78		}
  > 79		if (ret < 0 && !inst->flags & IRQ_OPTIONAL)
    80			return dev_err_probe(&pdev->dev, ret, "Error requesting irq at index %d\n",
    81					     inst->irq_idx);
    82	
    83		return ret;
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

