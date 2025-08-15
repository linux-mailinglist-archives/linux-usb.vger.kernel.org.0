Return-Path: <linux-usb+bounces-26897-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBA3B276C5
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 05:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B9421C26EB4
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 03:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC2529D27E;
	Fri, 15 Aug 2025 03:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MiXtzUrz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8506829AB0E
	for <linux-usb@vger.kernel.org>; Fri, 15 Aug 2025 03:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755228448; cv=none; b=qBwyrJVQ8PN9DIrTRoF3cHU6xrD1yxZLYt3HgE1GA4NdIB7X0fjty/xbheqUv06BXLdiAIA+ZpGxvo8xJWWRKnvXFmSNO0alUYoUhF/aQQFXc9p4ORdU3JQ/mKz4oV0/unrOkowLKWcuXZvBuOVj2a5iNBLQf+CCc6M0QrqtTeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755228448; c=relaxed/simple;
	bh=bW+uJgKte380uNQOuKfxpAEeWHLg7iWcGLCs1RY0JtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAUcCwixXXw0b/LEDc5bpsN+eaaL5qAEeT5nhluJAjTEs7QA57PkVtXfoqLAlJUxIo681xI42H7xQgL5PVbr/a7wnGkD1jq7jFuH8Gs9ZEFKa+0abKWVI/q/Zx2zXm2Su2LVG+GuNiqVNYr8wTWrHugFypdwScLu9M6hfPpr1YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MiXtzUrz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755228447; x=1786764447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bW+uJgKte380uNQOuKfxpAEeWHLg7iWcGLCs1RY0JtU=;
  b=MiXtzUrzVRvH4d62QTH+T61Svwh4RsR4RKqLAhfaCaOWl0b+u7is69i4
   9iNS+QytjaSLThvLcta5UcCS1oLzOi7c49tyDd2ND2sh+NXJA5y1gGdZ6
   KmySVjdtpIZaOHVIRrGAAVZ7uCKtqxUy2secMDfOmFG+xWxjQUTVyZnZp
   wGkRMV8jqvdoVNzPts3vIivfIRsqbqQlv1do+1SP8qNNgqUU7cFliDRt6
   O1PjcnCIeve70mzZ5N0S2aZk7hTAbythSssK+ZdLwHlMsOonLAs3jTQaH
   vBZRbDu1TG4CwViu63yPu8K8UXVZVcnl5YElc+zGk6T82bQYLHcZX1U/R
   g==;
X-CSE-ConnectionGUID: ZEjLr4nXQQOrYTvLxWu3YA==
X-CSE-MsgGUID: 19zOzxhQSfGIfIhbTHwjuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57482485"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57482485"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 20:27:26 -0700
X-CSE-ConnectionGUID: DXyDdlgBRDyfovFeOPJsQw==
X-CSE-MsgGUID: s1vbLnnKSam3ttkbgkeM7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="167275091"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 14 Aug 2025 20:27:25 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uml69-000BVY-2e;
	Fri, 15 Aug 2025 03:27:21 +0000
Date: Fri, 15 Aug 2025 11:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: raub camaioni <raubcameo@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	raub camaioni <raubcameo@gmail.com>
Subject: Re: [PATCH v3] usb: gadget: f_ncm: Fix MAC assignment NCM ethernet
Message-ID: <202508151101.dzCtG6Wh-lkp@intel.com>
References: <20250814171125.635429-1-raubcameo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814171125.635429-1-raubcameo@gmail.com>

