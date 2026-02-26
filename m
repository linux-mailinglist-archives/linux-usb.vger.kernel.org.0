Return-Path: <linux-usb+bounces-33739-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HodM9E6oGmagwQAu9opvQ
	(envelope-from <linux-usb+bounces-33739-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 13:21:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B3F1A5A41
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 13:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B87A130A1556
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 12:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F8A27B50F;
	Thu, 26 Feb 2026 12:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C0wi8cOT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11AD26ED54;
	Thu, 26 Feb 2026 12:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772108490; cv=none; b=aTe1g8Pa9sXh8gCdBoteKyPwpaRjOkk7r4YFMLS3dTr/0jsfystq5ZPKi/Sx3iXc6FvYiAIZV15fHx3SvLKKkA/HguWJPQF0anno0V1crwcgaDpoB5+jRyDetwW9VTP8Erbx2QjBD9wKZ9Wr9hZ0z+vgGUGlqVlA+tbtrj3IjN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772108490; c=relaxed/simple;
	bh=i5M25Nccyjah1XpIcpzw1O2dO9WqswlU2avEP9f36zA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECToMgTdGW4/vy6RPSYXsDGIpO5gGtoVN73R6doP3VuRWJFFDgZ49B3/aavneDovluW143wn6eJMOQPMl7e2BFVowPBMEHC66Pjk8FQJSoJQwZqdZYAplsUqiHamtk8djyaKlwZDMb9QoSBBANmMGlZzMy6gQmh2Y11tYC4TqBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C0wi8cOT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772108488; x=1803644488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=i5M25Nccyjah1XpIcpzw1O2dO9WqswlU2avEP9f36zA=;
  b=C0wi8cOT9jIHoQZtiTILG098AGu9qbd6DsaVlRfxE70AGkORYym3I4vC
   MWPcgS+qqY47d8UY8OtWa4fsdtQ35TPfvRJkcheLABdHT2QrCj1oF7FHu
   gMcX+9RkUNbVbmCyimoSTA9zefjjLc2LR9zlrF2Ix07Rs/g01qlrD0A7G
   +oY3+Bvd+B9hwds1tfLJIOcrEzHU8dMGyaW8IJZHKUsb+Zu6fn7cvSleK
   /FnZSyreuMIs4ieVokKgArCUZvlgqppwpU4bhD9N2HhxrcapuSieGEHgv
   Gd2NfRcLn4Paao7cAj0lBCPHhA/A+EeqUEfl41itOX5rcRSsMj7w5OpRu
   Q==;
X-CSE-ConnectionGUID: YKp9bEs0TES58GKMqQ2bxg==
X-CSE-MsgGUID: fcCL0NCHTNqddhqoKDYiGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90748262"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="90748262"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 04:21:28 -0800
X-CSE-ConnectionGUID: ZallhUJVSwSmNfFNkWiOVg==
X-CSE-MsgGUID: X1ertGHrTBiRY+1Jv0sbHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="214105419"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Feb 2026 04:21:26 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvaMs-000000009LZ-1nZ6;
	Thu, 26 Feb 2026 12:21:22 +0000
Date: Thu, 26 Feb 2026 20:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Deng <dengjie03@kylinos.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jie Deng <dengjie03@kylinos.cn>
Subject: Re: [PATCH] usb: core: new quirk to handle devices with zero
 configurations
Message-ID: <202602262055.asAbiuP0-lkp@intel.com>
References: <20260226094737.1306471-1-dengjie03@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260226094737.1306471-1-dengjie03@kylinos.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33739-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: B5B3F1A5A41
X-Rspamd-Action: no action

Hi Jie,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v7.0-rc1 next-20260225]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Deng/usb-core-new-quirk-to-handle-devices-with-zero-configurations/20260226-180039
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260226094737.1306471-1-dengjie03%40kylinos.cn
patch subject: [PATCH] usb: core: new quirk to handle devices with zero configurations
config: parisc-randconfig-r072-20260226 (https://download.01.org/0day-ci/archive/20260226/202602262055.asAbiuP0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602262055.asAbiuP0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602262055.asAbiuP0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/usb/core/config.c: In function 'usb_get_configuration':
>> drivers/usb/core/config.c:931:18: warning: missing terminating " character
     931 |   dev_info(ddev, "Device claims zero configurations,
         |                  ^
   drivers/usb/core/config.c:932:19: warning: missing terminating " character
     932 |     forcing to 1\n");
         |                   ^
>> drivers/usb/core/config.c:1156: error: unterminated argument list invoking macro "dev_info"
    1156 | }
         | 
>> drivers/usb/core/config.c:931:3: error: 'dev_info' undeclared (first use in this function); did you mean '_dev_info'?
     931 |   dev_info(ddev, "Device claims zero configurations,
         |   ^~~~~~~~
         |   _dev_info
   drivers/usb/core/config.c:931:3: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/usb/core/config.c:931:11: error: expected ';' at end of input
     931 |   dev_info(ddev, "Device claims zero configurations,
         |           ^
         |           ;
   ......
    1156 | }
         |            
>> drivers/usb/core/config.c:931:3: error: expected declaration or statement at end of input
     931 |   dev_info(ddev, "Device claims zero configurations,
         |   ^~~~~~~~
>> drivers/usb/core/config.c:931:3: error: expected declaration or statement at end of input
>> drivers/usb/core/config.c:922:6: warning: unused variable 'result' [-Wunused-variable]
     922 |  int result;
         |      ^~~~~~
>> drivers/usb/core/config.c:921:32: warning: unused variable 'desc' [-Wunused-variable]
     921 |  struct usb_config_descriptor *desc;
         |                                ^~~~
>> drivers/usb/core/config.c:920:17: warning: unused variable 'bigbuffer' [-Wunused-variable]
     920 |  unsigned char *bigbuffer;
         |                 ^~~~~~~~~
>> drivers/usb/core/config.c:919:22: warning: unused variable 'length' [-Wunused-variable]
     919 |  unsigned int cfgno, length;
         |                      ^~~~~~
>> drivers/usb/core/config.c:919:15: warning: unused variable 'cfgno' [-Wunused-variable]
     919 |  unsigned int cfgno, length;
         |               ^~~~~
>> drivers/usb/core/config.c:1156: warning: control reaches end of non-void function [-Wreturn-type]
    1156 | }
         | 
   At top level:
>> drivers/usb/core/config.c:659:12: warning: 'usb_parse_configuration' defined but not used [-Wunused-function]
     659 | static int usb_parse_configuration(struct usb_device *dev, int cfgidx,
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/dev_info +1156 drivers/usb/core/config.c

81cf4a45360f70 Masakazu Mokuno  2017-11-10  1035  
3148bf041d169a Andiry Xu        2011-09-23  1036  /* Get BOS descriptor set */
3148bf041d169a Andiry Xu        2011-09-23  1037  int usb_get_bos_descriptor(struct usb_device *dev)
3148bf041d169a Andiry Xu        2011-09-23  1038  {
3148bf041d169a Andiry Xu        2011-09-23  1039  	struct device *ddev = &dev->dev;
3148bf041d169a Andiry Xu        2011-09-23  1040  	struct usb_bos_descriptor *bos;
3148bf041d169a Andiry Xu        2011-09-23  1041  	struct usb_dev_cap_header *cap;
81cf4a45360f70 Masakazu Mokuno  2017-11-10  1042  	struct usb_ssp_cap_descriptor *ssp_cap;
3dd550a2d36596 Alan Stern       2019-09-04  1043  	unsigned char *buffer, *buffer0;
81cf4a45360f70 Masakazu Mokuno  2017-11-10  1044  	int length, total_len, num, i, ssac;
81cf4a45360f70 Masakazu Mokuno  2017-11-10  1045  	__u8 cap_type;
3148bf041d169a Andiry Xu        2011-09-23  1046  	int ret;
3148bf041d169a Andiry Xu        2011-09-23  1047  
2740ac33c87b3d Johannes Brüderl 2025-12-07  1048  	if (dev->quirks & USB_QUIRK_NO_BOS) {
2740ac33c87b3d Johannes Brüderl 2025-12-07  1049  		dev_dbg(ddev, "skipping BOS descriptor\n");
2740ac33c87b3d Johannes Brüderl 2025-12-07  1050  		return -ENOMSG;
2740ac33c87b3d Johannes Brüderl 2025-12-07  1051  	}
2740ac33c87b3d Johannes Brüderl 2025-12-07  1052  
bf4afc53b77aea Linus Torvalds   2026-02-21  1053  	bos = kzalloc_obj(*bos);
3148bf041d169a Andiry Xu        2011-09-23  1054  	if (!bos)
3148bf041d169a Andiry Xu        2011-09-23  1055  		return -ENOMEM;
3148bf041d169a Andiry Xu        2011-09-23  1056  
3148bf041d169a Andiry Xu        2011-09-23  1057  	/* Get BOS descriptor */
3148bf041d169a Andiry Xu        2011-09-23  1058  	ret = usb_get_descriptor(dev, USB_DT_BOS, 0, bos, USB_DT_BOS_SIZE);
a03ff54460817c Alan Stern       2019-05-13  1059  	if (ret < USB_DT_BOS_SIZE || bos->bLength < USB_DT_BOS_SIZE) {
7a09c1269702db Alan Stern       2022-11-02  1060  		dev_notice(ddev, "unable to get BOS descriptor or descriptor too short\n");
3148bf041d169a Andiry Xu        2011-09-23  1061  		if (ret >= 0)
3148bf041d169a Andiry Xu        2011-09-23  1062  			ret = -ENOMSG;
3148bf041d169a Andiry Xu        2011-09-23  1063  		kfree(bos);
3148bf041d169a Andiry Xu        2011-09-23  1064  		return ret;
3148bf041d169a Andiry Xu        2011-09-23  1065  	}
3148bf041d169a Andiry Xu        2011-09-23  1066  
3148bf041d169a Andiry Xu        2011-09-23  1067  	length = bos->bLength;
3148bf041d169a Andiry Xu        2011-09-23  1068  	total_len = le16_to_cpu(bos->wTotalLength);
3148bf041d169a Andiry Xu        2011-09-23  1069  	num = bos->bNumDeviceCaps;
3148bf041d169a Andiry Xu        2011-09-23  1070  	kfree(bos);
3148bf041d169a Andiry Xu        2011-09-23  1071  	if (total_len < length)
3148bf041d169a Andiry Xu        2011-09-23  1072  		return -EINVAL;
3148bf041d169a Andiry Xu        2011-09-23  1073  
bf4afc53b77aea Linus Torvalds   2026-02-21  1074  	dev->bos = kzalloc_obj(*dev->bos);
3148bf041d169a Andiry Xu        2011-09-23  1075  	if (!dev->bos)
3148bf041d169a Andiry Xu        2011-09-23  1076  		return -ENOMEM;
3148bf041d169a Andiry Xu        2011-09-23  1077  
3148bf041d169a Andiry Xu        2011-09-23  1078  	/* Now let's get the whole BOS descriptor set */
3148bf041d169a Andiry Xu        2011-09-23  1079  	buffer = kzalloc(total_len, GFP_KERNEL);
3148bf041d169a Andiry Xu        2011-09-23  1080  	if (!buffer) {
3148bf041d169a Andiry Xu        2011-09-23  1081  		ret = -ENOMEM;
3148bf041d169a Andiry Xu        2011-09-23  1082  		goto err;
3148bf041d169a Andiry Xu        2011-09-23  1083  	}
3148bf041d169a Andiry Xu        2011-09-23  1084  	dev->bos->desc = (struct usb_bos_descriptor *)buffer;
3148bf041d169a Andiry Xu        2011-09-23  1085  
3148bf041d169a Andiry Xu        2011-09-23  1086  	ret = usb_get_descriptor(dev, USB_DT_BOS, 0, buffer, total_len);
3148bf041d169a Andiry Xu        2011-09-23  1087  	if (ret < total_len) {
7a09c1269702db Alan Stern       2022-11-02  1088  		dev_notice(ddev, "unable to get BOS descriptor set\n");
3148bf041d169a Andiry Xu        2011-09-23  1089  		if (ret >= 0)
3148bf041d169a Andiry Xu        2011-09-23  1090  			ret = -ENOMSG;
3148bf041d169a Andiry Xu        2011-09-23  1091  		goto err;
3148bf041d169a Andiry Xu        2011-09-23  1092  	}
3dd550a2d36596 Alan Stern       2019-09-04  1093  
3dd550a2d36596 Alan Stern       2019-09-04  1094  	buffer0 = buffer;
3148bf041d169a Andiry Xu        2011-09-23  1095  	total_len -= length;
3dd550a2d36596 Alan Stern       2019-09-04  1096  	buffer += length;
3148bf041d169a Andiry Xu        2011-09-23  1097  
3148bf041d169a Andiry Xu        2011-09-23  1098  	for (i = 0; i < num; i++) {
3148bf041d169a Andiry Xu        2011-09-23  1099  		cap = (struct usb_dev_cap_header *)buffer;
3148bf041d169a Andiry Xu        2011-09-23  1100  
1c0edc3633b560 Alan Stern       2017-10-18  1101  		if (total_len < sizeof(*cap) || total_len < cap->bLength) {
1c0edc3633b560 Alan Stern       2017-10-18  1102  			dev->bos->desc->bNumDeviceCaps = i;
3148bf041d169a Andiry Xu        2011-09-23  1103  			break;
1c0edc3633b560 Alan Stern       2017-10-18  1104  		}
81cf4a45360f70 Masakazu Mokuno  2017-11-10  1105  		cap_type = cap->bDevCapabilityType;
1c0edc3633b560 Alan Stern       2017-10-18  1106  		length = cap->bLength;
81cf4a45360f70 Masakazu Mokuno  2017-11-10  1107  		if (bos_desc_len[cap_type] && length < bos_desc_len[cap_type]) {
81cf4a45360f70 Masakazu Mokuno  2017-11-10  1108  			dev->bos->desc->bNumDeviceCaps = i;
81cf4a45360f70 Masakazu Mokuno  2017-11-10  1109  			break;
81cf4a45360f70 Masakazu Mokuno  2017-11-10  1110  		}
81cf4a45360f70 Masakazu Mokuno  2017-11-10  1111  
3148bf041d169a Andiry Xu        2011-09-23  1112  		if (cap->bDescriptorType != USB_DT_DEVICE_CAPABILITY) {
7a09c1269702db Alan Stern       2022-11-02  1113  			dev_notice(ddev, "descriptor type invalid, skip\n");
974bba5c118f4c Niklas Neronin   2023-11-15  1114  			goto skip_to_next_descriptor;
3148bf041d169a Andiry Xu        2011-09-23  1115  		}
3148bf041d169a Andiry Xu        2011-09-23  1116  
81cf4a45360f70 Masakazu Mokuno  2017-11-10  1117  		switch (cap_type) {
3148bf041d169a Andiry Xu        2011-09-23  1118  		case USB_CAP_TYPE_EXT:
3148bf041d169a Andiry Xu        2011-09-23  1119  			dev->bos->ext_cap =
3148bf041d169a Andiry Xu        2011-09-23  1120  				(struct usb_ext_cap_descriptor *)buffer;
3148bf041d169a Andiry Xu        2011-09-23  1121  			break;
3148bf041d169a Andiry Xu        2011-09-23  1122  		case USB_SS_CAP_TYPE:
3148bf041d169a Andiry Xu        2011-09-23  1123  			dev->bos->ss_cap =
3148bf041d169a Andiry Xu        2011-09-23  1124  				(struct usb_ss_cap_descriptor *)buffer;
3148bf041d169a Andiry Xu        2011-09-23  1125  			break;
3220befddc0da1 Mathias Nyman    2015-10-01  1126  		case USB_SSP_CAP_TYPE:
81cf4a45360f70 Masakazu Mokuno  2017-11-10  1127  			ssp_cap = (struct usb_ssp_cap_descriptor *)buffer;
81cf4a45360f70 Masakazu Mokuno  2017-11-10  1128  			ssac = (le32_to_cpu(ssp_cap->bmAttributes) &
07b9f12864d16c Mathias Nyman    2017-12-19  1129  				USB_SSP_SUBLINK_SPEED_ATTRIBS);
81cf4a45360f70 Masakazu Mokuno  2017-11-10  1130  			if (length >= USB_DT_USB_SSP_CAP_SIZE(ssac))
81cf4a45360f70 Masakazu Mokuno  2017-11-10  1131  				dev->bos->ssp_cap = ssp_cap;
3220befddc0da1 Mathias Nyman    2015-10-01  1132  			break;
3148bf041d169a Andiry Xu        2011-09-23  1133  		case CONTAINER_ID_TYPE:
3148bf041d169a Andiry Xu        2011-09-23  1134  			dev->bos->ss_id =
3148bf041d169a Andiry Xu        2011-09-23  1135  				(struct usb_ss_container_id_descriptor *)buffer;
3148bf041d169a Andiry Xu        2011-09-23  1136  			break;
faee822c5a7ab9 Mathias Nyman    2016-02-12  1137  		case USB_PTM_CAP_TYPE:
faee822c5a7ab9 Mathias Nyman    2016-02-12  1138  			dev->bos->ptm_cap =
faee822c5a7ab9 Mathias Nyman    2016-02-12  1139  				(struct usb_ptm_cap_descriptor *)buffer;
1d6903a617a221 Nick Desaulniers 2020-11-10  1140  			break;
3148bf041d169a Andiry Xu        2011-09-23  1141  		default:
3148bf041d169a Andiry Xu        2011-09-23  1142  			break;
3148bf041d169a Andiry Xu        2011-09-23  1143  		}
3dd550a2d36596 Alan Stern       2019-09-04  1144  
974bba5c118f4c Niklas Neronin   2023-11-15  1145  skip_to_next_descriptor:
3dd550a2d36596 Alan Stern       2019-09-04  1146  		total_len -= length;
3dd550a2d36596 Alan Stern       2019-09-04  1147  		buffer += length;
3148bf041d169a Andiry Xu        2011-09-23  1148  	}
3dd550a2d36596 Alan Stern       2019-09-04  1149  	dev->bos->desc->wTotalLength = cpu_to_le16(buffer - buffer0);
3148bf041d169a Andiry Xu        2011-09-23  1150  
3148bf041d169a Andiry Xu        2011-09-23  1151  	return 0;
3148bf041d169a Andiry Xu        2011-09-23  1152  
3148bf041d169a Andiry Xu        2011-09-23  1153  err:
3148bf041d169a Andiry Xu        2011-09-23  1154  	usb_release_bos_descriptor(dev);
3148bf041d169a Andiry Xu        2011-09-23  1155  	return ret;
3148bf041d169a Andiry Xu        2011-09-23 @1156  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

