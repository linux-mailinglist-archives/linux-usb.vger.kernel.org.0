Return-Path: <linux-usb+bounces-18967-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB8CA01322
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 08:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A64D3A4182
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 07:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C23156C76;
	Sat,  4 Jan 2025 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K32Ir9hS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1617514F108
	for <linux-usb@vger.kernel.org>; Sat,  4 Jan 2025 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735977380; cv=none; b=u+tdeYGA4jiMyKW4dZzLZCDKR/9el1/oKLFD+c5+jp/Xzwzk8HR8Q5uM6gDdLsqU4I6Thzy4jqqkSR5Bn1K2VKXaTb0eNw1qr+9rPOtfjNn0Aa5CbTHqp4MmQRoo06cD8Qd635prtILPKoQfnvQzTt6DBX7vX+7d99rkkFnbp1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735977380; c=relaxed/simple;
	bh=eitlF0V5MzgfpdPVpODDPtWfRCkJWDd9K0/Xr/l1H14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWsQdFa3bSNjsAiwRABTWqZ0XoOFkRu9xrqiZe+6IL33t/ks1OZG0+RMsp5zAuz+2C4Lo8Fxjr3q62a0zOdJ49K5Z31ahO+SOAj/lm9uq/oeTakFbNR0EqeuPdfewyHCu6FS/dBEXXRS9FKlBfSEkSE+zTrKrASTbttMSKMJ/ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K32Ir9hS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735977378; x=1767513378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eitlF0V5MzgfpdPVpODDPtWfRCkJWDd9K0/Xr/l1H14=;
  b=K32Ir9hSSG6zvWR0Ifnbst1CdLT2wNsznE31jnX88UJn6qZU3YnGqlKN
   pcpZ3ZR62+qYXyQ1Q6gw3EzvclmJUeuTWZr741Hm8kdipdGg1Ktw8O+ut
   Dt5ZQ/3ccWAJChkMp8DCoc4iqdcUeu19T2Lc48raJrmAG1DAOy8nJijJf
   Iov8YZoadh+O8t1IG8MMBYXqrTKyZYgfXWJWbMLa4nvqaApqg3N6Utg3n
   a0DHTYo5bdYWLIuFI4t77GgWoWS5sVdjXPa0oy3kpLDh/yB77dF3JF0FT
   0t4hOVh2sVDaI0J9pgcJ4vKNihhW+fV5uEksBIs/JIgdhiVycVS5w9Aky
   g==;
X-CSE-ConnectionGUID: ZFPrnY5kQhek4F58ceUDHw==
X-CSE-MsgGUID: UycWiFtwSjmILq4H8VW0cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="35448218"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="35448218"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 23:56:17 -0800
X-CSE-ConnectionGUID: lPO+VxSaTCaqkVfGmM5YKw==
X-CSE-MsgGUID: HzmQEjKTQhah8TdJVtiVvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="101767223"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jan 2025 23:56:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTz12-000Akl-0t;
	Sat, 04 Jan 2025 07:56:12 +0000
Date: Sat, 4 Jan 2025 15:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: Gwendal Grignou <gwendal@chromium.org>, ukaszb@chromium.org
Cc: oe-kbuild-all@lists.linux.dev, abhishekpandit@chromium.org,
	bleung@chromium.org, chrome-platform@lists.linux.dev,
	dmitry.baryshkov@linaro.org, gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com, jthies@google.com,
	linux-usb@vger.kernel.org, pholla@chromium.org, tzungbi@kernel.org,
	Gwendal Grignou <gwendal@chromium.org>
Subject: Re: [PATCH] driver/platform/chrome: Update cros_ec_trace with new
 USCI commands
Message-ID: <202501041541.ZbA4mnNs-lkp@intel.com>
References: <20250103233407.4001046-1-gwendal@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103233407.4001046-1-gwendal@chromium.org>

Hi Gwendal,

kernel test robot noticed the following build errors:

