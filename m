Return-Path: <linux-usb+bounces-9781-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A398B2A24
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 22:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AF95B21791
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 20:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E407D153824;
	Thu, 25 Apr 2024 20:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="ozr3NaZ8";
	dkim=pass (2048-bit key) header.d=cchtml.com header.i=@cchtml.com header.b="WWyujRXI";
	dkim=pass (1024-bit key) header.d=cchtml.com header.i=@cchtml.com header.b="a0tNfM3W"
X-Original-To: linux-usb@vger.kernel.org
Received: from a1i757.smtp2go.com (a1i757.smtp2go.com [43.228.186.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D573939ADD
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 20:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.228.186.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714078277; cv=none; b=AvUdqtcb9OaE1x4WWrXcj3aPYTRxqTDSW1YfnEKnFo4exPGKzY/rTaeaqeuYMeuTGUojNAmm8uFh+VErWMRAwmstlWpyavJUAHPe0vJzHm42RKFUDlx2y+P/uKIrLbNwUs8ETNMwela4KRdO87IgF+SQyQ7k94t4C+LH8hQYyPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714078277; c=relaxed/simple;
	bh=/k/S6WOKrQUvHCOGUr8t4WgqnLGJ/YsyjH7FPnHT6Rs=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=fC4KaGVcQigdOx5PtRmeHPkZPR1c6Z5a9mQoCc1RxciGGwNhKtHTwwEdSiRb7skHJ0fveheFMFtCR9s/JTAmWhtGZevgRy5w4HbjmuT9LGHHkcd6i7NrUPVHBt0S5+z+LL8Hp+dcLU5MNBkR6KzR0mg24mtikg2JnXx1UQK1dew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cchtml.com; spf=pass smtp.mailfrom=em608870.cchtml.com; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=ozr3NaZ8; dkim=pass (2048-bit key) header.d=cchtml.com header.i=@cchtml.com header.b=WWyujRXI; dkim=pass (1024-bit key) header.d=cchtml.com header.i=@cchtml.com header.b=a0tNfM3W; arc=none smtp.client-ip=43.228.186.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cchtml.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em608870.cchtml.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=md1t20.a1-4.dyn; x=1714079175; h=Feedback-ID:
	X-Smtpcorp-Track:Subject:From:To:Date:Message-ID:Reply-To:Sender:
	List-Unsubscribe; bh=9OZ+Maw+FEUms3tVvD1nUlRX77OK6HR0UuSXK0CEPAA=; b=ozr3NaZ8
	DZY7YmAdKx9F9AXbDVWyfzSQIspS1FFtF9e8Fjm9Su9NUNd3JSjnuxoKcJ5TFowL4j9ccAiG/ETtx
	5u4XnJ6G0eocGxYJ1WjMSf+8kN890L+tJuRfAIFsuiYPlY7UxByYSqpiaM3i4lZ6Vdbkv2ROTTufi
	Uh8jpWMjwW8F/5p8+Bxx8QG5vKBI20QTq0+aVvUMwrbMuKE55hMYF1RIBOqyS9KOdbwTkyMoWJIZa
	sh0xWFa1IO2tLPjNlEKVjikwLUNtt2L2NosC3VuQJrGKoMEH/VvUtIUxE5tH3oErpnBvvDKny4vHI
	J3B9Sj5L/MkppeNHEtxxDVOYjw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cchtml.com;
 i=@cchtml.com; q=dns/txt; s=s608870; t=1714078275; h=from : subject :
 to : message-id : date;
 bh=9OZ+Maw+FEUms3tVvD1nUlRX77OK6HR0UuSXK0CEPAA=;
 b=WWyujRXIFMfHRSLIT0YB1BQ7y59GmkqMVMxKL229JApAv4tb5f0PSFSvjyVAhm/45Gw+K
 4FStEIdoLUbMZy1QcouxavnT11U5AnJu8oyA4yO6oJxeBr3vCKsrus8Ie2+j7QMJKj/5aF7
 5a6EuoOhkhNwk97sdw9rBkWJRXjIQTyBtAj+02eTJ/dTW4tpcbrOQ1MYuYmNQj+hlj2uzOx
 NrVY22B1ES38C2uiUXcaBAC6oEF/WfmxRcEbQeq6BakVyzlwBk0+k8cJaWxwHduDQhbiXzK
 PgR8B92ya+xrGmkRBqEyVheSJ9hGwwW9Ud1bFOuRKRdjAKv78E7w1qIqI9Qw==
Received: from [10.45.79.170] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <mike@cchtml.com>)
 id 1s063l-bePAXi-2S
 for linux-usb@vger.kernel.org; Thu, 25 Apr 2024 20:51:13 +0000
Received: from [10.145.240.152] (helo=cchtml.com) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97-S2G) (envelope-from <mike@cchtml.com>)
 id 1s063k-FnQW0hPqUFo-JQpu for linux-usb@vger.kernel.org;
 Thu, 25 Apr 2024 20:51:12 +0000
Received: from [10.0.0.10] (unknown [10.0.0.10])
 by cchtml.com (Postfix) with ESMTPSA id C4AE5F6045A
 for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 15:51:11 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 cchtml.com C4AE5F6045A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cchtml.com;
 s=balthasar; t=1714078271;
 bh=9OZ+Maw+FEUms3tVvD1nUlRX77OK6HR0UuSXK0CEPAA=;
 h=Date:To:From:Subject:From;
 b=a0tNfM3W12Nx/0fCWo1j9OYinpQgDLkZtbcVlOukiZiq18kIfEUlx9R8How6t+4CY
 7lXJfHM4x6JRBumzKr0jcJiDnUr/xSM8DgduVR5Y1KoaGJzUhtUUZN/VeILlTZ6S/m
 KpI8fqj8dRhRz98yVFNEOTS6kyWZLXXj+H7V98ks=
Message-ID: <365a9ed8-0b77-4bb6-85b5-e088f0c2c36b@cchtml.com>
Date: Thu, 25 Apr 2024 15:51:10 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org
Content-Language: en-US
From: Michael Cronenworth <mike@cchtml.com>
Subject: No SuperSpeedPlus on AMD X570S motherboard
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Smtpcorp-Track: JJLxTqxy0qEF.UzC9HjOrnSBt.nN6srQd8QTC
Feedback-ID: 608870m:608870aW9PzKj:608870s8j6r_ec8n
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

Hi,

I have just noticed after two years of ownership that my reported speeds for two 
different USB 3.2 Gen 2 (10Gbit) devices are reporting as connected at 5Gbit. I do 
not recall that I checked the speeds in the past two years so I am uncertain if it 
ever worked at Plus speed.

Motherboard: Gigabyte X570SI AORUS PRO AX
Kernel: 6.8.7
OS: Fedora 40

There is one USB-A 3.2 Gen2 port and one USB-C Gen2 port on the back panel. Both 
ports report SuperSpeed only (5Gbit) when SuperSpeedPlus devices are plugged into them.

Windows 10 shows both ports can work at SuperSpeedPlus 10Gbit speed with the USB 
Device Tree Viewer tool.

Is there anything that could I do to fix this for Linux?

Thanks,
Michael


