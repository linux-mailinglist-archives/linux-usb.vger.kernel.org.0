Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0582D23A2F1
	for <lists+linux-usb@lfdr.de>; Mon,  3 Aug 2020 12:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgHCKyT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Aug 2020 06:54:19 -0400
Received: from mga06.intel.com ([134.134.136.31]:8640 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbgHCKyL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Aug 2020 06:54:11 -0400
IronPort-SDR: AcLu9LvF6Bc3Ke/2iJ9U/wjyevao69HJOuXYmlMM4JXWGR6YZ4JjELdDkEjPmcIWuVJQTXp5HB
 53F0WNhoPDHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="213613454"
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; 
   d="scan'208";a="213613454"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2020 03:54:07 -0700
IronPort-SDR: /TvzsbBjQfmUA0xHzbyVJIRJPDj9iWa2Dp8/ni8YLaYukU/uikDh5o6PcZ9/JfccDkjYSISxLO
 vFYTzw8ZQ8PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; 
   d="scan'208";a="396014744"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 03 Aug 2020 03:54:04 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 03 Aug 2020 13:54:04 +0300
Date:   Mon, 3 Aug 2020 13:54:04 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Matt Turner <mattst88@gmail.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: Thunderbolt hotplug fails on HP x360 13t-aw000/86FA with HP
 Thunderbolt 3 Dock
Message-ID: <20200803105404.GQ1375436@lahna.fi.intel.com>
References: <20200731033620.GA4428@hp-x360.mattst88.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200731033620.GA4428@hp-x360.mattst88.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Can you try the patch here?

  https://lore.kernel.org/patchwork/patch/1257708/

On Thu, Jul 30, 2020 at 08:36:20PM -0700, Matt Turner wrote:
> Looking for support or debugging suggestions to figure out why my HP
> Spectre x360 (Icelake) laptop doesn't successfully hotplug with an HP
> Thunderbolt 3 dock. I'm using 5.8.0-rc7-next-20200729. The dock's
> firmwares have been updated from a system running Windows. The HP laptop
> is using the latest BIOS as of last week, and nvm_version is "80.0":
> 
> % cat /sys/devices/pci0000:00/0000:00:0d.2/domain0/0-0/nvm_version 80.0
> 
> Cold booting the system with the dock attached provides working
> ethernet, USB hub, etc. Unplugging and replugging the dock does not
> work, leaving it only providing power.
> 
> Attached are dmesg, lspci -vvnnt output, and /proc/iomem captured (1) at
> coldboot with the dock attached, (2) after unplugging the dock, and (3)
> after hotplugging the dock; and my kernel .config.
> 
> For search engines, the most apparent failure in dmesg is:
> 
> xhci_hcd 0000:2e:00.0: enabling device (0000 -> 0002)
> xhci_hcd 0000:2e:00.0: xHCI Host Controller
> xhci_hcd 0000:2e:00.0: new USB bus registered, assigned bus number 5
> xhci_hcd 0000:2e:00.0: Host halt failed, -19
> xhci_hcd 0000:2e:00.0: can't setup: -19
> xhci_hcd 0000:2e:00.0: USB bus 5 deregistered
> xhci_hcd 0000:2e:00.0: init 0000:2e:00.0 fail, -19
> tg3 0000:2f:00.0: enabling device (0000 -> 0002)
> tg3 0000:2f:00.0: phy probe failed, err -19
> tg3 0000:2f:00.0: Problem fetching invariants of chip, aborting
> 
> Help? Thanks!
> Matt

> 00000000-00000fff : Reserved
> 00001000-0009efff : System RAM
> 0009f000-000fffff : Reserved
>   000a0000-000bffff : PCI Bus 0000:00
>   000f0000-000fffff : System ROM
> 00100000-4e7bbfff : System RAM
>   03000000-03e01742 : Kernel code
>   04000000-044d8fff : Kernel rodata
>   04600000-0480917f : Kernel data
>   04db5000-04ffffff : Kernel bss
> 4e7bc000-4e81cfff : Reserved
> 4e81d000-506befff : System RAM
> 506bf000-506bffff : Reserved
> 506c0000-53005fff : System RAM
> 53006000-53006fff : ACPI Non-volatile Storage
> 53007000-5302cfff : System RAM
> 5302d000-5302dfff : Reserved
> 5302e000-578c9fff : System RAM
> 578ca000-58716fff : Reserved
> 58717000-587b4fff : ACPI Tables
> 587b5000-5886ffff : ACPI Non-volatile Storage
>   587de000-587defff : USBC000:00
> 58870000-5df40fff : Reserved
> 5df41000-5dffefff : Unknown E820 type
> 5dfff000-5dffffff : System RAM
> 5e000000-61ffffff : Reserved
> 62e00000-67bfffff : Reserved
>   64000000-67bfffff : Graphics Stolen Memory
> 67c00000-bfffffff : PCI Bus 0000:00
>   67c00000-67c00fff : 0000:00:1f.5
>   68000000-741fffff : PCI Bus 0000:2c
>     68000000-680fffff : PCI Bus 0000:2d
>       68000000-680fffff : PCI Bus 0000:2e
>         68000000-68007fff : 0000:2e:00.0
>           68000000-68007fff : xhci-hcd
>   76000000-821fffff : PCI Bus 0000:01
>   82200000-822fffff : PCI Bus 0000:58
>     82200000-82203fff : 0000:58:00.0
>       82200000-82203fff : nvme
>   82300000-823fffff : PCI Bus 0000:57
>     82300000-82300fff : 0000:57:00.0
>       82300000-82300fff : rtsx_pci
>   82400000-82401fff : 0000:00:17.0
>     82400000-82401fff : ahci
>   82402000-824027ff : 0000:00:17.0
>     82402000-824027ff : ahci
>   82403000-824030ff : 0000:00:17.0
>     82403000-824030ff : ahci
> c0000000-cfffffff : PCI MMCONFIG 0000 [bus 00-ff]
>   c0000000-cfffffff : Reserved
>     c0000000-cfffffff : pnp 00:04
> fd000000-fd68ffff : pnp 00:05
> fd6b0000-fd6cffff : pnp 00:05
> fd6f0000-fdffffff : pnp 00:05
> fe000000-fe010fff : Reserved
> fe038000-fe038fff : pnp 00:07
> fe200000-fe7fffff : pnp 00:05
> fec00000-fec00fff : Reserved
>   fec00000-fec003ff : IOAPIC 0
> fed00000-fed00fff : Reserved
>   fed00000-fed003ff : HPET 0
>     fed00000-fed003ff : PNP0103:00
> fed10000-fed17fff : pnp 00:04
> fed20000-fed7ffff : Reserved
>   fed40000-fed44fff : MSFT0101:00
>     fed40000-fed44fff : MSFT0101:00 MSFT0101:00
> fed90000-fed93fff : pnp 00:04
> feda0000-feda0fff : pnp 00:04
> feda1000-feda1fff : pnp 00:04
> fee00000-fee00fff : Local APIC
>   fee00000-fee00fff : Reserved
> ff000000-ffffffff : Reserved
>   ff000000-ffffffff : pnp 00:05
> 100000000-4983fffff : System RAM
> 498400000-49bffffff : RAM buffer
> 4000000000-7fffffffff : PCI Bus 0000:00
>   4000000000-400fffffff : 0000:00:02.0
>   4010000000-4010000fff : 0000:00:15.0
>     4010000000-40100001ff : lpss_dev
>       4010000000-40100001ff : i2c_designware.0 lpss_dev
>     4010000200-40100002ff : lpss_priv
>     4010000800-4010000fff : idma64.0
>       4010000800-4010000fff : idma64.0 idma64.0
>   4010001000-4010001fff : 0000:00:15.1
>     4010001000-40100011ff : lpss_dev
>       4010001000-40100011ff : i2c_designware.1 lpss_dev
>     4010001200-40100012ff : lpss_priv
>     4010001800-4010001fff : idma64.1
>       4010001800-4010001fff : idma64.1 idma64.1
>   6000000000-601bffffff : PCI Bus 0000:2c
>     6000000000-60000fffff : PCI Bus 0000:2d
>       6000000000-60000fffff : PCI Bus 0000:2f
>         6000000000-600000ffff : 0000:2f:00.0
>           6000000000-600000ffff : tg3
>         6000010000-600001ffff : 0000:2f:00.0
>           6000010000-600001ffff : tg3
>   6020000000-603bffffff : PCI Bus 0000:01
>   603c000000-603cffffff : 0000:00:02.0
>   603d000000-603d0fffff : 0000:00:1f.3
>     603d000000-603d0fffff : Audio DSP
>   603d100000-603d13ffff : 0000:00:0d.2
>     603d100000-603d13ffff : thunderbolt
>   603d140000-603d14ffff : 0000:00:14.0
>     603d140000-603d14ffff : xhci-hcd
>   603d150000-603d15ffff : 0000:00:0d.0
>     603d150000-603d15ffff : xhci-hcd
>   603d160000-603d16ffff : 0000:00:04.0
>   603d170000-603d173fff : 0000:00:1f.3
>     603d170000-603d173fff : Audio DSP
>   603d174000-603d177fff : 0000:00:14.3
>     603d174000-603d177fff : iwlwifi
>   603d178000-603d179fff : 0000:00:14.2
>   603d17a000-603d17bfff : 0000:00:12.0
>     603d17a000-603d17bfff : intel_ish_ipc
>   603d17c000-603d17c0ff : 0000:00:1f.4
>   603d17d000-603d17dfff : 0000:00:16.0
>     603d17d000-603d17dfff : mei_me
>   603d180000-603d180fff : 0000:00:14.2
>   603d181000-603d181fff : 0000:00:0d.2

> -[0000:00]-+-00.0  Intel Corporation Device [8086:8a12]
>            +-02.0  Intel Corporation Iris Plus Graphics G7 [8086:8a52]
>            +-04.0  Intel Corporation Device [8086:8a03]
>            +-07.0-[01-2b]--
>            +-07.1-[2c-56]----00.0-[2d-32]--+-00.0-[2e]----00.0  ASMedia Technology Inc. ASM1042A USB 3.0 Host Controller [1b21:1142]
>            |                               +-01.0-[2f]----00.0  Broadcom Inc. and subsidiaries NetXtreme BCM57762 Gigabit Ethernet PCIe [14e4:1682]
>            |                               +-02.0-[30]--
>            |                               +-03.0-[31]--
>            |                               \-04.0-[32]--
>            +-0d.0  Intel Corporation Ice Lake Thunderbolt 3 USB Controller [8086:8a13]
>            +-0d.2  Intel Corporation Ice Lake Thunderbolt 3 NHI #0 [8086:8a17]
>            +-12.0  Intel Corporation Device [8086:34fc]
>            +-14.0  Intel Corporation Ice Lake-LP USB 3.1 xHCI Host Controller [8086:34ed]
>            +-14.2  Intel Corporation Device [8086:34ef]
>            +-14.3  Intel Corporation Killer Wi-Fi 6 AX1650i 160MHz Wireless Network Adapter (201NGW) [8086:34f0]
>            +-15.0  Intel Corporation Ice Lake-LP Serial IO I2C Controller #0 [8086:34e8]
>            +-15.1  Intel Corporation Ice Lake-LP Serial IO I2C Controller #1 [8086:34e9]
>            +-16.0  Intel Corporation Management Engine Interface [8086:34e0]
>            +-17.0  Intel Corporation 82801 Mobile SATA Controller [RAID mode] [8086:282a]
>            +-1c.0-[57]----00.0  Realtek Semiconductor Co., Ltd. RTS525A PCI Express Card Reader [10ec:525a]
>            +-1d.0-[58]----00.0  Samsung Electronics Co Ltd NVMe SSD Controller SM961/PM961 [144d:a804]
>            +-1f.0  Intel Corporation Ice Lake-LP LPC Controller [8086:3482]
>            +-1f.3  Intel Corporation Smart Sound Technology Audio Controller [8086:34c8]
>            +-1f.4  Intel Corporation Ice Lake-LP SMBus Controller [8086:34a3]
>            \-1f.5  Intel Corporation Ice Lake-LP SPI Controller [8086:34a4]

> 00000000-00000fff : Reserved
> 00001000-0009efff : System RAM
> 0009f000-000fffff : Reserved
>   000a0000-000bffff : PCI Bus 0000:00
>   000f0000-000fffff : System ROM
> 00100000-4e7bbfff : System RAM
>   03000000-03e01742 : Kernel code
>   04000000-044d8fff : Kernel rodata
>   04600000-0480917f : Kernel data
>   04db5000-04ffffff : Kernel bss
> 4e7bc000-4e81cfff : Reserved
> 4e81d000-506befff : System RAM
> 506bf000-506bffff : Reserved
> 506c0000-53005fff : System RAM
> 53006000-53006fff : ACPI Non-volatile Storage
> 53007000-5302cfff : System RAM
> 5302d000-5302dfff : Reserved
> 5302e000-578c9fff : System RAM
> 578ca000-58716fff : Reserved
> 58717000-587b4fff : ACPI Tables
> 587b5000-5886ffff : ACPI Non-volatile Storage
>   587de000-587defff : USBC000:00
> 58870000-5df40fff : Reserved
> 5df41000-5dffefff : Unknown E820 type
> 5dfff000-5dffffff : System RAM
> 5e000000-61ffffff : Reserved
> 62e00000-67bfffff : Reserved
>   64000000-67bfffff : Graphics Stolen Memory
> 67c00000-bfffffff : PCI Bus 0000:00
>   67c00000-67c00fff : 0000:00:1f.5
>   68000000-741fffff : PCI Bus 0000:2c
>   76000000-821fffff : PCI Bus 0000:01
>   82200000-822fffff : PCI Bus 0000:58
>     82200000-82203fff : 0000:58:00.0
>       82200000-82203fff : nvme
>   82300000-823fffff : PCI Bus 0000:57
>     82300000-82300fff : 0000:57:00.0
>       82300000-82300fff : rtsx_pci
>   82400000-82401fff : 0000:00:17.0
>     82400000-82401fff : ahci
>   82402000-824027ff : 0000:00:17.0
>     82402000-824027ff : ahci
>   82403000-824030ff : 0000:00:17.0
>     82403000-824030ff : ahci
> c0000000-cfffffff : PCI MMCONFIG 0000 [bus 00-ff]
>   c0000000-cfffffff : Reserved
>     c0000000-cfffffff : pnp 00:04
> fd000000-fd68ffff : pnp 00:05
> fd6b0000-fd6cffff : pnp 00:05
> fd6f0000-fdffffff : pnp 00:05
> fe000000-fe010fff : Reserved
> fe038000-fe038fff : pnp 00:07
> fe200000-fe7fffff : pnp 00:05
> fec00000-fec00fff : Reserved
>   fec00000-fec003ff : IOAPIC 0
> fed00000-fed00fff : Reserved
>   fed00000-fed003ff : HPET 0
>     fed00000-fed003ff : PNP0103:00
> fed10000-fed17fff : pnp 00:04
> fed20000-fed7ffff : Reserved
>   fed40000-fed44fff : MSFT0101:00
>     fed40000-fed44fff : MSFT0101:00 MSFT0101:00
> fed90000-fed93fff : pnp 00:04
> feda0000-feda0fff : pnp 00:04
> feda1000-feda1fff : pnp 00:04
> fee00000-fee00fff : Local APIC
>   fee00000-fee00fff : Reserved
> ff000000-ffffffff : Reserved
>   ff000000-ffffffff : pnp 00:05
> 100000000-4983fffff : System RAM
> 498400000-49bffffff : RAM buffer
> 4000000000-7fffffffff : PCI Bus 0000:00
>   4000000000-400fffffff : 0000:00:02.0
>   4010000000-4010000fff : 0000:00:15.0
>     4010000000-40100001ff : lpss_dev
>       4010000000-40100001ff : i2c_designware.0 lpss_dev
>     4010000200-40100002ff : lpss_priv
>     4010000800-4010000fff : idma64.0
>       4010000800-4010000fff : idma64.0 idma64.0
>   4010001000-4010001fff : 0000:00:15.1
>     4010001000-40100011ff : lpss_dev
>       4010001000-40100011ff : i2c_designware.1 lpss_dev
>     4010001200-40100012ff : lpss_priv
>     4010001800-4010001fff : idma64.1
>       4010001800-4010001fff : idma64.1 idma64.1
>   6000000000-601bffffff : PCI Bus 0000:2c
>   6020000000-603bffffff : PCI Bus 0000:01
>   603c000000-603cffffff : 0000:00:02.0
>   603d000000-603d0fffff : 0000:00:1f.3
>     603d000000-603d0fffff : Audio DSP
>   603d100000-603d13ffff : 0000:00:0d.2
>     603d100000-603d13ffff : thunderbolt
>   603d140000-603d14ffff : 0000:00:14.0
>     603d140000-603d14ffff : xhci-hcd
>   603d150000-603d15ffff : 0000:00:0d.0
>     603d150000-603d15ffff : xhci-hcd
>   603d160000-603d16ffff : 0000:00:04.0
>   603d170000-603d173fff : 0000:00:1f.3
>     603d170000-603d173fff : Audio DSP
>   603d174000-603d177fff : 0000:00:14.3
>     603d174000-603d177fff : iwlwifi
>   603d178000-603d179fff : 0000:00:14.2
>   603d17a000-603d17bfff : 0000:00:12.0
>     603d17a000-603d17bfff : intel_ish_ipc
>   603d17c000-603d17c0ff : 0000:00:1f.4
>   603d17d000-603d17dfff : 0000:00:16.0
>     603d17d000-603d17dfff : mei_me
>   603d180000-603d180fff : 0000:00:14.2
>   603d181000-603d181fff : 0000:00:0d.2

> -[0000:00]-+-00.0  Intel Corporation Device [8086:8a12]
>            +-02.0  Intel Corporation Iris Plus Graphics G7 [8086:8a52]
>            +-04.0  Intel Corporation Device [8086:8a03]
>            +-07.0-[01-2b]--
>            +-07.1-[2c-56]--
>            +-0d.0  Intel Corporation Ice Lake Thunderbolt 3 USB Controller [8086:8a13]
>            +-0d.2  Intel Corporation Ice Lake Thunderbolt 3 NHI #0 [8086:8a17]
>            +-12.0  Intel Corporation Device [8086:34fc]
>            +-14.0  Intel Corporation Ice Lake-LP USB 3.1 xHCI Host Controller [8086:34ed]
>            +-14.2  Intel Corporation Device [8086:34ef]
>            +-14.3  Intel Corporation Killer Wi-Fi 6 AX1650i 160MHz Wireless Network Adapter (201NGW) [8086:34f0]
>            +-15.0  Intel Corporation Ice Lake-LP Serial IO I2C Controller #0 [8086:34e8]
>            +-15.1  Intel Corporation Ice Lake-LP Serial IO I2C Controller #1 [8086:34e9]
>            +-16.0  Intel Corporation Management Engine Interface [8086:34e0]
>            +-17.0  Intel Corporation 82801 Mobile SATA Controller [RAID mode] [8086:282a]
>            +-1c.0-[57]----00.0  Realtek Semiconductor Co., Ltd. RTS525A PCI Express Card Reader [10ec:525a]
>            +-1d.0-[58]----00.0  Samsung Electronics Co Ltd NVMe SSD Controller SM961/PM961 [144d:a804]
>            +-1f.0  Intel Corporation Ice Lake-LP LPC Controller [8086:3482]
>            +-1f.3  Intel Corporation Smart Sound Technology Audio Controller [8086:34c8]
>            +-1f.4  Intel Corporation Ice Lake-LP SMBus Controller [8086:34a3]
>            \-1f.5  Intel Corporation Ice Lake-LP SPI Controller [8086:34a4]

> 00000000-00000fff : Reserved
> 00001000-0009efff : System RAM
> 0009f000-000fffff : Reserved
>   000a0000-000bffff : PCI Bus 0000:00
>   000f0000-000fffff : System ROM
> 00100000-4e7bbfff : System RAM
>   03000000-03e01742 : Kernel code
>   04000000-044d8fff : Kernel rodata
>   04600000-0480917f : Kernel data
>   04db5000-04ffffff : Kernel bss
> 4e7bc000-4e81cfff : Reserved
> 4e81d000-506befff : System RAM
> 506bf000-506bffff : Reserved
> 506c0000-53005fff : System RAM
> 53006000-53006fff : ACPI Non-volatile Storage
> 53007000-5302cfff : System RAM
> 5302d000-5302dfff : Reserved
> 5302e000-578c9fff : System RAM
> 578ca000-58716fff : Reserved
> 58717000-587b4fff : ACPI Tables
> 587b5000-5886ffff : ACPI Non-volatile Storage
>   587de000-587defff : USBC000:00
> 58870000-5df40fff : Reserved
> 5df41000-5dffefff : Unknown E820 type
> 5dfff000-5dffffff : System RAM
> 5e000000-61ffffff : Reserved
> 62e00000-67bfffff : Reserved
>   64000000-67bfffff : Graphics Stolen Memory
> 67c00000-bfffffff : PCI Bus 0000:00
>   67c00000-67c00fff : 0000:00:1f.5
>   68000000-741fffff : PCI Bus 0000:2c
>     68000000-741fffff : PCI Bus 0000:2d
>       68000000-680fffff : PCI Bus 0000:2e
>         68000000-68007fff : 0000:2e:00.0
>       68100000-681fffff : PCI Bus 0000:2f
>       68200000-682fffff : PCI Bus 0000:30
>       68300000-683fffff : PCI Bus 0000:31
>       68400000-741fffff : PCI Bus 0000:32
>   76000000-821fffff : PCI Bus 0000:01
>   82200000-822fffff : PCI Bus 0000:58
>     82200000-82203fff : 0000:58:00.0
>       82200000-82203fff : nvme
>   82300000-823fffff : PCI Bus 0000:57
>     82300000-82300fff : 0000:57:00.0
>       82300000-82300fff : rtsx_pci
>   82400000-82401fff : 0000:00:17.0
>     82400000-82401fff : ahci
>   82402000-824027ff : 0000:00:17.0
>     82402000-824027ff : ahci
>   82403000-824030ff : 0000:00:17.0
>     82403000-824030ff : ahci
> c0000000-cfffffff : PCI MMCONFIG 0000 [bus 00-ff]
>   c0000000-cfffffff : Reserved
>     c0000000-cfffffff : pnp 00:04
> fd000000-fd68ffff : pnp 00:05
> fd6b0000-fd6cffff : pnp 00:05
> fd6f0000-fdffffff : pnp 00:05
> fe000000-fe010fff : Reserved
> fe038000-fe038fff : pnp 00:07
> fe200000-fe7fffff : pnp 00:05
> fec00000-fec00fff : Reserved
>   fec00000-fec003ff : IOAPIC 0
> fed00000-fed00fff : Reserved
>   fed00000-fed003ff : HPET 0
>     fed00000-fed003ff : PNP0103:00
> fed10000-fed17fff : pnp 00:04
> fed20000-fed7ffff : Reserved
>   fed40000-fed44fff : MSFT0101:00
>     fed40000-fed44fff : MSFT0101:00 MSFT0101:00
> fed90000-fed93fff : pnp 00:04
> feda0000-feda0fff : pnp 00:04
> feda1000-feda1fff : pnp 00:04
> fee00000-fee00fff : Local APIC
>   fee00000-fee00fff : Reserved
> ff000000-ffffffff : Reserved
>   ff000000-ffffffff : pnp 00:05
> 100000000-4983fffff : System RAM
> 498400000-49bffffff : RAM buffer
> 4000000000-7fffffffff : PCI Bus 0000:00
>   4000000000-400fffffff : 0000:00:02.0
>   4010000000-4010000fff : 0000:00:15.0
>     4010000000-40100001ff : lpss_dev
>       4010000000-40100001ff : i2c_designware.0 lpss_dev
>     4010000200-40100002ff : lpss_priv
>     4010000800-4010000fff : idma64.0
>       4010000800-4010000fff : idma64.0 idma64.0
>   4010001000-4010001fff : 0000:00:15.1
>     4010001000-40100011ff : lpss_dev
>       4010001000-40100011ff : i2c_designware.1 lpss_dev
>     4010001200-40100012ff : lpss_priv
>     4010001800-4010001fff : idma64.1
>       4010001800-4010001fff : idma64.1 idma64.1
>   6000000000-601bffffff : PCI Bus 0000:2c
>     6000000000-601bffffff : PCI Bus 0000:2d
>       6000000000-60000fffff : PCI Bus 0000:2e
>       6000100000-60001fffff : PCI Bus 0000:2f
>         6000100000-600010ffff : 0000:2f:00.0
>         6000110000-600011ffff : 0000:2f:00.0
>       6000200000-60002fffff : PCI Bus 0000:30
>       6000300000-60003fffff : PCI Bus 0000:31
>       6000400000-601bffffff : PCI Bus 0000:32
>   6020000000-603bffffff : PCI Bus 0000:01
>   603c000000-603cffffff : 0000:00:02.0
>   603d000000-603d0fffff : 0000:00:1f.3
>     603d000000-603d0fffff : Audio DSP
>   603d100000-603d13ffff : 0000:00:0d.2
>     603d100000-603d13ffff : thunderbolt
>   603d140000-603d14ffff : 0000:00:14.0
>     603d140000-603d14ffff : xhci-hcd
>   603d150000-603d15ffff : 0000:00:0d.0
>     603d150000-603d15ffff : xhci-hcd
>   603d160000-603d16ffff : 0000:00:04.0
>   603d170000-603d173fff : 0000:00:1f.3
>     603d170000-603d173fff : Audio DSP
>   603d174000-603d177fff : 0000:00:14.3
>     603d174000-603d177fff : iwlwifi
>   603d178000-603d179fff : 0000:00:14.2
>   603d17a000-603d17bfff : 0000:00:12.0
>     603d17a000-603d17bfff : intel_ish_ipc
>   603d17c000-603d17c0ff : 0000:00:1f.4
>   603d17d000-603d17dfff : 0000:00:16.0
>     603d17d000-603d17dfff : mei_me
>   603d180000-603d180fff : 0000:00:14.2
>   603d181000-603d181fff : 0000:00:0d.2

> -[0000:00]-+-00.0  Intel Corporation Device [8086:8a12]
>            +-02.0  Intel Corporation Iris Plus Graphics G7 [8086:8a52]
>            +-04.0  Intel Corporation Device [8086:8a03]
>            +-07.0-[01-2b]--
>            +-07.1-[2c-56]----00.0-[2d-56]--+-00.0-[2e]----00.0  ASMedia Technology Inc. ASM1042A USB 3.0 Host Controller [1b21:1142]
>            |                               +-01.0-[2f]----00.0  Broadcom Inc. and subsidiaries NetXtreme BCM57762 Gigabit Ethernet PCIe [14e4:1682]
>            |                               +-02.0-[30]--
>            |                               +-03.0-[31]--
>            |                               \-04.0-[32-56]--
>            +-0d.0  Intel Corporation Ice Lake Thunderbolt 3 USB Controller [8086:8a13]
>            +-0d.2  Intel Corporation Ice Lake Thunderbolt 3 NHI #0 [8086:8a17]
>            +-12.0  Intel Corporation Device [8086:34fc]
>            +-14.0  Intel Corporation Ice Lake-LP USB 3.1 xHCI Host Controller [8086:34ed]
>            +-14.2  Intel Corporation Device [8086:34ef]
>            +-14.3  Intel Corporation Killer Wi-Fi 6 AX1650i 160MHz Wireless Network Adapter (201NGW) [8086:34f0]
>            +-15.0  Intel Corporation Ice Lake-LP Serial IO I2C Controller #0 [8086:34e8]
>            +-15.1  Intel Corporation Ice Lake-LP Serial IO I2C Controller #1 [8086:34e9]
>            +-16.0  Intel Corporation Management Engine Interface [8086:34e0]
>            +-17.0  Intel Corporation 82801 Mobile SATA Controller [RAID mode] [8086:282a]
>            +-1c.0-[57]----00.0  Realtek Semiconductor Co., Ltd. RTS525A PCI Express Card Reader [10ec:525a]
>            +-1d.0-[58]----00.0  Samsung Electronics Co Ltd NVMe SSD Controller SM961/PM961 [144d:a804]
>            +-1f.0  Intel Corporation Ice Lake-LP LPC Controller [8086:3482]
>            +-1f.3  Intel Corporation Smart Sound Technology Audio Controller [8086:34c8]
>            +-1f.4  Intel Corporation Ice Lake-LP SMBus Controller [8086:34a3]
>            \-1f.5  Intel Corporation Ice Lake-LP SPI Controller [8086:34a4]





