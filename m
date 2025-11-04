Return-Path: <linux-usb+bounces-30063-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE6BC32E8D
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 21:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 92B0D4E8B53
	for <lists+linux-usb@lfdr.de>; Tue,  4 Nov 2025 20:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1113D1DD9AC;
	Tue,  4 Nov 2025 20:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRi2oegW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1C41F1537
	for <linux-usb@vger.kernel.org>; Tue,  4 Nov 2025 20:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762288272; cv=none; b=pH2tXkQJ8hcLkzG8egn7JbE3y0QVlJF8q/DPDSRPomwW0QgKCRGTY3c+c5GYuPyb1CZ929LP53FoH/pMcj9i62WWSz2UVLTty8yazKScpXIA5jm1mBjQbkkwdGCTN93WwWaogl5mxAMcvCf/e749iFcKkf+ZSDa6esZapvSRYa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762288272; c=relaxed/simple;
	bh=3IRm5LzaDtktalXM1FFvuCvs2WHQi1xvgb+DVE12II8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z1YRa8m2yGXMJu3VkCDxlGSdMtAQe5IbDnd62B0UXoAcJSXd3H27yStTge48f1TxwnoFiLBpj+8RP9AHq0yOKlqoofO+zcNQLFmXbiYT3OQ63edE3IPonx/Mo/7m/PLb8KwKjEobkoMJRXQG3ijk5+ECF4DGJ8cNMvkUP2K4dmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRi2oegW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D50DC4CEF8;
	Tue,  4 Nov 2025 20:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762288271;
	bh=3IRm5LzaDtktalXM1FFvuCvs2WHQi1xvgb+DVE12II8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eRi2oegWzxT2768/JSvyGdpdvmbJQXYb0KHhof8sXD93dFbx8yjDfyjzsmcsNEEGk
	 xcv+Bn8lYmmwoOd4cC8qT6gO1nd2bUxja6oRfwveQsbqAJD+bQhMMAJULRdgkoO+1u
	 H3Yo7C8fWb+KepwdKs1WS13Ci/2j18d7n7DKTK2lhlTzdIM6ChDYfakdDA8MaxLsny
	 LKtGnktuXalk2ABby1YWLWf3MbXWnVikXvSzOZrqguforWkzfCn9Ddckr5mlqvgUP5
	 upKUZClLhLkvc+Cy8DAb216lQMqTU9vD8CpW1IqS13KZo0t/P8HJkLbc1w1KhB74qP
	 Zeaa6zRtfLptQ==
Message-ID: <848584ae-897a-4b82-8532-059c148db9ed@kernel.org>
Date: Tue, 4 Nov 2025 14:31:09 -0600
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
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <00b5f5a6-27eb-4949-88ab-eb78badedc58@panix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/25 2:22 PM, Kenneth Crudup wrote:
> 
> On 11/4/25 11:12, Mario Limonciello wrote:
> 
>> V2 caused nonsensical testing failures that I haven't figured out yet 
>> so I didn't put it out on the list.
>> Try V1 and let me know how it goes!
> 
> Will do ... the transition from work to home (with totally different 
> setups) is where I usually see this issue come up, so I'll know more 
> tonight, but at least just a quick suspend-resume cycle RN hasn't blown 
> anything up, so that's promising :)
> 
> -Kenny
> 

Are you doing S4 at all?  Or only s2idle/s3?  The patch was specifically 
for resume from S4.

