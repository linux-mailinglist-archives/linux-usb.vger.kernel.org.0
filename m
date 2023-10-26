Return-Path: <linux-usb+bounces-2207-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AB87D7E80
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 10:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2192281EEE
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 08:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2FA1A5B9;
	Thu, 26 Oct 2023 08:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rlHtz9xB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35C015AF6;
	Thu, 26 Oct 2023 08:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDFDC433C8;
	Thu, 26 Oct 2023 08:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698308972;
	bh=CTFVbTZqO5OGlZiX3WaXdGwenvlKlAQhgXR0GUTuxCU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rlHtz9xB+wEz9wF3YvoduRFGpaYt51ROpBxrpoWUEi+AZRzB5OBzy9TaGYXvX9SMN
	 bNlEHpVhoMDIUcAafN3xFGL5FPXxJbI9L4uACS3w3MKedHAxi4iuXflr1EQDHAX1pf
	 S1pz+hCfgpsPeJEu2jeg7zZEym+w7ws9rnm/ORELmhEHSc1Kti3PSzNPdWp6HWAtf/
	 soBzXoMxu+6pj+b0CT1E+xzKrf1aFxYr8Xt+m0cmqVCf83sia1zPhicgglqvM3Ijn9
	 dYcDbwzae9VxygW2QGIxGaJ1mRb+uxFDOgG8hpZJAct3aUOvwmdGhj2lz4NwtW59e0
	 jU3a2IlWaB+lg==
Message-ID: <bd74947f-8827-4539-a590-9c53d5ddd02d@kernel.org>
Date: Thu, 26 Oct 2023 11:29:27 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] usb: dwc3: Modify runtime pm ops to handle bus
 suspend
Content-Language: en-US
To: Elson Serrao <quic_eserrao@quicinc.com>, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20230814185043.9252-1-quic_eserrao@quicinc.com>
 <20230814185043.9252-4-quic_eserrao@quicinc.com>
 <9be9fae5-f6f2-42fe-bd81-78ab50aafa06@kernel.org>
 <cd294a89-33e7-0569-81b3-df77a255f061@quicinc.com>
 <0dee3bec-d49f-4808-a2f8-7a4205303e1f@kernel.org>
 <c7fc7bc2-1a84-e6b5-5198-1b8cc602d738@quicinc.com>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <c7fc7bc2-1a84-e6b5-5198-1b8cc602d738@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 26/10/2023 01:21, Elson Serrao wrote:
