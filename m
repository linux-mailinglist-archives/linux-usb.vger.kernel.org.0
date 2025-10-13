Return-Path: <linux-usb+bounces-29217-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FBABD2A42
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 12:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 649093B8E3A
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 10:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5297B2E06ED;
	Mon, 13 Oct 2025 10:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edJ2DNSy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AC23043C9
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760352660; cv=none; b=absFVGW/FtX1s3cnOHXSUzZgkJD9DIn2bPxEAzMcVleQQ4Ge6TO62A2aGDz5+KAm3XMGOj461pk7TBUiRZS0h79BLZXRZT8TubnJ7xOVUPwOcAVDQ4NRwuPlmXLDczoIQiI1YYNeUAwHW81RJjqtQB7/eDMqUOgIhkBt2HCfb6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760352660; c=relaxed/simple;
	bh=wNP5THpXLBBCsooeBbFGaCM7Hjs85FFamh1ekejynLM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ggW3rxcCeqkk55rss/Znzn5nflh/mQ3pHDX6I9XavBnqfoYABDvbI0qwnY0NwaR0daR4AL5TJYO6konoeGpymHR+Mwbyf1v0LWWm95Uut0PSMnPRrawWVCoILsDCCwNHtu7cqjx2PpSQn7AtnCQZqT8wBU31TNGV/XOqrL6am4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edJ2DNSy; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-637e9f9f9fbso7875925a12.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 03:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760352648; x=1760957448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywHY3N/RI9LLiDCgfHoL3E6H1b5BrPsw9rGztJzIzfc=;
        b=edJ2DNSya4n3LkBzMaSlhQLuNmQdeuRa6EsBik6tCyiqMkpkIO9+QC0uSwxcS6TT5l
         NhTmBm1t+TmFdBtG9jlk4ojBAPzpMewBQHXFOY4AJnJBMajkku1lsbiARphZIMiRBghv
         Kdi6NRC2mYNCG/VKsyavb0a9rNpc5VsKj0BS9KcDA5Ug9//zv8r6GHR4wnIT8GjSGjPL
         aGeAXx3gP74r3Zw/uV23sb9YYPQAT5LqbMbtPmvdZJhIefaWS9m4MG8lpvJL1BNOPoqa
         aZE7CY7ztdEc8FSBIFkePH1xuNO5tJ+aPt9LvsXpZ9YPwJRSuTOh+7c0XfSxY5cKcj29
         dGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760352648; x=1760957448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywHY3N/RI9LLiDCgfHoL3E6H1b5BrPsw9rGztJzIzfc=;
        b=djGxlzPAav8JYq3QzAceFwWqdDFMJBrOJucYB5flgRe5Nf1yCWqDBg2qtyYTUN9Jwm
         dHeUPgy33072VVTpoftwtQLsACyzqRwy0N/qxz30GC0lOxKR6g+Yzk5X9MA+TJ4/5Vw2
         BD8oyngLITWyMxC5enTzyNjpuPXAlo3N9AaS8ODBtQ922cVN0tY+4RBYsAeqDyzdj0VU
         qD+YrJIXZbCneD2Q78VztdqWtYDL9+S2n7DsX52AOvDXy0sth/We5PnbqWidLusdoDhg
         I/K+9s6ae7fKmAeeKqtCpEXJSr97LCur/W/73er0LMsbTWaWA5/fNdM0+BQFe2VfeMZe
         xJgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqy0evv6Q6zbRP+NoQHqH6Li6G5sVYaDTMY0YBh5CFjAcvEvVkiCKVvp3ubphdGkO3xj02ewaGXZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKaVLSw3z0QuwG8pKP+beBh8R75ixndnZOy1wAt9WICQog9ISf
	2pNxl2aSyhrqVnxLuZNuMXij663OgqK+md6mE+AQhrobZcX/rfWDfIo7
X-Gm-Gg: ASbGncsUGXWtiA+MNQVX4kGJ3dyHXmKMQ7XgAgOY3Lf45AVil5Hy7HhJurpxYupZEzc
	m7wTFQWBT8mfEeGjUYwVe4Sfv6GnNX2LHgyG1kGX0rwrkGZWeutA8m4OoePwIolHoQg5iVESUsP
	YbEoYB65Tp5wbwGkF+TTmXRrImafwjdktGIfN4HTk5RQOLXMm4kQzGfSWHUQQxvwPk3unxSrSJq
	Bwz+eu++/ygjO8+Wq16ueT9qbuAM8T6WoVR9jCBM3dPqf49KO5+1JPoOhAI72nCACpmNu3v0oqL
	Ar/yf+xAGgeyaYbIH8Hj3iiyRFn9mIwjSpGHKn+IRkWRf8jSDrxDG6CF3AdCNUVigDoZNb/cAl2
	CIVNvyDIQkYrWdIl1hQKmsnqvXzMyi3YTEWi8igljriOZwjKhOYAnrNdm602lY1ww
X-Google-Smtp-Source: AGHT+IEr2IkhLy3Hq74fdNOtudRrfh+iuu7rWrRfFvpPJo3KF6R4emQcUvwa9LHRg8/IJ9TOsz5Fig==
X-Received: by 2002:a05:6402:144b:b0:63a:38e:1dd5 with SMTP id 4fb4d7f45d1cf-63a038e4b6fmr12861262a12.7.1760352647388;
        Mon, 13 Oct 2025 03:50:47 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63b616d12fesm8024557a12.24.2025.10.13.03.50.46
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 13 Oct 2025 03:50:47 -0700 (PDT)
Date: Mon, 13 Oct 2025 12:50:43 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: Petko Manolov <petkan@nucleusys.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: usb: rtl8150: Fix frame padding
Message-ID: <20251013125043.0ae574e7.michal.pecio@gmail.com>
In-Reply-To: <aOzNH0OQZYJYS1IT@horms.kernel.org>
References: <20251012220042.4ca776b1.michal.pecio@gmail.com>
	<aOzNH0OQZYJYS1IT@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Oct 2025 10:57:51 +0100, Simon Horman wrote:
> Hi Michal,
> 
> I think this should also increment a dropped counter.
> As this driver already uses dev->netdev->stats [*]
> I think that would be:
> 
> 		dev->netdev->stats.tx_dropped++;
>
> [*] I specifically mention this, for the record because,
>     new users are discouraged. But this driver is an existing user
>     so I think we are ok.

Thanks, makes sense, will do.

I will only drop "dev->" because it's superfluous - we already have
'netdev' here, which was used to obtain 'dev' in the first place.

