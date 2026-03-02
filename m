Return-Path: <linux-usb+bounces-33876-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNsAEg2xpWkiEgAAu9opvQ
	(envelope-from <linux-usb+bounces-33876-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 16:47:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3F81DC20A
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 16:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2D2331035F2
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 15:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB050411627;
	Mon,  2 Mar 2026 15:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="OcSfdG/O"
X-Original-To: linux-usb@vger.kernel.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E895340149C;
	Mon,  2 Mar 2026 15:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772466125; cv=none; b=sWqF+aTFnuHZnkmNYA8BDsbeJFgjDEWkMDcH0fal9w39IhfmZ5Qr1K9yGWxqBiJVuKyXWZ385NLnCVaL6Wnxltdq5eLBWFPxOKONVN6MYRFmbtC8i+AqSqSsEDgkWL6CVaDNUDLncgCkZQ21kfjGlR+97eFGVkYZWVK5v2UVBfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772466125; c=relaxed/simple;
	bh=gNypZ93A9l6cgbmdoQBE572uZqb2wwjeA1RJMHnl3cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlgBEzMfkGzpz0qvnqPxt6/lrO9oP7D+brCdaSPYRcXrmW9kMm1bgRsCBPqSVgtKbOq1lg4XAS51uC7Pbm1zHZnFBjg5rz45hUNlY4c4JVs6NBJuG3i4SEn0n2xml8Q7jYzzis+mjmSzHIsTdBTlN8J5i40Ues42v5WJlxUG2A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=OcSfdG/O; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [IPV6:2a02:f000:10bd:e301::1d7] (unknown [IPv6:2a02:f000:10bd:e301::1d7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 59D7E534093F;
	Mon, 02 Mar 2026 16:41:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1772466109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=m5zRoh1tiqBF/ubgImWGEH3mSReNzsql3p5o83kH6Ik=;
	b=OcSfdG/OwRTUsQ/O3fo8YOl79DEKhPc/xVd0KylKGzxjVIuaQUaj5AJJKWcZtTE9Tm/ScC
	b0uXnof43ONEl3nkl3FoRQntEiORuyL0c7NKlu/u71jWeTfuEacugezIJz24L/o4DKTHNo
	9/Lvku52lRKVRF3amkBe62hGVq9he5s=
Message-ID: <915cc4ae-8bc6-409e-9811-b0e6d2b2d1b9@ixit.cz>
Date: Mon, 2 Mar 2026 16:41:49 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] usb: gadget: Fix g_ncm regression and atomic sleep
 in f_ncm
To: Kuen-Han Tsai <khtsai@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org,
 kernel test robot <oliver.sang@intel.com>,
 LI Qingwu <qing-wu.li@leica-geosystems.com.cn>,
 Ernest Van Hoecke <ernestvanhoecke@gmail.com>
References: <20260221-legacy-ncm-v2-0-dfb891d76507@google.com>
 <70b558ea-a12e-4170-9b8e-c951131249af@ixit.cz>
 <CAKzKK0p0d1MCuOm1O3JCz3mF8jr+vV3NnDN9Wuc_A2OCgiRz_A@mail.gmail.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <CAKzKK0p0d1MCuOm1O3JCz3mF8jr+vV3NnDN9Wuc_A2OCgiRz_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EF3F81DC20A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ixit.cz,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,kernel.org,intel.com,leica-geosystems.com.cn,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33876-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[ixit.cz:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@ixit.cz,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,codeberg.org:url,sr.ht:url]
X-Rspamd-Action: no action

On 02/03/2026 11:15, Kuen-Han Tsai wrote:
[...]>
> David, could you share exactly what OS you are using (e.g.,
> postmarketOS with an sdm845/6.18-dev tree)? Also, could you provide
> some instructions on how to build the code and reproduce this problem
> on a Pixel 3? If you have the time, it would be incredibly helpful if
> you could dive into this a bit deeper on your device to see exactly
> how the DHCP daemon is failing.

Hello Kuen-Han,

it's pmOS initrd, but generally I got reported same behaviour on Mobian (Mobile 
Debian) too.

The Pixel 3 support was merged, so it can be reproduced with:
1. 7.0-rc1 tag
2. -next tree (latest tested is next-20260227)
3. our sdm845-next tree [1] (some WIP patches, working touchscreen on Pixel 3, 
etc.), the tree currently contains the reverts

I can provide log with the patch [2], without the patch [3] (well, it's more 
like nothing is in the log)

I'm very lightly familiar with usb subsystem, so if you give me hints what to 
look for (or what to debug), I'll try find a moment to check to move this forward.

Thank you for working on improving usb gadgets!
David

[1] https://codeberg.org/sdm845/linux/
[2] https://paste.sr.ht/~okias/35982d7e284ee0f767e57923ced591beb4d3b238#L589
[3] https://paste.sr.ht/~okias/4e9172a34e4093445536b51e935dbd229edad7b2#L613


> 
> Regards,
> Kuen-Han
> 
> 
>>
>> On 21/02/2026 15:48, Kuen-Han Tsai wrote:
>>> Commit 56a512a9b410 ("usb: gadget: f_ncm: align net_device lifecycle
>>> with bind/unbind") addressed a lifetime mismatch where the network
>>> interface outlived the parent gadget. However, this introduced two
>>> regressions:
>>>
>>> 1. A NULL pointer dereference in the legacy g_ncm driver. The legacy
>>>      driver attempts to access the net_device during its binding process
>>>      before the NCM function driver is fully initialized.
>>>
>>> 2. A "sleeping function called from atomic context" error in f_ncm.
>>>      The current implementation holds a mutex which might sleep within
>>>      an atomic context.
>>>
>>> To resolve these, store the configuration parameters (qmult, host_addr,
>>> dev_addr) in opts_net until the network device is ready for g_ncm.
>>> Additionally, remove the net_device pointer from the f_ncm_opts
>>> structure. This eliminates the race condition with configfs and allows
>>> dropping the mutex, preventing the atomic sleep issue.
>>>
>>> Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
>>> ---
>>> Changes in v2:
>>> - Remove the RFC tag.
>>> - Fix NPE in gncm reported by the kernel test bot.
>>> - Fix a "sleeping function called from atomic context" error.
>>> - Link to v1: https://lore.kernel.org/r/20260214-legacy-ncm-v1-1-139c5bcc6636@google.com
>>>
>>> ---
>>> Kuen-Han Tsai (2):
>>>         usb: legacy: ncm: Fix NPE in gncm_bind
>>>         usb: gadget: f_ncm: Fix atomic context locking issue
>>>
>>>    drivers/usb/gadget/function/f_ncm.c            | 29 +++++++++++---------------
>>>    drivers/usb/gadget/function/u_ether_configfs.h | 11 +---------
>>>    drivers/usb/gadget/function/u_ncm.h            |  1 -
>>>    drivers/usb/gadget/legacy/ncm.c                | 13 +++++++++---
>>>    4 files changed, 23 insertions(+), 31 deletions(-)
>>> ---
>>> base-commit: da87d45b195148d670ab995367d52aa9e8a9a1fa
>>> change-id: 20260214-legacy-ncm-8c001295b343
>>>
>>> Best regards,
>>
>> --
>> David Heidelberg
>>

-- 
David Heidelberg


