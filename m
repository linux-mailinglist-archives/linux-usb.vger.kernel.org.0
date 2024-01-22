Return-Path: <linux-usb+bounces-5374-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E2C836E28
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 18:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E83E286944
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 17:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6539495F6;
	Mon, 22 Jan 2024 17:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBM+5LgP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88F0495D9
	for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 17:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705943419; cv=none; b=gW86TVUP6luJfwK6RIINODliG5yZ8nlSM75BWgqbn8QF6YAxEk2BTbGGcQWQSY/Y5tiqKvWyMRGNASdgbDhgWl9R9dkxl6TE+XKghz7Q2qJW5wxb0ibH9UQbvCFwzKiYtT6Cejrz4dHy54m1C1mkwwzqdau2aM8Dwe3YxRh1i/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705943419; c=relaxed/simple;
	bh=eJ63pexoHil/fZJCD6oy1bPMKlW0TcgjGdvbnBcUeMM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sL9oTSlBf3Au4OUnc4R2dqvKiDW1K+ENW/0EfC0GZPdbhqSvumD1UHQbhq28fZeBV68JShM2zZcGJSyorbP48qn5jzqzFmIXrUsB67XkY2Cyh9+EBC6Q9KYKkZAH4jJuJArDgnoFL1rLl9gfMAkJz05rzdhKuZ6+b4r0yTYkVDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBM+5LgP; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a308db01df6so70262166b.0
        for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 09:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705943416; x=1706548216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54e3Valwbf8dEV6FJ/hONuvu77grdxwk1Cy89F+4mn0=;
        b=EBM+5LgPkx7WN6pRvotf8TxVaHOk2DDmL1o6yqZWuQpGef87GykCBo9DD4DSQ0hBAL
         73iCT1onBnbjvYG7FSan7zhn1eRkkz6bdp9Mh4c7h7R2FzT+p7z9KGZfnHYT0ywBWRC+
         1jupKmtS7UPtm9HefLQtGt7HmxsPaTvI6FNEbjnUYjyFWFnQtQmAWbitLzrqFrRsitaO
         +Bfm420RAkK62yeX5QabIPHCqHBUkWTv9uAIncTDf1Gk8Mvf2ENtExe88oVQhpm5riPJ
         4OTrn1CjdSZQgMw2h3tga0fOYHzJjzquvSOWJF+KimWHb0PxNp/eaes+KT8ULeqkyYPN
         QGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705943416; x=1706548216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54e3Valwbf8dEV6FJ/hONuvu77grdxwk1Cy89F+4mn0=;
        b=sW2Xc9Wsp4mCPKQYHzZcwIqUuRliQ7na/rnFjE16Ok1IvtJcGPjpFLDr68yfDa+Z9j
         2985JraSaRGAiFZrlNEI6pKW/bavXBP8Vd6AUDDpjulCKrDhf1mPF4M8+jfuVi65coDd
         ZP1AVMdVYhle/w+SdmT4X0ecfGi+hWS0U5f1zriUuXqjsHfQXn1O+abMeerrpVAyQM2z
         YXGQ+EqXzoy/lHJjko4hXS4C0PIoTyoX9ccR75DvcxHggMUKtK97SwDfna+JNssZd8+2
         OSvUrrpYxEidK49xJncXvPjySgB8GyPrf75DECtIYFqNAS3DISwfkz744up9qdXSWd2E
         lAjw==
X-Gm-Message-State: AOJu0YwVi7pve3PePrx8LPHI4Nt+6bb3f5c4z0acAc1n2H1QflQ/sRXZ
	lOBKHlZg8poCpBSsw4HPWrWbWI8GoLRRZfh8viLPNFb8ZLkYJfI0IvJR0xXK
X-Google-Smtp-Source: AGHT+IFN9XFL6dnCx/g+C2DRHBiU6zpRt5gLzQkCGyWJ0A+lgvk06khm0Rb9riCn7XpPbxAT0TZ0cg==
X-Received: by 2002:a17:907:8a85:b0:a2b:d5a5:719b with SMTP id sf5-20020a1709078a8500b00a2bd5a5719bmr1242784ejc.253.1705943415667;
        Mon, 22 Jan 2024 09:10:15 -0800 (PST)
Received: from foxbook (acgj208.neoplus.adsl.tpnet.pl. [83.9.237.208])
        by smtp.gmail.com with ESMTPSA id qo7-20020a170907874700b00a2f620e158esm4200124ejc.164.2024.01.22.09.10.14
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2024 09:10:15 -0800 (PST)
Date: Mon, 22 Jan 2024 18:10:01 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RTF PATCH v3] xhci: process isoc TD properly when there was an
 error mid TD.
Message-ID: <20240122181001.1f6027c5@foxbook>
In-Reply-To: <6413c910-a57a-6d25-7672-18ae34ec674b@linux.intel.com>
References: <2c2d8711-3d2b-e943-a2a0-75637e725dc3@linux.intel.com>
	<20240119105835.2637358-1-mathias.nyman@linux.intel.com>
	<20240119225432.78c2d35d@foxbook>
	<20240122100332.6341ef1d@foxbook>
	<6413c910-a57a-6d25-7672-18ae34ec674b@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> I'm afraid we end up tuning that original patch forever
Point taken. This patch is more important, as it fixes total failure
to deal with trivial bit errors on uPD720200.


> Isoc endpoints should use COMP_ISOCH_BUFFER_OVERRUN to indicate
> endpoint hasn't halted like it does in the COMP_BABBLE_DETECTED_ERROR
> case.
> 
> See xhci 6.4.5 "TRB completion codes" Footnote 115
This applies to "TD Babble", which is:
submitted TD size < data from the device <= ESIT payload

Other babble conditions exist related to blatant device bugs (4.10.2.4)
and it looks like some may result in a halt or device disconnection even
on isoch endpoints(?)

Other babbles aren't included in "isoch buffer overrun" per 6.4.5.

I feel like one would need to systematically go through the whole spec
to avoid missing important details or special cases.


Thanks,
Michal

