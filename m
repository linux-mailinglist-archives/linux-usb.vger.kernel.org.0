Return-Path: <linux-usb+bounces-20922-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 030E7A3F384
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 12:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7B127A88BA
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 11:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46355209F27;
	Fri, 21 Feb 2025 11:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="Wh5p1Ft8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D1F20968E
	for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2025 11:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740138908; cv=none; b=NVeo45OR4+ZoAikwUEdub7kV7q1OhI3sj6n9IxNPWBEz/cXAhiC9DuUa63WaKJ7EjVx+1Zxrf33M0h1/FSHmLFCZpUPXr9ykX7gSL5fipscVbrXI7PUuSqfbxAaF8FeFiNvnFhaj8L2CXQcajPPNjBtBXeT8EWq+wPZpTKjbvmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740138908; c=relaxed/simple;
	bh=5Gpsr5d3bKpKT9JVsiTL0XIOMqGinIvPO6xxi0a+/kM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Xfgd3pNbOcwataTIQ35rj7zsQHYoGggpRyuFjVn6ZigyTcnKAUadGHJjVXnJixH30QidRq8f8Uj6ceRQN2YlSV+Xd7zZoa2Xsq6c1maynSEOsbfpHaCmnQX1Lxi3PK8KWVP1YBlo6BZjoGmKJ+aGBytlxLtuscwM0wnWfm7R10o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=Wh5p1Ft8; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id A4DD52087B;
	Fri, 21 Feb 2025 12:54:57 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fR_R-oXTlT3i; Fri, 21 Feb 2025 12:54:57 +0100 (CET)
