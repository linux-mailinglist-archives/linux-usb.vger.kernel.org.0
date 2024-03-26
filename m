Return-Path: <linux-usb+bounces-8433-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4BB88CCFC
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 20:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF81F29992E
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 19:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9F213CC41;
	Tue, 26 Mar 2024 19:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QMdVNFrT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C010A13CC67
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 19:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711480802; cv=none; b=qW2DMOasIIxGl3V7wAq4UL/PxxxNFWoqtM7G9ZiM3WqtQm1cxfuzPPeVBFGfsKD/Gj2adN97t6+CViQQzq/r2pA/Ips1Tjiaj7kptDglXbGKB0XVE9H7KZqRHjSZQ+5faRkzlfVKDOaStJwYWrX3Q9ih7ox4m45Ciy69sQ8je24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711480802; c=relaxed/simple;
	bh=qhJstmubWU0DgiwQHAbF4PnnVPmv19c03LV5mkJS6Go=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MoRl6hy7354J+7D+GmCt/LCA3nQkUsCPiQZA8vNhRyLZsEV3ydwBOZq3Gz4/pg6mTtldixvnJHXPXGdGNVprLiVOP6zSGCqpBgUjVWUNAeR7A8Ea6M3jdlo0HR4o2raVWTZiFMqiswWSPbqxvpd5B6/+qTCEvUzGzGzPfcdqU98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QMdVNFrT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711480800; x=1743016800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qhJstmubWU0DgiwQHAbF4PnnVPmv19c03LV5mkJS6Go=;
  b=QMdVNFrTWwYVR6AmXGPHD344J/P7+7xTGccdH4ig4pArcnYm9RNN95lp
   VGIw7mPDexlzn5ROAr0rX1El2BA4xCE+ItJCMzMU/p6XGlvSFDzm5oL4u
   NpH+gloBZioO+nMt50WunCy8lao3Isfpt/7RE6VgA0IFzIP+VPIPTJ0Wn
   eLGYCjCiW36pUEKKcd5ofbfgaGDo8RjxgWJ42iSsHyU2hFUFe6Yea21iq
   LNTSw6Q3X2zdk1Hk0+PlUNOTXcAaSGJgxURyxPpTXC90n4RqNPKLbA/bD
   IsaegdIWGSl+PIf/S5B17s9O71vKYCOOPgGquifMvwpW4yl0aU7rgY/y6
   A==;
X-CSE-ConnectionGUID: qt/rku2HSviHt5MzblWCuw==
X-CSE-MsgGUID: 2+SBY92sSwW0qOJoHOAsVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6382903"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6382903"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 12:20:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="39154884"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Mar 2024 12:19:58 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpCKy-0000M2-0o;
	Tue, 26 Mar 2024 19:19:56 +0000
Date: Wed, 27 Mar 2024 03:19:29 +0800
From: kernel test robot <lkp@intel.com>
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-linus 12/26] drivers/usb/dwc2/core_intr.c:327: warning:
 Function parameter or struct member 'remotewakeup' not described in
 'dwc2_wakeup_from_lpm_l1'
Message-ID: <202403270357.JOxdZ2Ri-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
head:   f4d1960764d8a70318b02f15203a1be2b2554ca1
commit: 5d69a3b54e5a630c90d82a4c2bdce3d53dc78710 [12/26] usb: dwc2: gadget: LPM flow fix
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240327/202403270357.JOxdZ2Ri-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403270357.JOxdZ2Ri-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403270357.JOxdZ2Ri-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc2/core_intr.c:327: warning: Function parameter or struct member 'remotewakeup' not described in 'dwc2_wakeup_from_lpm_l1'


vim +327 drivers/usb/dwc2/core_intr.c

