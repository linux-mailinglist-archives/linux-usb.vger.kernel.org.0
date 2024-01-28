Return-Path: <linux-usb+bounces-5564-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3414283F617
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jan 2024 16:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FEEDB21C8A
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jan 2024 15:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB49F23746;
	Sun, 28 Jan 2024 15:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="N+s3dyZV"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D70923763
	for <linux-usb@vger.kernel.org>; Sun, 28 Jan 2024 15:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706455542; cv=none; b=JFlXL/w2fnl2k8XAGBUAG7OcBWLEVaP2TfB1Gat9TfE1/jEcQ/TKTgkgkdVU9zwc8aWauAGbUsyzhnB+qKx4E4mOThwJ1IbLoUGohGqOuun5edrh3mIGvACCMjNF5iEx0o6k0lE5I2L6asmPr9z69PtBPyDV2NP5k4W7qqEyw1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706455542; c=relaxed/simple;
	bh=OTN7zQQ77Hr0KtFz3LmKhD3N8ovnVxyNwA23zYwK8VA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q4GLeeGIivLSvV+eCz3SUtvaRUSrF8mCyBLn4h4FT5bZvqc1dZcZWaX2GKGckcy1nKHvO1EHMW7jk3kAovwqu1vg0/ARK4aP2WRjB2qJxeVviq7elwKkWh3Ip84CNMQTFR/vHf5P/ISxnYLGhbDic/bF+HoELgnd81WZK726hIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=N+s3dyZV; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PvC9HUT0W5TzfG/Gntx5NmAn7KWg3UahMHBghdEJW9A=; b=N+s3dyZVP8rgcrGIhWmPTkTwne
	NVPQ3crtwXZM/+hAHVLNgaEJlol1suGtEQ8cwACdawtxPo7Ye6z/gpWftenLHBM46UosTfo3q4KWq
	r+M3g+wONWYRQPiJtavnjTKhCzXaqnP09BLwkjfx4G4wDbpQcz1HqpsA2EO2IPkLBGiRA9PsMIHAs
	haWUHVeQWhN8X+7kMQw7ZSLhH85Fg01HTv8ao/qac1slL/YaJRHHow28h3lz1P8r59jEvxgQ3nhtZ
	Jt69M0VjhtEIIMWghYM9DPqqPVox5Ci74Q0IyNWSSLn+1SK2gyKZIB1h2h7pL+v5pfbJ+0OxPconC
	pdl/C2yg==;
Received: from [187.90.178.235] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rU727-00Awru-2F; Sun, 28 Jan 2024 16:25:19 +0100
Message-ID: <dd3339b0-75ac-b64e-4dac-d9394e91baef@igalia.com>
Date: Sun, 28 Jan 2024 12:25:09 -0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "balbi@kernel.org" <balbi@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "johan@kernel.org" <johan@kernel.org>,
 "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Vivek Dasmohapatra <vivek@collabora.com>,
 "piyush.mehta@amd.com" <piyush.mehta@amd.com>,
 "ray.huang@amd.com" <ray.huang@amd.com>
References: <9efaed91-d246-cf3c-efc0-e866f88a943d@igalia.com>
 <d85a5507-4d4a-9e60-fbd1-68b42afb2143@igalia.com>
 <20240111020119.5u3k3csn3bi2zhtw@synopsys.com>
 <849d11d9-9302-4d76-01b6-b5046f474fda@igalia.com>
 <20240113013320.mrqqrdajrnw62kis@synopsys.com>
 <54a9b6b6-ef41-f76a-43e0-a395adddb455@igalia.com>
 <20240117003437.mxgo3ebxql4ftwjt@synopsys.com>
 <8b49285e-46de-c52a-ea8d-542c91ba4128@igalia.com>
 <20240118003949.tmw3uq76hvwe4ylz@synopsys.com>
 <e2d02355-b47b-8298-c5c9-8c6d199b2728@igalia.com>
 <20240123021237.hyckfhsxvem7ydqv@synopsys.com>
Content-Language: en-US
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20240123021237.hyckfhsxvem7ydqv@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thinh, thanks again for the help and apologies for my delay.
Responses inline below:


