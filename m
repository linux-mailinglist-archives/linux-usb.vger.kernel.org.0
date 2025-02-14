Return-Path: <linux-usb+bounces-20647-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BB1A362E1
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 17:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70E103AC2D3
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 16:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD62C267720;
	Fri, 14 Feb 2025 16:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5v5LMV3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0A02676E8
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 16:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739549983; cv=none; b=Ib4rNBehuQhbs5AcOddvCE8v1YyfE5tnYCiZcAXiHMsHQqyaoYu96FGHa4bHCTsCC3rienBADu0Xx+XMuIO/zRLcwxskE7G9I2anYbJO7my+Og/6YYk1RBo5NgGfYz3OHtWlbNYMZCa628dIrjrRqQJN4giXoGeG/OqsZRQxdgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739549983; c=relaxed/simple;
	bh=Xe7LvqE8+DV9PEVJhCk7DdqNB1JkpPTa+LLknl00aXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=keD7osRb9n2LUQOmNCOyvaZ38ON3SOXheuJToduR1lTToMF6XQrb81nm50CHZPwFln1Qu7w30EZNGp6Crtg43tXfUTSPAirY8P9dVKT6iChMhcLdGGdd3euCmDf64tO+MCxxKmORdmbA5BxsDqKGMgZBeNptjaqk2hkJ6ep24mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5v5LMV3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739549982; x=1771085982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xe7LvqE8+DV9PEVJhCk7DdqNB1JkpPTa+LLknl00aXE=;
  b=K5v5LMV3P8XMWbsDTVlUsIth1OzTL10/tzP+rWJkuZBBTarb+uakcDuy
   UrDdu9FKEQdEJE0+Yu8AO4wrOjGRKqPa1grW5Aalluqlt0gm0w0l6vR0v
   QQuEw/bZWo3FqJLnGvDwcOVIrFisxUQjHkjwaEiegboxYs9pP7xOmg8VS
   JBMT3H8g8CduLyiSYyrmFJZwgadEjQ3EibSfi6H+nG+0uqFXwmecN+FRn
   EWzXm/cTog60Oo5G9X/+5proVFLmCzQ2JZQDT3l52wNNYYhv1lYux8hsw
   NYiRZ/lOgJbY856Dd7b22BXlLLLsSn2kO48ZkRyEJHXFvIUAhdXY04VjN
   w==;
X-CSE-ConnectionGUID: 2xeEtnPERIu6+gsE5kVqKw==
X-CSE-MsgGUID: GDN+IsK2RYKBBnC24gj2oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40011632"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="40011632"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 08:19:42 -0800
X-CSE-ConnectionGUID: MzF7jRY5Qg2EZ1dekPTAQg==
X-CSE-MsgGUID: P7zZH0mLQeS1XBNf7R2kKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136727307"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Feb 2025 08:19:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiyPh-0019r1-1T;
	Fri, 14 Feb 2025 16:19:37 +0000
Date: Sat, 15 Feb 2025 00:19:34 +0800
From: kernel test robot <lkp@intel.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 49/52] sound/usb/qcom/qc_audio_offload.c:399:14:
 warning: variable 'found' set but not used
Message-ID: <202502150035.0SvyRRJn-lkp@intel.com>
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
commit: 2974d256f0b76fda676b8c7f7ddee2752bbcac7b [49/52] ALSA: usb-audio: qcom: Introduce QC USB SND offloading support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250215/202502150035.0SvyRRJn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150035.0SvyRRJn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150035.0SvyRRJn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/usb/qcom/qc_audio_offload.c: In function 'uaudio_get_iova':
>> sound/usb/qcom/qc_audio_offload.c:399:14: warning: variable 'found' set but not used [-Wunused-but-set-variable]
     399 |         bool found = false;
         |              ^~~~~
   sound/usb/qcom/qc_audio_offload.c: In function 'prepare_qmi_response':
>> sound/usb/qcom/qc_audio_offload.c:1353:13: warning: variable 'xfer_buf_len' set but not used [-Wunused-but-set-variable]
    1353 |         u32 xfer_buf_len;
         |             ^~~~~~~~~~~~


vim +/found +399 sound/usb/qcom/qc_audio_offload.c

   389	
   390	/* Offloading IOMMU management */
   391	static unsigned long uaudio_get_iova(unsigned long *curr_iova,
   392					     size_t *curr_iova_size,
   393					     struct list_head *head, size_t size)
   394	{
   395		struct iova_info *info, *new_info = NULL;
   396		struct list_head *curr_head;
   397		size_t tmp_size = size;
   398		unsigned long va = 0;
 > 399		bool found = false;
   400	
   401		if (size % PAGE_SIZE)
   402			goto done;
   403	
   404		if (size > *curr_iova_size)
   405			goto done;
   406	
   407		if (*curr_iova_size == 0)
   408			goto done;
   409	
   410		list_for_each_entry(info, head, list) {
   411			/* exact size iova_info */
   412			if (!info->in_use && info->size == size) {
   413				info->in_use = true;
   414				va = info->start_iova;
   415				*curr_iova_size -= size;
   416				found = true;
   417				goto done;
   418			} else if (!info->in_use && tmp_size >= info->size) {
   419				if (!new_info)
   420					new_info = info;
   421				tmp_size -= info->size;
   422				if (tmp_size)
   423					continue;
   424	
   425				va = new_info->start_iova;
   426				for (curr_head = &new_info->list; curr_head !=
   427				&info->list; curr_head = curr_head->next) {
   428					new_info = list_entry(curr_head, struct
   429							iova_info, list);
   430					new_info->in_use = true;
   431				}
   432				info->in_use = true;
   433				*curr_iova_size -= size;
   434				found = true;
   435				goto done;
   436			} else {
   437				/* iova region in use */
   438				new_info = NULL;
   439				tmp_size = size;
   440			}
   441		}
   442	
   443		info = kzalloc(sizeof(*info), GFP_KERNEL);
   444		if (!info) {
   445			va = 0;
   446			goto done;
   447		}
   448	
   449		va = *curr_iova;
   450		info->start_iova = *curr_iova;
   451		info->size = size;
   452		info->in_use = true;
   453		*curr_iova += size;
   454		*curr_iova_size -= size;
   455		found = true;
   456		list_add_tail(&info->list, head);
   457	
   458	done:
   459		return va;
   460	}
   461	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

