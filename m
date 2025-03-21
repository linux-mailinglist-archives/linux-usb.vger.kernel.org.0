Return-Path: <linux-usb+bounces-21991-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8890EA6B583
	for <lists+linux-usb@lfdr.de>; Fri, 21 Mar 2025 08:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15C233AC24E
	for <lists+linux-usb@lfdr.de>; Fri, 21 Mar 2025 07:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0FC1EEA47;
	Fri, 21 Mar 2025 07:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSM7m5X/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882A326ACB;
	Fri, 21 Mar 2025 07:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742543512; cv=none; b=gjgwO469xH6+tci8kWg5oxCY3BF8AC+qJhJC0zGFf1bip2YyA4wem8weuUDDkAxjNIx16uexgk1rwqwMIoLKRn0PHLa57hpPTZouVw7utmsYrvEmkxhjRhDWICqMBodIBLQBwZg1uHOhCmj8/GS8rMTzjRqIZ0KHI5SaIfzOPZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742543512; c=relaxed/simple;
	bh=eUqWIJcB3nSd/mXSYygUn6M3e1U2VTzoZUejWvBj2HU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBnCbKFt502vSvC3f28yVpj2vrYmYCYhlq5RUYPQ0KDB4g1mR+GeHOWanKcVlyWX7OpB5Py5hBtyJxqe6NogiGe3iYq14TEqRwZ6WfrDlpTZ8pww7uC4N8Fwohv1EfKX+hq1LDbQyohpj33nbdG3pdHR3PMYWjtEYa3+bg3h5gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSM7m5X/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB1CC4CEE3;
	Fri, 21 Mar 2025 07:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742543512;
	bh=eUqWIJcB3nSd/mXSYygUn6M3e1U2VTzoZUejWvBj2HU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tSM7m5X/sYFP6LXrJRSTdDwt2LcAuSi/NbowmE7HCqzddAOieWE5YS0TfNr9wIg0I
	 AGVEZRJrt+VbwkTIh90aVx86Rr2oN0yoR2uUY9wrwk/pZj174J35fL0seVaqCf3Rvv
	 cSBqhCbyLj31KkLqd6j9BeBAPbhBSxK+1XClerEIAjXns3hVmnsqnPBwaC8GO9qEpz
	 TzXd8DGFQV+7Jj2QTv7jruYJqRvjylgLH33whHVEgavMziPOqsYS2/kJnSai9fX+fn
	 z/xfUz30MG8rKxg0LRzYWYVkAY8/q3a4MsdkWbAvaVOwiktgYDMOXWcBFq6r1np2Yf
	 5ccvARZiKZqrw==
Message-ID: <442bebf4-4de1-42d1-a14b-2bb509fea12f@kernel.org>
Date: Fri, 21 Mar 2025 08:51:43 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add support for Battery Status & Battery Caps AMS in
 TCPM
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Sebastian Reichel <sre@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-pm@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20250312-batt_ops-v1-0-88e0bb3129fd@google.com>
 <20250313-determined-wild-seahorse-f7871a@krzk-bin>
 <914a0df4-96d0-4cd4-ac87-3826fa9c1440@google.com>
 <3f65fe16-56f8-4887-bb91-994b181ce5a9@kernel.org>
 <9852e5a8-843d-48ae-90d0-7991628e93b3@google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <9852e5a8-843d-48ae-90d0-7991628e93b3@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/03/2025 22:11, Amit Sunil Dhamne wrote:
> On 3/16/25 9:52 AM, Krzysztof Kozlowski wrote:
>> On 15/03/2025 01:49, Amit Sunil Dhamne wrote:
>>> Hi Krzysztof,
>>>
>>> Thanks for the review!
>>>
>>> On 3/13/25 1:50 AM, Krzysztof Kozlowski wrote:
>>>> On Wed, Mar 12, 2025 at 04:42:00PM -0700, Amit Sunil Dhamne wrote:
>>>>> Support for Battery Status & Battery Caps messages in response to
>>>>> Get_Battery_Status & Get_Battery_Cap request is required by USB PD devices
>>>>> powered by battery, as per "USB PD R3.1 V1.8 Spec", "6.13 Message
>>>>> Applicability" section. This patchset adds support for these AMSes
>>>>> to achieve greater compliance with the spec.
>>>> Which board uses it? I would be happy to see that connection between
>>>> batteries and USB connector on the schematics of some real device. How
>>>> does it look like?
>>> Any board that uses a USB Type-C connector that supplies power into or
>> If you keep responding like this, you will got nowhere, so let me
>> re-iterate:
>>
>> Which upstream DTS (or upstream supported hardware) is going to use this
>> binding, so I can see how you are going to implement it there in the
>> entire system?
> 
> This is for maxim,max33359 Type-C controller.

Stop deflecting the questions. max33359 is not a board. I already asked
two times.

Apparently admitting "no upstream users" is impossible, so let's state
the obvious:

There are no upstream users of this.

> 
> This would property would have been present for the connector present in 
> the typec device for gs101-oriole board (that uses the max33359 
> controller).


But it is not.


> 
> However, I will be exploring existing bindings to describe the 
> relationship for now.
> 
>>> out of a battery while operating in sink or source mode respectively.
>>> The VBUS is connected to the (battery + buck boost IC's CHGin/Vin) or a
>>> companion IFPMIC connected to a battery.  In our board we have USB
>>> Connector <-> IFPMIC <-> Battery.
>> Which board is that?
> 
> gs101-oriole board.


Then why this is not used? The board was released some years ago, so I
do not see a problem in using it.

Best regards,
Krzysztof

