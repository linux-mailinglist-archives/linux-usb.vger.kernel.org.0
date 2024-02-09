Return-Path: <linux-usb+bounces-6172-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0331784FB6F
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 19:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1422D1C27426
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 18:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAFDF7F490;
	Fri,  9 Feb 2024 18:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iJiRiBSR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64CE7E770
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 18:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707501681; cv=none; b=FeVAa69uSP9OuSYw4Bjnce7o7folsYquhprpRNJ4M9lB0E9dgQ1s1OIOdx6rjiihBBEjjjBeLvMbOa5PTOCKyFTO74ZVrvxB19V+r0/dU+4/ojP2Z3HrZ8vacOOp+WtPW2zrhie+YrM9MbztzixBnP3kAMR+dgM54egbF1djfA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707501681; c=relaxed/simple;
	bh=tWnDDTX6hjvn4zZMWScUR1a3jczggxxhhlZFG78n9SA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pgkQID4JPROj3vIBJE11CfsK73QLQFe+9MLu6eWeyqwY9y9GggdBsCY+qwnm7uC2U6WjLDOrsOxwChWike5OjHqlfBNvUzQWYfbwvlynYtDwXli4GvBfZx+/D5KtYyLvmmzSolDRL/GyvAadBaWuUZiBnnzK1SC+5CalbIb7uq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iJiRiBSR; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc6c0dc50dcso1065547276.2
        for <linux-usb@vger.kernel.org>; Fri, 09 Feb 2024 10:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707501679; x=1708106479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxAXd9578hDdusxvxqROEMfzhHSW5iLGGo5hRVlkaFc=;
        b=iJiRiBSRIncIsn3DVJ3tybiJ+sQA+7Bo4C9dA7k4FZy+QZLxXnRINZ/f9SR1DWhd5/
         NHDhBlALK6qguizN8lwDn9SMBRvnD5mq+WraiRliah9nM31AXpcgM0vC5Zk4va+xuIZV
         S5XZgZwsgRrJM+NDv86NLYComeWGhcp3nRE5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501679; x=1708106479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxAXd9578hDdusxvxqROEMfzhHSW5iLGGo5hRVlkaFc=;
        b=YlSpTWcBX5BpzKk8qjmB4WwmQjsTuvr9vwrF5IwD2PoW4OtIhMZyU7DZFYZuK15y+P
         YkNnxKSlmo/e/dEVjLMfVTT4D0a2ohAfhMZCJux0upcJdT7s3We6fRP3Cs12Ap+MClAH
         mu3w6vOXclMkIOqCiZUqcjrITLneEdXbuWGfHzqpbJAC+Jgb+oejM65e+ugIiWTviZPb
         VBjnGWWdhjTwC5uOVjwMCovVuvCPZwTQBzo+B3m140VlFfw6FqZgWLE2u8y0tsoAuJFf
         YvM6HZ1p7m+TivClHT7YxZSTXQiPJCnNLtOCKioPG6kvkWX2yqfvNQZ0BctKnDh9yPNu
         UXQw==
X-Gm-Message-State: AOJu0YyZvQcgHADjxUM87Ysdtf6fYmIeUoisQwi/hE4qbLkaITL3ZXoU
	qbes4gCe9AK4LluS3Gvlev/bWd5tqNLKJr/ep3a3EQpEGy72ReNZR4e9ZpaCw8A52u3fqs+WBoo
	Mf5czg0XnsLBUI8TWr+ocpTQnOwpak7h2GE+6
X-Google-Smtp-Source: AGHT+IGn0jV1pZIEIiivUmj+U1vOUnk7Ltih/wE24bOuFmmcWlsGf0dF5J3/tWHDdX/y20KgLcQrUQao7heE0UcjZN0=
X-Received: by 2002:a25:9cc8:0:b0:dc6:19ea:9204 with SMTP id
 z8-20020a259cc8000000b00dc619ea9204mr1878634ybo.61.1707501678528; Fri, 09 Feb
 2024 10:01:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209060353.6613-1-abhishekpandit@chromium.org>
 <20240208220230.v4.1.Iacf5570a66b82b73ef03daa6557e2fc0db10266a@changeid> <ZcY2kVlUn7SJ5pW8@smile.fi.intel.com>
In-Reply-To: <ZcY2kVlUn7SJ5pW8@smile.fi.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Fri, 9 Feb 2024 10:01:07 -0800
Message-ID: <CANFp7mW0F_zyaKJg0LusT6Cp4h0_8Z4jq+R1GUGtpyZrv99iVw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] usb: typec: ucsi: Limit read size on v1.2
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	jthies@google.com, pmalani@chromium.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, 
	Rajaram Regupathy <rajaram.regupathy@intel.com>, Saranya Gopal <saranya.gopal@intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 6:28=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Feb 08, 2024 at 10:02:38PM -0800, Abhishek Pandit-Subedi wrote:
> > Between UCSI 1.2 and UCSI 2.0, the size of the MESSAGE_IN region was
> > increased from 16 to 256. In order to avoid overflowing reads for older
> > systems, add a mechanism to use the read UCSI version to truncate read
> > sizes on UCSI v1.2.
>
> ...
>
> > +     if (ucsi->version <=3D UCSI_VERSION_1_2)
> > +             buf_size =3D min_t(size_t, 16, buf_size);
>
> Please, avoid using min_t(). Here the clamp() can be used.
I think this is likely the 4th time I've been tripped up by an
undocumented practice in this patch series. <linux/minmax.h> says
nothing about avoiding min_t -- why prefer clamp()? Please add the
recommendation here
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/in=
clude/linux/minmax.h#n10)
and I am more than happy to change it after.

> Shouldn't magic number be defined?
The comment right above this line documents the number.
As this is the only use right now, I don't see a need to make it a
macro/constant yet.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Cheers,
Abhishek

