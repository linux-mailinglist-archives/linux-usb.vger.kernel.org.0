Return-Path: <linux-usb+bounces-14042-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E56795E060
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 01:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 131FCB21683
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2024 23:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4914913D8B3;
	Sat, 24 Aug 2024 23:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLub7AdT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18993EA76
	for <linux-usb@vger.kernel.org>; Sat, 24 Aug 2024 23:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724541800; cv=none; b=H3QacpYlkMCWShoHFXGyS1AH7uEVKxuKlF6bAlwMgzqzAMgldg/C76r1nk0wAWEIiEBASQ25yLy0DxXqSbzKlbgRdjKzrI8aHk4Glzi1dosIzWaFQCY4ZTU3M+qetGoYwDb9OXQy13/U44AjGiDCbGAx0ZWawG19L4weYLxChZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724541800; c=relaxed/simple;
	bh=sYp4GUi86+q/NMl7C9ZZ1N+eUt4kr+hmZqGnklV/clE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VGewQJ1WX1CEXHef3QNI1MRAVE/fnNGazDHxFSscD/ih2MqzIxVz2bJlHwDvQ2cD8h2tuRucEL3GEBH0DKVk1EEV8y9CdyK082HugB7ijzJpJBYHgJGmtkzzAmfDX3kSpcrbnQtDyA+hBUBMDRuk67nfLUsTkh2Z1GjG7JlzTfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLub7AdT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724541799; x=1756077799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sYp4GUi86+q/NMl7C9ZZ1N+eUt4kr+hmZqGnklV/clE=;
  b=ZLub7AdTBcJbuU8r3sE9i1ToAOrv+G+U8sGQypuHW0y8x4yLa6v4BWUl
   UTyUvZo/ymmLQ4wWk4S4y5y+1PHUP0/eho5GY98EVdvNXCKy8zyZv2VRY
   tkwCdnxwn95Xc0m0i00mcY5pkCRPAlAGpYnavNbYlILcDyk9h+7dHq80L
   WDg+MsC9nDhzS8Up1KMI/pf49CZzBLIP89GhopxBp9iQIZ9A6sgM54oJF
   7Vv5UHozGjciXe8w3RZV/ZMkqjmXHHXKA79NDgoacnOlL41xj7B8dtO32
   LZlXbjJCE/7KXJ/UQTTRPwR2+SnrcnKmVy9HrrD54LarDbE5//TfZcxwz
   Q==;
X-CSE-ConnectionGUID: bmPFmD8dQ8WDL7XOaEtdmw==
X-CSE-MsgGUID: I5fZKqZhR46pHuvo6WVm5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="25887059"
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; 
   d="scan'208";a="25887059"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 16:23:18 -0700
X-CSE-ConnectionGUID: OhKPrfVGSqydwY2iUgg9jw==
X-CSE-MsgGUID: 33wPfEhnQ9yRDEzWSjiNBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; 
   d="scan'208";a="66946308"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Aug 2024 16:23:17 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1si06E-000Enn-2j;
	Sat, 24 Aug 2024 23:23:14 +0000
Date: Sun, 25 Aug 2024 07:22:42 +0800
From: kernel test robot <lkp@intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 20/25] onboard_usb_dev.c:undefined reference to
 `i2c_find_device_by_fwnode'
Message-ID: <202408250737.xpHij5TD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   9a03b9a88e4a44e358e3638736286442ae262497
commit: 7b5e970ff0e58f9239226fe81c77d5b98d744986 [20/25] usb: misc: onboard_usb_dev: add Microchip usb5744 SMBus programming support
config: s390-randconfig-001-20240824 (https://download.01.org/0day-ci/archive/20240825/202408250737.xpHij5TD-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240825/202408250737.xpHij5TD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408250737.xpHij5TD-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/usb/misc/onboard_usb_dev.o: in function `onboard_dev_probe':
>> onboard_usb_dev.c:(.text+0x1164): undefined reference to `i2c_find_device_by_fwnode'
>> s390-linux-ld: onboard_usb_dev.c:(.text+0x1206): undefined reference to `i2c_smbus_write_block_data'
>> s390-linux-ld: onboard_usb_dev.c:(.text+0x121e): undefined reference to `i2c_smbus_write_word_data'
   s390-linux-ld: onboard_usb_dev.c:(.text+0x1236): undefined reference to `i2c_smbus_write_word_data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

