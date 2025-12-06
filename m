Return-Path: <linux-usb+bounces-31222-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8421CAAF39
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 00:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96028303EF61
	for <lists+linux-usb@lfdr.de>; Sat,  6 Dec 2025 23:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01D42D8379;
	Sat,  6 Dec 2025 23:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWROfoyf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C24274B23
	for <linux-usb@vger.kernel.org>; Sat,  6 Dec 2025 23:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765062977; cv=none; b=Oe1hioGBMqUPQ4kot9jgSNocvrwdpokaj2JU9mmBxVI81YFQCnlC65H2nFcCmJO2dAt1nSVw7P338MP7AUnaUWirbHkp5CHeBDSIe+fEb+CXGJ1WP++ilBjzBU9IKZSQQPtSUQ34LW84HV705s5lrSTpn1TRjnGD9+Z28RVkOfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765062977; c=relaxed/simple;
	bh=sHzfrNNc5TiZOJevop9wIz2ZjtFwVDhSUdmNHa4qp1A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oRDtzNgvN52yo6xepsxHXcIpvJqfrafzBfLX/OucTb3R6BPw0cv8wn8JZqG16SmCC+6YzePmkHV+hS1TnB5f2UJmI42SmZceIoVHaTM4Z0iEqar4sYYdt4MHowMc2v9Kg9X4O6KkeeS2beI4SAy4ymILozVbFhXGYrXy48HMLms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWROfoyf; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-647a3bca834so4342819a12.2
        for <linux-usb@vger.kernel.org>; Sat, 06 Dec 2025 15:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765062974; x=1765667774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHzfrNNc5TiZOJevop9wIz2ZjtFwVDhSUdmNHa4qp1A=;
        b=QWROfoyfmqank1B+D60sDDmaEuEAVyHbQtxPsmnTIO7yt5Qm6yN/ofZ//wxV8MeAbQ
         f7vDFIupR7utaEgv6OGp099coRnwsIRUIQxU+SjTPlBddcuMpJCugLpV95PQIYwYpVvT
         zX9qxdM7kQOVpQtrEGnv5HWX606CAbwBBv1GWTK1eMbzl+HbtMy8oOJ/P12SBVwbm+8C
         8vwowt+Cn+tvRZgJdnZ1WTjCZr2grpVN8S0eG87IUkpTyFKW3rTE2n33jpIQ/5HNBDq7
         wyqv8sJ90BXokOsDJksJTxabCFagcvc7Tt21Y8cypQpVZvEJDR4ZAuEOgeFTgkkEzNRA
         bphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765062974; x=1765667774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sHzfrNNc5TiZOJevop9wIz2ZjtFwVDhSUdmNHa4qp1A=;
        b=pDc/1xY717lRbyWbraLpmoLTPOuU39MeNE7n9xEuWqIupsvSRbG3UJzp9BLO93EK6W
         wr/8UH049RTFHstYHz9Xo46okhW7qHyxESgvqBTgKr2IxXqSeTmGx4lcvMYaELnJrtsw
         k9FfNZXXdDhesuVv3dp5FTAKna7f+7B8Lg6O267m5bi4q2hI9WlkGadhUVueSFVXQ2/y
         /PvINZhP4LOj8G6R59+tm+VjXcRXPTOTcYcA4cyAQjTIUXXhdycGjkZehSy78il3eNNT
         Yqfjs6L6dRLi6xgy4a2cFeF+IV4LmuYaY+7RJgPPjE74XJFBii2hfRuDQnI7AOEmBCbL
         THqg==
X-Forwarded-Encrypted: i=1; AJvYcCUXwhpiIOmweHON+19fmJOmXM4MCA9p+TbHLpjxQYbVOBYC6lZcNAhwwfmtTca1IdMIcj9huFfm2go=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrYM8yK4E40gU2iHbbn5QiQIbj91CTWjpL6tr71UOuKT30va0i
	eHJAuiMZrb8g1ypRTVX990WfMSkVJbX9/1iwDpkWHbaWg6hfcs2SPqsxU4ekgA==
