Return-Path: <linux-usb+bounces-20950-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2FCA40C92
	for <lists+linux-usb@lfdr.de>; Sun, 23 Feb 2025 03:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAC4117DDBE
	for <lists+linux-usb@lfdr.de>; Sun, 23 Feb 2025 02:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9024117555;
	Sun, 23 Feb 2025 02:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzS+fp5L"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1BF53BE
	for <linux-usb@vger.kernel.org>; Sun, 23 Feb 2025 02:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740278491; cv=none; b=r+Kc+JfnGRgJ3RzQHncR4taEo0vcYhS93NutnBW48zvQX3F5o5HX9Itzw6tJ63zN67hbZdlc+gMZprnwfJ/mRDn2keh8B3Bg4Yb8QHkzYE2wwtmPm4v/ICb2X/RUAdcEPfy2o+D4zTCVYaJBRIXquRZSxH0iNFZh0zLF5/yg7Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740278491; c=relaxed/simple;
	bh=0PALxiIJAWm1U70TjEprp3o050bnr4fBZzfl+iZehJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cwmOSeDp3LRziVOXMIDJgyd1XP+ZYWgh8BM8XZf5TameU6P93Avi6VZLhOE+bAfjJsRZYhk2sJWS43wZfe2eVbyn+zwvhXHd6sR7c/S+hwHFFYWpI1m7kI93fwAgGg9JUqU9tYpJDXkIt5mijmKj+2bwdxEIM4RrXOsAClJsrgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzS+fp5L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382E3C4CED1;
	Sun, 23 Feb 2025 02:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740278490;
	bh=0PALxiIJAWm1U70TjEprp3o050bnr4fBZzfl+iZehJI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RzS+fp5LK4fDXekRgkMNddJjLBIWtTBCyXb04burVL8zA/r7w6sxw2B780XKkWAnQ
	 7L2uE3O2ee/mfWu1kpobP5g9MKX5DqAxxGmW9XjddRpOI1itYRiPyHdWAHytD47RGT
	 XloKB+HvlZ3hi4d6FZE/yp4xlDowJIRihtlc3IJLYxVSdCCN21TmvWkeDMSX3Krrsi
	 ovU7MCJeo13TeMxKwvKnos5P8tH0KsIQExJrpUSsvuu4iryOdnH+ydxT5Jc1hFjToE
	 OLe4NAL3cw4kaFukrB+Hb7rxsO/hbXEJtnGKATwrzXcOsb8X+qy+iZOISM9nsBp7ml
	 DRc1lESRrN6pQ==
Message-ID: <4626f7e6-77b9-48d6-9e01-847bafc6545a@kernel.org>
Date: Sat, 22 Feb 2025 20:41:25 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ucsi_ccg: Don't show failed to get FW build
 information error
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mario.limonciello@amd.com, heikki.krogerus@linux.intel.com,
 ajayg@nvidia.com, linux-usb@vger.kernel.org
References: <20250221054137.1631765-1-superm1@kernel.org>
 <20250221054137.1631765-2-superm1@kernel.org>
 <2025022157-result-cranial-7c83@gregkh>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <2025022157-result-cranial-7c83@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/21/25 00:45, Greg KH wrote:
> On Thu, Feb 20, 2025 at 11:40:03PM -0600, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> The error `failed to get FW build information` is added for what looks
>> to be for misdetection of the device property firmware-name.
>>
>> If the property is missing (such as on non-nvidia HW) this error shows up.
>> Move the error into the scope of the property parser for "firmware-name"
>> to avoid showing errors on systems without the firmware-name property.
>>
>> Fixes: 5c9ae5a87573d ("usb: typec: ucsi: ccg: add firmware flashing support")
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/usb/typec/ucsi/ucsi_ccg.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
>> index 740171f24ef9f..663aca9421410 100644
>> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
>> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
>> @@ -1432,11 +1432,10 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>>   			uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
>>   		else if (!strcmp(fw_name, "nvidia,gpu"))
>>   			uc->fw_build = CCG_FW_BUILD_NVIDIA;
>> +		if (!uc->fw_build)
>> +			dev_err(uc->dev, "failed to get FW build information\n");
>>   	}
>>   
>> -	if (!uc->fw_build)
>> -		dev_err(uc->dev, "failed to get FW build information\n");
>> -
>>   	/* reset ccg device and initialize ucsi */
>>   	status = ucsi_ccg_init(uc);
>>   	if (status < 0) {
>> -- 
>> 2.43.0
>>
>>
> 
> Hi,
> 
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
> 
> You are receiving this message because of the following common error(s)
> as indicated below:
> 
> - You have marked a patch with a "Fixes:" tag for a commit that is in an
>    older released kernel, yet you do not have a cc: stable line in the
>    signed-off-by area at all, which means that the patch will not be
>    applied to any older kernel releases.  To properly fix this, please
>    follow the documented rules in the
>    Documentation/process/stable-kernel-rules.rst file for how to resolve
>    this.
> 
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
> 
> thanks,
> 
> greg k-h's patch email bot

I do think that adding stable will make sense.  If there is no other 
changes requested, b4 can pick it up from the email thread without 
re-sending:

Cc: stable@vger.kernel.org


