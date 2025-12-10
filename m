Return-Path: <linux-usb+bounces-31365-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3604BCB2A20
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 11:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0523304C1CF
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 10:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4BF309DC0;
	Wed, 10 Dec 2025 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jzb3qOLq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772051FBCA7
	for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765361332; cv=none; b=L6AcHfbUFBT1SzEkCGU53C8CUknTBawu8ur91oFe/WMQTGsea5O+9OoH/CunIcPHmSUKxVn67FNuSy4l1s2FpBvNOba5t6ms5VRYXHsNbjQvlGG3LXarCaYsT49cB9UDiBB0Ett04H1aOcDHx3t/rcmkuuHv6DZMmJ5hUdhvJyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765361332; c=relaxed/simple;
	bh=MJhTumMY+Rp+DB84OTm/RkSgYcX9Zva7nUwegUsKNpo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QXFSguEjCHw3gE++j6Tc+65TdGSK4PYA0oH9yEhZ+BUWdEFv7WdW6mxx6HcnnK4joXrNk+oIUjbRHCNQQcMlVFIJx51fQOb9/3iWtiSWFN+wDAuzR3IxQwmPg6xUSQrtwz8s5XjsdKz3Pmru7+3n7DXapDMWth9HxgHF0+/WK78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jzb3qOLq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso50931785e9.1
        for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 02:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765361329; x=1765966129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NseMtzZhpH2Cj6pYcRihbjYl8y/WsGV5r9gIyYoFNUs=;
        b=Jzb3qOLqFB4Fouv5sgGbieeuPevNpGH+oxW/P6lTAlx/cJZjbvKddmU9gUbs/nfqFN
         6qame/YInFT3R88TwuzSCMyI9WkCfpl5Ge80VZ+tdQvxDZsY0KSM60LyWEdNnd2mvVhm
         c0TV6LtjyQzujVG+u6w5a6Aui875ImuFtaL5ZE6wX3a1QzEqYHMvvnJPDBi0DG0AA2VO
         B1gN0p0kpiLTn5V7WLXOdNbDDGMKkrFG8Uj0+ozHlcalaoqsHYQmFWYBhVRzPhQ0Y60/
         odtkFAQML8hw1B2/vMn4erUQmXhSYr8wbhHNtMOxruwUOXV3SADowxJw8pJGcritPC8g
         ygEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765361329; x=1765966129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NseMtzZhpH2Cj6pYcRihbjYl8y/WsGV5r9gIyYoFNUs=;
        b=kwj8JoRpgnH0KaW4WXPLGn01ROALPxCNkdasC5xgzJJMOJXfjot6gVmHbUuZI1BDtV
         Pl412qero/cPE+eRc89FeQRGINK/dZsrgnZz7L9G8RuBrRJp2sGEkwgYQQsDpbWVXbNh
         ZQBf1NYnVAN9VxZ1XSq9Tdk3XGWQY+4vTjlJUdcEpgVc3oXLzy8/x1aCK5YvqIe1Yr9B
         6AwoJd2lm37fresJ+RbKXMUMAvqf3ozP8fTiS0thTOVRht6UQYxlk8+3lunmHkzEsJEp
         quaWkMS380qoPufEJtkq3zy1nby/lvfLqKQrAkAi7+op8BHM3M2AkLUzWexOvNHHO5b2
         f+0w==
X-Forwarded-Encrypted: i=1; AJvYcCU+mN/zqp/624G/vgk7z5cCKNnINo8rmcC/rTO287KttvpfsiEY6G9nPqiCDid/8F1Qo9TiDsDbyZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEc9mbJMV+QYc276+lTHAQLgSMWaJ0WwUqYemH8GLI4AXbz2p7
	tTl6LdSEITZ1CjRgtkejW3vK/b+ApVF5or+8MqPqvvBQ47ul4flXkOgt
X-Gm-Gg: ASbGncu99n7kN76F6dqfCaUdmXqrWgx0Yjs4Pr7f6tqv0sj1Lduh9nQjmSJhlV17dN2
	txKeFjFLDl1Nd8YpjxE/hTEKTahjnny6niiWqkxEdQPpJIzqJBTM6aefczooID/t74gkga099PD
	CHn7x7YpnSPTpfsD3cu7DGoK2gn6AZxAXx8hmVto0EvwPUdc/XT7MREXojwRTrRTx914RTixDpt
	5Os/JmdrXKvX62pfYyjgO+ORaenwzmKdUaE9frXaOf2beh1n7mVNo/bNV7Pg4OQ7ZzVDHvlKwib
	WQIzS0QZRfsRoqv1/2WoM25vsOREGCZCTxrgQaExcQNP2GeZwnux32FSjeMX+czSjP4yYREc9JR
	3DDD4WnssBsmQX9X2XO52tlpH8mEmvaUnHDgPrO/2pqdmluWgp2Te3re2m0jUj4nsdat4HqeVQP
	ILgk+5da4UwusldV5vaic3olCDYQrpcGoHkG89EA/Iwn1DdjjJf3Pv
X-Google-Smtp-Source: AGHT+IFEJS4gDpOtkiXbQ4hQTDHkTmoqgl6+D6XpHgC+rNy3vgC5+/pYYcJMyggTtOaqPE8b4aQw+g==
X-Received: by 2002:a05:600c:3151:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-47a838534b1mr17827505e9.35.1765361328735;
        Wed, 10 Dec 2025 02:08:48 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d9d23e1sm38527975e9.4.2025.12.10.02.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 02:08:48 -0800 (PST)
Date: Wed, 10 Dec 2025 10:08:46 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Crt Mori <cmo@melexis.com>, Richard Genoud
 <richard.genoud@bootlin.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Luo Jie <quic_luoj@quicinc.com>, Peter
 Zijlstra <peterz@infradead.org>, netdev@vger.kernel.org, "David S . Miller"
 <davem@davemloft.net>, Simon Horman <simon.horman@netronome.com>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Andreas Noever
 <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 8/9] bitfield: Add comment block for the host/fixed
 endian functions
Message-ID: <20251210100846.04e59dcf@pumpkin>
In-Reply-To: <20251210182300.3fabcf74@kernel.org>
References: <20251209100313.2867-1-david.laight.linux@gmail.com>
	<20251209100313.2867-9-david.laight.linux@gmail.com>
	<20251210182300.3fabcf74@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Dec 2025 18:23:00 +0900
Jakub Kicinski <kuba@kernel.org> wrote:

> On Tue,  9 Dec 2025 10:03:12 +0000 david.laight.linux@gmail.com wrote:
> > + * * u32 le32_get_bits(__le32 val, u32 field) extracts the contents of the
> > + *   bitfield specified by @field in little-endian 32bit object @val and
> > + *   converts it to host-endian.  
> 
> possibly also add declarations for these? So that ctags and co. sees
> them?

The functions are bulk-generated using a #define, ctags is never going to
find definitions.

Adding kerneldoc comments is also painful.
I don't think it lets you use a single comment for multiple functions.

	David



