Return-Path: <linux-usb+bounces-20651-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 074DFA3639E
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 17:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D97E21896FE5
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 16:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69638267AF8;
	Fri, 14 Feb 2025 16:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8hx85k1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A678262816
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 16:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739551908; cv=none; b=fwbnpMXblhhAO3ZKXVGMuxIAmizkccv0QUlGjfVoJoMqiDoswkgdDQCy1FPeF1dMGF8Nazj/NH5jYsCaW09PKAFTJkLOF3DS+MPK7eQH3b3alQn0xRYsNnDC+bcetednVK+2/cwf9qG+i4ENtC0Bq7Gli01f5X2DvVDk2V1to/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739551908; c=relaxed/simple;
	bh=se5giKF39qmlM0pp4/lb4l6qsF3+igkVj1+kVYZK5LY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=USM9YKTUuY4h1bRavQgizS8mkiFTDUotB4H/5wP6sHXR0RWNbi48DlBznykZBf8cnWldLdac8rFF7F3aHG98cXMUhSi54qxDnz+TNZVKl8uNWoFmoZ9NuTlAUlE0AC5iAQKKdxGILQG9B0ac6f9EjAFBOypV3ZHNjFgof5sUUko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8hx85k1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739551906; x=1771087906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=se5giKF39qmlM0pp4/lb4l6qsF3+igkVj1+kVYZK5LY=;
  b=e8hx85k1DmLERObtlVUabouasaR70w4ePl6EqYzBGVo0ILOCxPHMQtkG
   VmmVW9h3WOvDTH6RwdU0udYc6Wwim0NYni2KaIPtStfUl+ZDmz7jiifuE
   j5hifteW2MjmW/6VvQPPxJ7SGiaHYdCKb/Qy8RcUuG6O6uTKFto23O7en
   1kmyMvKXSojGDKJH7azZH3flGkgRFAd7WITTGCujxwNrT0HGA+pnw0DD0
   sQFBtswBjawP04mS6ToHfj0OYnYQOYA7LJBiDY4i1JrOhrMq0WaBTfHjQ
   xqyn7b7EleBPxvpzQuhXhjqunR/n3bNY8L9MawCvMQJIXzhzFDJ9yMZYr
   A==;
X-CSE-ConnectionGUID: Xh5aKKFDRQip8daPoIp17A==
X-CSE-MsgGUID: dXSs0anHR02zVAj83LZTAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40427037"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40427037"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 08:51:46 -0800
X-CSE-ConnectionGUID: Ry2/CKZiT+CuQn4Ps+S0IQ==
X-CSE-MsgGUID: 4xFzUnBJQOe6itb6MJB5Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113370768"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Feb 2025 08:51:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiyuk-0019u8-0I;
	Fri, 14 Feb 2025 16:51:42 +0000
