Return-Path: <linux-usb+bounces-7830-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A12B8785F3
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 18:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DABE1F218A7
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 17:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C96487BF;
	Mon, 11 Mar 2024 17:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=totalphase-com.20230601.gappssmtp.com header.i=@totalphase-com.20230601.gappssmtp.com header.b="ZW3M3qti"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B088482DB
	for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 17:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710176594; cv=none; b=Lzps8N+iHlOPt5MiKenpmGjIMQRZrksRvmkhk/0NEL8NOwIhlxgTqMk6Sa0X/4FQxx6InsbHvVfsNnfKRlJkr+rkA3dupHwYniAEkCyXjAL6ax1ODo+new7CXiOngTmpa9P/Q165soKBIxMBA6NvKT1olppvlZ7tzd4C3jKFCq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710176594; c=relaxed/simple;
	bh=agaJq87etNffqdB6IMs5QiSDbY44VKyrosXTgjFI/t4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=nWWgOvqRq/zYHRlu27JjZg53O+XO4VwnIepeQks5PvfzUNTVIK3miDrxvDn26P+1hLCnqfYU6YI1kkVu4P0cl5TGjZhzRm2gHkSeHg4OFAWXH2V7KLQp/TynbMVRtbI2vgEdzU2YbikbzfLPUiIirqPFAAB9W51lQaVYLdEnEBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.totalphase.com; spf=pass smtp.mailfrom=totalphase.com; dkim=pass (2048-bit key) header.d=totalphase-com.20230601.gappssmtp.com header.i=@totalphase-com.20230601.gappssmtp.com header.b=ZW3M3qti; arc=none smtp.client-ip=209.85.210.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.totalphase.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=totalphase.com
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-6e5c0be115aso3002475b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 10:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=totalphase-com.20230601.gappssmtp.com; s=20230601; t=1710176592; x=1710781392; darn=vger.kernel.org;
        h=thread-index:thread-topic:content-transfer-encoding:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=shpVNyKeSTmB1beltwD0e8eAjAeqYSJLBZ+0bq/aWSk=;
        b=ZW3M3qtijUUIc+jXwItIq86R8k7helNDjK68pZhvrupx4gLTNt1Q/6P7knjha9e9U8
         gmmyNJ7FArIpUBZCtq2icluDdvFX8gGe9YvE3N8/aqf2MB+U1erBTRGczbYdOZ6booY5
         hcZzdUXuFNMiJhhQoX4q0V3TWUwZTlkIqXep7Fy888kX3OU1JsPHTwgvqPTX+tJcdNVa
         jzZRXsERK4vebJkWXQW4Mho0vp4C+rT3tdEYS6M5uM0OjpUwgy4NoqSQaSuZ48cyNaYH
         Us2aiFO7DcV7e073S1NTo5yEGHfN6M6U7Psbxhq+H32vpn3Qj5nfaqV7cywNBI26MyNJ
         znzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710176592; x=1710781392;
        h=thread-index:thread-topic:content-transfer-encoding:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shpVNyKeSTmB1beltwD0e8eAjAeqYSJLBZ+0bq/aWSk=;
        b=XdCeQEfH0jg5g5c7v7d/Nz0TafmkJ88TtaKV3UzYMH6jXaHghBMpEzJFfOcOeGx6yO
         qKZr65WAcUz1lvmPi/iTD0rJgVM3dieskp4hmHXHXAkZZNzILaTKSg778hI8qLiaNydm
         Y+081FMsZqfMn+ZNEdYjMywkHZwxerQuDtoWwT1cN5evcx6rHNZfRg3EqzI6M7vWfBdR
         wyRLJuFYkhRtwGvD7LXq3yPGBtuqtGOv8EWRmEaNAkJk0pzk2V2ujjFw5VISwu8bxjH3
         jn/uRT6WRB4Pt0rSUs1i23W/xNgyvAKTHyfxVHBORyiPtpAFIYGw2tk1IHM0cW9XCnOi
         tsMg==
X-Forwarded-Encrypted: i=1; AJvYcCVs3huZmivo3vsoJWUOAye+ovSs5IwVH5kCVnWl/EPLPnCxEZjcC+TYrNH98NBTnBVaFRg26QlW450mcxkPyVcHAPTS7sSY67JB
X-Gm-Message-State: AOJu0YwTORQwQ+4e9pcKoUjEVMRNlYnolu+hIgTQOv/LRP3BpwwcCn0G
	KHsS1JVQw+GTtdviRtVYXFTvRHpzAdmEp6F+CiHT6xvL7GLG9l+nQPY7Pzo8JM7MwzMajoiHX3+
	rrAV7aIjuFZNr2GvUGcGJE1dFPEpyWHC8
