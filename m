Return-Path: <linux-usb+bounces-14240-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 878CA962B01
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 17:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 440E92853CD
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 15:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24C619AD4F;
	Wed, 28 Aug 2024 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifNgOz8h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B957617C9AF
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 15:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857339; cv=none; b=pfWo9jANJxRw//WCUGfYV0u5ZObN6Kvv86Osor0yDmRC2CK4FKYQRtpsFfBotfC62ju63BaroGngHvqzTDE9aY31kQkWpmpoK2Z2SCbyvy4LXlpqGR5V5tdEqc/TbFtWI8mT+X4glcyJ06bspWyLSKWkYDq80aOTBE2JOHablNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857339; c=relaxed/simple;
	bh=fdmoeZpmRwxguM4S7sonzTEWCvDhpI1PW01QmtVmt9s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O/ZY+MX7z8CVeqLGC3jj3h6/RMg26fiSP0Wa6vh/n41XKcbseA+JPFeIhz3FQ21pLToLNilr+zb2are6qz2IqS7j2mJCHJPVoMcBmgjNcG7KTSwOuy3mmA9TWWhc8arP94O+V83RB5jFG8lAhsP9jbDC6wtRJG3CiWPSHYWKJSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifNgOz8h; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53346132365so8188829e87.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 08:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724857336; x=1725462136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knMFF8nzjVX/q5JCadhibHHQRx8JfqSKU37Wfx4vXhs=;
        b=ifNgOz8h/57/5NDLRleylUq/jqLc3uap+qPgTXvOOqMOAZX0t6t6T3FSlO99hDh4Mz
         0ZuBXDDfgrjkYbrP15yMTLcDxRZDf7bzMjTPcCw1H3cQsmei6vrptupMTezdSNjxsCfH
         /9km3VGFEHp0QmHP3o3csqk9DCQLPA7IF7Vh1mEt8kEqJie9KP4mLKYH/mXIxC79+QEW
         dBoZbeuMES8+CjajbuLLib4hc2hSOIPvwLYl1UV0cS86kRmd7cM+2XThrBrPeA8Mt5xG
         9Nu5qmCDK+5eQ66E4ObXTw0IkVGi3maXnvUqKUHh/dXw0o8uadxVDAeFNginLIPxpFGq
         L65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724857336; x=1725462136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knMFF8nzjVX/q5JCadhibHHQRx8JfqSKU37Wfx4vXhs=;
        b=B6mvsz7zTrSruwr6Qk/GwCaMrw+rIsUDgJCTTli0wxc1Lnu3IydLQP7YUoPIIidKHR
         U96BQyYWYkDkgT7J0xh4QXE6MOJ1Sso2pX7A6jPrLbGZalrc8i9kyaWyiFE0T+aAYxqN
         ssdX5awtnAD7qD2oYGjkug+DACkHgoXUiQ5NXDQO1CpKqJJZCPnTAoibMX5TR1pzGJSH
         NLAC5xTEnZcCd6OL6XNbIly1BTWSZ2lM5aaWRSVVahsWfn5V+/GAYic0aISWuYaauzTx
         TJ++v4ghdPyo40IM6KHFAfWw3mp/PLrWGTFLFJDigYN7YJeeX6zpMHBd+vmeEXj7cM31
         URhg==
X-Forwarded-Encrypted: i=1; AJvYcCUSS3V0s0rhsbJZ3i3HmwTjAwh/nDfE0UWb4FZ+R6LDNSzCHJ4C6TAGvUaQZ6zSaH3Jr5S8cTQBBzA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2a8sDTrypbfatAtfGK7Sw97nS+TR82sYeHvOms6vtEgKMNIYS
	3EctD9oPCfS7WUz1dpUhBHlVmi9cEbZWB8qZpISSaYSjKJ7Xy/w29O57eW09
X-Google-Smtp-Source: AGHT+IEQ7SzGNG9vE0GagCV9YQ5MhkL1ViweW0O7SfdK7AhH6qsNdPuhDWuXVFnSVI03YWSU06JOfQ==
X-Received: by 2002:ac2:4c46:0:b0:533:7ce:20e0 with SMTP id 2adb3069b0e04-5346c3f91acmr1843251e87.8.1724857335149;
        Wed, 28 Aug 2024 08:02:15 -0700 (PDT)
Received: from foxbook (bgu114.neoplus.adsl.tpnet.pl. [83.28.84.114])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea5da7dsm2207982e87.223.2024.08.28.08.02.14
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Aug 2024 08:02:14 -0700 (PDT)
Date: Wed, 28 Aug 2024 17:02:10 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH 0/9] Various xhci fixes and improvements
Message-ID: <20240828170210.37406d48@foxbook>
In-Reply-To: <39d389c3-1b3f-4a11-a40d-5c2eb46096bc@linux.intel.com>
References: <20240827194625.61be5733@foxbook>
	<39d389c3-1b3f-4a11-a40d-5c2eb46096bc@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> We are in the middle of reworking transfer event handling with Niklas
> as well.
> 
> I'd be grateful if you could take a quick look at our solution and
> give your opinion on it as you have expertise in this area.
Beware that I may only have enough of that to be dangerous ;)

But I also have a few of those PCIe cards with various chips and all
three public revisions of the spec, so I'm trying to stay in spec and
verify things on hardware.

BTW, I only really touched isochronous transfers so far, but it looks
like some things are not entirely right in others too. The handling of
short packets for instance - it looks like TRB_ISP is set on various
transfers, but process_xxx_td() functions don't care if the event is
mid-TD and give back the URB immediately.

I though about fixing this (I have a naive hope that some xHC crashes
that I see are "undefined behavior" caused by driver bugs, even though
in reality the hardware is probably simply FUBAR) but I'd need to read
more spec chapters to get there.

> Main idea is simple.
> If a transfer event points to a TRB between dequeue and enqueue we
> give back all queued TDs passed up to this TRB.
> And if the event points to a valid TD then handle that. (normal case)
> 
> Code is much simpler, we get rid of skip flag, and could probably
> merge error_mid_td and urb_length_set flags into one flag.
Yes, lots of things could be better if the code walked the ring from
the last known dequeue to the current one and analyzed what's there.
We could know if the event is for something that we have already freed
(a bug?), or for any known pending TD and which one exactly, or for a
non-transfer TD (like Forced Stop Event).

Many of those thing are currently detected with heuristics which only
work about right if everything goes as planned (no bugs in HW or SW).

And first find the TD, then worry how to handle it. I like that Niklas
managed to shorten this giant loop already, and my patches #2 and #3
shorten it further and move TD selection logic up (#2) and all else
down (#3). This way we can work on selection and handling separately,
with less worrying about how they influence each other.

> The code isn't complete or tested yet. It doesn't handle
> under/overruns, but that could probably be fixed by just turning
> "return 0" for those cases into "break"
Problem is that not all events give valid dequeue pointers. These two,
for example, are not guaranteed to. Then we have no idea where on the
ring the HC currently is. The EP doesn't stall and it may have already
been resumed by a simple doorbell ring.

Regards,
Michal

