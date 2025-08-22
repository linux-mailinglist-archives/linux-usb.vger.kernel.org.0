Return-Path: <linux-usb+bounces-27170-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C3EB31180
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 10:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99C181CC030E
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 08:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A7F2EAD0C;
	Fri, 22 Aug 2025 08:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THw4wQg0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DED9286893
	for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 08:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755850522; cv=none; b=ml1Ukp2kGRDw+6kiyfkjCa5+p3GvuS1yyTVvnWN+YwMZTvzlyoshIT9ZEzoFmhbn81DbTnmhvBATnbuWyloNBN9AQ//4+AZxpTckDRITFnIWSePfWQV4HS9B844W7XdwI75lRMSkg3P+hQh9c3IcArpELxGawVHnDdkR1zFHsqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755850522; c=relaxed/simple;
	bh=aCsEKRYCO0KudoedKT6YPVsd/z//Lsl8KaXJaHoYf1U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W6bN3h+uDJ0S0w8hWF+ONgs5nDNzhBK9Qs/oxeTWIUrQ7xrvsata0r4NMeW+gcVHQBigLhK9rc/CTaA7X5YF6NcCr9ZGJTVTTE/lSOqBO9d/9yFZ5MqQmctAddAhC/KUbXJbPqxRVEtMMcIJunbVrMgvMguErdRYAAONV9KrzoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THw4wQg0; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55ce526627dso1943487e87.3
        for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 01:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755850519; x=1756455319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgTFYHJr6Db/0MurC7jJ0OzcRevn/S7VhcwOJgr9Xj4=;
        b=THw4wQg0wfXadbpWd7qBUgAEqgtVwIpS6IesKNbFjECjhi5YLnPhh6SSHrI66XFuQu
         ff4u6wxM1DjLj95Z1NmwL2Ytjye0POFeANycfKr1Omd6hc7PaFmhnfpjvxrXC2wwMQ74
         C29ox7ihToflca1EHqBoSVG34vplW8R0to83IKUkfD6P8yNHLk5+TPyDcccdwkxlKrkc
         Zir5B34jcRfvPzTjJBImJ97cC9GB/s3nd5ux9hijOtly+q0+khylLNy9biAg1T2lqw02
         lreqsHiupq3qy5EsVJw8z/ol95EXHyOt2O+ByaBCkoLvmNyDYp6pWL1jPthThRRfIpyB
         Nnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755850519; x=1756455319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgTFYHJr6Db/0MurC7jJ0OzcRevn/S7VhcwOJgr9Xj4=;
        b=XHPRPsOV50mtG96Fx1kQY9C4HMeIcE8Nj5oPHrUl7W90CRitJLLleoH7aA9SG69zRY
         zPsCXpTL3RDLjtDHuSFPowdvq9vANqqlLjRLiYMNysHbeTu7u90I6V/C7GCxvMp1IWbY
         xBgCZD5q6If8IDRl/lX/1RPvI/SEDbTeJuWGdVwmKhuaytWaclDIU3rQkkwKNRQPI28y
         tIvABUgqDg9AyDiZLTurZmCj7BFbOZFChYvUI3fz/Gb70eRXRCs+BGuA3DWLtW5NRE8m
         c7fDwxWgZEzn7cx1kFKkNpKTCNFQd+dGjVYJanUWsDQcHao7InYYk2Niz/xNlonJLdhX
         spjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOrp8QyBbO1Jy8A/Kfr0hRylPc2oSKdcI7NMZ4Znu1q64woLs/647sX8wzIh2slNOJZOUhB2D0PoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK7G8s+ApXfVXjiHe4znO4J/7LuWcqlwEGX+d8LNy1RZYXxK7M
	csYvOBcMC1SxArXtYgHub07arwvD4+1e+N2GROglDYs5ut0YLFAUgeQACckEJg==
X-Gm-Gg: ASbGncscscIsy/4lchvB/3AiRjmMqxlfQ2O1F0jpeH26ISqIx14WEDr0Fw48aiMeYy+
	mCUF28IbknvK6vnwosbBRl/ajoQBdx1mG6RZfy3pwdiaIycXOFrqcEmugbjKaNnkRXRC7+eSKdD
	WdONf9DC4BsQ1Pe/RJMcng4Pfet1sCMmwBrPKSnn3vTnF8DzX876i/awj7VRHW6G5Kc6UfoJ8e4
	/W2OWwvIa9ln2g7dzPXIEX7g6eIkIGVBGKSk/TIzhnRY2/9ivvpPHUf+ZQXialYjW0aeu+DQ4gE
	3ScwIewVRgZ0xi7VQH5UFq9m0rW6hCdt4DrdddZo9zYdWHK0l62aV0jovUysL/MZEqL1UCdZ7Sn
	dB7WSZ/mwSDn2BFpnRpKd1n02FPRlumXI5qM=
X-Google-Smtp-Source: AGHT+IERcgSj4aorvsEfGD1+OwfCDZVCGK2X0uc0qb0RCTsEEeQbOWVjDo4N66k09M7CmplsP0epuw==
X-Received: by 2002:a05:6512:124a:b0:553:abe6:e3e7 with SMTP id 2adb3069b0e04-55f0ccec9e4mr907003e87.47.1755850518416;
        Fri, 22 Aug 2025 01:15:18 -0700 (PDT)
Received: from foxbook (bhd106.neoplus.adsl.tpnet.pl. [83.28.93.106])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cc97csm3399259e87.80.2025.08.22.01.15.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 22 Aug 2025 01:15:18 -0700 (PDT)
Date: Fri, 22 Aug 2025 10:15:14 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/4] usb: xhci: handle Set TR Deq Context State Error
 due to Endpoint state
Message-ID: <20250822101514.3a730f4f.michal.pecio@gmail.com>
In-Reply-To: <20250818125742.3572487-5-niklas.neronin@linux.intel.com>
References: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
	<20250818125742.3572487-5-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 Aug 2025 14:57:42 +0200, Niklas Neronin wrote:
> A Set TR Deq Context State Error occurs when the Slot state is Enabled or
> the Endpoint state is Disabled, Running, or Halted. The Slot state is
> already handled, leaving the Endpoint state to be addressed.
> 
> These are all possible Endpoint state:
> 
>  - Disabled: The Endpoint is not operational and cannot process any TDs.
>    Release all canceled TDs in the same way as when the Slot state is
>    Disabled or Enabled.

This should really be prevented from happening.
 
>  - Running: Reason unknown, print a detailed warning.
> 
>  - Halted: Reason unknown, print a detailed warning.

Not a bad idea, but no need to duplicate those xhci_warns. There are
helpers in xhci.h to convert comp codes, endpoint states and all sorts
of other magic numbers to human readable string.

>  - Stopped: The state is correct? Something has fixed itself, so it should
>    be safe to reissue a new Set TR Deq command. All TDs associated with the
>    failed Set TR Deq command are marked as 'TD_DIRTY'. This marking ensures
>    that they will be eligible for subsequent Set TR Deq command.

I'm skeptical if this makes sense. What would make an endpoint run with
Set TR Deq pending? What would make it stop? How much confidence there
is that things aren't FUBARed beyond imagination? Was it tested? ;)

Set TR Dequeue code is pretty dumb and it will jump to the first TRB
after the first cancelled TD (or something like that). If the endpoint
may have been running when Set TR Dequeue failed, is it guaranteed that
trying again won't rewind it to some already completed TD?

Is it impossible that the TD we tried to skip has been given back and
the endpoint and/or slot are being disabled right now?

