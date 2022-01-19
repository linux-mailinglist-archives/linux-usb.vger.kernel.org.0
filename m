Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61A0D493F57
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jan 2022 18:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356528AbiASRss (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jan 2022 12:48:48 -0500
Received: from mga09.intel.com ([134.134.136.24]:38004 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1356524AbiASRsl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Jan 2022 12:48:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642614521; x=1674150521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bvJNVx/hK7jnHw0/66YIx9ehoHCENwyKD3czigeb6k4=;
  b=D4USEcgzHnRHSILXxxt1yZkbCWma+/0tGnbSVY0qmgpfj2jY7obYGDm1
   IIDtdGn3H7IuA2mEsQ0I86Hno+SC6TPNPGto4tyV+5terel4Bb10Pla0R
   cyyXqMc8/ThDF+e6taEamDM/hnSZt2uuFSQcZsoZkCzP/NDoUrE0UKyih
   lr7tBNb9jgmojzIb5qN6HffnB1iPl+ReTk49YGcgzrZGxkijAouLJjjsV
   kMWtzFZqm5omlARCJwP6ZL1Ch2lH7eg/YWiraPhAVmmjlTl+UXAyol9fa
   a7VH+hpoLZcf9CyMUyb6TNttOsiIb9tRQNRhHlnACHW49pvAUeyBSRjfH
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="244924193"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; 
   d="scan'208";a="244924193"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2022 09:48:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; 
   d="scan'208";a="477458602"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Jan 2022 09:48:36 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nAF4W-000Dfo-7o; Wed, 19 Jan 2022 17:48:36 +0000
Date:   Thu, 20 Jan 2022 01:47:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Pratham Pratap <quic_ppratap@quicinc.com>,
        gregkh@linuxfoundation.org, mathias.nyman@intel.com
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_jackp@quicinc.com,
        quic_mrana@quicinc.com, Pratham Pratap <quic_ppratap@quicinc.com>
Subject: Re: [PATCH v1] usb: hub: Power cycle root hub if CSC is set during
 hub_port_reset
Message-ID: <202201200108.JJYDWfTS-lkp@intel.com>
References: <1642607498-8458-1-git-send-email-quic_ppratap@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1642607498-8458-1-git-send-email-quic_ppratap@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Pratham,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on linus/master peter-chen-usb/for-usb-next v5.16 next-20220118]
[cannot apply to balbi-usb/testing/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Pratham-Pratap/usb-hub-Power-cycle-root-hub-if-CSC-is-set-during-hub_port_reset/20220119-235321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20220120/202201200108.JJYDWfTS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ec4d5f04b268fc19d3b5d2843d1889531dafd22f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Pratham-Pratap/usb-hub-Power-cycle-root-hub-if-CSC-is-set-during-hub_port_reset/20220119-235321
        git checkout ec4d5f04b268fc19d3b5d2843d1889531dafd22f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash drivers/usb/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/usb/core/hub.c: In function 'hub_port_wait_reset':
>> drivers/usb/core/hub.c:2907:25: error: 'struct usb_device' has no member named 'reset_resume'
    2907 |                 if (udev->reset_resume && (!udev->parent && hcd->fs_suspend_reset) &&
         |                         ^~
>> drivers/usb/core/hub.c:2909:50: error: 'hdev' undeclared (first use in this function); did you mean 'udev'?
    2909 |                         usb_hub_port_power_cycle(hdev, hub, port1);
         |                                                  ^~~~
         |                                                  udev
   drivers/usb/core/hub.c:2909:50: note: each undeclared identifier is reported only once for each function it appears in


vim +2907 drivers/usb/core/hub.c

  2845	
  2846	static int hub_port_wait_reset(struct usb_hub *hub, int port1,
  2847				struct usb_device *udev, unsigned int delay, bool warm)
  2848	{
  2849		int delay_time, ret;
  2850		struct usb_hcd *hcd = bus_to_hcd(udev->bus);
  2851		u16 portstatus;
  2852		u16 portchange;
  2853		u32 ext_portstatus = 0;
  2854	
  2855		for (delay_time = 0;
  2856				delay_time < HUB_RESET_TIMEOUT;
  2857				delay_time += delay) {
  2858			/* wait to give the device a chance to reset */
  2859			msleep(delay);
  2860	
  2861			/* read and decode port status */
  2862			if (hub_is_superspeedplus(hub->hdev))
  2863				ret = hub_ext_port_status(hub, port1,
  2864							  HUB_EXT_PORT_STATUS,
  2865							  &portstatus, &portchange,
  2866							  &ext_portstatus);
  2867			else
  2868				ret = hub_port_status(hub, port1, &portstatus,
  2869						      &portchange);
  2870			if (ret < 0)
  2871				return ret;
  2872	
  2873			/*
  2874			 * The port state is unknown until the reset completes.
  2875			 *
  2876			 * On top of that, some chips may require additional time
  2877			 * to re-establish a connection after the reset is complete,
  2878			 * so also wait for the connection to be re-established.
  2879			 */
  2880			if (!(portstatus & USB_PORT_STAT_RESET) &&
  2881			    (portstatus & USB_PORT_STAT_CONNECTION))
  2882				break;
  2883	
  2884			/* switch to the long delay after two short delay failures */
  2885			if (delay_time >= 2 * HUB_SHORT_RESET_TIME)
  2886				delay = HUB_LONG_RESET_TIME;
  2887	
  2888			dev_dbg(&hub->ports[port1 - 1]->dev,
  2889					"not %sreset yet, waiting %dms\n",
  2890					warm ? "warm " : "", delay);
  2891		}
  2892	
  2893		if ((portstatus & USB_PORT_STAT_RESET))
  2894			return -EBUSY;
  2895	
  2896		if (hub_port_warm_reset_required(hub, port1, portstatus))
  2897			return -ENOTCONN;
  2898	
  2899		/* Device went away? */
  2900		if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
  2901			/*
  2902			 * When a FS device is following a suspend-reset-enumeration-data_transfer
  2903			 * sequence, sometimes it goes back in suspend just after reset without the
  2904			 * link entering L0. To fix this when CSC bit is set(because of CCS status
  2905			 * change) power cycle the root hub.
  2906			 */
> 2907			if (udev->reset_resume && (!udev->parent && hcd->fs_suspend_reset) &&
  2908					(portstatus & USB_PORT_STAT_CSC)) {
> 2909				usb_hub_port_power_cycle(hdev, hub, port1);
  2910				return -EAGAIN;
  2911			}
  2912	
  2913			return -ENOTCONN;
  2914		}
  2915	
  2916		/* Retry if connect change is set but status is still connected.
  2917		 * A USB 3.0 connection may bounce if multiple warm resets were issued,
  2918		 * but the device may have successfully re-connected. Ignore it.
  2919		 */
  2920		if (!hub_is_superspeed(hub->hdev) &&
  2921		    (portchange & USB_PORT_STAT_C_CONNECTION)) {
  2922			usb_clear_port_feature(hub->hdev, port1,
  2923					       USB_PORT_FEAT_C_CONNECTION);
  2924			return -EAGAIN;
  2925		}
  2926	
  2927		if (!(portstatus & USB_PORT_STAT_ENABLE))
  2928			return -EBUSY;
  2929	
  2930		if (!udev)
  2931			return 0;
  2932	
  2933		if (hub_is_superspeedplus(hub->hdev)) {
  2934			/* extended portstatus Rx and Tx lane count are zero based */
  2935			udev->rx_lanes = USB_EXT_PORT_RX_LANES(ext_portstatus) + 1;
  2936			udev->tx_lanes = USB_EXT_PORT_TX_LANES(ext_portstatus) + 1;
  2937			udev->ssp_rate = get_port_ssp_rate(hub->hdev, ext_portstatus);
  2938		} else {
  2939			udev->rx_lanes = 1;
  2940			udev->tx_lanes = 1;
  2941			udev->ssp_rate = USB_SSP_GEN_UNKNOWN;
  2942		}
  2943		if (hub_is_wusb(hub))
  2944			udev->speed = USB_SPEED_WIRELESS;
  2945		else if (udev->ssp_rate != USB_SSP_GEN_UNKNOWN)
  2946			udev->speed = USB_SPEED_SUPER_PLUS;
  2947		else if (hub_is_superspeed(hub->hdev))
  2948			udev->speed = USB_SPEED_SUPER;
  2949		else if (portstatus & USB_PORT_STAT_HIGH_SPEED)
  2950			udev->speed = USB_SPEED_HIGH;
  2951		else if (portstatus & USB_PORT_STAT_LOW_SPEED)
  2952			udev->speed = USB_SPEED_LOW;
  2953		else
  2954			udev->speed = USB_SPEED_FULL;
  2955		return 0;
  2956	}
  2957	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
