Return-Path: <linux-usb+bounces-2958-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B547EF221
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 12:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6F181C20938
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 11:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E823033E;
	Fri, 17 Nov 2023 11:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZGdU4Pu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA2A30325;
	Fri, 17 Nov 2023 11:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A6BC433C7;
	Fri, 17 Nov 2023 11:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700221916;
	bh=5ZHexz3dAhJlMDGTudHyhTd6kwWzrrePNKd8DrxTuEo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KZGdU4Pu42n4aaFkPPt5SUe0neGnHjVCJoi1rFNP07vq5JqEsYQkzXoXTZxO25mfy
	 aX++K93oA2GkRMwgUp71LAhNBP8FSCr554nZDZaMXlPgLBLsb1nOX3LP2x7FXniJ7O
	 XXhIOOLCJcTiQsIuadxtOAMXNejf7T8n19zTVt0JoXqBrI5t0O0+GMgv0dDom+HRDU
	 KMAWxjZRFe81M88eQQEmzqeslO1kcksjuc5JRGjygkMJGFZcgupSPr1vrWgeGmzZTd
	 w8UI+fq7+f0jjSRJMktV559GXqXLP307h2CtIQI7LF3L9fRNvOBK9n7zL6YxTWEVU9
	 H8/aIIhsTDGTQ==
Message-ID: <3e00b2ad-b58f-4b09-9230-683c58d3bb92@kernel.org>
Date: Fri, 17 Nov 2023 13:51:49 +0200
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
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <CX10D9YX1O1C.30PF317AG065N@tleb-bootlin-xps13-01>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 17/11/2023 12:17, Théo Lebrun wrote:
> Hello,
> 
> On Thu Nov 16, 2023 at 10:44 PM CET, Roger Quadros wrote:
>> On 16/11/2023 20:56, Théo Lebrun wrote:
>>> On Thu Nov 16, 2023 at 1:40 PM CET, Roger Quadros wrote:
>>>> On 15/11/2023 17:02, Théo Lebrun wrote:
>>>>> On Wed Nov 15, 2023 at 12:37 PM CET, Roger Quadros wrote:
>>>>>> You might want to check suspend/resume ops in cdns3-plat and
>>>>>> do something similar here.
>>>>>
>>>>> I'm unsure what you are referring to specifically in cdns3-plat?
>>>>
>>>> What I meant is, calling pm_runtime_get/put() from system suspend/resume
>>>> hooks doesn't seem right.
>>>>
>>>> How about using something like pm_runtime_forbid(dev) on devices which
>>>> loose USB context on runtime suspend e.g. J7200.
>>>> So at probe we can get rid of the pm_runtime_get_sync() call.
>>>
>>> What is the goal of enabling PM runtime to then block (ie forbid) it in
>>> its enabled state until system suspend?
>>
>> If USB controller retains context on runtime_suspend on some platforms
>> then we don't want to forbid PM runtime.
> 
> What's the point of runtime PM if nothing is done based on it? This is
> the current behavior of the driver.

Even if driver doesn't have runtime_suspend/resume hooks, wouldn't 
the USB Power domain turn off if we enable runtime PM and allow runtime
autosuspend and all children have runtime suspended?

> 
>>> Thinking some more about it and having read parts of the genpd source,
>>> it's unclear to me why there even is some PM runtime calls in this
>>> driver. No runtime_suspend/runtime_resume callbacks are registered.
>>> Also, power-domains work as expected without any PM runtime calls.
>>
>> Probably it was required when the driver was introduced.
> 
> I'm not seeing any behavior change in cdns3-ti since its addition in Oct
> 2019.
> 
>>> The power domain is turned on when attached to a device
>>> (see genpd_dev_pm_attach). It gets turned off automatically at
>>> suspend_noirq (taking into account the many things that make genpd
>>> complex: multiple devices per PD, subdomains, flags to customise the
>>> behavior, etc.). Removing calls to PM runtime at probe keeps the driver
>>> working.
>>>
>>> So my new proposal would be: remove all all PM runtime calls from this
>>> driver. Anything wrong with this approach?
>>
>> Nothing wrong if we don't expect runtime_pm to work with this driver.
>>
>>>
>>> Only possible reason I see for having PM runtime in this wrapper driver
>>> would be cut the full power-domain when USB isn't used, with some PM
>>> runtime interaction with the children node. But that cannot work
>>> currently as we don't register a runtime_resume to init the hardware,
>>> so this cannot be the current expected behavior.
>>>
>>>> e.g.
>>>>
>>>>         pm_runtime_set_active(dev);
>>>>         pm_runtime_enable(dev);
>>>>         if (cnds_ti->can_loose_context)
>>>>                 pm_runtime_forbid(dev);
>>>>
>>>>         pm_runtime_set_autosuspend_delay(dev, CNDS_TI_AUTOSUSPEND_DELAY);	/* could be 20ms? */
>>>
>>> Why mention autosuspend in this driver? This will turn the device off in
>>> CNDS_TI_AUTOSUSPEND_DELAY then nothing enables it back using
>>> pm_runtime_get. We have nothing to reconfigure the device, ie no
>>> runtime_resume, so we must not go into runtime suspend.
>>
>> It would be enabled/disabled based on when the child "cdns3,usb"
>> does runtime_resume/suspend.
> 
> Why care about being enabled or disabled if we don't do anything based
> on that? Children does do runtime PM stuff but I don't understand how
> that could influence us.
> 
> Regards,
> 
> --
> Théo Lebrun, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

-- 
cheers,
-roger

