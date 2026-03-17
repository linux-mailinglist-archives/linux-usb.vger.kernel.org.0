Return-Path: <linux-usb+bounces-34960-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJpBKD2XuWkJKwIAu9opvQ
	(envelope-from <linux-usb+bounces-34960-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 19:02:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A40C02B0846
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 19:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 85AC93040ABB
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 17:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BB037C11E;
	Tue, 17 Mar 2026 17:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z5645+vw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E3735CB9F;
	Tue, 17 Mar 2026 17:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773769522; cv=none; b=kalHyR3wLf4C7p84tT6nabADuf3Xha8rclzWlGja3Fl8TIRQp1/07HU2sr6J1WR6a9wE7D34qa+7x25K0RTtjOTvzCdvAvcWJMs7OiUXCpiqPND1+LMRUjgm4h4PjDMfipG8xajJNwN/HoEoSL1LY6B32Whzm1/jHPM+MM2WrwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773769522; c=relaxed/simple;
	bh=8YjhJFvcHuDpicEs2ORWdOGOUKXpNWrzs0hu+nBACe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mo61Z1KoaSXw+vET+dmUqrcgRYYTvFzPA1F+/3fm4tKtYzXr8qT1QqQbh2IP4m2Vg0xZmq1SQhwlzxDdRbpxblmwDqX9HzDuCiRHWQXpJuNVxTh9Z88FugcYyPf2hoRyHzLoExUvhqsVrz2R731yXD1CtOeX15DPYMy3VTx+kAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z5645+vw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773769521; x=1805305521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8YjhJFvcHuDpicEs2ORWdOGOUKXpNWrzs0hu+nBACe0=;
  b=Z5645+vwIydqsBIvH6BMzxTRUA28jy84dS4gGRt/v2LVuupIntd1aHTx
   T8qCZ+moHxLD0wY4+y+pS6Zt1ysDvTDNRE4EO5Ki9TefbzIhjLKC1HKvH
   CA0Sd8QspTGFdNSSWZS+1/tc59QM25Wzhp7jSfRojIo8PHZ/OuIlmJDHS
   7ogrXXQTj2XUpB/rUnuLOGsoB0JWOKMJxT9Pej1AOT3zULr2fOjglyfTc
   wKlh3fXToPurBCk2qoMvTn7CLRsWp9MhoTLD3wv4nlU6KyA4vql8HAhV4
   SMbecVYOsY3ka7VHHLBubjvTH5Y8CsCQ1kekK56n+4SFjSpNhSJafiUoR
   Q==;
X-CSE-ConnectionGUID: +5msEwdrRwmyjHKFLNEDWA==
X-CSE-MsgGUID: UJIEmmCETvmRoL9z+wHgUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85440477"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85440477"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 10:45:20 -0700
X-CSE-ConnectionGUID: Y277chRaShy8cQ4C/Vmj4w==
X-CSE-MsgGUID: yD16hZwgRqm65TnY3BBkuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="252818135"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Mar 2026 10:45:17 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2YTi-000000001dj-32K2;
	Tue, 17 Mar 2026 17:45:14 +0000
Date: Wed, 18 Mar 2026 01:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: Loke Forsberg <loke.forsberg@gmail.com>, linux-usb@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	khtsai@google.com, raubcameo@gmail.com, kees@kernel.org,
	linux-kernel@vger.kernel.org,
	Loke Forsberg <Loke.Forsberg@gmail.com>
Subject: Re: [PATCH v2] usb: gadget: f_ncm: replace kzalloc with kzalloc_obj
Message-ID: <202603180113.YgfMQGgX-lkp@intel.com>
References: <20260316092505.8841-1-Loke.Forsberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316092505.8841-1-Loke.Forsberg@gmail.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,linuxfoundation.org,google.com,gmail.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34960-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,git-scm.com:url,intel.com:dkim,intel.com:email,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: A40C02B0846
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Loke,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v7.0-rc4 next-20260316]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Loke-Forsberg/usb-gadget-f_ncm-replace-kzalloc-with-kzalloc_obj/20260316-173026
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260316092505.8841-1-Loke.Forsberg%40gmail.com
patch subject: [PATCH v2] usb: gadget: f_ncm: replace kzalloc with kzalloc_obj
config: riscv-randconfig-002-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180113.YgfMQGgX-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180113.YgfMQGgX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180113.YgfMQGgX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/gadget/function/f_ncm.c: In function 'ncm_bind':
>> drivers/usb/gadget/function/f_ncm.c:1459:17: error: assignment to 'struct usb_os_desc_table *' from incompatible pointer type 'struct usb_os_desc_table **' [-Werror=incompatible-pointer-types]
      os_desc_table = kzalloc_obj(os_desc_table);
                    ^
   drivers/usb/gadget/function/f_ncm.c: In function 'ncm_alloc':
