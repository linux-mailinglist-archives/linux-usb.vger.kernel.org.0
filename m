Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6877E32141D
	for <lists+linux-usb@lfdr.de>; Mon, 22 Feb 2021 11:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbhBVKZg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Feb 2021 05:25:36 -0500
Received: from mx2.suse.de ([195.135.220.15]:51376 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230386AbhBVKZJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Feb 2021 05:25:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1613989462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IRvh/SfHQe7PH8B4GbhqgrsIL5h3bXv4MJUn2RE/9bM=;
        b=PwrV53aWQPXjDzqSZoFA6FVWvycAsfyDMpGsLwN8hFpRYPFQ7FuaPz5DByMzIL3Mh4w5Po
        Z5hgYscM0LKuq8GZmbnsPHSwJeE4l59RHKlxJDZ93VAMr0cWo1ieFXM3k5ihsM3h3hDpwO
        DgWSlZoaeqAUaZZ2PehVLvoeQx/E/K8=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id F1363AF52;
        Mon, 22 Feb 2021 10:24:21 +0000 (UTC)
Message-ID: <cdb0ab8e14de5f93dfae2164f18d9d1703b3fc36.camel@suse.com>
Subject: Re: Samsung T5 500 GB USB3.1 SSD fails with ASMedia ASM1142, 250 GB
 version works
From:   Oliver Neukum <oneukum@suse.com>
To:     Jonathan Woithe <jwoithe@just42.net>, linux-usb@vger.kernel.org
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>
Date:   Mon, 22 Feb 2021 11:24:18 +0100
In-Reply-To: <20210219102218.GA29156@marvin.atrad.com.au>
References: <20210219102218.GA29156@marvin.atrad.com.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, den 19.02.2021, 20:52 +1030 schrieb Jonathan Woithe:
> Hi all
> 
> 

Hi,

> Since some people have reported success with ASMedia cards if the uas driver
> is prevented from loading, I tried this too.
> 
>   rmmod uas
>   rmmod usb-storage
>   modprobe usb-storage quirks=04e8:61f5:u

this rules out an issue with UAS.

> This still ended in failure along similar lines:
> 
>   usb 4-1: new SuperSpeedPlus Gen 2 USB device number 3 using xhci_hcd
>   usb-storage 4-1:1.0: USB Mass Storage device detected
>   usb-storage 4-1:1.0: Quirks match for vid 04e8 pid 61f5: 800000
>   scsi host10: usb-storage 4-1:1.0
>   usb 4-1: reset SuperSpeedPlus Gen 2 USB device number 3 using xhci_hcd (x6)
>   sd 10:0:0:0: [sdd] tag#0 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=0x00 cmd_age=0s
>   sd 10:0:0:0: [sdd] tag#0 CDB: opcode=0x2a 2a 00 23 1c 34 30 00 02 00 00
> 
> After 7 repeats of the above sequence the operation failed.
> 
> It may be helpful to know that the same 500 GB SSD does work on a different
> machine when connected to usbc or usb3 ports with kernel 4.4.19.  These
> ports on that machine are provided by a mainboard host controller:

Is it bus powered or self powered?
It is possible that the other machine can just supply more power.

> 00:14.0 USB controller: Intel Corporation C610/X99 series chipset USB xHCI Host Controller (rev 05) (prog-if 30 [XHCI])
>         Subsystem: Gigabyte Technology Co., Ltd C610/X99 series chipset USB xHCI Host Controller
>         Flags: bus master, medium devsel, latency 0, IRQ 19
>         Memory at fa220000 (64-bit, non-prefetchable) [size=64K]
>         Capabilities: [70] Power Management version 2
>         Kernel driver in use: xhci_hcd
>         Kernel modules: xhci_pci
> 38:00.0 USB controller: Intel Corporation Device 15b6 (prog-if 30 [XHCI])
>         Subsystem: Device 2222:1111
>         Flags: bus master, fast devsel, latency 0, IRQ 41
>         Memory at f3f00000 (32-bit, non-prefetchable) [size=64K]
>         Capabilities: [80] Power Management version 3
>         Capabilities: [88] MSI: Enable+ Count=1/8 Maskable- 64bit+
>         Capabilities: [c0] Express Endpoint, MSI 00
>         Capabilities: [100] Device Serial Number 92-5c-85-88-c2-23-04-00
>         Capabilities: [200] Advanced Error Reporting
>         Capabilities: [300] Virtual Channel
>         Capabilities: [400] Power Budgeting <?>
>         Capabilities: [500] Vendor Specific Information: ID=1234 Rev=1 Len=0d8 <?>
>         Capabilities: [600] Latency Tolerance Reporting
>         Capabilities: [700] #19
>         Kernel driver in use: xhci_hcd
>         Kernel modules: xhci_pci
> 
> This shows there's nothing inherently wrong with the SSD.

Either this is a power issue or an issue in the HC triggered by the
xhci driver. That looks like a report for Mathias.

	Regards
		Oliver



