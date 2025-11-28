Return-Path: <linux-usb+bounces-31038-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D081C924A4
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 15:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 337624E5DF8
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 14:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B14C23C512;
	Fri, 28 Nov 2025 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b="02lwxv4O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.kernel-space.org (v2202511311555398556.powersrv.de [46.38.245.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2442D22F74D
	for <linux-usb@vger.kernel.org>; Fri, 28 Nov 2025 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.245.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764339631; cv=none; b=IWv9tqpjOejXSmCwZ65t18eBrsYQ+yjFkugJK0+d1wybGgLyEzFKgpaZL97LwZMCu62l2dI7m9jilXrgov1agrajpUANdP1LckXkoCRANVVO1CGDij/BHVRjC5B9f1/iUvXIqtV1gzqHkNzQ6Xo6IqBTeTOcTYLihD21ce0hwW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764339631; c=relaxed/simple;
	bh=kv88fBNPZlrhTjdhvSVx817QwX0bzRgK2xzV1V5kbnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CRpGDwUXSRNOaBlrtS3pAJ/C/+aDEQJwfLF91OLWKvclPtFPJHr07MTBg3SPhzzrMNCXYklZP2amI7WLPxisSVARm9H5tHT9kIrtk0W4JZCvbLK7kHr3vwCDZxC12TXDkLgwfStmwppvscNyL/iJFMbyZm9vLU6aoL68EhQ1l00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel-space.org; spf=pass smtp.mailfrom=kernel-space.org; dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b=02lwxv4O; arc=none smtp.client-ip=46.38.245.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel-space.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel-space.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
	s=s1; t=1764339620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8PS0574OyHr8ce5fXGVwcRtbrudDwbqFhseSXPDW90c=;
	b=02lwxv4OmoaFDJTvP7mGmN2fhXj9FdbWQewRIXG+cO9w79P771s/5Auu3jvN3nm7oIos5O
	wVQsHywxaZRKCvZCpiScf+kAfxv2rs3OEUXpuXwcAyo3qq0iCXi0dzpmClK2zBR/JIHj/+
	Qd8PpbyyFdjSJTYdiKM1dty03FHYfNg=
Received: from [IPV6:2a07:7e81:7daa:0:62cf:84ff:feee:627] (<unknown> [2a07:7e81:7daa:0:62cf:84ff:feee:627])
	by oreshnik (OpenSMTPD) with ESMTPSA id 90c63a97 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 28 Nov 2025 14:20:20 +0000 (UTC)
Message-ID: <d8aa2f1e-fc44-4bb9-8245-d6ac76047dc3@kernel-space.org>
Date: Fri, 28 Nov 2025 15:20:35 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: testusb: epipe errors on test 9 and 10
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
References: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>
 <c17c0821-3dd8-47b3-b795-f42675fb0a75@rowland.harvard.edu>
Content-Language: en-US, it
From: Angelo Dureghello <angelo@kernel-space.org>
In-Reply-To: <c17c0821-3dd8-47b3-b795-f42675fb0a75@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alan,

thanks a lot,

On 11/28/25 04:23, Alan Stern wrote:
> On Thu, Nov 27, 2025 at 09:06:24AM +0100, Angelo Dureghello wrote:
>> Hi all,
>>
>> looking for some help on testusb tool tests 9,10 always failing with
>> -EPIPE, kind of ep stall. Peripheral side has g_zero loaded.
>>
>> Devices under test are custom boards, have same qualcomm 8 cores cpu, and
>> kernel is android 5.4. Involved drivers in both devices are xhci and dwc3.
>> Anyway, connection under tests is 2.0 microusb connector on both side.
> It seems quite likely that the problem is on the gadget side.  That's
> what you need to debug.
>
>> /dev/bus/usb/001/007 test 9 --> 5 (I/O error)
>> /dev/bus/usb/001/007 test 10 --> 32 (Broken pipe)
> Did you look for error messages in the host's kernel log?
>
1-28 06:14:23.716  3913  3913 I usbtest 1-1.1: 3.0: TEST 9:  ch9 
(subset) control tests, 1000 times
11-28 06:14:23.758  3913  3913 E usbtest 1-1.1: 3.0: get interface 
status --> -5
11-28 06:14:23.758  3913  3913 E usbtest 1-1.1: 3.0: ch9 subset failed, 
iterations left 999
11-28 06:14:23.781  3913  3913 I usbtest 1-1.1: 3.0: TEST 10: queue 32 
control calls, 1000 times
11-28 06:14:23.787     0     0 E         : [    C1] usbtest 1-1.1:3.0: 
subtest 3 error, status -32
11-28 06:14:23.787     0     0 E         : [    C1] usbtest 1-1.1:3.0: 
control queue 81.00, err -32, 31996 left, subcase 3, len 0/2

