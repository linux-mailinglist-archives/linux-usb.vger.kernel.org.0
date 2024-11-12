Return-Path: <linux-usb+bounces-17479-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A79049C5890
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 14:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 371C91F21CDF
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 13:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3037913A3F2;
	Tue, 12 Nov 2024 13:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k76cPTL8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3809A7080B
	for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 13:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731416763; cv=none; b=GnfME/QZkyOEHdiy8QZxWwqWJe0DLrvDZrsF1CBuyRjSJ+9T/VE0fLG1kAVZxUyDSkc3e5yKyS3ElvhTFb3xcE62xm1ZNGU6lMZFkAIwRh16ylw/smXj9ULE0hcmDtdYYeSXUIBGT9Wbd7W8RBsPtop2Zn7XUHkiD31c0+tzgBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731416763; c=relaxed/simple;
	bh=+eNuL3PJiA9W0bwntX3Jqcme9OdBpWzlzr43Judry/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBzKA3OtmzMv/Sv9Rkp5+kPyQJhtuOVBP7r6zVFn16dDMU/CDJKznZA3IHbFmsOyEfL7Y6uBaad/A/KGzaiZ+HZtPsSqZghgzEgeo38Yw5ezT0Wb4G6tQ/L7wFH+Y0DtrNqeEger6H3ntIV1oneQHGjc7Ao+AoRQZ7LQupr+NuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k76cPTL8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731416761; x=1762952761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+eNuL3PJiA9W0bwntX3Jqcme9OdBpWzlzr43Judry/k=;
  b=k76cPTL8kxD2buoRY+QO0ZWu/fmsTGIUK3amtKtp0UuKOLffOP1+Emyz
   COg9Dw+zpjEGRa2eb8iq+QfpZ/fMtbpxa22g0jJ7SA/w3/16GHxgNn0gP
   RU740vajItDabfIR2QT/g/Y7erIrkJk8o2Phva5KnvaUIC0M3XorHgkB7
   BXKBfFVjfU5piBiKa1/U1LscdaimdDNU8icko2sOuuz0uHuRcQgQ7xTRr
   8oFR2elDJ6DET0c35LHurUJGxrgbNf0S+7RkU4Rwjo59pxSHRMyErk6hT
   e5l6VGu4w4v4M59D/qSp1tecGS12eEQ8azh69kHQOPJ4YdsuGTkrB4cgu
   g==;
X-CSE-ConnectionGUID: hyXGXry7S2WvuDAolPRjUw==
X-CSE-MsgGUID: lr+/Y9OgSrqeryU4iQnkPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="48759292"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="48759292"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 05:06:01 -0800
X-CSE-ConnectionGUID: 7tsVhCQWRGSYICI3Z6ocSA==
X-CSE-MsgGUID: OEV09uSvS4SGN2RmsBLBdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="87616891"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Nov 2024 05:05:59 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAqai-0001K5-24;
	Tue, 12 Nov 2024 13:05:56 +0000
Date: Tue, 12 Nov 2024 21:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 3/3] usb: misc: ljca: add firmware version sysfs
 attribute
Message-ID: <202411122028.tylKQSQx-lkp@intel.com>
References: <20241112075514.680712-3-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112075514.680712-3-stanislaw.gruszka@linux.intel.com>

Hi Stanislaw,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v6.12-rc7 next-20241112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislaw-Gruszka/usb-misc-ljca-set-small-runtime-autosuspend-delay/20241112-155844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20241112075514.680712-3-stanislaw.gruszka%40linux.intel.com
patch subject: [PATCH v4 3/3] usb: misc: ljca: add firmware version sysfs attribute
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241112/202411122028.tylKQSQx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411122028.tylKQSQx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411122028.tylKQSQx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/misc/usb-ljca.c:169: warning: Function parameter or struct member 'fw_version' not described in 'ljca_adapter'
>> drivers/usb/misc/usb-ljca.c:169: warning: Function parameter or struct member 'fw_version_valid' not described in 'ljca_adapter'


vim +169 drivers/usb/misc/usb-ljca.c

