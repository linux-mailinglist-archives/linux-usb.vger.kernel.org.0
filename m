Return-Path: <linux-usb+bounces-36871-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKuwBFVL+GnusQIAu9opvQ
	(envelope-from <linux-usb+bounces-36871-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 09:31:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 789A64B95C0
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 09:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3D9C300B3CE
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 07:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649AA2EB84E;
	Mon,  4 May 2026 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9ZSuEah"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590292C2346
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777879887; cv=none; b=Aqr1JC5I1Sbak0ebP3HCPzFs38XR6NlqnWvzO9Oo1jOzQLA4Wsw6lzuN4O0oqMhi+d7nSk/1rdIo60J5zDeWah+uzgBwgVfSgMlleAyQLCr++5D1xEc/IMLsQlJlS65iBy4ScR9kYMwwF6NqQgirp2Uw982ITMZTEr3qUwxVirk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777879887; c=relaxed/simple;
	bh=YSB5SQmQmqXs7OoK/OoQ5a2W1FhgmfKgwxP5ajgxFU8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q/NjtNgcI9LmYczAvqsj2dCYc1YFeYQ+cz/4hjQ1gFl+0COqf5A3gWkXF2KcgtGzNl7+bCrfxOcmlv4CFOIoqK5uas1iY4lcwLqb4oW0tDgMLo6IVP7axGUY1nscz0ZZXVH2RyZOLQTNchg/lCRLSPcDj8R8APgoFWzidFb+WZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9ZSuEah; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48d102471a4so2828955e9.2
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 00:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777879885; x=1778484685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CatfaxbBgZQ3LQXPfEhaZbjDP184rQ7dewMd5HLOFbs=;
        b=W9ZSuEahfN+B27Yo/Iq8SyYIpXBgHgdkFI1IiU9mGjuWuUnjxqrOyg6Sp/vLNgFv5O
         euqVDJd7SxJjtUSFuT8hw6rsRgy76NWA0Xv29/1LH+XdChBmyS12v7gTZHw3DkHW7B5F
         sFMIt0vjOST37CkFyTECbWYSLZxIeOOw/uV8hIksP1bLyp8cDJg6lFA8fwrURCZMENB5
         zOxNqha0831z7dO1oF1WI3dNB3WJ56rS7ZJfVxZvGVVKxrg+AnZ9dB5kUowqKYDaGP3Y
         pbgneJXhy5Ri8OhG9BMczOSjDqv9yWfTyKCODqyn8KNvZe0HYjylr0ZLjOQAcsp8nl8F
         VVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777879885; x=1778484685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CatfaxbBgZQ3LQXPfEhaZbjDP184rQ7dewMd5HLOFbs=;
        b=WG47Fa+8zOJEVMorLJO61PWGt48KYkybK4dRiWxXulP6ZcY7awkwvmKFqXfng7De73
         dGcJBA4YCRZxxOTTse5Ietmk0zaSUPyLAtn+nXOzqd16kRhNhK9fSwkX3IMoDoLFOPbk
         9VG94esEioY2OfYEwlvSWtF7v3dBJLgPiRyv+ntrB2ve5ZKEwQDqF0sNfadT8Q0CLKOr
         4s08B36Wg9canTaJdTHRi5p8tOhpdq5S/+LSRFTK3Acckck1B5DBbHdTg/HFwq9REW5Y
         S2SznAUlj+Vgg03cN1yJ1rLlFbPhDPHEBksw8V/sZWegFpcBVp8dLvaNkJ7ZwCR4qrnb
         bJfA==
X-Forwarded-Encrypted: i=1; AFNElJ8w7KfCGJTGOF7BxJ3slkPNwrXTnYzSf34gToHEHTD2KAJUfU8ngZQ4s5Yjq0RStTKqJJATYArppZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwATtriX4MwzwFq4oGbPrgb/o6GmFz2pV3rNZ1mYYgLuaXsh4eD
	iSqWTO0y8lZ9PFx7PRSXzM+iOzfna0nh/UcXu0/2ugfV8O19kq6Vs5bq
X-Gm-Gg: AeBDieu1dTOxbCOTJP2+NUHb2xryvyG3yDd2Ha5Ooy7zowgXVBEUAaNX+8q+TirCI/z
	sPDP0pld9HT71e4tXDZZpGUiNwJcTOKkFf32d43lZzl4R9ErcJuSSxbTJNnbyYVQh5pPZiX0Xof
	BLgY72Fjd3TowRYuf4k/eRGgJfkRmdMsJSfyPO6pzMeRg0IRbUqpIDmAZ4b7l5GH5M3+FNz/hUl
	K7T6MAqfkr8cRZxb4LBoi6AXPMxGyDkcEUf261IptDRHg1lDfukJCiY8rsxyUZLWW0ZkZdMb8rq
	mrgyX/wvSJx4t31pOR+a3Tdy9AkOaMmjakyuRi/2Y5IELS+BYIWF/mP3a/ZlyAvgGGv4nZ00dFQ
	O72Ke6kHvhpAdHriN74Nofpl7LqnsYgA8V24Jfwsn7LqVrBM8BHgEB6oSvgj/wJ9866+O9NjYFi
	Ju58mhIuEb19It027aYZQ09a82VH8DuGk=
X-Received: by 2002:a05:600c:4342:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-48c6d455f69mr68059795e9.2.1777879884339;
        Mon, 04 May 2026 00:31:24 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82308d77sm355839375e9.14.2026.05.04.00.31.23
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 04 May 2026 00:31:24 -0700 (PDT)
Date: Mon, 4 May 2026 09:31:18 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Desnes Nunes <desnesn@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, mathias.nyman@intel.com, stable@vger.kernel.org
Subject: Re: [PATCH RFT RFC] usb: xhci: Kill hosts with HCE or HSE on
 command timeout
Message-ID: <20260504093118.615ff480.michal.pecio@gmail.com>
In-Reply-To: <20260503213111.117db3a1.michal.pecio@gmail.com>
References: <20260430014817.2006885-1-desnesn@redhat.com>
	<20260430104850.352bd946.michal.pecio@gmail.com>
	<CACaw+exdPSVSfdAob7+d-xH=JEjBbPpY_z1cPPU6rzXx4wUZpA@mail.gmail.com>
	<20260430235453.2288c973.michal.pecio@gmail.com>
	<CACaw+ewwM_5eqyGW5=+THwHsYPs7u3NT096AFQdt6x4E6HcWtA@mail.gmail.com>
	<20260502114644.76e6b5a3.michal.pecio@gmail.com>
	<CACaw+eyKh7buHDoDyTOe8O65FP5cSXYdzCcQvwqKw=1DwX26oA@mail.gmail.com>
	<20260502235517.089ba5bf.michal.pecio@gmail.com>
	<CACaw+ewOTVh49tnkz+cRr0SD_Z-LmYrMWhFUrsik6YF83mPBtA@mail.gmail.com>
	<20260503071749.6abda137.michal.pecio@gmail.com>
	<CACaw+ew8uV5g1G-6qZGtVBEYZ3k+fvFrOq3XMyq-Nuhbq5mdnA@mail.gmail.com>
	<20260503213111.117db3a1.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 789A64B95C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36871-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,usbcmd.run:url]

