Return-Path: <linux-usb+bounces-22811-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D5EA82D22
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 19:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5223887EC7
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 17:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E111DFFC;
	Wed,  9 Apr 2025 17:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEsMInW2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E02C26FA6E
	for <linux-usb@vger.kernel.org>; Wed,  9 Apr 2025 17:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218235; cv=none; b=HX6bvcaQmwGQrlhy+ktAxKcXa6NLn5L7WtP4rqphqrDI8/SMFyRIrOluu1cZalccgIoteQvEqBPtT3KZ9yS7K/HsQKhn4MXOewHb5K49u4v3w8eOOfIfw1k4Y/gEmJhw2TOhqXs2hpD6bCiz7/dugzW4J+WA89VxGO7Pe4dGffg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218235; c=relaxed/simple;
	bh=3KNcqHe1Tc/qPfVMAMFPp8hDV9BkYe0QuJqfRebq5KE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2pAOlMiKjAgcEPECIeBZUjQfxtuN3QWn6nHvnr7tb3xpRPOTvLPSqz3kySKBIuSRa6HG2e1bRkkLZmSsY3vJ5Xr73ENu5aaTlb0/h69W30ruQatPiRKwPEx55ZCpR8RVxI3pW2v7JVvZciYGwBmrV39cGHhA+wnV6PFQic9IhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEsMInW2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E2BC4CEE2;
	Wed,  9 Apr 2025 17:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744218234;
	bh=3KNcqHe1Tc/qPfVMAMFPp8hDV9BkYe0QuJqfRebq5KE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oEsMInW2H8tfxU11L9igpZd+8mbhMG6FfT8XZkiWQJWVUkiljvgGExH43bd+ILi3p
	 SqGEalcWUZH0ACEgbb2mm3m/7x8feijIcc9Mm5c6/pHNGBotwwQgbrO5LaWisfSqtV
	 T6PlMK/uET7EZf75u+/ndTPfmAclNsDgSKXdgqc6+9eFnjMD1Xoqarawrluv8GW57C
	 DLnjcKJPIw/fgoabNggLBMJdZYgveSGof78MrqmeFGsMDa/Cq9tKqN7C4mi/9T2g+3
	 sHizH/gSYY0MpgtuojZQerFoz4ZSJ8b3xBHNMXTRQYeq1Ar8dL6KRPUcRXbYqwyDjx
	 7KWbF2zNauSyA==
Message-ID: <dcf41124-d693-4b0f-a1d1-7ad7cd914449@kernel.org>
Date: Wed, 9 Apr 2025 12:03:52 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Wake on connect / wake on disconnect
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Raul Rangel <rrangel@chromium.org>
Cc: Opal Voravootivat <puthik@google.com>,
 "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
 "Gong, Richard" <Richard.Gong@amd.com>,
 Utkarsh Patel <utkarsh.h.patel@intel.com>
References: <ce2048af-1044-4424-bca2-3799baefb9c2@amd.com>
 <20250404060203.GM3152277@black.fi.intel.com>
 <3b283147-cd32-410e-a163-9e603fd40bc1@gmail.com>
 <20250404115346.GN3152277@black.fi.intel.com>
 <98539971-3b43-4d64-a105-6790198c46d1@amd.com>
 <20250404161008.GO3152277@black.fi.intel.com>
 <f9806a24-875f-4c44-9694-96b62a6aefd9@gmail.com>
 <5f9004aa-9b51-474d-9cb0-c8c4e23b19f4@kernel.org>
 <CAHQZ30C=7d1DkHYTixrgmArCwKHzhxBn602P=YY5rP6OcAXuVw@mail.gmail.com>
 <20250407055520.GP3152277@black.fi.intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250407055520.GP3152277@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/7/2025 12:55 AM, Mika Westerberg wrote:
