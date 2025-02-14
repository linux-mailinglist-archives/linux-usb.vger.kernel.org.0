Return-Path: <linux-usb+bounces-20652-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D545BA36425
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 18:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8241A170661
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 17:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82D2267B6C;
	Fri, 14 Feb 2025 17:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXOn4nU+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562D4267706
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 17:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739553171; cv=none; b=lE7B+HO0oOsmS7fO7vcZ3myX2hr9QZbEF0jiHUindSGSwAU3b/uYHg6hAWPxKXG4QHNWGTUAehkFpFiUWw0Nl1LcGTBqDoasiVW5lR5yjl7VP84biFSfMpsZXNEc6k8C3sUEW1nU0Xn2xGgwu/kmjd7hLw5EGqyWNeqWke7zHPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739553171; c=relaxed/simple;
	bh=apLxPLAPdVeQJ91NBJ4C2NRkkPnaRGf9LoeQZxiVaCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TcOlGB1DuprSgRxZurotZi+V+OYLTCrGiC86ViFy6fun3sssYRmoLGY0g2EBg6RoR2J2m688PlKiP4junynsUDOvW9cH5GPlT4XYSgs2zhrVNIWvuVVoqhwJWekGJGbExRaFJF23vzatQzWWlbJN4Xuwy2PQfeZ7BITPyvKhgWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXOn4nU+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739553169; x=1771089169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=apLxPLAPdVeQJ91NBJ4C2NRkkPnaRGf9LoeQZxiVaCw=;
  b=DXOn4nU+7roYJ/BzjfI/ep11Ij7Dv+Z7w7BVLMpMgZvexPOfmuEWB4KI
   kOLqpKoc4bhuUViR3hzGjA5HSspm2OQFY2BgYesnRc/1BL5KyBvZ26h3O
   o1VpPuss+ZkF93GFEDjyZ6FOtNd9PW1en17uwvvHGgTPNs2/ecDIK18mR
   fnzjpuf+SMAGU5UPjUS+lMQ1IkkFiScGIqCA8/67xYRdmzBtdcZ9oM5Bq
   MlqS7wEV8HjV5h7MU2apAiWCIQO30AEqOnjueioogRh7IAEe8CtmyDGSv
   8SVU+NEcxtfeh6ML3jWAzpuPjUeNmWTZu5KCsIEzftUXSmODxjMp1CPFQ
   w==;
X-CSE-ConnectionGUID: PCmh3UGWSv6+qkLNgEj4fg==
X-CSE-MsgGUID: 8LQ3obZTR3minMcWMnLcNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39494587"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="39494587"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 09:12:49 -0800
X-CSE-ConnectionGUID: pvLlhd+WRImDNKuqj48vMg==
X-CSE-MsgGUID: ZjDyNh7pQEOjWNQxpokZJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113374756"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Feb 2025 09:12:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tizF6-0019vT-2C;
	Fri, 14 Feb 2025 17:12:44 +0000
Date: Sat, 15 Feb 2025 01:12:10 +0800
From: kernel test robot <lkp@intel.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 51/52] sound/usb/qcom/mixer_usb_offload.c:131:70:
 warning: 'USB Offload Playback Card Ro...' directive writing 36 bytes into a
 region of size 34
Message-ID: <202502150150.d6QBeC0r-lkp@intel.com>
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
commit: b8a7c987d82f97c4a9929a395923e5a2242cdaf5 [51/52] ALSA: usb-audio: qcom: Add USB offload route kcontrol
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250215/202502150150.d6QBeC0r-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150150.d6QBeC0r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150150.d6QBeC0r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/usb/qcom/mixer_usb_offload.c: In function 'snd_usb_offload_create_ctl':
>> sound/usb/qcom/mixer_usb_offload.c:131:70: warning: 'USB Offload Playback Card Ro...' directive writing 36 bytes into a region of size 34 [-Wformat-overflow=]
     131 |                 sprintf(ctl_name, "USB Offload Playback Card Route PCM#%d",
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   sound/usb/qcom/mixer_usb_offload.c:131:17: note: 'sprintf' output between 38 and 48 bytes into a destination of size 34
     131 |                 sprintf(ctl_name, "USB Offload Playback Card Route PCM#%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     132 |                         as->pcm_index);
         |                         ~~~~~~~~~~~~~~
>> sound/usb/qcom/mixer_usb_offload.c:147:70: warning: 'USB Offload Playback PCM Rou...' directive writing 35 bytes into a region of size 34 [-Wformat-overflow=]
     147 |                 sprintf(ctl_name, "USB Offload Playback PCM Route PCM#%d",
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   sound/usb/qcom/mixer_usb_offload.c:147:17: note: 'sprintf' output between 37 and 47 bytes into a destination of size 34
     147 |                 sprintf(ctl_name, "USB Offload Playback PCM Route PCM#%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     148 |                         as->pcm_index);
         |                         ~~~~~~~~~~~~~~


vim +131 sound/usb/qcom/mixer_usb_offload.c

   100	
   101	/**
   102	 * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
   103	 * @chip: USB SND chip device
   104	 *
   105	 * Creates a sound control for a USB audio device, so that applications can
   106	 * query for if there is an available USB audio offload path, and which
   107	 * card is managing it.
   108	 */
   109	int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
   110	{
   111		struct usb_device *udev = chip->dev;
   112		struct snd_kcontrol_new *chip_kctl;
   113		struct snd_usb_substream *subs;
   114		struct snd_usb_stream *as;
   115		char ctl_name[34];
   116		int ret;
   117	
   118		list_for_each_entry(as, &chip->pcm_list, list) {
   119			subs = &as->substream[SNDRV_PCM_STREAM_PLAYBACK];
   120			if (!subs->ep_num || as->pcm_index > 0xff)
   121				continue;
   122	
   123			chip_kctl = &snd_usb_offload_mapped_card_ctl;
   124			chip_kctl->count = 1;
   125			/*
   126			 * Store the associated USB SND card number and PCM index for
   127			 * the kctl.
   128			 */
   129			chip_kctl->private_value = as->pcm_index |
   130						  chip->card->number << 16;
 > 131			sprintf(ctl_name, "USB Offload Playback Card Route PCM#%d",
   132				as->pcm_index);
   133			chip_kctl->name = ctl_name;
   134			ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
   135					  udev->bus->sysdev));
   136			if (ret < 0)
   137				break;
   138	
   139			chip_kctl = &snd_usb_offload_mapped_pcm_ctl;
   140			chip_kctl->count = 1;
   141			/*
   142			 * Store the associated USB SND card number and PCM index for
   143			 * the kctl.
   144			 */
   145			chip_kctl->private_value = as->pcm_index |
   146						  chip->card->number << 16;
 > 147			sprintf(ctl_name, "USB Offload Playback PCM Route PCM#%d",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

