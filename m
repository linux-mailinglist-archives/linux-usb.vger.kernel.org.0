Return-Path: <linux-usb+bounces-2942-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F957EE8E1
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 22:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DC5A1F248B7
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 21:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7E74644D;
	Thu, 16 Nov 2023 21:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKuij+E0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E873A23AA;
	Thu, 16 Nov 2023 21:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2317C433C7;
	Thu, 16 Nov 2023 21:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700171064;
	bh=ald44zxPKSHHWmxtiq1CnFZGTT8QFCngOMNKW7PPBEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EKuij+E0DyF+eivwhkO6BCqM1ch2c6nR/mSnS9oz4i6zX42cLjDdjyJMLHnQCu7n/
	 +rhEauEneiIBBb5QaZa912jIJyAGdD0hPxSzCR/WgE6hfqGxRqP86pTzhll3uLnJWt
	 iZyaGtZrrOaXjfb3WfbskirBjiDaKS4pFc1qBX4s9hlXCKQS27jqp+jPJhmblhhMfG
	 CjqiLrLPsK/kecRe3k8QN6Z9D1flWAoGkOXKFi3Y4JGugq/4NsyqEI5ZiQxbOKkesO
	 xuIh2yb4UNEgkY2/aMzbA5S2XDB7W1OavUXTJ5q0+jU2qaVp9V0d6u6eLrUWuuqy0K
	 FIZqx4zS5J12g==
Message-ID: <bdea68ad-7523-4738-8fa1-b670d81a6b93@kernel.org>
Date: Thu, 16 Nov 2023 23:44:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] usb: cdns3-ti: add suspend/resume procedures for
 J7200
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
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <CX0GOP07I40N.198G7LJ0HYDBG@tleb-bootlin-xps13-01>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

+Vibhore,

On 16/11/2023 20:56, Théo Lebrun wrote:
> Hello Roger,
> 
> On Thu Nov 16, 2023 at 1:40 PM CET, Roger Quadros wrote:
>> On 15/11/2023 17:02, Théo Lebrun wrote:
>>> On Wed Nov 15, 2023 at 12:37 PM CET, Roger Quadros wrote:
>>>> On 13/11/2023 16:26, Théo Lebrun wrote:
>>>>> Hardware initialisation is only done at probe. The J7200 USB controller
>>>>> is reset at resume because of power-domains toggling off & on. We
>>>>> therefore (1) toggle PM runtime at suspend/resume & (2) reconfigure the
>>>>> hardware at resume.
>>>>
>>>> at probe we are doing a pm_runtime_get() and never doing a put thus
>>>> preventing any runtime PM.
>>>
>>> Indeed. The get() from probe/resume are in symmetry with the put() from
>>> suspend. Is this wrong in some manner?
>>>
>>>>> index c331bcd2faeb..50b38c4b9c87 100644
>>>>> --- a/drivers/usb/cdns3/cdns3-ti.c
>>>>> +++ b/drivers/usb/cdns3/cdns3-ti.c
>>>>> @@ -197,6 +197,50 @@ static int cdns_ti_probe(struct platform_device *pdev)
>>>>>  	return error;
>>>>>  }
>>>>>  
>>>>> +#ifdef CONFIG_PM
>>>>> +
>>>>> +static int cdns_ti_suspend(struct device *dev)
>>>>> +{
>>>>> +	struct cdns_ti *data = dev_get_drvdata(dev);
>>>>> +
>>>>> +	if (!of_device_is_compatible(dev_of_node(dev), "ti,j7200-usb"))
>>>>> +		return 0;
>>>>> +
>>>>> +	pm_runtime_put_sync(data->dev);
>>>>> +
>>>>> +	return 0;
>>>>
>>>> You might want to check suspend/resume ops in cdns3-plat and
>>>> do something similar here.
>>>
>>> I'm unsure what you are referring to specifically in cdns3-plat?
>>
>> What I meant is, calling pm_runtime_get/put() from system suspend/resume
>> hooks doesn't seem right.
>>
>> How about using something like pm_runtime_forbid(dev) on devices which
>> loose USB context on runtime suspend e.g. J7200.
>> So at probe we can get rid of the pm_runtime_get_sync() call.
> 
> What is the goal of enabling PM runtime to then block (ie forbid) it in
> its enabled state until system suspend?

If USB controller retains context on runtime_suspend on some platforms
then we don't want to forbid PM runtime.

> 
> Thinking some more about it and having read parts of the genpd source,
> it's unclear to me why there even is some PM runtime calls in this
> driver. No runtime_suspend/runtime_resume callbacks are registered.
> Also, power-domains work as expected without any PM runtime calls.

Probably it was required when the driver was introduced.

> 
> The power domain is turned on when attached to a device
> (see genpd_dev_pm_attach). It gets turned off automatically at
> suspend_noirq (taking into account the many things that make genpd
> complex: multiple devices per PD, subdomains, flags to customise the
> behavior, etc.). Removing calls to PM runtime at probe keeps the driver
> working.
> 
> So my new proposal would be: remove all all PM runtime calls from this
> driver. Anything wrong with this approach?

Nothing wrong if we don't expect runtime_pm to work with this driver.

> 
> Only possible reason I see for having PM runtime in this wrapper driver
> would be cut the full power-domain when USB isn't used, with some PM
> runtime interaction with the children node. But that cannot work
> currently as we don't register a runtime_resume to init the hardware,
> so this cannot be the current expected behavior.
> 
>> e.g.
>>
>>         pm_runtime_set_active(dev);
>>         pm_runtime_enable(dev);
>>         if (cnds_ti->can_loose_context)
>>                 pm_runtime_forbid(dev);
>>
>>         pm_runtime_set_autosuspend_delay(dev, CNDS_TI_AUTOSUSPEND_DELAY);	/* could be 20ms? */
> 
> Why mention autosuspend in this driver? This will turn the device off in
> CNDS_TI_AUTOSUSPEND_DELAY then nothing enables it back using
> pm_runtime_get. We have nothing to reconfigure the device, ie no
> runtime_resume, so we must not go into runtime suspend.

It would be enabled/disabled based on when the child "cdns3,usb"
does runtime_resume/suspend.

> 
>>         pm_runtime_mark_last_busy(dev);
>>         pm_runtime_use_autosuspend(dev);
>>
>> You will need to modify the suspend/resume handlers accordingly.
>> https://docs.kernel.org/power/runtime_pm.html#runtime-pm-and-system-sleep
>>
>> What I'm not sure of is if there are any TI platforms that retain USB context
>> on power domain off. Let me get back on this. Till then we can assume that
>> all platforms loose USB context on power domain off.
> 
> Good question indeed! Thanks for looking into it. From what I see all 5
> DT nodes which use this driver in upstream devicetrees have a
> power-domain configured. So if the behavior is the same on all three TI
> platforms (which would be the logical thing to assume) it would make
> sense that all controllers lose power at suspend.
> 
> Thanks,
> 
> --
> Théo Lebrun, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
cheers,
-roger

