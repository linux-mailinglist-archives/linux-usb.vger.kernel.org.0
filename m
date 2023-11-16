Return-Path: <linux-usb+bounces-2926-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE027EE0D3
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 13:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E5C71C20A3A
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 12:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18C529428;
	Thu, 16 Nov 2023 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="naPC5FlE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D40FBE8;
	Thu, 16 Nov 2023 12:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BD7C433C8;
	Thu, 16 Nov 2023 12:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700138513;
	bh=vLGyRyE7xZ4srKu6DV6MaEhKkGUc+EK7JixMRPPZLu8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=naPC5FlEcHUpIG7KPTqcFrWgDAQBrCPlZNLUlBMx+SgTqAoTsIt+Ie6lwGNcVw8HT
	 mO48U9xc+J7nkmTCu+PPbnnSdK4v98ieT4m16G1gEhQQw6F5YmbnNZ+JBznpqzLLh5
	 3NtPrgxClTTHbd0JbVdhToJwnyfv/KOO7bLAchKCNmcd+nUA0rDctkb0L3jkNvcRDJ
	 AfHz6Ps0lUxXCMpzwQ68hlSZcfnXOPM97yEuP/w8qXyaMfSn415m3amGbkANCNTEqp
	 vqn6KzXtjjj8gXOySCTcw/qFJEU2fc3Quu30FGy95JSgr/OSEcgW/TGCzu4rNhUML7
	 clsYg4Cr/Jf5w==
Message-ID: <dad980f3-e032-41e4-a1e4-a16a7f45ff95@kernel.org>
Date: Thu, 16 Nov 2023 14:40:55 +0200
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
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-3-ad1ee714835c@bootlin.com>
 <5080372b-1f48-4cbc-a6c4-8689c28983cb@kernel.org>
 <CWZH66HQZNYM.T623ZOEEE0BK@tleb-bootlin-xps13-01>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <CWZH66HQZNYM.T623ZOEEE0BK@tleb-bootlin-xps13-01>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 15/11/2023 17:02, Théo Lebrun wrote:
> Hi Roger,
> 
> On Wed Nov 15, 2023 at 12:37 PM CET, Roger Quadros wrote:
>> On 13/11/2023 16:26, Théo Lebrun wrote:
>>> Hardware initialisation is only done at probe. The J7200 USB controller
>>> is reset at resume because of power-domains toggling off & on. We
>>> therefore (1) toggle PM runtime at suspend/resume & (2) reconfigure the
>>> hardware at resume.
>>
>> at probe we are doing a pm_runtime_get() and never doing a put thus
>> preventing any runtime PM.
> 
> Indeed. The get() from probe/resume are in symmetry with the put() from
> suspend. Is this wrong in some manner?
> 
>>> index c331bcd2faeb..50b38c4b9c87 100644
>>> --- a/drivers/usb/cdns3/cdns3-ti.c
>>> +++ b/drivers/usb/cdns3/cdns3-ti.c
>>> @@ -197,6 +197,50 @@ static int cdns_ti_probe(struct platform_device *pdev)
>>>  	return error;
>>>  }
>>>  
>>> +#ifdef CONFIG_PM
>>> +
>>> +static int cdns_ti_suspend(struct device *dev)
>>> +{
>>> +	struct cdns_ti *data = dev_get_drvdata(dev);
>>> +
>>> +	if (!of_device_is_compatible(dev_of_node(dev), "ti,j7200-usb"))
>>> +		return 0;
>>> +
>>> +	pm_runtime_put_sync(data->dev);
>>> +
>>> +	return 0;
>>
>> You might want to check suspend/resume ops in cdns3-plat and
>> do something similar here.
> 
> I'm unsure what you are referring to specifically in cdns3-plat?

What I meant is, calling pm_runtime_get/put() from system suspend/resume
hooks doesn't seem right.

How about using something like pm_runtime_forbid(dev) on devices which
loose USB context on runtime suspend e.g. J7200.
So at probe we can get rid of the pm_runtime_get_sync() call.
e.g.

        pm_runtime_set_active(dev);
        pm_runtime_enable(dev);
        if (cnds_ti->can_loose_context)
                pm_runtime_forbid(dev);

        pm_runtime_set_autosuspend_delay(dev, CNDS_TI_AUTOSUSPEND_DELAY);	/* could be 20ms? */
        pm_runtime_mark_last_busy(dev);
        pm_runtime_use_autosuspend(dev);

You will need to modify the suspend/resume handlers accordingly.
https://docs.kernel.org/power/runtime_pm.html#runtime-pm-and-system-sleep

What I'm not sure of is if there are any TI platforms that retain USB context
on power domain off. Let me get back on this. Till then we can assume that
all platforms loose USB context on power domain off.

One comment below.

> +	return ret;
> +}


> 
>  - Using pm_runtime_status_suspended() to get the current PM runtime
>    state & act on it? I don't see why because we know the pm_runtime
>    state is a single put() at probe.
> 
>  - Having a `in_lpm` flag to track low-power mode state? I wouldn't see
>    why we'd want that as we don't register runtime_suspend &
>    runtime_resume callbacks and system syspend/resume can be assumed to
>    be called in the right order.
> 
>  - Checking the `device_may_wakeup()`? That doesn't apply to this driver
>    which cannot be a wakeup source.
> 
> Thanks for your review!
> Regards,
> 
> --> +static int cdns_ti_resume(struct device *dev)
> +{
> +	struct cdns_ti *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!of_device_is_compatible(dev_of_node(dev), "ti,j7200-usb"))
> +		return 0;
> +
> +	ret = pm_runtime_get_sync(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "pm_runtime_get_sync failed: %d\n", ret);
> +		goto err;
> +	}
> +
> +	cdns_ti_init_hw(data);
> +
> +	return 0;
> +
> +err:
> +	pm_runtime_put_sync(data->dev);
> +	pm_runtime_disable(data->dev);

Why do you do a pm_runtime_disable() here?

> +	return ret;
> +}


> Théo Lebrun, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
> ------------------------------------------------------------------------
> 
> 

-- 
cheers,
-roger

