Return-Path: <linux-usb+bounces-23125-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DACDCA8B721
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 12:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AD117A1BD9
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 10:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533C523A985;
	Wed, 16 Apr 2025 10:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cJDTHf/+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35CE1FE471
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800462; cv=none; b=PCsJMjaSDDk52XvPzLmqGMxC6XLe2NhtPVbxrV5Y/oOEIdkfGaUjRVVc56X1vTrYr+rB0aDeuotrnqCZXm7dgSlQyn01wdqgjXVDS3iISgpROWtuRcj0Sfod4d4GkNe5AxV2TwvQo/+Y9HYgevlQPv6Y3NttiXJO4XsSkWFiCxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800462; c=relaxed/simple;
	bh=ow2o755hDN65eNTebJT2nbWi3hUO9mnbMb+bi8mk81A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MnxZ6Y8g1MfL/0BrPsBCpBFmIqIWIrY4DZSfChLTwHSZYbklfokxsg6seMs23KT3cNz4tNkWNYufnifM1++tNnISc3g9EL/SeYY4wuhdVphwbnxKHSWpn+7bIrL69l/IgIY5847XGSklao97K7faehXnDYgcAO59VGiciTg1IxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cJDTHf/+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43f106a3591so5682255e9.3
        for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 03:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744800459; x=1745405259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u11VhY2QSny+fecbKoNk1f06ww5pDVr9wxORHp5CLoo=;
        b=cJDTHf/+pWVgUx8DqpwBLH3Y8KMONQVpKau2JT59QdY7ozVtBT8JWSspC281PV35hg
         lrBxQXzdJiOI+Bz3EDia467lHaUpv7EjDd1xN6D4POIvoJudZyqDD1S7SwV9PnJkJC78
         0W87TYUtHmcyrgQbFCCaj7ti3jDbVLXkO+ftzVPQ2X7Wjv8QttutK2NGpRZSHy6XPXdN
         q9lfhX4wRCKU9opd2QIF51QobbKGPMjkv3x+f+s1kmw8PAOgxHN/mhTDVzY7+QP/2Rkm
         iRNFX2aTyeItg3/MXAom1pKKfFZybdcECWS9F8QsCDnI3qyS/zkPFhiJ/Rq/zApWr8cz
         PO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800459; x=1745405259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u11VhY2QSny+fecbKoNk1f06ww5pDVr9wxORHp5CLoo=;
        b=QX+L50WFElZdgKsTO38NOXEMrOf+5pP479W7E9I7W/OtdwFBOq1MyMV67r9qWL9m0t
         tmODnW027WsF0fVz+MN8UWsJs72H+/R7Ed+O+JhMSFqT5e4oPOOsyzSOAtwrBR9rUw4N
         PacNgnf9e9eNT7cQ7V01EkP52/sduCxPi/c92gBoDsjxzoSfVxLUOpcWF4B0tlbadpot
         haxI7r5JWKjEeaTcqQO3erhnwvY5N6H/PxoeDg56rCzm0EbugJgAPlOkIWhONFaE8n5a
         5HnkObJynHCVSluK0oETSUFOqNkTAwiObq1dl5CjzxmcnGu3B/I3va2f6sobiDP4RtKO
         xoAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJsG0gSR3xauLnoPxCWmowBxVvODsVL+E3hqvuyo5D6oHI4Qnk7o3dDbpFAz8aHen3oy/BfZfVMrM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9VeLNWzyZ6aDI+yd94c4/ktoFtmAnbZhOEoK0uYfL+UJ+KfbD
	CCNuiDxavAnuI1zDy0RC3TZkaSxFk8ROBgi8HiJRtBFsPzsAVr1wqxZ5dTKJz38=
