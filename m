Return-Path: <linux-usb+bounces-36714-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uF33GnZf8mnqqQEAu9opvQ
	(envelope-from <linux-usb+bounces-36714-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 21:43:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B15B1499DBF
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 21:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 201EC303A597
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2810F377574;
	Wed, 29 Apr 2026 19:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ix0iH77A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9CE34EF0C
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 19:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777491805; cv=none; b=gFqu4jAcOOlrIXlAGlliStvKQ30+Kn4JX6i8kiwNLBnCNTXh08Id/h5ksJPg2axNpFF5DeK2gkkeollOSv78w/29a/KPvjYa8GCZQUHmtVHZCdv/My1NyEqA78iabW1+4+oWcA6MqytAWx83Jj844rOCHXmZXXaiF6RA4Hm7Mfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777491805; c=relaxed/simple;
	bh=T/awfMBFeHgq05OeZMv9M9E/FC10F6QIUuc/NOY2X0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrRo/DI4Id+d9MDaCwyX5zy7AIcTiHUu6rwUCnoQtywlkjdLNYvDgaIKukHb3rpwhov5S7RPMYekTM8Zpo0yP6BHJ0Iwz5tpEK5s7uODh89F05pno0xh9hybpKKrDTNfvU9ERQlqC7FOBkPF23fP8YAZaPodBfFBdbhOM0Nj/jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ix0iH77A; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777491804; x=1809027804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T/awfMBFeHgq05OeZMv9M9E/FC10F6QIUuc/NOY2X0A=;
  b=ix0iH77AONn4nfTOW0wGcXtGz8ee3AFZn3IrRfyJrUzzhDtDHMMrVe23
   IdrZifEHynvIk7CvKY/lPOG4I3ICH4wIaO3TWeKRsSoVxNh4k/EP3TLUG
   ypzmDSV2aH8uAfAF+TsUIOfmewKEOR6JDgiyCchmCodiVIhSHWUzs3Ksu
   NYnfDq1ji8USzvIZWVOwCJ1s6QK9zFaHEcPQ4D+FLtasRs0PZhCn5fHcz
   7fILl88pXdR85p6HQyafOiHwJw0d7WnEiC4ur4jEYjneDWj+uwTz02Okh
   Jis1td31KoE48R0I2q1rq+BMMzNOUh7j1LU0Gm7quW3psKsd1+B7Em1Fc
   g==;
X-CSE-ConnectionGUID: zvT+P1/iS5yrb5wIkc0/lQ==
X-CSE-MsgGUID: Fik5zHFEQHyOlZNDnX96LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="65963347"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="65963347"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 12:43:24 -0700
X-CSE-ConnectionGUID: vAK01lATTm6eix3mJcKxxw==
X-CSE-MsgGUID: safexyp+QnKX7gURECiJ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="238337883"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 29 Apr 2026 12:43:23 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIAoZ-000000004Yn-44r6;
	Wed, 29 Apr 2026 19:43:19 +0000
Date: Wed, 29 Apr 2026 21:42:53 +0200
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>,
	syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	tiwai@suse.com, Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] sound: usb: caiaq: fix reference leak in probe error
Message-ID: <202604292126.d4xbRC4p-lkp@intel.com>
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
X-Rspamd-Queue-Id: B15B1499DBF
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
	TAGGED_FROM(0.00)[bounces-36714-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid,git-scm.com:url]

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
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260429/202604292126.d4xbRC4p-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604292126.d4xbRC4p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604292126.d4xbRC4p-lkp@intel.com/

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

