Return-Path: <linux-usb+bounces-29055-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B445BC6B0B
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 23:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4AF934EA17D
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 21:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D57D2C0F62;
	Wed,  8 Oct 2025 21:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuHHgYLO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F55B217704
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 21:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759958965; cv=none; b=D+sTA0cQTBSfg+WTPOGiIzZKII8In4zZRIruhsdluNr/FKJgCT0p3Myp9naep1BQsqYWqamsxMmuf3hGJ056yvJkZ+D7OZFD3f3czhswVn8OdFo8UtfMwm0bWZVlMbeEX2yX3bFO7kEwJFrXrK2NLtLOx5zvmgUfoWMpohlY3WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759958965; c=relaxed/simple;
	bh=iGbUpMqiX9ui1CJT84Evg17hTmS1Ypmw1iPJWevxnQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=goEpPw/48qCEtvyu3Q2ghcL4EyPlgYP4yc7Y17CzhGdUqeTnmX2CjH+2JjY70rSFoPtqk3RKEQLUUgD439uV11R9Wqt8LeRXCIuifaCK7gZb2VMFbU3SoWdgVeA6M9nD6WNRgx7kZF33RfVYjVfseOwihJllIpH52Hq703hZI2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuHHgYLO; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9231a251c01so87239241.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 14:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759958963; x=1760563763; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KjAnB+Zzyfvp4Pp2ybIwv27YmlWXv103r2xKYoV6VSg=;
        b=YuHHgYLO9ssBSZS2lzFsRmQSRel/qLQiBbQjkWt4zuPeAu9P4zcvzJBtDAVrg6PIZD
         ZLHOBsp3elDDqLYV7AxZEpz+robErr99Vwb7clmdVDrSdGerh/v96SnQtMkOQ5C0zMnJ
         /PPEYH6J67f0rfLi4aO038sxcNMmiqC4zR6jySJh3bECyGTiQBPjVGEO9NuXIadqap9w
         XmpZOXhnHo81LJZpLF/Gulo7UPL3mlWpMJwJ/m4171iyd0rZCKQDPlIXie38saSeC2Kr
         7OnSa8JMdhyh+OS91LGJfJdiFjt+xM2TwwfOhvuBvg5NMS57uGrWFQ7gQkrHPgixLMhr
         gOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759958963; x=1760563763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjAnB+Zzyfvp4Pp2ybIwv27YmlWXv103r2xKYoV6VSg=;
        b=FFRM9sMD1BhH0cMKaotj/SjBWqyPles9O95wqjYpU2rl7Zmxo3OKgJ4Xr3/c4GEmSL
         AI27pViJIQFXGwDs6oHIX3O29BDHhrgNFfwaIeHo8CN1LgzSSOcELBcOIuyoCTtEwTP0
         95Kyeh3uFZKpT857oJI+bk1F8QvbULrDV5iuIQ6Q4cOP1Kx3MBiZZ4wxf5vpRlYlSNPH
         Xw8gFRRVrNCdw5l3cXBJbopK92TkDHeHE8u2vJK8X7b8I7G7J+NXoZsHshqWEmOzx7jO
         sJungjCseAmQko3Dgn3Zvq5fQHS1FyZ0kugpYmrwT/W5XryYaNR+0YOLVhpRJ5sAVsC+
         +/KA==
X-Gm-Message-State: AOJu0YzeAtt+1kx8vO3ziTTEvXYKdhFgcFkmhQYouw7ecabqwRY3mtMH
	k4aUnNTZXhQKPh0+ygbOw9ciLEQehz51UD1upk0NpJFph7Y8rTixP9DYKbvQNt7vvm5l5zasdNe
	AVtZfVRhEIGjMdHwMembA00GV/5Dm4xl9gRHZYyykag==
X-Gm-Gg: ASbGncue0lS758pojHU9xSwG2YeB7wLQpC1ozFZq0M4d2+c2vPjO6ikaVYkOji9UK9R
	H/7Ws7RTt5wdMHbDXuwlNXBq2nqr2JqMdvmXhYL5FnrYcHPqOHAQ8lR802HM9wJnc2536ZKhMWZ
	H84zxXJpKBZn3b6QYKOwCrGfifk0nE824UBMr/91GngQaJuFvI82QOHW6mQfKyZvJQbwCZHNk3V
	n3OX2CCl8uUoTm7xpcKwZcjqBd5fR8=
X-Google-Smtp-Source: AGHT+IG+pulNGykYUZB003oWExF+n2LFA14Bx2e0GXWW+ufKuzx4sIaQlm0rWhv3xzSpTjaJhHi37DacnR9TEvDf61c=
X-Received: by 2002:a05:6102:510c:b0:5a4:138d:b13c with SMTP id
 ada2fe7eead31-5d5e237aff6mr2256654137.29.1759958963084; Wed, 08 Oct 2025
 14:29:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com> <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
 <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
 <20251008082055.5646dadc.michal.pecio@gmail.com> <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
 <20251008130532.49922d58.michal.pecio@gmail.com> <CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
 <20251008223406.13f16f19.michal.pecio@gmail.com>
In-Reply-To: <20251008223406.13f16f19.michal.pecio@gmail.com>
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Wed, 8 Oct 2025 23:29:12 +0200
X-Gm-Features: AS18NWBwuMRLNTll_iFqjIE2B8neeAzZfwmvOISoejS8xJ94lLIRW25Z1lS-dY4
Message-ID: <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB merge
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, 
	Niklas Neronin <niklas.neronin@linux.intel.com>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I looked into the dmesg and found this:

kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus number 9
kernel: xhci_hcd 0000:7a:00.0: USB3 root hub has no ports
kernel: xhci_hcd 0000:7a:00.0: hcc params 0x0110ffc5 hci version 0x120
quirks 0x0000000200000010
kernel: xhci_hcd 0000:7a:00.0: Root hub is not suspended
kernel: xhci_hcd 0000:7a:00.0: Root hub is not suspended
kernel: usbcore: registered new interface driver usbserial_generic
kernel: usbserial: USB Serial support registered for generic
kernel: i8042: PNP: No PS/2 controller found.

went back into the bad kernel and enabled the dynamic debug, unplugged
and plugged the mice and ran the unbind and bind on the 7a controller.

got this log:

[  203.432169] xhci_hcd 0000:7a:00.0: Root hub is not suspended
[  203.432395] xhci_hcd 0000:7a:00.0: remove, state 1
[  203.432404] xhci_hcd 0000:7a:00.0: // Halt the HC
[  203.432410] xhci_hcd 0000:7a:00.0: // Reset the HC
[  203.433638] xhci_hcd 0000:7a:00.0: Wait for controller to be ready
for doorbell rings
[  203.433653] xhci_hcd 0000:7a:00.0: // Disabling event ring interrupts
[  203.433660] xhci_hcd 0000:7a:00.0: cleaning up memory
[  203.433669] xhci_hcd 0000:7a:00.0: Freed interrupters
[  203.433670] xhci_hcd 0000:7a:00.0: Freed command ring
[  203.433674] xhci_hcd 0000:7a:00.0: Freed segment pool
[  203.433675] xhci_hcd 0000:7a:00.0: Freed device context pool
[  203.433675] xhci_hcd 0000:7a:00.0: Freed small stream array pool
[  203.433676] xhci_hcd 0000:7a:00.0: Freed xhci port bw array pool
[  203.433676] xhci_hcd 0000:7a:00.0: Freed medium stream array pool
[  203.433706] xhci_hcd 0000:7a:00.0: xhci_stop completed - status = 11
[  203.433831] xhci_hcd 0000:7a:00.0: USB bus 9 deregistered
[  203.433921] xhci_hcd 0000:7a:00.0: xHCI Host Controller
[  203.433924] xhci_hcd 0000:7a:00.0: new USB bus registered, assigned
bus number 9
[  203.433933] xhci_hcd 0000:7a:00.0: // Halt the HC
[  203.433938] xhci_hcd 0000:7a:00.0: Resetting HCD
[  203.433939] xhci_hcd 0000:7a:00.0: // Reset the HC
[  203.435167] xhci_hcd 0000:7a:00.0: Wait for controller to be ready
for doorbell rings
[  203.435169] xhci_hcd 0000:7a:00.0: Reset complete
[  203.435170] xhci_hcd 0000:7a:00.0: Enabling 64-bit DMA addresses.
[  203.435170] xhci_hcd 0000:7a:00.0: Calling HCD init
[  203.435171] xhci_hcd 0000:7a:00.0: Starting xhci_init
[  203.435172] xhci_hcd 0000:7a:00.0: HCD page size set to 4K
[  203.435177] xhci_hcd 0000:7a:00.0: Device context base array
address = 0x0x00000000ffff7000 (DMA), 000000009a3b17b6 (virt)
[  203.435181] xhci_hcd 0000:7a:00.0: Allocated command ring at 000000005fb9657f
[  203.435181] xhci_hcd 0000:7a:00.0: First segment DMA is 0x0x00000000ffff6000
[  203.435182] xhci_hcd 0000:7a:00.0: Allocating primary event ring
[  203.435186] xhci_hcd 0000:7a:00.0: Allocating 2 scratchpad buffers
[  203.435196] xhci_hcd 0000:7a:00.0: Ext Cap 00000000715dddb0, port
offset = 1, count = 1, revision = 0x2
[  203.435197] xhci_hcd 0000:7a:00.0: xHCI 1.0: support USB2 hardware lpm
[  203.435198] xhci_hcd 0000:7a:00.0: Found 1 USB 2.0 ports and 0 USB 3.0 ports.
[  203.435198] xhci_hcd 0000:7a:00.0: USB3 root hub has no ports
[  203.435199] xhci_hcd 0000:7a:00.0: xHC can handle at most 64 device slots
[  203.435200] xhci_hcd 0000:7a:00.0: Setting Max device slots reg = 0x40
[  203.435204] xhci_hcd 0000:7a:00.0: Setting command ring address to 0xffff6001
[  203.435208] xhci_hcd 0000:7a:00.0: Doorbell array is located at
offset 0x2000 from cap regs base addr
[  203.435214] xhci_hcd 0000:7a:00.0: // Write event ring dequeue
pointer, preserving EHB bit
[  203.435215] xhci_hcd 0000:7a:00.0: Finished xhci_init
[  203.435215] xhci_hcd 0000:7a:00.0: Called HCD init
[  203.435216] xhci_hcd 0000:7a:00.0: hcc params 0x0110ffc5 hci
version 0x120 quirks 0x0000000200000010
[  203.435375] xhci_hcd 0000:7a:00.0: xhci_run
[  203.435378] xhci_hcd 0000:7a:00.0: ERST deq = 64'hffff5000
[  203.435380] xhci_hcd 0000:7a:00.0: Finished xhci_run for main hcd
[  203.436837] xhci_hcd 0000:7a:00.0: Root hub is not suspended


Thanks,
Arisa

