Return-Path: <linux-usb+bounces-31007-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BD1C8E584
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 13:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA7B83B0E1F
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 12:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53CA32E723;
	Thu, 27 Nov 2025 12:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b="P6a7o9Bj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.kernel-space.org (v2202511311555398556.powersrv.de [46.38.245.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F8A21A425
	for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 12:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.245.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764248003; cv=none; b=T0vUesbWAPPwoIFlBOmNXeOaW09ud9yizmsZ8CNvo/zmLyOUpnoHTZp0eSvj6GJdEDzwj9gOhUBNNS/i9o7j5+zxGU1IiWYEP4DjyX0lflti+fBVkuyzlPz3F154p/OVSnih3zxKsxoLpEfW6wudKfzTp3vUv4lwopqCKy6JVl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764248003; c=relaxed/simple;
	bh=D0y9JWe347eb9IM7Gs2tsCJmCtefTXnuYyX20s+IRDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RpSiX2XJoGzy01d4qHuuEXM2PZoEIWMjioQaoLrk5HReR3Y7ciPjxzpF4cd1zXhuYuFTc8m9Fx67g2DOmi7h0xrjtaMnmbgCM2SJeBVO4yfMXG9sXVJVcZE5nAiEV3CyUziwUQa1w0arkfrahMKf64VZ9Oq9OpwbgIvyi2YZNgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel-space.org; spf=pass smtp.mailfrom=kernel-space.org; dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b=P6a7o9Bj; arc=none smtp.client-ip=46.38.245.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel-space.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel-space.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
	s=s1; t=1764247998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FvZbWXZf52KUvCpkVglNlZhtyUFYtRBtu69pT9B5WiQ=;
	b=P6a7o9Bj7djuiXMNt8Cq7Nmgat3z8XzVKsR7xFO3l0Er1R1ve1K2uUyKT8fvJaqm4gnuaa
	J8nDsNmymQkppFX7W1G1gYsTIYIFviC91RTsLU17nu+oPSsLIuqyDiv5m9T0Wwlv8T0q2r
	sfEZJtABurN7rK9WpnAhUp1ODL2zM10=
Received: from [IPV6:2a07:7e81:7daa:0:62cf:84ff:feee:627] (<unknown> [2a07:7e81:7daa:0:62cf:84ff:feee:627])
	by oreshnik (OpenSMTPD) with ESMTPSA id 3cc9cbae (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 27 Nov 2025 12:53:17 +0000 (UTC)
Message-ID: <33c96409-b376-4e17-a2fb-a7e3bf1c3e85@kernel-space.org>
Date: Thu, 27 Nov 2025 13:53:32 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: testusb: epipe errors on test 9 and 10
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
References: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>
 <2025112737-frisk-prototype-f011@gregkh>
Content-Language: en-US, it
From: Angelo Dureghello <angelo@kernel-space.org>
In-Reply-To: <2025112737-frisk-prototype-f011@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Greg,

thanks a lot,

On 11/27/25 09:22, Greg KH wrote:
> On Thu, Nov 27, 2025 at 09:06:24AM +0100, Angelo Dureghello wrote:
>> Hi all,
>>
>> looking for some help on testusb tool tests 9,10 always failing with
>> -EPIPE, kind of ep stall. Peripheral side has g_zero loaded.
>>
>> Devices under test are custom boards, have same qualcomm 8 cores cpu, and
>> kernel is android 5.4. Involved drivers in both devices are xhci and dwc3.
>> Anyway, connection under tests is 2.0 microusb connector on both side.
> 5.4 is _very_ old and obsolete and odds are you are paying for support
> for that kernel from a company if you are stuck with it (hint, it is
> going to go end-of-life in 3 days).  Please contact them as you are
> paying for this kind of thing from your vendor.
>
> If you can reproduce this with the latest release (6.17), please let us
> know.
it's an android kernel msm-5.4, actually updated from google with critical
fixes, at least i can see some xhci endpoint stall issues applied to it, 
even
if of course all the usb core stuff is that old (5.4).

>> /dev/bus/usb/001/007 test 9 --> 5 (I/O error)
>> /dev/bus/usb/001/007 test 10 --> 32 (Broken pipe)
>>
>> usbmon shows for both cases some EPIPE:
>>
>> ffffff85bf04b100 1951528285 S Ci:1:007:0 s 80 00 0000 0000 0002 2 <
>> ffffff85bf04b100 1951528785 C Ci:1:007:0 0 2 = 0100
>> ffffff85bf04b100 1951529102 S Ci:1:007:0 s 81 00 0000 0000 0002 2 <
>> ffffff85bf04b100 1951529554 C Ci:1:007:0 -32 0   <== EPIPE
>> /dev/bus/usb/001/007 test 9 --> 5 (I/O error)
>>
>> ffffff85bb5b2100 3778244155 C Ci:1:007:0 0 18 = 12010002 ff000040 2505a0a4
>> 04050102 0302
>> ffffff85bb5b2100 3778244178 S Ci:1:007:0 s 80 06 0100 0000 0012 18 <
>> ffffff85bb5b0100 3778245631 C Ci:1:007:0 0 9 = 09024500 010304c0 00
>> ffffff85bb5b0100 3778245693 S Ci:1:007:0 s 80 06 0200 0000 0009 9 <
>> ffffff85bb5b1500 3778247900 C Ci:1:007:0 0 1 = 00
>> ffffff85bb5b1500 3778247964 S Ci:1:007:0 s 81 0a 0000 0000 0001 1 <
>> ffffff85bb5b4100 3778249094 C Ci:1:007:0 -32 0    EPIPE
>> ffffff85bb5b7100 3778249432 C Ci:1:007:0 -104 0   ECONNRESET
>> ffffff85bb5b4500 3778249493 C Ci:1:007:0 -104 0
>> ffffff85bb5b3500 3778249519 C Ci:1:007:0 -104 0
>> ffffff85bb5b3900 3778249544 C Ci:1:007:0 -104 0
>> ffffff85bb5b6500 3778249569 C Co:1:007:0 -104 0
>> ffffff85bb5b6900 3778249602 C Ci:1:007:0 -104 0
>> ffffff85c5b6e100 3778249631 C Ci:1:007:0 -104 0
>> ffffff85c5b6ed00 3778249653 C Ci:1:007:0 -104 0
>> ffffff85c5b6dd00 3778249674 C Ci:1:007:0 -104 0
>> ffffff85c5b6d500 3778249697 C Ci:1:007:0 -104 0
>> ffffff85c5b6b500 3778249727 C Ci:1:007:0 -104 0
>> ffffff85c5b6fd00 3778249755 C Ci:1:007:0 -104 0
>> ffffff85c5b6a900 3778249775 C Ci:1:007:0 -104 0
>> ffffff85c5b6ad00 3778249795 C Ci:1:007:0 -104 0
>> ffffff85c5b6b100 3778249815 C Ci:1:007:0 -104 0
>> ffffff85c5b6c500 3778249844 C Ci:1:007:0 -104 0
>> ffffff85c5b6d900 3778249869 C Ci:1:007:0 -104 0
>> /dev/bus/usb/001/007 test 10 --> 32 (Broken pipe)
> Any hints on logs from the device side as to what is happening?  Any
> debug logs?  If this is an i/o error, the controller might be logging
> something that went wrong.
Absolutely nothing useful in dmesg at peripheral device side.

Well, i can try to use mainline "testusb" tool, and compare 5.4 g_zero
with mainline, maybe some recent improvement fixes the issue. Will write
back here.

> thanks,
>
> greg k-h

Thanks a lot for now.
angelo