On Sun, 3 May 2026 21:31:11 +0200, Michal Pecio wrote:
> My first wild guess would be that HSE is caused by resetting IOMMU
> while the xHC is unaware of kexec and continuing to DMA old buffers.
> Attached patch checks for this and also tries to explicitly clear
> HSE, although resetting ought to clear it too. But HW has bugs...

Never mind, here's the smoking gun:

[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: xHCI Host Controller
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: new USB bus
registered, assigned bus number 3
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: // Halt the HC
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Resetting HCD
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: // Reset the HC
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Wait for controller
to be ready for doorbell rings
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Reset complete
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Enabling 64-bit DMA addresses.
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Calling HCD init
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Starting xhci_init
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: HCD page size set to 4K
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Device context base
array address = 0x0x000000100167c000 (DMA), 00000000d042f7e3 (virt)
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Allocated command
ring at 0000000016f013a6
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: First segment DMA is
0x0x000000100167d000
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Allocating primary event ring
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Allocating 34
scratchpad buffers
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Ext Cap
000000001bef6947, port offset = 1, count = 14, revision = 0x2
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: PSIV:1 PSIE:2 PLT:0
PFD:0 LP:0 PSIM:12
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: PSIV:2 PSIE:1 PLT:0
PFD:0 LP:0 PSIM:1500
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: PSIV:3 PSIE:2 PLT:0
PFD:0 LP:0 PSIM:480
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: xHCI 1.0: support
USB2 hardware lpm
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Ext Cap
00000000a5bcc554, port offset = 17, count = 8, revision = 0x3
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: PSIV:4 PSIE:3 PLT:0
PFD:1 LP:0 PSIM:5
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: PSIV:5 PSIE:3 PLT:0
PFD:1 LP:1 PSIM:10
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: PSIV:6 PSIE:3 PLT:0
PFD:1 LP:1 PSIM:10
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: PSIV:7 PSIE:3 PLT:0
PFD:1 LP:1 PSIM:20
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Found 14 USB 2.0
ports and 8 USB 3.0 ports.
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: xHC can handle at
most 64 device slots
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Setting Max device
slots reg = 0x40
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Setting command ring
address to 0x100167d001
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Doorbell array is
located at offset 0x3000 from cap regs base addr
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: // Write event ring
dequeue pointer, preserving EHB bit
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Finished xhci_init
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Called HCD init
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: hcc params
0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Got SBRN 50
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: MWI active
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Finished xhci_pci_reinit
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: supports USB remote wakeup
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: xhci_run
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: ERST deq = 64'h100167e000
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Finished xhci_run for main hcd
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: xHCI Host Controller
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: new USB bus
registered, assigned bus number 4
[Fri May  1 09:46:40 2026] xhci_hcd 0000:80:14.0: Host supports USB
3.2 Enhanced SuperSpeed
[Fri May  1 09:46:41 2026] xhci_hcd 0000:80:14.0: supports USB remote wakeup
[Fri May  1 09:46:41 2026] xhci_hcd 0000:80:14.0: Enable interrupts
[Fri May  1 09:46:41 2026] xhci_hcd 0000:80:14.0: Enable primary interrupter
[Fri May  1 09:46:41 2026] xhci_hcd 0000:80:14.0: // Turn on HC, cmd = 0x5.
[Fri May  1 09:46:41 2026] DMAR: DRHD: handling fault status reg 2
[Fri May  1 09:46:41 2026] DMAR: [DMA Read NO_PASID] Request device
[80:14.0] fault addr 0x1001680000 [fault reason 0x39] SM: Present bit
in Root Entry is clear

The chip IOMMU faults shortly after setting USBCMD.RUN = 1.
Such fault is expected to cause HSE assertion and usually it does.
You will probably find that HSE is already set while Enable Slot
is being queued, even if it was clear in xhci_gen_setup().

1001680000 is close to valid addresses like 100167e000 or 100167c000.

Possible causes:
- xHCI or IOMMU driver bug
- HW corrupted a pointer
- HW accessed something out of bounds
- HW dereferenced a stale pointer from the original kernel

Do you happen to have more of those logs saved, are they all like that?
Any chance that 1001680000 appears somewhere in the main kernel's log?

If not, I suppose we will have to log every single DMA mapping created
by the driver and see if this gives any new clues.

Regards,
Michal

