Return-Path: <linux-usb+bounces-10858-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF6F8FC3E3
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 08:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 185BD281FED
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 06:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72806190488;
	Wed,  5 Jun 2024 06:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1IuMKzr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE570190463;
	Wed,  5 Jun 2024 06:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717569874; cv=none; b=tpjNn/CsTe+w78f5T2/TO/Oh7evjrMBqSwwtgelyGaLPR5e3BYhQJPRd+OxKPTJFDD2E8l5ksZzZHmG7EbKpMZcH8uZyYdLQTQBDunYp2Jx76kQFwkC/1Guyfy0SL+t2034gJDo/OrvdThUDsG15Yk/QQ9XFfeD40vKNwOhlWBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717569874; c=relaxed/simple;
	bh=kGUDdiwRoLoCtyL4LfTDDluxG1q19eXwwT44ZFoS1eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=svV6VxPodJeiePf5uYNTjFNiFD9ej7VeZuGruH4foYh0k7NLa+YyoROSgJ+6zgjU7BRO0pmsaBrCa4TYUNLHImna+PbvC8ex+BJ3FRrq+zLqq9HTeodHefnnHI8sAwx1VpbpoH4bEYy4S3SvU9OU6SlYpCh65xJEKJM88H/MqNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1IuMKzr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3420C3277B;
	Wed,  5 Jun 2024 06:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717569873;
	bh=kGUDdiwRoLoCtyL4LfTDDluxG1q19eXwwT44ZFoS1eo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s1IuMKzrs1F40UhhMviFakWhNU8CVbx5m01xwUTzsTDJrmbZ/x9IFmnmfr2C6ff0w
	 ++DPWQr8PTRWziAfZR4MuU1d4EULKO4gcR9DbEuzA+3XkGq9/UONn1U8+lMgZSNDaJ
	 6IHWdYZLhHePiZQVUq/7Wworl9xYZ1p9E1BaosCKnFNrSeWdkhA0FBDSsECpdjYHTn
	 cAlgqpVujgyw1VCn2VM4Qa1isX6dATxYj0icT+e1EKWL03C9h/KmwldteV3rxjfSuW
	 SBBN1JRt3Llh6Ahc8qauO5zSduNZRholJYo4A/5+NUU7ojXe03Hif/4IhUgJXU4f6s
	 ma4izDAtuYXxg==
Message-ID: <d458eb4e-e038-4f38-95e7-04b3ebbf5752@kernel.org>
Date: Wed, 5 Jun 2024 08:44:29 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] usb: host: xhci-plat: Add support for
 XHCI_WRITE_64_HI_LO_QUIRK
To: Jung Daehwan <dh10.jung@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Felipe Balbi <balbi@kernel.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <1717135657-120818-1-git-send-email-dh10.jung@samsung.com>
 <CGME20240531060731epcas2p4f14afae9f00a7e71e6bd3863f0a51441@epcas2p4.samsung.com>
 <1717135657-120818-6-git-send-email-dh10.jung@samsung.com>
 <9c9d74c0-72a2-418a-b3c6-a0f9716c943d@kernel.org>
 <20240603034435.GC23593@ubuntu>
 <eb1d9734-fa19-4051-9e78-a6e72ac12662@kernel.org>
 <20240603085111.GF23593@ubuntu>
 <1935a30f-b4fd-4240-93f0-e2baf218223d@kernel.org>
 <20240605015010.GA57120@ubuntu>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240605015010.GA57120@ubuntu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/06/2024 03:50, Jung Daehwan wrote:
> On Tue, Jun 04, 2024 at 08:20:44AM +0200, Krzysztof Kozlowski wrote:
>> On 03/06/2024 10:51, Jung Daehwan wrote:
>>>>>>>  
>>>>>>> +		if (device_property_read_bool(tmpdev, "write-64-hi-lo-quirk"))
>>>>>>> +			xhci->quirks |= XHCI_WRITE_64_HI_LO;
>>>>>>
>>>>>> Where is any user of this property (DTS)? Just to clarify: your
>>>>>> downstream does not matter really.
>>>>>>
>>>>>
>>>>> This is set by dwc3 parent node by software node.
>>>>>
>>>>> [PATCH v2 1/5] dt-bindings: usb: snps,dwc3: Add 'snps,xhci-write-64-hi-lo-quirk' quirk
>>>>> https://lore.kernel.org/r/1717135657-120818-2-git-send-email-dh10.jung@samsung.com/
>>>>
>>>> This is not a patch to DTS.
>>>>
>>>>
>>>
>>> This is set by software node from dwc3. That's why I think this patch doesn't
>>> need DTS patch. I would add DTS patch in dwc3 not xhci if it's needed.
>>>
>>
>> What?
>>
>> I asked you question which upstream SoC (link to DTS) uses it, and you
>> say that "no need for DTS patch"? That's not an answer.
>>
>> Best regards,
>> Krzysztof
>>
>>
> 
> I'm sorry I didn't get your point. I've been working on Exynos SoC.
> But there's no upstream user of this property yet in this patchset.

That's the point... it makes quite tricky to evaluate whether the
binding is reasonable or not. Upstream your DTS. Otherwise I say this
can be deduced from existing compatible and property is not needed.

Sorry, that's a no.

Best regards,
Krzysztof