>> drivers/usb/gadget/function/f_ncm.c:1756:6: error: assignment to 'struct f_ncm *' from incompatible pointer type 'struct f_ncm **' [-Werror=incompatible-pointer-types]
     ncm = kzalloc_obj(ncm);
         ^
   cc1: some warnings being treated as errors


vim +1459 drivers/usb/gadget/function/f_ncm.c

  1441	
  1442	static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
  1443	{
  1444		struct usb_composite_dev *cdev = c->cdev;
  1445		struct f_ncm		*ncm = func_to_ncm(f);
  1446		struct f_ncm_opts	*ncm_opts = func_to_ncm_opts(f);
  1447		struct usb_string	*us;
  1448		int			status = 0;
  1449		struct usb_ep		*ep;
  1450	
  1451		struct usb_os_desc_table	*os_desc_table __free(kfree) = NULL;
  1452		struct net_device		*netdev __free(free_gether_netdev) = NULL;
  1453		struct usb_request		*request __free(free_usb_request) = NULL;
  1454	
  1455		if (!can_support_ecm(cdev->gadget))
  1456			return -EINVAL;
  1457	
  1458		if (cdev->use_os_string) {
> 1459			os_desc_table = kzalloc_obj(os_desc_table);
  1460			if (!os_desc_table)
  1461				return -ENOMEM;
  1462		}
  1463	
  1464		netdev = gether_setup_default();
  1465		if (IS_ERR(netdev))
  1466			return -ENOMEM;
  1467	
  1468		scoped_guard(mutex, &ncm_opts->lock) {
  1469			gether_apply_opts(netdev, &ncm_opts->net_opts);
  1470			netdev->mtu = ncm_opts->max_segment_size - ETH_HLEN;
  1471		}
  1472	
  1473		gether_set_gadget(netdev, cdev->gadget);
  1474		status = gether_register_netdev(netdev);
  1475		if (status)
  1476			return status;
  1477	
  1478		/* export host's Ethernet address in CDC format */
  1479		status = gether_get_host_addr_cdc(netdev, ncm->ethaddr,
  1480						  sizeof(ncm->ethaddr));
  1481		if (status < 12)
  1482			return -EINVAL;
  1483		ncm_string_defs[STRING_MAC_IDX].s = ncm->ethaddr;
  1484	
  1485		us = usb_gstrings_attach(cdev, ncm_strings,
  1486					 ARRAY_SIZE(ncm_string_defs));
  1487		if (IS_ERR(us))
  1488			return PTR_ERR(us);
  1489	
  1490		ncm_control_intf.iInterface = us[STRING_CTRL_IDX].id;
  1491		ncm_data_nop_intf.iInterface = us[STRING_DATA_IDX].id;
  1492		ncm_data_intf.iInterface = us[STRING_DATA_IDX].id;
  1493		ecm_desc.iMACAddress = us[STRING_MAC_IDX].id;
  1494		ncm_iad_desc.iFunction = us[STRING_IAD_IDX].id;
  1495	
  1496		/* allocate instance-specific interface IDs */
  1497		status = usb_interface_id(c, f);
  1498		if (status < 0)
  1499			return status;
  1500		ncm->ctrl_id = status;
  1501		ncm_iad_desc.bFirstInterface = status;
  1502	
  1503		ncm_control_intf.bInterfaceNumber = status;
  1504		ncm_union_desc.bMasterInterface0 = status;
  1505	
  1506		status = usb_interface_id(c, f);
  1507		if (status < 0)
  1508			return status;
  1509		ncm->data_id = status;
  1510	
  1511		ncm_data_nop_intf.bInterfaceNumber = status;
  1512		ncm_data_intf.bInterfaceNumber = status;
  1513		ncm_union_desc.bSlaveInterface0 = status;
  1514	
  1515		ecm_desc.wMaxSegmentSize = cpu_to_le16(ncm_opts->max_segment_size);
  1516	
  1517		/* allocate instance-specific endpoints */
  1518		ep = usb_ep_autoconfig(cdev->gadget, &fs_ncm_in_desc);
  1519		if (!ep)
  1520			return -ENODEV;
  1521		ncm->port.in_ep = ep;
  1522	
  1523		ep = usb_ep_autoconfig(cdev->gadget, &fs_ncm_out_desc);
  1524		if (!ep)
  1525			return -ENODEV;
  1526		ncm->port.out_ep = ep;
  1527	
  1528		ep = usb_ep_autoconfig(cdev->gadget, &fs_ncm_notify_desc);
  1529		if (!ep)
  1530			return -ENODEV;
  1531		ncm->notify = ep;
  1532	
  1533		/* allocate notification request and buffer */
  1534		request = usb_ep_alloc_request(ep, GFP_KERNEL);
  1535		if (!request)
  1536			return -ENOMEM;
  1537		request->buf = kmalloc(NCM_STATUS_BYTECOUNT, GFP_KERNEL);
  1538		if (!request->buf)
  1539			return -ENOMEM;
  1540		request->context = ncm;
  1541		request->complete = ncm_notify_complete;
  1542	
  1543		/*
  1544		 * support all relevant hardware speeds... we expect that when
  1545		 * hardware is dual speed, all bulk-capable endpoints work at
  1546		 * both speeds
  1547		 */
  1548		hs_ncm_in_desc.bEndpointAddress = fs_ncm_in_desc.bEndpointAddress;
  1549		hs_ncm_out_desc.bEndpointAddress = fs_ncm_out_desc.bEndpointAddress;
  1550		hs_ncm_notify_desc.bEndpointAddress =
  1551			fs_ncm_notify_desc.bEndpointAddress;
  1552	
  1553		ss_ncm_in_desc.bEndpointAddress = fs_ncm_in_desc.bEndpointAddress;
  1554		ss_ncm_out_desc.bEndpointAddress = fs_ncm_out_desc.bEndpointAddress;
  1555		ss_ncm_notify_desc.bEndpointAddress =
  1556			fs_ncm_notify_desc.bEndpointAddress;
  1557	
  1558		status = usb_assign_descriptors(f, ncm_fs_function, ncm_hs_function,
  1559				ncm_ss_function, ncm_ss_function);
  1560		if (status)
  1561			return status;
  1562	
  1563		/*
  1564		 * NOTE:  all that is done without knowing or caring about
  1565		 * the network link ... which is unavailable to this code
  1566		 * until we're activated via set_alt().
  1567		 */
  1568	
  1569		ncm->port.open = ncm_open;
  1570		ncm->port.close = ncm_close;
  1571	
  1572		hrtimer_setup(&ncm->task_timer, ncm_tx_timeout, CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
  1573	
  1574		if (cdev->use_os_string) {
  1575			os_desc_table[0].os_desc = &ncm_opts->ncm_os_desc;
  1576			os_desc_table[0].if_id = ncm_iad_desc.bFirstInterface;
  1577			f->os_desc_table = no_free_ptr(os_desc_table);
  1578			f->os_desc_n = 1;
  1579		}
  1580		ncm->notify_req = no_free_ptr(request);
  1581		ncm->netdev = no_free_ptr(netdev);
  1582		ncm->port.ioport = netdev_priv(ncm->netdev);
  1583	
  1584		DBG(cdev, "CDC Network: IN/%s OUT/%s NOTIFY/%s\n",
  1585				ncm->port.in_ep->name, ncm->port.out_ep->name,
  1586				ncm->notify->name);
  1587		return 0;
  1588	}
  1589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

