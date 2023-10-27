Return-Path: <linux-usb+bounces-2246-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C73977D8ED4
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 08:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C9731C2102D
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 06:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8383963BD;
	Fri, 27 Oct 2023 06:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xha9T82P"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FF68813;
	Fri, 27 Oct 2023 06:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37ED2C433C8;
	Fri, 27 Oct 2023 06:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698388643;
	bh=iTtuERV2GGYkyPX4sdPoambzqvDILTxFvFsnlUuWTEs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xha9T82PS3pmzm0UIVeMCGsm2lj7BEV83PPvtrPif94MJYHU+mWsTCpnnPRAVJNov
	 w9mUwd+MZUQqkrkY9vL/l7E4Zglp4e6aZVW5dVf5IRNq8YJpDpdvYOOj8dU7Um98cR
	 9B/VNSB8DWM7xBL3LBIf/d4zYR/esLLntEV8N+yxGm1r3LiUIdfveiCaC+jKpFVkUx
	 Snibywkb+xrFkL+2XLQjybVPpzuNocDh6dhNR1eRi6FPLgl37YoklJWshA4WyKepvZ
	 jBz5TAB7ZaBIRZIWypyoTbB72W5QiTSyU1cu5kTRt5Dz0FwsbDPNKFJCbJoNk7EVpJ
	 c1uzmAAAP/+/Q==
Message-ID: <09707469-193b-43c5-8503-b75f97ba1fbf@kernel.org>
Date: Fri, 27 Oct 2023 09:37:17 +0300
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
 <bd74947f-8827-4539-a590-9c53d5ddd02d@kernel.org>
 <ceb0f48f-8db9-40ae-769a-08e36373b922@quicinc.com>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <ceb0f48f-8db9-40ae-769a-08e36373b922@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 27/10/2023 03:07, Elson Serrao wrote:
> 
> 
> 
>>>>>>
>>>>>> While this takes care of runtime suspend case, what about system_suspend?
>>>>>> Should this check be moved to dwc3_suspend_common() instead?
>>>>>>
>>>>>
>>>>> Sure I can move these checks to dwc3_suspend_common to make it generic.
>>>>
>>>> Before you do that let's first decide how we want the gadget driver to behave
>>>> in system_suspend case.
>>>>
>>>> Current behavior is to Disconnect from the Host.
>>>>
>>>> Earlier I was thinking on the lines that we prevent system suspend if
>>>> we are not already in USB suspend. But I'm not sure if that is the right
>>>> thing to do anymore. Mainly because, system suspend is a result of user
>>>> request and it may not be nice to not to meet his/her request.
>>>
>>> Agree. Irrespective of whether USB is suspended or not it is better to honor the system suspend request from user.
>>>
>>>> Maybe best to leave this policy handling to user space?
>>>> i.e. if user wants USB gadget operation to be alive, he will not issue
>>>> system suspend?
>>>>
>>>
>>> Sure. So below two cases
>>>
>>> Case1: User doesn't care if gadget operation is alive and triggers system suspend irrespective of USB suspend. Like you mentioned, current behavior already takes care of this and initiates a DISCONNECT
>>>
>>> Case2:  User wants gadget to stay alive and hence can trigger system suspend only when USB is suspended (there are already user space hooks that read cdev->suspended bit to tell whether USB is suspended or not for user to decide). Attempts to request system suspend when USB is not suspended, would result in a DISCONNECT.
>>>
>>> For supporting Case2 from gadget driver point of view, we need to extend this series by having relevant checks in suspend_common()
>>>
>>> Also, is it better to provide separate flags to control the gadget driver behavior for runtime suspend Vs system suspend when USB is suspended ? For example, what if we want to enable bus suspend handling for runtime suspend only and not for system suspend (Case1).
>>
>> But you mentioned that for Case1, USB gadget would disconnect from Host. So USB will be in disconnected state and USB controller can be fully de-activated? Except maybe wakeup handling to bring system out of suspend on a USB plug/unplug event?
>> Why do we need separate flags for?
>>
> 
> Sorry let me clarify. This is in reference to deciding how we want the dwc3 driver to behave in system_suspend case.
> 
> One option is to continue with the existing behavior where USB gadget would disconnect from Host irrespective of bus suspend state. We dont need any modification in this case and we can leave this series limited to runtime suspend only.
> 
> Second option is to stay connected IF we are in bus suspend state (U3/L2) otherwise DISCONNECT IF we are not in bus suspend state. The main motivation is to preserve the ongoing usb session
> without going through a re-enumeration (ofcourse true only if we are in bus suspend state). This would need relevant checks in suspend_common().

The catch here is, what to do if the USB device is not in bus suspend state but user wants to put the system in suspend state? Do we still disconnect?

You might also want to refer to the discussion in [1]

[1] - https://lore.kernel.org/all/Y+z9NK6AyhvTQMir@rowland.harvard.edu/

> 
> Which option do you think is more suitable? IMO option2 is better. For example if we are in a scenario where there is a network session (over USB) open between Host and the device and usb bus is suspended due to data inactivity. Option2 would preserve the session whereas Option1 we would terminate this session when a system_suspend happens.
> 
> Thanks
> Elson

-- 
cheers,
-roger

