Return-Path: <linux-usb+bounces-21757-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A670A60AD8
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 09:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBA251712A8
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 08:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD4319644B;
	Fri, 14 Mar 2025 08:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yny254DK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0E2194137
	for <linux-usb@vger.kernel.org>; Fri, 14 Mar 2025 08:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741939846; cv=none; b=qEk1e2aq3qZ+2y78XDk7ss5nv8WhxNtyC0xjPxbaFqynepFMxUp4Q9UpHQ8rInrrupiRlvnmUaPcPnD+Kc6xxx2MgAPRiMpshbPr1VvIsfN389G0yp5EhzFqCI4DQy4gAhq2Q6iS6x1Zph3X+3JU/SQVkMRyTXfMy8TNlHsEDB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741939846; c=relaxed/simple;
	bh=BDnSg/NsVoUslRbgAUYskgPTGLJtexWyUc83cGCSkc0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PPdV06djH5FQTMVZBSyGCk9J3OooeovkgVdwy7EohyLRuBYcUFI/VgNUpwiThdc/JBcqc/GTcK0vojN2LUtg7mSBMCf8KrVp4TYKCT8a0UqmRwGvpyXskP4bGoZWMDI61Nqa3GFrPVppjTcZDAFOa+FLWG5EOc28bZEq0sK4bWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yny254DK; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso3223624a12.2
        for <linux-usb@vger.kernel.org>; Fri, 14 Mar 2025 01:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741939843; x=1742544643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIGbIZ30H6V6SSEPhxYinWsZNnbsCZ8RPQRpNQ2FyO8=;
        b=Yny254DKINOEQ9IshZd8bHmaylM/YDxH3mzcjMbcSpyuP/BSAcUNQfQo5OyKySSqbm
         rUJwLmJ+fgQV5eVx4TOxz3IzD7UOMP1kthFkSjF+e0UFX+vL8hPwcrh7Wv0rkM9bkUtm
         Y1Eq4zDxpaKnKkmItspDllBUcnj7tN4K8OXdjoZy1aUGBahX3YVciN/IjzHGVe6HN2EO
         +DpsDT46FO5Gu/1qB3nYrMWKt5YTsaWVmQh8LwQFoK95wY7nFU3j5a449HQcI50VEZu5
         gRSgyFNhOr/tlH3Qip9uiuKl596wtT7q4qSN8cqj62Mn27a+fZAoIOZ7eFRE4TVxNPv0
         ksfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741939843; x=1742544643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIGbIZ30H6V6SSEPhxYinWsZNnbsCZ8RPQRpNQ2FyO8=;
        b=KPlKFZsVxGN5LVt1tMr32rv8iE98R0b/bvCwfu2UXQ5oWaciTFgzgkA6M+F/NS735r
         63SEyw4mWJbg3rYqsj6QJR1hQjPaWdguRr8/xGqJXhURhn2fdnLrauc/f6QJnMl/L7j3
         eDPMd+hqozBTvcMhEDmUIkZXDB6FMwaWxNV/ocRvYJZcamyHgFVetP1Pqz3PA7Wp7njJ
         DmrexsHFj5ePRWGJBQmXfZGEWPzTtnjRKS4ZIyI1vLj8+JlczbCon8jEH36hcKw16s8K
         LkJHI9F6w7ztpj/oA7KTl/fCbR+Q3kJCgPX+max61i66BWJEaZ5qfgmRcIFU89HsH+X2
         +rKA==
X-Forwarded-Encrypted: i=1; AJvYcCWeUqyr03jDUT25Su9nFIwZUuvI2b34OTDxeNfT10j3fiWZ9qmBqESHjbrP9PGq/ASbP6MEetaFETA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe6JzotKSAxXgIIO+Io6aYxqEZikAWT5ybhhvT9MO+H7/2ACDE
	qd6j7haVuNHj5CnKpn2wxUhGVJ4MxAfX7X67kwTBJpnHHQ0hGTgj
X-Gm-Gg: ASbGnctV2NiT4/eC8tG6NFdYvgQhunj0ivExWKKrt2Wfg6uOMwgPCohxOg6jfdaPWv0
	vas7YRIMBpMNP7rXP3eoX39vRrQCSUl2M/6HiDTSwSQHySOGf04n+e9GGhBYS09PyPpQagXfJ+e
	Hu+Igt5pYMJbntgltqhzyuQu6VwSx3jf4ieUmbA2nBZfcw7EOfwFUFw9vzm2N+3vdXDUM4SMZqt
	X0SJsV5+fYOWlrp6TyWyeRaAvyCppOkgGAtRvseTUbU0/EV4xIcCQjmEe58EWMLtZlFnoMEf+UL
	mqBu1XxvzODLaM8aJXzlYn04PzTDcwy3kZDeN9s8Q4/7TrfUGOir7IOrQJY=
X-Google-Smtp-Source: AGHT+IFQDNCvTAwN9zGJGpLJgSspWdAskoO1jR3CmmZWGM33nQibbAFiIyPo54ZzuX699Gv5C7JJJA==
X-Received: by 2002:a17:907:7d87:b0:ac1:e00c:a564 with SMTP id a640c23a62f3a-ac330397ccamr164007166b.38.1741939843229;
        Fri, 14 Mar 2025 01:10:43 -0700 (PDT)
Received: from foxbook (adth23.neoplus.adsl.tpnet.pl. [79.185.219.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cfbbesm191048366b.100.2025.03.14.01.10.42
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 14 Mar 2025 01:10:42 -0700 (PDT)
Date: Fri, 14 Mar 2025 09:10:39 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: My transfer ring grew to 740 segments
Message-ID: <20250314091039.1c056383@foxbook>
In-Reply-To: <f72545d9-a892-4101-9d06-c75979aecbe6@linux.intel.com>
References: <20250311234139.0e73e138@foxbook>
	<20250313094632.037db6b3@foxbook>
	<f72545d9-a892-4101-9d06-c75979aecbe6@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Mar 2025 11:45:30 +0200, Neronin, Niklas wrote:

> IMO the driver used to print a long and repetitive debug message,
> which is why I changed it.
> Admittedly, my design does not handle hundreds of segments well.
> 
> Before:
>   For each segment or until the segment containing the TD end TRB:
> 	"Looking for event-dma %016llx trb-start %016llx trb-end %016llx seg-start %016llx seg-end %016llx"
> 
> After:
>   "Event dma %pad for ep %d status %d not part of TD at %016llx - %016llx"
>   For each segment:
> 	"Ring seg %u dma %pad"
> 
> Probably, would have been better to loop from TD start seg to end seg.

That's actually what the old code did, it only printed segments which
contained parts of the TD. Usually one, sometimes two.

New version always prints at least two lines.

I thought that maybe you wanted it for some reason, but if it was only
a matter preserving the old annoying behavior, I think it can go away :)


Regards,
Michal

