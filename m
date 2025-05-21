Return-Path: <linux-usb+bounces-24204-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D62ABFEDF
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 23:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD59D4E53E6
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 21:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A442BD013;
	Wed, 21 May 2025 21:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Np33vsSC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1B21A5BAC
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 21:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747862721; cv=none; b=S76BZYOyKEDfatnIo9iKMjuReY6Ry5oPKVAJHHIuihFMzBATuHAr95p8hC0wKwTXeEvyZAkJGxCl/VZ7Wm+fu5UaSftAe6bR81BaZIABZ3vyNUiMhSEukn/DZwFlT1hMP37yTi72hhdg00IZAa0qVMYqLGBKC3ebKCUQoOpE4Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747862721; c=relaxed/simple;
	bh=RLgPL3wMwtzlutDaktiy95eJvNq6z3esuD7lMdi//os=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZEd50AixlOVi5Zp9iqBVTmw0bSZ9B6qKXTQjWJvP+zyhnWt4SrMwcyKONIunC0+JhPxvOIrMpACxw/A4tqHBYQuXUmREo0L66bOTHXtxOuI+l16r7fo1+VY0TfGl/c82UUiUQb8461jQPCkhyiCiGb8FLsuw3F7p3uxyHC8DKm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Np33vsSC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747862719; x=1779398719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RLgPL3wMwtzlutDaktiy95eJvNq6z3esuD7lMdi//os=;
  b=Np33vsSC8qPEMIo71EppIhfP11mFuZ8NkOVipxq254b59U+gclI2z264
   e9nEjreA5itv72nlczQrZqGKJW/1VmQo6KciDEaqpVlt4YslfOmkeN/Xt
   Qi+4qT4KffoIG2F11+PcOpoDZMog38ZRJbiTrvdtt5c1cEce17N6phBNb
   bhIKqL9UUf4IcvxveA0ExmjvxLA5wZ/MjrKtIyPWCAtFP3xUaJBnf/jep
   gavIRM8UTD6EA6C7oP1F96iVGpf5ABY++iT/izZL6kuINQwr1oyKAuSkX
   rgXJWce38wFsPkxopKB5C84VxU54eMl7UHrw38he1EHoKJTrhGeqt1k+x
   w==;
X-CSE-ConnectionGUID: goYYeEzARVupf46XJ2Rd3w==
X-CSE-MsgGUID: DggGWFfUSCu+nbtkz7pm1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="72383728"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="72383728"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 14:25:18 -0700
X-CSE-ConnectionGUID: vM1QqffQRDGiEPO505McQg==
X-CSE-MsgGUID: iK52d6t6Sk67CnFvKVOa2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="140158521"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 May 2025 14:25:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHqw6-000Oe4-1o;
	Wed, 21 May 2025 21:25:14 +0000
Date: Thu, 22 May 2025 05:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 49/52] sound/usb/qcom/qc_audio_offload.c:1019:
 warning: Function parameter or struct member 'xfer_buf_cpu' not described in
 'uaudio_transfer_buffer_setup'
