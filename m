Return-Path: <linux-usb+bounces-20648-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E90B6A362F6
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 17:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 185701895FC6
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 16:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D076026770F;
	Fri, 14 Feb 2025 16:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIUezjSJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6F726772E
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739550044; cv=none; b=WQc5xzj86+w8Mz6YWPc63F2Jqol9k8y1qON+fiOT4BwjNg6V+F7fJmarnzsA0QzPOGMD0ExneiCwNwbbjZbNxdWZVpVXZy5AZOx1OCi2k2X8AVQLwz21a6pL4db0i6TgZhp702rGbcopIN6nJ4aPlCzDfJKI+9U7ubt2+ngBiKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739550044; c=relaxed/simple;
	bh=kNGUNc1MKVoBIXrh+HaIaylzin+VDhGEHfwFXojLAWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pljgJrX+5RJz7FxWVtQtFp4mUUF1jG5luoGHUwcwLuOLpsfRExQ5yB5frImrj+rlRTZfF0PdBFEVY2qqzvklUeC0DZjjFDRp/houxQJqamvEEhRfBNgqci4JRMyHUhPnsJOWT/1we+b0QbOj5WeI8XC8Zz2SDpOu2YwZ2Fwvjj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIUezjSJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739550043; x=1771086043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kNGUNc1MKVoBIXrh+HaIaylzin+VDhGEHfwFXojLAWw=;
  b=FIUezjSJsMs4VBTb95TZngU0UyaMAH2M32nFlU5MnlutMS1AutC0g1dp
   QGxMXf7MvwI98ImP5oAgG1V/3FUBWOj3BJKG7z/AVL6QuM6hYEvMzg4Ud
   o5/zjl5Midfv5t+WIflEETf9ACw2D8dIzNToQbrVJTPLsMB6oZK74SvbB
   e2JKvlke8gWs84Q6FTEWGnsT0TaOMRMyYEGf2HF86gEd+yjqB5e8cGMjt
   1F4pBTYIKQSDKXbGu1yhgSXXAznORbdPXYgpZjlXgj8RqLvmYVylpoqnx
   WrHkkJocmKq+QYiv0m4oqyp5UwE8kzV1h+p/jTFWQxPLmxGZgY5qN2Da2
   w==;
X-CSE-ConnectionGUID: 9ZVQaHBRQnCiyHDXKV1D6g==
X-CSE-MsgGUID: TJL5dR+IQa66GhuCQ0eR7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40571722"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="40571722"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 08:20:42 -0800
X-CSE-ConnectionGUID: M0Hgq+EeRoeLpgtHXUzViA==
X-CSE-MsgGUID: 9TGy4J4cRPyNCpXx/CFJ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="118608573"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Feb 2025 08:20:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiyQf-0019r5-1k;
	Fri, 14 Feb 2025 16:20:37 +0000
Date: Sat, 15 Feb 2025 00:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [usb:usb-testing 35/52] sound/soc/soc-usb.c:105: warning: bad line:
Message-ID: <202502150046.UFOZ4CQw-lkp@intel.com>
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
commit: 2ba03621a1f54cdd67274ee6e79f4b8b7559ee61 [35/52] ASoC: Add SoC USB APIs for adding an USB backend
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250215/202502150046.UFOZ4CQw-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150046.UFOZ4CQw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150046.UFOZ4CQw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-usb.c:105: warning: bad line: 


vim +105 sound/soc/soc-usb.c

   101	
   102	/**
   103	 * snd_soc_usb_free_port() - free a SoC USB port used for offloading support
   104	 * @usb: allocated SoC USB port
 > 105	
   106	 * Free and remove the SoC USB port from the available list of ports.  This will
   107	 * ensure that the communication between USB SND and ASoC is halted.
   108	 *
   109	 */
   110	void snd_soc_usb_free_port(struct snd_soc_usb *usb)
   111	{
   112		snd_soc_usb_remove_port(usb);
   113		kfree(usb);
   114	}
   115	EXPORT_SYMBOL_GPL(snd_soc_usb_free_port);
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