X-Gm-Gg: ASbGncu74OxrD0NjV9ohT1XC8ArqTcXFb72ISF3p2pXw5fRjJwK0nPFTTnW5Ser7rYe
	AwmcT6cOcD/9rF6p0m1mKaFnhLOpF36DRy/0lRINRe94Tc5MlcjLrX2XiOJGDqEW16lfUZqDgYv
	2neEKM/5RYkpHBs6vT59UN3kBjsC04w7HF8n6iBc/7YJO3BkJ2zIUbePAGN21oetwFgkGbW8pJR
	vOHaoK8G4eYKasDZQEiGUMA4BuPhyUEsAPwLoPT898q9LGd60s9n9kD+3Y5Z6EyCz/RYZ3Mi+du
	ORUaTZMx4dGeIAlz/eN8U/ruiUY4xkxYa8VwrSe3mfQPgcBd2qunXL5ZDj3daqLZo2S3p+ji9gZ
	YUx4sBo7NFFYPfkfc3HJODFY/oHMd4A==
X-Google-Smtp-Source: AGHT+IHN01zeHrDQJAoZP6S+65R35C5DCBsqv0lIu9aVzxX6MmRnNY/NfVUsXR6If1SQjV7jJzSkwg==
X-Received: by 2002:a05:600c:5109:b0:439:90f5:3919 with SMTP id 5b1f17b1804b1-4405d69bbd8mr5267555e9.4.1744800458781;
        Wed, 16 Apr 2025 03:47:38 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405f583bcesm5289655e9.3.2025.04.16.03.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:47:38 -0700 (PDT)
Date: Wed, 16 Apr 2025 12:47:36 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: warn if a GFP zone flag is passed to
 hcd_buffer_alloc()
Message-ID: <20250416124736.3ac2bd55@mordecai>
In-Reply-To: <e23e72d7-e50b-4a16-b47d-5dcd7cf49641@suse.com>
References: <20250320154733.392410-1-ptesarik@suse.com>
	<20250325134000.575794-1-ptesarik@suse.com>
	<2025041110-starch-abroad-5311@gregkh>
	<20250414090216.596ebd11@mordecai>
	<522b3049-8e7f-41d4-a811-3385992a4d46@suse.com>
	<20250416094807.2545efd8@mordecai>
	<e23e72d7-e50b-4a16-b47d-5dcd7cf49641@suse.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.48; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Apr 2025 10:45:19 +0200
Oliver Neukum <oneukum@suse.com> wrote:

> On 16.04.25 09:48, Petr Tesarik wrote:
> 
> > Oh, I do, and that's precisely why these GFP flags are no good. The
> > address (and other) constraints imposed by different buses may not
> > (and often do not) match any existing memory zone.  
> 
> True. So we currently have a non-portable series of flags.
> It would we better if we passed a hypothetical 'struct mem_constraint*'.
> But we don't for now.

We don't have this struct as such, but all required values are stored
directly or indirectly (dma_range_map) in struct device, which is
already passed around.

There's merely no mm API that could allocate based on these raw values,
so there are some ugly kludges to cope with most scenarios.

> > However, zone address ranges are determined statically at compile time,
> > or latest at boot time (e.g. arm64). It's too late to adjust the limits
> > when you hotplug a more constrained bus at run-time. And I haven't even
> > mentioned bus bridges which add a non-zero offset to the address...  
> 
> Yes. Hence the only time somebody would pass a flag like that would be
> on very arch specific code. That means that such a developer would be on
> his or her own. Hence I'd say the simplest solution is just to do nothing.

I have found no such thing in tree (with the exception of s390-specific
drivers, mentioned elsewhere in this thread). But whatever is possible
with a GFP flag is also possible by setting a bus limit.

If I stay with the USB buffer allocations, AFAICS the mem_flags
parameter should be used only for non-zone flags. If you specify,
GFP_DMA here, it will have no impact whatsoever on allocating DMA
buffers. It may unnecessarily allocate from the DMA zone for doing PIO.

Now I think I should really write an article for LWN to debunk some
myths about GFP_DMA.

HTH
Petr T

