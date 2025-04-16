Return-Path: <linux-usb+bounces-23120-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9583CA8B65F
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 12:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18FF81898367
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 10:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2D0243947;
	Wed, 16 Apr 2025 10:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qDAwAVhb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F200922157B
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 10:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797972; cv=none; b=e4YGp0zOyxgaIKYKM6QIyR4PwlIN4a4Vj8hbBB4S5La2hkmVx+V8YM5Dd+c4VruZ2CBSvHD8Dh02iQxtklj5nP6BFGT58SYQUitqpFNeM9hf7wjktkko7xfm/0BlkfNpGA7/Gg8GYAx8D0JnkjTsJru8KrdnYMtYM06Ydj9k51I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797972; c=relaxed/simple;
	bh=2IcbjuyAVM4kLhvW0gDdafAXht8sirWnrRq3F/Gm0hA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qj3/sPVTCrXSOOX4Z434mejae01ElSJ8KhGE1y9E4TXoqkBSPO4Wj7UsS638ORvPkv8oVNapRF9qNGFdUi+SMzeOPob8ySOHtNJC2vK9jiuPR+3moJ2iqYoG9nWGNl0kC8KwPTggrhJgZF21Yx2Phrbb3GDwdpUQc5BIu/1w8Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qDAwAVhb; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso7528a12.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 03:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744797969; x=1745402769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJtO5p/6ZsGHTmasHcgl8RQRMFMxAkQzPoyy/PT0rL8=;
        b=qDAwAVhbyh1j7xqLWYCZmU7OhzS+D/YSoxijZdC6bT5dPIuP+dBwrA2wS3X6MhVzcR
         2Il0b8MvhDFvFAbVE0OwaXjjOKN5XxxMBbyiyzM78vpmKNhXKeFjjYiYgoOTu/9zbIDL
         wiOf54On9z43wWQAFr4RhA4lWdmP3PbR/3pAAFiY3DTeS5uVYUrYg47zpmRslZED0HE3
         L7NLfFicZncYUuPg28Qom/07aFjQt0jb1Rcy2PNrz5HpEOrX5kLkvO1mj7g2Gndtk88B
         EOJ8/lg3CN4T7EDLjZYDcGj+S5mtXWPslXrzcCmTg3TjnHJ5XKZCESg9JU5wJgrhYZzl
         cXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744797969; x=1745402769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJtO5p/6ZsGHTmasHcgl8RQRMFMxAkQzPoyy/PT0rL8=;
        b=u2Aq72QyBdvAchzKBfZNw9D2ZoOkxM8fZY5gH24BdcyG+mxVsrv5ewJy4eubMfr4ml
         p/GPpgyJ057G17BGg3kALpsLRT8TgH/KH/raWgevKkd6nd2PGX1WQAt7UoYiQWKtqbcL
         JX0U2txhtN+zlHAHI/lR1ls0IQM4RLx4C17AddprdYBLliK6hQwcgmf+be+Vc6wxzw4h
         65XAK2DDCryd/SgJ3JMBMRPdtcWK6aLm5mUAnmRb8/F90u1AtTLnEJO1q3yCRVX2cVDu
         ZJM9mcoytupfqddoAU+DLN9sp9ZVcO+7OKul1CU/Jcr3NRthsksFaIbGYVpSpI7UAT9b
         TRlw==
X-Forwarded-Encrypted: i=1; AJvYcCXd7NdnRUSBU9zVXK1Rcn5r8y3jAC/QrA4D+R6WMEgnvAqe5gLXY7ArSF/cdSV96myKbgMC4+HZo60=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNk/ZovAXpmilMBkL0hUsi+yOnv6RG+XyuVZ0RpeocBJFJVKMi
	Mlv3L8QkjquhG9jKBnlSY8e7n5jNDr/5fvI83XQLjjPUY2mjn8s7dklwaYypzoNOkwAdVqkWkxg
	Z1vxgWKphbknu+SVrs7XsQwFUMA5VRyelstlX
X-Gm-Gg: ASbGncvsbG3aZW8vlMISYXiVaLx3O59wHkOZLg6YfYerNaxpSTafEmGVR2pygHMDu6s
	ks5kJSi2fD1uTqDOWeaFX4W6MHY3P9wIzK5XyPYgozjpqI77wRhZ5LGSgm3bW+C/LKEBxsANn3Q
	bxJ9Z2PXbMQUAlwfx99rEZDqWH83KnkqaBB5P5AiLQ7p9f1Kp81jnu
X-Google-Smtp-Source: AGHT+IFFSblm/GfnDiFSG1MLMOppLXh+oYcsUvCfbwn5ir+K9snJXxGTAxtAyqmuqMenSvvMadnZW3B6voE0rCrc9yU=
X-Received: by 2002:a50:9517:0:b0:5e0:eaa6:a2b0 with SMTP id
 4fb4d7f45d1cf-5f4b6dc8e63mr35464a12.5.1744797968923; Wed, 16 Apr 2025
 03:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408035833.844821-1-guanyulin@google.com> <20250408035833.844821-5-guanyulin@google.com>
 <2025041140-fernlike-reconvene-b2e5@gregkh>
In-Reply-To: <2025041140-fernlike-reconvene-b2e5@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 16 Apr 2025 18:05:00 +0800
X-Gm-Features: ATxdqUFJFRm6-kvXF9DTZ5ctKMay55IyEenq8Hx1UwGOVHXGa1wo5iRkeFUV09U
Message-ID: <CAOuDEK3b6vM_vyLDHjxYWu1UCaZ53hNse91bjkoB7vPaebEMPg@mail.gmail.com>
Subject: Re: [PATCH v11 4/4] usb: host: enable USB offload during system sleep
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, elder@kernel.org, 
	quic_zijuhu@quicinc.com, ben@decadent.org.uk, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 10:02=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Tue, Apr 08, 2025 at 03:57:24AM +0000, Guan-Yu Lin wrote:
> > @@ -736,6 +737,7 @@ struct usb_device {
> >       unsigned use_generic_driver:1;
> >
> >       refcount_t offload_usage;
> > +     unsigned offload_at_suspend:1;
>
> Please take a second and think about how the memory is now layed out
> here with your new addition.  The tool 'pahole' is your friend...
>
> thanks,
>
> greg k-h

Thanks for providing this helpful information. I'll reconstruct the
struct to minimize the effect of new additions.

Regards,
Guan-Yu