Date: Sat, 15 Feb 2025 00:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 49/52] sound/usb/qcom/qc_audio_offload.c:354:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202502150021.gfz6ZVqZ-lkp@intel.com>
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
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250215/202502150021.gfz6ZVqZ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150021.gfz6ZVqZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150021.gfz6ZVqZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/usb/qcom/qc_audio_offload.c:7:
   In file included from include/linux/dma-mapping.h:5:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> sound/usb/qcom/qc_audio_offload.c:354:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     354 |         if (atomic_read(&dev->in_use)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/qcom/qc_audio_offload.c:387:9: note: uninitialized use occurs here
     387 |         return ret;
         |                ^~~
   sound/usb/qcom/qc_audio_offload.c:354:2: note: remove the 'if' if its condition is always true
     354 |         if (atomic_read(&dev->in_use)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/qcom/qc_audio_offload.c:350:9: note: initialize the variable 'ret' to silence this warning
     350 |         int ret;
         |                ^
         |                 = 0
   sound/usb/qcom/qc_audio_offload.c:399:7: warning: variable 'found' set but not used [-Wunused-but-set-variable]
     399 |         bool found = false;
         |              ^
>> sound/usb/qcom/qc_audio_offload.c:1116:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1116 |         if (!ep) {
         |             ^~~
   sound/usb/qcom/qc_audio_offload.c:1163:9: note: uninitialized use occurs here
    1163 |         return ret;
         |                ^~~
   sound/usb/qcom/qc_audio_offload.c:1116:2: note: remove the 'if' if its condition is always false
    1116 |         if (!ep) {
         |         ^~~~~~~~~~
    1117 |                 dev_err(uaudio_qdev->data->dev, "data ep # %d context is null\n",
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1118 |                         subs->data_endpoint->ep_num);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1119 |                 goto exit;
         |                 ~~~~~~~~~~
    1120 |         }
         |         ~
   sound/usb/qcom/qc_audio_offload.c:1111:9: note: initialize the variable 'ret' to silence this warning
    1111 |         int ret;
         |                ^
         |                 = 0
   sound/usb/qcom/qc_audio_offload.c:1353:6: warning: variable 'xfer_buf_len' set but not used [-Wunused-but-set-variable]
    1353 |         u32 xfer_buf_len;
         |             ^
>> sound/usb/qcom/qc_audio_offload.c:1426:43: warning: variable 'xfer_buf' is uninitialized when used here [-Wuninitialized]
    1426 |         ret = uaudio_transfer_buffer_setup(subs, xfer_buf, req_msg->xfer_buff_size,
         |                                                  ^~~~~~~~
   sound/usb/qcom/qc_audio_offload.c:1356:14: note: initialize the variable 'xfer_buf' to silence this warning
    1356 |         u8 *xfer_buf;
         |                     ^
         |                      = NULL
   8 warnings generated.


vim +354 sound/usb/qcom/qc_audio_offload.c

   340	
   341	/*
   342	 * Sends QMI disconnect indication message, assumes chip->mutex and qdev_mutex
   343	 * lock held by caller.
   344	 */
   345	static int uaudio_send_disconnect_ind(struct snd_usb_audio *chip)
   346	{
   347		struct qmi_uaudio_stream_ind_msg_v01 disconnect_ind = {0};
   348		struct uaudio_qmi_svc *svc = uaudio_svc;
   349		struct uaudio_dev *dev;
   350		int ret;
   351	
   352		dev = &uadev[chip->card->number];
   353	
 > 354		if (atomic_read(&dev->in_use)) {
   355			mutex_unlock(&chip->mutex);
   356			mutex_unlock(&qdev_mutex);
   357			dev_dbg(uaudio_qdev->data->dev, "sending qmi indication suspend\n");
   358			disconnect_ind.dev_event = USB_QMI_DEV_DISCONNECT_V01;
   359			disconnect_ind.slot_id = dev->udev->slot_id;
   360			disconnect_ind.controller_num = dev->usb_core_id;
   361			disconnect_ind.controller_num_valid = 1;
   362			ret = qmi_send_indication(svc->uaudio_svc_hdl, &svc->client_sq,
   363						  QMI_UAUDIO_STREAM_IND_V01,
   364						  QMI_UAUDIO_STREAM_IND_MSG_V01_MAX_MSG_LEN,
   365						  qmi_uaudio_stream_ind_msg_v01_ei,
   366						  &disconnect_ind);
   367			if (ret < 0)
   368				dev_err(uaudio_qdev->data->dev,
   369					"qmi send failed with err: %d\n", ret);
   370	
   371			ret = wait_event_interruptible_timeout(dev->disconnect_wq,
   372					!atomic_read(&dev->in_use),
   373					msecs_to_jiffies(DEV_RELEASE_WAIT_TIMEOUT));
   374			if (!ret) {
   375				dev_err(uaudio_qdev->data->dev,
   376					"timeout while waiting for dev_release\n");
   377				atomic_set(&dev->in_use, 0);
   378			} else if (ret < 0) {
   379				dev_err(uaudio_qdev->data->dev,
   380					"failed with ret %d\n", ret);
   381					atomic_set(&dev->in_use, 0);
   382			}
   383			mutex_lock(&qdev_mutex);
   384			mutex_lock(&chip->mutex);
   385		}
   386	
   387		return ret;
   388	}
   389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