Received: from cas-essen-01.secunet.de (rl1.secunet.de [10.53.40.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id 07F842076B;
	Fri, 21 Feb 2025 12:54:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com 07F842076B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1740138897;
	bh=sw15fREbC4owO0RksylCBOifpqissdp/ucrvs0BONr8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:From;
	b=Wh5p1Ft807h6DU2wbaJWx1UjzxH6snqAKK/4Sv6uHLneK77tSMFrmpzL9QeQxplBn
	 ivB1iBmyCg3xcAuUMQHXJLmHHiz462HWd6q/+pnrWonLjQchtv13vRGx5IUuzKZ7yr
	 l2c6vRkHYfIWADF6glNTcAaxP1FzNPg5v0wFhaODdor56sLIzHvbjrm8AEHEndYuPm
	 1/N2IbeGE8woVuYmVjhL7lCmUjc0p2SeSx09hFmEX/EYCpB5VfqCNlVFHg66CyDwFS
	 xTWB4uwquhiYsM1ARA1Ayy5V3sY/4bgdcJjFJkDuoGS/89DqfDZhzLL5MQXHi8QThl
	 eOTDstQ7ihnjQ==
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Feb 2025 12:54:56 +0100
Received: from [172.18.158.233] (172.18.158.233) by mbx-essen-01.secunet.de
 (10.53.40.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Feb
 2025 12:54:56 +0100
Message-ID: <025286ce-a5ea-478e-9131-56c95478d9ab@secunet.com>
Date: Fri, 21 Feb 2025 12:54:53 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: use-after-free with Lenovo Ultra Docking Station
To: Greg KH <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>
References: <76af1506-3425-4d6a-b388-3304823fdd82@secunet.com>
 <2025021853-stained-scared-9e60@gregkh>
 <e17329a8-eb65-4dbe-ae8f-3b68efcf11f5@secunet.com>
 <2025022009-hurricane-amiable-2195@gregkh>
 <4dc90eac-584b-4266-8666-d34b96124722@secunet.com>
 <2025022122-corrode-tactless-7789@gregkh>
Content-Language: de-DE, en-GB
From: Philipp Leskovitz <philipp.leskovitz@secunet.com>
Autocrypt: addr=philipp.leskovitz@secunet.com; keydata=
 xsBNBF5iYs4BCADVa19dos096dZvjNTi1DrH+YZo+Vwustn41j5t9/Le2NyXjxKDpAsN626F
 Qi4RyyQeYZGYgjds4+elyDuCZNQSb5Crpd4QBVZ2gsXlde5m0DOFWZWfWOiJO26k5RvT6tLx
 ewVH6dZMy245NgFxo8UjCFSLda677+0Qoi8hbwLHJpsGd61330IKk3rV6zUQPyja49FRNFEY
 l2qd4zGIUlPISp6U/5M/WEf1N6xLksHKeZfV21lPA/2IlPHheM5AFI8KCHIDBi8w00KHK8DY
 NKGFpoffzH8NMME4vomSMha0hDs6RXn5QPuZm3Z0cQlrAAoH8KOrT1H8eoJ/orLm6BTRABEB
 AAHNMVBoaWxpcHAgTGVza292aXR6IDxwaGlsaXBwLmxlc2tvdml0ekBzZWN1bmV0LmNvbT7C
 wI4EEwEKADgWIQQzH6UOXReGDEJd1AodG122n41owAUCXmJizgIbAwULCQgHAgYVCgkICwIE
 FgIDAQIeAQIXgAAKCRAdG122n41owAn5B/90leDIy21zFpVhtbTpKHkJKqKLPpkVkxNMjPYK
 sEHNJB/jOfXWH3xghiwRIyVUYPOVlL61eiZjFbiVSzKgnrZ/H7w/6H/709p/hcWhLEyANPPi
 SALSEzdgN8VlgQH9DIsBntaz6rM7lYmJma4Q9OlaAbOCwzUeWG+pw6Vy2QgQBHdTepYfoagI
 Epl9DAGmsDrrk0fTVNRvlVlYNoK2zYr6bfvOHOPGsJ+E+KEWioO4qLWUv7ZNYofk0q5bLVt1
 K/VGrN7elHJNz7olc3BeBq+nohUjWpH8OGrYSztO96MN2pHl98y42cTLhHEE8Um9I59GRx5B
 20lpH0/p/hPciHdOzsBNBF5iYs4BCADEscrecAFWq2qGkk9NtOgVdw4dQvc2UiigAfEVtXMs
 tr+SkJtTtCMEPUQfv81fFZj+Gg9u3fLmzi5awIkddUpURYy4IAPboM/dAhJSvTuimvLIB6dI
 d3vw15w6SPOikwZr5dhJqX696futcq48l7zFvcVpPU9u3VBA2P2hm44mTP9YvVE3wmNgUSbe
 yNuRqlw7O3YxT4P+0PF9yncKU8uVgwYeaZsTagAygouPSvpTlfALt5u0VvAsI9i2al5obIiN
 bpC3jV09+UXHWeEXnKUX25EcbKsfBSHVwFleSdYSfs381SZkMLt17kApcis8YQB+MwuEwY0b
 x2So69GcCycrABEBAAHCwHYEGAEKACAWIQQzH6UOXReGDEJd1AodG122n41owAUCXmJizgIb
 DAAKCRAdG122n41owLAbCADM7anqHQJWGfAMS+4ovHE4yYG1bWF81IDChT1gmsC+HQ5LPNV0
 dVtuGAnDIYgN1M8fWvkgMNSC/noEEMe3wftwkvgv0mJg7R8HGrLYgZbhMGz5P5gQwBdYVpVW
 5iddBI9MOKb50HzqCJ2XTUYo6oBbkZWe+nbOQN8ZwdZtMIjj3PEO1Y6qWnAAmkiZWMNuZ387
 Y0Sm7hnSjrVtEQfGrUGY/tWQYKibfYgwz9Ig4is/Q4ZrJRyKx0sgnuYL4tI6ENF6nJONI6gD
 inQdHmZ4+IfobzCHx0MCzKvc+KMXLnO+w4pi04okJ/zBrRFS2w9XOnJzYkLeQc1ZzP0k8FHF XZb2
In-Reply-To: <2025022122-corrode-tactless-7789@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: cas-essen-01.secunet.de (10.53.40.201) To
 mbx-essen-01.secunet.de (10.53.40.197)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10

Hey Greg,

The "Thunderbolt BIOS Assist Mode" option in the BIOS settings may have an effect on this. I have to test this intensively first.

Thank you.
Philipp


> On Fri, Feb 21, 2025 at 08:48:52AM +0100, Philipp Leskovitz wrote:
>> Hello Greg,
>>
>> I can also reproduce it without the proprietary modules. The latest BIOS
>> version N2IETA5W is installed. Attached is the log file. Only dm_mod,
>> intel_lpss_pci, intel_lpss, pinctrl_cannonlake and pinctrl_intel were still
>> loaded. I had also activated kasan.
>>
>> Kernel version 6.1 seems to be one of the last versions with which the docking station works well.
>>
>> The error doesn't always occur. I stress the device a little bit by
>> connecting the notebook to the docking station and disconnecting it again.
>> Sometimes I also plug in an external power supply. This combination
>> generates the error in less than 10 minutes. I also had the case that the
>> device was idle for about 30 minutes. Then it was connected to the docking
>> station once and the error occurred.
> 
> Your kernel log shows that this is probably a bios bug:
> 
>> [  520.107312] pcieport 0000:03:02.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 3a] add_size 200000 add_align 100000
>> [  520.107323] pcieport 0000:03:02.0: bridge window [mem 0xa0000000-0xa01fffff 64bit pref]: assigned
>> [  520.107601] pci_bus 0000:3a: busn_res: [bus 3a] is released
>> [  520.109588] pci_bus 0000:03: busn_res: [bus 03-3a] is released
>> [  522.973010] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.RP09.PEGP.NVDN], AE_NOT_FOUND (20240827/psargs-332)
>> [  522.973048] ACPI Error: Aborting method \_SB.PCI0.LPCB.EC._Q26 due to previous error (AE_NOT_FOUND) (20240827/psparse-529)
>> [  529.409351] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.RP09.PEGP.NVDN], AE_NOT_FOUND (20240827/psargs-332)
>> [  529.409395] ACPI Error: Aborting method \_SB.PCI0.LPCB.EC._Q27 due to previous error (AE_NOT_FOUND) (20240827/psparse-529)
>> [  543.303502] usb 1-5: new high-speed USB device number 12 using xhci_hcd
>> [  543.340048] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.RP09.PEGP.NVDN], AE_NOT_FOUND (20240827/psargs-332)
>> [  543.340092] ACPI Error: Aborting method \_SB.PCI0.LPCB.EC._Q26 due to previous error (AE_NOT_FOUND) (20240827/psparse-529)
> 
> And then later:
> 
>> [  647.629519] hub 1-5:1.0: USB hub found
>> [  647.630656] hub 1-5:1.0: 5 ports detected
>> [  647.656103] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.RP09.PEGP.NVDN], AE_NOT_FOUND (20240827/psargs-332)
>> [  647.656140] ACPI Error: Aborting method \_SB.PCI0.LPCB.EC._Q26 due to previous error (AE_NOT_FOUND) (20240827/psparse-529)
>> [  647.738644] ==================================================================
>> [  647.738648] BUG: KASAN: slab-use-after-free in sysfs_create_link+0x8a/0xc0
> 
> Boom.
> 
> Now what is odd is that sysfs_create_link is showing a use-after-free,
> which it shouldn't, but as your bios is spitting out invalid device
> symbols, who knows what confusion the kernel got into with regards to
> creating a symlink that was already present.
> 
> So maybe go poke the bios vendor to resolve this?
> 
> thanks,
> 
> greg k-h


