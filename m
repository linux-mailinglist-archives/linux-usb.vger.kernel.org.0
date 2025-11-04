Return-Path: <linux-usb+bounces-30061-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E476C32BDD
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 20:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CBCE44E6E68
	for <lists+linux-usb@lfdr.de>; Tue,  4 Nov 2025 19:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E14633C52F;
	Tue,  4 Nov 2025 19:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLk+Ilrk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1572F32939C
	for <linux-usb@vger.kernel.org>; Tue,  4 Nov 2025 19:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762283553; cv=none; b=kVtJLjl+vhDIFfu6uo3dLg9wPJZJLXfAWo0t/QU9RMRAhAdmmkPS70j0a3Jm80wkxKeVPmib3NqVIpzdAWJdxcIZwW/5ZlOY1NgcrQSStZmeTYYhzmfekdrkxtEtFA5IhKhXShAh7lSaa2gTK1ZKGP4K4WSsMglqti1zxKu6RwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762283553; c=relaxed/simple;
	bh=pksqnQfLPEO/fUzxtE7ecz180juV2vs/pIoLAN2kWPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8edt6hh6yrDxlUjNy4/Fo3q02R9ianXrwaq2jk4JfY7Yz+OPQOJLLpFAHoHVnMFOANlcl/MbhwpEGDi697s3y3TU5GRgRw7CkXy+3bniSTBSayBmTc3QAIkd5r+iOySE+PHeIC2D4vhvYy/tNVIbKeYV4OLKZyfP+z2876puWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLk+Ilrk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C8AC4CEF7;
	Tue,  4 Nov 2025 19:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762283552;
	bh=pksqnQfLPEO/fUzxtE7ecz180juV2vs/pIoLAN2kWPc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HLk+Ilrk19OE3phXbkGbrLAu7Nl6jS+tN0gVo6dMMe9yjJ8sSvVIK9yZUdGAKtxgd
	 KgVTK6zGE4r2x7lA56k3CpSso6U2CeJjBBwFfRXPW+nRvQoUN6KZ+xpMF3I6eGNuv3
	 iWEWz7CHpJl8Q4r+BX/tSYhja8CIZTm/m4mFF/rsoI1jjaG2kwhbLqvUwfn66dOLFj
	 qIFS50HhPNIcdx0J4exXr2//l4xLkmZcILllDyBwy9tVumHmXK15/KGtnAt56zMpfL
	 C/hx1TBchlN5rD+pgRgcdGY00vZUDDIFRIfgl8OBwB0Pq3vzy5fz+7WYiOAPpAnQUQ
	 qE+9DuqyhIDfA==
Message-ID: <1d635632-e51f-4538-9896-3e4fa56a4193@kernel.org>
Date: Tue, 4 Nov 2025 13:12:31 -0600
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
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <faaaf1ae-4763-40d6-b734-b2dd0e47b27b@panix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/25 1:11 PM, Kenneth Crudup wrote:
> 
> On 10/23/25 07:13, Mario Limonciello wrote:
> 
>> I didn't check this, I'll spin a v2 and get that checked before 
>> posting it.
> 
> Any luck/update with a V2? (Is V1 close enough to try testing?)
> 
> I have a similar problem with my XPS 9320; if I don't wait an 
> appropriate amount of time after coming out of suspend before plugging 
> in a TB dock that wasn't the one I'd suspended with, my laptop still 
> thinks it's plugged into the original TB dock (and things like DP 
> monitor resolutions, etc. aren't adapted to the new environment) and I 
> would like to help you test this out.
> 
> Thanks, Kenny
> 

V2 caused nonsensical testing failures that I haven't figured out yet so 
I didn't put it out on the list.

Try V1 and let me know how it goes!