56f5b1cff22a1d drivers/staging/dwc2/core_intr.c Paul Zimmerman    2013-03-11  319  
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  320  /**
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  321   * dwc2_wakeup_from_lpm_l1 - Exit the device from LPM L1 state
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  322   *
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  323   * @hsotg: Programming view of DWC_otg controller
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  324   *
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  325   */
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  326  void dwc2_wakeup_from_lpm_l1(struct dwc2_hsotg *hsotg, bool remotewakeup)
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24 @327  {
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  328  	u32 glpmcfg;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  329  	u32 pcgctl;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  330  	u32 dctl;
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  331  
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  332  	if (hsotg->lx_state != DWC2_L1) {
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  333  		dev_err(hsotg->dev, "Core isn't in DWC2_L1 state\n");
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  334  		return;
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  335  	}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  336  
f25c42b8d604fb drivers/usb/dwc2/core_intr.c     Gevorg Sahakyan   2018-07-26  337  	glpmcfg = dwc2_readl(hsotg, GLPMCFG);
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  338  	if (dwc2_is_device_mode(hsotg)) {
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  339  		dev_dbg(hsotg->dev, "Exit from L1 state, remotewakeup=%d\n", remotewakeup);
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  340  		glpmcfg &= ~GLPMCFG_ENBLSLPM;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  341  		glpmcfg &= ~GLPMCFG_HIRD_THRES_MASK;
f25c42b8d604fb drivers/usb/dwc2/core_intr.c     Gevorg Sahakyan   2018-07-26  342  		dwc2_writel(hsotg, glpmcfg, GLPMCFG);
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  343  
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  344  		pcgctl = dwc2_readl(hsotg, PCGCTL);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  345  		pcgctl &= ~PCGCTL_ENBL_SLEEP_GATING;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  346  		dwc2_writel(hsotg, pcgctl, PCGCTL);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  347  
f25c42b8d604fb drivers/usb/dwc2/core_intr.c     Gevorg Sahakyan   2018-07-26  348  		glpmcfg = dwc2_readl(hsotg, GLPMCFG);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  349  		if (glpmcfg & GLPMCFG_ENBESL) {
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  350  			glpmcfg |= GLPMCFG_RSTRSLPSTS;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  351  			dwc2_writel(hsotg, glpmcfg, GLPMCFG);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  352  		}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  353  
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  354  		if (remotewakeup) {
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  355  			if (dwc2_hsotg_wait_bit_set(hsotg, GLPMCFG, GLPMCFG_L1RESUMEOK, 1000)) {
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  356  				dev_warn(hsotg->dev, "%s: timeout GLPMCFG_L1RESUMEOK\n", __func__);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  357  				goto fail;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  358  				return;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  359  			}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  360  
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  361  			dctl = dwc2_readl(hsotg, DCTL);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  362  			dctl |= DCTL_RMTWKUPSIG;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  363  			dwc2_writel(hsotg, dctl, DCTL);
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  364  
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  365  			if (dwc2_hsotg_wait_bit_set(hsotg, GINTSTS, GINTSTS_WKUPINT, 1000)) {
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  366  				dev_warn(hsotg->dev, "%s: timeout GINTSTS_WKUPINT\n", __func__);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  367  				goto fail;
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  368  				return;
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  369  			}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  370  		}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  371  
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  372  		glpmcfg = dwc2_readl(hsotg, GLPMCFG);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  373  		if (glpmcfg & GLPMCFG_COREL1RES_MASK || glpmcfg & GLPMCFG_SLPSTS ||
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  374  		    glpmcfg & GLPMCFG_L1RESUMEOK) {
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  375  			goto fail;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  376  			return;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  377  		}
c655557c12ded7 drivers/usb/dwc2/core_intr.c     Grigor Tovmasyan  2018-01-24  378  
c655557c12ded7 drivers/usb/dwc2/core_intr.c     Grigor Tovmasyan  2018-01-24  379  		/* Inform gadget to exit from L1 */
c655557c12ded7 drivers/usb/dwc2/core_intr.c     Grigor Tovmasyan  2018-01-24  380  		call_gadget(hsotg, resume);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  381  		/* Change to L0 state */
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  382  		hsotg->lx_state = DWC2_L0;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  383  		hsotg->bus_suspended = false;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  384  fail:		dwc2_gadget_init_lpm(hsotg);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  385  	} else {
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  386  		/* TODO */
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  387  		dev_err(hsotg->dev, "Host side LPM is not supported.\n");
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  388  		return;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  389  	}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  390  }
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  391  

:::::: The code at line 327 was first introduced by commit
:::::: 273d576c4d41d0577551176040c9c78d30c0cf16 usb: dwc2: gadget: Add functionality to exit from LPM L1 state

:::::: TO: Sevak Arakelyan <sevaka@synopsys.com>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

