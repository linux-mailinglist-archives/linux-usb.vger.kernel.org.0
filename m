Return-Path: <linux-usb+bounces-26171-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49092B11DA7
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 13:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13810AC358F
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 11:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69CF29E0F8;
	Fri, 25 Jul 2025 11:32:56 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 127663AC39;
	Fri, 25 Jul 2025 11:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753443176; cv=none; b=MGmMAWI1y30GV3NDfIMNL53a6mpsErU3QQjIGpi74ZKIq6/Dp22Pje5f82z9oQhqOhRwtIJVCWMfA23VWcwcIqlJy3SWr/wG6Kj5zW3xkftrR+97hxlIh/nN815pg0DAKGAuamWC3pAiTMpr08Mv0EIsH74lkIPqKnAdq7bmEpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753443176; c=relaxed/simple;
	bh=FjbF50LoFhI0TMTRafjzScX9H+OG1mqgiJaEz/ePCWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=ilYIBpZ05SuvdpWL614rUcfuspCMIDgHFBU2LPapBKwEktwXfRJPpQObNykqgeUjISfHJNqcWcIIS4DSBNn3FoQ1wVPiFOuzjcX0TzFVN7imCY/D0rUHoZgucAMuuMLWYMH6FGQPBtLpxt+/TyNEqGTV2plIXlW5dlf8hHRkOYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [192.168.1.6] (unknown [112.64.61.118])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 1A857602637C7;
	Fri, 25 Jul 2025 19:32:38 +0800 (CST)
Message-ID: <09d18144-ab12-4bbc-8b61-e0b334ef13bc@nfschina.com>
Date: Fri, 25 Jul 2025 19:32:37 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: xhci: print xhci->xhc_state when queue_command
 failed
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 Su Hui <suhui@nfschina.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Language: en-US
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 112.64.61.118
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <20250725120329.2b6e3813@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/7/25 18:03, Michał Pecio wrote:
> Hi,
>
> On Fri, 25 Jul 2025 14:01:18 +0800, Su Hui wrote:
>> When encounters some errors like these:
>> xhci_hcd 0000:4a:00.2: xHCI dying or halted, can't queue_command
>> xhci_hcd 0000:4a:00.2: FIXME: allocate a command ring segment
>> usb usb5-port6: couldn't allocate usb_device
>>
>> It's hard to know whether xhc_state is dying or halted.
> Is it truly a problem? This is the only place which sets
> XHCI_STATE_DYING that I found in the whole drivers/ tree:
>
>          xhci_err(xhci, "xHCI host controller not responding, assume dead\n");
>          xhci->xhc_state |= XHCI_STATE_DYING;
>
> And AFAIK such state can only be exited by unbinding the driver.
> Are there really cases when it's unclear if the HC is dying or not?
Oh, my fault, I ignored this so obvious error message. :(.
Sorry for the noise, Maybe this patch should be removed.
>
>> So it's better to print xhc_state's value which can help locate the
>> resaon of the bug.
>>
>> Hmm, any chance you came across bugs that upstream should know about?
Actually, this bug is specific to the 5.4 version of the kernel and a 
particular USB camera. I am working
to resolve this issue. When the xhci_hcd is initialized, the driver sets 
xhc_state to "halted", but before
the xhci_hcd calls xhci_start, the hub starts Initializing. Hub 
initialization failed due to xhc_state being
halted. Perhaps this issue is caused by hardware...

Su Hui


