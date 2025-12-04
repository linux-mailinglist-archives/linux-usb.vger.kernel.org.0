Return-Path: <linux-usb+bounces-31139-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A94D3CA213C
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 02:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A636302858A
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 01:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A391465B4;
	Thu,  4 Dec 2025 01:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbRFTiyY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83211A317D
	for <linux-usb@vger.kernel.org>; Thu,  4 Dec 2025 01:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764810106; cv=none; b=NclK9WXNaaiw3o3QwZHLyTGpLXjSh0IZBjx1FZl7liM+guO//s5UDX0NC9Z046iOmYJ1s/5Is5L5hGq9+UX9IvxuYMtSTP++FYSO0myW1yiVFKigSD6ZzpjZNWS/kt8vYrrpmF5jJRrAY3um05v8CKHXCjsi4kw0lTBu/nhXfdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764810106; c=relaxed/simple;
	bh=MLG+4TD667sksnR+VjBrwaFU2UE/zAZE0BYyenvlTcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYmCuQszwmYRZBWAyrscYAAAyEqojauQ+pybcKxSIPe9aAADMk7Hn3wgKzWV1rQv15OM7I4vhXsZPeZYu6dXinMVxIMRQBe/4olPcmwmW1rBqVsoHR405zxCbu48E8bENqh4BlzAumQd7YX54XKViZOZveYSRfG/nMU6HCQ+J50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbRFTiyY; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-55b104727c8so116802e0c.0
        for <linux-usb@vger.kernel.org>; Wed, 03 Dec 2025 17:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764810104; x=1765414904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X/jpmwvefl1mqvp+uOSfl3BlWJkpSeUUghpaaV/zL/s=;
        b=LbRFTiyYh8nQ/l+bcZb+7nSurmEEDfCvnCV1cjTchM5q1vrCYEi0MdpS7pEOSHq24+
         SeyzGNsilnVRE1IG+uRqBvZs9/9a/G4WoFNjTbdg8K22VhGd5MthxBC4U6jZqD/HqW84
         lArUt9J0VCvQ+wq2TS48MI+jvMJ1/Mghj45ev3k0aPMVfK/dYr46wvTRvY2ZWS/78E3l
         2VaB6sm+H/UDrYNSk0UcQacA3xMbJKy//j/Pzd5d06eNr68jg6EClVo65SD96zvtrEGX
         5tPCzYMcsUKUzkU1bk1/BSZZ0Cpt1PE1ef7o9ZGUBd9+R2kjAdsfvw1EyN7Gde6zEd6T
         LBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764810104; x=1765414904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/jpmwvefl1mqvp+uOSfl3BlWJkpSeUUghpaaV/zL/s=;
        b=rRs7SYxVcrSQsE69MtEsMv5Y0vB7y+LS4aldDN5kfpxOoNJtyQpRQfsS/SXA4AK54t
         QCpNErk9zHBeNBRZhuoG3gL/clTMcqB1uo5YKOPmwroFINM1jDJYCmRSAHDEC/Mc8lvQ
         vnO3Z9RNAKBf3xDjEXJUAdtx59+zc6YnMSXj47HFgmPZBCI2z6WkwV9oHxBOIPqM8ueL
         9QyOMf6Q33oIMHcqDPOzdZSWIJGXUwjbaeaondblCtf4KhSoXDs9dRqsb01T42VvVphT
         wonVQu5OBYbd3uWA2A6Lbqf2BnRixspMVQRjZErXkskVSWmV/gw9NnKaaG0ns9l6z6Se
         7m6A==
X-Forwarded-Encrypted: i=1; AJvYcCWoQ+rCgG+G+SyFN/79nvQRd+ZFfjLppIJ0rV3UxhJUDjEFz5EY8cDFqVUiWpwzsG2uDo5W4MlpCHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE9tt+lOrlXU6KPtOWeCN0WGQQKsI0O9U/lRXMzV6vxlMqBHvm
	wtYBQFQv/GaGJxn3hFpmxPTCR57yXrPszSCoAioZzEfGTGy65RF9xJIS
