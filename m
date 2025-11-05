Return-Path: <linux-usb+bounces-30112-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD56C37722
	for <lists+linux-usb@lfdr.de>; Wed, 05 Nov 2025 20:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2399534FC80
	for <lists+linux-usb@lfdr.de>; Wed,  5 Nov 2025 19:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9581A33EB0D;
	Wed,  5 Nov 2025 19:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heauDoFH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE1A246793
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 19:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762370196; cv=none; b=o77YiHSQ/CEY0Z3WXlaUsQ8uecaO+ClbP5pORm1/LiZIZlWDiLC83myO6i/mpdhAM8QS5uGR9fz12GgWhwm/ptYnvzCoDZmieMoA+d3CYl1vg4nvV3rYCqkIIPfmV/QfWFZJOYM0pxPTAV6qfHHNv49MS4SPzmAI99eHdWRX7iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762370196; c=relaxed/simple;
	bh=BFIdhh5d/enjdM1Ybjn9r7e0e0WWtOWed/K7wiWrAL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=elX1oO49FTrmauCzcOvSLRkGkl97QqO0O1foTprOLVH4fBYMBvOkLxLqyCtDPwO0AeCiomwEbxnNJiCdGkDGdLEGu/sEtESaJPXLND4FJB7/rigma66v2xhWGp2hu9Hdm4fdX5kCQByPvvCnr6xZBKZws1CFTV6UwO5N6MKXrd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heauDoFH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B945BC4CEF5;
	Wed,  5 Nov 2025 19:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762370195;
	bh=BFIdhh5d/enjdM1Ybjn9r7e0e0WWtOWed/K7wiWrAL8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=heauDoFHyvJ/ww+CntTwTc8EO+8QWzkNqHkLLWrQWIFVxHVlRynxpad+tWtUzZdVf
	 8/qW72yw1V3xinCPxbMgspnrdG8xFciMQDGwPV4ofEODKFIYx3XywqmPmQCDhQeH7V
	 ynXwQbjNDTBbvrwxFl//cIoJ0883oWXGMZxxY+SJkkCaNGD4s1F+DHm+iXxGdCZoC7
	 w0ee5ZkG52LJO2MvrJB79oeq9VVrvLco/zvkdithtaz4WQ94Y+TK2SrSkqDyFSIJjS
	 UBEReU2jGB84XYnHWswdLvK1JoDlWO4odBIqFbE0H4dyOmGbdDyuCTfEKFrDSc4LZv
	 Mv55MYOaanKgA==
Message-ID: <4d15e4de-12db-4aa3-9c14-55bafa3b6353@kernel.org>
Date: Wed, 5 Nov 2025 13:16:33 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Reset NHI during S4 restore_noirq() callback
To: Kenneth Crudup <kenny@panix.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: mario.limonciello@amd.com, andreas.noever@gmail.com, westeri@kernel.org,
 YehezkelShB@gmail.com, Sanath.S@amd.com, linux-usb@vger.kernel.org
References: <20251023050354.115015-1-superm1@kernel.org>
 <20251023055603.GU2912318@black.igk.intel.com>
 <02191522-b3f7-459e-ae46-12788f36209a@kernel.org>
 <faaaf1ae-4763-40d6-b734-b2dd0e47b27b@panix.com>
 <1d635632-e51f-4538-9896-3e4fa56a4193@kernel.org>
 <00b5f5a6-27eb-4949-88ab-eb78badedc58@panix.com>
 <848584ae-897a-4b82-8532-059c148db9ed@kernel.org>
 <3aa6006d-450c-4253-a617-bd76114e9ede@panix.com>
 <a849fe60-4dab-428f-a97b-932d597dfc88@kernel.org>
 <e77b71c0-11a6-4df3-8f2d-412f92c1056b@panix.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <e77b71c0-11a6-4df3-8f2d-412f92c1056b@panix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/2025 1:06 PM, Kenneth Crudup wrote:
> 
> On 11/4/25 13:21, Mario Limonciello wrote:
> 
>> For the purposes of testing this patch works it's probably easiest to 
>> do pure S4.
> 
> Well, you were right ... the patch didn't (re-/properly) enumerate the 
> devices when I'd switched TB docks before coming out of suspend ... :|
> 
> That being said, I do "suspend-then-hibernate" AND "hybrid sleep" (which 
> I'm about to disable the former as I think that solves an unrelated 
> issue I have with "double suspend").

Yeah I would suggest either/or.

> 
> So, could this patch be applied for the coming out of (s0ix) sleep case 
> as well? (I swear that used to work properly until a few kernel revs 
> ago ....)
> 
> -Kenny
> 

Well the problems for suspend/resume and hibernate/resume are actually a 
bit different.

The hibernate/resume case is specifically because the system may have a 
Pre-OS CM that is running which had configured all the devices 
differently than the SW CM in Linux does.

For bootup we go through a reset to ensure Linux gets a chance to set up 
everything as intended.

This is /mostly/ for differences of opinions between FW and Linux for 
PCIe resource enumeration, but it also has implications for other tunnel 
types like DP.

So for hibernate/resume this patch aligns the policies for bootup and 
resume from hibernate.

For suspend, some tunnels are left active but not all of them.

DP tunnels are explicitly released through 
tb_disconnect_and_release_dp().  They come back up on resume plug events.

So if you're having problems unique to suspend/resume and DP tunnels 
there is either a problem with the handling of that hotplug event or a 
problem in the graphics driver most likely.


But I'm still wondering about pure S4.  Does it help there?