> 
> 
> On 10/25/2023 1:02 AM, Roger Quadros wrote:
>>
>>
>> On 24/10/2023 21:41, Elson Serrao wrote:
>>>
>>>
>>> On 10/24/2023 3:14 AM, Roger Quadros wrote:
>>>> Hi Elson,
>>>>
>>>> On 14/08/2023 21:50, Elson Roy Serrao wrote:
>>>>> The current implementation blocks the runtime pm operations when cable
>>>>> is connected. This would block dwc3 to enter a low power state during
>>>>> bus suspend scenario. Modify the runtime pm ops to handle bus suspend
>>>>> case for such platforms where the controller low power mode entry/exit
>>>>> is handled by the glue driver. This enablement is controlled through a
>>>>> dt property and platforms capable of detecting bus resume can benefit
>>>>> from this feature. Also modify the remote wakeup operations to trigger
>>>>> runtime resume before sending wakeup signal.
>>>>>
>>>>> Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
>>>>> ---
>>>>>    drivers/usb/dwc3/core.c   | 28 ++++++++++++++++++++++++++--
>>>>>    drivers/usb/dwc3/core.h   |  3 +++
>>>>>    drivers/usb/dwc3/gadget.c | 32 +++++++++++++++++++++++++-------
>>>>>    3 files changed, 54 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>>>> index 9c6bf054f15d..9bfd9bb18caf 100644
>>>>> --- a/drivers/usb/dwc3/core.c
>>>>> +++ b/drivers/usb/dwc3/core.c
>>>>> @@ -1518,6 +1518,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>>>>        dwc->dis_split_quirk = device_property_read_bool(dev,
>>>>>                    "snps,dis-split-quirk");
>>>>>    +    dwc->runtime_suspend_on_usb_suspend = device_property_read_bool(dev,
>>>>> +                "snps,runtime-suspend-on-usb-suspend");
>>>>> +
>>>>>        dwc->lpm_nyet_threshold = lpm_nyet_threshold;
>>>>>        dwc->tx_de_emphasis = tx_de_emphasis;
>>>>>    @@ -2029,6 +2032,9 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
>>>>>          switch (dwc->current_dr_role) {
>>>>>        case DWC3_GCTL_PRTCAP_DEVICE:
>>>>> +        /* runtime resume on bus resume scenario */
>>>>> +        if (PMSG_IS_AUTO(msg) && dwc->connected)
>>>>> +            break;
>>>>>            ret = dwc3_core_init_for_resume(dwc);
>>>>>            if (ret)
>>>>>                return ret;
>>>>> @@ -2090,8 +2096,13 @@ static int dwc3_runtime_checks(struct dwc3 *dwc)
>>>>>    {
>>>>>        switch (dwc->current_dr_role) {
>>>>>        case DWC3_GCTL_PRTCAP_DEVICE:
>>>>> -        if (dwc->connected)
>>>>> +        if (dwc->connected) {
>>>>> +            /* bus suspend scenario */
>>>>> +            if (dwc->runtime_suspend_on_usb_suspend &&
>>>>> +                dwc->suspended)
>>>>
>>>> If dwc is already suspended why do we return -EBUSY?
>>>> Should this be !dwc->suspended?
>>>>
>>>
>>> Hi Roger
>>>
>>> Thank you for reviewing.
>>> If dwc->suspended is true (i.e suspend event due to U3/L2 is received), I am actually breaking from this switch statement and returning 0.
>>
>> Of course. I missed the break :)
>>
>>>
>>>>> +                break;
>>>>>                return -EBUSY;
>>>>> +        }
>>>>>            break;
>>>>>        case DWC3_GCTL_PRTCAP_HOST:
>>>>>        default:
>>>>> @@ -2107,9 +2118,22 @@ static int dwc3_runtime_suspend(struct device *dev)
>>>>>        struct dwc3     *dwc = dev_get_drvdata(dev);
>>>>>        int        ret;
>>>>>    -    if (dwc3_runtime_checks(dwc))
>>>>> +    ret = dwc3_runtime_checks(dwc);
>>>>> +    if (ret)
>>>>>            return -EBUSY;
>>>>>    +    switch (dwc->current_dr_role) {
>>>>> +    case DWC3_GCTL_PRTCAP_DEVICE:
>>>>> +        /* bus suspend case */
>>>>> +        if (!ret && dwc->connected)
>>>>
>>>> No need to check !ret again as it will never happen because
>>>> we are returning -EBUSY earlier if (ret);
>>>>
>>> Thanks for this catch. I will remove !ret check in v5.
>>>
>>>>> +            return 0;
>>>>> +        break;
>>>>> +    case DWC3_GCTL_PRTCAP_HOST:
>>>>> +    default:
>>>>> +        /* do nothing */
>>>>> +        break;
>>>>> +    }
>>>>> +
>>>>
>>>> While this takes care of runtime suspend case, what about system_suspend?
>>>> Should this check be moved to dwc3_suspend_common() instead?
>>>>
>>>
>>> Sure I can move these checks to dwc3_suspend_common to make it generic.
>>
>> Before you do that let's first decide how we want the gadget driver to behave
>> in system_suspend case.
>>
>> Current behavior is to Disconnect from the Host.
>>
>> Earlier I was thinking on the lines that we prevent system suspend if
>> we are not already in USB suspend. But I'm not sure if that is the right
>> thing to do anymore. Mainly because, system suspend is a result of user
>> request and it may not be nice to not to meet his/her request.
> 
> Agree. Irrespective of whether USB is suspended or not it is better to honor the system suspend request from user.
> 
>> Maybe best to leave this policy handling to user space?
>> i.e. if user wants USB gadget operation to be alive, he will not issue
>> system suspend?
>>
> 
> Sure. So below two cases
> 
> Case1: User doesn't care if gadget operation is alive and triggers system suspend irrespective of USB suspend. Like you mentioned, current behavior already takes care of this and initiates a DISCONNECT
> 
> Case2:  User wants gadget to stay alive and hence can trigger system suspend only when USB is suspended (there are already user space hooks that read cdev->suspended bit to tell whether USB is suspended or not for user to decide). Attempts to request system suspend when USB is not suspended, would result in a DISCONNECT.
> 
> For supporting Case2 from gadget driver point of view, we need to extend this series by having relevant checks in suspend_common()
> 
> Also, is it better to provide separate flags to control the gadget driver behavior for runtime suspend Vs system suspend when USB is suspended ? For example, what if we want to enable bus suspend handling for runtime suspend only and not for system suspend (Case1).

But you mentioned that for Case1, USB gadget would disconnect from Host. So USB will be in disconnected state and USB controller can be fully de-activated? Except maybe wakeup handling to bring system out of suspend on a USB plug/unplug event?
Why do we need separate flags for?

-- 
cheers,
-roger