X-Gm-Gg: ASbGncuGxPB+1G5PpFUBYoW8BZw7y/ohtdhV2MjLXx58B3mrrjxRFElrWm0hrNoF+B+
	B/RfmsCqVDg8Vp1tyzZfyUHGXt47Q+l9nxzw9ZTXkX2cTbEzT1tL/Rv84ksS4LOledXqKrRthGu
	yA/zzsgBpHpdKtxMeeKDjmzIeHt+Pm3aNNKdYOzg04YhojUo2aC501n291dQ7EVH5Mx2hrRHKgd
	RrVyikd/o7RmvrOlBkiMkqQTNgvPdXx2sgv1Wu42MQxW3Kh72wXfrotoJscMKZdtB4ZIbAaoAWa
	7JlMfXTlgXC+IOm3lEqzW8axzyreaWyeMk3bxfQNuocUTvqIH/YRyZj65v8mcENUF/vIGp11dGD
	sApFo4x48ZFcXMFJlyP9IxZLeOl+GRZgDE8+/WAkQYb38tb5hqFqZtj32MVbvu6fg7Oz/i1Zbx6
	vk2kMQ8kdNJiEZbnlhSHemT8NM5EOc
X-Google-Smtp-Source: AGHT+IGzPdHmI1kwj4OJtIrF7cAk+/qpDFHxaFmgpkFzZAoaCN1mnQwyIFi805Oul4X2uKICOFi4zw==
X-Received: by 2002:a05:6122:469a:b0:559:eef7:3a1 with SMTP id 71dfb90a1353d-55e69b89f39mr301254e0c.0.1764810103365;
        Wed, 03 Dec 2025 17:01:43 -0800 (PST)
Received: from [172.16.226.146] ([98.254.184.207])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55e6c938d9bsm65562e0c.14.2025.12.03.17.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 17:01:42 -0800 (PST)
Message-ID: <ff80d148-fe2c-4198-8c3d-ae92adb20fe3@gmail.com>
Date: Wed, 3 Dec 2025 20:01:40 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] usb: gadget: dummy_hcd: coding style improvements
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 Alan Stern <stern@rowland.harvard.edu>, Greg KH <gregkh@linuxfoundation.org>
Cc: Clint George <clintbgeorge@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, khalid@kernel.org
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
 <2025120200-backslid-endocrine-e64d@gregkh>
 <17845408-4a9c-470d-8949-f4cd0a847615@rowland.harvard.edu>
 <7093160b-3700-4bc7-300e-57f4507dffd2@crashcourse.ca>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <7093160b-3700-4bc7-300e-57f4507dffd2@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/2/25 11:28, Robert P. J. Day wrote:
