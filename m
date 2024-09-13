Return-Path: <linux-usb+bounces-15099-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46721978509
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 17:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D486AB256A1
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 15:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCB657C8D;
	Fri, 13 Sep 2024 15:39:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13E52EB02
	for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 15:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726241969; cv=none; b=CwlYht+fZ2sgqThLXp3TkHE4ezzH9jv3ybyY/PHIG8qrFg+ip2VUhlp434LQ1UHN83uwoBJvRWLk9h8xQqpiO/msZV6Aw6K3Wr8f0o1icLgVCq9tHbRzbtBqGlA46ZrNZj3C3tYO5GfZVq9cEa8CL5MFuE/OXdZKVJ5RgwueFY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726241969; c=relaxed/simple;
	bh=RSntGYLig2YB//6LF8YiO4eAEV0v3UrZhSjDdPQrVBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0382PVB+Z/aGAwcMef9QPPz/AjNF3f9Yt9s7Y7EvOZEef+JeC9BOgEpsBnbsAJ3dq1WQv0UwXHjtYm9AmbNER/kBTVjgtAj5PfpZGQQpSv1nbqsOpI6K31GQF+aHvIDiVuOW912HstEVhmYcdMvGMgD8mox1lgjEJdc0R09uVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D0A160009;
	Fri, 13 Sep 2024 15:39:23 +0000 (UTC)
Message-ID: <5f8cdcac-6927-429a-8ef5-0891c90e8efd@korsgaard.com>
Date: Fri, 13 Sep 2024 17:39:21 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "usb: gadget: composite: fix OS descriptors
 w_value
To: "Vodicka, Michal" <michal.vodicka@hidglobal.com>
Cc: "balbi@kernel.org" <balbi@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "Vrastil, Michal" <michal.vrastil@hidglobal.com>,
 "stable@kernel.org" <stable@kernel.org>
References: <AS8PR05MB10129E57ED13CF18746FC4BE18A9B2@AS8PR05MB10129.eurprd05.prod.outlook.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <AS8PR05MB10129E57ED13CF18746FC4BE18A9B2@AS8PR05MB10129.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: peter@korsgaard.com

On 9/11/24 03:32, Vodicka, Michal wrote:
>> Hmm, very odd. How are you testing this on the host side?
> 
> We just attach the device and check the registry values created by OS
> for our device. As
> HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_XXXX&PID_YYYY&MI_NN\<device_instance>\Device Parameters.
> When it works our extended properties are created there.
> 
> We check the communication using USB analyzer which clearly shows
> wValue bytes are in opposite order than documented. This is SETUP
> packet captured:
> 
> Offset  0   1   2   3   4   5   6   7
> 0x000   C1  A1  02  00  05  00  0A  00
> 
> As you can see, this is interface request and out interface number was
> 2 which is in the low byte of wValue.

OK, annoying. I am traveling for conferences this/next week so I cannot 
verify here, but presumably you are correct. Do you perhaps have a more 
complete capture you can share?


> 
>> Could it be that you are running into the WinUSB bug described here:
> 
> No. The mentioned bug is in wIndex and out problem is wValue. Also,
> MSOS descriptors are read before WinUsb is even run.

Ahh yes, indeed.


> What Windows version were you using and have you used USB analyzer to
> check the communication?

It's been a while, but I believe Windows 10. In the end I ended up 
shuffling the interfaces around so the one with the MSOS descriptors was 
interface 0 for better compatibility, so it is possible that something 
went wrong with my interface != 0 tests.

If so, then I am fine with reverting, but we should probably add a 
comment explaining that the documentation is wrong.

-- 
Bye, Peter Korsgaard


