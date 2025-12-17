Return-Path: <linux-usb+bounces-31550-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DDFCC827F
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 15:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4945308341B
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 14:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5167839376E;
	Wed, 17 Dec 2025 14:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="VCn9DnTL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx4.sberdevices.ru (mx4.sberdevices.ru [152.89.196.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213D6393779;
	Wed, 17 Dec 2025 14:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.89.196.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765980419; cv=none; b=eciTqzHwbuCFIX9XYN/mGvgTC+UtmuIZcd6bMbkrsj8y4M0raupE8ZOgGRZ4wBptAMyrvjHGxLdxFstp8DpVELPQALkks/qYE5itXNWsINfvky1YinIRci0enouVBhcGWEDrwhoWKFao8c5qu7UvIPMDXf22TWpbwfz/536IKQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765980419; c=relaxed/simple;
	bh=Mh7WuO/IC9K5KoYKA4TPdjLktCcuHyDvzQIUPi0zUCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rwNSihgjjK6w8FrV9lZyjFHJhjGjCqJ70rzrTSHZvxa/3gfIIPZHuCS5e5q4LsmBEYSPHB1ddRmvpgJXHHcaOL/hpzLbVtDxj3Btkgxeb0ctt/897wHIpgA7iSxdocmM1rJxLeaJJeYEEeCe4UG6afMQbQvfiC4GvGOudfY0t7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=VCn9DnTL; arc=none smtp.client-ip=152.89.196.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-antispam-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx4.sberdevices.ru (Postfix) with ESMTP id 7F03F40022;
	Wed, 17 Dec 2025 16:57:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx4.sberdevices.ru 7F03F40022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=post; t=1765979821;
	bh=mJ7VQMTBxlboVKODl1uOaCcaxvXRjHpaprsekEYsz2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=VCn9DnTLr6AfU7RMGGdbXRU1ebsJsXaRB24C5F20FFR7zOOrr8zQS/NktTcqmmMvY
	 /0ypLxHlr6LCCY21TRqEIPr8pKg+/7etS4R/sHOMyLe6q//ZxJrMcC7mGkKLCD+U/E
	 zAZU1R6XaFT0ukOoPg8HgpZ428zQfTNi04usmUSUHphPpnyMlJpiQr3F9T5Gko6cZ1
	 iWKaZ7lRWS6Z2Lr7GEdxZRZJAsAA5VeUObZtD5OuYNoaGBpiU66StESBo01p82STG0
	 0D+N5+QUhG2xOJCfbvmYlih3CCNC/j2GQOKlPBM3xFOmdkDeIMorLplzUtfviYE2JI
	 oT1BWRGZxh79w==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "sberdevices.ru", Issuer "R12" (verified OK))
	by mx4.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 17 Dec 2025 16:57:00 +0300 (MSK)
Message-ID: <d7ff6bd0-358a-4f84-a98c-ababe9c87082@salutedevices.com>
Date: Wed, 17 Dec 2025 16:56:53 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] usb: gadget: f_fs: trim extra bytes from USB req
Content-Language: ru
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Akash M <akash.m5@samsung.com>, <oxffffaa@gmail.com>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>
References: <20251209134412.577797-1-avkrasnov@salutedevices.com>
 <2025121718-paltry-caress-43fd@gregkh>
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
In-Reply-To: <2025121718-paltry-caress-43fd@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: p-exch-cas-a-m2.sberdevices.ru (172.24.201.210) To
 p-exch-cas-a-m1.sberdevices.ru (172.24.201.216)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Info: LuaCore: 86 0.3.86 47cb2a3d3f5c7e795bff2d0998e8c196722872ab, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 199076 [Dec 17 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.20
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/12/17 12:20:00 #28105178
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-KATA-Status: Not Scanned
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5



17.12.2025 16:35, Greg Kroah-Hartman пишет:
> On Tue, Dec 09, 2025 at 04:44:11PM +0300, Arseniy Krasnov wrote:
>> In '__ffs_epfile_read_data()' number of bytes to copy to user iter is
>> returned by USB driver in field 'actual' of structure 'usb_request'
>> (see 'ffs_epfile_io_complete()'). Looks like some buggy driver may
>> return value larger than actual size of kernel buffer of such USB
>> request. This leads to the following crash (produced on 'dwc2' USB
>> driver). To prevent this, let's add extra check, which trims reported
>> request length.
> 
> Why not fix the broken driver instead?  That would resolve this
> properly, and not force the gadget code to work around obviously-broken
> kernel code.
> 

I tried to debug driver (dwc2), but it is unclear how this happens (may be due to
some hw issues invalid length is reported). So as extra "protection" I added this
code to the common logic.

> We try to fix bugs at the root, not paper over them elsewhere.
> 
> So what driver is causing this?

I reproduced once with drivers/usb/dwc2 driver. May be such check could be moved inside
this driver. In this case only single potential buggy driver will get workaround.

> 
> thanks,
> 
> greg k-h

Thanks

