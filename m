Return-Path: <linux-usb+bounces-18761-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 932079FB8F8
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 04:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14B151638FD
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 03:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D66145B24;
	Tue, 24 Dec 2024 03:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jqDAnSrV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B701A55
	for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 03:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735010605; cv=none; b=qtoDe9CgXG2qiCy00Me+wdvPKKFHU/XsatJcrSclbGuLgIW2iaHVwNu2fP9rx4cQOR358d+S9Vq4L2jU9NsmjbMrMTDwkeUMlqVVdo7LamsJNDLRs7AdLW1LmCPpKE5r0jKtww+Ny4HiOes0+g1wrQqUZWXh9bTQgOF+K6ogmCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735010605; c=relaxed/simple;
	bh=6nKl9Hlo5gjfcV9HkxdXHRIZSSmK1Vzx6Y9vqTPYbFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rXqCaHGwLX37gXOZVZ9PASchLhcrp7DfO8ooZcWnUw7OESITccLpJXUdrX6TTMvZiPaDCTwzFYbnnHCk9qQZuXOaJIAlXUksN1eovajBqhSWEplcczaihIQ9/S/2/OKowsA8UdaqI/IFtJbIHNv8l/E1eEHeM6y1UbfVbCFfvbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jqDAnSrV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735010602; x=1766546602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6nKl9Hlo5gjfcV9HkxdXHRIZSSmK1Vzx6Y9vqTPYbFw=;
  b=jqDAnSrViep1C1hkbU6vGsZDesw/zyYQex8vKKiE+ZafEWLzk5QI0Gye
   kxJNU+G/CLMO5Qdq0D1Ups6APjeAg1BJ22ffmfPM2ScZ6A/Qkw1lL7C0i
   m9Snqi7ykHd48qL5JLe2fMiGERY7sJW/2elbt9wUfbCFuyhWVhk1Nns6U
   pvfvZsUM2y/SlDChh3XSWvQKQyJ1Z8ttuiN7jR41nD9KflnEwcLaKNS5r
   xPwa2REsbBtFnWStk3BBpsrToy7Z7TgWJrHw5sVp7reUB/DqDoPARvgmP
   Z8NI3XHjFOkY16E6Ox7R5kIzMsZEE0/1tuXMhzrKbP0RM6RUaOD7KylUq
   A==;
X-CSE-ConnectionGUID: NcJHbBSsRrKfnoKsn2CGkg==
X-CSE-MsgGUID: u+NGMEnBTR2oqeOJNffdUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="60861814"
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="60861814"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 19:23:22 -0800
X-CSE-ConnectionGUID: 2Wr2KS48TmyCszA1Nyh0ZQ==
X-CSE-MsgGUID: 9R9aAfg/Ta+4MTpARXsnHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="104447161"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Dec 2024 19:23:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPvVt-0000mw-15;
	Tue, 24 Dec 2024 03:23:17 +0000
Date: Tue, 24 Dec 2024 11:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: Pavan Holla <pholla@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [usb:usb-testing 9/58] drivers/usb/typec/ucsi/cros_ec_ucsi.c:187:54:
 warning: passing argument 2 of 'cros_ucsi_async_control' makes integer from
 pointer without a cast
Message-ID: <202412241137.ld79A9Iq-lkp@intel.com>
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
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20241224/202412241137.ld79A9Iq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412241137.ld79A9Iq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412241137.ld79A9Iq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/typec/ucsi/cros_ec_ucsi.c: In function 'cros_ucsi_write_timeout':
>> drivers/usb/typec/ucsi/cros_ec_ucsi.c:187:54: warning: passing argument 2 of 'cros_ucsi_async_control' makes integer from pointer without a cast [-Wint-conversion]
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

