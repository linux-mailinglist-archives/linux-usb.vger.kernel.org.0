Return-Path: <linux-usb+bounces-34669-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GKTN6SQsml5NgAAu9opvQ
	(envelope-from <linux-usb+bounces-34669-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 11:08:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 588A0270143
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 11:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25B1D301D4C2
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 10:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1963E39EF01;
	Thu, 12 Mar 2026 10:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkAI835o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F213BED50
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 10:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773310086; cv=none; b=fFvhXGNyPjMRocf4/bjFIU//KtcSyZJFa+t9Zoj/vshHVt4Xv0oh7qJEKOPynpiXOspln4xb24RcPInu3QuE6NqO+kb5Brhxhxj47JNcfU797avSUtheSa4eO4ERlIXAgysc0xHl4fiFFQANgxbvBwH2EhOHB/Lxv/ltOBbylW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773310086; c=relaxed/simple;
	bh=jTzDuQF38gmyo5ylEsnA+3m5Kgp9I8cXEzgTakS362o=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mukr4LV3KtoDgmzsdQTXndXZkT/DkXBcIAD8GTFWpJU0XTVwaWv5+NCWOmf3uZ6TyRYOJrbzaEamMljYCkS96/Ga+XoRQ9FUiytm26ZoRC1pViUzpFqEsCw/3pozWAoRTr3ncv2lCaUSnUim9qObtPnmZJdJVe92/2+B/Fwxgv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SkAI835o; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773310085; x=1804846085;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=jTzDuQF38gmyo5ylEsnA+3m5Kgp9I8cXEzgTakS362o=;
  b=SkAI835ox0jRv3/4TuIqciw6yG7YsDFQyNGTFR6Xlq/8Rx6DIOjv9IQx
   e/frlTEVaFJoC21Yr2IcIq50lQki2pX1m+dApNLb7DFyAMPgtRjze7MUN
   smAO99GIggwbcp2pzAhnvzDc6hO4gj3QwOnBULAKrUTA+yE67c79vUkL2
   YY85TXdcwtWJP28vtMCR83NkQF3vD/LWtrepAMidadRExpPs4ed+GigeO
   uzLmUITRQdqDt6IxQuKOBzxlX5A2+9XpKrPqynEj9b9hDZ9Z4Oi6YwIBO
   gilqAIeFuJ56pBHDyFaphKI2v9szTAUYuTSPdpJHBogos6Ks2SkPzQzZt
   w==;
X-CSE-ConnectionGUID: omSjdIriSuSG6/t3sh8ijw==
X-CSE-MsgGUID: 9akwpSa4RqCDCn7Ck7UFEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74276322"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="74276322"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 03:08:05 -0700
X-CSE-ConnectionGUID: BEsS2pSGSBKafmk0JuERPw==
X-CSE-MsgGUID: IKP133LQQmKjHWYGFd0ouw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="216911722"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2026 03:08:03 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0cxV-000000002Kn-0SOb;
	Thu, 12 Mar 2026 10:08:01 +0000
Date: Thu, 12 Mar 2026 18:07:10 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: use kzalloc_flex
Message-ID: <202603121824.MZubfxH0-lkp@intel.com>
References: <20260311232205.18137-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311232205.18137-1-rosenp@gmail.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34669-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 588A0270143
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on westeri-thunderbolt/next]
[also build test WARNING on linus/master v7.0-rc3 next-20260311]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/thunderbolt-use-kzalloc_flex/20260312-072328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20260311232205.18137-1-rosenp%40gmail.com
patch subject: [PATCH] thunderbolt: use kzalloc_flex
config: um-randconfig-r051-20260312 (https://download.01.org/0day-ci/archive/20260312/202603121824.MZubfxH0-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7d47b695929cc7f85eeb0f87d0189adc04c1c629)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121824.MZubfxH0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603121824.MZubfxH0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/thunderbolt/path.c:14:
   In file included from drivers/thunderbolt/tb.h:14:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/thunderbolt/path.c:254:9: warning: variable 'path' is uninitialized when used here [-Wuninitialized]
     254 |                 kfree(path);
         |                       ^~~~
   drivers/thunderbolt/path.c:239:22: note: initialize the variable 'path' to silence this warning
     239 |         struct tb_path *path;
         |                             ^
         |                              = NULL
   2 warnings generated.


vim +/path +254 drivers/thunderbolt/path.c

0414bec5f39a3c7 Mika Westerberg    2017-02-19  214  
520b670216a15fb Andreas Noever     2014-06-03  215  /**
8c7acaaf020fe54 Mika Westerberg    2017-02-19  216   * tb_path_alloc() - allocate a thunderbolt path between two ports
8c7acaaf020fe54 Mika Westerberg    2017-02-19  217   * @tb: Domain pointer
8c7acaaf020fe54 Mika Westerberg    2017-02-19  218   * @src: Source port of the path
8c7acaaf020fe54 Mika Westerberg    2017-02-19  219   * @src_hopid: HopID used for the first ingress port in the path
8c7acaaf020fe54 Mika Westerberg    2017-02-19  220   * @dst: Destination port of the path
8c7acaaf020fe54 Mika Westerberg    2017-02-19  221   * @dst_hopid: HopID used for the last egress port in the path
8c7acaaf020fe54 Mika Westerberg    2017-02-19  222   * @link_nr: Preferred link if there are dual links on the path
8c7acaaf020fe54 Mika Westerberg    2017-02-19  223   * @name: Name of the path
8c7acaaf020fe54 Mika Westerberg    2017-02-19  224   *
8c7acaaf020fe54 Mika Westerberg    2017-02-19  225   * Creates path between two ports starting with given @src_hopid. Reserves
8c7acaaf020fe54 Mika Westerberg    2017-02-19  226   * HopIDs for each port (they can be different from @src_hopid depending on
8c7acaaf020fe54 Mika Westerberg    2017-02-19  227   * how many HopIDs each port already have reserved). If there are dual
91c0c12080d0f40 Mika Westerberg    2019-03-21  228   * links on the path, prioritizes using @link_nr but takes into account
91c0c12080d0f40 Mika Westerberg    2019-03-21  229   * that the lanes may be bonded.
520b670216a15fb Andreas Noever     2014-06-03  230   *
a6e3f939ada8c45 Alan Borzeszkowski 2025-08-27  231   * Return: Pointer to &struct tb_path, %NULL in case of failure.
520b670216a15fb Andreas Noever     2014-06-03  232   */
8c7acaaf020fe54 Mika Westerberg    2017-02-19  233  struct tb_path *tb_path_alloc(struct tb *tb, struct tb_port *src, int src_hopid,
8c7acaaf020fe54 Mika Westerberg    2017-02-19  234  			      struct tb_port *dst, int dst_hopid, int link_nr,
8c7acaaf020fe54 Mika Westerberg    2017-02-19  235  			      const char *name)
520b670216a15fb Andreas Noever     2014-06-03  236  {
7e897bb7be11983 Mika Westerberg    2020-05-17  237  	struct tb_port *in_port, *out_port, *first_port, *last_port;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  238  	int in_hopid, out_hopid;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  239  	struct tb_path *path;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  240  	size_t num_hops;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  241  	int i, ret;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  242  
7e897bb7be11983 Mika Westerberg    2020-05-17  243  	first_port = last_port = NULL;
c64c3f3ac63a101 Mika Westerberg    2020-04-29  244  	i = 0;
7e897bb7be11983 Mika Westerberg    2020-05-17  245  	tb_for_each_port_on_path(src, dst, in_port) {
7e897bb7be11983 Mika Westerberg    2020-05-17  246  		if (!first_port)
7e897bb7be11983 Mika Westerberg    2020-05-17  247  			first_port = in_port;
7e897bb7be11983 Mika Westerberg    2020-05-17  248  		last_port = in_port;
c64c3f3ac63a101 Mika Westerberg    2020-04-29  249  		i++;
7e897bb7be11983 Mika Westerberg    2020-05-17  250  	}
7e897bb7be11983 Mika Westerberg    2020-05-17  251  
7e897bb7be11983 Mika Westerberg    2020-05-17  252  	/* Check that src and dst are reachable */
7e897bb7be11983 Mika Westerberg    2020-05-17  253  	if (first_port != src || last_port != dst) {
7e897bb7be11983 Mika Westerberg    2020-05-17 @254  		kfree(path);
7e897bb7be11983 Mika Westerberg    2020-05-17  255  		return NULL;
7e897bb7be11983 Mika Westerberg    2020-05-17  256  	}
c64c3f3ac63a101 Mika Westerberg    2020-04-29  257  
c64c3f3ac63a101 Mika Westerberg    2020-04-29  258  	/* Each hop takes two ports */
c64c3f3ac63a101 Mika Westerberg    2020-04-29  259  	num_hops = i / 2;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  260  
f02e75329d5baac Rosen Penev        2026-03-11  261  	path = kzalloc_flex(*path, hops, num_hops);
f02e75329d5baac Rosen Penev        2026-03-11  262  	if (!path)
520b670216a15fb Andreas Noever     2014-06-03  263  		return NULL;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  264  
f02e75329d5baac Rosen Penev        2026-03-11  265  	path->path_length = num_hops;
43bddb26e20af91 Mika Westerberg    2021-11-14  266  	path->alloc_hopid = true;
43bddb26e20af91 Mika Westerberg    2021-11-14  267  
8c7acaaf020fe54 Mika Westerberg    2017-02-19  268  	in_hopid = src_hopid;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  269  	out_port = NULL;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  270  
8c7acaaf020fe54 Mika Westerberg    2017-02-19  271  	for (i = 0; i < num_hops; i++) {
8c7acaaf020fe54 Mika Westerberg    2017-02-19  272  		in_port = tb_next_port_on_path(src, dst, out_port);
8c7acaaf020fe54 Mika Westerberg    2017-02-19  273  		if (!in_port)
8c7acaaf020fe54 Mika Westerberg    2017-02-19  274  			goto err;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  275  
91c0c12080d0f40 Mika Westerberg    2019-03-21  276  		/* When lanes are bonded primary link must be used */
91c0c12080d0f40 Mika Westerberg    2019-03-21  277  		if (!in_port->bonded && in_port->dual_link_port &&
91c0c12080d0f40 Mika Westerberg    2019-03-21  278  		    in_port->link_nr != link_nr)
8c7acaaf020fe54 Mika Westerberg    2017-02-19  279  			in_port = in_port->dual_link_port;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  280  
8c7acaaf020fe54 Mika Westerberg    2017-02-19  281  		ret = tb_port_alloc_in_hopid(in_port, in_hopid, in_hopid);
8c7acaaf020fe54 Mika Westerberg    2017-02-19  282  		if (ret < 0)
8c7acaaf020fe54 Mika Westerberg    2017-02-19  283  			goto err;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  284  		in_hopid = ret;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  285  
8c7acaaf020fe54 Mika Westerberg    2017-02-19  286  		out_port = tb_next_port_on_path(src, dst, in_port);
8c7acaaf020fe54 Mika Westerberg    2017-02-19  287  		if (!out_port)
8c7acaaf020fe54 Mika Westerberg    2017-02-19  288  			goto err;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  289  
91c0c12080d0f40 Mika Westerberg    2019-03-21  290  		/*
91c0c12080d0f40 Mika Westerberg    2019-03-21  291  		 * Pick up right port when going from non-bonded to
91c0c12080d0f40 Mika Westerberg    2019-03-21  292  		 * bonded or from bonded to non-bonded.
91c0c12080d0f40 Mika Westerberg    2019-03-21  293  		 */
91c0c12080d0f40 Mika Westerberg    2019-03-21  294  		if (out_port->dual_link_port) {
91c0c12080d0f40 Mika Westerberg    2019-03-21  295  			if (!in_port->bonded && out_port->bonded &&
91c0c12080d0f40 Mika Westerberg    2019-03-21  296  			    out_port->link_nr) {
91c0c12080d0f40 Mika Westerberg    2019-03-21  297  				/*
91c0c12080d0f40 Mika Westerberg    2019-03-21  298  				 * Use primary link when going from
91c0c12080d0f40 Mika Westerberg    2019-03-21  299  				 * non-bonded to bonded.
91c0c12080d0f40 Mika Westerberg    2019-03-21  300  				 */
8c7acaaf020fe54 Mika Westerberg    2017-02-19  301  				out_port = out_port->dual_link_port;
91c0c12080d0f40 Mika Westerberg    2019-03-21  302  			} else if (!out_port->bonded &&
91c0c12080d0f40 Mika Westerberg    2019-03-21  303  				   out_port->link_nr != link_nr) {
91c0c12080d0f40 Mika Westerberg    2019-03-21  304  				/*
91c0c12080d0f40 Mika Westerberg    2019-03-21  305  				 * If out port is not bonded follow
91c0c12080d0f40 Mika Westerberg    2019-03-21  306  				 * link_nr.
91c0c12080d0f40 Mika Westerberg    2019-03-21  307  				 */
91c0c12080d0f40 Mika Westerberg    2019-03-21  308  				out_port = out_port->dual_link_port;
91c0c12080d0f40 Mika Westerberg    2019-03-21  309  			}
91c0c12080d0f40 Mika Westerberg    2019-03-21  310  		}
8c7acaaf020fe54 Mika Westerberg    2017-02-19  311  
8c7acaaf020fe54 Mika Westerberg    2017-02-19  312  		if (i == num_hops - 1)
8c7acaaf020fe54 Mika Westerberg    2017-02-19  313  			ret = tb_port_alloc_out_hopid(out_port, dst_hopid,
8c7acaaf020fe54 Mika Westerberg    2017-02-19  314  						      dst_hopid);
8c7acaaf020fe54 Mika Westerberg    2017-02-19  315  		else
8c7acaaf020fe54 Mika Westerberg    2017-02-19  316  			ret = tb_port_alloc_out_hopid(out_port, -1, -1);
8c7acaaf020fe54 Mika Westerberg    2017-02-19  317  
8c7acaaf020fe54 Mika Westerberg    2017-02-19  318  		if (ret < 0)
8c7acaaf020fe54 Mika Westerberg    2017-02-19  319  			goto err;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  320  		out_hopid = ret;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  321  
8c7acaaf020fe54 Mika Westerberg    2017-02-19  322  		path->hops[i].in_hop_index = in_hopid;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  323  		path->hops[i].in_port = in_port;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  324  		path->hops[i].in_counter_index = -1;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  325  		path->hops[i].out_port = out_port;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  326  		path->hops[i].next_hop_index = out_hopid;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  327  
8c7acaaf020fe54 Mika Westerberg    2017-02-19  328  		in_hopid = out_hopid;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  329  	}
8c7acaaf020fe54 Mika Westerberg    2017-02-19  330  
520b670216a15fb Andreas Noever     2014-06-03  331  	path->tb = tb;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  332  	path->name = name;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  333  
520b670216a15fb Andreas Noever     2014-06-03  334  	return path;
8c7acaaf020fe54 Mika Westerberg    2017-02-19  335  
8c7acaaf020fe54 Mika Westerberg    2017-02-19  336  err:
8c7acaaf020fe54 Mika Westerberg    2017-02-19  337  	tb_path_free(path);
8c7acaaf020fe54 Mika Westerberg    2017-02-19  338  	return NULL;
520b670216a15fb Andreas Noever     2014-06-03  339  }
520b670216a15fb Andreas Noever     2014-06-03  340  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