X-Google-Smtp-Source: AGHT+IE9dy7qP1AWuyzDV9+vOmVP7Cxxr7MyciseHsVaUm/V7/oyEVUvRITXAfD74JVyYFkequ25w9vWrbam
X-Received: by 2002:a05:6a00:22d1:b0:6e6:9812:9c03 with SMTP id f17-20020a056a0022d100b006e698129c03mr2384694pfj.31.1710176590780;
        Mon, 11 Mar 2024 10:03:10 -0700 (PDT)
Received: from postfix.totalphase.com ([65.19.189.126])
        by smtp-relay.gmail.com with ESMTPS id f14-20020a056a00228e00b006e698eaa3fcsm122133pfe.3.2024.03.11.10.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 10:03:10 -0700 (PDT)
X-Relaying-Domain: totalphase.com
Date: Mon, 11 Mar 2024 10:03:07 -0700 (PDT)
From: Chris Yokum <linux-usb@mail.totalphase.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	stable <stable@vger.kernel.org>, 
	linux-usb <linux-usb@vger.kernel.org>, 
	Niklas Neronin <niklas.neronin@linux.intel.com>
Message-ID: <1525093096.37868.1710176587331.JavaMail.zimbra@totalphase.com>
In-Reply-To: <717413307.861315.1709596258844.JavaMail.zimbra@totalphase.com>
References: <949223224.833962.1709339266739.JavaMail.zimbra@totalphase.com> <50f3ca53-40e3-41f2-8f7a-7ad07c681eea@leemhuis.info> <2024030246-wife-detoxify-08c0@gregkh> <278587422.841245.1709394906640.JavaMail.zimbra@totalphase.com> <a6a04009-c3fe-e50d-d792-d075a14ff825@linux.intel.com> <3a560c60-ffa2-a511-98d3-d29ef807b213@linux.intel.com> <717413307.861315.1709596258844.JavaMail.zimbra@totalphase.com>
Subject: Re: 6.5.0 broke XHCI URB submissions for count >512
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Thread-Topic: 6.5.0 broke XHCI URB submissions for count >512
Thread-Index: VuTzduXODhc7IqP5hozJk2GPpe5bnIAKY5/B

Hello Mathias,

Thanks for the help with this! We saw that it's made it into 6.8. Is it possible to get this into 6.6 and 6.7?

Best regards,
Chris

----- Original Message -----
From: "Chris Yokum" <linux-usb@mail.totalphase.com>
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: "Chris Yokum" <linux-usb@mail.totalphase.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Linux regressions mailing list" <regressions@lists.linux.dev>, "stable" <stable@vger.kernel.org>, "linux-usb" <linux-usb@vger.kernel.org>, "Niklas Neronin" <niklas.neronin@linux.intel.com>
Sent: Monday, March 4, 2024 3:50:58 PM
Subject: Re: 6.5.0 broke XHCI URB submissions for count >512

Hello Mathias,

Yes! This fixed the problem. I've checked with our repro case as well as our functional tests.

I'll email you the repro code directly, you can compare the unpatched and patched kernel behavior.

Best regards,
Chris


----- Original Message -----
From: "Mathias Nyman" <mathias.nyman@linux.intel.com>
To: "Chris Yokum" <linux-usb@mail.totalphase.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Linux regressions mailing list" <regressions@lists.linux.dev>, "stable" <stable@vger.kernel.org>, "linux-usb" <linux-usb@vger.kernel.org>, "Niklas Neronin" <niklas.neronin@linux.intel.com>
Sent: Monday, March 4, 2024 7:53:03 AM
Subject: Re: 6.5.0 broke XHCI URB submissions for count >512

On 4.3.2024 13.57, Mathias Nyman wrote:
> On 2.3.2024 17.55, Chris Yokum wrote:
>>>> We have found a regression bug, where more than 512 URBs cannot be
>>>> reliably submitted to XHCI. URBs beyond that return 0x00 instead of
>>>> valid data in the buffer.
>>>
>>> FWIW, that's f5af638f0609af ("xhci: Fix transfer ring expansion size
>>> calculation") [v6.5-rc1] from Mathias.
>>>
> 
> Ok, I see, this could be the empty ring exception check in xhci-ring.c:
> 
> It could falsely assume ring is empty when it in fact is filled up in one
> go by queuing several small urbs.

Does this help?

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 6a29ebd6682d..52278afea94b 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -332,7 +332,13 @@ static unsigned int xhci_ring_expansion_needed(struct xhci_hcd *xhci, struct xhc
         /* how many trbs will be queued past the enqueue segment? */
         trbs_past_seg = enq_used + num_trbs - (TRBS_PER_SEGMENT - 1);
  
-       if (trbs_past_seg <= 0)
+       /*
+        * Consider expanding the ring already if num_trbs fills the current
+        * segment (i.e. trbs_past_seg == 0), not only when num_trbs goes into
+        * the next segment. Avoids confusing full ring with special empty ring
+        * case below
+        */
+       if (trbs_past_seg < 0)
                 return 0;

Thanks
Mathias

