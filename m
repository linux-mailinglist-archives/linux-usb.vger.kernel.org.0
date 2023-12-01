Return-Path: <linux-usb+bounces-3536-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 875C580092A
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 11:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B88501C20C85
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 10:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA8B20B3D;
	Fri,  1 Dec 2023 10:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f4vVePf+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC15A208A9
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 10:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A52AFC433C8;
	Fri,  1 Dec 2023 10:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701428233;
	bh=Oq0kqOP01NdYfWI6CUIb/qnr5mpWp63Eao1PiQvHSdE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f4vVePf+y0CmsPee1Eprexqu/MEoBYFcR1J3Kk82L80GniiYoMQjKkaTv1cvZ7Dib
	 M9Dcv6J4zNWHzxn9NvAFrRJGVBjgrZKY+cnd93PIhiwLQGY91gHSAngzS7ZxcgYAU4
	 XQMfMZs8LHfY4yBYCwvIHBsi6aN23SP3mzlJeo3YBmk5SI5PvEiFmUczAPId0tJq3/
	 r/DIkk9HCOcofsQDR7tCXsxJS+mH4S4C6IDY1wOeDl8Qtfgliuni4epEjLasrTQx53
	 OK4IOYYbmKrTbegKIDOqL4yGbDIliau1F/JEq6pd86P/HPzRK5cGNjWn4cOdxg3iET
	 hrmShK5FUwUIA==
Message-ID: <019c84e6-2e77-4b76-b105-fc9ff678c058@kernel.org>
Date: Fri, 1 Dec 2023 12:57:07 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: typec: tps6598x: use device 'type' field to identify
 devices
Content-Language: en-US
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Alexandru Ardelean <alex@shruggie.ro>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 christophe.jaillet@wanadoo.fr, a-govindraju@ti.com, trix@redhat.com,
 abdelalkuor@geotab.com, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20231123210021.463122-1-alex@shruggie.ro>
 <ZWdKI9UOZ6INP0Tu@kuha.fi.intel.com>
 <47ffbb30-34a7-4f5b-b262-3e068e574c8a@kernel.org>
 <ZWhp9M8165DiTNTd@kuha.fi.intel.com>
 <292f5d48-8567-4b60-ad03-6cf70f71bacc@kernel.org>
 <ZWmVA9KTVhZ4YCPO@kuha.fi.intel.com>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <ZWmVA9KTVhZ4YCPO@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

+Rob & Krzysztof

On 01/12/2023 10:10, Heikki Krogerus wrote:
> Hi Roger,
> 
> On Thu, Nov 30, 2023 at 03:30:54PM +0200, Roger Quadros wrote:
>> Hi Heikki,
>>
>> On 30/11/2023 12:54, Heikki Krogerus wrote:
>>> Hi Roger,
>>>
>>>>> Why not just match against the structures themselves?
>>>>>
>>>>>         if (tps->data == &tps25750_data)
>>>>>                 ...
>>>>
>>>> Then you need to declare tps25750_data and friends at the top of the file?
>>>>
>>>> A better approach might be to have type agnostic quirk flags for the special
>>>> behavior required for different types. This way, multiple devices can share
>>>> the same quirk if needed.
>>>>
>>>> e.g.
>>>> NEEDS_POWER_UP instead of TIPD_TYPE_APPLE_CD321X
>>>> SKIP_VID_READ instead of TIPD_TYPE_TI_TPS25750X
>>>> INIT_ON_RESUME instead of TIPD_TYPE_TI_TPS25750X
>>>>
>>>> Also rename cd321x_switch_power_state() to tps6598x_switch_power_state().
>>>
>>> No. Functions like that isolate cd321x specific functionality into an
>>> actual "function" just like they should.
>>>
>>> Quirk flags mean that if something breaks, it will almost always break
>>> for everybody (there is no real isolation with quirk flags), and when
>>> things are fixed and when features are added, we are forced to always
>>> "dance" around those quirk flags - you always have to consider them.
>>>
>>> Platform/device type checks are just as bad IMO, but in one way they
>>> are better than quirk flags. There is no question about what a
>>> platform check is checking, but quirk flags can so easily become
>>> incomprehensible (just what exactly does it mean when you say
>>> NEEDS_POWER_UP, SKIP_VID_READ and so on (you would need to document
>>> those quirks, which is waste of effort, and in reality nobody will do).
>>>
>>> In case of tipd/code.c, it should be converted into a library that
>>> only has the common/shared functionality. CD321, TPS2579x, TPS6598x
>>> and what ever there is, then will have a glue driver that handles
>>> everything that specific for their controller type.
>>
>> Do you mean that you want to treat the 3 devices as different incompatible devices
>> so each one has a separate driver which warrants for a different DT binding
>> for each and also Kconfig symbol?
> 
> I did not consider that, I was thinking that we would still continue
> with just one probe driver for all of these, but now that you
> mentioned this, maybe it would actually make sense to have separate
> full fledged probing drivers for all of these. Do you think it would
> be better like that? Would it be a problem to split the bindings?

I'm no DT expert but looks like an overkill to me.

-- 
cheers,
-roger

