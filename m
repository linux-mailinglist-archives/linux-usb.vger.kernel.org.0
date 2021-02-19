Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB28231F6B0
	for <lists+linux-usb@lfdr.de>; Fri, 19 Feb 2021 10:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhBSJp2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Feb 2021 04:45:28 -0500
Received: from mga18.intel.com ([134.134.136.126]:7245 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229828AbhBSJpS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Feb 2021 04:45:18 -0500
IronPort-SDR: G3aNhRo9sXpN6TeXeyyO33zZ/74vPqXThSl/wl1HkIx+rhnzsPpgFdePPk0JKoAD7tzf1OOv5u
 mqx/bh27PngQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="171469139"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="171469139"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2021 01:43:09 -0800
IronPort-SDR: XSOZzK99CgwH2xX6xI6i4HtOwP13c7oD148TC/mWSBULLTwARE9vNehDMOFBst9hOaOklYpzbJ
 d+sou3uuKhOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="362898649"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 19 Feb 2021 01:43:01 -0800
Subject: Re: kworker takes 100% core after unplugging usb c hub
To:     Yiyu Zhu <danielzeltar@gmail.com>
Cc:     Greg KH <greg@kroah.com>, linux-usb@vger.kernel.org,
        mathias.nyman@linux.intel.com
References: <CAGv7gkgb12vGPvZcSE0aVOpu32zSgxaayYreLvWs+vJc5EkQrA@mail.gmail.com>
 <YCTS9I5xTVBDvwax@kroah.com>
 <CAGv7gkjoNt9gx_VPfEj=tauKAOcnOd+-2pCXyCoR=GPcHj7jxw@mail.gmail.com>
 <YCUI0h7qkY2PuJcT@kroah.com>
 <CAGv7gki7J1NVX3ti6Qhe9AFLp0JYRTRsT35zpDBTxxQ=te7-sQ@mail.gmail.com>
 <b4ae0847-23a2-c3e3-3ef2-17efdfc792ba@linux.intel.com>
 <CAGv7gkgLVTvBaGTUFd00daN0PBoqj2MbFk0dwnWKRL2odzD-8g@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 mQINBFMB0ccBEADd+nZnZrFDsIjQtclVz6OsqFOQ6k0nQdveiDNeBuwyFYykkBpaGekoHZ6f
 lH4ogPZzQ+pzoJEMlRGXc881BIggKMCMH86fYJGfZKWdfpg9O6mqSxyEuvBHKe9eZCBKPvoC
 L2iwygtO8TcXXSCynvXSeZrOwqAlwnxWNRm4J2ikDck5S5R+Qie0ZLJIfaId1hELofWfuhy+
 tOK0plFR0HgVVp8O7zWYT2ewNcgAzQrRbzidA3LNRfkL7jrzyAxDapuejuK8TMrFQT/wW53e
 uegnXcRJaibJD84RUJt+mJrn5BvZ0MYfyDSc1yHVO+aZcpNr+71yZBQVgVEI/AuEQ0+p9wpt
 O9Wt4zO2KT/R5lq2lSz1MYMJrtfFRKkqC6PsDSB4lGSgl91XbibK5poxrIouVO2g9Jabg04T
 MIPpVUlPme3mkYHLZUsboemRQp5/pxV4HTFR0xNBCmsidBICHOYAepCzNmfLhfo1EW2Uf+t4
 L8IowAaoURKdgcR2ydUXjhACVEA/Ldtp3ftF4hTQ46Qhba/p4MUFtDAQ5yeA5vQVuspiwsqB
 BoL/298+V119JzM998d70Z1clqTc8fiGMXyVnFv92QKShDKyXpiisQn2rrJVWeXEIVoldh6+
 J8M3vTwzetnvIKpoQdSFJ2qxOdQ8iYRtz36WYl7hhT3/hwkHuQARAQABtCdNYXRoaWFzIE55
 bWFuIDxtYXRoaWFzLm55bWFuQGdtYWlsLmNvbT6JAjsEEwECACUCGwMGCwkIBwMCBhUIAgkK
 CwQWAgMBAh4BAheABQJTAeo1AhkBAAoJEFiDn/uYk8VJOdIP/jhA+RpIZ7rdUHFIYkHEKzHw
 tkwrJczGA5TyLgQaI8YTCTPSvdNHU9Rj19mkjhUO/9MKvwfoT2RFYqhkrtk0K92STDaBNXTL
 JIi4IHBqjXOyJ/dPADU0xiRVtCHWkBgjEgR7Wihr7McSdVpgupsaXhbZjXXgtR/N7PE0Wltz
 hAL2GAnMuIeJyXhIdIMLb+uyoydPCzKdH6znfu6Ox76XfGWBCqLBbvqPXvk4oH03jcdt+8UG
 2nfSeti/To9ANRZIlSKGjddCGMa3xzjtTx9ryf1Xr0MnY5PeyNLexpgHp93sc1BKxKKtYaT0
 lR6p0QEKeaZ70623oB7Sa2Ts4IytqUVxkQKRkJVWeQiPJ/dZYTK5uo15GaVwufuF8VTwnMkC
 4l5X+NUYNAH1U1bpRtlT40aoLEUhWKAyVdowxW4yGCP3nL5E69tZQQgsag+OnxBa6f88j63u
 wxmOJGNXcwCerkCb+wUPwJzChSifFYmuV5l89LKHgSbv0WHSN9OLkuhJO+I9fsCNvro1Y7dT
 U/yq4aSVzjaqPT3yrnQkzVDxrYT54FLWO1ssFKAOlcfeWzqrT9QNcHIzHMQYf5c03Kyq3yMI
 Xi91hkw2uc/GuA2CZ8dUD3BZhUT1dm0igE9NViE1M7F5lHQONEr7MOCg1hcrkngY62V6vh0f
 RcDeV0ISwlZWuQINBFMB0ccBEACXKmWvojkaG+kh/yipMmqZTrCozsLeGitxJzo5hq9ev31N
 2XpPGx4AGhpccbco63SygpVN2bOd0W62fJJoxGohtf/g0uVtRSuK43OTstoBPqyY/35+VnAV
 oA5cnfvtdx5kQPIL6LRcxmYKgN4/3+A7ejIxbOrjWFmbWCC+SgX6mzHHBrV0OMki8R+NnrNa
 NkUmMmosi7jBSKdoi9VqDqgQTJF/GftvmaZHqgmVJDWNrCv7UiorhesfIWPt1O/AIk9luxlE
 dHwkx5zkWa9CGYvV6LfP9BznendEoO3qYZ9IcUlW727Le80Q1oh69QnHoI8pODDBBTJvEq1h
 bOWcPm/DsNmDD8Rwr/msRmRyIoxjasFi5WkM/K/pzujICKeUcNGNsDsEDJC5TCmRO/TlvCvm
 0X+vdfEJRZV6Z+QFBflK1asUz9QHFre5csG8MyVZkwTR9yUiKi3KiqQdaEu+LuDD2CGF5t68
 xEl66Y6mwfyiISkkm3ETA4E8rVZP1rZQBBm83c5kJEDvs0A4zrhKIPTcI1smK+TWbyVyrZ/a
 mGYDrZzpF2N8DfuNSqOQkLHIOL3vuOyx3HPzS05lY3p+IIVmnPOEdZhMsNDIGmVorFyRWa4K
 uYjBP/W3E5p9e6TvDSDzqhLoY1RHfAIadM3I8kEx5wqco67VIgbIHHB9DbRcxQARAQABiQIf
 BBgBAgAJBQJTAdHHAhsMAAoJEFiDn/uYk8VJb7AQAK56tgX8V1Wa6RmZDmZ8dmBC7W8nsMRz
 PcKWiDSMIvTJT5bygMy1lf7gbHXm7fqezRtSfXAXr/OJqSA8LB2LWfThLyuuCvrdNsQNrI+3
 D+hjHJjhW/4185y3EdmwwHcelixPg0X9EF+lHCltV/w29Pv3PiGDkoKxJrnOpnU6jrwiBebz
 eAYBfpSEvrCm4CR4hf+T6MdCs64UzZnNt0nxL8mLCCAGmq1iks9M4bZk+LG36QjCKGh8PDXz
 9OsnJmCggptClgjTa7pO6040OW76pcVrP2rZrkjo/Ld/gvSc7yMO/m9sIYxLIsR2NDxMNpmE
 q/H7WO+2bRG0vMmsndxpEYS4WnuhKutoTA/goBEhtHu1fg5KC+WYXp9wZyTfeNPrL0L8F3N1
 BCEYefp2JSZ/a355X6r2ROGSRgIIeYjAiSMgGAZMPEVsdvKsYw6BH17hDRzltNyIj5S0dIhb
 Gjynb3sXforM/GVbr4mnuxTdLXQYlj2EJ4O4f0tkLlADT7podzKSlSuZsLi2D+ohKxtP3U/r
 42i8PBnX2oAV0UIkYk7Oel/3hr0+BP666SnTls9RJuoXc7R5XQVsomqXID6GmjwFQR5Wh/RE
 IJtkiDAsk37cfZ9d1kZ2gCQryTV9lmflSOB6AFZkOLuEVSC5qW8M/s6IGDfYXN12YJaZPptJ fiD/
Message-ID: <5d3c5b2d-4752-7253-66f3-945c06f8a980@linux.intel.com>
Date:   Fri, 19 Feb 2021 11:44:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGv7gkgLVTvBaGTUFd00daN0PBoqj2MbFk0dwnWKRL2odzD-8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Yiyu Zhu

On 17.2.2021 10.50, Yiyu Zhu wrote:
> Hi Mathias,
> 
> Hi
> 
>>
>> Could you add usbcore dynamic debug, it should show more details about hub activity.
>>
>> mount -t debugfs none /sys/kernel/debug
>> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
>>
> Here are the dmesg after I enabled dynamic debug.
> 

...

> (at hub disconnection)
> [18848.819858] [drm] PCIE GART of 256M enabled (table at 0x000000F400000000).
> [18848.999416] [drm] UVD and UVD ENC initialized successfully.
> [18849.100370] [drm] VCE initialized successfully.
> [18946.839352] usb 1-3: USB disconnect, device number 8
> [18946.839373] usb 1-3.1: USB disconnect, device number 9
> [18946.840644] usb 1-3.5: USB disconnect, device number 10
> [18946.890865] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -71
> [18946.916623] r8152 4-2.1.3:1.0 enx00e04cb5877c: Stop submitting
> intr, status -71
> [18947.068201] usb usb3-port2: over-current condition
> [18947.604290] usb 4-2: USB disconnect, device number 2
> [18947.604307] usb 4-2.1: USB disconnect, device number 3
> [18947.604315] usb 4-2.1.3: USB disconnect, device number 4
> [18947.604721] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -108
> [18947.604748] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -108
> [18947.604756] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -108
> [18947.604763] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -108
> [18947.685529] usb 4-2.1.4: USB disconnect, device number 5
> [18948.304163] usb usb4-port2: over-current condition
> 

Hmm, I think something went wrong when enabling usbcore dynamic degug.
I was expecting more hub messages.
Is CONFIG_DYNAMIC_DEBUG set?
Is this a snippet from console or dmesg? maybe some issues with log level
(/proc/sys/kernel/printk)?

The other cpu hogging worker was related to pm, maybe adding initcall_debug
boot option to the kernel cmdline could reveal something. 

>>
>> hub reports overcurrent condition, worth keeping in mind.
>>
> This condition can actually persist through reboot. Which causes the
> kworker to spawn immediately after boot.
> 
>>
>> Is this xHC contoller in a Alpine Ridge/Titan Ridge/Maple Ridge based system
>> that has runtime PM enabled by default, and whole xHC controller
>> disappears from PCI bus when last device is disconnected?
>> (check with lspci -nn)
>>
> It is an Alpine Ridge controller. Here is the `lspci -nn` output
> 
> 00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v6/7th Gen
> Core Processor Host Bridge/DRAM Registers [8086:5910] (rev 05)
> 00:01.0 PCI bridge [0604]: Intel Corporation Xeon E3-1200 v5/E3-1500
> v5/6th Gen Core Processor PCIe Controller (x16) [8086:1901] (rev 05)
> 00:02.0 VGA compatible controller [0300]: Intel Corporation Device
> [8086:591b] (rev 04)
> 00:04.0 Signal processing controller [1180]: Intel Corporation Xeon
> E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem
> [8086:1903] (rev 05)
> 00:13.0 Non-VGA unclassified device [0000]: Intel Corporation 100
> Series/C230 Series Chipset Family Integrated Sensor Hub [8086:a135]
> (rev 31)
> 00:14.0 USB controller [0c03]: Intel Corporation 100 Series/C230
> Series Chipset Family USB 3.0 xHCI Controller [8086:a12f] (rev 31)
> 00:14.2 Signal processing controller [1180]: Intel Corporation 100
> Series/C230 Series Chipset Family Thermal Subsystem [8086:a131] (rev
> 31)
> 00:15.0 Signal processing controller [1180]: Intel Corporation 100
> Series/C230 Series Chipset Family Serial IO I2C Controller #0
> [8086:a160] (rev 31)
> 00:16.0 Communication controller [0780]: Intel Corporation 100
> Series/C230 Series Chipset Family MEI Controller #1 [8086:a13a] (rev
> 31)
> 00:17.0 SATA controller [0106]: Intel Corporation HM170/QM170 Chipset
> SATA Controller [AHCI Mode] [8086:a103] (rev 31)
> 00:1c.0 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series
> Chipset Family PCI Express Root Port #1 [8086:a110] (rev f1)
> 00:1c.4 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series
> Chipset Family PCI Express Root Port #5 [8086:a114] (rev f1)
> 00:1c.5 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series
> Chipset Family PCI Express Root Port #6 [8086:a115] (rev f1)
> 00:1d.0 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series
> Chipset Family PCI Express Root Port #9 [8086:a118] (rev f1)
> 00:1e.0 Signal processing controller [1180]: Intel Corporation 100
> Series/C230 Series Chipset Family Serial IO UART #0 [8086:a127] (rev
> 31)
> 00:1e.2 Signal processing controller [1180]: Intel Corporation 100
> Series/C230 Series Chipset Family Serial IO GSPI #0 [8086:a129] (rev
> 31)
> 00:1f.0 ISA bridge [0601]: Intel Corporation HM175 Chipset LPC/eSPI
> Controller [8086:a152] (rev 31)
> 00:1f.2 Memory controller [0580]: Intel Corporation 100 Series/C230
> Series Chipset Family Power Management Controller [8086:a121] (rev 31)
> 00:1f.3 Audio device [0403]: Intel Corporation CM238 HD Audio
> Controller [8086:a171] (rev 31)
> 00:1f.4 SMBus [0c05]: Intel Corporation 100 Series/C230 Series Chipset
> Family SMBus [8086:a123] (rev 31)
> 01:00.0 Display controller [0380]: Advanced Micro Devices, Inc.
> [AMD/ATI] Polaris 22 [Radeon RX Vega M GL] [1002:694e] (rev c0)
> 02:00.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> 03:00.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> 03:01.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> 03:02.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> 03:04.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> 38:00.0 USB controller [0c03]: Intel Corporation JHL6540 Thunderbolt 3
> USB Controller (C step) [Alpine Ridge 4C 2016] [8086:15d4] (rev 02)
> 6d:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd.
> RTS525A PCI Express Card Reader [10ec:525a] (rev 01)
> 6e:00.0 Network controller [0280]: Intel Corporation Wireless 8265 /
> 8275 [8086:24fd] (rev 78)
> 6f:00.0 Non-Volatile memory controller [0108]: Sandisk Corp Device [15b7:5002]
> 
> One thing I notice is that when the hub is disconnected, the USB
> controller is still there.
> It will remain there until I plug and unplug another device. After
> that, the following section will be gone.
> 
> 02:00.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> 03:00.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> 03:01.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> 03:02.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> 03:04.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> 38:00.0 USB controller [0c03]: Intel Corporation JHL6540 Thunderbolt 3
> USB Controller (C step) [Alpine Ridge 4C 2016] [8086:15d4] (rev 02)
> 
>> Does it help if another USB device is connected to a different
>> roothub port of this xHC while disconnecting the hub?
>> Or does just disabling runtime PM for this xhci help?
>>
> I tried with another usb device on the root hub port. But it does not help.
> I am not sure about how to disable runtime PM. I tried to use `echo on
>> .../0000:38:00.0/power/control` (its value was auto). But it also
> does not help.
> 
> Thanks
> Yiyu Zhu
> 

Ok, thanks for the info
-Mathias