Hi raub,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v6.17-rc1 next-20250814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/raub-camaioni/usb-gadget-f_ncm-Fix-MAC-assignment-NCM-ethernet/20250815-011301
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250814171125.635429-1-raubcameo%40gmail.com
patch subject: [PATCH v3] usb: gadget: f_ncm: Fix MAC assignment NCM ethernet
config: i386-randconfig-011-20250815 (https://download.01.org/0day-ci/archive/20250815/202508151101.dzCtG6Wh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151101.dzCtG6Wh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151101.dzCtG6Wh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/gadget/function/f_ncm.c: In function 'ncm_bind':
>> drivers/usb/gadget/function/f_ncm.c:1466:32: error: 'ecm' undeclared (first use in this function); did you mean 'ncm'?
    1466 |         ncm_string_defs[1].s = ecm->ethaddr;
         |                                ^~~
         |                                ncm
   drivers/usb/gadget/function/f_ncm.c:1466:32: note: each undeclared identifier is reported only once for each function it appears in


vim +1466 drivers/usb/gadget/function/f_ncm.c

  1429	
  1430	static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
  1431	{
  1432		struct usb_composite_dev *cdev = c->cdev;
  1433		struct f_ncm		*ncm = func_to_ncm(f);
  1434		struct usb_string	*us;
  1435		int			status = 0;
  1436		struct usb_ep		*ep;
  1437		struct f_ncm_opts	*ncm_opts;
  1438	
  1439		if (!can_support_ecm(cdev->gadget))
  1440			return -EINVAL;
  1441	
  1442		ncm_opts = container_of(f->fi, struct f_ncm_opts, func_inst);
  1443	
  1444		if (cdev->use_os_string) {
  1445			f->os_desc_table = kzalloc(sizeof(*f->os_desc_table),
  1446						   GFP_KERNEL);
  1447			if (!f->os_desc_table)
  1448				return -ENOMEM;
  1449			f->os_desc_n = 1;
  1450			f->os_desc_table[0].os_desc = &ncm_opts->ncm_os_desc;
  1451		}
  1452	
  1453		mutex_lock(&ncm_opts->lock);
  1454		gether_set_gadget(ncm_opts->net, cdev->gadget);
  1455		if (!ncm_opts->bound) {
  1456			ncm_opts->net->mtu = (ncm_opts->max_segment_size - ETH_HLEN);
  1457			status = gether_register_netdev(ncm_opts->net);
  1458		}
  1459		mutex_unlock(&ncm_opts->lock);
  1460	
  1461		if (status)
  1462			goto fail;
  1463	
  1464		ncm_opts->bound = true;
  1465	
> 1466		ncm_string_defs[1].s = ecm->ethaddr;
  1467	
  1468		us = usb_gstrings_attach(cdev, ncm_strings,
  1469					 ARRAY_SIZE(ncm_string_defs));
  1470		if (IS_ERR(us)) {
  1471			status = PTR_ERR(us);
  1472			goto fail;
  1473		}
  1474		ncm_control_intf.iInterface = us[STRING_CTRL_IDX].id;
  1475		ncm_data_nop_intf.iInterface = us[STRING_DATA_IDX].id;
  1476		ncm_data_intf.iInterface = us[STRING_DATA_IDX].id;
  1477		ecm_desc.iMACAddress = us[STRING_MAC_IDX].id;
  1478		ncm_iad_desc.iFunction = us[STRING_IAD_IDX].id;
  1479	
  1480		/* allocate instance-specific interface IDs */
  1481		status = usb_interface_id(c, f);
  1482		if (status < 0)
  1483			goto fail;
  1484		ncm->ctrl_id = status;
  1485		ncm_iad_desc.bFirstInterface = status;
  1486	
  1487		ncm_control_intf.bInterfaceNumber = status;
  1488		ncm_union_desc.bMasterInterface0 = status;
  1489	
  1490		if (cdev->use_os_string)
  1491			f->os_desc_table[0].if_id =
  1492				ncm_iad_desc.bFirstInterface;
  1493	
  1494		status = usb_interface_id(c, f);
  1495		if (status < 0)
  1496			goto fail;
  1497		ncm->data_id = status;
  1498	
  1499		ncm_data_nop_intf.bInterfaceNumber = status;
  1500		ncm_data_intf.bInterfaceNumber = status;
  1501		ncm_union_desc.bSlaveInterface0 = status;
  1502	
  1503		ecm_desc.wMaxSegmentSize = cpu_to_le16(ncm_opts->max_segment_size);
  1504	
  1505		status = -ENODEV;
  1506	
  1507		/* allocate instance-specific endpoints */
  1508		ep = usb_ep_autoconfig(cdev->gadget, &fs_ncm_in_desc);
  1509		if (!ep)
  1510			goto fail;
  1511		ncm->port.in_ep = ep;
  1512	
  1513		ep = usb_ep_autoconfig(cdev->gadget, &fs_ncm_out_desc);
  1514		if (!ep)
  1515			goto fail;
  1516		ncm->port.out_ep = ep;
  1517	
  1518		ep = usb_ep_autoconfig(cdev->gadget, &fs_ncm_notify_desc);
  1519		if (!ep)
  1520			goto fail;
  1521		ncm->notify = ep;
  1522	
  1523		status = -ENOMEM;
  1524	
  1525		/* allocate notification request and buffer */
  1526		ncm->notify_req = usb_ep_alloc_request(ep, GFP_KERNEL);
  1527		if (!ncm->notify_req)
  1528			goto fail;
  1529		ncm->notify_req->buf = kmalloc(NCM_STATUS_BYTECOUNT, GFP_KERNEL);
  1530		if (!ncm->notify_req->buf)
  1531			goto fail;
  1532		ncm->notify_req->context = ncm;
  1533		ncm->notify_req->complete = ncm_notify_complete;
  1534	
  1535		/*
  1536		 * support all relevant hardware speeds... we expect that when
  1537		 * hardware is dual speed, all bulk-capable endpoints work at
  1538		 * both speeds
  1539		 */
  1540		hs_ncm_in_desc.bEndpointAddress = fs_ncm_in_desc.bEndpointAddress;
  1541		hs_ncm_out_desc.bEndpointAddress = fs_ncm_out_desc.bEndpointAddress;
  1542		hs_ncm_notify_desc.bEndpointAddress =
  1543			fs_ncm_notify_desc.bEndpointAddress;
  1544	
  1545		ss_ncm_in_desc.bEndpointAddress = fs_ncm_in_desc.bEndpointAddress;
  1546		ss_ncm_out_desc.bEndpointAddress = fs_ncm_out_desc.bEndpointAddress;
  1547		ss_ncm_notify_desc.bEndpointAddress =
  1548			fs_ncm_notify_desc.bEndpointAddress;
  1549	
  1550		status = usb_assign_descriptors(f, ncm_fs_function, ncm_hs_function,
  1551				ncm_ss_function, ncm_ss_function);
  1552		if (status)
  1553			goto fail;
  1554	
  1555		/*
  1556		 * NOTE:  all that is done without knowing or caring about
  1557		 * the network link ... which is unavailable to this code
  1558		 * until we're activated via set_alt().
  1559		 */
  1560	
  1561		ncm->port.open = ncm_open;
  1562		ncm->port.close = ncm_close;
  1563	
  1564		hrtimer_setup(&ncm->task_timer, ncm_tx_timeout, CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
  1565	
  1566		DBG(cdev, "CDC Network: IN/%s OUT/%s NOTIFY/%s\n",
  1567				ncm->port.in_ep->name, ncm->port.out_ep->name,
  1568				ncm->notify->name);
  1569		return 0;
  1570	
  1571	fail:
  1572		kfree(f->os_desc_table);
  1573		f->os_desc_n = 0;
  1574	
  1575		if (ncm->notify_req) {
  1576			kfree(ncm->notify_req->buf);
  1577			usb_ep_free_request(ncm->notify, ncm->notify_req);
  1578		}
  1579	
  1580		ERROR(cdev, "%s: can't bind, err %d\n", f->name, status);
  1581	
  1582		return status;
  1583	}
  1584	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

