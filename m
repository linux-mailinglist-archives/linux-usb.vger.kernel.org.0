Return-Path: <linux-usb+bounces-9989-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 428248BA3AD
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2024 01:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2A39281A27
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 23:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026781CA9F;
	Thu,  2 May 2024 23:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HqLhyKcP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF50D1C6A1
	for <linux-usb@vger.kernel.org>; Thu,  2 May 2024 23:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714691110; cv=none; b=rVDbk1JLZKbITtYzWMnH7Pa02bL55VeMVQDcrMtgI2XshwFlQdwQBT5NQS1Rzua8wLHlY4LKsCFPCgq07cbOlmmoOqVAD1fTvoEPlBQh//zpgug2ko03olaKLImSP9q+ciLrNcRlyuN5C2eGeRIk8FnWoWW2s6qsiw6/8W/wTHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714691110; c=relaxed/simple;
	bh=Ih0ya9bAKxi18ZVb/9/arHPBDVgjdr7DQecohTYIsuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZ/8kf4N7t1e1/hGFSMDRqVGOkHVjPUFwL34TBDjrpU1prFItgyaNlu1x2rfA6FyLPXpz1qptF9xHbI/vkPTWj3dro5rowudKa2AKkHd/TxbOxeOG0CVY8URulPmE/tx33GW+DiLP9nwmXlkNW053XKHQpjibj01eESoI46r79Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqLhyKcP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714691108; x=1746227108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ih0ya9bAKxi18ZVb/9/arHPBDVgjdr7DQecohTYIsuQ=;
  b=HqLhyKcPEa5WKPPMVGzhFSQEQxNtIQybUNEzIDO+oBKlYm/4ResFY4Qe
   fDK16Mv5caM0v73RDoZGxqUSEUbq4pythCcAAmfjBb/caxzlRHVaNP2hs
   w9U6z8Wo4cNbpwnwobZVUJpHkDLYD6fGY1LRPGwnw62F/FeL3VEpIymKg
   L/t/i97jM9KwWjDmBej2dhqSn0JxtGefZXpWf5PFnVlRHjCHFuepDsW6r
   4hAFY03DxdpQbVBhhY1yywBWDLP9QHLAV9Cd07pfJiggoXMOCNFFJ7l5g
   rAq7kKgHT/q5qt8iFmW/dVmNSc4FdKEx59u+9KhrlNtPxvBSsOmnZhWVw
   g==;
X-CSE-ConnectionGUID: b5Ng6jt5RqGgN0Bf4TfaCA==
X-CSE-MsgGUID: Dm2c83PxTz+Ei68oqGd07Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="13440057"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="13440057"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 16:05:06 -0700
X-CSE-ConnectionGUID: yyQoWIFNQmmC8MP9grK73Q==
X-CSE-MsgGUID: ruDO/NisSy2PryXfPSIgMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27359670"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 May 2024 16:05:04 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2fU6-000B7g-1H;
	Thu, 02 May 2024 23:05:02 +0000
Date: Fri, 3 May 2024 07:04:22 +0800
From: kernel test robot <lkp@intel.com>
To: Mans Rullgard <mans@mansr.com>, Johan Hovold <johan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: use tty_port_register_device_serdev
Message-ID: <202405030657.vgUKnyOZ-lkp@intel.com>
References: <20240502100728.7914-1-mans@mansr.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502100728.7914-1-mans@mansr.com>

Hi Mans,

kernel test robot noticed the following build errors:

[auto build test ERROR on johan-usb-serial/usb-next]
[also build test ERROR on johan-usb-serial/usb-linus usb/usb-testing usb/usb-next usb/usb-linus tty/tty-testing tty/tty-next tty/tty-linus linus/master v6.9-rc6 next-20240502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mans-Rullgard/USB-serial-use-tty_port_register_device_serdev/20240502-180923
base:   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git usb-next
patch link:    https://lore.kernel.org/r/20240502100728.7914-1-mans%40mansr.com
patch subject: [PATCH] USB: serial: use tty_port_register_device_serdev
config: s390-randconfig-r081-20240503 (https://download.01.org/0day-ci/archive/20240503/202405030657.vgUKnyOZ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405030657.vgUKnyOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405030657.vgUKnyOZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/serial/bus.c: In function 'usb_serial_device_probe':
>> drivers/usb/serial/bus.c:53:19: error: too few arguments to function 'tty_port_register_device_serdev'
      53 |         tty_dev = tty_port_register_device_serdev(&port->port,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/tty.h:11,
                    from drivers/usb/serial/bus.c:10:
   include/linux/tty_port.h:150:16: note: declared here
     150 | struct device *tty_port_register_device_serdev(struct tty_port *port,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/tty_port_register_device_serdev +53 drivers/usb/serial/bus.c

    31	
    32	static int usb_serial_device_probe(struct device *dev)
    33	{
    34		struct usb_serial_port *port = to_usb_serial_port(dev);
    35		struct usb_serial_driver *driver;
    36		struct device *tty_dev;
    37		int retval = 0;
    38		int minor;
    39	
    40		/* make sure suspend/resume doesn't race against port_probe */
    41		retval = usb_autopm_get_interface(port->serial->interface);
    42		if (retval)
    43			return retval;
    44	
    45		driver = port->serial->type;
    46		if (driver->port_probe) {
    47			retval = driver->port_probe(port);
    48			if (retval)
    49				goto err_autopm_put;
    50		}
    51	
    52		minor = port->minor;
  > 53		tty_dev = tty_port_register_device_serdev(&port->port,
    54							  usb_serial_tty_driver,
    55							  minor, dev);
    56		if (IS_ERR(tty_dev)) {
    57			retval = PTR_ERR(tty_dev);
    58			goto err_port_remove;
    59		}
    60	
    61		usb_autopm_put_interface(port->serial->interface);
    62	
    63		dev_info(&port->serial->dev->dev,
    64			 "%s converter now attached to ttyUSB%d\n",
    65			 driver->description, minor);
    66	
    67		return 0;
    68	
    69	err_port_remove:
    70		if (driver->port_remove)
    71			driver->port_remove(port);
    72	err_autopm_put:
    73		usb_autopm_put_interface(port->serial->interface);
    74	
    75		return retval;
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