>> usbmon shows for both cases some EPIPE:
>>
>> ffffff85bf04b100 1951528285 S Ci:1:007:0 s 80 00 0000 0000 0002 2 <
>> ffffff85bf04b100 1951528785 C Ci:1:007:0 0 2 = 0100
>> ffffff85bf04b100 1951529102 S Ci:1:007:0 s 81 00 0000 0000 0002 2 <
>> ffffff85bf04b100 1951529554 C Ci:1:007:0 -32 0   <== EPIPE
>> /dev/bus/usb/001/007 test 9 --> 5 (I/O error)
> I think this is the expected behavior; g_zero does not support
> Get-Interface-Status.
ok, good to know. Btw, on this article seems all tests are passing

https://bootlin.com/blog/test-a-linux-kernel-usb-device-controller-driver-with-testusb/

but not really clear what what "test must pass" is.

>
>> ffffff85bb5b2100 3778244155 C Ci:1:007:0 0 18 = 12010002 ff000040 2505a0a4
>> 04050102 0302
>> ffffff85bb5b2100 3778244178 S Ci:1:007:0 s 80 06 0100 0000 0012 18 <
>> ffffff85bb5b0100 3778245631 C Ci:1:007:0 0 9 = 09024500 010304c0 00
>> ffffff85bb5b0100 3778245693 S Ci:1:007:0 s 80 06 0200 0000 0009 9 <
>> ffffff85bb5b1500 3778247900 C Ci:1:007:0 0 1 = 00
>> ffffff85bb5b1500 3778247964 S Ci:1:007:0 s 81 0a 0000 0000 0001 1 <
>> ffffff85bb5b4100 3778249094 C Ci:1:007:0 -32 0    EPIPE
>> ffffff85bb5b7100 3778249432 C Ci:1:007:0 -104 0   ECONNRESET
> I don't know what's going on here.  The usbmon data doesn't match the
> source code in the current kernel version.  It might have helped if you
> had sent more of the usbmon trace, enough to include the request that
> caused the -EPIPE error.  (That is, the most recent preceding line
> starting with "ffffff85bb5b4100", which should contain "S Ci:1:007:0".)
Below the full log of the transactions of test 10

