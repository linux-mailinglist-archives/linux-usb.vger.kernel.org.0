Return-Path: <linux-usb+bounces-21063-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0636A4567C
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 08:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1FBF3A5F2C
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 07:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA4B194A66;
	Wed, 26 Feb 2025 07:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4BYT5Et"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90D218DB11;
	Wed, 26 Feb 2025 07:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740554219; cv=none; b=ouXU4XQ/NQtYdd9UY3udt0KQ06JzaPQ7uEWNsNIc0jOpJu1aN8XyF+pvg+wezQ9Z2PVBbJum1GbS4h+/yoCu5infV4jCsFUk6TXPfJEuPNoIMiqyzcryGK3mByZNldUVtTgaK7aI5DBdlDEd4dMt+9Q7oUtVs11v0FlzR4tnIi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740554219; c=relaxed/simple;
	bh=1Kb0KQQpe86zLyyYFwC5pDOTMSMspwB5NAM1OebGI9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+YWfyxlIlcFdcMrNhGyY7+lx/0oNygLFuqyS6ick9RoQ0soT7n39fn2Nw3Ic0GeUFZLfmLdQAUkA6gMl+g7zIprJIQMQMK/XXtiuFONWoMaHTHfPfnDxBj5bEIRBBYGOkJlXid5yH4mdUhJX2g6grewE12AqefFGa+gG72NhPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4BYT5Et; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740554218; x=1772090218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Kb0KQQpe86zLyyYFwC5pDOTMSMspwB5NAM1OebGI9E=;
  b=H4BYT5EtdB2qMF32HWwqyjT/Q2Ez4vEBu3kam09Fh/WUVPdBYRZqZGGO
   issIENybDJmGcsLicpEo2L/DlKqw4PMJ/K54LlDw0jfXeqb7ONq7VzuG4
   Ztq5clEmEyjXfQ36S6nmfr0hpOJ4+NG4s2Fe9D2y9v2KeZfMkBSzckAc5
   88N1B6WLg6gS+bocOD6n073Cn9P+yhGaeLmz3PYH3V8BfABAqZekLKir6
   4/S4V+PSBsZJ2HE/j7WgjRT4r8DTqbh78Mb1sq1nMAle3coRF9hq6N8pp
   Y6CODl2mHwgY7hB6AftZPWD7LbLG6WBZnFvsk1JUe4vVn0zAxEeFaNc9E
   Q==;
X-CSE-ConnectionGUID: qrvJwF3qS6WswJ4N0PGlwQ==
X-CSE-MsgGUID: 1qsHGcDlRlyarc322u53yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="40623205"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="40623205"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 23:16:57 -0800
X-CSE-ConnectionGUID: sTb0f3sYRs6tMWCGyOF8nw==
X-CSE-MsgGUID: 5us5yGZDS+mZTJyldJmxsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="147448898"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 Feb 2025 23:16:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnBf0-000BK7-3D;
	Wed, 26 Feb 2025 07:16:50 +0000
Date: Wed, 26 Feb 2025 15:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, peter.chen@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 4/6] usb: chipidea: imx: add wakeup interrupt handling
Message-ID: <202502261559.XexYUCXi-lkp@intel.com>
References: <20250225053955.3781831-5-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225053955.3781831-5-xu.yang_2@nxp.com>

Hi Xu,

kernel test robot noticed the following build errors:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on tty/tty-testing tty/tty-next tty/tty-linus linus/master v6.14-rc4 next-20250225]
[cannot apply to usb/usb-testing usb/usb-next usb/usb-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Yang/dt-bindings-usb-chipidea-Add-i-MX95-compatible-string-fsl-imx95-usb/20250225-134215
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250225053955.3781831-5-xu.yang_2%40nxp.com
patch subject: [PATCH v2 4/6] usb: chipidea: imx: add wakeup interrupt handling
config: x86_64-buildonly-randconfig-003-20250226 (https://download.01.org/0day-ci/archive/20250226/202502261559.XexYUCXi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261559.XexYUCXi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261559.XexYUCXi-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/chipidea/ci_hdrc_imx.c: In function 'imx_controller_resume':
>> drivers/usb/chipidea/ci_hdrc_imx.c:633:14: error: implicit declaration of function 'irqd_irq_disabled'; did you mean 'arch_irqs_disabled'? [-Werror=implicit-function-declaration]
     633 |         if (!irqd_irq_disabled(irq_get_irq_data(data->wakeup_irq)))
         |              ^~~~~~~~~~~~~~~~~
         |              arch_irqs_disabled
>> drivers/usb/chipidea/ci_hdrc_imx.c:633:32: error: implicit declaration of function 'irq_get_irq_data'; did you mean 'irq_set_irq_wake'? [-Werror=implicit-function-declaration]
     633 |         if (!irqd_irq_disabled(irq_get_irq_data(data->wakeup_irq)))
         |                                ^~~~~~~~~~~~~~~~
         |                                irq_set_irq_wake
   cc1: some warnings being treated as errors


vim +633 drivers/usb/chipidea/ci_hdrc_imx.c

   616	
   617	static int imx_controller_resume(struct device *dev,
   618							pm_message_t msg)
   619	{
   620		struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
   621		int ret = 0;
   622	
   623		dev_dbg(dev, "at %s\n", __func__);
   624	
   625		if (!data->in_lpm) {
   626			WARN_ON(1);
   627			return 0;
   628		}
   629	
   630		if (data->plat_data->flags & CI_HDRC_PMQOS)
   631			cpu_latency_qos_add_request(&data->pm_qos_req, 0);
   632	
 > 633		if (!irqd_irq_disabled(irq_get_irq_data(data->wakeup_irq)))
   634			disable_irq_nosync(data->wakeup_irq);
   635	
   636		ret = imx_prepare_enable_clks(dev);
   637		if (ret)
   638			return ret;
   639	
   640		data->in_lpm = false;
   641	
   642		ret = imx_usbmisc_resume(data->usbmisc_data,
   643					 PMSG_IS_AUTO(msg) || device_may_wakeup(dev));
   644		if (ret) {
   645			dev_err(dev, "usbmisc resume failed, ret=%d\n", ret);
   646			goto clk_disable;
   647		}
   648	
   649		return 0;
   650	
   651	clk_disable:
   652		imx_disable_unprepare_clks(dev);
   653		return ret;
   654	}
   655	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

