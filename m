Return-Path: <linux-usb+bounces-23017-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDAFA873AE
	for <lists+linux-usb@lfdr.de>; Sun, 13 Apr 2025 21:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB3FD3ACF7B
	for <lists+linux-usb@lfdr.de>; Sun, 13 Apr 2025 19:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF4D1917E7;
	Sun, 13 Apr 2025 19:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvTCgHah"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6830EEBB
	for <linux-usb@vger.kernel.org>; Sun, 13 Apr 2025 19:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744573616; cv=none; b=e5wlan1mfBhxJR7wvmyuiKxM5/rPN3fo+JgO/1RfPx2bZifkpEw8stzV+SbcMH/F5prWpPj668oM0/f5+ih0XgfwnVAMJ+MQlurRf+HaQAowPPoAovTLfjSnJLP0DlbxFnrKCIvMX9URUVxyL2c5w0pbmRxzwsn5bXc1b+rc0Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744573616; c=relaxed/simple;
	bh=KTtuztZAQhh79cVUGxx+F+f5NU8a5R50pdz0FYt7zjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ja2DYk2eo4eVt1OpX+ZGyKnK1odlKfs79UU5Df4w9VXzi+Rtoyi7UaRw+nk2PvBa9Ms7gYtwtvRXRgSliJMkKS9t8I0QZ8nS1YryMdAZCMnjOgZhdZftmwgCWbKyNBFPy9glmqYPzvmLeTS4W3/pFT+L8uPYw6vNTBcYYZ7uO2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvTCgHah; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744573612; x=1776109612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KTtuztZAQhh79cVUGxx+F+f5NU8a5R50pdz0FYt7zjw=;
  b=dvTCgHah0OEawPA0qyfsAoX8qpPGxEoZ/EhOxQ4wU1h9V+1UPETJkgMb
   +OP9qZLqQIbjAgGYPj5U1LgFeOlv5AvISAHWqjTWPvOidTCUbYTKKn2Ms
   NfhoZLerfDDXrtcADOzZivO5Bh7goa8XNDQgP+jWjnt6Iq7ckPdo9OZHP
   MHL3IgRmzt8NV1aIysAJPn9HhPUooLqMLUbuLMYgPvW3Xr5JWxGgqJlsT
   kxhgfHYNNix358t+2KWrKSdm0CEFfRqnLWZ19XJt9mdzPMGjW5RgF+a2B
   JDN01Q/2TLDVlrTFhWCQJJbIIcuQCb/Abj6VQeXjUsvoJJ/4ofea+p062
   Q==;
X-CSE-ConnectionGUID: W3JaMyeuRDaS1vLuoKOOqg==
X-CSE-MsgGUID: oaGpjpcWQfCuUCul36m5Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46178337"
X-IronPort-AV: E=Sophos;i="6.15,210,1739865600"; 
   d="scan'208";a="46178337"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 12:46:52 -0700
X-CSE-ConnectionGUID: KMzm6vRgTFyQoGTxKu0Tnw==
X-CSE-MsgGUID: +X+KW+MkQDSNel6X2VILnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,210,1739865600"; 
   d="scan'208";a="129494974"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Apr 2025 12:46:50 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u43I0-000Cqy-1Q;
	Sun, 13 Apr 2025 19:46:48 +0000
Date: Mon, 14 Apr 2025 03:46:38 +0800
From: kernel test robot <lkp@intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [usb:usb-next 32/68] kismet: WARNING: unmet direct dependencies
 detected for DRM_AUX_HPD_BRIDGE when selected by UCSI_HUAWEI_GAOKUN
Message-ID: <202504140319.dgpbDOJZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   1692632146451184c4bcb68554098470a119fb01
commit: 00327d7f2c8c512c9b168daae02c8b989f79ec71 [32/68] usb: typec: ucsi: add Huawei Matebook E Go ucsi driver
config: arc-kismet-CONFIG_DRM_AUX_HPD_BRIDGE-CONFIG_UCSI_HUAWEI_GAOKUN-0-0 (https://download.01.org/0day-ci/archive/20250414/202504140319.dgpbDOJZ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250414/202504140319.dgpbDOJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504140319.dgpbDOJZ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE when selected by UCSI_HUAWEI_GAOKUN
   WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && DRM_BRIDGE [=n] && OF [=y]
     Selected by [y]:
     - UCSI_HUAWEI_GAOKUN [=y] && USB_SUPPORT [=y] && TYPEC [=y] && TYPEC_UCSI [=y] && EC_HUAWEI_GAOKUN [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

