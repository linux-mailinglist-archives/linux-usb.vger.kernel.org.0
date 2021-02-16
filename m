Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2972731CD21
	for <lists+linux-usb@lfdr.de>; Tue, 16 Feb 2021 16:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhBPPrL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Feb 2021 10:47:11 -0500
Received: from mga09.intel.com ([134.134.136.24]:28384 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229708AbhBPPrI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Feb 2021 10:47:08 -0500
IronPort-SDR: ah5sej27TDiVWu/oeK5j6Lgt2QqhE4LZwY6lVS5Nl6tRM0P+k1qlLolIJ+Dps+ewBgOHE2cv51
 fZjJqrua2qXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="183054308"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="183054308"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 07:45:20 -0800
IronPort-SDR: 19Nv4njqmOh+39Y4aZ+/HO/4ofDzlW5i8Vs6sUVrSWorziZrJRagpXJtA87xxv8ltm9B/fnNrk
 DdJjtrFRt09Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="493328914"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2021 07:45:18 -0800
Subject: Re: kworker takes 100% core after unplugging usb c hub
To:     Yiyu Zhu <danielzeltar@gmail.com>, Greg KH <greg@kroah.com>
Cc:     linux-usb@vger.kernel.org, mathias.nyman@intel.linux.com
References: <CAGv7gkgb12vGPvZcSE0aVOpu32zSgxaayYreLvWs+vJc5EkQrA@mail.gmail.com>
 <YCTS9I5xTVBDvwax@kroah.com>
 <CAGv7gkjoNt9gx_VPfEj=tauKAOcnOd+-2pCXyCoR=GPcHj7jxw@mail.gmail.com>
 <YCUI0h7qkY2PuJcT@kroah.com>
 <CAGv7gki7J1NVX3ti6Qhe9AFLp0JYRTRsT35zpDBTxxQ=te7-sQ@mail.gmail.com>
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
Message-ID: <b4ae0847-23a2-c3e3-3ef2-17efdfc792ba@linux.intel.com>
Date:   Tue, 16 Feb 2021 17:46:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGv7gki7J1NVX3ti6Qhe9AFLp0JYRTRsT35zpDBTxxQ=te7-sQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 12.2.2021 0.11, Yiyu Zhu wrote:
> I was trying to unplug the hub manually so that I can trigger this
> issue. The kworker only shows up when the hub is actually
> disconnected. They will be gone if any thing is connected back into
> the port.
> 
> The hub works normally when it is connected. And no additional dmesg is printed.

Could you add usbcore dynamic debug, it should show more details about hub activity.

mount -t debugfs none /sys/kernel/debug
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control

>>> [ 2798.677498] usb usb3-port2: over-current condition

hub reports overcurrent condition, worth keeping in mind.

>>> [ 2799.209385] usb 4-2: USB disconnect, device number 2
>>> [ 2799.209392] usb 4-2.1: USB disconnect, device number 3
>>> [ 2799.209396] usb 4-2.1.3: USB disconnect, device number 4
>>> [ 2799.302548] usb 4-2.1.4: USB disconnect, device number 5
>>> [ 2799.633505] usb 4-2.1-port4: cannot disable (err = -110)
>>> [ 2800.181325] usb usb4-port2: over-current condition
>>> [ 2818.993944] xhci_hcd 0000:38:00.0: xHCI host controller not
>>> responding, assume dead
>>> [ 2818.993956] xhci_hcd 0000:38:00.0: HC died; cleaning up
>>> [ 2819.126421] xhci_hcd 0000:38:00.0: remove, state 1
>>> [ 2819.126431] usb usb4: USB disconnect, device number 1
>>> [ 2819.154189] xhci_hcd 0000:38:00.0: USB bus 4 deregistered
>>> [ 2819.154206] xhci_hcd 0000:38:00.0: remove, state 1
>>> [ 2819.154211] usb usb3: USB disconnect, device number 1
>>> [ 2819.154684] xhci_hcd 0000:38:00.0: Host halt failed, -19
>>> [ 2819.154689] xhci_hcd 0000:38:00.0: Host not accessible, reset failed.
>>> [ 2819.154900] xhci_hcd 0000:38:00.0: USB bus 3 deregistered
>>> [ 2819.156059] pcieport 0000:03:00.0: can't change power state from
>>> D3cold to D0 (config space inaccessible)
>>> [ 2819.156709] pci_bus 0000:04: busn_res: [bus 04] is released
>>> [ 2819.156776] pci_bus 0000:05: busn_res: [bus 05-37] is released
>>> [ 2819.169419] pci_bus 0000:38: busn_res: [bus 38] is released
>>> [ 2819.169491] pci_bus 0000:39: busn_res: [bus 39-6c] is released
>>> [ 2819.169533] pci_bus 0000:03: busn_res: [bus 03-6c] is released

Is this xHC contoller in a Alpine Ridge/Titan Ridge/Maple Ridge based system
that has runtime PM enabled by default, and whole xHC controller
disappears from PCI bus when last device is disconnected?
(check with lspci -nn)

Does it help if another USB device is connected to a different
roothub port of this xHC while disconnecting the hub?
Or does just disabling runtime PM for this xhci help?

Thanks
Mathias

