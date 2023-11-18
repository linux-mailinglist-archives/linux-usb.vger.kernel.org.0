Return-Path: <linux-usb+bounces-2983-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FC07EFEF3
	for <lists+linux-usb@lfdr.de>; Sat, 18 Nov 2023 11:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF5291F235CE
	for <lists+linux-usb@lfdr.de>; Sat, 18 Nov 2023 10:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D6B1095B;
	Sat, 18 Nov 2023 10:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJpfNqUS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04FC107A5;
	Sat, 18 Nov 2023 10:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C91C433C8;
	Sat, 18 Nov 2023 10:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700304074;
	bh=IbhrKQIHbt867NOmvlXVQQ/KhWWhW4WnEbDhXB0zfMc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eJpfNqUS/ufprXVU1rWDyuPlonh5+Ts3e9BtwgX66m32maoUHUJu3smuB7zBHdfe1
	 d9SloI8FOsAAlx6nuDUi73c9w5lQSH5lbwYb2HQeFVRkS12sL9y6NyCB/uKm5ERIt2
	 CtgrMt0Zc72Q/veFUMGfYyJGjRACEVOZ/oEWLvLoqhqLIwTZElQ4Uh0SbzeOC06jxA
	 dkjlVqfjXCqwY+YFNgagFDD0YPQ21XbPbtT7/VHOdhCfYsXGOzqS/+HApU0NdB6p5K
	 rqpuoTSxuStU93Vi/lLuW8x3KXfcITBuF3Ii1A1aoD3ALpwRuHKc+mzI3TcOVi/CgY
	 1qVkxjuRGNZKQ==
Message-ID: <6a8c44e1-d3a3-49ee-bfbc-8a994a6d4ff8@kernel.org>
Date: Sat, 18 Nov 2023 12:41:07 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] usb: cdns3-ti: add suspend/resume procedures for
 J7200
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Chen <peter.chen@kernel.org>,
 Pawel Laszczak <pawell@cadence.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "Vardhan, Vibhore" <vibhore@ti.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-3-ad1ee714835c@bootlin.com>
 <5080372b-1f48-4cbc-a6c4-8689c28983cb@kernel.org>
 <CWZH66HQZNYM.T623ZOEEE0BK@tleb-bootlin-xps13-01>
 <dad980f3-e032-41e4-a1e4-a16a7f45ff95@kernel.org>
 <CX0GOP07I40N.198G7LJ0HYDBG@tleb-bootlin-xps13-01>
 <bdea68ad-7523-4738-8fa1-b670d81a6b93@kernel.org>
 <CX10D9YX1O1C.30PF317AG065N@tleb-bootlin-xps13-01>
 <3e00b2ad-b58f-4b09-9230-683c58d3bb92@kernel.org>
 <CX15J7B8F8HH.1WZ10OOW31X1H@tleb-bootlin-xps13-01>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <CX15J7B8F8HH.1WZ10OOW31X1H@tleb-bootlin-xps13-01>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 17/11/2023 16:20, Théo Lebrun wrote:
> Hi Roger,
> 
> On Fri Nov 17, 2023 at 12:51 PM CET, Roger Quadros wrote:
>> On 17/11/2023 12:17, Théo Lebrun wrote:
>>> On Thu Nov 16, 2023 at 10:44 PM CET, Roger Quadros wrote:
>>>> On 16/11/2023 20:56, Théo Lebrun wrote:
>>>>> On Thu Nov 16, 2023 at 1:40 PM CET, Roger Quadros wrote:
>>>>>> On 15/11/2023 17:02, Théo Lebrun wrote:
>>>>>>> On Wed Nov 15, 2023 at 12:37 PM CET, Roger Quadros wrote:
>>>>>>>> You might want to check suspend/resume ops in cdns3-plat and
>>>>>>>> do something similar here.
>>>>>>>
>>>>>>> I'm unsure what you are referring to specifically in cdns3-plat?
>>>>>>
>>>>>> What I meant is, calling pm_runtime_get/put() from system suspend/resume
>>>>>> hooks doesn't seem right.
>>>>>>
>>>>>> How about using something like pm_runtime_forbid(dev) on devices which
>>>>>> loose USB context on runtime suspend e.g. J7200.
>>>>>> So at probe we can get rid of the pm_runtime_get_sync() call.
>>>>>
>>>>> What is the goal of enabling PM runtime to then block (ie forbid) it in
>>>>> its enabled state until system suspend?
>>>>
>>>> If USB controller retains context on runtime_suspend on some platforms
>>>> then we don't want to forbid PM runtime.
>>>
>>> What's the point of runtime PM if nothing is done based on it? This is
>>> the current behavior of the driver.
>>
>> Even if driver doesn't have runtime_suspend/resume hooks, wouldn't 
>> the USB Power domain turn off if we enable runtime PM and allow runtime
>> autosuspend and all children have runtime suspended?
> 
> That cannot be the currently desired behavior as it would require a
> runtime_resume implementation that restores this wrapper to its desired
> state.
> 
> It could however be something that could be implemented. It would be a
> matter of enabling PM runtime and that is it in the probe. No need to
> even init the hardware in the probe. Then the runtime_resume
> implementation would call the new cdns_ti_init_hw.
> 
> This is what the cdns3-imx wrapper is doing in a way, though what they
> need is clocks rather than some registers to be written.
> 
> That all feels like outside the scope of the current patch series
> though.
> 
> My suggestion for V2 would still therefore be to remove all PM runtime
> as it has no impact. It could be added later down the road if cutting
> the power-domain is a goal of yours.

OK let's do this.

-- 
cheers,
-roger

