Return-Path: <linux-usb+bounces-32516-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C16BAD3B7DB
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 20:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9BD7300E463
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 19:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEBF2E88B0;
	Mon, 19 Jan 2026 19:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ukEv/tXa"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B21E7E0E8;
	Mon, 19 Jan 2026 19:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852764; cv=none; b=TPlvCkNhjtrR9Y9oqv45j0cktBopLbfStitwcXR6ytS1a98IZbWk8zplRW/qTmouo51lC0zzldbLOU7C/N2sDaeXyCq6m5mCovu3Gb8b0yl3nt7ES5SnvZJE7Pvspnw4oSnD58kOa4fNb5y7+rDtfT0bSG8xPn2Qu6sk1V+eZJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852764; c=relaxed/simple;
	bh=XRL2TLYIPJYtMpSeXrfagsgEhlHmS8vsDoqUidnLQVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFs6sbESAuRAlzHAfEkt1AadPbnPtD3U8jn/Vma5ynRXBzAhKoMLeOHKskjvxnNHwRhSGs62svf2ovmmWhi0lvDfQoyyVPsN62BCHXoHQPzYFXAiM8NDvCSWoBXOSvfkT11cQQx8jVyyCzRwoGvPmE97tp3XxEil6KjAAWe6VNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ukEv/tXa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D3DC116C6;
	Mon, 19 Jan 2026 19:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768852763;
	bh=XRL2TLYIPJYtMpSeXrfagsgEhlHmS8vsDoqUidnLQVI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ukEv/tXarGSxfdyGD6dOoMwBtjN2ArCw6OLSosd+2Czc4ahLY9DUGVcyh1eeCjWPs
	 ewvB22KEokrfPd8WkAKrQ2dZnQM6F6WsVoV7Be2UVSTRIiey/WMA1QFAhPtR3Msjvp
	 RBAKj1aVRxCVnwHs2A67f/LysxN71klqlm8zlYt67nQh72SrqZjyeuIhvpdBoZkcnZ
	 9uq4RUh3pN6I1L4aGhXdb5jqfPueHYMHv+wp6BDaUaoI0FGaC9+VM+ZdOTF/e7Z7+M
	 +ctG79AJO4+w+xglfKYA3cX93EZe+yhC0sLf4/b4l8wL+wTkemQhXQkbX3BZkDYCAB
	 0ZLqaqZuu//fA==
Message-ID: <6438b5a3-a0f4-4c7d-9f56-59cdf7f5148f@kernel.org>
Date: Mon, 19 Jan 2026 13:59:21 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] thunderbolt: Fix S4 resume incongruities
To: "Katiyar, Pooja" <pooja.katiyar@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Pooja Katiyar <pooja.katiyar@intel.com>,
 Rene Sapiens <rene.sapiens@linux.intel.com>
References: <20260106053749.61440-1-superm1@kernel.org>
 <20260107093353.GO2275908@black.igk.intel.com>
 <158442b3-28c2-4f8c-ba42-0b9c6661c650@kernel.org>
 <20260108114205.GS2275908@black.igk.intel.com>
 <ad8cf89d-a171-4e72-996e-8b09d16f9017@kernel.org>
 <20260109072318.GU2275908@black.igk.intel.com>
 <eb4685e6-04fc-4d21-bd98-2a297c183966@linux.intel.com>
 <8cf57879-5fa7-4d23-afb4-6ef99f0ce97a@kernel.org>
 <5834100b-788c-4520-9b70-f462f65149ca@linux.intel.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <5834100b-788c-4520-9b70-f462f65149ca@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/17/2026 10:57 AM, Katiyar, Pooja wrote:

>> I have confirmation the hack patch does help the issue for us too.
>>
>> If your patch doesn't work another logical solution could be to destroy
>> all the tunnels as part of the PM freeze callback (not just the DP
>> resources).  Maybe even unify the suspend and freeze codepaths for more
>> opportunities for code reuse?
>>
> 
> Thanks for confirming the hack patch helps!
> 
> We are actually working on a solution that releases the DP resources and
> suspends the switch as part of the freeze sequence. This way the hibernation
> image that is stored doesn't contain any active tunnels, and during resume
> we get a DP hotplug notification for a new tunnel, similar to S5. So far
> this patch is working fine but is under review.
> 

Thanks.  If you want early testing from us too before you're ready to 
post publicly feel free to ping it offline to me too.

Thanks,

