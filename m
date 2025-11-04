Return-Path: <linux-usb+bounces-30065-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BCDC3304C
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 22:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52F07189AB51
	for <lists+linux-usb@lfdr.de>; Tue,  4 Nov 2025 21:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67732F8BC8;
	Tue,  4 Nov 2025 21:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aiOXTt6k"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD63EEA8
	for <linux-usb@vger.kernel.org>; Tue,  4 Nov 2025 21:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762291308; cv=none; b=VxqM/jkipcJlf6ef//aNMgQcd7mc+2lgggPCn3b9XsdY1tnR86BeLmqeBbVawIyE2ti035h+nvzTkeAp9X9yvn9Izx1WHLUF3vpn5oPvmt2bkJIrE68g8ZPHi5nCJe3X/gsOfPPp1HbfzWj8PKQNhmelQ1vjkI2vd1DoG24G8yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762291308; c=relaxed/simple;
	bh=2ZP5BJXB0rlGgONPv0FAOxwAn/u4oumrdRyHDuJJGWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOMm8UutEhfLcllvo5hzsFb5hO3RxbEBsPcxo4jtqcJEjLnA3v61may9xZoahEyDGEWCZDx9w6cDXYbX/bHzkZE+NIVzGjajq6p+ZFfdqtHd9DrtmjIl/L5tKurSWJ6JHARzkw5wYdG5o68C+V3/S9vhd/DoORDdGRiOCW5e0T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aiOXTt6k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A28C4CEF8;
	Tue,  4 Nov 2025 21:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762291307;
	bh=2ZP5BJXB0rlGgONPv0FAOxwAn/u4oumrdRyHDuJJGWA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aiOXTt6kGkjCNBu+IJFXfVvcHzRGEeQVQvUjmb7yA5MP7hVhl+MwbU2igxFpL2CpI
	 2nQKOTCDfSgFh8nRHx2QqdSjJCHV46l7vfDad+mvunYCAMpP9PBwA0rvhD30rLowmT
	 Gj54ut8U6/LMNgDS7QWwKOR1crsk+4Ilhz3ia0eNG6bonHvSgdtvdo3tWO+yptOQak
	 GMsL9/3BPjM0eimw9787+xo6uNch0uJ2Qj3gW59x83ZOv76x5UfhIHJgLzmEzbPfyI
	 QuVkMdZ0XYLUI1VsDMTFMNrRYKvXaHZstGI6QwV/M3upLRdQtKwSrW6hft9pqeacRI
	 kjmvri6cC080Q==
Message-ID: <a849fe60-4dab-428f-a97b-932d597dfc88@kernel.org>
Date: Tue, 4 Nov 2025 15:21:46 -0600
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
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <3aa6006d-450c-4253-a617-bd76114e9ede@panix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/4/25 3:19 PM, Kenneth Crudup wrote:
> 
> On 11/4/25 12:31, Mario Limonciello wrote:
> 
>> Are you doing S4 at all?  Or only s2idle/s3?  The patch was 
>> specifically for resume from S4.
> 
> Ah, good point and I'll have to look out for that, but I do use "hybrid 
> sleep", which (AIUI) starts a hibernation cycle but stays (in my case) 
> in s0ix suspend until after 4h have passed.
> 
> -K
> 

The behavior you describe is suspend-then-hibernate not hybrid sleep. 
Could you confirm which one you're using?

This patch could change suspend-then-hibernate (if you resumed from 
hibernate not suspend) but hybrid sleep would only help if the system 
lost power during suspend (like a dead battery).

For the purposes of testing this patch works it's probably easiest to do 
pure S4.