acd6199f195d6de Wentong Wu        2023-10-09  114  
acd6199f195d6de Wentong Wu        2023-10-09  115  /**
acd6199f195d6de Wentong Wu        2023-10-09  116   * struct ljca_adapter - represent a ljca adapter
acd6199f195d6de Wentong Wu        2023-10-09  117   *
acd6199f195d6de Wentong Wu        2023-10-09  118   * @intf: the usb interface for this ljca adapter
acd6199f195d6de Wentong Wu        2023-10-09  119   * @usb_dev: the usb device for this ljca adapter
acd6199f195d6de Wentong Wu        2023-10-09  120   * @dev: the specific device info of the usb interface
acd6199f195d6de Wentong Wu        2023-10-09  121   * @rx_pipe: bulk in pipe for receive data from firmware
acd6199f195d6de Wentong Wu        2023-10-09  122   * @tx_pipe: bulk out pipe for send data to firmware
acd6199f195d6de Wentong Wu        2023-10-09  123   * @rx_urb: urb used for the bulk in pipe
acd6199f195d6de Wentong Wu        2023-10-09  124   * @rx_buf: buffer used to receive command response and event
acd6199f195d6de Wentong Wu        2023-10-09  125   * @rx_len: length of rx buffer
acd6199f195d6de Wentong Wu        2023-10-09  126   * @ex_buf: external buffer to save command response
acd6199f195d6de Wentong Wu        2023-10-09  127   * @ex_buf_len: length of external buffer
acd6199f195d6de Wentong Wu        2023-10-09  128   * @actual_length: actual length of data copied to external buffer
acd6199f195d6de Wentong Wu        2023-10-09  129   * @tx_buf: buffer used to download command to firmware
acd6199f195d6de Wentong Wu        2023-10-09  130   * @tx_buf_len: length of tx buffer
acd6199f195d6de Wentong Wu        2023-10-09  131   * @lock: spinlock to protect tx_buf and ex_buf
acd6199f195d6de Wentong Wu        2023-10-09  132   * @cmd_completion: completion object as the command receives ack
acd6199f195d6de Wentong Wu        2023-10-09  133   * @mutex: mutex to avoid command download concurrently
acd6199f195d6de Wentong Wu        2023-10-09  134   * @client_list: client device list
acd6199f195d6de Wentong Wu        2023-10-09  135   * @disconnect: usb disconnect ongoing or not
acd6199f195d6de Wentong Wu        2023-10-09  136   * @reset_id: used to reset firmware
acd6199f195d6de Wentong Wu        2023-10-09  137   */
acd6199f195d6de Wentong Wu        2023-10-09  138  struct ljca_adapter {
acd6199f195d6de Wentong Wu        2023-10-09  139  	struct usb_interface *intf;
acd6199f195d6de Wentong Wu        2023-10-09  140  	struct usb_device *usb_dev;
acd6199f195d6de Wentong Wu        2023-10-09  141  	struct device *dev;
acd6199f195d6de Wentong Wu        2023-10-09  142  
acd6199f195d6de Wentong Wu        2023-10-09  143  	unsigned int rx_pipe;
acd6199f195d6de Wentong Wu        2023-10-09  144  	unsigned int tx_pipe;
acd6199f195d6de Wentong Wu        2023-10-09  145  
acd6199f195d6de Wentong Wu        2023-10-09  146  	struct urb *rx_urb;
acd6199f195d6de Wentong Wu        2023-10-09  147  	void *rx_buf;
acd6199f195d6de Wentong Wu        2023-10-09  148  	unsigned int rx_len;
acd6199f195d6de Wentong Wu        2023-10-09  149  
acd6199f195d6de Wentong Wu        2023-10-09  150  	u8 *ex_buf;
acd6199f195d6de Wentong Wu        2023-10-09  151  	u8 ex_buf_len;
acd6199f195d6de Wentong Wu        2023-10-09  152  	u8 actual_length;
acd6199f195d6de Wentong Wu        2023-10-09  153  
acd6199f195d6de Wentong Wu        2023-10-09  154  	void *tx_buf;
acd6199f195d6de Wentong Wu        2023-10-09  155  	u8 tx_buf_len;
acd6199f195d6de Wentong Wu        2023-10-09  156  
acd6199f195d6de Wentong Wu        2023-10-09  157  	spinlock_t lock;
acd6199f195d6de Wentong Wu        2023-10-09  158  
acd6199f195d6de Wentong Wu        2023-10-09  159  	struct completion cmd_completion;
acd6199f195d6de Wentong Wu        2023-10-09  160  	struct mutex mutex;
acd6199f195d6de Wentong Wu        2023-10-09  161  
acd6199f195d6de Wentong Wu        2023-10-09  162  	struct list_head client_list;
1368856f90435bb Stanislaw Gruszka 2024-11-12  163  	struct ljca_fw_version fw_version;
acd6199f195d6de Wentong Wu        2023-10-09  164  
acd6199f195d6de Wentong Wu        2023-10-09  165  	bool disconnect;
1368856f90435bb Stanislaw Gruszka 2024-11-12  166  	bool fw_version_valid;
acd6199f195d6de Wentong Wu        2023-10-09  167  
acd6199f195d6de Wentong Wu        2023-10-09  168  	u32 reset_id;
acd6199f195d6de Wentong Wu        2023-10-09 @169  };
acd6199f195d6de Wentong Wu        2023-10-09  170  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