> On Tue, 2 Dec 2025, Alan Stern wrote:
> 
>> On Tue, Dec 02, 2025 at 06:27:46AM +0100, Greg KH wrote:
>>> On Tue, Dec 02, 2025 at 02:07:09AM +0530, Clint George wrote:
>>>> As part of my LKMP mentorship i have to complete 5 patches as a criteria
>>>> for graduation and thus have focused on working on such
>>>> beginner-friendly patches so that not only do i get the required number
>>>> of patches but also get familiar with the process of kernel
>>>> developement.
>>>
>>> The LKMP internship should be done in drivers/staging/ as generally
>>> coding style cleanups are NOT accepted in other parts of the kernel,
>>> unless you get approval from the maintainer ahead of time.
>>>>>> Does the maintainer of this driver want this to be used for the intern
>>> project?
>>
>> In fact, Clint's changes are small and inoffensive enough, I wouldn't
>> mind having them applied to dummy-hcd.
>>
>> However, Greg is perfectly right that this kind of stylistic update is
>> not something that should be submitted for most parts of the kernel.  It
>> just bulks up the Git history with essentially meaningless cruft, making
>> it all that much harder to see the changes that really matter.  That's
>> part of the reason for the suggestion that interns and beginners should
>> confine their efforts to drivers/staging.
>>
>> Also, remember that trivial changes like this are fine for learning the
>> procedure of submitting kernel patches, but the effects they have on the
>> kernel itself are minimal.  A patch that actually fixes a bug or adds a
>> functional enhancement would be a different story.
> 
>   FWIW, many years ago, I threw together a collection of kernel
> "cleanup" scripts that scanned the kernel source for various possible
> "improvements". Earlier this year, I posted a number of suggestions
> for cleanup work to the kernel janitors mailing, and slapped together
> a wiki page that described some obvious cleanups:
> 
> https://crashcourse.ca/doku/doku.php?id=linux_kernel_cleanup
> 
>   As the first example on that page, look for code that insists on
> manually calculating the length of an array when the appropriate macro
> has been defined in include/linux/array_size.h for years. There's
> still some of that lying around that could be tidied up; for example,
> scan the drivers/ directory (do not make fun of my hacky solutions):
> 
> $ grep -Er "sizeof ?\(?([^\)]+)\)? ?/ ?sizeof ?\(?.*\1.*" drivers
> drivers/hid/bpf/progs/hid_bpf_helpers.h:#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> drivers/media/common/tveeprom.c:	(i < sizeof(array) / sizeof(char *) ? array[i] : "unknown")
> drivers/net/ethernet/mellanox/mlx4/qp.c:	for (k = MLX4_QP_TABLE_ZONE_RSS + 1; k < sizeof(*bitmap)/sizeof((*bitmap)[0]);
> drivers/net/ethernet/intel/i40e/i40e_adminq.h:	if (!((u32)aq_rc < (sizeof(aq_to_posix) / sizeof((aq_to_posix)[0]))))
> drivers/net/ethernet/intel/iavf/iavf_adminq.h:	if (!((u32)aq_rc < (sizeof(aq_to_posix) / sizeof((aq_to_posix)[0]))))
> drivers/gpu/drm/xe/xe_guc_hxg_helpers.h:#define hxg_sizeof(T)	(sizeof(T) / sizeof(u32) + BUILD_BUG_ON_ZERO(sizeof(T) % sizeof(u32)))
> drivers/gpu/drm/nouveau/nvif/fifo.c:	a->m.count = sizeof(a->v) / sizeof(a->v.runlists);
> drivers/gpu/drm/amd/display/dc/mpc/dcn30/dcn30_mpc.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> drivers/gpu/drm/amd/display/dc/mpc/dcn20/dcn20_mpc.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_cm.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
> drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
> drivers/gpu/drm/amd/display/dc/dpp/dcn20/dcn20_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
> drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix) / sizeof(struct dpp_input_csc_matrix);
> drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c:	int arr_size = sizeof(input_csc_matrix)/sizeof(struct input_csc_matrix);
> drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c:	table_size = sizeof(qp_table_##mode##_##bpc##bpc_##max)/sizeof(*qp_table_##mode##_##bpc##bpc_##max); \
> drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c:	for (k = 0; k < sizeof(wb_arb_params->cli_watermark)/sizeof(wb_arb_params->cli_watermark[0]); k++) {
> drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> 
>   There are other ideas on that wiki page for someone who wanted
> something simple to start with that aren't just aesthetic, they
> would actually improve the quality and readability of the code.
> 
> rday


Hey Rday,

Wow, this is interesting. I did something similar when I was a mentee in
the LKMP. I am a co-mentor now for the program. Would you say that
maintainers regard the patches that would come from fixing these style
issues as fundamentally different than the ones Clint attempted to fix?

Also, are your scripts open for anyone to use, including future mentees?

Greg, if mentees fixed the ones that Rday's script cause, would you
still prefer that those be confined to mainly drivers/staging?

Thanks,
David Hunter


