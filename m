Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 627A9BC376
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2019 09:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392980AbfIXHz3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Sep 2019 03:55:29 -0400
Received: from mga17.intel.com ([192.55.52.151]:60484 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388712AbfIXHz3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Sep 2019 03:55:29 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 00:55:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; 
   d="scan'208";a="190944141"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 24 Sep 2019 00:55:26 -0700
Subject: Re: No SuperSpeedPlus on ASM2142
To:     =?UTF-8?Q?Lo=c3=afc_Yhuel?= <loic.yhuel@gmail.com>
Cc:     linux-usb@vger.kernel.org
References: <CANMwUkjb7sCTQKjZG8Dxgta=WrNFc4eRLnCtdbxCx_MJd93oYA@mail.gmail.com>
 <38c06b3b-d9b3-a175-9fb9-7d13f0501490@linux.intel.com>
 <CANMwUkj5kyxE21fDutTyPnW9vibpYwG_602YFO6tB=Mkr8905w@mail.gmail.com>
 <CANMwUkjWY0cNV9dJ1YWN+_9LBZb=Wcws7Vw52bR6CBMKyfTTJQ@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <36d828f1-eb5d-a75e-fe0d-0b95c35b527c@linux.intel.com>
Date:   Tue, 24 Sep 2019 10:57:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANMwUkjWY0cNV9dJ1YWN+_9LBZb=Wcws7Vw52bR6CBMKyfTTJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16.9.2019 23.53, Loïc Yhuel wrote:
> Le lun. 16 sept. 2019 à 17:19, Loïc Yhuel <loic.yhuel@gmail.com> a écrit :
>>
>>> Most reliable way of checking the current actual port speed is reading protocol speed id
>>> from the ports PORTSC register port-speed field.
>>> Use debugfs: (with your correct pci address and port number)
>> Currently I have "PortSpeed:4" which matches with the "Gen 1" trace.
>> If I even get a "Gen 2" trace again, I will check.
>>

Just fyi, turns out initial xHCI 1.1 spec was a bit unclear about SBRN
and minor revision numbers, later xHCI specs clarify them better.
A few USB 3.1 capable xHCI hosts were based on that spec, not just the ASM2142.
They have SBRN set to 30h and minor revision 0x1.
I'll send a patch to detect those correctly.

But it won't fix your inconsistency with PortSpeed bits in PORTSC register.

> 
> Btw, I found another problem on resuming the system after a suspend :
> [  137.029272] pcieport 0000:00:01.1: PME: Spurious native interrupt!
> ...
> [  137.129618] xhci_hcd 0000:08:00.0: WARN: xHC restore state timeout
> [  137.129624] xhci_hcd 0000:08:00.0: PCI post-resume error -110!
> [  137.129625] xhci_hcd 0000:08:00.0: HC died; cleaning up
> [  137.129633] PM: dpm_run_callback(): pci_pm_resume+0x0/0x90 returns -110
> [  137.129636] PM: Device 0000:08:00.0 failed to resume async: error -110
> Then a "echo 1 > remove, then "echo 1 > ../rescan" on sysfs got it back.
> This is a completely different issue, but at least, I can reproduce
> this one reliably.
> 

Looks like the xHCI PCI controller wasn't fully powered up to D0 state yet
when xhci_resume was called. Looks similar to what is discussed in thread:

https://marc.info/?l=linux-usb&m=156681068319529&w=2

-Mathias
