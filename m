Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D745B33249B
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 13:01:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbhCIMAx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 07:00:53 -0500
Received: from mga07.intel.com ([134.134.136.100]:41107 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230395AbhCIMAg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Mar 2021 07:00:36 -0500
IronPort-SDR: HXCINy/WKsqHQDHHku1+p8gzH/3iV8UoARqNLKgEk0ben+tA0hCawVs71IOqqrcEczY/4REZhN
 u+3TXDqWhl6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="252236989"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="252236989"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 04:00:35 -0800
IronPort-SDR: PBmd2aCHRCBaxLREDTpyUYY6B0Rnv59gjwxUgVYXm4Ka9LzSSyAQfNSmZKvcykP7Z5v+qJB5Lo
 BABPRWALbGQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="386203265"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga002.jf.intel.com with ESMTP; 09 Mar 2021 04:00:34 -0800
Subject: Re: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        William Allen <william.allentx@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
References: <CAKRa1U6rukBBwWx0vN2wqiHMbUH9zWsc-y1wknOCvhueqWsT7w@mail.gmail.com>
 <221f3bec-e1cc-0b03-6860-c8660d72185a@synopsys.com>
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
Message-ID: <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
Date:   Tue, 9 Mar 2021 14:02:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <221f3bec-e1cc-0b03-6860-c8660d72185a@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9.3.2021 9.27, Thinh Nguyen wrote:
> + Mathias
> 
> Hi,
> 
> William Allen wrote:
>> I've never submitted to the mailing list before, so please excuse any
>> formalities that I may not be observing.
>> I would like to be able to use USB 3.2 Gen2x2 "SuperSpeed+²⁰Gbps"
>> under Linux. I've tried several different kernel versions, and have
>> built the kernel from the usb-next tree. All without finding proper
>> functionality.
>>
>> I have an Ableconn PEX-UB159 USB 3.2 Gen 2x2 PCIe expansion card, with
>> the ASM3242 controller. This controller appears to be the only Gen2x2
>> capable controller that exists in commercial products- so far as I've
>> found. Everything appears to work, except for "SuperSpeed+²⁰Gbps" when
>> I plug in a capable device.
>> Here is the dmesg output as soon as I plug in a Gen2x2 WD P50 Black
>> External NVMe SSD, using an appropriate SuperSpeed+²⁰Gbps certified
>> cable:
>> 5.11.2-arch1-1
>> --------------------
>> usb 7-2: new SuperSpeedPlus Gen 2 USB device number 3 using xhci_hcd
>> usb 7-2: New USB device found, idVendor=1058, idProduct=2642, bcdDevice=10.03
>> usb 7-2: New USB device strings: Mfr=2, Product=3, SerialNumber=1
>> usb 7-2: Product: Game Drive
>> usb 7-2: Manufacturer: Western Digital
>> usb 7-2: SerialNumber: 323130334431343030303736
>> scsi host11: uas
>> scsi 11:0:0:0: Direct-Access     WD       Game Drive       1003 PQ: 0 ANSI: 6
>> scsi 11:0:0:1: Enclosure         WD       SES Device       1003 PQ: 0 ANSI: 6
>> sd 11:0:0:0: [sdf] 3907029168 512-byte logical blocks: (2.00 TB/1.82 TiB)
>> sd 11:0:0:0: [sdf] Write Protect is off
>> sd 11:0:0:0: [sdf] Mode Sense: 57 00 10 00
>> sd 11:0:0:0: [sdf] Write cache: enabled, read cache: enabled, supports
>> DPO and FUA
>> sd 11:0:0:0: [sdf] Optimal transfer size 33553920 bytes
>> sd 11:0:0:0: [sdf] Attached SCSI disk
>>
>>  When I saw commits referring to Gen2x2 in the usb-next repo, I built
>> off that, and also ran linux-next-git.r0.gabaf6f60176f-1 from AUR,
>> both giving me the same results/output:
>> linux-next-git.r0.gabaf6f60176f-1
>> ----------------------------------------------
>> usb 5-1: new SuperSpeed Gen 1x2 USB device number 3 using xhci_hcd
>> usb 5-1: New USB device found, idVendor=1058, idProduct=2642, bcdDevice=10.03
>> usb 5-1: New USB device strings: Mfr=2, Product=3, SerialNumber=1
>> usb 5-1: Product: Game Drive
>> usb 5-1: Manufacturer: Western Digital
>> usb 5-1: SerialNumber: 323130334431343030303736
>> scsi host7: uas
>> scsi 7:0:0:0: Direct-Access     WD       Game Drive       1003 PQ: 0 ANSI: 6
>> scsi 7:0:0:1: Enclosure         WD       SES Device       1003 PQ: 0 ANSI: 6
>> ses 7:0:0:1: Attached Enclosure device
>> ses 7:0:0:1: Failed to get diagnostic page 0x1
>> ses 7:0:0:1: Failed to bind enclosure -19
>> sd 7:0:0:0: [sdf] 3907029168 512-byte logical blocks: (2.00 TB/1.82 TiB)
>> sd 7:0:0:0: [sdf] Write Protect is off
>> sd 7:0:0:0: [sdf] Mode Sense: 57 00 10 00
>> sd 7:0:0:0: [sdf] Write cache: enabled, read cache: enabled, supports
>> DPO and FUA
>> sd 7:0:0:0: [sdf] Optimal transfer size 33553920 bytes
>> sd 7:0:0:0: [sdf] Attached SCSI disk
>>
>> See that it's detecting it as Gen 1x2.
>> The output of lsusb -t shows that it is connected at 5000M using the
>> uas driver. Even my much slower USB 3.1 SSDs connect at 10000M on the
>> exact same port.
>> When I attach the Gen2x2 NVMe SSD to my other 3.2 Gen2 card, it
>> connects at 10000M, so It seems to be directly related to a
>> mishandling when the Gen2x2 device gets recognized by the Gen2x2 card.
>>
>> lspci output from 5.11.2-arch1-1:
>> -------------------------------------------
>> USB controller: ASMedia Technology Inc. ASM3242 USB 3.2 Host
>> Controller (prog-if 30 [XHCI])
>> Subsystem: ASMedia Technology Inc. ASM3242 USB 3.2 Host Controller
>> Physical Slot: 1
>> Flags: bus master, fast devsel, latency 0, IRQ 62, NUMA node 0
>> Memory at f7df0000 (64-bit, non-prefetchable) [size=32K]
>> Capabilities: [50] MSI: Enable- Count=1/8 Maskable- 64bit+
>> Capabilities: [68] MSI-X: Enable+ Count=8 Masked-
>> Capabilities: [78] Power Management version 3
>> Capabilities: [80] Express Legacy Endpoint, MSI 00
>> Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 0201
>> Capabilities: [100] Advanced Error Reporting
>> Capabilities: [200] Secondary PCI Express
>> Capabilities: [300] Latency Tolerance Reporting
>> Capabilities: [400] L1 PM Substates
>> Kernel driver in use: xhci_hcd
>> Kernel modules: xhci_pci
>>
>> I'm happy to test anything, or file this somewhere more appropriate if
>> you could point me in the right direction.
> 
> Currently the usb host stack doesn't really support USB 3.2 yet, at
> least the speed check part. I made some updates to handle that.
> 
> You apply these patches and test on your setup
> https://patchwork.kernel.org/project/linux-usb/list/?series=427561
> 
> Hopefully Mathias will have time to review and Ack them for the next
> release cycle.

Thanks for the reminder, added some comments to the series

-Mathias

