Return-Path: <linux-usb+bounces-17945-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B3A9DBA9F
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 16:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DB7DB22223
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 15:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525661BCA0E;
	Thu, 28 Nov 2024 15:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZcrizA5/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506CD1B6CF3
	for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 15:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732808267; cv=none; b=YXxJgcAEi7KV96Fsrpr/Sp/eQY7a3CGl9PaZg6mwQ2vTgr2mR6vqbhtQAmG7UpfKAUnyfNeVMHvfhCQRLZvShY14EOIi6ZH/Ai7I6C9LZ1lwXPCy6EPUjUd7YGxJIRSfKGXU6O4YeLIWOpTC56y3tPAADrI/nsaTba5C0o05AU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732808267; c=relaxed/simple;
	bh=Ds5+8kfZBfCZhW5WDb8ROSMmQ2iK1zqD8lS3wKlRuKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcOKOH0/NkC4qoMFmJrck50PY1iTWQozFClu6ctTj3v3SgAykJnrr6hc0xTS3P6aQEJapBPQuDbgStq2WJnBb044DgjcpWVJ68g0eqccHLerHLZLMh9ddAbx2YNfx6cpk0NqtHAlX7LIAQ9R6c5D8Yi235FmQnxdMw5eVXwMnpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZcrizA5/; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffa974b2b0so10873401fa.3
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 07:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732808264; x=1733413064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r78PsilYOIB1YzcxsIaBFcuZtovHA+J7gqslFteSS5k=;
        b=ZcrizA5/pGxF0CDW2LicwbzuTE5o6BOpSxN5v+lQzJIVaLhsIXhHKnnJZSHqZhdF58
         SzflqzwWbdBHUZepB5cXsTASJH3ni1MZTViTqg3MKRgIN6QhLge4SSyXUuAZO3pzyOOe
         W0oXVuMy6OfJ9GzzAfhW1aKVjJ6mbDFdDe8hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732808264; x=1733413064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r78PsilYOIB1YzcxsIaBFcuZtovHA+J7gqslFteSS5k=;
        b=Jr2nwAy8qyxwa6iSZjwB5QhlMNCxWJQXezjOKoGo2hq8HOXywP7R+ydI3pPXw6m6p2
         gqNT3PO0cU6LhXz79w25A2z56VNcbzRHJJ5EbM2LotJOhwENH4LRmlHeAaJLw9Gv8QJC
         alnNysStLlwDjwxUXJniI893xcPTLD1WhDvwOqekkmDMJxXPS1EDMr1KgiN2fV0jqRp3
         xwZJ7YqEMLnPtV16qTfFN1G4uW5V6+tcsrRtIu7o43MN6HAbdGTjkL8ypeDqnLPBqYRJ
         LwdtJN54p622YgFdSFk/Wowb2s3SvKy12lsqoYt5LNBWGqe7uEVTA+vy9EX76pfVNZB8
         HBRw==
X-Forwarded-Encrypted: i=1; AJvYcCXBWV7YTmygZ7pjkGnHdOaDvI0JarKltap4ATDSqz6dN7tt7xSLKCK3s9xV7WhpktBmCB9IMh23ibY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLzlQsyL3834HTU4jeK9fMQI83dnAvfX1bTFS8ABn+v0Hs6FwW
	MmlgH99M5vhzLcNZ8Qk3spRffUYqwpawjGqYSp9g5psGnJKI54MgPqFBiu2M2N3BewEINHZG/C4
	kqEGjVcVG8gT82ujzDgKVj+r3bazh/I+m+Ks=
X-Gm-Gg: ASbGnct027W4evw7iK2B+1pqJO/eY55qbBIhQtb/Wj4SuMy6+1ZQ1vLA1qiMMFqsvHj
	n3jgIf69BicIULen84M0CNnOdkmTSi4G7IpTdkHhR7Aj0pa6H3u/w0jIaICQ=
X-Google-Smtp-Source: AGHT+IG/BN3Wxw36KeRPzELv5MqmN5fBKrc4T+6LKYJV6nZNW2sf/GbStGemSn/5lzxJIfPK2YT+zFybW90qNdWcttg=
X-Received: by 2002:a05:651c:1541:b0:2ff:cb09:ccbb with SMTP id
 38308e7fff4ca-2ffd6069466mr35010041fa.10.1732808264566; Thu, 28 Nov 2024
 07:37:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115155234.1587589-1-ukaszb@chromium.org> <20241115155234.1587589-3-ukaszb@chromium.org>
 <Z0iCP_2RM-c_yvU1@kuha.fi.intel.com>
In-Reply-To: <Z0iCP_2RM-c_yvU1@kuha.fi.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Thu, 28 Nov 2024 16:37:33 +0100
Message-ID: <CALwA+NYEa8OHt=Nodh5TTfFQkXsqnO7yxUm=UEes+CmNGTGP4Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 3:46=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi =C5=81ukasz,
>
> This LGTM, but since you'll send one more version in any case..
>
> > +/*
> > + * Maximum time in miliseconds the cros_ec_ucsi driver
> > + * will wait for a response to a command or and ack.
> > + */
> > +#define WRITE_TMO_MS         5000
>
> s/miliseconds/milliseconds/
>

Thank you Heikki.
I will fix it.

Regards,
Lukasz

> thanks,
>
> --
> heikki

