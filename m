Return-Path: <linux-usb+bounces-6558-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D058578CF
	for <lists+linux-usb@lfdr.de>; Fri, 16 Feb 2024 10:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D56E285283
	for <lists+linux-usb@lfdr.de>; Fri, 16 Feb 2024 09:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006A31BC30;
	Fri, 16 Feb 2024 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfSKeX26"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47CE1B953;
	Fri, 16 Feb 2024 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708075558; cv=none; b=KzZ6RwSWHC0w48ar9jIs38bvFQEqy7i0B06DDk+sJIq5RuT/A68A03D5dLoaQVNVSKYw3ZN7nuyeBOPWyPwbb6Paf6U/VFYHeqOlFfalqLN9bCM9IeSce9iYhmZCNpYNxpasjrz3oEir1vW8L1IYluZi6qImet4NYDgxem7uYA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708075558; c=relaxed/simple;
	bh=Jb6VOAald6OjrfksneH8UVezoPqu8frcJgTS0+7mp64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MowsCla7A9zbhEE7fNAqEm2geWyDtp06p97NLubsHSoE8u9ru9os/Eb8LZMSL++aPE05QjAp56v4dAM6mlU7biqJHG9194sSTVrEAXseYAE530YZSxGo4EDEk6U34QNgnhXH5Xr+aHUBW/mJcPKxz4bXHbRFGNusVzso7f2cwug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QfSKeX26; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708075555; x=1739611555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jb6VOAald6OjrfksneH8UVezoPqu8frcJgTS0+7mp64=;
  b=QfSKeX26fY+3r3VxPufV2zR9BPFWjmBRyoKrwSnYk98A24MDrRQlv8eR
   Rssu6WqalnNuvEwbup0yFoZdm2L/HAYUhehUWgIPTOk8fUi7W07RbEF6i
   MbpOyl0w6VUNH6BS9roNqEj78TWImBdBxuAx2cnHqF3PwfH2nhK/TE9NV
   nXPT3+O3jiyfaTAmoDI7hCk/9sX4PgHSoKuIyLrSA8rEnLD+UN5zseWd2
   ZPXKPwh0kja3B2xdKqYfE2ZGqqNiThUgtGzgWIbXH7MMsmLYNE9TNlyQW
   NWao24WNGS+qmi6x91z5l9VfqQRNdunaSeBWwjTfa8BSOFrCf22qDVFHT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="27652291"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="27652291"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 01:25:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="3715529"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 16 Feb 2024 01:25:49 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rauTb-00018m-1N;
	Fri, 16 Feb 2024 09:25:47 +0000
Date: Fri, 16 Feb 2024 17:24:53 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, amd-gfx@lists.freedesktop.org,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
	linux-fbdev@vger.kernel.org, nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	"open list:ACPI" <linux-acpi@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Melissa Wen <mwen@igalia.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v6 1/5] drm: Stop using `select ACPI_VIDEO` in all drivers
Message-ID: <202402161747.TXWr5bw4-lkp@intel.com>
References: <20240214215756.6530-2-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214215756.6530-2-mario.limonciello@amd.com>

Hi Mario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.8-rc4 next-20240216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/drm-Stop-using-select-ACPI_VIDEO-in-all-drivers/20240215-055936
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240214215756.6530-2-mario.limonciello%40amd.com
patch subject: [PATCH v6 1/5] drm: Stop using `select ACPI_VIDEO` in all drivers
config: powerpc-kismet-CONFIG_FB_BACKLIGHT-CONFIG_PMAC_BACKLIGHT-0-0 (https://download.01.org/0day-ci/archive/20240216/202402161747.TXWr5bw4-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240216/202402161747.TXWr5bw4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402161747.TXWr5bw4-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FB_BACKLIGHT when selected by PMAC_BACKLIGHT
   .config:247:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
   .config:251:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:262:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:356:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:407:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_16550_PHYSADDR
   .config:462:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:563:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_HVSI_VTERMNO
   .config:663:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:677:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:710:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:725:warning: symbol value 'n' invalid for DATA_SHIFT
   .config:765:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:793:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:854:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:904:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
   .config:922:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:958:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:974:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:986:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:1270:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1365:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1398:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:1548:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1673:warning: symbol value 'n' invalid for LOWMEM_CAM_NUM
   .config:1723:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1805:warning: symbol value 'n' invalid for PPC_MEMCONS_OUTPUT_SIZE
   .config:1874:warning: symbol value 'n' invalid for LOWMEM_SIZE
   .config:1899:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:2030:warning: symbol value 'n' invalid for PANEL_PROFILE
   .config:2042:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:2054:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
   .config:2180:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:2304:warning: symbol value 'n' invalid for SND_HDA_PREALLOC_SIZE
   .config:2510:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2523:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2770:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2864:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:2868:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:3081:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:3189:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:3214:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:3227:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:3237:warning: symbol value 'n' invalid for DEBUG_OBJECTS_ENABLE_DEFAULT
   .config:3244:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:3335:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:3362:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3402:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3439:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:3677:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3778:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3782:warning: symbol value 'n' invalid for INET_TABLE_PERTURB_ORDER
   .config:3825:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3919:warning: symbol value 'n' invalid for SERIAL_AR933X_NR_UARTS
   .config:3954:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3993:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_16550_STRIDE
   .config:4070:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:4112:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:4120:warning: symbol value 'n' invalid for PPC_MEMCONS_INPUT_SIZE
   .config:4130:warning: symbol value 'n' invalid for IP_VS_MH_TAB_INDEX
   .config:4143:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:4155:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:4293:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_CPM_ADDR
   .config:4419:warning: symbol value 'n' invalid for IP_VS_SH_TAB_BITS
   .config:4574:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4575:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4662:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:4698:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4935:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:5036:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:5067:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:5356:warning: symbol value 'n' invalid for SND_MAX_CARDS
   .config:5536:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5559:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5599:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:5728:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5827:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5847:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:6021:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:6123:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:6125:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:6200:warning: symbol value 'n' invalid for SCSI_MESH_RESET_DELAY_MS
   .config:6259:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:6266:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:6290:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:6350:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:6510:warning: symbol value 'n' invalid for SERIAL_8250_RUNTIME_UARTS
   .config:6615:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6677:warning: symbol value 'n' invalid for XEN_MEMORY_HOTPLUG_LIMIT
   .config:6721:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:6793:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6835:warning: symbol value 'n' invalid for MTD_UBI_WL_THRESHOLD
   .config:6860:warning: symbol value 'n' invalid for RIONET_TX_SIZE
   .config:6892:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6940:warning: symbol value 'n' invalid for VIDEO_VIVID_MAX_DEVS
   .config:7211:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:7249:warning: symbol value 'n' invalid for OMAP2_DSS_MIN_FCK_PER_PCK
   .config:7375:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:7466:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:7471:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:7482:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

