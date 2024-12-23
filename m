Return-Path: <linux-usb+bounces-18758-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5584D9FB7E6
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 00:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D9291884B4A
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 23:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D931CCEE0;
	Mon, 23 Dec 2024 23:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bz2Ws1JQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F7F3398E
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 23:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734996887; cv=none; b=OU2IqmzQ1f0Poq+L+aEes9FXt0XTMaJTm0BX6z02z1cg/0cbQoYgSCyzzWDrDVI5K1x+tTRNK4iuuiYtDl+JELDzenMXr+OalEKVC+LTGNs4LYUDrVQkw4j8RowXGekH7EWo2Bo9cgrGyvL1MMk7hyp23z/w2q/aBO+b++X5NdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734996887; c=relaxed/simple;
	bh=+0jixxcc3JTpt4Kg5KFB7KP2WW4k+M68cpA5CLLJoSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fXlSNz9rTv8zj0erqI3Zgj8tIrg2+bzRGeM4DYSPMQr8E4kc7XcEEEJtHn8rwuIs9Qb7SetSsn364SP1BwvCV2/tWCccASADr2ktmcHTo9c4yNRnjPAOAHwVOI3HqJ61fWjDOWZZkhMDMHbIVu+/gyAt8ukRhI7E0clfTVWHyiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bz2Ws1JQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734996885; x=1766532885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+0jixxcc3JTpt4Kg5KFB7KP2WW4k+M68cpA5CLLJoSs=;
  b=bz2Ws1JQfB4lSRYGlKBdz6AhbbTuAgH4Z0RR9lMZYtI31ctb2BGeaR/O
   uZVTJKaoqWUX/n6SAxMIml0GXqAaZTLCO5eLR0ZZ4ywcJMdJjmd18r65v
   T4rAqxInM5j2I1VL9x18wkp1mgibpYSbsSy57kHmCNjbIWxmgqoOmnBek
   aGgTmuvukM8xThrZy7d5TeEK2FkNQDf5dVKYcwXRaQVUxqqgLt92HjA1U
   agGxrGQiE60e1TRgzDU1fpgq0qV4tVrptADSm44PdZNZKqQmdKeSn6ic8
   mMUmkxoZyyHFAvxxOHOqdHbJ0t66DxzkkcxF7LggeqrnhpWSleP1o2mK9
   g==;
X-CSE-ConnectionGUID: ezBdDl3VTnOlaMCIkFH39w==
X-CSE-MsgGUID: GcwJZ2QURWeWfIJQmVA+pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="34740750"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="34740750"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 15:34:45 -0800
X-CSE-ConnectionGUID: SO+xm4xDR3KXb4xWF79ucA==
X-CSE-MsgGUID: oKqdQBGfTSGRnP4DVUOCIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="130183798"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Dec 2024 15:34:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPrwe-0000hD-2D;
	Mon, 23 Dec 2024 23:34:40 +0000
Date: Tue, 24 Dec 2024 07:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: Pavan Holla <pholla@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [usb:usb-testing 9/58] drivers/usb/typec/ucsi/cros_ec_ucsi.c:187:54:
 error: passing argument 2 of 'cros_ucsi_async_control' makes integer from
 pointer without a cast
Message-ID: <202412240743.tzTftk4H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   b1d7c2a8a364695a5dca2bb18ebcf2c10ad61172
commit: 475db78842851d9efd7888154a80af697946de1e [9/58] usb: typec: ucsi: Implement ChromeOS UCSI driver
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20241224/202412240743.tzTftk4H-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240743.tzTftk4H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240743.tzTftk4H-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/typec/ucsi/cros_ec_ucsi.c: In function 'cros_ucsi_write_timeout':
>> drivers/usb/typec/ucsi/cros_ec_ucsi.c:187:54: error: passing argument 2 of 'cros_ucsi_async_control' makes integer from pointer without a cast [-Wint-conversion]
     187 |                 cros_ucsi_async_control(udata->ucsi, &cmd);
         |                                                      ^~~~
         |                                                      |
         |                                                      u64 * {aka long long unsigned int *}
   drivers/usb/typec/ucsi/cros_ec_ucsi.c:90:59: note: expected 'u64' {aka 'long long unsigned int'} but argument is of type 'u64 *' {aka 'long long unsigned int *'}
      90 | static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
         |                                                       ~~~~^~~


vim +/cros_ucsi_async_control +187 drivers/usb/typec/ucsi/cros_ec_ucsi.c

   154	
   155	static void cros_ucsi_write_timeout(struct work_struct *work)
   156	{
   157		struct cros_ucsi_data *udata =
   158			container_of(work, struct cros_ucsi_data, write_tmo.work);
   159		u32 cci;
   160		u64 cmd;
   161	
   162		if (cros_ucsi_read(udata->ucsi, UCSI_CCI, &cci, sizeof(cci))) {
   163			dev_err(udata->dev,
   164				"Reading CCI failed; no write timeout recovery possible.");
   165			return;
   166		}
   167	
   168		if (cci & UCSI_CCI_BUSY) {
   169			udata->tmo_counter++;
   170	
   171			if (udata->tmo_counter <= WRITE_TMO_CTR_MAX)
   172				schedule_delayed_work(&udata->write_tmo,
   173						      msecs_to_jiffies(WRITE_TMO_MS));
   174			else
   175				dev_err(udata->dev,
   176					"PPM unresponsive - too many write timeouts.");
   177	
   178			return;
   179		}
   180	
   181		/* No longer busy means we can reset our timeout counter. */
   182		udata->tmo_counter = 0;
   183	
   184		/* Need to ack previous command which may have timed out. */
   185		if (cci & UCSI_CCI_COMMAND_COMPLETE) {
   186			cmd = UCSI_ACK_CC_CI | UCSI_ACK_COMMAND_COMPLETE;
 > 187			cros_ucsi_async_control(udata->ucsi, &cmd);
   188	
   189			/* Check again after a few seconds that the system has
   190			 * recovered to make sure our async write above was successful.
   191			 */
   192			schedule_delayed_work(&udata->write_tmo,
   193					      msecs_to_jiffies(WRITE_TMO_MS));
   194			return;
   195		}
   196	
   197		/* We recovered from a previous timeout. Treat this as a recovery from
   198		 * suspend and call resume.
   199		 */
   200		ucsi_resume(udata->ucsi);
   201	}
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

