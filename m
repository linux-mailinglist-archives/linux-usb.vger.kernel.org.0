Return-Path: <linux-usb+bounces-31801-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF78ECE7C1D
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 18:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F4123016DD5
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 17:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C134832B98E;
	Mon, 29 Dec 2025 17:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jk/TGLmb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD92CA52
	for <linux-usb@vger.kernel.org>; Mon, 29 Dec 2025 17:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767029493; cv=none; b=jIL1+ey94FKvcbVXLxCjop6pacROnLqzMNbPszlUlH47uFewP+QIIUjsrhuA6uwG7H9e36Cfy4RXkOhaxWHA7pGgqqtkDGxYYiB/GL+6gkdESC9BzuiPIE5F4q5GJ8RwKpj69ECO/Huwk4khjpW6A85Q15b9K7k5VlX2zoR2eO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767029493; c=relaxed/simple;
	bh=7/qC/abv7PjuLoCqQtO5SHza/gsMkfmghlCOFQZ9j+4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iws/mttkBl1oebQt+iKuSTJ2fcAM41d397A0XqkgQIo6HRvXI8ADKpuVJhNKkzVAuic4dB4jOIyKFEPUpw/l0zAh+ZPf2ZizZSW/KX/vTa85GHYe3jdnRJ1CkgLe7dWyiC99ShZ8zWvRNDGloEqqKHet/YMpStoU5tkJPy29tnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jk/TGLmb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767029491; x=1798565491;
  h=date:from:to:cc:subject:message-id;
  bh=7/qC/abv7PjuLoCqQtO5SHza/gsMkfmghlCOFQZ9j+4=;
  b=jk/TGLmbET/xlSm+g5MCp0eDDjFd/yTFo41oW1TEKwwEOUgmFuTT3FpJ
   4vy799Ju+JZRXg6LQn/oyLRkFZ7foYith2ioGNI2k2KHPGFtgMZrjpYFU
   QShc58UdOgT6WWoGVJQPCMILC+QTb+0uW+rBgIkSKgwKik8/3+es7ICfM
   0YkcFypTa+pHARuFzmeLy0bOCR4QELZvLxknorig7pzfq7ZmZ4UFaI6wm
   3mu9t2S5V9D3dGVqvFqHg+1xRh8n6omFmCPtBXJUamMV2TV2vywdpLaPh
   PE/aQJzPAmuPzT982iFNTk8OGKxgEBEBQDCJJ0l5ZdiR5hL52o+lBsVMr
   w==;
X-CSE-ConnectionGUID: 4fVOIsA6Sjyjo2eUZZfkcw==
X-CSE-MsgGUID: uhT2zWAQRMGeHwR9B4M12A==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68574739"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68574739"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 09:31:31 -0800
X-CSE-ConnectionGUID: gLtHuYxsQdGFINwoj7ViEg==
X-CSE-MsgGUID: 8/hbHVgWQgishNwJRaFfmQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Dec 2025 09:31:29 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaH5a-000000007sB-2eR1;
	Mon, 29 Dec 2025 17:31:26 +0000
Date: Tue, 30 Dec 2025 01:31:19 +0800
From: kernel test robot <lkp@intel.com>
To: Roy Luo <royluo@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 Joy Chakraborty <joychakr@google.com>,
 Naveen Kumar <mnkumar@google.com>,
 Peter Griffin <peter.griffin@linaro.org>
Subject: [usb:usb-next 12/12] drivers/usb/dwc3/dwc3-google.c:232:2-9:
 line 232 is redundant because platform_get_irq() already prints an error
Message-ID: <202512300125.uV6V3J5i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   e46bcc4e856e0e4352752ff9247af6240334f822
commit: 8995a37371bf489ede768271aac56e4e6a55bcb2 [12/12] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
config: parisc-randconfig-r061-20251229 (https://download.01.org/0day-ci/archive/20251230/202512300125.uV6V3J5i-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512300125.uV6V3J5i-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/usb/dwc3/dwc3-google.c:232:2-9: line 232 is redundant because platform_get_irq() already prints an error

vim +232 drivers/usb/dwc3/dwc3-google.c

   223	
   224	static int dwc3_google_request_irq(struct dwc3_google *google, struct platform_device *pdev,
   225					   const char *irq_name, const char *req_name)
   226	{
   227		int ret;
   228		int irq;
   229	
   230		irq = platform_get_irq_byname(pdev, irq_name);
   231		if (irq < 0) {
 > 232			dev_err(google->dev, "invalid irq name %s\n", irq_name);
   233			return irq;
   234		}
   235	
   236		irq_set_status_flags(irq, IRQ_NOAUTOEN);
   237		ret = devm_request_threaded_irq(google->dev, irq, NULL,
   238						dwc3_google_resume_irq,
   239						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
   240						req_name, google);
   241		if (ret < 0) {
   242			dev_err(google->dev, "failed to request irq %s\n", req_name);
   243			return ret;
   244		}
   245	
   246		return irq;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

