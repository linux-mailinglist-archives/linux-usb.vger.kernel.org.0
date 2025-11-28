Return-Path: <linux-usb+bounces-31045-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00695C932E4
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 22:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64EDA3AC698
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 21:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75960284889;
	Fri, 28 Nov 2025 21:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b="Bv4Qn0lC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.kernel-space.org (v2202511311555398556.powersrv.de [46.38.245.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ED71DE2AD
	for <linux-usb@vger.kernel.org>; Fri, 28 Nov 2025 21:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.245.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764364855; cv=none; b=GaT0eG3PjjIk7jJjwQz7CUN53vU9E90SsmS/VRKvWqW13Cg4vv7AAaO1NHOTfRct1etoNDChISvcTLlpRD/dbpOrVK9Natp8OOkjsDQNMpLFV0oC4bSSF0P1hRs3kmAyRJTT6j0Vu1BMmdmdm59IdCV0YSJZNe6PzOlNoX673SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764364855; c=relaxed/simple;
	bh=21JGs9HYch9r71PzbU1k6+gE+rV+jiBw2K4rSuIdpNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eYy/7fWAlgcSSsZRhVC7aGJpF3RGdxsFyotwyYcytC9F8DqZrE/j/sIyM1kD90uLsuf5K3/VALRN7Z1lXCxQGt8boUUraUG1NtvAGhsJdMByO7YN5XvORSioUjMD7hw5YS6nFFw0ePmMm79ADfNp7Gx86HwrOpEbBLs2nSJzM8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel-space.org; spf=pass smtp.mailfrom=kernel-space.org; dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b=Bv4Qn0lC; arc=none smtp.client-ip=46.38.245.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel-space.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel-space.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
	s=s1; t=1764364849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TC3Z2IjnmDec6ARPoqLAGLEccOFs5hDa2ME7pTDVuyI=;
	b=Bv4Qn0lCHQKRNTlELaE62lrQIwVlHktc+203acZi4OdWt3UE75JQwh+LG+KkbUKXGQSzFM
	addm1AKqj8W41rLwUTUIix5CjtDbKk84xWl3nRer9MYCGkQl19UDMP2TwmPqlmGa7Fx0tZ
	2AlcxafQVfcbM4HEv4+hNEuuf03zpJk=
Received: from [IPV6:2a07:7e81:7daa:0:62cf:84ff:feee:627] (<unknown> [2a07:7e81:7daa:0:62cf:84ff:feee:627])
	by oreshnik (OpenSMTPD) with ESMTPSA id a5bf3cdf (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 28 Nov 2025 21:20:49 +0000 (UTC)
Message-ID: <4430e4b6-9556-4c93-8b63-4c7abc79307d@kernel-space.org>
Date: Fri, 28 Nov 2025 22:21:05 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: testusb: epipe errors on test 9 and 10
To: Alan Stern <stern@rowland.harvard.edu>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org
References: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>
 <c17c0821-3dd8-47b3-b795-f42675fb0a75@rowland.harvard.edu>
 <d8aa2f1e-fc44-4bb9-8245-d6ac76047dc3@kernel-space.org>
 <9776c9fb-8fed-4e79-b312-0b1a872911b8@rowland.harvard.edu>
 <bcc4f76a-985b-4932-a455-b4fedcafcd97@rowland.harvard.edu>
Content-Language: en-US, it
From: Angelo Dureghello <angelo@kernel-space.org>
In-Reply-To: <bcc4f76a-985b-4932-a455-b4fedcafcd97@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alan,

On 11/28/25 17:10, Alan Stern wrote:
> On Fri, Nov 28, 2025 at 10:20:25AM -0500, Alan Stern wrote:
>> On Fri, Nov 28, 2025 at 03:20:35PM +0100, Angelo Dureghello wrote:
>>> Hi Alan,
>>>
>>> thanks a lot,
>>>
>>> On 11/28/25 04:23, Alan Stern wrote:
>>>> I think this is the expected behavior; g_zero does not support
>>>> Get-Interface-Status.
>>> ok, good to know. Btw, on this article seems all tests are passing
>>>
>>> https://bootlin.com/blog/test-a-linux-kernel-usb-device-controller-driver-with-testusb/
>>>
>>> but not really clear what what "test must pass" is.
>> It looks like something may have changed between the time when that
>> article was written and now.  I would expect g-zero to support
>> Get-Interface-Status, since it is a standard request.
> This was wrong; I had forgotten that Get-Status requests are mostly
> handled by the UDC driver, not by the gadget drivers.  In your case, I
> guess that's dwc3?
>
> In the current kernel, these requests are handled in
> drivers/usb/dwc3/ep0.c:dwc3_ep0_handle_status().  The problem is that
> this routine doesn't handle Get-Interface-Status requests at all;
> instead it passes them through to the composite core, which doesn't
> handle many of them either.  Other UDC drivers do a better job.
>
> Fixing this should be pretty easy, but I'm not not an expert on dwc3.
> The maintainer, Thinh Nguyen, will know what to do.
Thanks a lot, really, will look this direction so.

> Alan Stern
angelo