[auto build test ERROR on chrome-platform/for-next]
[also build test ERROR on linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gwendal-Grignou/driver-platform-chrome-Update-cros_ec_trace-with-new-USCI-commands/20250104-073614
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
patch link:    https://lore.kernel.org/r/20250103233407.4001046-1-gwendal%40chromium.org
patch subject: [PATCH] driver/platform/chrome: Update cros_ec_trace with new USCI commands
config: i386-buildonly-randconfig-002-20250104 (https://download.01.org/0day-ci/archive/20250104/202501041541.ZbA4mnNs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041541.ZbA4mnNs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041541.ZbA4mnNs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:113,
                    from drivers/platform/chrome/cros_ec_trace.h:83,
                    from drivers/platform/chrome/cros_ec_trace.c:217:
   drivers/platform/chrome/./cros_ec_trace.h: In function 'trace_raw_output_cros_ec_request_start':
>> drivers/platform/chrome/cros_ec_trace.c:169:22: error: 'EC_CMD_UCSI_PPM_SET' undeclared (first use in this function); did you mean 'EC_CMD_GPIO_SET'?
     169 |         TRACE_SYMBOL(EC_CMD_UCSI_PPM_SET), \
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:21:1: note: in expansion of macro 'TRACE_EVENT'
      21 | TRACE_EVENT(cros_ec_request_start,
         | ^~~~~~~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:38:9: note: in expansion of macro 'TP_printk'
      38 |         TP_printk("version: %u, offset: %d, command: %s, outsize: %u, insize: %u",
         |         ^~~~~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:40:19: note: in expansion of macro '__print_symbolic'
      40 |                   __print_symbolic(__entry->command, EC_CMDS),
         |                   ^~~~~~~~~~~~~~~~
   drivers/platform/chrome/cros_ec_trace.c:169:9: note: in expansion of macro 'TRACE_SYMBOL'
     169 |         TRACE_SYMBOL(EC_CMD_UCSI_PPM_SET), \
         |         ^~~~~~~~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:40:54: note: in expansion of macro 'EC_CMDS'
      40 |                   __print_symbolic(__entry->command, EC_CMDS),
         |                                                      ^~~~~~~
   drivers/platform/chrome/cros_ec_trace.c:169:22: note: each undeclared identifier is reported only once for each function it appears in
     169 |         TRACE_SYMBOL(EC_CMD_UCSI_PPM_SET), \
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:21:1: note: in expansion of macro 'TRACE_EVENT'
      21 | TRACE_EVENT(cros_ec_request_start,
         | ^~~~~~~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:38:9: note: in expansion of macro 'TP_printk'
      38 |         TP_printk("version: %u, offset: %d, command: %s, outsize: %u, insize: %u",
         |         ^~~~~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:40:19: note: in expansion of macro '__print_symbolic'
      40 |                   __print_symbolic(__entry->command, EC_CMDS),
         |                   ^~~~~~~~~~~~~~~~
   drivers/platform/chrome/cros_ec_trace.c:169:9: note: in expansion of macro 'TRACE_SYMBOL'
     169 |         TRACE_SYMBOL(EC_CMD_UCSI_PPM_SET), \
         |         ^~~~~~~~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:40:54: note: in expansion of macro 'EC_CMDS'
      40 |                   __print_symbolic(__entry->command, EC_CMDS),
         |                                                      ^~~~~~~
>> drivers/platform/chrome/cros_ec_trace.c:170:22: error: 'EC_CMD_UCSI_PPM_GET' undeclared (first use in this function); did you mean 'EC_CMD_GPIO_GET'?
     170 |         TRACE_SYMBOL(EC_CMD_UCSI_PPM_GET), \
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:21:1: note: in expansion of macro 'TRACE_EVENT'
      21 | TRACE_EVENT(cros_ec_request_start,
         | ^~~~~~~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:38:9: note: in expansion of macro 'TP_printk'
      38 |         TP_printk("version: %u, offset: %d, command: %s, outsize: %u, insize: %u",
         |         ^~~~~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:40:19: note: in expansion of macro '__print_symbolic'
      40 |                   __print_symbolic(__entry->command, EC_CMDS),
         |                   ^~~~~~~~~~~~~~~~
   drivers/platform/chrome/cros_ec_trace.c:170:9: note: in expansion of macro 'TRACE_SYMBOL'
     170 |         TRACE_SYMBOL(EC_CMD_UCSI_PPM_GET), \
         |         ^~~~~~~~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:40:54: note: in expansion of macro 'EC_CMDS'
      40 |                   __print_symbolic(__entry->command, EC_CMDS),
         |                                                      ^~~~~~~
   drivers/platform/chrome/./cros_ec_trace.h: In function 'trace_raw_output_cros_ec_request_done':
>> drivers/platform/chrome/cros_ec_trace.c:169:22: error: 'EC_CMD_UCSI_PPM_SET' undeclared (first use in this function); did you mean 'EC_CMD_GPIO_SET'?
     169 |         TRACE_SYMBOL(EC_CMD_UCSI_PPM_SET), \
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:44:1: note: in expansion of macro 'TRACE_EVENT'
      44 | TRACE_EVENT(cros_ec_request_done,
         | ^~~~~~~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:65:9: note: in expansion of macro 'TP_printk'
      65 |         TP_printk("version: %u, offset: %d, command: %s, outsize: %u, insize: %u, ec result: %s, retval: %u",
         |         ^~~~~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:67:19: note: in expansion of macro '__print_symbolic'
      67 |                   __print_symbolic(__entry->command, EC_CMDS),
         |                   ^~~~~~~~~~~~~~~~
   drivers/platform/chrome/cros_ec_trace.c:169:9: note: in expansion of macro 'TRACE_SYMBOL'
     169 |         TRACE_SYMBOL(EC_CMD_UCSI_PPM_SET), \
         |         ^~~~~~~~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:67:54: note: in expansion of macro 'EC_CMDS'
      67 |                   __print_symbolic(__entry->command, EC_CMDS),
         |                                                      ^~~~~~~
>> drivers/platform/chrome/cros_ec_trace.c:170:22: error: 'EC_CMD_UCSI_PPM_GET' undeclared (first use in this function); did you mean 'EC_CMD_GPIO_GET'?
     170 |         TRACE_SYMBOL(EC_CMD_UCSI_PPM_GET), \
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:44:1: note: in expansion of macro 'TRACE_EVENT'
      44 | TRACE_EVENT(cros_ec_request_done,
         | ^~~~~~~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:65:9: note: in expansion of macro 'TP_printk'
      65 |         TP_printk("version: %u, offset: %d, command: %s, outsize: %u, insize: %u, ec result: %s, retval: %u",
         |         ^~~~~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:67:19: note: in expansion of macro '__print_symbolic'
      67 |                   __print_symbolic(__entry->command, EC_CMDS),
         |                   ^~~~~~~~~~~~~~~~
   drivers/platform/chrome/cros_ec_trace.c:170:9: note: in expansion of macro 'TRACE_SYMBOL'
     170 |         TRACE_SYMBOL(EC_CMD_UCSI_PPM_GET), \
         |         ^~~~~~~~~~~~
   drivers/platform/chrome/./cros_ec_trace.h:67:54: note: in expansion of macro 'EC_CMDS'
      67 |                   __print_symbolic(__entry->command, EC_CMDS),
         |                                                      ^~~~~~~


vim +169 drivers/platform/chrome/cros_ec_trace.c

     7	
     8	// Generate the list using the following script:
     9	// sed -n 's/^#define \(EC_CMD_[[:alnum:]_]*\)\s.*/\tTRACE_SYMBOL(\1), \\/p' include/linux/platform_data/cros_ec_commands.h
    10	#define EC_CMDS \
    11		TRACE_SYMBOL(EC_CMD_ACPI_READ), \
    12		TRACE_SYMBOL(EC_CMD_ACPI_WRITE), \
    13		TRACE_SYMBOL(EC_CMD_ACPI_BURST_ENABLE), \
    14		TRACE_SYMBOL(EC_CMD_ACPI_BURST_DISABLE), \
    15		TRACE_SYMBOL(EC_CMD_ACPI_QUERY_EVENT), \
    16		TRACE_SYMBOL(EC_CMD_PROTO_VERSION), \
    17		TRACE_SYMBOL(EC_CMD_HELLO), \
    18		TRACE_SYMBOL(EC_CMD_GET_VERSION), \
    19		TRACE_SYMBOL(EC_CMD_READ_TEST), \
    20		TRACE_SYMBOL(EC_CMD_GET_BUILD_INFO), \
    21		TRACE_SYMBOL(EC_CMD_GET_CHIP_INFO), \
    22		TRACE_SYMBOL(EC_CMD_GET_BOARD_VERSION), \
    23		TRACE_SYMBOL(EC_CMD_READ_MEMMAP), \
    24		TRACE_SYMBOL(EC_CMD_GET_CMD_VERSIONS), \
    25		TRACE_SYMBOL(EC_CMD_GET_COMMS_STATUS), \
    26		TRACE_SYMBOL(EC_CMD_TEST_PROTOCOL), \
    27		TRACE_SYMBOL(EC_CMD_GET_PROTOCOL_INFO), \
    28		TRACE_SYMBOL(EC_CMD_GSV_PAUSE_IN_S5), \
    29		TRACE_SYMBOL(EC_CMD_GET_FEATURES), \
    30		TRACE_SYMBOL(EC_CMD_GET_SKU_ID), \
    31		TRACE_SYMBOL(EC_CMD_SET_SKU_ID), \
    32		TRACE_SYMBOL(EC_CMD_FLASH_INFO), \
    33		TRACE_SYMBOL(EC_CMD_FLASH_READ), \
    34		TRACE_SYMBOL(EC_CMD_FLASH_WRITE), \
    35		TRACE_SYMBOL(EC_CMD_FLASH_ERASE), \
    36		TRACE_SYMBOL(EC_CMD_FLASH_PROTECT), \
    37		TRACE_SYMBOL(EC_CMD_FLASH_REGION_INFO), \
    38		TRACE_SYMBOL(EC_CMD_VBNV_CONTEXT), \
    39		TRACE_SYMBOL(EC_CMD_FLASH_SPI_INFO), \
    40		TRACE_SYMBOL(EC_CMD_FLASH_SELECT), \
    41		TRACE_SYMBOL(EC_CMD_PWM_GET_FAN_TARGET_RPM), \
    42		TRACE_SYMBOL(EC_CMD_PWM_SET_FAN_TARGET_RPM), \
    43		TRACE_SYMBOL(EC_CMD_PWM_GET_KEYBOARD_BACKLIGHT), \
    44		TRACE_SYMBOL(EC_CMD_PWM_SET_KEYBOARD_BACKLIGHT), \
    45		TRACE_SYMBOL(EC_CMD_PWM_SET_FAN_DUTY), \
    46		TRACE_SYMBOL(EC_CMD_PWM_SET_DUTY), \
    47		TRACE_SYMBOL(EC_CMD_PWM_GET_DUTY), \
    48		TRACE_SYMBOL(EC_CMD_LIGHTBAR_CMD), \
    49		TRACE_SYMBOL(EC_CMD_LED_CONTROL), \
    50		TRACE_SYMBOL(EC_CMD_VBOOT_HASH), \
    51		TRACE_SYMBOL(EC_CMD_MOTION_SENSE_CMD), \
    52		TRACE_SYMBOL(EC_CMD_FORCE_LID_OPEN), \
    53		TRACE_SYMBOL(EC_CMD_CONFIG_POWER_BUTTON), \
    54		TRACE_SYMBOL(EC_CMD_USB_CHARGE_SET_MODE), \
    55		TRACE_SYMBOL(EC_CMD_PSTORE_INFO), \
    56		TRACE_SYMBOL(EC_CMD_PSTORE_READ), \
    57		TRACE_SYMBOL(EC_CMD_PSTORE_WRITE), \
    58		TRACE_SYMBOL(EC_CMD_RTC_GET_VALUE), \
    59		TRACE_SYMBOL(EC_CMD_RTC_GET_ALARM), \
    60		TRACE_SYMBOL(EC_CMD_RTC_SET_VALUE), \
    61		TRACE_SYMBOL(EC_CMD_RTC_SET_ALARM), \
    62		TRACE_SYMBOL(EC_CMD_PORT80_LAST_BOOT), \
    63		TRACE_SYMBOL(EC_CMD_PORT80_READ), \
    64		TRACE_SYMBOL(EC_CMD_VSTORE_INFO), \
    65		TRACE_SYMBOL(EC_CMD_VSTORE_READ), \
    66		TRACE_SYMBOL(EC_CMD_VSTORE_WRITE), \
    67		TRACE_SYMBOL(EC_CMD_THERMAL_SET_THRESHOLD), \
    68		TRACE_SYMBOL(EC_CMD_THERMAL_GET_THRESHOLD), \
    69		TRACE_SYMBOL(EC_CMD_THERMAL_AUTO_FAN_CTRL), \
    70		TRACE_SYMBOL(EC_CMD_TMP006_GET_CALIBRATION), \
    71		TRACE_SYMBOL(EC_CMD_TMP006_SET_CALIBRATION), \
    72		TRACE_SYMBOL(EC_CMD_TMP006_GET_RAW), \
    73		TRACE_SYMBOL(EC_CMD_MKBP_STATE), \
    74		TRACE_SYMBOL(EC_CMD_MKBP_INFO), \
    75		TRACE_SYMBOL(EC_CMD_MKBP_SIMULATE_KEY), \
    76		TRACE_SYMBOL(EC_CMD_GET_KEYBOARD_ID), \
    77		TRACE_SYMBOL(EC_CMD_MKBP_SET_CONFIG), \
    78		TRACE_SYMBOL(EC_CMD_MKBP_GET_CONFIG), \
    79		TRACE_SYMBOL(EC_CMD_KEYSCAN_SEQ_CTRL), \
    80		TRACE_SYMBOL(EC_CMD_GET_NEXT_EVENT), \
    81		TRACE_SYMBOL(EC_CMD_KEYBOARD_FACTORY_TEST), \
    82		TRACE_SYMBOL(EC_CMD_TEMP_SENSOR_GET_INFO), \
    83		TRACE_SYMBOL(EC_CMD_HOST_EVENT_GET_B), \
    84		TRACE_SYMBOL(EC_CMD_HOST_EVENT_GET_SMI_MASK), \
    85		TRACE_SYMBOL(EC_CMD_HOST_EVENT_GET_SCI_MASK), \
    86		TRACE_SYMBOL(EC_CMD_HOST_EVENT_GET_WAKE_MASK), \
    87		TRACE_SYMBOL(EC_CMD_HOST_EVENT_SET_SMI_MASK), \
    88		TRACE_SYMBOL(EC_CMD_HOST_EVENT_SET_SCI_MASK), \
    89		TRACE_SYMBOL(EC_CMD_HOST_EVENT_CLEAR), \
    90		TRACE_SYMBOL(EC_CMD_HOST_EVENT_SET_WAKE_MASK), \
    91		TRACE_SYMBOL(EC_CMD_HOST_EVENT_CLEAR_B), \
    92		TRACE_SYMBOL(EC_CMD_HOST_EVENT), \
    93		TRACE_SYMBOL(EC_CMD_SWITCH_ENABLE_BKLIGHT), \
    94		TRACE_SYMBOL(EC_CMD_SWITCH_ENABLE_WIRELESS), \
    95		TRACE_SYMBOL(EC_CMD_GPIO_SET), \
    96		TRACE_SYMBOL(EC_CMD_GPIO_GET), \
    97		TRACE_SYMBOL(EC_CMD_I2C_READ), \
    98		TRACE_SYMBOL(EC_CMD_I2C_WRITE), \
    99		TRACE_SYMBOL(EC_CMD_CHARGE_CONTROL), \
   100		TRACE_SYMBOL(EC_CMD_CONSOLE_SNAPSHOT), \
   101		TRACE_SYMBOL(EC_CMD_CONSOLE_READ), \
   102		TRACE_SYMBOL(EC_CMD_BATTERY_CUT_OFF), \
   103		TRACE_SYMBOL(EC_CMD_USB_MUX), \
   104		TRACE_SYMBOL(EC_CMD_LDO_SET), \
   105		TRACE_SYMBOL(EC_CMD_LDO_GET), \
   106		TRACE_SYMBOL(EC_CMD_POWER_INFO), \
   107		TRACE_SYMBOL(EC_CMD_I2C_PASSTHRU), \
   108		TRACE_SYMBOL(EC_CMD_HANG_DETECT), \
   109		TRACE_SYMBOL(EC_CMD_CHARGE_STATE), \
   110		TRACE_SYMBOL(EC_CMD_CHARGE_CURRENT_LIMIT), \
   111		TRACE_SYMBOL(EC_CMD_EXTERNAL_POWER_LIMIT), \
   112		TRACE_SYMBOL(EC_CMD_OVERRIDE_DEDICATED_CHARGER_LIMIT), \
   113		TRACE_SYMBOL(EC_CMD_HIBERNATION_DELAY), \
   114		TRACE_SYMBOL(EC_CMD_HOST_SLEEP_EVENT), \
   115		TRACE_SYMBOL(EC_CMD_DEVICE_EVENT), \
   116		TRACE_SYMBOL(EC_CMD_SB_READ_WORD), \
   117		TRACE_SYMBOL(EC_CMD_SB_WRITE_WORD), \
   118		TRACE_SYMBOL(EC_CMD_SB_READ_BLOCK), \
   119		TRACE_SYMBOL(EC_CMD_SB_WRITE_BLOCK), \
   120		TRACE_SYMBOL(EC_CMD_BATTERY_VENDOR_PARAM), \
   121		TRACE_SYMBOL(EC_CMD_SB_FW_UPDATE), \
   122		TRACE_SYMBOL(EC_CMD_ENTERING_MODE), \
   123		TRACE_SYMBOL(EC_CMD_I2C_PASSTHRU_PROTECT), \
   124		TRACE_SYMBOL(EC_CMD_CEC_WRITE_MSG), \
   125		TRACE_SYMBOL(EC_CMD_CEC_SET), \
   126		TRACE_SYMBOL(EC_CMD_CEC_GET), \
   127		TRACE_SYMBOL(EC_CMD_EC_CODEC), \
   128		TRACE_SYMBOL(EC_CMD_EC_CODEC_DMIC), \
   129		TRACE_SYMBOL(EC_CMD_EC_CODEC_I2S_RX), \
   130		TRACE_SYMBOL(EC_CMD_EC_CODEC_WOV), \
   131		TRACE_SYMBOL(EC_CMD_REBOOT_EC), \
   132		TRACE_SYMBOL(EC_CMD_GET_PANIC_INFO), \
   133		TRACE_SYMBOL(EC_CMD_REBOOT), \
   134		TRACE_SYMBOL(EC_CMD_RESEND_RESPONSE), \
   135		TRACE_SYMBOL(EC_CMD_VERSION0), \
   136		TRACE_SYMBOL(EC_CMD_PD_EXCHANGE_STATUS), \
   137		TRACE_SYMBOL(EC_CMD_PD_HOST_EVENT_STATUS), \
   138		TRACE_SYMBOL(EC_CMD_USB_PD_CONTROL), \
   139		TRACE_SYMBOL(EC_CMD_USB_PD_PORTS), \
   140		TRACE_SYMBOL(EC_CMD_USB_PD_POWER_INFO), \
   141		TRACE_SYMBOL(EC_CMD_CHARGE_PORT_COUNT), \
   142		TRACE_SYMBOL(EC_CMD_USB_PD_FW_UPDATE), \
   143		TRACE_SYMBOL(EC_CMD_USB_PD_RW_HASH_ENTRY), \
   144		TRACE_SYMBOL(EC_CMD_USB_PD_DEV_INFO), \
   145		TRACE_SYMBOL(EC_CMD_USB_PD_DISCOVERY), \
   146		TRACE_SYMBOL(EC_CMD_PD_CHARGE_PORT_OVERRIDE), \
   147		TRACE_SYMBOL(EC_CMD_PD_GET_LOG_ENTRY), \
   148		TRACE_SYMBOL(EC_CMD_USB_PD_GET_AMODE), \
   149		TRACE_SYMBOL(EC_CMD_USB_PD_SET_AMODE), \
   150		TRACE_SYMBOL(EC_CMD_PD_WRITE_LOG_ENTRY), \
   151		TRACE_SYMBOL(EC_CMD_PD_CONTROL), \
   152		TRACE_SYMBOL(EC_CMD_USB_PD_MUX_INFO), \
   153		TRACE_SYMBOL(EC_CMD_PD_CHIP_INFO), \
   154		TRACE_SYMBOL(EC_CMD_RWSIG_CHECK_STATUS), \
   155		TRACE_SYMBOL(EC_CMD_RWSIG_ACTION), \
   156		TRACE_SYMBOL(EC_CMD_EFS_VERIFY), \
   157		TRACE_SYMBOL(EC_CMD_GET_CROS_BOARD_INFO), \
   158		TRACE_SYMBOL(EC_CMD_SET_CROS_BOARD_INFO), \
   159		TRACE_SYMBOL(EC_CMD_GET_UPTIME_INFO), \
   160		TRACE_SYMBOL(EC_CMD_ADD_ENTROPY), \
   161		TRACE_SYMBOL(EC_CMD_ADC_READ), \
   162		TRACE_SYMBOL(EC_CMD_ROLLBACK_INFO), \
   163		TRACE_SYMBOL(EC_CMD_AP_RESET), \
   164		TRACE_SYMBOL(EC_CMD_REGULATOR_GET_INFO), \
   165		TRACE_SYMBOL(EC_CMD_REGULATOR_ENABLE), \
   166		TRACE_SYMBOL(EC_CMD_REGULATOR_IS_ENABLED), \
   167		TRACE_SYMBOL(EC_CMD_REGULATOR_SET_VOLTAGE), \
   168		TRACE_SYMBOL(EC_CMD_REGULATOR_GET_VOLTAGE), \
 > 169		TRACE_SYMBOL(EC_CMD_UCSI_PPM_SET), \
 > 170		TRACE_SYMBOL(EC_CMD_UCSI_PPM_GET), \
   171		TRACE_SYMBOL(EC_CMD_CR51_BASE), \
   172		TRACE_SYMBOL(EC_CMD_CR51_LAST), \
   173		TRACE_SYMBOL(EC_CMD_FP_PASSTHRU), \
   174		TRACE_SYMBOL(EC_CMD_FP_MODE), \
   175		TRACE_SYMBOL(EC_CMD_FP_INFO), \
   176		TRACE_SYMBOL(EC_CMD_FP_FRAME), \
   177		TRACE_SYMBOL(EC_CMD_FP_TEMPLATE), \
   178		TRACE_SYMBOL(EC_CMD_FP_CONTEXT), \
   179		TRACE_SYMBOL(EC_CMD_FP_STATS), \
   180		TRACE_SYMBOL(EC_CMD_FP_SEED), \
   181		TRACE_SYMBOL(EC_CMD_FP_ENC_STATUS), \
   182		TRACE_SYMBOL(EC_CMD_TP_SELF_TEST), \
   183		TRACE_SYMBOL(EC_CMD_TP_FRAME_INFO), \
   184		TRACE_SYMBOL(EC_CMD_TP_FRAME_SNAPSHOT), \
   185		TRACE_SYMBOL(EC_CMD_TP_FRAME_GET), \
   186		TRACE_SYMBOL(EC_CMD_BATTERY_GET_STATIC), \
   187		TRACE_SYMBOL(EC_CMD_BATTERY_GET_DYNAMIC), \
   188		TRACE_SYMBOL(EC_CMD_CHARGER_CONTROL), \
   189		TRACE_SYMBOL(EC_CMD_BOARD_SPECIFIC_BASE), \
   190		TRACE_SYMBOL(EC_CMD_BOARD_SPECIFIC_LAST)
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