On 22/01/2024 23:12, Thinh Nguyen wrote:
> [...]
> 
> The tracepoints indicated that no gadget driver was binded. So the
> controller actually never started (ie. soft-connection never happened if
> the controller doesn't start).
> 
>>
>> (2) Plugged the USB cable connecting the Deck to my laptop - results at
>> {trace,regdump}.2 and as we can see, traces are empty.
> 
> Right, because as noted above, no activity is seen.
> 

Okay, that makes sense then and explains why I see nothing related to
the Deck on my laptop! Do you know a SW way to measure that the USB port
is providing power / "energy"? It's just out of curiosity, not that we
need that in this case (knowing the lack of a gadget driver).


>> [...]
> 
> I can see the device was resumed right after.
> 
>   kworker/u32:10-1078    [002] ...1.   179.453703: dwc3_pci_suspend <-pci_pm_suspend
>   kworker/u32:10-1078    [002] ...1.   179.453704: dwc3_pci_dsm <-pci_pm_suspend
>   kworker/u32:19-1087    [005] ...1.   179.939836: dwc3_pci_resume <-dpm_run_callback
> 
>>
>> (4) [bonus] Collected the same results of 3 (after rebooting the Deck)
>> but running dwc3 with this patch/quirk - it's easy to notice in the
>> trace, as we can see the extras readl/writel prior to suspend. In this
>> case, suspend works...and results are on {trace,regdump}.4-PATCHED
> 
> Even in the patched version, device was resumed right after. The resume
> here may not trigger the system resume, but it resumed nonetheless.
> 
>    kworker/u32:6-356     [006] ...1.    69.600400: dwc3_pci_suspend <-pci_pm_suspend
>    kworker/u32:6-356     [006] ...1.    69.600401: dwc3_pci_dsm <-pci_pm_suspend
>   kworker/u32:22-1028    [001] ...1.    70.125294: dwc3_pci_resume <-dpm_run_callback
>

Yeah, in both cases the resume happened. But they differ: without the
patch, resume was automatic - the device effectively can't suspend since
it auto-resumes instantly. Whereas with the patch (scenario 4), I've
triggered the resume by pressing the power button on Steam Deck.

And ftrace timestamps unfortunately don't help with that, it's not
showing how much time the device stay suspended, so it might be
confusing and both cases could appear as the same exact scenario, even
if they are completely different (fail vs success cases).


>> [...]
> Thanks for the logs and data points. The tracepoints indicate that the
> workaround _only_ prevented the system wakeup, not the controller.
> The wakeup still happen there as you can see the controller got woken up
> immediately after request to go into suspend in both cases, patched or
> not. So the workaround you provided doesn't help keeping the controller
> in suspend.

Yeah, this is not really the case - as mentioned above, though they
appear the same in traces, without the workaround we have an immediate
auto-resume, preventing the suspend. With the patch, device suspends and
we can keep it this way for the amount of time we want, only resuming
when we press the power button (which is exactly the expected behavior).


> 
> We need to look into why that's the case, and we need to figure out
> where the source of the wake came from. Do you have a connector
> controller that can also wakeup the system?

I'm not sure about this, what do you mean by a connector controller?!


> 
> As for the workaround, if the wakeup source is the usb controller, did
> you try to disable wakeup?
> 
> diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
> index 6604845c397c..e395d7518022 100644
> --- a/drivers/usb/dwc3/dwc3-pci.c
> +++ b/drivers/usb/dwc3/dwc3-pci.c
> @@ -359,7 +359,7 @@ static int dwc3_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
>  		goto err;
>  	}
>  
> -	device_init_wakeup(dev, true);
> +	device_init_wakeup(dev, false);
>  	pci_set_drvdata(pci, dwc);
>  	pm_runtime_put(dev);
>  #ifdef CONFIG_PM
> 
>  If it works, you can fine tune to only disable wakeup when in device
>  mode and enable when in host mode with device_set_wakeup_enable().
> 

Oh, great suggestion - thanks! And...it worked!

So, with your patch, I'm able to properly suspend the Deck, even with
dwc3 in device/gadget mode.

I'll try to cook a patch with this approach but restricted to this
specific USB controller and only when in gadget mode - do you think this
is the way to go?

Any other debug / logs that might be useful?
Cheers,

Guilherme

