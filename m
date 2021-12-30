Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B888481CA2
	for <lists+linux-usb@lfdr.de>; Thu, 30 Dec 2021 14:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239700AbhL3NsH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Dec 2021 08:48:07 -0500
Received: from mga09.intel.com ([134.134.136.24]:9029 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235821AbhL3NsG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Dec 2021 08:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640872086; x=1672408086;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=vYO07zlSO99fZ4d9wy+kq5hQLVUVhzkwDoYeQtllGpk=;
  b=Bb80nx8yyKMii2jNZ6NQjqKiOxEFyWsZF6CjGqY2MmBu4kmF+FofkVis
   J6RtW2p3JSGjZuB7WsHGKbbNnfZ10W6V64lxPjbNjHY2MZxn3adWlUukz
   eX/F/w6IC8+hrAQv16mEvsn6tzhG/oXsjXJmFbZnoKsbqqlcctQLwYPyS
   Co1c4N9ZmQdW+5i7gFJNz3owI827kozotflOexpaNWalKKrUav+EtLXHO
   wjmM2r37y8mCTYDMq52qEpzK+2gXnt1a5lYlxoFn9uuy8MAe5kkl7C6hh
   7X1BFDnUcV6kHkeF/0rMTadBuL1Rtcv0o69swuqHF/xxi45vzGhuHAsnI
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10212"; a="241472663"
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600"; 
   d="scan'208";a="241472663"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2021 05:48:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600"; 
   d="scan'208";a="619371360"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 30 Dec 2021 05:48:04 -0800
Subject: Re: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
To:     Greg KH <gregkh@linuxfoundation.org>,
        youling257 <youling257@gmail.com>
Cc:     mathias.nyman@intel.com, william.allentx@gmail.com,
        linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com
References: <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
 <20211230131014.21886-1-youling257@gmail.com> <Yc20WPbIad44/3rd@kroah.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <f8fc1b81-775f-110d-9ec0-c3a873257fe5@linux.intel.com>
Date:   Thu, 30 Dec 2021 15:49:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Yc20WPbIad44/3rd@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 30.12.2021 15.30, Greg KH wrote:
> On Thu, Dec 30, 2021 at 09:10:14PM +0800, youling257 wrote:
>> where i can find the series patch? https://patchwork.kernel.org/project/linux-usb/list/?series=427561
> 
> There is nothing at that link.
> 
> What is the lore.kernel.org link for the patch you are curious about?

That series should be in 5.13

https://lore.kernel.org/linux-usb/cover.1615432770.git.Thinh.Nguyen@synopsys.com/

> 
>> when i used maiwo k1690(10gbps) connect to ASM3242 Controller, only 500MB/s.
>> cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb3/speed, 480
>> cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/speed, 20000
>> maiwo k1690 is on /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/4-1.
>> cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/4-1/speed, 5000
>>
>>
>> 01:00.0 USB controller: ASMedia Technology Inc. ASM3242 USB 3.2 Host Controller (prog-if 30 [XHCI])
>>         Subsystem: ASMedia Technology Inc. ASM3242 USB 3.2 Host Controller
>>
>> [    0.359281] xhci_hcd 0000:01:00.0: xHCI Host Controller
>> [    0.359283] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 2
>> [    0.359285] xhci_hcd 0000:01:00.0: Host supports USB 3.2 Enhanced SuperSpeed
>>
>> [ 1191.734123] usb 4-1: new SuperSpeed USB device number 2 using xhci_hcd
>> [ 1191.794767] usb-storage 4-1:1.0: USB Mass Storage device detected
>> [ 1191.795049] scsi host9: usb-storage 4-1:1.0
>> [ 1051.051274] scsi 9:0:0:0: Direct-Access     Realtek  USB 3.2 Device   1.00 PQ: 0 ANSI: 6
>> [ 1051.051442] sd 9:0:0:0: Attached scsi generic sg0 type 0
>> [ 1051.054461] sd 9:0:0:0: [sda] 500118192 512-byte logical blocks: (256 GB/238 GiB)
>> [ 1051.055068] sd 9:0:0:0: [sda] Write Protect is off
>> [ 1051.055073] sd 9:0:0:0: [sda] Mode Sense: 37 00 00 08
>> [ 1051.055716] sd 9:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
>> [ 1051.072131]  sda: sda1 sda2
>>
>> i don't have NVMe to USB 2x2 Enclosure (ASM2364 chipset), i have NVMe to USB 2x1 Enclosure (RTL9120B chipset), maiwo k1690, using it on PciExpress X4 add in card (ASM3242 chipset), it only 5Gbps speed, should be 10Gbps.
>>
> 
> Are you sure that your hardware can really support this?  Do you have
> the right cable and the device will support this speed?
> 
> And most important, what kernel version are you using?
> 
> thanks,
> 
> greg k-h
> 

