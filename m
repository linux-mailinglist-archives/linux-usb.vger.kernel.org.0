Return-Path: <linux-usb+bounces-20656-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB510A36606
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 20:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE34D1717CC
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 19:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6181C84C9;
	Fri, 14 Feb 2025 19:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ANwzL4Iv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9D31C84B2
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 19:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739560275; cv=none; b=Gu1Uz1+Jt8wYN5VGzGeVQjW+tFi4nkhHeUfQiFSF4SrkLsh951XIkGqpgbNdRG7Ux3XkwnSUr9WUS3BHeVspHlglX9V2Xm5wGafDik9pHZg/M5aQuKCAH9tqBx2VbRFrxL+YYDDdfUlOKGQTSD+PjYykNWQ6+91lF217QNjFCmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739560275; c=relaxed/simple;
	bh=PSJq4ZHtugp58AsP05ZHowSBA1l6edf6Q/48K92OyOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=brNQRIR5TlPLcnuHL9/AJot79yHEIi7r3d5tVNkAtuLUOg3t0l8hXocjrcEiWsPy/ivAvRtPnMPc5GG3JR4AkY2ice58ZPhdcJzMwswKS5RmYyKvdd1mOdy57Ub6LJquF4vArKnGrQEcZHqLbBR7yIwtu/LXuh06CcLv/cmYyL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ANwzL4Iv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739560273; x=1771096273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PSJq4ZHtugp58AsP05ZHowSBA1l6edf6Q/48K92OyOE=;
  b=ANwzL4IvKTTYzny/QANge7J5knaWz3uoLCaIFv08+JSo5Gjh+YAk8lDz
   74vUL7uMqJv8tNcfekN1bdyjuBi25W5pW8xBtJDzWdhdp8eXlXUpxsWtb
   F7rQED5id4NIrZT+PGQlONkWT2iP+rvr06faOpqm9EEQRnNmedr6qgVI7
   J/zKbh3LhdXJsoNklPeyZxFXEavmoUBdEK+Ifw9c4DQDJ8Z2TJ0h5Mvj1
   hzoalx+jqAudRw9wVAPDZFyOTSOsfn5g1SFGyP1NF40BOC/D+ZG7Hj7d6
   uPEOSNHNPr17ZuVfUw5ppK3x/I5IKYJpe56SxIEIoR0ViOtCmKBhiwXiC
   g==;
X-CSE-ConnectionGUID: UhC1pNQoTBCfheku4rijhQ==
X-CSE-MsgGUID: 5q9tKFFdTpyJ7OwefOd6BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39505403"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="39505403"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 11:11:03 -0800
X-CSE-ConnectionGUID: EsAbQ2fQQjypcknEmYHpMg==
X-CSE-MsgGUID: C0kZzWdkSLakKQWrIcrTVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="113510062"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Feb 2025 11:11:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj15X-001A4H-0X;
	Fri, 14 Feb 2025 19:10:59 +0000
Date: Sat, 15 Feb 2025 03:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [usb:usb-testing 38/52] sound/soc/soc-usb.c:110: warning: Function
 parameter or struct member 'dev' not described in
 'snd_soc_usb_update_offload_route'
Message-ID: <202502150243.pkbkSHL2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   c26f6731b8da887f1fb92d4654da57a19a266466
commit: 52b88f62ef509d8d995e7e9e0a6aeab8fa8c430c [38/52] ASoC: usb: Fetch ASoC card and pcm device information
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250215/202502150243.pkbkSHL2-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150243.pkbkSHL2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150243.pkbkSHL2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-usb.c:110: warning: Function parameter or struct member 'dev' not described in 'snd_soc_usb_update_offload_route'
>> sound/soc/soc-usb.c:110: warning: Function parameter or struct member 'card' not described in 'snd_soc_usb_update_offload_route'
>> sound/soc/soc-usb.c:110: warning: Function parameter or struct member 'pcm' not described in 'snd_soc_usb_update_offload_route'
>> sound/soc/soc-usb.c:110: warning: Function parameter or struct member 'direction' not described in 'snd_soc_usb_update_offload_route'
>> sound/soc/soc-usb.c:110: warning: Function parameter or struct member 'path' not described in 'snd_soc_usb_update_offload_route'
>> sound/soc/soc-usb.c:110: warning: Function parameter or struct member 'route' not described in 'snd_soc_usb_update_offload_route'
   sound/soc/soc-usb.c:205: warning: bad line: 


vim +110 sound/soc/soc-usb.c

    92	
    93	/**
    94	 * snd_soc_usb_update_offload_route - Find active USB offload path
    95	 * @dev - USB device to get offload status
    96	 * @card - USB card index
    97	 * @pcm - USB PCM device index
    98	 * @direction - playback or capture direction
    99	 * @route - pointer to route output array
   100	 *
   101	 * Fetch the current status for the USB SND card and PCM device indexes
   102	 * specified.  The "route" argument should be an array of integers being
   103	 * used for a kcontrol output.  The first element should have the selected
   104	 * card index, and the second element should have the selected pcm device
   105	 * index.
   106	 */
   107	int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
   108					     int direction, enum snd_soc_usb_kctl path,
   109					     long *route)
 > 110	{
   111		struct snd_soc_usb *ctx;
   112		int ret = -ENODEV;
   113	
   114		mutex_lock(&ctx_mutex);
   115		ctx = snd_soc_find_usb_ctx(dev);
   116		if (!ctx)
   117			goto exit;
   118	
   119		if (ctx->update_offload_route_info)
   120			ret = ctx->update_offload_route_info(ctx->component, card, pcm,
   121							     direction, path, route);
   122	exit:
   123		mutex_unlock(&ctx_mutex);
   124	
   125		return ret;
   126	}
   127	EXPORT_SYMBOL_GPL(snd_soc_usb_update_offload_route);
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

