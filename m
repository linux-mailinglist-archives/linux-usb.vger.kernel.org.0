Return-Path: <linux-usb+bounces-21265-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B740CA4BEF6
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 12:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA5727A7ADC
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 11:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB46200B9C;
	Mon,  3 Mar 2025 11:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="jo1REVkx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0E01FFC7C
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 11:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741001944; cv=none; b=Wu6Dx9r7Ei02PK7hJWUOd4ZEw4DhrOtURNiN3oTTDkp1ZpZl7b74Iu7IpX4QcBrF0/QNMYjmIUYGgb+QXZ3/iJo/+wb6cFu4oHZCYHPEQEMi4laHqDAL8M7M70sJwUKM6gL4MXL1mWENyOb4D5Hij3Ys2R/AHU02JhIaemZl+sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741001944; c=relaxed/simple;
	bh=psBX1W6Fy4nSkljCO1q15NcpD3fqtkUpr53sJUVnqbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhkdzgzcPn1QzwPgUGh9dgHUrfwJBSSDxZXaHwy/N6jHOKYjfX+5REWky+gHeCZ0PexPW0EyevZGpOkG/NCHJsZIG7PnqoH0NiLyuQbUbwsn+15ovn2XBnlO8ZujnSTqBqxLgF5SRi86yOpT4PY5mxFZv7sh5dGuLZo5Yj7pCEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=jo1REVkx; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.126.189] (ip72-219-82-239.oc.oc.cox.net [72.219.82.239])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z5xfX2l55z4s9Q;
	Mon,  3 Mar 2025 06:39:00 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1741001940; bh=psBX1W6Fy4nSkljCO1q15NcpD3fqtkUpr53sJUVnqbY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jo1REVkxtxeTQukcf5wsWtreilYpV/3uBucP2nTN/UgVFmJVKp+fLb+Nqa5Au7iIX
	 8sbakpLvxl2TZMOnhdDKaChWHCf2+g0vkruOTx0UQ/Xql1nKqGQGnWkzmeBIANyEGh
	 zMcr6z3Su5el/XmhBeTne0xY0UGmEfDLW6XXMdGo=
Message-ID: <d56fcd99-433e-4670-8388-7035812a78d9@panix.com>
Date: Mon, 3 Mar 2025 03:38:58 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Me <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
References: <8e175721-806f-45d6-892a-bd3356af80c9@panix.com>
 <bd731ba2-5509-44e6-a419-814ef5329bbd@panix.com>
 <992dba2a-4919-4f76-ac48-986792d5843c@panix.com>
 <2b55ab09-8389-4916-8acc-abc73f234d21@panix.com>
 <20250303104618.GP3713119@black.fi.intel.com>
 <f31309e4-6ce5-48cf-910e-cd74f818aac8@panix.com>
 <20250303112149.GS3713119@black.fi.intel.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <20250303112149.GS3713119@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/3/25 03:21, Mika Westerberg wrote:

> Now you say that you don't reproduce the DP tunnel issue if you simply plug
> in monitor so let's try to figure out reliable steps to repro so we can
> investigate.
...
> So with 9d573d19547b3 only reverted, no other changes to the kernel and
> "thunderbolt.dyndbg=+p" in the command line do following steps:
> 
> 1. Boot the system up, nothing connected.
> 2. Connect TBT 4 dock to the system.
> 3. Connect monitor to the TBT 4 dock.
> 4. Suspend the system by closing lid.
> 5. Resume the system by openling lid.
> 
> Expectation: Monitor over Thunderbolt still shows picture.
> Actual result: Screen is blank.

I will do this in a couple of days (got a few things to do first), but 
what actually happens is I get as OOPS and have to power-button-reset to 
recover, not even SysRq-B gets me out of it (I've since added "Panic on 
OOPS" with a 15-second timeout while I was trying to figure out this DP 
monitor issue).

> Then since now resume at least
> completes you can provide full dmesg to me and I can try to figure out what
> is wrong there.

It'll have to be more pstore dumps, as resume doesn't (usually) complete 
with d6d458d42e1.

And apparently this became two issues as d6d458d42e1 was added to Linus' 
master somewhat recently, and after I'd started the issue of the NVMe 
OOPSes on resume, so I'd get two different crashes, depending on what 
was connected when I'd suspend, and what was connected when I'd resumed.

Once you'd discovered 9d5.., which I'd reverted that same day, it then 
isolated the second failure mode (which was the reason for those 
__tb_path_deactivate_hop()s in the dmesg/pstores I'd been sending, as I 
thought it was related to the original NVMe adaptor crashes, but helped 
me then find this current problematic commit).

>> ... and as with 9d573d19

> I don't think this is hardware issue, I see it too in my hardware

Sorry, wasn't clear- what I'd meant was "Just as with [the revert of] 
9d573d19 I'd like to help figure out what's causing d6d458d42e1 to OOPS 
my machine on resume."

-Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


