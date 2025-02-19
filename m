Return-Path: <linux-usb+bounces-20803-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45468A3B28F
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 08:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51B9716CFCA
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 07:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC6C1C1F22;
	Wed, 19 Feb 2025 07:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="J2J8y2d+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD671ADC89
	for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2025 07:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739950550; cv=none; b=d6ShL2Z/AbzdWsJDx7RVAoMK3jOkaK0lbwq4WVgOiIHUmVXre6kkatEQK/of/tfVUFo84JtfKLVa941YOwGaMaRwxMn8Lp0Cg523FZXa3BZIdm0IL/LTsp/k84esq5g8E9dvxVv6UoSG5D8BWPyazhVNlv/s2OPN9LMAmPFb+Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739950550; c=relaxed/simple;
	bh=+FMeWn+rgdOP5ywlk3OST55yYzYDrkeYmpmavEZ9yv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H7lOeh6Q9A4z6+5q7Prnq3oYJY5gzd1RJQxaF7KBAC1w8Bev8HN3zOE52FURrwehAZvHT+fSlJ6dS+tJoD9J68ZHxhPzhjvPSvVb6TFo5vwVX7nXjebghe5uqe4tLKxVnCutWRVLOJXDlYyAEDhVXqqTgduMTffQmMaE1udNWEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=J2J8y2d+; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id A8D922082E;
	Wed, 19 Feb 2025 08:35:39 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HknqdIxUxl0B; Wed, 19 Feb 2025 08:35:38 +0100 (CET)
