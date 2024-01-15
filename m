Return-Path: <linux-usb+bounces-5065-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C47F182D7A9
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 11:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 234AEB21713
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 10:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904351E4B9;
	Mon, 15 Jan 2024 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FFi8Cmsv"
X-Original-To: linux-usb@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EEC2BB03
	for <linux-usb@vger.kernel.org>; Mon, 15 Jan 2024 10:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705315485;
	bh=usBhWxwQUwIyxoO0ZQ5ZRbKdw9mB1qxhUJv4iNLXGJs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FFi8CmsvZ+lLrAj52gG/E9RtAVcd+aUL1vEc8Tchd1Twzlilxwv8BEclqSYOGZC91
	 hZrLOksRP/rFHsIsOnmnqSrVswN/Uv0XYGiY994i88vgm+vTzbyCaeTe40NnM50z4k
	 w8/Pt84GTAkBE2RmIA0z1sG9Br//hLpH63UP5l/7N15s2n1827aDiGp4zvtb2MaffX
	 2CVJoFSWyM5LaL7bfLy6YPCsquamXwidy7xouauDxZHuFG5Z4nT15yb0wQhgvNYOJb
	 50K9cBbJ+pvtcYaGvcdc4/ZQ6VikdJ9t/PrQGO9sx2YHhWenfGBOrTU2imK0MR+VNV
	 ZYZVfvLne7fLA==
Received: from [10.3.2.36] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vivek)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 075FE3780629;
	Mon, 15 Jan 2024 10:44:44 +0000 (UTC)
Message-ID: <721dd9c6-f160-4f5b-a593-02f13589e403@collabora.com>
Date: Mon, 15 Jan 2024 10:44:42 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "balbi@kernel.org" <balbi@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "johan@kernel.org" <johan@kernel.org>,
 "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "piyush.mehta@amd.com" <piyush.mehta@amd.com>,
 "ray.huang@amd.com" <ray.huang@amd.com>
References: <20231122165931.443845-1-gpiccoli@igalia.com>
 <2dfbf5c9-dd38-c919-c604-618ad08ce456@igalia.com>
 <20231205012336.mn7b7f4zypwcyv6w@synopsys.com>
 <9efaed91-d246-cf3c-efc0-e866f88a943d@igalia.com>
 <d85a5507-4d4a-9e60-fbd1-68b42afb2143@igalia.com>
 <20240111020119.5u3k3csn3bi2zhtw@synopsys.com>
 <849d11d9-9302-4d76-01b6-b5046f474fda@igalia.com>
 <20240113013320.mrqqrdajrnw62kis@synopsys.com>
Content-Language: en-GB
From: Vivek Dasmohapatra <vivek@collabora.com>
Autocrypt: addr=vivek@collabora.com; keydata=
 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 Rdk=
In-Reply-To: <20240113013320.mrqqrdajrnw62kis@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/01/2024 01:33, Thinh Nguyen wrote:


> Perhaps you're missing the logic/flow to update the power state change
> when in device mode. And perhaps putting the controller in host mode
> passes the control to xhci allowing the driver to properly manage the
> power state preventing PME from generated? It's a little difficult to
> debug without more info.

That may well be what's happening - I believe the driver does indeed
delegate to xhci when in host mode.

What information can we get to you that would help get to the bottom of 
this?

> Did you seek help from the vendor?

We have/are but we haven't arrived at a fix there yet either.

>>
>> I'll check both Steam Deck models (LCD and OLED) to see if both can be
>> quirked in the same way and provide then a simple patch doing that for
>> review, makes sense?
>>
> 
> I assume you ruled out problems from bad cable or faulty laptop/device?

We've had multiple people confirm this behaviour with different power 
supplies / cables / devices / kernel versions, so we're sure this is a
"real thing".

