Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30CFE233DBA
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jul 2020 05:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731304AbgGaDga (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 23:36:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730820AbgGaDg3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jul 2020 23:36:29 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27CD6C061574
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2020 20:36:29 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id g19so3551586plq.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2020 20:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=yu/vIChWVCmy1ZXzI5eIY41pc451ZGuS6S551qgtnGg=;
        b=gLviEtmGcG4fcysgJvJgg3If9PeV6FBLHYoXKwfOd8Aw3y+Yynk8IyMTZeY3Aal+Hv
         L3hYnjz9DpH5XQNZiAxx+abIXS256U0C+/WKtupnxWwpiOzftssdBFqLMjVKrpWqmQ8c
         ZTw0QcFKgK+lbs8utlgvq36FLD6F3vI83py8xGGw3BiYfvmH4AuQMxKvLBHvPy6asM4D
         p3f13fWhAbPHnQPhoFqxnp7exxsjs9QqVPs3HWA+W3uoFyETp1hZryUHGr0f/e4XaGwj
         PDcTRSoHuhk6WQaQGp+kFq5IswspaCely61f18qbnwHL4pg9Gu3qqzNoIgW3vhSxMi5d
         3M/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=yu/vIChWVCmy1ZXzI5eIY41pc451ZGuS6S551qgtnGg=;
        b=Bh8EoBHyNryo1JpTdN/bXXLQIg/Ppy53vMmWwXwBTX4GhDuhozlP8wFSKerUCgJB6L
         NCqfSh2AzFua3y/ZQ1wnzp4fviMclhJCuW+xqfEE/EPi3RBlAXXqbnv+NRn3cii+f3mZ
         wJYa6LQFD4q9P8KyAjsjWKFH4yXWKQasjnbGElTZcO54VMBlHjG6OGOMFfa82xDaLMz3
         UfVqzMq3NjyBKXGfkJ4AAMtHb4jyQU9p1nDk74t+z0217PfTKPeNLBeZ2hrLp0mJDK9+
         YkdOF+8DPIO86HijJ27kzmYXyoN9+IAGPSGVgF7Zy9klU54sFpZBC0Z7GbQMnjNlVrQj
         0GUA==
X-Gm-Message-State: AOAM533lUD2vKZz8x5+G6L+Cfv6uOLOw3xgQk7yC1Be+KKzHchi5NuL/
        YEKJiH/w+GcFHJixdojEYBA=
X-Google-Smtp-Source: ABdhPJw0CaxUMaGiLRuZfEb8GXwhAQZr0ftusvPq6RX71g9xTTbef/ST4+jHy/VEC+loZQ2oEkn/DA==
X-Received: by 2002:a17:90a:3183:: with SMTP id j3mr2177532pjb.158.1596166588477;
        Thu, 30 Jul 2020 20:36:28 -0700 (PDT)
Received: from localhost ([108.161.26.224])
        by smtp.gmail.com with ESMTPSA id s4sm7876008pfh.128.2020.07.30.20.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 20:36:26 -0700 (PDT)
Date:   Thu, 30 Jul 2020 20:36:20 -0700
From:   Matt Turner <mattst88@gmail.com>
To:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Thunderbolt hotplug fails on HP x360 13t-aw000/86FA with HP
 Thunderbolt 3 Dock
Message-ID: <20200731033620.GA4428@hp-x360.mattst88.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--yEPQxsgoJgBvi8ip
Content-Type: multipart/mixed; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Looking for support or debugging suggestions to figure out why my HP
Spectre x360 (Icelake) laptop doesn't successfully hotplug with an HP
Thunderbolt 3 dock. I'm using 5.8.0-rc7-next-20200729. The dock's
firmwares have been updated from a system running Windows. The HP laptop
is using the latest BIOS as of last week, and nvm_version is "80.0":

% cat /sys/devices/pci0000:00/0000:00:0d.2/domain0/0-0/nvm_version=20
80.0

Cold booting the system with the dock attached provides working
ethernet, USB hub, etc. Unplugging and replugging the dock does not
work, leaving it only providing power.

Attached are dmesg, lspci -vvnnt output, and /proc/iomem captured (1) at
coldboot with the dock attached, (2) after unplugging the dock, and (3)
after hotplugging the dock; and my kernel .config.

For search engines, the most apparent failure in dmesg is:

xhci_hcd 0000:2e:00.0: enabling device (0000 -> 0002)
xhci_hcd 0000:2e:00.0: xHCI Host Controller
xhci_hcd 0000:2e:00.0: new USB bus registered, assigned bus number 5
xhci_hcd 0000:2e:00.0: Host halt failed, -19
xhci_hcd 0000:2e:00.0: can't setup: -19
xhci_hcd 0000:2e:00.0: USB bus 5 deregistered
xhci_hcd 0000:2e:00.0: init 0000:2e:00.0 fail, -19
tg3 0000:2f:00.0: enabling device (0000 -> 0002)
tg3 0000:2f:00.0: phy probe failed, err -19
tg3 0000:2f:00.0: Problem fetching invariants of chip, aborting

Help? Thanks!
Matt

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=coldplugged-iomem

00000000-00000fff : Reserved
00001000-0009efff : System RAM
0009f000-000fffff : Reserved
  000a0000-000bffff : PCI Bus 0000:00
  000f0000-000fffff : System ROM
00100000-4e7bbfff : System RAM
  03000000-03e01742 : Kernel code
  04000000-044d8fff : Kernel rodata
  04600000-0480917f : Kernel data
  04db5000-04ffffff : Kernel bss
4e7bc000-4e81cfff : Reserved
4e81d000-506befff : System RAM
506bf000-506bffff : Reserved
506c0000-53005fff : System RAM
53006000-53006fff : ACPI Non-volatile Storage
53007000-5302cfff : System RAM
5302d000-5302dfff : Reserved
5302e000-578c9fff : System RAM
578ca000-58716fff : Reserved
58717000-587b4fff : ACPI Tables
587b5000-5886ffff : ACPI Non-volatile Storage
  587de000-587defff : USBC000:00
58870000-5df40fff : Reserved
5df41000-5dffefff : Unknown E820 type
5dfff000-5dffffff : System RAM
5e000000-61ffffff : Reserved
62e00000-67bfffff : Reserved
  64000000-67bfffff : Graphics Stolen Memory
67c00000-bfffffff : PCI Bus 0000:00
  67c00000-67c00fff : 0000:00:1f.5
  68000000-741fffff : PCI Bus 0000:2c
    68000000-680fffff : PCI Bus 0000:2d
      68000000-680fffff : PCI Bus 0000:2e
        68000000-68007fff : 0000:2e:00.0
          68000000-68007fff : xhci-hcd
  76000000-821fffff : PCI Bus 0000:01
  82200000-822fffff : PCI Bus 0000:58
    82200000-82203fff : 0000:58:00.0
      82200000-82203fff : nvme
  82300000-823fffff : PCI Bus 0000:57
    82300000-82300fff : 0000:57:00.0
      82300000-82300fff : rtsx_pci
  82400000-82401fff : 0000:00:17.0
    82400000-82401fff : ahci
  82402000-824027ff : 0000:00:17.0
    82402000-824027ff : ahci
  82403000-824030ff : 0000:00:17.0
    82403000-824030ff : ahci
c0000000-cfffffff : PCI MMCONFIG 0000 [bus 00-ff]
  c0000000-cfffffff : Reserved
    c0000000-cfffffff : pnp 00:04
fd000000-fd68ffff : pnp 00:05
fd6b0000-fd6cffff : pnp 00:05
fd6f0000-fdffffff : pnp 00:05
fe000000-fe010fff : Reserved
fe038000-fe038fff : pnp 00:07
fe200000-fe7fffff : pnp 00:05
fec00000-fec00fff : Reserved
  fec00000-fec003ff : IOAPIC 0
fed00000-fed00fff : Reserved
  fed00000-fed003ff : HPET 0
    fed00000-fed003ff : PNP0103:00
fed10000-fed17fff : pnp 00:04
fed20000-fed7ffff : Reserved
  fed40000-fed44fff : MSFT0101:00
    fed40000-fed44fff : MSFT0101:00 MSFT0101:00
fed90000-fed93fff : pnp 00:04
feda0000-feda0fff : pnp 00:04
feda1000-feda1fff : pnp 00:04
fee00000-fee00fff : Local APIC
  fee00000-fee00fff : Reserved
ff000000-ffffffff : Reserved
  ff000000-ffffffff : pnp 00:05
100000000-4983fffff : System RAM
498400000-49bffffff : RAM buffer
4000000000-7fffffffff : PCI Bus 0000:00
  4000000000-400fffffff : 0000:00:02.0
  4010000000-4010000fff : 0000:00:15.0
    4010000000-40100001ff : lpss_dev
      4010000000-40100001ff : i2c_designware.0 lpss_dev
    4010000200-40100002ff : lpss_priv
    4010000800-4010000fff : idma64.0
      4010000800-4010000fff : idma64.0 idma64.0
  4010001000-4010001fff : 0000:00:15.1
    4010001000-40100011ff : lpss_dev
      4010001000-40100011ff : i2c_designware.1 lpss_dev
    4010001200-40100012ff : lpss_priv
    4010001800-4010001fff : idma64.1
      4010001800-4010001fff : idma64.1 idma64.1
  6000000000-601bffffff : PCI Bus 0000:2c
    6000000000-60000fffff : PCI Bus 0000:2d
      6000000000-60000fffff : PCI Bus 0000:2f
        6000000000-600000ffff : 0000:2f:00.0
          6000000000-600000ffff : tg3
        6000010000-600001ffff : 0000:2f:00.0
          6000010000-600001ffff : tg3
  6020000000-603bffffff : PCI Bus 0000:01
  603c000000-603cffffff : 0000:00:02.0
  603d000000-603d0fffff : 0000:00:1f.3
    603d000000-603d0fffff : Audio DSP
  603d100000-603d13ffff : 0000:00:0d.2
    603d100000-603d13ffff : thunderbolt
  603d140000-603d14ffff : 0000:00:14.0
    603d140000-603d14ffff : xhci-hcd
  603d150000-603d15ffff : 0000:00:0d.0
    603d150000-603d15ffff : xhci-hcd
  603d160000-603d16ffff : 0000:00:04.0
  603d170000-603d173fff : 0000:00:1f.3
    603d170000-603d173fff : Audio DSP
  603d174000-603d177fff : 0000:00:14.3
    603d174000-603d177fff : iwlwifi
  603d178000-603d179fff : 0000:00:14.2
  603d17a000-603d17bfff : 0000:00:12.0
    603d17a000-603d17bfff : intel_ish_ipc
  603d17c000-603d17c0ff : 0000:00:1f.4
  603d17d000-603d17dfff : 0000:00:16.0
    603d17d000-603d17dfff : mei_me
  603d180000-603d180fff : 0000:00:14.2
  603d181000-603d181fff : 0000:00:0d.2

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=coldplugged-lspci

-[0000:00]-+-00.0  Intel Corporation Device [8086:8a12]
           +-02.0  Intel Corporation Iris Plus Graphics G7 [8086:8a52]
           +-04.0  Intel Corporation Device [8086:8a03]
           +-07.0-[01-2b]--
           +-07.1-[2c-56]----00.0-[2d-32]--+-00.0-[2e]----00.0  ASMedia Technology Inc. ASM1042A USB 3.0 Host Controller [1b21:1142]
           |                               +-01.0-[2f]----00.0  Broadcom Inc. and subsidiaries NetXtreme BCM57762 Gigabit Ethernet PCIe [14e4:1682]
           |                               +-02.0-[30]--
           |                               +-03.0-[31]--
           |                               \-04.0-[32]--
           +-0d.0  Intel Corporation Ice Lake Thunderbolt 3 USB Controller [8086:8a13]
           +-0d.2  Intel Corporation Ice Lake Thunderbolt 3 NHI #0 [8086:8a17]
           +-12.0  Intel Corporation Device [8086:34fc]
           +-14.0  Intel Corporation Ice Lake-LP USB 3.1 xHCI Host Controller [8086:34ed]
           +-14.2  Intel Corporation Device [8086:34ef]
           +-14.3  Intel Corporation Killer Wi-Fi 6 AX1650i 160MHz Wireless Network Adapter (201NGW) [8086:34f0]
           +-15.0  Intel Corporation Ice Lake-LP Serial IO I2C Controller #0 [8086:34e8]
           +-15.1  Intel Corporation Ice Lake-LP Serial IO I2C Controller #1 [8086:34e9]
           +-16.0  Intel Corporation Management Engine Interface [8086:34e0]
           +-17.0  Intel Corporation 82801 Mobile SATA Controller [RAID mode] [8086:282a]
           +-1c.0-[57]----00.0  Realtek Semiconductor Co., Ltd. RTS525A PCI Express Card Reader [10ec:525a]
           +-1d.0-[58]----00.0  Samsung Electronics Co Ltd NVMe SSD Controller SM961/PM961 [144d:a804]
           +-1f.0  Intel Corporation Ice Lake-LP LPC Controller [8086:3482]
           +-1f.3  Intel Corporation Smart Sound Technology Audio Controller [8086:34c8]
           +-1f.4  Intel Corporation Ice Lake-LP SMBus Controller [8086:34a3]
           \-1f.5  Intel Corporation Ice Lake-LP SPI Controller [8086:34a4]

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=unplugged-iomem

00000000-00000fff : Reserved
00001000-0009efff : System RAM
0009f000-000fffff : Reserved
  000a0000-000bffff : PCI Bus 0000:00
  000f0000-000fffff : System ROM
00100000-4e7bbfff : System RAM
  03000000-03e01742 : Kernel code
  04000000-044d8fff : Kernel rodata
  04600000-0480917f : Kernel data
  04db5000-04ffffff : Kernel bss
4e7bc000-4e81cfff : Reserved
4e81d000-506befff : System RAM
506bf000-506bffff : Reserved
506c0000-53005fff : System RAM
53006000-53006fff : ACPI Non-volatile Storage
53007000-5302cfff : System RAM
5302d000-5302dfff : Reserved
5302e000-578c9fff : System RAM
578ca000-58716fff : Reserved
58717000-587b4fff : ACPI Tables
587b5000-5886ffff : ACPI Non-volatile Storage
  587de000-587defff : USBC000:00
58870000-5df40fff : Reserved
5df41000-5dffefff : Unknown E820 type
5dfff000-5dffffff : System RAM
5e000000-61ffffff : Reserved
62e00000-67bfffff : Reserved
  64000000-67bfffff : Graphics Stolen Memory
67c00000-bfffffff : PCI Bus 0000:00
  67c00000-67c00fff : 0000:00:1f.5
  68000000-741fffff : PCI Bus 0000:2c
  76000000-821fffff : PCI Bus 0000:01
  82200000-822fffff : PCI Bus 0000:58
    82200000-82203fff : 0000:58:00.0
      82200000-82203fff : nvme
  82300000-823fffff : PCI Bus 0000:57
    82300000-82300fff : 0000:57:00.0
      82300000-82300fff : rtsx_pci
  82400000-82401fff : 0000:00:17.0
    82400000-82401fff : ahci
  82402000-824027ff : 0000:00:17.0
    82402000-824027ff : ahci
  82403000-824030ff : 0000:00:17.0
    82403000-824030ff : ahci
c0000000-cfffffff : PCI MMCONFIG 0000 [bus 00-ff]
  c0000000-cfffffff : Reserved
    c0000000-cfffffff : pnp 00:04
fd000000-fd68ffff : pnp 00:05
fd6b0000-fd6cffff : pnp 00:05
fd6f0000-fdffffff : pnp 00:05
fe000000-fe010fff : Reserved
fe038000-fe038fff : pnp 00:07
fe200000-fe7fffff : pnp 00:05
fec00000-fec00fff : Reserved
  fec00000-fec003ff : IOAPIC 0
fed00000-fed00fff : Reserved
  fed00000-fed003ff : HPET 0
    fed00000-fed003ff : PNP0103:00
fed10000-fed17fff : pnp 00:04
fed20000-fed7ffff : Reserved
  fed40000-fed44fff : MSFT0101:00
    fed40000-fed44fff : MSFT0101:00 MSFT0101:00
fed90000-fed93fff : pnp 00:04
feda0000-feda0fff : pnp 00:04
feda1000-feda1fff : pnp 00:04
fee00000-fee00fff : Local APIC
  fee00000-fee00fff : Reserved
ff000000-ffffffff : Reserved
  ff000000-ffffffff : pnp 00:05
100000000-4983fffff : System RAM
498400000-49bffffff : RAM buffer
4000000000-7fffffffff : PCI Bus 0000:00
  4000000000-400fffffff : 0000:00:02.0
  4010000000-4010000fff : 0000:00:15.0
    4010000000-40100001ff : lpss_dev
      4010000000-40100001ff : i2c_designware.0 lpss_dev
    4010000200-40100002ff : lpss_priv
    4010000800-4010000fff : idma64.0
      4010000800-4010000fff : idma64.0 idma64.0
  4010001000-4010001fff : 0000:00:15.1
    4010001000-40100011ff : lpss_dev
      4010001000-40100011ff : i2c_designware.1 lpss_dev
    4010001200-40100012ff : lpss_priv
    4010001800-4010001fff : idma64.1
      4010001800-4010001fff : idma64.1 idma64.1
  6000000000-601bffffff : PCI Bus 0000:2c
  6020000000-603bffffff : PCI Bus 0000:01
  603c000000-603cffffff : 0000:00:02.0
  603d000000-603d0fffff : 0000:00:1f.3
    603d000000-603d0fffff : Audio DSP
  603d100000-603d13ffff : 0000:00:0d.2
    603d100000-603d13ffff : thunderbolt
  603d140000-603d14ffff : 0000:00:14.0
    603d140000-603d14ffff : xhci-hcd
  603d150000-603d15ffff : 0000:00:0d.0
    603d150000-603d15ffff : xhci-hcd
  603d160000-603d16ffff : 0000:00:04.0
  603d170000-603d173fff : 0000:00:1f.3
    603d170000-603d173fff : Audio DSP
  603d174000-603d177fff : 0000:00:14.3
    603d174000-603d177fff : iwlwifi
  603d178000-603d179fff : 0000:00:14.2
  603d17a000-603d17bfff : 0000:00:12.0
    603d17a000-603d17bfff : intel_ish_ipc
  603d17c000-603d17c0ff : 0000:00:1f.4
  603d17d000-603d17dfff : 0000:00:16.0
    603d17d000-603d17dfff : mei_me
  603d180000-603d180fff : 0000:00:14.2
  603d181000-603d181fff : 0000:00:0d.2

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=unplugged-lspci

-[0000:00]-+-00.0  Intel Corporation Device [8086:8a12]
           +-02.0  Intel Corporation Iris Plus Graphics G7 [8086:8a52]
           +-04.0  Intel Corporation Device [8086:8a03]
           +-07.0-[01-2b]--
           +-07.1-[2c-56]--
           +-0d.0  Intel Corporation Ice Lake Thunderbolt 3 USB Controller [8086:8a13]
           +-0d.2  Intel Corporation Ice Lake Thunderbolt 3 NHI #0 [8086:8a17]
           +-12.0  Intel Corporation Device [8086:34fc]
           +-14.0  Intel Corporation Ice Lake-LP USB 3.1 xHCI Host Controller [8086:34ed]
           +-14.2  Intel Corporation Device [8086:34ef]
           +-14.3  Intel Corporation Killer Wi-Fi 6 AX1650i 160MHz Wireless Network Adapter (201NGW) [8086:34f0]
           +-15.0  Intel Corporation Ice Lake-LP Serial IO I2C Controller #0 [8086:34e8]
           +-15.1  Intel Corporation Ice Lake-LP Serial IO I2C Controller #1 [8086:34e9]
           +-16.0  Intel Corporation Management Engine Interface [8086:34e0]
           +-17.0  Intel Corporation 82801 Mobile SATA Controller [RAID mode] [8086:282a]
           +-1c.0-[57]----00.0  Realtek Semiconductor Co., Ltd. RTS525A PCI Express Card Reader [10ec:525a]
           +-1d.0-[58]----00.0  Samsung Electronics Co Ltd NVMe SSD Controller SM961/PM961 [144d:a804]
           +-1f.0  Intel Corporation Ice Lake-LP LPC Controller [8086:3482]
           +-1f.3  Intel Corporation Smart Sound Technology Audio Controller [8086:34c8]
           +-1f.4  Intel Corporation Ice Lake-LP SMBus Controller [8086:34a3]
           \-1f.5  Intel Corporation Ice Lake-LP SPI Controller [8086:34a4]

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=hotplugged-iomem

00000000-00000fff : Reserved
00001000-0009efff : System RAM
0009f000-000fffff : Reserved
  000a0000-000bffff : PCI Bus 0000:00
  000f0000-000fffff : System ROM
00100000-4e7bbfff : System RAM
  03000000-03e01742 : Kernel code
  04000000-044d8fff : Kernel rodata
  04600000-0480917f : Kernel data
  04db5000-04ffffff : Kernel bss
4e7bc000-4e81cfff : Reserved
4e81d000-506befff : System RAM
506bf000-506bffff : Reserved
506c0000-53005fff : System RAM
53006000-53006fff : ACPI Non-volatile Storage
53007000-5302cfff : System RAM
5302d000-5302dfff : Reserved
5302e000-578c9fff : System RAM
578ca000-58716fff : Reserved
58717000-587b4fff : ACPI Tables
587b5000-5886ffff : ACPI Non-volatile Storage
  587de000-587defff : USBC000:00
58870000-5df40fff : Reserved
5df41000-5dffefff : Unknown E820 type
5dfff000-5dffffff : System RAM
5e000000-61ffffff : Reserved
62e00000-67bfffff : Reserved
  64000000-67bfffff : Graphics Stolen Memory
67c00000-bfffffff : PCI Bus 0000:00
  67c00000-67c00fff : 0000:00:1f.5
  68000000-741fffff : PCI Bus 0000:2c
    68000000-741fffff : PCI Bus 0000:2d
      68000000-680fffff : PCI Bus 0000:2e
        68000000-68007fff : 0000:2e:00.0
      68100000-681fffff : PCI Bus 0000:2f
      68200000-682fffff : PCI Bus 0000:30
      68300000-683fffff : PCI Bus 0000:31
      68400000-741fffff : PCI Bus 0000:32
  76000000-821fffff : PCI Bus 0000:01
  82200000-822fffff : PCI Bus 0000:58
    82200000-82203fff : 0000:58:00.0
      82200000-82203fff : nvme
  82300000-823fffff : PCI Bus 0000:57
    82300000-82300fff : 0000:57:00.0
      82300000-82300fff : rtsx_pci
  82400000-82401fff : 0000:00:17.0
    82400000-82401fff : ahci
  82402000-824027ff : 0000:00:17.0
    82402000-824027ff : ahci
  82403000-824030ff : 0000:00:17.0
    82403000-824030ff : ahci
c0000000-cfffffff : PCI MMCONFIG 0000 [bus 00-ff]
  c0000000-cfffffff : Reserved
    c0000000-cfffffff : pnp 00:04
fd000000-fd68ffff : pnp 00:05
fd6b0000-fd6cffff : pnp 00:05
fd6f0000-fdffffff : pnp 00:05
fe000000-fe010fff : Reserved
fe038000-fe038fff : pnp 00:07
fe200000-fe7fffff : pnp 00:05
fec00000-fec00fff : Reserved
  fec00000-fec003ff : IOAPIC 0
fed00000-fed00fff : Reserved
  fed00000-fed003ff : HPET 0
    fed00000-fed003ff : PNP0103:00
fed10000-fed17fff : pnp 00:04
fed20000-fed7ffff : Reserved
  fed40000-fed44fff : MSFT0101:00
    fed40000-fed44fff : MSFT0101:00 MSFT0101:00
fed90000-fed93fff : pnp 00:04
feda0000-feda0fff : pnp 00:04
feda1000-feda1fff : pnp 00:04
fee00000-fee00fff : Local APIC
  fee00000-fee00fff : Reserved
ff000000-ffffffff : Reserved
  ff000000-ffffffff : pnp 00:05
100000000-4983fffff : System RAM
498400000-49bffffff : RAM buffer
4000000000-7fffffffff : PCI Bus 0000:00
  4000000000-400fffffff : 0000:00:02.0
  4010000000-4010000fff : 0000:00:15.0
    4010000000-40100001ff : lpss_dev
      4010000000-40100001ff : i2c_designware.0 lpss_dev
    4010000200-40100002ff : lpss_priv
    4010000800-4010000fff : idma64.0
      4010000800-4010000fff : idma64.0 idma64.0
  4010001000-4010001fff : 0000:00:15.1
    4010001000-40100011ff : lpss_dev
      4010001000-40100011ff : i2c_designware.1 lpss_dev
    4010001200-40100012ff : lpss_priv
    4010001800-4010001fff : idma64.1
      4010001800-4010001fff : idma64.1 idma64.1
  6000000000-601bffffff : PCI Bus 0000:2c
    6000000000-601bffffff : PCI Bus 0000:2d
      6000000000-60000fffff : PCI Bus 0000:2e
      6000100000-60001fffff : PCI Bus 0000:2f
        6000100000-600010ffff : 0000:2f:00.0
        6000110000-600011ffff : 0000:2f:00.0
      6000200000-60002fffff : PCI Bus 0000:30
      6000300000-60003fffff : PCI Bus 0000:31
      6000400000-601bffffff : PCI Bus 0000:32
  6020000000-603bffffff : PCI Bus 0000:01
  603c000000-603cffffff : 0000:00:02.0
  603d000000-603d0fffff : 0000:00:1f.3
    603d000000-603d0fffff : Audio DSP
  603d100000-603d13ffff : 0000:00:0d.2
    603d100000-603d13ffff : thunderbolt
  603d140000-603d14ffff : 0000:00:14.0
    603d140000-603d14ffff : xhci-hcd
  603d150000-603d15ffff : 0000:00:0d.0
    603d150000-603d15ffff : xhci-hcd
  603d160000-603d16ffff : 0000:00:04.0
  603d170000-603d173fff : 0000:00:1f.3
    603d170000-603d173fff : Audio DSP
  603d174000-603d177fff : 0000:00:14.3
    603d174000-603d177fff : iwlwifi
  603d178000-603d179fff : 0000:00:14.2
  603d17a000-603d17bfff : 0000:00:12.0
    603d17a000-603d17bfff : intel_ish_ipc
  603d17c000-603d17c0ff : 0000:00:1f.4
  603d17d000-603d17dfff : 0000:00:16.0
    603d17d000-603d17dfff : mei_me
  603d180000-603d180fff : 0000:00:14.2
  603d181000-603d181fff : 0000:00:0d.2

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=hotplugged-lspci

-[0000:00]-+-00.0  Intel Corporation Device [8086:8a12]
           +-02.0  Intel Corporation Iris Plus Graphics G7 [8086:8a52]
           +-04.0  Intel Corporation Device [8086:8a03]
           +-07.0-[01-2b]--
           +-07.1-[2c-56]----00.0-[2d-56]--+-00.0-[2e]----00.0  ASMedia Technology Inc. ASM1042A USB 3.0 Host Controller [1b21:1142]
           |                               +-01.0-[2f]----00.0  Broadcom Inc. and subsidiaries NetXtreme BCM57762 Gigabit Ethernet PCIe [14e4:1682]
           |                               +-02.0-[30]--
           |                               +-03.0-[31]--
           |                               \-04.0-[32-56]--
           +-0d.0  Intel Corporation Ice Lake Thunderbolt 3 USB Controller [8086:8a13]
           +-0d.2  Intel Corporation Ice Lake Thunderbolt 3 NHI #0 [8086:8a17]
           +-12.0  Intel Corporation Device [8086:34fc]
           +-14.0  Intel Corporation Ice Lake-LP USB 3.1 xHCI Host Controller [8086:34ed]
           +-14.2  Intel Corporation Device [8086:34ef]
           +-14.3  Intel Corporation Killer Wi-Fi 6 AX1650i 160MHz Wireless Network Adapter (201NGW) [8086:34f0]
           +-15.0  Intel Corporation Ice Lake-LP Serial IO I2C Controller #0 [8086:34e8]
           +-15.1  Intel Corporation Ice Lake-LP Serial IO I2C Controller #1 [8086:34e9]
           +-16.0  Intel Corporation Management Engine Interface [8086:34e0]
           +-17.0  Intel Corporation 82801 Mobile SATA Controller [RAID mode] [8086:282a]
           +-1c.0-[57]----00.0  Realtek Semiconductor Co., Ltd. RTS525A PCI Express Card Reader [10ec:525a]
           +-1d.0-[58]----00.0  Samsung Electronics Co Ltd NVMe SSD Controller SM961/PM961 [144d:a804]
           +-1f.0  Intel Corporation Ice Lake-LP LPC Controller [8086:3482]
           +-1f.3  Intel Corporation Smart Sound Technology Audio Controller [8086:34c8]
           +-1f.4  Intel Corporation Ice Lake-LP SMBus Controller [8086:34a3]
           \-1f.5  Intel Corporation Ice Lake-LP SPI Controller [8086:34a4]

--dDRMvlgZJXvWKvBx
Content-Type: application/x-bzip2
Content-Disposition: attachment; filename="thunderbolt-dmesg.tar.bz2"
Content-Transfer-Encoding: base64

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
roPYr9DvpqaZQ3djhSuCuiXbOCq9T6JqVxcJXxLm+Dqab061bMqYx+5lT6XY/Q+psrrY0/M0
T7GK0yf6GNPZOp+LKHYyjwVWkxiu2fvbNkXeyaYpqafBqmqfdUbTycG01OExjVV8ri02cJs2
Gm1OpivrmpWMVybCtJbMbPnm62SL6G862yq8CdbSt3Fqp1NmhqYxjUrTFfe+t906mrnZe9s2
ldzraS+R1P3u+V+6eU6K/7XyvveCvxqdqovJ7HerseMtHfOucqjyqbNCFlK2fNU0raVjvbz/
wpyfNU4OD6qnKmmKCXjs6uHC7MmGjSObRo8GFSbOUjd6XZ/W1j0bJOb0Rh7l3xZeb97tJq6u
qJUj8HVo3kSfsI+L2Orm83sdEnoU+CmX87xXZdzGntbvS2eh+hxp9DdXsfdvOuf/LpVXbiZi
cnSrVT5WOxzdrqcZ7weT9TH2tTHZ13ZMl8W2r7ayXzubU7XJWlWTkx8KfCTo7lO0/YRS7RJu
uy7o5MsPStEmkVMnFsz6ScHN2t3KdVJ8JXsdH0Sub1LtXlOrLk/+lRlUc32EftdmrM0HaSSe
a7ycHpdr2PZOp+2Y/3P90/m/dMaZKxWVasrWVmasaZWMWNK4zGJbMVcJ6nms+x4R1VEnpYd0
fTB3LDZ9bhs3Wcm8/dWV+enm5NqcnU/WqWnbKx+M/B3t5X2vsZO910+Li9FO2n/m/Bs7Wn5Z
zV5vwfgyn+5iu+Y739JDkycpj6amn7W1K3YgWn7WytnsoaB9c+52vkofncH2qd6TeLRzfB6V
4JTD6Xm5vzaSRl9DD8m5znhPS00xg9tPkdz3uU/sdj3T9Ff90vtV5ve9Mx1Kl7KHvdrpUrcd
rHN6pui7ZvPFjJs1PKafO9U2n6mldTzcn9rtbsmMm0x/Q9jHhPi7X8X1q/qV1PVPyujsU8Yp
ZT90cLtSKU8l4+EasP4RquiT3Pte1xfI+pqfme2nR3vkaacJXfLySc4daWmT76Hci2ZTMyWz
JwrU07WNKxqVpis5To65krTrcXi2Yx1TFHwfI9M4N6aeqdJ2u5qnOc3VOU1NTnT4TJs3ZO59
6vrfTc3VOM+Sh1E831LKVBeKU71iKeL5LRdSo1brJOrZp4z5qHvodHB5NnSp4uLnN2SvJwet
eQbPmuyy712V1Oi6y6l4pUaonZQ0Uw5tl4kyNXeu71n8snok6xUnWvqdbm7nB7G073Y9U+1X
73+T7qafypzV+D8Z8GNK0yp9Ld8JksfNWle9j7nxcanOetqamMppk9LJjHrY/Bwe11uufF7m
nm4tTilfO1Gn2y4va5z7H1uVOD5qnOjm8He7lImse6MubnG7D9jRiLSLsMJf4y09lfO5DveD
k/ycmnR4zTHJ87pLd5VFPc+96HtSeps4closu5POMMMvwWkUpZ+iNETL9joR7nek90T0MPU4
cMOI9jRJ41MbOTUrTIdk7XU5E3cGU5K2djybvBXFqc3bLT4TdWnbOqaVXWyc3Y4v0zcVu7Gn
gxXVONNVKxwphLMqaqXWeiRZ+LwdmiInaJ1jm1exJ7ScXBk3ZQ+icXB3z0vNxYxUfIrTm3dT
Snparzq/F98/K63ixznU0Uux/ZT6nukeqKjnG6pGsWbOy8cOsWdzRh7nfGxP0K9CtnKp8pMm
n5X+Daldb2teLFV7BWnupfK8J62VMeI5NOTSvJ4zxdmsjku0jRUbxUGFRlUkjDSNWqo8mWjS
Dh+18XEcJNGzo/Y+9ycmj8ElNFKYcnVopJd0VIPpVEmr6HKLOH6VmaV6BXk6pk8W8KydjHi2
l9LJxbvmyuk0ZbyKfg/1LLt1kJ6Y0VHKPJ+tlE/GJzZi6TRIc3/N3OaT4NHJUfi/izHm3dli
OZHrbR4yUsqPi5R+1vH8rV8Hzfc+l1TvnSdrpPoVtHtkbzmymhW0qelyWbPo9bLD4LOHyasq
UMSOGq76njH/Uuk0cKaxd3RePFZd4PyfKPew0fe714s7Pzd7o6x7ZI1etl4KZYkiPe3jwkc2
jLafc9dTU4McnNonOhj+qehHVZMzMVlmYrLMyrLMyrLFmDLKY62TcfO982bPi2ptU8WnytTU
1NazPv002WtKqXtaqth06VVVVVVV7Fxu0kWIk2VGjD+VTs0iZi79bkk1XUpThSSlMtJPOcdW
zJs21WWWWWZZlWm0lzbuTsd7g35U+ea1VprVZlmWZZlWmzU001FlkmqlKHRRHDkpSlKU+hyY
F2U6kuLJyfX7XJtdkrkx8jsetu/qlwi1bvySep/0aySNEnVZq7Osfi9j6GY74upmSPJ3MqeL
9z/yfQ1jpHsatXofQu7lnk+L/CKYUk6tlKfsWe54ssuHV4v3MRzJO6IntKyZdH1V7nN7X4Pl
bv9TKp1Pi1OybT8GPe/weEmjm9jsYeb0Pay6Pm+x632Ozs1fgk7PUJO4eb5JPJ648UJldaKe
h5rvwdHk+bR+187rbTm6leVPzlLg2flm9MqrJZUWzi+Dsdj5KnNX8XwfO/cuorCuuV2ThMlb
mmK5Pmdb5GNNPi1NptNTi9raNX5vxXkjhyi0RP6EnwjwjdmGW70kcZp/LJwdlHz0rEr2K8Xa
+Lr+DT1TsSet8XSJPW7mj5vSp5u52Xeth4MPmw5vLh9seh9rT+TzeU+rdsx9E6p7Hm831ux+
l0crT3z9bxfCMvdI5v0rLOynEgp0eUZWxHpjhzaNXKOzZtPoZj97+5lo/g5viw7Kd6z7J+S6
S7HsS4Me1XueDteL7HUK/Bps3ebo6XudH3itV+iemrZWWFPc9rqqaex51s+du9b2u9ss+b4v
Nyj1PF2eLuiemWdVLPtjq+5JdycLLP9cethiP5FIl361npfks4fN5usWdXqaeFK4vS2qY2mP
lqec2cHxdT1vJ6WTYHGfB4q2Y7VeQ3f2vKV7JlOTxe2os4dXi5yP5GXk/Q4jwSfk10RMMPNa
p6UTnH9iJhz9Ik5urD7m8YdH2u573Z+T1vxfc+L5pj7HyvJtPF+D2PmY2lfi9Dm/W82wr2PW
1ODo0rSv1Pzv9z/Gp63CdorGVs8XixtN3UqarDJYMbtT6X40x7nzT9U/M9T4Pm/Js+uPNTs9
71vlFQjLohPB3v4rJafc+xs5vYr5VZTrndPF0hvTdWqng9U9DvZeL1VTk2elzexlU++p0Vqf
lfRPNk2bvpamnqalcH7J6nCZK3V7nzPVCt1fe6OM5z/xcXNXg/PPOdqqx0Y9L1PnGEkwdnyi
7s9D0vGTV+9l6H2Mv0NpH5qkbTGO6YPWlXhNnpm1T4yu5xfF6HUu6xvsku9cZeb5v5Hm7P+5
yfrV6W8cR4PQ6yMOHc5usZYjKlkklntdzD1NElndHyav3MsLrt44YSeCknvVH0MvjJyjiOi8
HhWplbw3ZMbTTZqd83c33OND1up3x5P3rPS9L0Ojk7P9ylR/pf6o/1R/B3NWw/B5RZ/wjVvH
If1Nnik70nc+cdHm975JPW0dm6T1R/nepTD8nc/odzd/Q/qfg/lftbOG0jos8X7oszHoe1lo
/Bd/SpSlKcKUpSylKUptQ82UP0Ox+l9Td2xcWRZK9jQ9LEvufplfzfc/e+L5ng9M8LtHSdk/
I5sYxwfixjZppyaYxjHK4vXYrdW0N2Pzv630T3sfvf1vg/Q04OjpWMTGVYxlYx7JqnrbOyht
L5GUNu5Xi2anoeTqp6nuVu5zU4Trmn1tN3Km7wZNMfNOj/XQ4vuebT5HW9bwnwn85/F1PkV5
K7VdHobq83qdHnPqeqafB8Gz8zzfFu8XW+RXuoeb7XwlKXkylMKypXzvS+Zv73CY5ODd/lPN
9jWRyfU4WbNh+D2Pgu9DyfBZUWSeT5uz4Q+Ed0fc7kmYE8/N7ng1XqMqfxe9q5PyaS8nGd7o
rwmzk4sVxbKxqH2OTtnUySR84/ofU9Tve14uT7X0P7HZo/1vis5R1jkpE8HeSXf0vi1c1MyN
GizVHmur0ryR/m4iscWPil3sZMVjKbv63suVDlK8K6X5SfBxdb1MafCdb5nSV+SfPOj/W6p3
O8flfg6P9zo73rcmlfe1VPzPY9r5mlc5mOj1uzEU2d+js731NSMNJI9D0SPybuJHvJ6HMV8R
XkPvfU9ThVPpfF8ryfzftfsan1OZU9Qx4NDpK/vbRuK8mNODZ+9Z97veho8VRTvk84at3yjd
l6WBJq6PS/M83yuU3btT5X7GhX/eKu6Glfi5OjxbuD1NnqJWO90ZTg3lVXwfQqu14uQky81Q
U2fzrRyjwdWjRrFl1Rh4NXoU1XZkkp3rt3rd0cP1qaPrdIus2dGItq02nRlWMmMrLFLLJisp
vK8tNTo8mlc2Tk+xWnJwemdbrn1zHc7J0dc8H2OT5OM5Ocxj7Ha65WyU7GpWnlFok7ozEln4
tnEau94OFKWZW5yCnOfvfyn9U/k/tn9jH0vkV0nR5O5XY00xurdqd8PQyJO9p/pVTapqZPrc
nvfrc1dSvmdji5THBqannPVPuYx7n6nvcX9NO5SnRaRd5uT+Dmw/sYk/U+MbtlPk5P7kng4j
83Cz+ts3eTs4YaSPWp3Lrj2sA4Yn3sfexjGTJjZit4ntpuJX9r7J9j6l14uuw5R4yfSOqT82
YpaOHpYffGjZzHa+ZpyY5K3dr7WyrcpuK+mV1JbKl0bjylY6m78jm/ue1s0000/W/Cc3JXW9
D0P6hVivwYpsr2v7Zp3K9zm9DvcyfzcXk2nxhiuTJW0yUYylV/Yx87B+1lU0rGP9U1NTrVp1
MkR5j7nxnfTFYxkyYyYxiv1UpZJ6JI2j5x2U/Wp+lTh9b0NFPzZdo8Iwsp6nD9ayyyyyyyyy
yyyyyyyyyyzTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTvJ2PWT9rwe9ynXU5pOFR/ZH0
v3PF+DVs/c0fJ8XkvHOPW967aLtBJ7HrZjwVGiTq1SdIeFmYw3aPOSMOzR+xZ62y8fufc/qH
8z6HvdH6n6lPB2YfGPKPN2dzq3bqYXkFPuf8XEXXfZJFmkT1xc5c5ZPpcSdTJXxHsdrn2tPo
fNP2PhPJ4Or3vg+UjEco4fQ4YjEbPN6ZB+lmPskHXN2z9DlU3c2mU9DxetymyXSeM/m3WiTE
WYXjd7LPMk9k8HEaKeDZq4UpTHyNO56k6afS7n3T7ZXNjm+qcGnOS/RXUqtPyz87tm7xfdOb
+98z1PdPc9P75tfg8X5GxydHe++NlpOr/qau5dTos8nON3UVH9iT+qX5HZLul98vvl+Et5fn
nVPi7Evne97noeD6mVmV2WXwiTVT9EWI/NST5Lv2LLRuxqbz/Sybq4zgyY0ytmqZT3utpL+D
qacWQdTk4VN9YrUsssy4K3mzenAYxs2YpitJalqyzLhMVom0xXBWmzhTGm7ammmTZ4tT/0fY
71e1u759lK/91Y+lwnocHJppqaaYxpppplqxpqaYxtOts5snyw8WUPNsL1K4uLtdrjQ9pby6
lfldk7H4K/mk0j5pPCN/X+Ge7pM6VarWlpZpppppp4xJ+50jR+KuThK8HtYrwFfe8mp/Q5Tx
fBqbP7HoSSaMv63e/9mjVos/B7UnV+aT+Zw1c4k9b9b2vxf6YxHvJI+lyi8fxdEmkXZj3P4t
3yfk9L5R/SlXvnlO93TorJyS5uL0yvEY/W7No7n+t+aTiPUysifsavGNnRTMfdBrFacypu8m
zdVeh5Op3TFfB8H6na4vS8Gr/NHg/ueMdXfGr97hZo72ZFo/Qww+T3LPa/ucx5zd0ldrsY4M
dGU7EuLGMmMUpJTwf63RZJ4NlnCng/kbxyZcRdSlLPcwwkwwyvFkmjZu0ni8WHZ7d1ng/rfK
XF1TjTGSLtZU+t3PY8npelpXi6nXNnKY9DTd6Wlel4uyp6X4OU9k2mPa/F+av1OTdjiGpppp
pvD4t54VONTROLG81TGMnFxreUnCGSuExjd7JxbsYIsmTdk1MYMmMlVkwmDBjBjKSymhqVXC
Vi2FLi5FSr17/Qpo1Kla1nMznOcsxRUzMzM1GpJNTU1NTUfo/sjckcky6tam1SZne5u7u7u7
zM5zlGZnOckmZJ1baTEibibSbSaSdjkbjbbbbMznObccccJ/GWG1tMNR2SOLkS1uuMzOc54/
0uOvPm3VPm3WUmJ9f29NLJU2tuYlzU3MzM2othlpmZznNsusLYzjCa64w60u4uLMLktlTjDS
lusxtSorClrVFxyoph1tlM5znTA5GI2kwyzJ+laMt1ow6yLyNW6T+1qJLKilOpyi4sbMVaYr
GKxu3c2mzpb1NOuWmSymWKyrGWA3Y6iZK2ixWqRc5jpNMVkycJpwnGbO0cSmnW1NUyYrEsks
nOYl1TZLEyZkzJljMZTGWSsyVzYyaWMV32S0y2mKWmWmVGNNaVpppi0xYzo2VjirSuLJpgOY
4smTJisYyYrGMmMYxKt2xN2Qqt2VONlE4Dg4VjavyqwlbKxRzrG5Q2mJaZKrKGSLhTTm3anU
yaYOFQxWNOumNRJdLdqbKym8MKbMVgyVjBsMSrJlNMV/WqsV/8JLSCo+yQWkSXkGW7o4bMMO
rhowws0aMMNGjRyfS+bvaNEnrfpeyOT6npf0tHRs/i/xe95PJUI8lR5KkSeSoLsLR/BT8Z4N
3RxVjZwfrV8J/lNleCsbvBpXrn+96Z9NNh66HOv0vpeaX8GVK5zuodgractPsp21PKnjU9dN
qm1Puel/B1uE5T8j1udN28xqnzitDGzKdHfN5LIZO5R6WK8KHGf41frq4zqeI8h4t0n0O96n
oioxuwiWfFJ4R83iy0Cr1mBIruV9T/JwmzceDGMKYu/6Il5HJl5PS0e1+yOyopUUqPNuuqKi
m7dZJ/K2Wjo0U+1/KxHaU3clnzibRs9r8iuEqXRwqcGxP9s7nKc1TeVwrErtmJec2fa2mptO
uVp2N2zZk+d626qu9/0vz11OanOehymzJ3N5WmzUbrO9hTm5NY+ls0d0ln+1d4SCo+Sm67pG
76Vn+Mbj0NXZUjL7XVvH7Y5xzSUSbsS3afi2VHFlO6djo6NS7p43/Y/M5q+Wc32ysVX5H0OC
utim7KVpj+4Ke+VhVNlYJV9rJvBNmlVLFbNUKr3qxFLHnTGMYwmMkt2DamEr86VfK5ROqZSv
bDg062VN6pivvdo+2VvUymN1VKX1MfPMGK5zm2bSspvOE4K1N5u9TKp87GzJ+t8WzJtSuNUw
nOVlY9E0T5GTZWK9CqujZzby7DLWMrxkGykDrF0mYSToqSCubg1DIFS04pYr0tnY+R8ro4Oz
5rN3Js97R2bKfvaOjLR+hyaLP9rSNGrk4YbxQ8ZLSRdZdlw6PQuw6Mx5Mx9S7Ro/RFRUVI2c
my71Pk6JKaualNHJxEaOq7Vlu0iaylSpVcnJsy/c0YdGrVzV9aSTow9kaMusdVPfI6SbNnNs
6u50aq6Pa6PW9j9Uro9TmliLTHjN5lPnpkrgyV/V/1/+/p/9HB3sV/dEyFX1sqJlTKZTIpgy
VLGKljFUr8GmlC63K7kub5J8jhLrlZXrnvamVmVl4ntVJo9667RTDDC0i0izCS7Lk8HkkxI6
JOjm3U828c3rWc3Vq1EuatnBxdrsKVpxe9j6HXOjuVpXsV1O9X5WzQ2noeE3Vs65lOFOpWJV
XB1Nng7G81FZOArjO6pxcK2qZYzJ5Tebt28PzK3psybNPfNN1bNKYehZd8opZhJQqKU5xTiL
xuPiy7HCS+t7Xg1DaWSrqY5pdTwVwobtUydtTeZTJu2mpXY65jHGbzhYUymMpwdzTZXBwmoc
HzNU2Yp0U5KZaarujSAs0j6Fo5MxpLxZJmdrZ1MY2KVjKmm85tNTds2ZDCzZutHWTRldhZJo
50hLsR9i6o/7VKxkTlUySxWUyJlUZMVEPhGV1RwobOHVzYdpTRJtFkmykncpzavXHve9lE7m
XfF2q77YiXi7hC08aT9E9Tap4uumnScktm0YrEn5vB6Wr3NVKVBd6mrdJSdz0uS9oqO9iXrd
GqaS4TlNqleLm5zZxdvBp8N5lsDZzt6psx5UyYOxqV0f9zTrqNloskkp1brt2uV2iklo6yy8
YSTDi7mlu7nqleYNxXsd9Jeqm1O2eDKdHfW5O1W9Ctp2T2zg072O5jdvF1ni0cR3sxZusuqK
YdElJObhoss2rDebqi0YbIlklOylpG8ROsjVw3dH82UMZNN61NOU7mPGWVNmTdEp0UtF3NeJ
MPBZZTvYbsqZaNI6LJPSu73g0XdHZd9rE2aoJZ0XSeMnjHpbOk7Sp6Z1TZkOxwZTydJp0eU7
qatXqdzwZSbqjuaMRmzWLGzkptGeI5pNstmXWSKfF0ki8FR0bObWOrhlycOssu2e5hl3Ryeh
w72w7tYCuqqYd7mp29CTLuYWdnfGrGXWOUYUzJFKU3aNOLteLt6McZjjV6WTxpu0rkyYK73N
4O9uu0XU4izDnG8ZjVhZo1WkRNmMZTJlMc3BtStpW9ObHY4Nm2nDRu2arxJSoyy6xd2kWiSo
7N3DRzXbcNHJE7mHKKU8nOSQ7ouk5KdnDp3KzZ2snc7nJ4W5K5OTnE4KrjtY4TLRS8jZ0WUs
zGrVYZcLJLJKhFSRrFRiKRLqLTnGi8ZjRdrtrXay7DRUTlF3ESclOGr3JNmzvZRLN2qS7dhz
asPFpFl3Ei60XauSzMWWXjKhEu2YXjSLxovJG7m4YbujzGziO6NGrhqpfdrBKkcSQ/qXc2qT
TVuoc1AvMRyyw0i+ZN3SRoyw3Uy5NlRZUWbaSU1bto/AckiLOGzkuxIpUjvYcZ16qV2P4OL7
mmm6r80/5t3GbylcGfvcGNIn62TedivUxyqxpkxkrGQxkxjUxkltT+DTcuTtclO1UkbsLA2f
oW5qJN2HZeSfyigXdrVcWqmytmVMJ1OxurYVuBXxpWVFPJtPU7m0+kcFfGpiu5tK/M+M/F/g
/bU06205ve6PB2v9Ti5T2Oc1kzV4Lvtfm/tWfsco1avqWdYu3fSvGi7Rq+qNLccf32WXHW5H
XH+xxcZW622/qmnX5tlxuMuurbU41GY/POe5dcrVek5rjqa8qOPZ9JeOSpOtRbSTzzEWy846
3aKi7Rhopv+58Wrds4aqaqszdw5R0eavzTi5uCvcymSvui0ydz4KNT6G8dmrd1cMMxrH5PFh
hJiRaSyT72kSWjGK9CvzPi/SrGE/W1T6qZTKYqsmMZMmMZMmMYVMZMYxjGTJjGMYxjGMYxjG
MYyYrFYxkrGKyYypktUMashlk82JjGODQ0xjEWzTUxkxkWpkyVioxu0rTKrG7TepkNm7Tmyb
MYxjGODTTKmTJjTStTJgyS0yY01MYxWMammNMmpqTFWEySzMrGMYxirFYrGMYxjGMYxjGMYx
jGMYxjGMY1P+ibNTtbtqYwVimMYxjGNmksYq0MmmmMaVlMplMpjGMYxhMVlMVjVY01WmmMYx
isVjGMYrGMYxjGMYrGTJiWMnfs9DJ2N2n8nBs/KxvK5tTwjVhSll113kvGv+diPtPc/vbyRu
2U+x/tn2UODnNpwqn8nJLxY4Mbiu9p6XwjK6J+x/CN2H62Y9LotEnc8ng1WebWO55N1JKbx3
pNZl4xtH1x1eLZ++KVHCSThkTB1VMlZUwrZuxvNOx+9u2cWNkuCsiVkypkrGKyZJZIWMqVis
mEwqdlaSrTGEyVgxgxFtO9pLaHFjnO92uU2bVMqeU852va4uL532zap2TFRPg4FmXyWkbvtd
ztEmH/JlUayNnV9bVz3n1sS/4sdcf+k1G7m/5Nn0K4tTwdlNImjqs9DRZ6n3RZdJd4Mi0ava
97VTEjUl80xyc6j2Obd5uqdtR7mm72O962nV6WH2tIntbqdZIplZ4KEE5xp3LM7u5yGrRUjm
pspSnwkqNbu8btGzhq7mkUqLR4svB1juaxq5OHW7e7mps0s5ExWO+Y76ZK66ne4zqjHU02ax
jq3XjiZjNRdJa7q6tow5tXRs2WdW7Vq3eDiRUSUk6SOHDWnN1kYi67pGFmVKdGZhu0cmkYbO
HVZiNGV2WWW0s6OjMjkocoqNXDlq5vU6OHRu8GJI7JLokneInJs5pNHCzeOcU4XjubMSdo9z
LLmoeUZcN27do2kuutFnhGq7m+dp4PJ5z0O2lfmmEyeCvOdG7veg8N5jn6GXjJ5ua48HhJHR
6JBaRhJTRukyx5sdJzmnY7mp3MTk62ocmJYxWzgQlm6m7VqOUkWaTeOFnojwjLeeLs6PCPQ6
9XitF146R4OsbuyzukYdF3e8GXOO+PXGXg2c1N1C7aS0dYoeC8j9rwjsJNFRTxbOFsKio7PF
J3vS6vFw6JJPBq1d6J3onjhZyYXx0yk3axTOr1RpGtbRa2z98Uk3dJKWbR3LvCLPCMOjj0Or
R5rN0TR4Mua7vcmjuXaO4HhGjn4No2U3dmimi0dHJyd8WZc14SujK2jk3j0uqq4VTynk4UzG
7sY9M4ux3OhK4zn0jEZXG8ykvJFpSTRThQ0dWjmlzc6cGq05qxx7kujOOT0Opp/CandPgxWM
pjdVybK2aftabJvPU4uLjTdupdSou0SfUxIwwpJSnrUzI8zyeLzaNIu4co+DEj2Rs0fe/e2U
qPiqepsk/a/YtJF3Z7HV7mWz2Lva1arMMtmqTqqOaoypsoZaNmJGFPqXcMLMtVnJq0aPz87M
OKdZfNsOuuMtrekp5utKY07rim8e117K94xJao9NrYnWHFR1bTjMdaabU446tbMaW231Tjzr
0kqLxo0YaMstnlJHNEkk/B+Ufg3jEnJZVxfSl9KtO9slj9U3lfQ3lSxu4yz6m1zs7lKUqTSq
pVL+MmGXcu/KSMrMvY+lTvfQ5OzZ8mymqz6lpOUel+prEnV60vc7H+L876X+x51O19KtPyO+
Hzu6lbvB7WxHpYbyNlOzyavBeN4u8I/vapNm79il41ela8Uk/NiOo6KHV7mr2QaMpPU7nyeT
scZk4vwobK+LZuxp6Wz3Ux+dXg+ZLlJ3sMZVYysYpwbOLEtMqGTdWpqsVqc2NN2Q4U5uL0ON
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
OfaX9GNRam5huLfmX0ZdvMddMpxyM7YmWKmHzb5q2m5Ti2Gf40vTUv8/Lyk/Lw2/OJmafm3z
bync1t2SmuuOyok4XScNXEU5Rjdyar6LKauYxibtPSow01LVhck/MYeeY1H8uWXUwxTrGcPz
jTcU/NZk2dXPzTbD0pW7V3Di3ynHmpLYYXGJlS3W1sJ1xc6p9zha7dlswu1ZkwbsJ1WaJlw2
Uspec9djanBu1JdTKMYqx1tTiyyZVFSUqVFJLuGi5l0lmI4aNmGsU6NvM/sSbfKjr+xh8+k7
STzCoxFImPMd1MvyTy+vl6U/PnzGF74y+ipOOsdUsvbXapNo73yH/No0ZbrKbNucScqiqIws
pZE5PYxh1spmLrrSNVLU6xy3l2HCTMG3kwnJr80nRi6mimqll3OLc2JNtMrUqMsSdakt/Kdc
4yzjC2tv1R4NmWjhde7+aR0izZzimi3PkpspdZhq0avsdyz1pMKd8Upd0UwifBZZiLEr7Krs
e5k4Mel3NqHg8Hg8qadY9LqWw040tlxSmm221sxiLf3ltststXZTVlTVtGjMasstlmzLDKnC
my8nMYru95e3WFSa1l7a5NMr023OtZUw2wpqu3ZVG7ViNmWjZldhuu/Js8HgxG7Rlq3c5yvI
ugktHkuw7RldrJlJYasLLpOGVn7XHZ/veTwebos3aLe10bsjcnOvqVpg+LU3d88Hi3eD63Gp
tPayqvzuTdtS2drap0hvK1TsZU9TscXBvTxaZMldU728xp5tnqnP7qcWSnk1aOHg0bt1R4CT
Vdqs9jdSSou2TZydpLyTDs0cSP4RTPJu2SYbOjhvGjk2XdY5xflZbC668bLKbMNlOzuSaRyj
EbLNwbN+kinZhliOS0Wi0jDElhanHXVsSejLz0YbejLzkjy5xUmo20ky0zEmqjumHFMxSTcV
LYW+9l1cRhdvSiC7ZhlqspZSm7Lhs1e1d1d6TvSVElKSdWHN24WbuFpJ0UmjV1kuskph0aJL
kasMKpiRus6sKViNElJKXcOI5pKs97D9bV+pybxqw4UicnNddao6OGq0XVI1jSSmJeObqyrr
brsejjMlMsT5bq41J87GnGf6O54rtmrddS0FnNe6Jhdds5OTVJUZWarrrst3OOkSZWjRrGJF
NWropS0mi6y8UpyYcnJnjZlo2WYSW4epzlWjUQnRu4dJLNmVpKdGq7hq0aNkmjLZplq6POMX
k3UtZVlUs3JOrkw6sI8/jD+OLrrzEelpTzU/iT+OxlpcW46tHDEcK2aqZjhuk2Z5MyRUaqWi
lU5ubjNTZwZK04VPQr0N1VwecrlNkTo5RzacLN2zuYmXCSlRutZJShpzalbTJWncx1tnBkrh
WKrvnc5tTuhW8ypybuybTJjGTucFcmU4VBu1dJEmkZcOFOTV2dHZzc2IpJLkxxcnNrYc2Iux
k4MJuyViWTVSTEizfGJI5yNYy5Nmymy0wxPk2ehl4PSpSlNVlopUyuie9ldds0Xc2GEnoUiW
dWsc13e72Vnesss72Gy0aqatVmyneu1ZWWaKj5LsRTdlsp7I2badfPylXj99m2vLlfZbk9an
Ve26xJeI2yy463HnnlNNMOqbcdUpbDrZltGqzCm8WXbMtpl+6OG0apNX3PsSe2e1LpNNManW
0LGmWnLsxvO16Htep97s1arLPpeLdu3kjRUc1R3t2sXniwwu4jWQbtoxI6RzfS0dnNyaxrFR
H2x5O+d1O4RdtMb1T2ODvnOY7Jybux0dzCTKU5LQZSbLA0ZilOjZeTERTVSyCZkSYdXCmY4q
NmV6GElQjRTDGY5sSRpIypiMytGrdydFOHY6yzx3rz+1/jW28/LYc+SXH0mPmsvyl2qy67RS
zzadYpww0WiTfZdeOrq4UspUkVFJKXUu2aubKmI3aLs+1q83FuMbfPMrfxnsf2vv4k7H5jzl
PozcfmpPzLb+PNLivOv6m+tT5iScbWw+ZYXXphSmGHDvkfCO6LJPNUe14sxq0dTrZXeyXm2V
ou6Ziu1kyZM14TPCKwxS01Y3VHg7ne0cLMt9lMNHcgk5Rq4XWWi7fRqwk8FOakmaVSSqipMc
4zHUlrjW1xumFKqKpTa2FDFJNqi1RZS1MqWy4RLXZjk1cllLWYbrL9Y0jeNI2qCr0spSqU4c
OTEYm1MqltKl5UYimJiLl2kufMS2H5lp5uNxt++0wph+W11X9bTz35r8pipJKwtJlTFSyouq
cK0VsrDRaeapgcLMqinNJvGKbcTi7RqywzGzm81DdJlSlkTX1yR3y47JUWqMP4318y4wpSTi
1pMusqtqUy8pTrjLvZ1lxmPQs2aKjmqRs2s1YaKWvHC7d3SM3XjCzaNYsy1bRddNWVmXpjm8
mj4JMqj5WLT3vnacKchLVK00JdbsK2ncyp0Uw7nVo1XZYU1aMtXZsw0jZspTDChZJssuVGVR
lUfJiLN1mizRx89G3lOvnVLW65Ho848pxptrUne16a13DEvrZ17brDWJTi3VR6NPKWqMKecW
0wwplx5phbjL3I2zGsbxhs0Wi0ww1jWeyOHVyeKJSJ3xZ5LrPikuSXip0jWOzk+Dsy8VOym7
V7FLtH9DLdokpwtEne+Udzh5KB6Gr9rh5QwdzBjGMVjGJYVXRzaml2y72O51dGI0U5LLNlpE
nVNN20lMKjRZuscMPSLs+Tkuu2sjRuvHDZrFLqxbEzGHhF1NWBo4UzGF4pUaybRJ+ZmWHnGS
JLW2pbjbLbcYjLOmJF1REyvF2i0ZtHDDC7hTVvJIs67bEiTsW2wtuDqTceY5Uy+/zSLfJKVG
dmWrbeBGFRJvFRTThUaM6mHLmmmXZPP0eYcjsekqqUlONRTS3zcmFT+JJbjE/MNTEyqTbv5t
pqbcfmn5tbKnFzzTWlRTL8x8zI06640w20vXJMNtN5kfOuONa0004615plS1PlNMqduXHWHz
La3GGmoy+txuMLkfPyTr5yn57nWG3m22csNKY0+K7DDk2YaN8JLrsSRspyWaxdaKXaVH02w6
w29G2x1xzqTikmHFMNMxa2mVZiSlLjLT0WxrKTDTremjLdu3KU6t3SOTZrGzDLk4Z5MNHJJT
KnozFt25eHnlqUyqNqbXpPzy22pIpUjrMYvjMYXFswiozaJpUWUkutFLJKWeqNWG6yyzVldZ
houkwpZSmIpS7iLMOMOGbMXcLSlnN6W89TuqaZOjjUwZTlVPBvK2YjaOznG0bLrsMonJ0YVF
1mjEYdIqNvNOuOPOONMOs9U3G3m3lqaU206xGGXGXFbumO0021ed69U4zO87Ms4247bG3OyY
ZaabaYU862zHVNsNl2WV2q7RrutGFlRdTeYnrj4vNJq2cnIZSemMuIpQpyU0eciz2O9u7JOr
uWfKtWsc3JvGjqNY4i6zZwy/3ukZiSl1MsvBh2i7MaLKeMaqc1Rdlqu1eTxV+h0cGO5ybT6W
nXTo3r2QytXprlO0kHZ4OzddhwtGi7tGymWq7uaqfNhShJuspl/sYky6somVNXDo+EYfnGy0
VHPMUpopdtGWovHucRh2bPFxJJqy4XLOa66T2iJ4PJ6EnmkpTVq1iSwN0m7K6TC7Dm7op4aV
tnoy1bLKVrGqJuy0jDDs1jspwqRrHCThlZo6tJtTkfo+YkZU2wx+Sf7Y1H8y46+YYtykpusp
dzbLPY+Tq3d77lPvXdI1SI6n3OxpyqeTTVTFYTycnixxdjjN28ax1YXSWYWkXdzC7ubNnSTL
V3rrNVqccW4+ZbkVFR+U0p5brqTDilKeYdYcYcWwp+XhTylxp1thyNLKvlyXnJowk5KfcqNE
lRdzbqbrLsLxhwysqKc6izEclMNnJq2XIwy1jK36MsuvnklY45Tj5pp1JtcUy+aYdcVFurYc
kZS1vJMsuMpLUqbPJoRwpsrdyjWLupIu3YSZcLOa612yylN1LN8NWG7IibuqSJ+C7q5OSl26
mFmFLtY2WWjqy0kaRTo5uah0ywokZU3imWq0jMZWjVpFYZekw3p+bZYkjkkcYYUpplpveGFR
J/ojKo28664t74w+UtJtki3m30j6mV8/SRq2ayObRZdq6MLtq5cua2JZouwpo2dFNVRyUyqK
byWarSbrReNl3DuYcN2GzCyylo0btGzC6nDhZpG73t6rtdkrjSuob1TH0uk63CcJ3TSOjDKm
WI5R0jKnRq1YYWZYbssNGFtMMRh2Rlt1t1xxbzS2nlqU0yttphxlmuypzF2u85Y21JilNsst
TFzbNqlveYUpiNKWpTDinlx6MtklNGrdlT6HpbSRwkw5KjZhq280S8nJ4TanNyc3Bzm7ds0r
JzktMVps7JMLpPkqJMvBs6Ob8GGYRvFE5PB4Lc2i8ixElRl3ut4rwaLpMv3RZhTnFRlq2jsz
oq93C7s4cmY0kaRsrDdwy5J/mkjbQ0xG5MPo7UflNvyuycefDb8y99IzCNTcjOWYw8zFLW44
yyDcYxHWfMRUino4265rHz7EYbmlNWqzZdww0izLEZjLaRSkmyopcjdUizI2ZcbN1Nmk9MXg
k5KhHCpJGG6zRhmmWY5N2F2jlTXZydXpasNuv6ORhbEafqlRSrYj5txuajK3PmW1rjL8/jz5
l85vzDS2notbKmnzTKTb5iKWpp15iMxp2JxyNR/tVJGVKjS1tPyuPfnttNutuLja4+Zejbq0
mVutupMtRrLkfmW1vXGnGjVJpI4dGzVs0ZXb63Yy+xu5uTiRww/jrDcjbUlRTDTS3WGmePov
KotciS6ouywty5MMzmupo0dX9zZww1XjZUaxyizLnIxFReNWF1RZo1XXWcl1Nowuu5sujRlZ
ZdeYYZkXUpoqNVPnVyeZW0p5STjy0ltMLXLU69jxV7nnTTJ3U8WzxnOhp4K63Y73g72rqpmM
OTRl2bsNmrRqswu3jVdrIpx1lqOuvMttsssxxtlxh1qTEmXsROMYx3FbZbpxuOrnp7mpptp5
5TcecaZeZW04pa3Vrdf4nzjDjctTCnDhnibs/OPtSdEmH1P8knJzc3ui7wj9j+VT+hsTT1sf
9rjTUxu/5T+Lk4OLiq9LMzMoyZmZlGTMzMk0Md7Kepu4P7XZzn4ketq6NUnV+l+t/3MsNXe1
VFRUU6u5Zyawbx1aMMtGVpGEncuvI+TK7hvGz/rWaxzZScJOjEfzqjdUbxpGi0iy7vVGGIqS
yTV3ve7Pg3cO95LP0PZHSQdH+pq749XRl7ESlSMMonm06e/XRxFmVdlI0yk5vernNP853PGb
Otwf83uJ/a/g+Dk6Mjmuk8VKSdXqWep3u58n2PscN27du3bvZN3YynonaT8GU9TFanY97hU+
VwfzYxqanB7mp/g09tDg7KnY5MYrydbadjm9VMbzo4Vqanuftf5O+dKXScZymTVZhdzcloMO
rLnEmrUjaNYuqRS0eT0LKdXoYehl9jo+Yk3fkspzkiTDm73Do9jkk6sMOrqy7o1WZVGilmrV
hq8HR0rznhQ7HRuTU1ViVeDZ2NoYc1kKUsqLx5Rsyuyy6Ojo9z5RydVQa7Ru2Wizhww4d70J
N20bvFJJ3uz5JZPKY/TPteLo752UNqeydryeTi8nk4TT1uLZ4ux++nZQ86r0Pa+Dki9aXpcJ
4N3OeubPQ2n0PJ9zitXovGvK3qdztdSu1T+d+l0Xauyzmw6rvm0kJ6XZaO9Udync2appjZk9
8rJ/+MnFwdjadT7GizBL/oaaYylZMnRjFcqafM02lY7RiR4vNZ1c3Zs2dHDk9zdu3bt27C7x
bxXKc7M541XVOU0yY5TJ6WNmVXdPQ7PuYZcLSJ0Uur7xJ5uGz4sPow5P53m3d91uDZ0dr2tq
mmDjMpu+x5sfB6p6p6p7HN62K+l0e+Y9z2uT8yuT/N5tPez1NPOemeceDxj7Wjo03VPW9Tvf
N9z3u0fpehq5vsbPJ7nR1JOklni9zC7vdnaOj3vONo98el5Pm2c3Yx8jGmVkz2sHscHa8nqc
FyZPJivRNNPiynpZVbTFbN2nBjilktMqU2aPUsysw73iy+llltIkss8XZZu7pIwKFPpdzo3I
0ehopdeLrP1xSTufBTLyU+DZ7WrKhq1kG0I5N2XClKYxjGMYx9o9Dd9D6Kfse17GMZDJWT2u
M9tTK9rqb1Nm22MsZmZMsWTGWTfbNNrLMzNqslqWMZm1cW9axW0xJiTTSq/LukqTFrVW2mZW
c4Jiqlji4Nq2rfhWN2tbK5xOdThT61c35Ffve5/3vhODuViup1uphFLspOCt2NlYraTGVisq
xWViWzUlphLGKsZKxixlZU4Q85qpjJqVkR2VMUeubPkbDrmJZPgytAr0VMp9jpXXTZVcZlFO
pyc3NxodlBOxiVbCt3obSuplK9NOb0vOdVPpp2PUx/KnW7UudPqpXe6nU9DveLyp4NnU+dp9
bZ9T7UtSspjGSvwp9c9E7nzNNpqYypisbup/rfa/4v0Ox4vsY9z8k+qdHB6X3PKvCvCeM0TJ
4tTZ/+NTT7VaJqpxY1T1PNpLanNu0006ppu9Sv71cZXVOqfWxyH2v2tOL+kV+6nUrT1u5912
s+Z1v2vFwfaqXc+p73Rsr96nktI0asxo+a7/CO5lE/FyU3SeMiTk/Fdu+qNX5N1MDK8kU/4O
zCJJEplaP868ZfVJBswyQYSU/QqP8lP6ZIOzLg/qZDhKr/eD/1ng/I3n+piv3MmONTlT1v1x
0YVXR+dpzqqxs9k4OLZwfnS/8qan8mOkv9jRSuTKemdT52OUydQlc5kPqnBpsrd8j0K/lU4U
MpX8H3PrcWPmfQ8JqbtMcnR4OlKxUvY+R0e57Xofvdzte172Ojxp8rzm0lWPpaV7mTydr6Hy
zyf+au14vcOp4skX3Syncym74PW5PsfW9Lh7n2Pi+19b63uVHpe5aNJFLxd0dzwYepdSyni+
EeMWSYSU+yQdzs6sPB4zrVlO5WPe0NTanbP7HjTtb03biuDU8nFX8aVxf5UrHobvnmPJkxKw
qrGTLJjIjsne1PU4T1TsY8VfW+SdJurrcWlaSqXXDmyV1tPtcmWsaN0ni+L3OIO6RiSMxaPs
ax+xSLiyf1MFfI9stE/cxUrrf3Pe/ol9D2u1xV7na0rzYT2zoD4T5nzPa7qnJxofPMocX2tB
V8tK/JMdjm5jufW+ac50fmnbOT6J4vsfQ5k72TsmMpk5K3cGn+tWnU7HF6JkrkTk82hWMnFW
9UyofS5vthvTsYD4isqn9Esn55WPsrFfyYvCZTuqdrUi9L7G09L+SWzZsKvvnyPve9XaxWzr
cRxVyepzqGOCv8VZU3etqnfPzO1tMeuanU/Y9c2qfRNQ631Kqu9wfByVwne0+R8rGPg9Lwje
NUmpGzq4j4yQaJO9w3kguCup+RpWMJ4sfZSvex5Tum7znvcHufCZQ/W+6hvOt9VPupLrp8zg
9SvtaFcmMmCsac3+gnyOb73spp5TwVp/i/rYXe1S0e9aPvYfYw+DwaA6PtWB82E+MxR0ebvn
snm9bH0K2cn7nOfQrrfmcHBzamMVd71vFsq+iYryfpe5Xuodr3pXFlg4sV9kwV4T9zSVeLEc
GKT8tTvoaV9rvaHxYpXeyng/Q82zrfI+CvSx0ZU+Rs+M3FeymA2ZQxjhODZK2ZSspjgyhbzZ
plTGN2ls2amMbNN2TSW83bNK5tqlZTYVpipbMoamTMUpjGTFVjJxfK4NhpWQ4O9+WflntURo
uPg6vezHVykjaNkl46vY1eaThsU5O5ocneUr9jZ4TEXN51PzPkqHxadbwdJu5p5pdbVfpl+2
Wkveyive976mz/6ZSvzN34snR/GabPtY4T9D8Xi8W862lYynufBqVzb1K7HxJ6qedD72Prlx
bAyp1y4ytPY5Q4OjtV9rird8rUtqn6ZWmPuVpXVUOt7He7H1Ti7GOLtc5sr62A+dWQ0wH8WK
+Lg62PneSpbMpjzaJ7nCpu75k09TSNHVlJ6Yuu7osw2UYSaxw8FR+hSJ1bu9lJoy4eyOcU1k
YbOkdI6usInZwaZPi3e+p9c6pjEv3Ti4A5q1PKqf835Hk4PN4U9iucWmK7xjxKZE3ZQ/zYPW
yibK73hO5p3g7G9P40runzK9jrS6TlTSuDnNT2uj56mSvyVPTK8pVcZxKfg0xp4thzqbNPuo
ZIfKStlfB+CsfUx5N5p4PY/2oXUTGO57ppwfU5U5sp61dTapXGYSvQquqaepW0+WVzV+V2OZ
K6KPa7Pc6PWp6nDDiNkl1RGYs+C0ckntcmXJuwssObpILMrR9bweh+hzSehE9qXW9LHyMlK+
1KuTVSxk63qhzeT3uD1sdb1K2bPGonteauDZEmkXY72qc4eD1ux/FxbNp0bNmptkS0yVzehq
mTBXRk636WxU9E3cn2PyvveL2McZ/U+xpj0lO92Nyp/dLIV72P8JYamCv7KmMZUxkxWP5Pzv
B2yt6Xxp9DKeDGVUxplTZ+Rk/bPte2kuE9bHcr7nXN3N9jJLH2smp8ivW+Wof4N6eE+Sh9Ev
rbK8GTg7WE9MTuV2c34sxq7n2O6MJPpU1jRu5SPujMRP7SMSr5ZYi/iwnuntnodVDqeudj3T
TZ2tpVehjd1TTg5UNVK1Ot4T52MYxjGDGMYybNlfg7HrflpzfvS0EvCY/MSuycKanUxk97i7
SfIydSiLRTeKcPyfQ6R0cMvas9EdkTR0Wj5HfTnOjVT4snR3q04Sx4z2T5aVsD6n3K6VDtaf
S9SvTOVPumqbK8H5pwJHdJZE/fT62pJ5zCV6Xwd873kPUu+K8eaoR84+SotHg7LMxTds2bPh
V3Prc30TpPObOiXRqel6p8zd6VfxViuU/pdU+RydCcn5XtnzutxY+M+lWz3t6eT6X0vir3Od
Q4zkx6mT0MetzepydyvKcVK+DBWOtLtdrJwbK2p9dDucldzJjJ754jm+FU73BX9NNPZD0q7X
CUXxmMc30P5jTtcE4ysFbPNpjFY9bgl1t1fB63rnOnochzmnJXvFY9zFe1g9b2NK6MV0lY3d
7vbTybtQbqkfB2epZ8o9MWXfQwpJyapOF3iu+yh6ahqp0laVk9jo8qp3u55It5lPfUPg9jg9
jsp/zBX/8yJCafuY/8nN6XzvjU/CpxaYfpf6XqbyqretnBjH9DTTGNhLTTVSXyTKBfzZT+LA
F89DBzf5N3/F+DZWzGlf4PfP+Y/F2uMylZP8XFqbKyfxc2n+hpp/Y0sy2XXkf537Wi7hlq/v
WeL/B3JKVGsaRTopoqKiklRUc1lo5ubmupTCnRSynRZ0U7DCyopUUpSoqOrd+5w6PLx4ccXD
ZJJJDAA3vN583HLcOa7rupJOnDOjc4uWnFdV1UlVq7mH+hJ/patV1OsdY/ikyy0asxo7mzLw
cMxoqKZZYjRybOHc/U+L7nxfQ+l+D0uHsckn6XucKSfew0c1EWeLxWemPN6Gjzasv8LTS3+B
tttxhplbbjbUUww4y221atWI9L0qbNXJThE2Us5MMsuGjRybSZfnXYwpS1tNOuNR+edjq4uO
xqMKW23HWlutOuqUpp5a2GFMLZceeaWy4w4pxlhpTEecdacUp5txbC2mWnGnWmnmW23nVx5h
S3HXGlR5pttbq2Gn+GSJPmHnGklMLLLMLsOFLNGjCzSOGqzCz+DdybbWp+jbj8pp1tlhbynn
Xzrz80k4y2zHluurcjrcZji3lsvOxpUbitreWuOx55p+cdcjK3GXHz58202OKbjim2lNOstM
OMsNPOpMPgvFio0auT/Q6uJG6TmzI5SOI81NHRq0XWWYVHDue571mWVJNFKaO0do4XjRTvjk
2jo8Gjhh3R3KSdynWOHc+TvZdG7s5rrrruzvdVO9lho7NWV2ql2zi23WHI/uMNMsR1tTEdi3
nVxTa3VJNPPOPMuPKW85GGWlNvMMLUtTjcdfp+mJ+nT8w44p8yy+UtUYZaqZaOqnNqy3Sbt4
xH8Wrh0ZWU0SU9GGX55TanHo2uNNPnnopxxpl5lp1xmNtttKU4wyptlmMRph5htiMtR5l1pt
ptS3lrdddcddcU2wpl5TLFNVj2D3WW9eXpfu9k0xreLk6zVs96rXnK5MSq46r2farvVtd7uS
l3pc5Jm+e7ttq+az/XzWPlMYvq+Pr2reWvb9rN/Xzlc7223eUzhNt6b73Ne7rmvYvPeMq7hj
LeJObVva57l8pnF91tlbDG3nWF63Tzju2cbaaZ1bHlckvj2N057Tu29cep5iOsNR15pxtTrz
bTbzTzTLzc95Trvuynd4nmJyZ5lMuvMLejOOamL77bab9NyYbzKmuyprs3ye7PU1tpbTjDjb
q27DdqysphUYXdHZSTq7neuk7KXXbNmzhTkspaLxzdHZd2dmGGWFLtGioxFNPRltlTEU8tce
eU0w69Hm3ow462yp5p5bkceYU6p1xbLTannXXo22pUYYaddbdXGmm2nVMvLZZcZbcdcbbZcc
cWy4wpS1xpa3mGnlPKU205HG3mGGmlOPNustqbSddebjLDLbbby2440tTcbUtyKbdYYainWW
oxHWWWHXI2yt5p5lS2mdMctS49Juckp1/In8qqilnDZu6uH/au3k5KauFo/uYc3R82ZLNXRu
u4aOFMNJIu3dVknRSynephydzudzd1Ziy7tFnZqxGimjDDRaWbMuOOuzjbbbbaphxt/SMOtx
TLDUU8201GnWop12bVFNuzrq2lrdbeZXarLrNmWkWaqbrNW8dBJdS7LVS21NMqYUw8t2bdYn
LmqtzEnn0m3KuN1OLTGqnpY1PY97GMYxjGMYxSlKUpS7Rq1c1LLN4wyiSf3qSSriyqabup/r
eDgrjT5RpwV9NQ+l/RO+fO+5qfqf6Kh/Nxf0PsVzcqnNVZObm/hD/8JW84OU03h/i3fi/0Pp
l/lMn7X7m6Js+6n3VNTT90/xc2MG1K3fi/g4vsnOKdjg6VU5Ot0imqnVVTJvOtoqMyRlJyHD
/a9z3vi6R1js3Up2dnDs1asOjDRpBo6Obm5qU+1+ts2btlPqjidHc/2Mni8qm0rwnk5K8m0X
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
NMVs4NqY5ysYqr6nGpyG1Kx2v1VMGSsadLnK4JcE3cW9MMJMLtHDLWYWZWkWiSou1SfqdXEj
cYWimUl2iyl3sWUpdd7nDSLwatnFXc6OFdlOkOuZNlaYi3dzk66U5tIsibKcRUcKSSYU4UtF
OGVnNpFl4s5OHSTCylNXSNXR0WYbRmJOiTWQcovPrazR/O0XSdXVYcJJP1Orq41dGjVBZS8N
XSRZw6RJ0YU2bNoaO9iObm3bpNpI4jaNWZB2WdW7lGiTVJYMxrFSco0kGzk2ScQ3XauFOILO
sjWO+OTVmN41WbLCTo5rJLtmODtcoltOE2odHUxXSnY4VOUitTVPW3eVWOpu7GNpiuyp2OCr
dwl4zsnKpxd85XOvoafa87rdJ3To6TZs2nKm49LJtMnCleL0U9FK72Q+V2T0TGTT6GMaYPsm
K5q+pynixWzdync4V8Ke99tdrtcJzY+lKuVK1O55uSTvbWjwecYeceYLRiKU0YasMMqWRMrs
sRUdlmIkkobrrESkmz2NlOG8gvHtjs4SVFSnKMvSsNxtFDwnY8H9sObgy7BXUrU/sbK75hN5
1w63UxwbuDpK9TSF21P6p0V2vQ0TCSok9apI1YZdHBIyMxmRuXdln/KhlOUtUMNqmYTtZNMm
8rZEwutH5vVF/hETuU2WWinxbuHyaqZVF2WYpJSmiQ0YYIs0XWj2KSUyYxsycXCZTG1DGNpq
u2msa02aacWVNO9qabN26t6YxyY9bJ9DJvMfK+xpsxwnOppwcpXwbTd31PJkrSXY3ZO5k3Kx
sd0x3vFpu5MmmTGmmhXBWCrpO11NpzYTgrHFwZU40OTk2qc3VyHhPrdSq4jebytp1jTTd1OE
3YrFY6NOxjTgVqsOi0cOTZqy2kjqprNmjoy9SSTMZZdF1mXxdWsj0vdJHc8IpmR6Wgsu6wYi
mFx5qbITk9ZH1sSCc3kyKU/e3Y73erkxwaqp4MfvZSrpMYxLEsYMKymDvnrembU51PuqvS6T
xJivcxyJ2ysmOqppkxWMZK9rTGlamTFaZNTZs2lcG07ng7CetznyubsYSsiRlMYrlk0TJlMF
YypVe5tNlV5MV5U6j/RPKcyn9LxqnU2fsnAn4MBzmn5n0PFwmNSP7UnokqDZzd5B4tmsH2P6
lxdw8W8lKjks9jK7K1MJNCPpjnFhJ6WrLJjJycHCae2nm9ctnhTsB2tmTebOt2PVSuybsp6G
3e2cXvNKyqx1tFSpJLPoi6TLLRTLCmYP8zzdVMtXukjzzD0ZjS2VOOolpMKbeUnWHylmyzMN
nfF5I7lRs1WfUqNFNyNYxlTlNTCcG7duxkMZNqdzk6O9W7iLdqeDtpV0cGhTFiX9rg4q+aYw
leUDrdrlPJk4zk6ptLpJZP9iLuYyVtOav+Tg9fW3mlbSXg6NSu1k4FPhO19DZWTjVK8FZNpL
irfymMmmnmrU+Rj1bvY02cHGZO1pV3lI3fau9EZatlkmIusktIk2ZjhlTJjGK4MoYODYacJp
lNTFYxXGVk6ppxaVqX3DZqJXvVl1McKV1saSreGRYy9DjNUx1tK0+qZF4tmqeD9rk6OtvOJO
p5PbOt4Kr1MJp6WnCxWzhKxtNNonBpLzbysbtnr5ulT5qZK6Mdw652yXcOydGS/0t1c3OVjK
nWrHUlijrVWQqxWQyYwVksmEremOuLlCsJbOLd63i5zU4wx/fNnfT4ysmMeFSL9FZPoJ73ul
tRZRWldTStNlcLaUf0ypflrefln1TT9bJ/m/F/U/NNPNXFXzz97m8XeJ++nY+dwHB2LRqplT
A1UsKUqKVFlLRSlKNa1rNZg0Aw3GtqzArMrWqzMzKdzsaG9iq3sZPBqpp70vkpXsE97cfPNN
ps7J1vMdqsf3MpjJXm8n7mnVU3cJjJkxkxlTGMY7nyMVXRw1Ki9r/NpVdTI2Vk5ObHobSuDu
akrowle15KrVSL0vB5tmz+EbPSup/g2XmEng/pe1w0cR6XuWWaSLrKWi8WtVVJVVSS7dhlye
prrOSmhHJhycl3Rdlwu6S99mzk6PF2UpzdGsdm7s6rtXSJOkVp49L3ve97363zF0mi8Xi7TD
EUwwuMRhhcYqrxeKxi2Kxi39brb/e2ztGrMRw7R/ydmUnDRdspsvHe4cLsV1j1MY6ld7afMr
2DjNKrwZTJlPUr3oe8V2vnmpxYPjNNK8X52NTZivnpzn2MbArmPomm0+9oK/kK834itpJ2sp
s+mcX1vKdTtfreD0DvnmrsldbFY5z62Kt6GSvRVTEujJtTG7VNSWpkMYxhNMJqGJYxWMKbMS
lZGSLg3YhJLpZJZZrBtFgYaOGkeSJu0dc4jaeDebv4yuUydo3aaqajU1VDabPxbzg8Uv4NMQ
uNN56mOLk0MmCsYrHOpuyYTJVcXNydH97FVpkxiu+cnN/0O6QuErtmpqFWOM09renWxwnc1O
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
pK8BzdTeSxXfT56XKbDZ/BxVzm0t0ukrrFan0PrVwdJXGdk05kp3Ten6ZlNlZOuYxklxV/Q/
BXufoeZK66nmO9+WeT6Qm07h6lekhkymnonF8quxsxWpL0TT2UrqpW7JlKyVWSx8Z/KnhTd3
zo83KnJznVT+xweufdMnqdY9CqxWMe51MlegeonOne004TxdGpT+4lcLo5To/Wxu/sfB6aU7
3ewo8xbSt3sfXtOFStmItK9Dg1Nmmp+ehqtSvrpu7FdilWyWIuLnVOE76MkVzS6nfQ0lvMFY
d9Dgl5OuXI9sqq9rg1Bpwc207lVplRV3sorjT1tPJg81ZT6WPxY8GFOuV//PKdc7VZK3ZNJJ
iu+dHYrYZPlf1OLdXjO8p81U7Z9pDEsYl6X7pjKcnQK5K4U9KWNfYN3jUyanFiqytqJplOun
Gslfi3S2pu4NpWT0q1St56mmm401VOpWwrm3ab1NpSrkxjEqtmps7Rg4ujjT52ypbK5PsbP7
nFvO5qlNSKwlivmV/BvDaHU/tV0cnzq9LJ3uM+h8s0MY7qVjnUr9U6OU9KtN2JO6aqp4uutP
OlYqpwfkanJ2u4Y2qq9TGMqaoapXGlqd7efar20tSu4Vxdz1zd/TPxnnMlY9b+KsbD/ClQ/e
/7Goc3rmpqrBVfcxSlaiacmxNhXJtJeTdK+aelWqSuNQ7G7Sq0U1DHt9rTS9FNmTKfbWTTrq
bNDaeuacWTZjgxhUXVHuaLPvjLSNGGY1XXfL7Vl1UwiayLtUmV31qdG7ZrEnClmXC7eJPwdG
74uwcKnScZ5K/KT4uCvW+2dsqnvYO6V5TvdbJiu9kK+YYTIZUqsp6Kp9U8qe5Xup8r0tCV6m
p9ExVbsV/ax/0P6wv/8XckU4UJBhTgWO

--dDRMvlgZJXvWKvBx
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="config.gz"
Content-Transfer-Encoding: base64

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

--dDRMvlgZJXvWKvBx--

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iNUEABYKAH0WIQSzlptPDvl9ch5jjr2cglpmBdQLvgUCXyORsV8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjM5
NjlCNEYwRUY5N0Q3MjFFNjM4RUJEOUM4MjVBNjYwNUQ0MEJCRQAKCRCcglpmBdQL
vrQuAQDBfPcEWp5cyWE7iXOIuBKb4YutxkcS75JXfqZk3AF0bAEAqeRmPTx4pGHU
qozQ1iMWWtD5nB04kzTiKAK3uERlWgc=
=R4zY
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