Received: from cas-essen-01.secunet.de (rl1.secunet.de [10.53.40.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id D0D0520754;
	Wed, 19 Feb 2025 08:35:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com D0D0520754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1739950538;
	bh=8YMm4ZNzr5vXoAIBdlR16Wy5SmM7qyTrrqrc6vY1eB8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:From;
	b=J2J8y2d+iJ18ZnduWRN09ISmw0lMhLb3ia9E9fvSDT4dCC4KsUeJowOgAARz/MNdM
	 wAMELYQqBdZg/EMQr9kbCI+rD3CRofZjgGxTNJ8XaoJcMnSS9wrIGcfPkfVAGojzcW
	 UfeWKIgw7qUGiA31zYfCEf+XZPlmS9/g/XlFF2/U2xZFQSsU7+NApocl6qgpDauQB4
	 u07km+Fd5I4dHZN2pYnlGBVuRtG1XTZupi4qmq/LiuKVwX5m4ioRukPq0uXcit7DIK
	 ePSfoMl2skacC/P5wP/wguXr/bHRyYpiKwnOMxkRWRg32KxwMc2uKBBCI6HwwMFbOl
	 Njbjwq56LKu4w==
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Feb 2025 08:35:38 +0100
Received: from [172.18.158.233] (172.18.158.233) by mbx-essen-01.secunet.de
 (10.53.40.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Feb
 2025 08:35:38 +0100
Message-ID: <e48ff1fe-4e44-41b8-861d-cff2b9b509bd@secunet.com>
Date: Wed, 19 Feb 2025 08:35:37 +0100
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
In-Reply-To: <2025021853-stained-scared-9e60@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: cas-essen-02.secunet.de (10.53.40.202) To
 mbx-essen-01.secunet.de (10.53.40.197)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10

Hello Greg,

Thank you for your message. With kernel 6.13.0 I get a different error message when I click the notebook Lenovo T490 into or out of the docking station (ThinkPad Ultra Docking Station, Type 40AJ).

<4>[    0.568971] ------------[ cut here ]------------
<2>[    0.568973] kernel BUG at drivers/pci/setup-bus.c:2156!
<4>[    0.568981] Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
<4>[    0.568992] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-devel+ #1
<4>[    0.569001] Hardware name: LENOVO 20N2S00600/20N2S00600, BIOS N2IET91S (3.69 ) 02/02/2021
<4>[    0.569008] RIP: 0010:pci_assign_unassigned_root_bus_resources+0x23f/0x370
<4>[    0.569020] Code: ff ff 48 89 da 4c 89 f7 48 8d 74 24 20 e8 29 f7 ff ff 4c 8b 74 24 20 48 8d 54 24 20 8b 44 24 18 4c 39 f2 0f 84 aa fe ff ff 90 <0f> 0b 83 7c 24 1c ff 0f 84 d7 00 00 00 83 7c 24 
1c 03 0f 84 e9 00
<4>[    0.569033] RSP: 0000:ffffbd8680083dd0 EFLAGS: 00010206
<4>[    0.569041] RAX: 0000000000000000 RBX: ffffbd8680083e00 RCX: 000000000000003e
<4>[    0.569048] RDX: ffffbd8680083df0 RSI: 0000000000000000 RDI: ffffffff9ca926d9
<4>[    0.569055] RBP: 0000000000000000 R08: 0000000000000002 R09: 0000000000000002
<4>[    0.569061] R10: 0000000000000000 R11: ffffffff9ca4f1a0 R12: dead000000000122
<4>[    0.569067] R13: dead000000000100 R14: ffffa35401dca060 R15: 0000000000000000
<4>[    0.569073] FS:  0000000000000000(0000) GS:ffffa3597c4c0000(0000) knlGS:0000000000000000
<4>[    0.569081] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[    0.569087] CR2: 0000000000000000 CR3: 00000002a562e001 CR4: 00000000003706f0
<4>[    0.569093] Call Trace:
<4>[    0.569098]  <TASK>
<4>[    0.569102]  ? die+0x36/0x90
<4>[    0.569111]  ? do_trap+0xdc/0x100
<4>[    0.569119]  ? pci_assign_unassigned_root_bus_resources+0x23f/0x370
<4>[    0.569127]  ? do_error_trap+0x6d/0xb0
<4>[    0.569133]  ? pci_assign_unassigned_root_bus_resources+0x23f/0x370
<4>[    0.569142]  ? exc_invalid_op+0x51/0x70
<4>[    0.569150]  ? pci_assign_unassigned_root_bus_resources+0x23f/0x370
<4>[    0.569158]  ? asm_exc_invalid_op+0x1a/0x20
<4>[    0.569166]  ? __pfx_pci_conf1_write+0x10/0x10
<4>[    0.569174]  ? _raw_spin_unlock_irqrestore+0x19/0x40
<4>[    0.569182]  ? pci_assign_unassigned_root_bus_resources+0x23f/0x370
<4>[    0.569194]  pci_assign_unassigned_resources+0x23/0x90
<4>[    0.569202]  pcibios_assign_resources+0x43/0xe0
<4>[    0.569210]  ? __pfx_pcibios_assign_resources+0x10/0x10
<4>[    0.569217]  do_one_initcall+0x58/0x230
<4>[    0.569228]  kernel_init_freeable+0x166/0x290
<4>[    0.569236]  ? __pfx_kernel_init+0x10/0x10
<4>[    0.569243]  kernel_init+0x1a/0x1c0
<4>[    0.569249]  ret_from_fork+0x31/0x50
<4>[    0.569257]  ? __pfx_kernel_init+0x10/0x10
<4>[    0.569263]  ret_from_fork_asm+0x1a/0x30
<4>[    0.569274]  </TASK>
<4>[    0.569277] Modules linked in:
<4>[    0.569284] ---[ end trace 0000000000000000 ]---
<4>[    0.575226] RIP: 0010:pci_assign_unassigned_root_bus_resources+0x23f/0x370
<4>[    0.575240] Code: ff ff 48 89 da 4c 89 f7 48 8d 74 24 20 e8 29 f7 ff ff 4c 8b 74 24 20 48 8d 54 24 20 8b 44 24 18 4c 39 f2 0f 84 aa fe ff ff 90 <0f> 0b 83 7c 24 1c ff 0f 84 d7 00 00 00 83 7c 24 
1c 03 0f 84 e9 00
<4>[    0.575254] RSP: 0000:ffffbd8680083dd0 EFLAGS: 00010206
<4>[    0.575262] RAX: 0000000000000000 RBX: ffffbd8680083e00 RCX: 000000000000003e
<4>[    0.575269] RDX: ffffbd8680083df0 RSI: 0000000000000000 RDI: ffffffff9ca926d9
<4>[    0.575276] RBP: 0000000000000000 R08: 0000000000000002 R09: 0000000000000002
<4>[    0.575283] R10: 0000000000000000 R11: ffffffff9ca4f1a0 R12: dead000000000122
<4>[    0.575289] R13: dead000000000100 R14: ffffa35401dca060 R15: 0000000000000000
<4>[    0.575296] FS:  0000000000000000(0000) GS:ffffa3597c4c0000(0000) knlGS:0000000000000000
<4>[    0.575304] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[    0.575310] CR2: 0000000000000000 CR3: 00000002a562e001 CR4: 00000000003706f0
<0>[    0.575317] Kernel panic - not syncing: Fatal exception

Best regards.
Philipp


> On Tue, Feb 18, 2025 at 07:52:34AM +0100, Philipp Leskovitz wrote:
>> [1.] One line summary of the problem:
>> A use-after-free is triggered when the device ThinkPad Ultra Docking Station is connected.
>>
>> [2.] Full description of the problem/report:
>>
>> When I click the notebook into the docking station (ThinkPad Ultra Docking
>> Station, Type 40AJ), a kernel crash sometimes occurs. I think the function
>> kernfs_new_node (fs/kernfs/dir.c) accesses a memory that has already been
>> released. It looks to me that an access in this function occurs with the
>> query "parent->mode & S_ISGID". The error occurs with kernel version 6.8.12
>> and 6.12.x.
>>
>> general protection fault, probably for non-canonical address 0xfefefefefefeff3d: 0000 [#1] PREEMPT SMP NOPTI
>> CPU: 7 PID: 2433 Comm: kworker/7:3 Tainted: P O T 6.8.12-grsec+ #1
> 
> 6.8.12 is a very old, and obsolete, unsupported, and known-buggy kernel
> version.  Does this also happen on the latest release (i.3. 6.13.3 or
> our development tree (6.14-rc3)?
> 
> Lots of work has happened in the year in this driver since 6.8 was
> released.
> 
> thanks,
> 
> greg k-h


