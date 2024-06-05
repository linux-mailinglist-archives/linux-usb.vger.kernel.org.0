Return-Path: <linux-usb+bounces-10907-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD378FD1D7
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 17:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7003B2150E
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 15:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD9C4AEC3;
	Wed,  5 Jun 2024 15:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="UflxUKQ6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpout.efficios.com (smtpout.efficios.com [167.114.26.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F4419D8B5
	for <linux-usb@vger.kernel.org>; Wed,  5 Jun 2024 15:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.114.26.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717601813; cv=none; b=rrSswHtJWIHUtC3gn69XPEyAJdqtzPbL5UyVz2yRLlXfnwBG8KVFbr1VUU/91cNBIst5RVrtz8mPX440dOjk8lRVyJT75i7LA1SAvrbrSbL4tKMZSHVjox2kfvsO7OG+6FZA1Xz0QRwaZsB7GNmy1o2PykYleXaIUZ1YOAf/1SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717601813; c=relaxed/simple;
	bh=JEsMySL2+kFJEMmnsPSyhQM7NTF07H4Bs7MvVHLNQI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uMTaNEbI0qAG0WeYqyD8mUWjFgG+XcYcVsjVBK6yZPVwYJbjlvn0vf5XObhkBw4w4K4Z7PeuzbPPSGrGd7dLkNJfsCQutZx4aeiTMk9L1Yb28SQwctS9DDoGW8Bt0+jQbPRaZX+C7WvkkTRPB54gkoahXcIep4rn0dqmcRJCy0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=UflxUKQ6; arc=none smtp.client-ip=167.114.26.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1717601803;
	bh=JEsMySL2+kFJEMmnsPSyhQM7NTF07H4Bs7MvVHLNQI8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UflxUKQ6VwX6WIjMMdhQtJoa04l+hDBjSQGbYuX661TyH4HYQpuk6vyCFtgKvPIir
	 PAlEzXVPEL4SrOV36okHy2KYs3rHm+odjb9YiPPKgipCgmYP8q8lo79343drNN4rgQ
	 xn8cVz/KK4IM84ToB5Vws/TzMP7GbqMdd/9U4wBDbH0Ddy3qbvEhCqKL0EAChkw1AO
	 tpJonKPek10lkFIRbgsJK6F9D1hB0R2J5UVOYWkwCHN5gmj75qf/bQr6gs9/mJ9cT6
	 0uk6m2HeIUTLKhkvAFsBZyxyTV0UMjgrs04omMsjMyT98oB4TlYS0oyCMbfsbqwgNw
	 Qi+8cThX/Q6DQ==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4VvWlv044Zz12p9;
	Wed,  5 Jun 2024 11:36:42 -0400 (EDT)
Message-ID: <0f9feac0-c54b-4557-a849-8d85705b3d04@efficios.com>
Date: Wed, 5 Jun 2024 11:37:31 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB: Issue with WASD keyboard connected through Lenovo docking
 station on resume
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <8046886e-2e13-4cdc-844e-6a0c1a00c381@efficios.com>
 <f9ab729b-9e0d-48e6-932d-95b3e11323ec@rowland.harvard.edu>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <f9ab729b-9e0d-48e6-932d-95b3e11323ec@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-05-30 15:29, Alan Stern wrote:
[...]
> It sounds like the hub that the keyboard is plugged into on the dock
> doesn't work right all the time.  You could try plugging the keyboard
> into a different hub (interpose one between it and the dock if necessary
> -- or for that matter, interpose one between it and the laptop,
> bypassing the dock).

I've upgraded the dock firmware (Windows only upgrade process
unfortunately) from 1.0.14 to 1.0.23 and the issue still occurs.
I noticed that Windows also failed to bring up the keyboard when
docking, so the issue is not Linux-specific.

I've followed your advice and plugged the keyboard using my Dell
monitor as USB hub, and it works fine now. So the underlying dock
issue is not solved, but at least I have a work-around that works
for my use-case.

Thanks!

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