> On Fri, Apr 04, 2025 at 10:55:35AM -0600, Raul Rangel wrote:
>> On Fri, Apr 4, 2025 at 10:20 AM Mario Limonciello <superm1@kernel.org> wrote:
>>>
>>>
>>>
>>> On 4/4/25 11:16, Mario Limonciello wrote:
>>>>
>>>>
>>>> On 4/4/25 11:10, Mika Westerberg wrote:
>>>>> On Fri, Apr 04, 2025 at 10:03:18AM -0500, Mario Limonciello wrote:
>>>>>> On 4/4/2025 6:53 AM, Mika Westerberg wrote:
>>>>>>> On Fri, Apr 04, 2025 at 06:47:31AM -0500, Mario Limonciello wrote:
>>>>>>>> On 4/4/25 01:02, Mika Westerberg wrote:
>>>>>>>>> Hi Mario,
>>>>>>>>>
>>>>>>>>> On Thu, Apr 03, 2025 at 01:12:07PM -0500, Mario Limonciello wrote:
>>>>>>>>>> Mika,
>>>>>>>>>>
>>>>>>>>>> Recently there are some conversations about wake-up from connect/
>>>>>>>>>> disconnect
>>>>>>>>>> happening and I wanted to get some background from you about the
>>>>>>>>>> current
>>>>>>>>>> policy set in tb_switch_suspend().
>>>>>>>>>>
>>>>>>>>>> Wake on connect and disconnect are only used for runtime, not for
>>>>>>>>>> system
>>>>>>>>>> suspend.  Would you be open to adding wake on connect as well for
>>>>>>>>>> system
>>>>>>>>>> suspend?  This should help enable use cases like plugging in a
>>>>>>>>>> closed laptop
>>>>>>>>>> to a dock (which works on Windows).
>>>>>>>>>
>>>>>>>>> Don't we already have a similar for all usb4_portX devices? That
>>>>>>>>> does not
>>>>>>>>> work for you?
>>>>>>>>>
>>>>>>>>
>>>>>>>> I think that will functionally work - but I'll double check.
>>>>>>>>
>>>>>>>> However usb_portX power/wakeup defaults are 'disabled' so this
>>>>>>>> would need a
>>>>>>>> udev rule.  Could we set the kernel default for those to 'enabled'
>>>>>>>> instead?
>>>>>>>
>>>>>>> No because that would trigger wakeup each time you unplug/plug and
>>>>>>> this is
>>>>>>> certainly not good if you close the lid, unplug from dock and throw the
>>>>>>> laptop to your backpack. Chrome uses this with "dark resume" so if
>>>>>>> this is
>>>>>>> supported by the userspace then it can also enable these.
>>>>>>
>>>>>> Ahhh.  I was thinking specifically with wake on connect that's not a
>>>>>> problem, but the sysfs knob for the port changes both wake on connect
>>>>>> and
>>>>>> wake on disconnect.
>>>>>>
>>>>>> Is there actually a use case for chrome with wake on disconnect?  IE
>>>>>> if we
>>>>>> didn't turn on wake on disconnect but defaulted to wake on connect would
>>>>>> things be OK?  Or made the sysfs knob control only wake on disconnect?
>>>>>
>>>>> Good guestion - I don't know ;-) The Chrome folks wanted this so I
>>>>> suppose
>>>>> their usecase is specifically that dark resume and I think that's when
>>>>> you
>>>>> unplug a device so disconnect. Not so sure about wake on connect.
>>>>
>>>> I found the original patch from Rajat [1].
>>>>
>>>> Rajat, any comments?  Could you loop in the right people from the Chrome
>>>> side to ask?    I think my "preference" would be that we make "wake on
>>>> connect" always enabled and then let the sysfs knob control "wake on
>>>> disconnect".
>>>>
>>>> [1] https://lore.kernel.org/linux-usb/20221101115042.248187-1-
>>>> rajat.khandelwal@intel.com/
>>>
>>> Oh Rajat's email bounced.  The only person I know that I've worked on
>>> wakeup related stuff is Raul.  I'll add him.
>>>
>>> Mika, Raul,
>>>
>>> Could you pull in current Chrome people from Intel and Google that could
>>> comment here?
>>
>> + Opal who should be able to answer the question regarding wake on
>> connect/disconnect.
> 
> Added Utkarsh from Intel side.

I had another look at usb4_port.c the flows used.  This is the call path:

tb_switch_suspend()
->tb_switch_set_wake()
->->usb4_switch_set_wake()

The flags for wakeup policy are set in tb_switch_suspend() and then 
passed as arguments down to usb4_switch_set_wake().  This enumerates 
whether wake is set for any usb4_port device and applies the flags to 
that device.

So AFAICT that means that even on ChromeOS there won't be a wake on 
connect or wake on disconnect event for suspend/resume no matter what 
the sysfs files for each port are set to.

In summary; my ask is whether we can do this:

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 6a2116cbb06f9..f2f6a085a742b 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3599,6 +3599,7 @@ void tb_switch_suspend(struct tb_switch *sw, bool 
runtime)
                 flags |= TB_WAKE_ON_USB4;
                 flags |= TB_WAKE_ON_USB3 | TB_WAKE_ON_PCIE | TB_WAKE_ON_DP;
         } else if (device_may_wakeup(&sw->dev)) {
+               flags |= TB_WAKE_ON_CONNECT;
                 flags |= TB_WAKE_ON_USB4 | TB_WAKE_ON_USB3 | 
TB_WAKE_ON_PCIE;
         }

That would allow the use case of "plug in a closed laptop to a dock" and 
it wakes up.

