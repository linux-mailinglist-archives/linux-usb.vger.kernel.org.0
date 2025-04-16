Return-Path: <linux-usb+bounces-23131-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5721A90450
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 15:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0836A17B249
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 13:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0895417BA6;
	Wed, 16 Apr 2025 13:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMB766wv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873F223774
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 13:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744810032; cv=none; b=UQ3GxS8KRQR+IMxSY2MxVKBR7Hx+vuGS+NcSuRwv/0hQDFbk5VoHZi6I/a6rvDgGjljUYXWV9hgNGN0pzZvLsVTuQNq6vbeZVO513fvLn+vKr7FSmBe/M3cHt7IX2T3TGmgeC7cP2zprZE+hy6oM7iPbGsAi5JhVY/386hjVS4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744810032; c=relaxed/simple;
	bh=t4IJilFbzzHK7m7nmBG4FaUuLXoVEmoJCLqjRbwF53o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jic0KGzyV3z+RYDtX39hM01KXOTvzGck7RE6+hKjkQ0ijlXV3kMa0qajgG5y2YmR4q7gBanzcjYmj5ri90MFjN0Rxuu+vzLrBslizOKcJbuok4Vtw6nO+T5jYbkVB9R7aMZL7Ulo/+L7gASdQjEmPrPj/JIMIPUGlI3XxoZJlFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMB766wv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAD9C4CEE2;
	Wed, 16 Apr 2025 13:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744810031;
	bh=t4IJilFbzzHK7m7nmBG4FaUuLXoVEmoJCLqjRbwF53o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QMB766wvTH1e3u3WTw77tUPWtKD7FYeRXkH/ON7g11Udv/94rNXX38oBRCCijF6Pv
	 dkR4rCPgKg9CshnJ98zLShgsIZ2ZnQcuO+FCkU3Rjhbw3ciFZewODHXQh4XS6kW3cQ
	 qbpTVz7abmXLQ3QV4JYia5eeMDPGIxvglrlMebPF8gnAVbkJM6O6TtfX0R5Zg4ZCXw
	 2sJ4EvOKRGaBa56lBQZq0Xkp3aZ9S89+s229S7q+8nUWWvn7Cc3l1VZyAl+y/m528v
	 zL1iCAeXqJFnCVbb7YzvTNn/oct/IGTTXoh4Pooz2O8/oa1rqmWNXKdZ2iWxZR3nHP
	 /UK6TQi1VqEaA==
Message-ID: <962f6730-c61a-4d26-98cf-5051782da3e8@kernel.org>
Date: Wed, 16 Apr 2025 08:27:10 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Fix a logic error in wake on connect
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: mario.limonciello@amd.com, andreas.noever@gmail.com,
 michael.jamet@intel.com, westeri@kernel.org, YehezkelShB@gmail.com,
 rajat.khandelwal@intel.com, linux-usb@vger.kernel.org
References: <20250411151446.4121877-1-superm1@kernel.org>
 <20250416123743.GH3152277@black.fi.intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250416123743.GH3152277@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/2025 7:37 AM, Mika Westerberg wrote:
> On Fri, Apr 11, 2025 at 10:14:44AM -0500, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> commit a5cfc9d65879c ("thunderbolt: Add wake on connect/disconnect
>> on USB4 ports") introduced a sysfs file to control wake up policy
>> for a given USB4 port that defaulted to disabled.
>>
>> However when testing commit 4bfeea6ec1c02 ("thunderbolt: Use wake
>> on connect and disconnect over suspend") I found that it was working
>> even without making changes to the power/wakeup file (which defaults
>> to disabled). This is because of a logic error doing a bitwise or
>> of the wake-on-connect flag with device_may_wakeup() which should
>> have been a logical AND.
>>
>> Adjust the logic so that policy is only applied when wakeup is
>> actually enabled.
>>
>> Fixes: a5cfc9d65879c ("thunderbolt: Add wake on connect/disconnect on USB4 ports")
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> I guess the offending commit was never even tested :(
> 

Yeah that is my only explanation too.  So now this begs the question do 
we do the 3rd step that we set all the ports to 'enabled' by default?

> Applied to thunderbolt.git/next thanks!

Thanks!

