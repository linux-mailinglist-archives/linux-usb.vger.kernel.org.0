Return-Path: <linux-usb+bounces-3992-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC2680DAF8
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 20:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E14C31C214AB
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 19:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB94152F9D;
	Mon, 11 Dec 2023 19:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbFVEKW+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578C6CE;
	Mon, 11 Dec 2023 11:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702323409; x=1733859409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fpzANBwosWLnu6s/jRy8y9zAkBIaw0FMrX1vO8cjm0Q=;
  b=NbFVEKW+ON2d+RIRMGv5B+S2JYoowrCA4NakC6lGn4uvDlfzqvwiV9LT
   ezOfbXr3C+0uXi9hmF3RcAy40lmwGGEMGKYdHRT5fwsrWkpai26wuq6/0
   tAs0ojXUWatQduXml7Hk4naiFrlijbLKAkj/KWi/O4RBRtH4PqGCNJ2N0
   hCSnOCvYBNdxRWFMNPBkNO7aVI82yCKortmtYGaSQAV+j18XGI/oyerEC
   hg+6jQN6XI9b/rMUs4xF+dvHsfy0dpXOd84F/ZFIk7DfgPXZQ7bAHovrA
   hm64LmaSy6JWWXYjkGE3dNGC99dsaumweUYGDUZra/JY8cSitq0Q+TH7z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="461176123"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="461176123"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 11:36:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="807428246"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="807428246"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 11 Dec 2023 11:36:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCm4t-000IQ0-1N;
	Mon, 11 Dec 2023 19:36:31 +0000
Date: Tue, 12 Dec 2023 03:35:57 +0800
From: kernel test robot <lkp@intel.com>
To: Xinhu Wu <xinhu.wu@unisoc.com>, gregkh@linuxfoundation.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, xinhuwu.unisoc@gmail.com,
	zhiyong.liu@unisoc.com, peak.yang@unisoc.com,
	teng.zhang1@unisoc.com, bruce.chen@unisoc.com,
	surong.pang@unisoc.com, xingxing.luo@unisoc.com,
	xinhu.wu@unisoc.com
Subject: Re: [PATCH V2 2/2] dt-bindings: usb: Add an Spreadtrum pmic typec
 yaml
Message-ID: <202312120307.jhk5BElS-lkp@intel.com>
References: <20231211074120.27958-3-xinhu.wu@unisoc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211074120.27958-3-xinhu.wu@unisoc.com>

Hi Xinhu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus robh/for-next westeri-thunderbolt/next linus/master v6.7-rc5 next-20231211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xinhu-Wu/usb-typec-Support-sprd_pmic_typec-driver/20231211-154328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231211074120.27958-3-xinhu.wu%40unisoc.com
patch subject: [PATCH V2 2/2] dt-bindings: usb: Add an Spreadtrum pmic typec yaml
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231212/202312120307.jhk5BElS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312120307.jhk5BElS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/usb/sprd,pmic_typec.yaml:28:18: [error] syntax error: mapping values are not allowed here (syntax)
--
>> Documentation/devicetree/bindings/usb/sprd,pmic_typec.yaml:28:18: mapping values are not allowed in this context
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmin-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmax-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
--
>> Documentation/devicetree/bindings/usb/sprd,pmic_typec.yaml: ignoring, error parsing file

vim +28 Documentation/devicetree/bindings/usb/sprd,pmic_typec.yaml

     8	
     9	maintainers:
    10	  - Xinhu Wu <xinhu.wu@unisoc.com>
    11	
    12	description:
    13	  Supports the typec found on these PMICs.
    14	
    15	properties:
    16	  compatible:
    17	    enum:
    18	      - sprd,sc2730-typec
    19	
    20	  reg:
    21	    maxItems: 1
    22	
    23	  interrupts:
    24	    maxItems: 1
    25	
    26	  sprd,mode:
    27	    maxItems: 1
  > 28	      description: the number indicates src, snk or drp.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

