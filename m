Return-Path: <linux-usb+bounces-23113-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7890AA8B436
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 10:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2DA51895EA6
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 08:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0E4232379;
	Wed, 16 Apr 2025 08:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IOtaqNiy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B51422E410
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 08:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793124; cv=none; b=TN7PjOlTEJFET7eo8DyZ86Dw1ZHynyTN7cGDNYPggFVYwIJLPkow9i9NkOdlOtRcoGdofH2qDrcv2vWW/2Brt1b7e+mjaof1qLMiKYR7tn6gboMTyvIyE09kgkujrprI1izp8KKrpkc39anSHfO44VchV09PbpdgRWRIJvvDX7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793124; c=relaxed/simple;
	bh=7U0tMRP3cRkwaU9kSWjymsTfcQX3Lo9MnZcTIGj2fAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L3TaWm9Eyq4/6dA4OqtDxzeSqY0WDiNCfj95Lx++nxdCq8iwGunYjQcXH8NSeUXsQbm75AelZ+L1uY9oPBYZsT8hRE3aWfgy8TL1zYht8aq1qadxm9FCfwZVK/X+F77PO3U9wT438iNJPx7Eo1g2B80P36hwL6AeBreELRSpKik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IOtaqNiy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso66424665e9.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 01:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744793120; x=1745397920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rm7tG3FOphdGA/j+BS+chZSTAKzpNK7JzyptgTuNxfM=;
        b=IOtaqNiyPnKatFuTBgU+NF331pQrlZI6EsXwn46HKd2FQJFa2t8llUrb86VYcRz9at
         u2QgFXMnsWhXVmZnsmQ6la616pV4Bn7rHOaXdPe0XGEW9sutQmnDVJTZyksXYr9Tc2f8
         hZkPTYugzgfvm8CXyhzLSjVcS5fJCjmcbLHmCv67aS22SIznTETduWmCKVoDvL/hFzFc
         pirwnfTywGp5lMLoP6lRQpwKzMi5rrkhRLbcNZljMCOihXt0HoTSI72li8gBnbJ+o8Tx
         fwpYkDdEY6QffzFYnmF+lQqWmURZbdZRG1c/CHPnbCQdjQZX5Fgg8WgJx0JLuPGJfo/e
         9Zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793120; x=1745397920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rm7tG3FOphdGA/j+BS+chZSTAKzpNK7JzyptgTuNxfM=;
        b=LuEixL0HFNTo8wyFFqmTmIeYRYLFv7ym7XkDuOgvMGqraXrvIol8AE+7YEq++dBv1y
         djNr6KgazNhmnzf586Q2NNBDYYdycMZDqe5wTSYyLXYhfVTj63GHwYPa4EOaHXak2+h/
         YWoqgIcp9fAwpPYffmw/vdhtzcYE9bHHpp8pFcihVhAoIeDYOshoauNC5GBLRy42RVk0
         HtxBN3/LjhASRA5UwmN7R+gAbu04V8oTcah0RwrGumy3z0x8K4c/8iE46MLksFocLI5X
         /tJgPiM2wvs9MrJIUMWxOYq1UtCGqPCBIcqmXWif/tzgGaOrMVpRv8hV9PCVlSXgiVfu
         1Leg==
X-Forwarded-Encrypted: i=1; AJvYcCVfOG/09SychXdFhKXjbKHwRLp+6fvhi+emFUNVcD2pPnGdjjcXQs9H8GL41KoyPepX0SRbqZJ2Vb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL0IUY4btO9NTljoIY4VknHej+O14jq0P02i3C1uDNn3S9qYvr
	khHTQUk2unfo69yYsE6qUpBlgPei1YXfJJ62Uwl9+TOpH4qPCnlqnnLjaPl1apRNjnSr7Tgmnf+
	E
X-Gm-Gg: ASbGnctS9JoKdXF/WN3GgXJmpm03ZnshW8ji6OtwnI4RqufEKSCOvhXz2sJXWLHuA3+
	wRSTD9B2QVOE/8XW6PNv6QHWXG9VjVJic/RwWUp0+tjOItcl8J6DGGzCf0RGHV1WPOJycAUPWvG
	jsRVVb+6dDA74fQzRj2BRhf2hPEKSGogt6bIVCF2RCzKdxr707wOd1elL1JG477LfrTFVTt1rqi
	j4hEbIwP0xJCAHubG1aHm51UpaWRXauzLlkP3ebB7+iG4Zs+8G3LyucREjknvqyrwR/goowcDL3
	sG1hLEtry10CT8XtnENo+0mFUvWd44I+E5RIdrnCWe15AlPn8U5/zHYotd8gTQtrf7JYGuxN/nG
	X9CtJQCs1vWzpbALMmQ==
X-Google-Smtp-Source: AGHT+IFy5QK43QuY6+hL98yAwj/BBHMpOeHx21JKXIFx4oqw7yW/szR2O/SwGayufdYEXrjfYcb8Wg==
X-Received: by 2002:a05:600c:1912:b0:43c:fee3:2bce with SMTP id 5b1f17b1804b1-4405d6ab5f5mr8481255e9.26.1744793120203;
        Wed, 16 Apr 2025 01:45:20 -0700 (PDT)
Received: from ?IPV6:2001:a61:1350:fd01:ac0d:cf4f:2906:b446? ([2001:a61:1350:fd01:ac0d:cf4f:2906:b446])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d3453sm14290285e9.16.2025.04.16.01.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 01:45:20 -0700 (PDT)
Message-ID: <e23e72d7-e50b-4a16-b47d-5dcd7cf49641@suse.com>
Date: Wed, 16 Apr 2025 10:45:19 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: core: warn if a GFP zone flag is passed to
 hcd_buffer_alloc()
To: Petr Tesarik <ptesarik@suse.com>, Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250320154733.392410-1-ptesarik@suse.com>
 <20250325134000.575794-1-ptesarik@suse.com>
 <2025041110-starch-abroad-5311@gregkh> <20250414090216.596ebd11@mordecai>
 <522b3049-8e7f-41d4-a811-3385992a4d46@suse.com>
 <20250416094807.2545efd8@mordecai>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250416094807.2545efd8@mordecai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.04.25 09:48, Petr Tesarik wrote:

> Oh, I do, and that's precisely why these GFP flags are no good. The
> address (and other) constraints imposed by different buses may not
> (and often do not) match any existing memory zone.

True. So we currently have a non-portable series of flags.
It would we better if we passed a hypothetical 'struct mem_constraint*'.
But we don't for now.

> However, zone address ranges are determined statically at compile time,
> or latest at boot time (e.g. arm64). It's too late to adjust the limits
> when you hotplug a more constrained bus at run-time. And I haven't even
> mentioned bus bridges which add a non-zero offset to the address...

Yes. Hence the only time somebody would pass a flag like that would be
on very arch specific code. That means that such a developer would be on
his or her own. Hence I'd say the simplest solution is just to do nothing.

	Regards
		Oliver