Message-ID: <202505220522.rT5u07uk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   342e4955a1f1ce28c70a589999b76365082dbf10
commit: 5c7ef5001292d70d09d90bc2251f7d869b9d135c [49/52] ALSA: qc_audio_offload: avoid leaking xfer_buf allocation
config: sh-randconfig-001-20250522 (https://download.01.org/0day-ci/archive/20250522/202505220522.rT5u07uk-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505220522.rT5u07uk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220522.rT5u07uk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/usb/qcom/qc_audio_offload.c:1019: warning: Function parameter or struct member 'xfer_buf_cpu' not described in 'uaudio_transfer_buffer_setup'
>> sound/usb/qcom/qc_audio_offload.c:1019: warning: Excess function parameter 'xfer_buf' description in 'uaudio_transfer_buffer_setup'


vim +1019 sound/usb/qcom/qc_audio_offload.c

326bbc348298ab Wesley Cheng  2025-04-09  1003  
326bbc348298ab Wesley Cheng  2025-04-09  1004  /**
326bbc348298ab Wesley Cheng  2025-04-09  1005   * uaudio_transfer_buffer_setup() - fetch and populate xfer buffer params
326bbc348298ab Wesley Cheng  2025-04-09  1006   * @subs: usb substream
326bbc348298ab Wesley Cheng  2025-04-09  1007   * @xfer_buf: xfer buf to be allocated
326bbc348298ab Wesley Cheng  2025-04-09  1008   * @xfer_buf_len: size of allocation
326bbc348298ab Wesley Cheng  2025-04-09  1009   * @mem_info: QMI response info
326bbc348298ab Wesley Cheng  2025-04-09  1010   *
326bbc348298ab Wesley Cheng  2025-04-09  1011   * Allocates and maps the transfer buffers that will be utilized by the
326bbc348298ab Wesley Cheng  2025-04-09  1012   * audio DSP.  Will populate the information in the QMI response that is
326bbc348298ab Wesley Cheng  2025-04-09  1013   * sent back to the stream enable request.
326bbc348298ab Wesley Cheng  2025-04-09  1014   *
326bbc348298ab Wesley Cheng  2025-04-09  1015   */
326bbc348298ab Wesley Cheng  2025-04-09  1016  static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
5c7ef5001292d7 Arnd Bergmann 2025-05-13  1017  					void **xfer_buf_cpu, u32 xfer_buf_len,
326bbc348298ab Wesley Cheng  2025-04-09  1018  					struct mem_info_v01 *mem_info)
326bbc348298ab Wesley Cheng  2025-04-09 @1019  {
326bbc348298ab Wesley Cheng  2025-04-09  1020  	struct sg_table xfer_buf_sgt;
5c7ef5001292d7 Arnd Bergmann 2025-05-13  1021  	void *xfer_buf;
326bbc348298ab Wesley Cheng  2025-04-09  1022  	phys_addr_t xfer_buf_pa;
326bbc348298ab Wesley Cheng  2025-04-09  1023  	u32 len = xfer_buf_len;
326bbc348298ab Wesley Cheng  2025-04-09  1024  	bool dma_coherent;
485ae085925218 Arnd Bergmann 2025-05-13  1025  	unsigned long iova;
326bbc348298ab Wesley Cheng  2025-04-09  1026  	u32 remainder;
326bbc348298ab Wesley Cheng  2025-04-09  1027  	u32 mult;
326bbc348298ab Wesley Cheng  2025-04-09  1028  	int ret;
326bbc348298ab Wesley Cheng  2025-04-09  1029  
326bbc348298ab Wesley Cheng  2025-04-09  1030  	dma_coherent = dev_is_dma_coherent(subs->dev->bus->sysdev);
326bbc348298ab Wesley Cheng  2025-04-09  1031  
326bbc348298ab Wesley Cheng  2025-04-09  1032  	/* xfer buffer, multiple of 4K only */
326bbc348298ab Wesley Cheng  2025-04-09  1033  	if (!len)
326bbc348298ab Wesley Cheng  2025-04-09  1034  		len = PAGE_SIZE;
326bbc348298ab Wesley Cheng  2025-04-09  1035  
326bbc348298ab Wesley Cheng  2025-04-09  1036  	mult = len / PAGE_SIZE;
326bbc348298ab Wesley Cheng  2025-04-09  1037  	remainder = len % PAGE_SIZE;
326bbc348298ab Wesley Cheng  2025-04-09  1038  	len = mult * PAGE_SIZE;
326bbc348298ab Wesley Cheng  2025-04-09  1039  	len += remainder ? PAGE_SIZE : 0;
326bbc348298ab Wesley Cheng  2025-04-09  1040  
326bbc348298ab Wesley Cheng  2025-04-09  1041  	if (len > MAX_XFER_BUFF_LEN) {
326bbc348298ab Wesley Cheng  2025-04-09  1042  		dev_err(uaudio_qdev->data->dev,
326bbc348298ab Wesley Cheng  2025-04-09  1043  			"req buf len %d > max buf len %lu, setting %lu\n",
326bbc348298ab Wesley Cheng  2025-04-09  1044  			len, MAX_XFER_BUFF_LEN, MAX_XFER_BUFF_LEN);
326bbc348298ab Wesley Cheng  2025-04-09  1045  		len = MAX_XFER_BUFF_LEN;
326bbc348298ab Wesley Cheng  2025-04-09  1046  	}
326bbc348298ab Wesley Cheng  2025-04-09  1047  
326bbc348298ab Wesley Cheng  2025-04-09  1048  	xfer_buf = usb_alloc_coherent(subs->dev, len, GFP_KERNEL, &xfer_buf_pa);
326bbc348298ab Wesley Cheng  2025-04-09  1049  	if (!xfer_buf)
326bbc348298ab Wesley Cheng  2025-04-09  1050  		return -ENOMEM;
326bbc348298ab Wesley Cheng  2025-04-09  1051  
326bbc348298ab Wesley Cheng  2025-04-09  1052  	dma_get_sgtable(subs->dev->bus->sysdev, &xfer_buf_sgt, xfer_buf,
326bbc348298ab Wesley Cheng  2025-04-09  1053  			xfer_buf_pa, len);
485ae085925218 Arnd Bergmann 2025-05-13  1054  	iova = uaudio_iommu_map(MEM_XFER_BUF, dma_coherent, xfer_buf_pa, len,
326bbc348298ab Wesley Cheng  2025-04-09  1055  			      &xfer_buf_sgt);
485ae085925218 Arnd Bergmann 2025-05-13  1056  	if (!iova) {
326bbc348298ab Wesley Cheng  2025-04-09  1057  		ret = -ENOMEM;
326bbc348298ab Wesley Cheng  2025-04-09  1058  		goto unmap_sync;
326bbc348298ab Wesley Cheng  2025-04-09  1059  	}
326bbc348298ab Wesley Cheng  2025-04-09  1060  
485ae085925218 Arnd Bergmann 2025-05-13  1061  	mem_info->dma = xfer_buf_pa;
326bbc348298ab Wesley Cheng  2025-04-09  1062  	mem_info->size = len;
485ae085925218 Arnd Bergmann 2025-05-13  1063  	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
5c7ef5001292d7 Arnd Bergmann 2025-05-13  1064  	*xfer_buf_cpu = xfer_buf;
326bbc348298ab Wesley Cheng  2025-04-09  1065  	sg_free_table(&xfer_buf_sgt);
326bbc348298ab Wesley Cheng  2025-04-09  1066  
326bbc348298ab Wesley Cheng  2025-04-09  1067  	return 0;
326bbc348298ab Wesley Cheng  2025-04-09  1068  
326bbc348298ab Wesley Cheng  2025-04-09  1069  unmap_sync:
326bbc348298ab Wesley Cheng  2025-04-09  1070  	usb_free_coherent(subs->dev, len, xfer_buf, xfer_buf_pa);
326bbc348298ab Wesley Cheng  2025-04-09  1071  
326bbc348298ab Wesley Cheng  2025-04-09  1072  	return ret;
326bbc348298ab Wesley Cheng  2025-04-09  1073  }
326bbc348298ab Wesley Cheng  2025-04-09  1074  

:::::: The code at line 1019 was first introduced by commit
:::::: 326bbc348298ab0946c5560defe024a5f6ef28bb ALSA: usb-audio: qcom: Introduce QC USB SND offloading support

:::::: TO: Wesley Cheng <quic_wcheng@quicinc.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

