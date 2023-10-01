Return-Path: <linux-usb+bounces-894-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F1E7B4A1D
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 00:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id A17211C2048A
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 22:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579CF199A3;
	Sun,  1 Oct 2023 22:09:00 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC9719457
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 22:08:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84104C9
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 15:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696198135; x=1727734135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5O5dPKseRbZSXNfKQTc1ZI0pbIN7XFKfeK4/xDIE12s=;
  b=lY2L+PZ6Sd2kw6sBaq+Wtbl85gF/+nQk2JYnKH+PXr/kqoN+x99MmOf2
   wHRHy72FvKsyOhkmmz3YJcAhBnVy04dqh3G4mAToDAAOE3GbqY/fuiu0X
   zAM662zPUTGhPWOPnpQ67lGYd37PCGADw9w0MxVKJN2XzrdF80sf88tWP
   sUiOOjmIonML+BFZN/dMTkR+cmc7r2qbarKhHdTNYb/mZUJgwC7kqSEaK
   I7UOuKHMwD+EOb4EyRK6DgjG6jy3iJG0TvYLrQrJ4BiJZBo2pO8uCOL3N
   Y7RMDr7Hm6PgmdeV0aQFpRBBZOaCbmspRo1VOdh3lSwW/A6ap6QNGIbHp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="381440935"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="381440935"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 15:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="866315738"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="866315738"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 01 Oct 2023 15:08:52 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qn4cM-0005SX-1U;
	Sun, 01 Oct 2023 22:08:50 +0000
Date: Mon, 2 Oct 2023 06:08:45 +0800
From: kernel test robot <lkp@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
	linux-usb@vger.kernel.org, Douglas Gilbert <dgilbert@interlog.com>
Subject: Re: [PATCH v2] usb: pd: Exposing the Peak Current value of Fixed
 Supplies to user space
