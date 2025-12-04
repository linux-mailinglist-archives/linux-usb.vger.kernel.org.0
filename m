Return-Path: <linux-usb+bounces-31172-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5BFCA55F1
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 21:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B23A30D8D70
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 20:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD6C26B741;
	Thu,  4 Dec 2025 20:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+OJ2378"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BCE1F5E6
	for <linux-usb@vger.kernel.org>; Thu,  4 Dec 2025 20:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764881210; cv=none; b=meWfolY7RLw0eaxeXjxv4k+xdYx5xTe5ZM9D6WeeZ/7pR+WKtU723/WCn21PXhipk1VFo/JRx7lqOTEn79sFN81V7Cz5hlKL6XwZaS8dDyGrveMlR1XgYiGAu4u0ImiRjK3a8DUUyOmdtHE/zK/JZyWouP2066CnkyoZcnNlwFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764881210; c=relaxed/simple;
	bh=CkF0q6keCD8ZZcz3m1fjdyL7sGulMe4Tg/bgCOZYg6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OOuW0/ZnNBNibuJqOU3dBPuY/LWLo73BFlAnxw6klQLLi/cqQhE/xYLGrWXJOvMLAjnchkgbBD+f0r83PA0qptLG+iY12hsvtrznW+xtL5pmBG/Vuz8pb4aVw63YoT7jH/XI83WhiruRbpR4BGrQfbZM83CKwK3JiyfmbmkB4hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+OJ2378; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764881209; x=1796417209;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CkF0q6keCD8ZZcz3m1fjdyL7sGulMe4Tg/bgCOZYg6A=;
  b=Z+OJ2378KoH13LsuQOXBf9CPI12pInprLz9S6lJBcKth/ZNd62Xj1H1c
   VHGF5XqBX5y8XKPGKle43N0C9JVJxydVH69Srg8oqQF8OsDga7RKOLAS/
   xVYOVg73ypBUthsyKT7f1AOjVF3oQOOyNYWrpkgyAiNCg0pI5qjt+N7ZY
   uAQJh9vxqx8f4pWjyE/WPux1+r0RnqP9dIngj7hbO+Vt+MnmTXvr7RcMq
   u0Fm+cn9M/74/LREipKt//ksrUY2QF5LwO5oQkGJz9T2tzcWu7BDCpTyr
   z+CZpj1+omJ/OxJ77nmBEPZApsRN4CMQOKkXfAyRLTMlMoozLbfyKMcUG
   g==;
X-CSE-ConnectionGUID: +SmV2L9KQZmkVvKE0IHObQ==
X-CSE-MsgGUID: QLJ1v0atTx2S/KjWzPbmyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78266764"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="78266764"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 12:46:47 -0800
X-CSE-ConnectionGUID: xpHvMGnDQbSZZil2M8LujA==
X-CSE-MsgGUID: JJ4C5SriSJWRYxeImCStYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="194162445"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.220]) ([10.245.245.220])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 12:46:46 -0800
Message-ID: <aa85ca5c-1594-4775-8d88-141690c2ab56@linux.intel.com>
Date: Thu, 4 Dec 2025 22:46:43 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: USB DBC hang during earlyprintk initialization
To: Milan Oravec <migo.oravec@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <CAAcb1K_MJKWz+BYJmx0FDgrBOzzXm71-M7sgHDUOmBRppXWNzA@mail.gmail.com>
 <2025101544-galore-sculpture-b243@gregkh>
 <CAAcb1K85GK6m_bVUeSfX1GP4=mxzwfmHtaRX0EYD_jgGfQRk9Q@mail.gmail.com>
 <4e6d9b62-b9d0-4a05-99a9-143899547664@linux.intel.com>
 <CAAcb1K_a2dkj5wv__1BW-fu_Zg=z00OmQzJmekQ-GH4svYQ-GQ@mail.gmail.com>
 <f0d0f71c-bc47-4348-85a6-d728a67c982a@linux.intel.com>
 <CAAcb1K-o7DY3Kvqdr+=MN8OsgRZr+g43-zC6YSLG0hbNxEQUeg@mail.gmail.com>
 <8fe27842-8155-44db-b262-a148b5ce5436@linux.intel.com>
 <CAAcb1K9MDvqJgVbV29ax8tQhXoepJr5ABuh1NHoNpmFdnGxVHw@mail.gmail.com>
 <65b65e02-e51e-4e7e-ae9e-78d755eb8566@linux.intel.com>
 <ba3692e7-6818-41af-8748-71a91cb13db5@linux.intel.com>
 <CAAcb1K9X+ZgigmiQ9btvV5vs+1UmxyZC39RCnS0tVZZUuYjToQ@mail.gmail.com>
 <9dc78bbb-b9db-4ab3-8cd9-bac40e0c8653@linux.intel.com>
 <CAAcb1K_piCRo07Jf3Bzd9tzH9HKxPFisPARGE6OZOhd55-NLyQ@mail.gmail.com>
 <CAAcb1K9QEzaDnTKZJ1AiZ18iLL50z91F6BOB=uj47ma2NLwM8g@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CAAcb1K9QEzaDnTKZJ1AiZ18iLL50z91F6BOB=uj47ma2NLwM8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/25 15:15, Milan Oravec wrote:
> I'm sorry but I can't provide better feedback. When the USB cable is
> connected during initramfs loading DbC is connected, but the system
> stops booting with no messages in the DbC host. When I let USB
> connected prior to the boot, DbC is not initialized. What should I try
> else? Any ideas? Thank you!
> 

I was able to set up a similar system, and I could reproduce this.

I think that firmware/BIOS is controlling xHCI and uses it for debugging before kernel loads,
so if cable is connected too early then it gets stuck in firmware control.

I can see on the host side that a usb device is connected almost immediately after
power on, and it has a different vendor and product ID than what early xdbc driver sets:

host log if cable is connected before power on:

   [3474920.221407] usb 4-1: new SuperSpeed USB device number 65 using xhci_hcd
   [3474920.233582] usb 4-1: LPM exit latency is zeroed, disabling LPM.
   [3474920.233673] usb 4-1: New USB device found, idVendor=8087, idProduct=0b21, bcdDevice= 0.00
   [3474920.233677] usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0

host log if cable is connected when loading kernel:

   [3475961.148597] usb 4-1: new SuperSpeed USB device number 73 using xhci_hcd
   [3475961.160775] usb 4-1: LPM exit latency is zeroed, disabling LPM.
   [3475961.161016] usb 4-1: New USB device found, idVendor=1d6b, idProduct=0010, bcdDevice= 0.10
   [3475961.161020] usb 4-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
   [3475961.161022] usb 4-1: Product: Linux USB GDB Target
   [3475961.161023] usb 4-1: Manufacturer: Linux Foundation
   [3475961.161025] usb 4-1: SerialNumber: 0001
   [3475961.162413] usb_debug 4-1:1.0: xhci_dbc converter detected
   [3475961.162480] usb 4-1: xhci_dbc converter now attached to ttyUSB2

when actual xhci driver is later loaded it resets the controller, which then gives
linux kernel full control.

Maybe we should reset xHCI in early xdbc driver as well.

Regarding "system stops booting with no messages in the DbC host" issue,
it appears either messages or whole boot is blocked if nobody is reading the
messages.

try to read them and see if it helps.
"minicom -D /dev/ttyUSB2" on host worked for me

Thanks
Mathias


