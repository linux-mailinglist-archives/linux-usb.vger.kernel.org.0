Return-Path: <linux-usb+bounces-20118-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0CBA2757C
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 16:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D0567A5452
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 15:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFC0215F4A;
	Tue,  4 Feb 2025 15:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O499r/vA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1335C215773
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 15:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681315; cv=none; b=BZlYg9EfBStDFymbJ0kwkIBG8QB8+5GnBbBMnWG8pS6Ek+93lWDzyLXQ4Oiol+4p2ULuCGQ0B8LIh7v9wzdUR+j4rV4H9QJ1uIqrlsG3Pp2aBMlreaFOdfGVl/h0CM1lBIO7erGNxT6mJjBZnm0/H055LgThhux+zlW2ZSYJYAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681315; c=relaxed/simple;
	bh=0OoJfLQUZ+XTundB1ZNYbvCieQOKhKGKZ1e8Hw09GoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTp/O3OTtMvvyfWM3aSEo+lPun8P3DJ8BNTDdJ4MkG+FIBCWx0tykKGED7DzUyqtlsn/Rh1WYG7Ywyj9xx7tJqCKkJd6/YGqK32oZiHILejKrXMrKgYVsV0XyqnrghV4w62nm23e8SpNUN46YlsSZtuOc4Gqoa+KMTy8pxarAyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O499r/vA; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so54069221fa.1
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2025 07:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738681312; x=1739286112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4PSD3oLODlnXqoWTIL47JnYdn8a6cMsKT6T4yi/eD8=;
        b=O499r/vAmhfiEZtt3z3fm9QqjaWjXBu8XVLiPkgatJRjVu6+YW2KegMNHBfAK+YFXE
         yVGvdeu+o6mOYxk1i+e6/xFXEEvqQaVcfhmICwgwIIwBoybBSWq/TzhQE2JhCV+U+YZL
         ol1l/hqjMYvaKOoW1/K+vltPG4Y9ax6D20tSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738681312; x=1739286112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4PSD3oLODlnXqoWTIL47JnYdn8a6cMsKT6T4yi/eD8=;
        b=TbT1BEzKLeqfjeD5edvgqr8ehPak2YUPYp+BpazNK7lissW6pHq3tjNAP/kR3lRJBg
         S2oKZWHDSxFaB55xgKskzSl1JW9m8Kz76bkwTLurAF2n8eHNDgdIyZZQjLBiq+/pk7GG
         5w9AscIqb22h3hd1FryCCw2+m8iRiNLhWUkxsawEVaZouB0/X99sO47EWhO2sgpAdbsI
         yqYd9mZO+TtxGfB0EftkpYKuoqoDcuvanhTpRN2Z53sQjPiLibK1Wqj6P86wHEsaT9XK
         CJMFTIW1GCOotgW4viRxvqPQtfna+y+K/kgql9yStlHPprJ5QcXMwRaRLLXJv6sV0n3D
         nMgw==
X-Forwarded-Encrypted: i=1; AJvYcCWhdZc4aBBUs5P3K15DIs2AhPjRHD+sYrxryZyIteNUDckRyORxFcC7t8rSE78+dJTGNXzLjTJB8YU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaQ/3c3EszfbRG3npxFuLZpFTb+q6J9sJ0tyUEz14B8wGWYE5P
	m/O22y0vtgKsbPhGh0CveUiySMV4HyblTHI7FAmKrhhzgi225RtAXV43KT62ai6wMLiDe8kYUbZ
	G9negVhG7GF7cKW4034JbLH/jxkh6KnUnqls=
X-Gm-Gg: ASbGnct9gn7FT30HKDiqAMimUD5HFRkOBAze8wrQgYFoSorCW0nzna91TgHbmjcuwVf
	w7kFUcgbVuU5MKh8NMClD86RT0mZxIa8vp2dvnIZnGQYMj/4XCcjxw0SD0JK30mA99M+jrMRZFV
	z9CXNwkd5cd8bRbY0GT6OuUBOd
X-Google-Smtp-Source: AGHT+IHjHBgVQ17FN+3St2143VkyLuEsuWgXLA0ghwY5o7EyMGBIBKalXtR/EPypS1KnRfRq6g1MvmB/0k1Ejg3EoJI=
X-Received: by 2002:a2e:bc17:0:b0:302:27ea:a56e with SMTP id
 38308e7fff4ca-30796973aa6mr97699261fa.32.1738681310515; Tue, 04 Feb 2025
 07:01:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204024600.4138776-1-jthies@google.com> <20250204024600.4138776-2-jthies@google.com>
 <Z6IlnW5i93mHVcnj@google.com>
In-Reply-To: <Z6IlnW5i93mHVcnj@google.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Tue, 4 Feb 2025 16:01:38 +0100
X-Gm-Features: AWEUYZlP957uKUDHtnLM-aEc_ENDdqux_SaPXJ1ERkqTZ1ILl2J8rboYKtPLWP4
Message-ID: <CALwA+NZQNFUSaf=S2m39B-rfUwP5YCDB9NrKuJGW=7=U9d0ONw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] platform/chrome: add PD_EVENT_INIT bit definition
To: Jameson Thies <jthies@google.com>
Cc: tzungbi@kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, Benson Leung <bleung@google.com>, 
	gregkh@linuxfoundation.org, dmitry.baryshkov@linaro.org, 
	abhishekpandit@chromium.org, akuchynski@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 3:35=E2=80=AFPM Benson Leung <bleung@google.com> wro=
te:
>
> Hi Jameson,
>
> On Tue, Feb 04, 2025 at 02:45:58AM +0000, Jameson Thies wrote:
> > Update cros_ec_commands.h to include a definition for PD_EVENT_INIT.
> > On platforms supporting UCSI, this host event type is sent when the PPM
> > initializes.
> >
> > Signed-off-by: Jameson Thies <jthies@google.com>
>
> Reviewed-by: Benson Leung <bleung@chromium.org>
>

Reviewed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>

> > ---
> >  include/linux/platform_data/cros_ec_commands.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/l=
inux/platform_data/cros_ec_commands.h
> > index ecf290a0c98f..1f4e4f2b89bb 100644
> > --- a/include/linux/platform_data/cros_ec_commands.h
> > +++ b/include/linux/platform_data/cros_ec_commands.h
> > @@ -5046,6 +5046,7 @@ struct ec_response_pd_status {
> >  #define PD_EVENT_DATA_SWAP         BIT(3)
> >  #define PD_EVENT_TYPEC             BIT(4)
> >  #define PD_EVENT_PPM               BIT(5)
> > +#define PD_EVENT_INIT              BIT(6)
> >
> >  struct ec_response_host_event_status {
> >       uint32_t status; /* PD MCU host event status */
> > --
> > 2.48.1.362.g079036d154-goog
> >