Message-ID: <202310020520.759dWkR0-lkp@intel.com>
References: <20230928105944.1718897-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928105944.1718897-1-heikki.krogerus@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Heikki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.6-rc3 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heikki-Krogerus/usb-pd-Exposing-the-Peak-Current-value-of-Fixed-Supplies-to-user-space/20230928-190152
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230928105944.1718897-1-heikki.krogerus%40linux.intel.com
patch subject: [PATCH v2] usb: pd: Exposing the Peak Current value of Fixed Supplies to user space
reproduce: (https://download.01.org/0day-ci/archive/20231002/202310020520.759dWkR0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310020520.759dWkR0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-class-usb_power_delivery:128: WARNING: Unexpected indentation.
>> Documentation/ABI/testing/sysfs-class-usb_power_delivery:128: WARNING: Block quote ends without a blank line; unexpected unindent.
>> Documentation/ABI/testing/sysfs-class-usb_power_delivery:128: WARNING: Definition list ends without a blank line; unexpected unindent.
>> Documentation/ABI/testing/sysfs-class-usb_power_delivery:128: WARNING: Malformed table.
>> Documentation/ABI/testing/sysfs-class-usb_power_delivery:1: WARNING: undefined label: abi_sys_class_usb_power_delivery_version (if the link has no caption the label must precede a section header)
>> Documentation/ABI/testing/sysfs-class-usb_power_delivery:1: WARNING: undefined label: abi_sys_class_usb_power_delivery_source_capabilities_position_variable_supply_maximum_current (if the link has no caption the label must precede a section header)
>> Documentation/ABI/testing/sysfs-class-usb_power_delivery:1: WARNING: undefined label: abi_sys_class_usb_power_delivery_source_capabilities_position_programmable_supply_pps_power_limited (if the link has no caption the label must precede a section header)

vim +128 Documentation/ABI/testing/sysfs-class-usb_power_delivery

   > 1	What:		/sys/class/usb_power_delivery
     2	Date:		May 2022
     3	Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
     4	Description:
     5			Directory for USB Power Delivery devices.
     6	
     7	What:		/sys/class/usb_power_delivery/.../revision
     8	Date:		May 2022
     9	Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
    10	Description:
    11			File showing the USB Power Delivery Specification Revision used
    12			in communication.
    13	
    14	What:		/sys/class/usb_power_delivery/.../version
    15	Date:		May 2022
    16	Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
    17	Description:
    18			This is an optional attribute file showing the version of the
    19			specific revision of the USB Power Delivery Specification. In
    20			most cases the specification version is not known and the file
    21			is not available.
    22	
    23	What:		/sys/class/usb_power_delivery/.../source-capabilities
    24	Date:		May 2022
    25	Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
    26	Description:
    27			The source capabilities message "Source_Capabilities" contains a
    28			set of Power Data Objects (PDO), each representing a type of
    29			power supply. The order of the PDO objects is defined in the USB
    30			Power Delivery Specification. Each PDO - power supply - will
    31			have its own device, and the PDO device name will start with the
    32			object position number as the first character followed by the
    33			power supply type name (":" as delimiter).
    34	
    35				/sys/class/usb_power_delivery/.../source_capabilities/<position>:<type>
    36	
    37	What:		/sys/class/usb_power_delivery/.../sink-capabilities
    38	Date:		May 2022
    39	Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
    40	Description:
    41			The sink capability message "Sink_Capabilities" contains a set
    42			of Power Data Objects (PDO) just like with source capabilities,
    43			but instead of describing the power capabilities, these objects
    44			describe the power requirements.
    45	
    46			The order of the objects in the sink capability message is the
    47			same as with the source capabilities message.
    48	
    49	Fixed Supplies
    50	
    51	What:		/sys/class/usb_power_delivery/.../<capability>/<position>:fixed_supply
    52	Date:		May 2022
    53	Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
    54	Description:
    55			Devices containing the attributes (the bit fields) defined for
    56			Fixed Supplies.
    57	
    58			The device "1:fixed_supply" is special. USB Power Delivery
    59			Specification dictates that the first PDO (at object position
    60			1), and the only mandatory PDO, is always the vSafe5V Fixed
    61			Supply Object. vSafe5V Object has additional fields defined for
    62			it that the other Fixed Supply Objects do not have and that are
    63			related to the USB capabilities rather than power capabilities.
    64	
    65	What:		/sys/class/usb_power_delivery/.../<capability>/1:fixed_supply/dual_role_power
    66	Date:		May 2022
    67	Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
    68	Description:
    69			This file contains boolean value that tells does the device
    70			support both source and sink power roles.
    71	
    72	What:		/sys/class/usb_power_delivery/.../source-capabilities/1:fixed_supply/usb_suspend_supported
    73	Date:		May 2022
    74	Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
    75	Description:
    76			This file shows the value of the USB Suspend Supported bit in
    77			vSafe5V Fixed Supply Object. If the bit is set then the device
    78			will follow the USB 2.0 and USB 3.2 rules for suspend and
    79			resume.
    80	
    81	What:		/sys/class/usb_power_delivery/.../sink-capabilities/1:fixed_supply/higher_capability
    82	Date:		February 2023
    83	Contact:	Saranya Gopal <saranya.gopal@linux.intel.com>
    84	Description:
    85			This file shows the value of the Higher capability bit in
    86			vsafe5V Fixed Supply Object. If the bit is set, then the sink
    87			needs more than vsafe5V(eg. 12 V) to provide full functionality.
    88			Valid values: 0, 1
    89	
    90	What:		/sys/class/usb_power_delivery/.../<capability>/1:fixed_supply/unconstrained_power
    91	Date:		May 2022
    92	Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
    93	Description:
    94			This file shows the value of the Unconstrained Power bit in
    95			vSafe5V Fixed Supply Object. The bit is set when an external
    96			source of power, powerful enough to power the entire system on
    97			its own, is available for the device.
    98	
    99	What:		/sys/class/usb_power_delivery/.../<capability>/1:fixed_supply/usb_communication_capable
   100	Date:		May 2022
   101	Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
   102	Description:
   103			This file shows the value of the USB Communication Capable bit in
   104			vSafe5V Fixed Supply Object.
   105	
   106	What:		/sys/class/usb_power_delivery/.../<capability>/1:fixed_supply/dual_role_data
   107	Date:		May 2022
   108	Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
   109	Description:
   110			This file shows the value of the Dual-Role Data bit in vSafe5V
   111			Fixed Supply Object. Dual role data means ability act as both
   112			USB host and USB device.
   113	
   114	What:		/sys/class/usb_power_delivery/.../<capability>/1:fixed_supply/unchunked_extended_messages_supported
   115	Date:		May 2022
   116	Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
   117	Description:
   118			This file shows the value of the Unchunked Extended Messages
   119			Supported bit in vSafe5V Fixed Supply Object.
   120	
   121	What:		/sys/class/usb_power_delivery/.../<capability>/<position>:fixed_supply/voltage
   122	Date:		May 2022
   123	Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
   124	Description:
   125			The voltage the supply supports in millivolts.
   126	
   127	What:		/sys/class/usb_power_delivery/.../source-capabilities/<position>:fixed_supply/peak_current
 > 128	Date:		October 2023
   129	Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
   130	Description:
   131			Fixed Power Source Peak Current Capability
   132			(IOC: Negotiated current as defined in IEC 63002):
   133			==  ===========================================================
   134			0   Peak current equals IOC (default)
   135			1   Overload Capabilities:
   136			    1. Peak current equals 150% IOC for 1ms @ 5% duty cycle
   137			       (low current equals 97% IOC for 19ms)
   138			    2. Peak current equals 125% IOC for 2ms @ 10% duty cycle
   139			       (low current equals 97% IOC for 18ms)
   140			    3. Peak current equals 110% IOC for 10ms @ 50% duty cycle
   141			       (low current equals 90% IOC for 10ms)
   142			2   Overload Capabilities:
   143			    1. Peak current equals 200% IOC for 1ms @ 5% duty cycle
   144			       (low current equals 95% IOC for 19ms)
   145			    2. Peak current equals 150% IOC for 2ms @ 10% duty cycle
   146			       (low current equals 94% IOC for 18ms)
   147			    3. Peak current equals 125% IOC for 10ms @ 50% duty cycle
   148			       (low current equals 75% IOC for 10ms)
   149			3   Overload Capabilities:
   150			    1. Peak current equals 200% IOC for 1ms @ 5% duty cycle
   151			       (low current equals 95% IOC for 19ms)
   152			    2. Peak current equals 175% IOC for 2ms @ 10% duty cycle
   153			       (low current equals 92% IOC for 18ms)
   154			    3. Peak current equals 150% IOC for 10ms @ 50% duty cycle
   155			       (low current equals 50% IOC for 10ms)
   156			==  ===========================================================
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

