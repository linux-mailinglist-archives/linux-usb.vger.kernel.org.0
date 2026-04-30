Return-Path: <linux-usb+bounces-36728-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD4qNQDq8mltvgEAu9opvQ
	(envelope-from <linux-usb+bounces-36728-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 07:34:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DC249D9EA
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 07:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A363301A38F
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 05:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA58C363082;
	Thu, 30 Apr 2026 05:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AejIVYUj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EB5260565
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 05:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777527291; cv=none; b=cp7k1fvuSdFuJmK2kZilE0vs8y2KSF197LPIY4xforOzp4O/XnOw2IO3UcSSfBsMrm/2zdR24Be3bpDNMfKceZO6PxlFeya2YYrNwE0BqcJWxDLV3F6OjyOwlFOOIDy6Zd1r1ugC0vNYsXO5nuTYS5u1jO4F0ZJA7w3EUbJceKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777527291; c=relaxed/simple;
	bh=GKqaCZ9mJPyPuAJnsh25HKcWTQzmKHugMIf0d4mP48c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=di5d+ZN0C1G7YI5Gb/Sb06yXGL0+ctuqAqMDWFi+hyMFIcQ7M7hLgJGoQLuSPVt0Yn0ORke1zxj4+q+rgF4IIhaceoIEklOuZOisfrkLdoZGHNwddyRgTWCapy1JIqGs3C4ZKpfumVJSKYdfecrjRrk4K6/9t57j9AZwWG8egxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AejIVYUj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777527289; x=1809063289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GKqaCZ9mJPyPuAJnsh25HKcWTQzmKHugMIf0d4mP48c=;
  b=AejIVYUjI+qEJAqviKyiVVguXZuFyeq5Yxabe3T6jwY+otLV9EovJRjr
   AsxCa00w7fXHaNJ71mq3SiXo0q3ZTABubyQVJtBrnXpEANu/WEvaqxVkf
   NBibWcHNh66j1tFOhS27WB05vBAdnaIln69nJ+SEbWpkZdKbPL6q2rKsV
   dHLFi1PtO1e7S7JhtTxaxY0VxF2Gdxu2eDyUiUq5ZlApdAmwzlgXcvv5f
   96dw3YxpehnTvXNOV0kQjiULNojDnVoOTRsHO/zkUATIMd8lAgA93z9GW
   ljBaMllC+Gy3K1Gp7fzIX6zK3Rzls+LemJaYfffUAm1BNQhSY4vxQR1bx
   A==;
X-CSE-ConnectionGUID: 39P0fTAeSnyXD1TfSTvKyA==
X-CSE-MsgGUID: /4mZdUWESMCPCaWRF6qnJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78493062"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78493062"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 22:34:49 -0700
X-CSE-ConnectionGUID: 1y+mo0MNQBCafKxMU2D69g==
X-CSE-MsgGUID: wSi5s/68TeWFKnt8MBlLrw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2026 22:34:47 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIK2u-00000000C08-1e1h;
	Thu, 30 Apr 2026 05:34:44 +0000
Date: Thu, 30 Apr 2026 13:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>,
	syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	tiwai@suse.com, Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] sound: usb: caiaq: fix reference leak in probe error
Message-ID: <202604301315.U4YJaZc3-lkp@intel.com>
References: <20260429104527.19927-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429104527.19927-1-oneukum@suse.com>
X-Rspamd-Queue-Id: 35DC249D9EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36728-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,2afd7e71155c7e241560];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:email,intel.com:dkim,intel.com:mid]

Hi Oliver,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus usb/usb-testing usb/usb-next usb/usb-linus westeri-thunderbolt/next peter-chen-usb/for-usb-next linus/master v7.1-rc1 next-20260429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/sound-usb-caiaq-fix-reference-leak-in-probe-error/20260429-205539
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20260429104527.19927-1-oneukum%40suse.com
patch subject: [PATCH] sound: usb: caiaq: fix reference leak in probe error
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260430/202604301315.U4YJaZc3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301315.U4YJaZc3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301315.U4YJaZc3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/usb/caiaq/device.c: In function 'init_card':
>> sound/usb/caiaq/device.c:534:2: warning: label 'err_dev_put' defined but not used [-Wunused-label]
     534 |  err_dev_put:
         |  ^~~~~~~~~~~
>> sound/usb/caiaq/device.c:475:17: error: label 'dev_err_put' used but not defined
     475 |                 goto dev_err_put;
         |                 ^~~~


