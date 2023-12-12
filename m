Return-Path: <linux-usb+bounces-4089-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFF780FA77
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 23:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0BFD281A11
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 22:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733CEC2EE;
	Tue, 12 Dec 2023 22:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iaWERBnR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 303CDAA
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 14:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702420692; x=1733956692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=h8t5QXL6Y/ehxu347O7xBo8bJeRhhquvqG+ltUVUxcg=;
  b=iaWERBnR/idOx+Tj4VIfg7WtVMbUk+tYTN3cpD8EmQp0fGjWKWJRF07Y
   /BHJGx+ztDfmbiT27FdaDHGkSp8tVAmCrPXNSv9Kysmpd8gdaVz8NRFek
   P4kl2zT0HGW3b5//og/ld7bdjnQIlcf3IBF6bEJqMziV/R3OtT4ftisfL
   aDlJEogcVGVDv31ZYkqixf3QkizORt3ycsR0tyvhou8pejBjZExbbS63I
   1nW8xsNNaE/vYnaJe3btCigwWNFrzmKMaDe7qhHBMexRhjoWN4VA5qGIY
   id1SQ99PkZF/JoDjxNs9HT7mYsqwCaq+xpK/QhktGxuf+OAsEazm2Fc7Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1737036"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="1737036"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 14:38:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="15185388"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 12 Dec 2023 14:38:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDBOB-000Jnr-24;
	Tue, 12 Dec 2023 22:38:07 +0000
Date: Wed, 13 Dec 2023 06:37:28 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal.kopec@3mdeb.com>,
	linux-usb@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	=?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Subject: Re: [PATCH] platform/x86: serial-multi-instantiate: allow single
 GpioInt IRQ for INT3515
Message-ID: <202312130609.vkwtG6qJ-lkp@intel.com>
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
[also build test WARNING on linus/master v6.7-rc5 next-20231212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Kope/platform-x86-serial-multi-instantiate-allow-single-GpioInt-IRQ-for-INT3515/20231212-184116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20231212103823.546118-2-michal.kopec%403mdeb.com
patch subject: [PATCH] platform/x86: serial-multi-instantiate: allow single GpioInt IRQ for INT3515
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231213/202312130609.vkwtG6qJ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312130609.vkwtG6qJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130609.vkwtG6qJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/serial-multi-instantiate.c:79:17: warning: logical not is only applied to the left hand side of this bitwise operator [-Wlogical-not-parentheses]
           if (ret < 0 && !inst->flags & IRQ_OPTIONAL)
                          ^            ~
   drivers/platform/x86/serial-multi-instantiate.c:79:17: note: add parentheses after the '!' to evaluate the bitwise operator first
           if (ret < 0 && !inst->flags & IRQ_OPTIONAL)
                          ^
                           (                         )
   drivers/platform/x86/serial-multi-instantiate.c:79:17: note: add parentheses around left hand side expression to silence this warning
           if (ret < 0 && !inst->flags & IRQ_OPTIONAL)
                          ^
                          (           )
   1 warning generated.


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