ffffff85bb5b5d00 3778175803 C Ci:1:005:0 0 4 = 00010000
ffffff863e053900 3778176320 S Ii:1:005:1 -115:2048 1 <
ffffff85bb5b5d00 3778176410 S Ci:1:003:0 s a3 00 0000 0005 0004 4 <
ffffff85bb5b5d00 3778176657 C Ci:1:003:0 0 4 = 03050000
ffffff863e053900 3778177246 C Ii:1:005:1 -2:2048 0
ffffff85bb5b5d00 3778177442 S Co:1:005:0 s 00 03 0001 0000 0000 0
ffffff85bb5b5d00 3778177561 C Co:1:005:0 0 0
ffffff85bb5b5d00 3778178034 S Co:1:003:0 s 23 03 0002 0005 0000 0
ffffff85bb5b5d00 3778178227 C Co:1:003:0 0 0
high speed      /dev/bus/usb/001/007    0
ffffff85bb5b0500 3778229608 S Co:1:007:0 s 01 0b 0000 0000 0000 0
ffffff85bb5b0500 3778231291 C Co:1:007:0 0 0
ffffff85bb5b2100 3778241217 S Ci:1:007:0 s 80 06 0100 0000 0012 18 <
ffffff85bb5b0100 3778241294 S Ci:1:007:0 s 80 06 0200 0000 0009 9 <
ffffff85bb5b1500 3778241325 S Ci:1:007:0 s 81 0a 0000 0000 0001 1 <
ffffff85bb5b4100 3778241355 S Ci:1:007:0 s 81 00 0000 0000 0002 2 <
ffffff85bb5b7100 3778241387 S Ci:1:007:0 s 80 00 0000 0000 0002 2 <
ffffff85bb5b4500 3778241427 S Ci:1:007:0 s 80 06 0600 0000 000a 10 <
ffffff85bb5b3500 3778241463 S Ci:1:007:0 s 80 06 0200 0000 0012 18 <
ffffff85bb5b3900 3778241491 S Ci:1:007:0 s 80 06 0400 0000 0009 9 <
ffffff85bb5b6500 3778241519 S Co:1:007:0 s 02 01 0000 0000 0000 0
ffffff85bb5b6900 3778241548 S Ci:1:007:0 s 82 00 0000 0000 0002 2 <
ffffff85c5b6e100 3778241585 S Ci:1:007:0 s 80 06 0200 0000 0400 1024 <
ffffff85c5b6ed00 3778241616 S Ci:1:007:0 s 80 06 0500 0000 0009 9 <
ffffff85c5b6dd00 3778241641 S Ci:1:007:0 s 80 06 0300 0000 0009 9 <
ffffff85c5b6d500 3778241666 S Ci:1:007:0 s 80 06 0200 0000 03c0 960 <
ffffff85c5b6b500 3778241695 S Ci:1:007:0 s 80 06 0100 0000 0040 64 <
ffffff85c5b6fd00 3778241725 S Ci:1:007:0 s 80 06 0f00 0000 0005 5 <
ffffff85c5b6a900 3778241754 S Ci:1:007:0 s 80 06 0100 0000 0012 18 <
ffffff85c5b6ad00 3778241780 S Ci:1:007:0 s 80 06 0200 0000 0009 9 <
ffffff85c5b6b100 3778241817 S Ci:1:007:0 s 81 0a 0000 0000 0001 1 <
ffffff85c5b6c500 3778241850 S Ci:1:007:0 s 81 00 0000 0000 0002 2 <
ffffff85c5b6d900 3778241875 S Ci:1:007:0 s 80 00 0000 0000 0002 2 <
ffffff85c5b68100 3778241905 S Ci:1:007:0 s 80 06 0600 0000 000a 10 <
ffffff85c5b6c900 3778241930 S Ci:1:007:0 s 80 06 0200 0000 0012 18 <
ffffff85c5b68d00 3778241953 S Ci:1:007:0 s 80 06 0400 0000 0009 9 <
ffffff85c5b6c100 3778241980 S Co:1:007:0 s 02 01 0000 0000 0000 0
ffffff85c5b6f100 3778242002 S Ci:1:007:0 s 82 00 0000 0000 0002 2 <
ffffff85c5b6cd00 3778242034 S Ci:1:007:0 s 80 06 0200 0000 0400 1024 <
ffffff85c5b69d00 3778242061 S Ci:1:007:0 s 80 06 0500 0000 0009 9 <
ffffff85c5b6f500 3778242083 S Ci:1:007:0 s 80 06 0300 0000 0009 9 <
ffffff85c5b6a500 3778242106 S Ci:1:007:0 s 80 06 0200 0000 03c0 960 <
ffffff8643257d00 3778242130 S Ci:1:007:0 s 80 06 0100 0000 0040 64 <
ffffff86236bf900 3778242151 S Ci:1:007:0 s 80 06 0f00 0000 0005 5 <
ffffff85bb5b2100 3778244155 C Ci:1:007:0 0 18 = 12010002 ff000040 
2505a0a4 04050102 0302
ffffff85bb5b2100 3778244178 S Ci:1:007:0 s 80 06 0100 0000 0012 18 <
ffffff85bb5b0100 3778245631 C Ci:1:007:0 0 9 = 09024500 010304c0 00
ffffff85bb5b0100 3778245693 S Ci:1:007:0 s 80 06 0200 0000 0009 9 <
ffffff85bb5b1500 3778247900 C Ci:1:007:0 0 1 = 00
ffffff85bb5b1500 3778247964 S Ci:1:007:0 s 81 0a 0000 0000 0001 1 <
ffffff85bb5b4100 3778249094 C Ci:1:007:0 -32 0    EPIPE
ffffff85bb5b7100 3778249432 C Ci:1:007:0 -104 0   ECONNRESET
ffffff85bb5b4500 3778249493 C Ci:1:007:0 -104 0
ffffff85bb5b3500 3778249519 C Ci:1:007:0 -104 0
ffffff85bb5b3900 3778249544 C Ci:1:007:0 -104 0
ffffff85bb5b6500 3778249569 C Co:1:007:0 -104 0
ffffff85bb5b6900 3778249602 C Ci:1:007:0 -104 0
ffffff85c5b6e100 3778249631 C Ci:1:007:0 -104 0
ffffff85c5b6ed00 3778249653 C Ci:1:007:0 -104 0
ffffff85c5b6dd00 3778249674 C Ci:1:007:0 -104 0
ffffff85c5b6d500 3778249697 C Ci:1:007:0 -104 0
ffffff85c5b6b500 3778249727 C Ci:1:007:0 -104 0
ffffff85c5b6fd00 3778249755 C Ci:1:007:0 -104 0
ffffff85c5b6a900 3778249775 C Ci:1:007:0 -104 0
ffffff85c5b6ad00 3778249795 C Ci:1:007:0 -104 0
ffffff85c5b6b100 3778249815 C Ci:1:007:0 -104 0
ffffff85c5b6c500 3778249844 C Ci:1:007:0 -104 0
ffffff85c5b6d900 3778249869 C Ci:1:007:0 -104 0
/dev/bus/usb/001/007 test 10 --> 32 (Broken pipe)


> The -ECONNRESET errors are a normal response to the -EPIPE error.
>
> Alan Stern

Thanks a lot
angelo