X-Gm-Gg: ASbGncsktRCT0vFnIlF5Y4Z9nsDJgKa0CaQaWYMl+yV02fwaEJ5wIqGbVtJ0rMCu1Sz
	bPrGJ/w/jjJKGKIvSUpJuqyfScotDljmuQCKvWSXGzlwzeV49FRhdtz0rwXjxRshJVynbzoGOza
	qtb0kv3IfgWSG03Qj2Wv7zn3OOBUTo1+vHJIDNb+ATx5U7LONKTbKLuiTlCvVqxJOp1KBgU18O/
	cCBFU9qYysjer7I+gRCRLRsdIfVt5UmsDyfFGwTbSbin89pMAE05Vji4+thHVTF9Tm9RoREbWMF
	m7boZOvOWg4LIW5Jkwvh9wm7TEP0rwIFPO+sQPY8bItg9Q2Zxga0KZxxKK6k6E4NweYooukOqj7
	pxMCCMfkVY/jGuScuUKp2rcj5GYQiWXw/eL+cbVEmG2cd+At2+lc3bMJ5YXP8zHqMSNAVCvP9eU
	7hJwFmfd0qVpc/gGD3rLLV8LU=
X-Google-Smtp-Source: AGHT+IHtKFCmYVxjR1we6OXMVDfxzf8n+wwXaLbAzbV2+PkWV7ti0OR445B6RzpBr5bddwpvBpKOcw==
X-Received: by 2002:a17:907:6ea4:b0:b7a:101:f86c with SMTP id a640c23a62f3a-b7a242be758mr391922566b.10.1765062973847;
        Sat, 06 Dec 2025 15:16:13 -0800 (PST)
Received: from foxbook (bfg212.neoplus.adsl.tpnet.pl. [83.28.44.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4459378sm754765966b.6.2025.12.06.15.16.12
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 06 Dec 2025 15:16:13 -0800 (PST)
Date: Sun, 7 Dec 2025 00:16:08 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Zenm Chen <zenmchen@gmail.com>,
 "gustavo@embeddedor.com" <gustavo@embeddedor.com>, "Jes.Sorensen@gmail.com"
 <Jes.Sorensen@gmail.com>, "gustavoars@kernel.org" <gustavoars@kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH][next] wifi: rtl8xxxu: Avoid
 -Wflex-array-member-not-at-end warnings
Message-ID: <20251207001608.1f6940bf.michal.pecio@gmail.com>
In-Reply-To: <44c9c325-14a8-4391-adce-4bbe8c68b446@gmail.com>
References: <ff184c0e-17f2-445f-9339-f4db9943db86@embeddedor.com>
	<20251121111132.4435-1-zenmchen@gmail.com>
	<475b4336-eed0-4fae-848f-aae26f109606@gmail.com>
	<c0d187d6fead4e5387db2a14129be96c@realtek.com>
	<44c9c325-14a8-4391-adce-4bbe8c68b446@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

> >> I got something. In my case everything seemed fine until I
> >> unplugged the wifi adapter. And then the system still worked for a
> >> few minutes before it froze.

Sounds like memory corruption.

> > Zenm and I tested below changes which can also reproduce the
> > symptom, so I wonder driver might assume urb is the first member of
> > struct, but unfortunately I can't find that.

That's what it seems to be doing, because it uses usb_init_urb()
on urbs embedded in some struct and then usb_free_urb().

If you look what usb_free_urb() does, it decrements refcount and
attempts to free urb. But here urb is a member of a larger struct,
so I guess the whole struct is freed (and this was either intentional
or a bug that didn't happen to blow up yet).

Now a bogus address is being passed to kfree() and things go boom.
Or at least that's my first guess after spending a few minutes.
But that's the direction I would be looking at.

Regards,
Michal

