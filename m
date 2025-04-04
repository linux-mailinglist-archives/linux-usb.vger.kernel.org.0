Return-Path: <linux-usb+bounces-22593-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A62A7C16C
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 18:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88028178F18
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 16:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F11620ADD6;
	Fri,  4 Apr 2025 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QP3b9/TS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FED3C38
	for <linux-usb@vger.kernel.org>; Fri,  4 Apr 2025 16:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743783614; cv=none; b=WNuxi/4/pgaexnU/4XAgzgKJnmGSH3mtXaw/TtsFXmNrzdpB3QDXVMJxoaJw+MgdrBvaCRItspl6wojd8OU02X/zXJqyMRmYIqZoctudwMarOc5m2SWOoNCwtwo93MT3oYx1RzFELt94UaW18gj3x04IjPWYlsmp/McsnumSH7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743783614; c=relaxed/simple;
	bh=4iCgj4xUCJpdwHsLwloWTpWtyH3hWXZafIn5eEtLpdE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lpLVJfL9gKNmeDeKhlkk0og7PItrRNlrf8F+FykKmyK1cwiURfPyt7+jOdp2wDzdo9lEL96aALe/VHr+J/8bL0eqgJ0gmRw9quvitwQsRdeaorfYvCUr8UsbBC9lqizpGau9l9MOucZpers4NRwFpcuTP73J2u85ZHETvr/OUzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QP3b9/TS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FDEC4CEDD;
	Fri,  4 Apr 2025 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743783613;
	bh=4iCgj4xUCJpdwHsLwloWTpWtyH3hWXZafIn5eEtLpdE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=QP3b9/TSYFyMkwuuo3ejrgFTnvasxZJrgBkQ1ybpIXDno3Obx63nzisGhaaSU3rVT
	 eUuT4nMGzJnmtIwkJ7HuHtSoQ8t1mB5bqgZIZUkZF5fVA27nEa4GzvdMLHCllKeP6A
	 KyUkqbuCn730+rP40UqX8AEFNo+R3Nyj6UiyTyA/HA8R9Rlmjlfa7Scv00Yprfw7zP
	 gBkRY37zhPDkTlUCxGywkScEHh35eJYJb+tjhLoQmNFO3ov0lpIQIYZ2hWjTruUXPz
	 nuK8wb/sYpP065iEUmIRB1ShUva3MRbcKIGYyr5hYg3ycEtUpQfmHL4lMdVuvNOB/w
	 1g2ZeIcSPmQgQ==
Message-ID: <5f9004aa-9b51-474d-9cb0-c8c4e23b19f4@kernel.org>
Date: Fri, 4 Apr 2025 11:20:11 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Wake on connect / wake on disconnect
From: Mario Limonciello <superm1@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, rrangel@chromium.org
Cc: "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
 "Gong, Richard" <Richard.Gong@amd.com>
References: <ce2048af-1044-4424-bca2-3799baefb9c2@amd.com>
 <20250404060203.GM3152277@black.fi.intel.com>
 <3b283147-cd32-410e-a163-9e603fd40bc1@gmail.com>
 <20250404115346.GN3152277@black.fi.intel.com>
 <98539971-3b43-4d64-a105-6790198c46d1@amd.com>
 <20250404161008.GO3152277@black.fi.intel.com>
 <f9806a24-875f-4c44-9694-96b62a6aefd9@gmail.com>
Content-Language: en-US
In-Reply-To: <f9806a24-875f-4c44-9694-96b62a6aefd9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/4/25 11:16, Mario Limonciello wrote:
> 
> 
> On 4/4/25 11:10, Mika Westerberg wrote:
>> On Fri, Apr 04, 2025 at 10:03:18AM -0500, Mario Limonciello wrote:
>>> On 4/4/2025 6:53 AM, Mika Westerberg wrote:
>>>> On Fri, Apr 04, 2025 at 06:47:31AM -0500, Mario Limonciello wrote:
>>>>> On 4/4/25 01:02, Mika Westerberg wrote:
>>>>>> Hi Mario,
>>>>>>
>>>>>> On Thu, Apr 03, 2025 at 01:12:07PM -0500, Mario Limonciello wrote:
>>>>>>> Mika,
>>>>>>>
>>>>>>> Recently there are some conversations about wake-up from connect/ 
>>>>>>> disconnect
>>>>>>> happening and I wanted to get some background from you about the 
>>>>>>> current
>>>>>>> policy set in tb_switch_suspend().
>>>>>>>
>>>>>>> Wake on connect and disconnect are only used for runtime, not for 
>>>>>>> system
>>>>>>> suspend.  Would you be open to adding wake on connect as well for 
>>>>>>> system
>>>>>>> suspend?  This should help enable use cases like plugging in a 
>>>>>>> closed laptop
>>>>>>> to a dock (which works on Windows).
>>>>>>
>>>>>> Don't we already have a similar for all usb4_portX devices? That 
>>>>>> does not
>>>>>> work for you?
>>>>>>
>>>>>
>>>>> I think that will functionally work - but I'll double check.
>>>>>
>>>>> However usb_portX power/wakeup defaults are 'disabled' so this 
>>>>> would need a
>>>>> udev rule.  Could we set the kernel default for those to 'enabled' 
>>>>> instead?
>>>>
>>>> No because that would trigger wakeup each time you unplug/plug and 
>>>> this is
>>>> certainly not good if you close the lid, unplug from dock and throw the
>>>> laptop to your backpack. Chrome uses this with "dark resume" so if 
>>>> this is
>>>> supported by the userspace then it can also enable these.
>>>
>>> Ahhh.  I was thinking specifically with wake on connect that's not a
>>> problem, but the sysfs knob for the port changes both wake on connect 
>>> and
>>> wake on disconnect.
>>>
>>> Is there actually a use case for chrome with wake on disconnect?  IE 
>>> if we
>>> didn't turn on wake on disconnect but defaulted to wake on connect would
>>> things be OK?  Or made the sysfs knob control only wake on disconnect?
>>
>> Good guestion - I don't know ;-) The Chrome folks wanted this so I 
>> suppose
>> their usecase is specifically that dark resume and I think that's when 
>> you
>> unplug a device so disconnect. Not so sure about wake on connect.
> 
> I found the original patch from Rajat [1].
> 
> Rajat, any comments?  Could you loop in the right people from the Chrome 
> side to ask?    I think my "preference" would be that we make "wake on 
> connect" always enabled and then let the sysfs knob control "wake on 
> disconnect".
> 
> [1] https://lore.kernel.org/linux-usb/20221101115042.248187-1- 
> rajat.khandelwal@intel.com/

Oh Rajat's email bounced.  The only person I know that I've worked on 
wakeup related stuff is Raul.  I'll add him.

Mika, Raul,

Could you pull in current Chrome people from Intel and Google that could 
comment here?