vim +/dev_err_put +475 sound/usb/caiaq/device.c

   434	
   435	static int init_card(struct snd_usb_caiaqdev *cdev)
   436	{
   437		char *c, usbpath[32];
   438		struct usb_device *usb_dev = cdev->chip.dev;
   439		struct snd_card *card = cdev->chip.card;
   440		struct device *dev = caiaqdev_to_dev(cdev);
   441		int err, len;
   442	
   443		if (usb_set_interface(usb_dev, 0, 1) != 0) {
   444			dev_err(dev, "can't set alt interface.\n");
   445			err = -EIO;
   446			goto dev_err_put;
   447		}
   448	
   449		usb_init_urb(&cdev->ep1_in_urb);
   450		usb_init_urb(&cdev->midi_out_urb);
   451	
   452		usb_fill_bulk_urb(&cdev->ep1_in_urb, usb_dev,
   453				  usb_rcvbulkpipe(usb_dev, 0x1),
   454				  cdev->ep1_in_buf, EP1_BUFSIZE,
   455				  usb_ep1_command_reply_dispatch, cdev);
   456	
   457		usb_fill_bulk_urb(&cdev->midi_out_urb, usb_dev,
   458				  usb_sndbulkpipe(usb_dev, 0x1),
   459				  cdev->midi_out_buf, EP1_BUFSIZE,
   460				  snd_usb_caiaq_midi_output_done, cdev);
   461	
   462		/* sanity checks of EPs before actually submitting */
   463		if (usb_urb_ep_type_check(&cdev->ep1_in_urb) ||
   464		    usb_urb_ep_type_check(&cdev->midi_out_urb)) {
   465			dev_err(dev, "invalid EPs\n");
   466			err = -EINVAL;
   467			goto dev_err_put;
   468		}
   469	
   470		init_waitqueue_head(&cdev->ep1_wait_queue);
   471		init_waitqueue_head(&cdev->prepare_wait_queue);
   472	
   473		if (usb_submit_urb(&cdev->ep1_in_urb, GFP_KERNEL) != 0) {
   474			err = -EIO;
 > 475			goto dev_err_put;
   476		}
   477	
   478	
   479		err = snd_usb_caiaq_send_command(cdev, EP1_CMD_GET_DEVICE_INFO, NULL, 0);
   480		if (err)
   481			goto err_kill_urb;
   482	
   483		if (!wait_event_timeout(cdev->ep1_wait_queue, cdev->spec_received, HZ)) {
   484			err = -ENODEV;
   485			goto err_kill_urb;
   486		}
   487	
   488		usb_string(usb_dev, usb_dev->descriptor.iManufacturer,
   489			   cdev->vendor_name, CAIAQ_USB_STR_LEN);
   490	
   491		usb_string(usb_dev, usb_dev->descriptor.iProduct,
   492			   cdev->product_name, CAIAQ_USB_STR_LEN);
   493	
   494		strscpy(card->driver, MODNAME, sizeof(card->driver));
   495		strscpy(card->shortname, cdev->product_name, sizeof(card->shortname));
   496		strscpy(card->mixername, cdev->product_name, sizeof(card->mixername));
   497	
   498		/* if the id was not passed as module option, fill it with a shortened
   499		 * version of the product string which does not contain any
   500		 * whitespaces */
   501	
   502		if (*card->id == '\0') {
   503			char id[sizeof(card->id)];
   504	
   505			memset(id, 0, sizeof(id));
   506	
   507			for (c = card->shortname, len = 0;
   508				*c && len < sizeof(card->id) - 1; c++)
   509				if (*c != ' ')
   510					id[len++] = *c;
   511	
   512			snd_card_set_id(card, id);
   513		}
   514	
   515		usb_make_path(usb_dev, usbpath, sizeof(usbpath));
   516		scnprintf(card->longname, sizeof(card->longname), "%s %s (%s)",
   517			       cdev->vendor_name, cdev->product_name, usbpath);
   518	
   519		card->private_free = card_free;
   520		err = setup_card(cdev);
   521		if (err < 0)
   522			return err;
   523	
   524		return 0;
   525	
   526	 err_kill_urb:
   527		usb_kill_urb(&cdev->ep1_in_urb);
   528	
   529		/*
   530	 	 * private_free has not been set.
   531		 * Undoing the usb_get_dev() from
   532		 * create_card()
   533		 */
 > 534	 err_dev_put:
   535		usb_put_dev(usb_dev);
   536		return err;
   537	}
   538	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

