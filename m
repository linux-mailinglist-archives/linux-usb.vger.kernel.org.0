Return-Path: <linux-usb+bounces-15110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2EE978BD9
	for <lists+linux-usb@lfdr.de>; Sat, 14 Sep 2024 01:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEA2CB25ED4
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 23:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252E518453A;
	Fri, 13 Sep 2024 23:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ifYGJIt8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3874B14B061
	for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 23:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726269915; cv=none; b=FrxuI2N+vDACFPXpTJQivA0lNbBuCLJ2lS7PuSPxwuqueBjDjERW5iflJfaZXAS1PQt5I8t74Ek95Fc3qQWWHG6P0736zH0tFhUVPOtR4iNL1nw2Y8qsCfEyK8CmPJD5rYesNlSi5NeuMXHSum63fnV4ZJPU9vcw4ipGewuzITI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726269915; c=relaxed/simple;
	bh=YhDdGu4hZiGlx+q+XBnCOedph29DSV5sGtHeIamXfXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fyxu344ePJay8tGLaY4qrE/OA4cfcm4ONsMeCFNfxHg9dFXJNAKVeJPCuG8/bbG+3gbC+vA5/1b4qVtjkvHVvar0AlyYX8mXthHnTgZ1vq+/R6tpdzmu65zHD70cgFRoTu7OAL/5//gpzaeUgoNGu5l+dZ4n8Im1brEJBs4QQSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ifYGJIt8; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6c582ca168fso7432146d6.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 16:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726269913; x=1726874713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1upeTCfWWdmhQBb3MjHQmjSH67h27z34eMn0HTUO29I=;
        b=ifYGJIt8rMJe6N1neShOnbqb7mDtAOecOH9pOE5y0gziT+jPc+/Ct1h+h7Tfgt8zI9
         qAD4s+e/d3PQHGc6eWngLkzzaqDhCza9Ah4O3X/AYlc6YnbW0K1EpYShiLs3kQ4LiLm0
         9U3AUAjqPW1fCiKV/i/JFXjrt4iBe/Yyqs/CH8ceZRUwcpu5racJ95PZ7AHeAUvxbGGu
         mwSIhtDpJ6f7/BrfK8I3vbTmcEsJtl3suYMy6Rj4hrx7nCgQuSdA8rMK7puN0w572jg8
         sZZHp8sO+3Yj5nQ3vfQrLju7nKdYG3Ef3Es7QhIexFYkArA+F0QlsITqQvZfxxO3V0Nx
         La2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726269913; x=1726874713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1upeTCfWWdmhQBb3MjHQmjSH67h27z34eMn0HTUO29I=;
        b=nUnad4hm7CdvCBVod+YNFI2gEBthaSS6TBWwEY3y3SJBbknK20yZuiSJbsHmvWzL6u
         Hvc901vM95dUFh+p0ATiTllxLCkt401lf166EXcTN7KzfzrNIUH3oF0my+J5ZifFEky8
         xXOgClATbvfGtOeLF2ndWdmEDXcRX+Z8TA4KlzeVJWE0c+pbz51ye+XQixu9JcCEVSgK
         5e6nkUQru7aPbUN1kjrKjrohACzQv173juaN+Bt8IwGD4X46xzgy9QOldfryoj4UfPeq
         MCwd72xKyA7bp9HjNQ/oCePs4MvLlSZT73gLtj78EgEtgNPtF4JZ9DGlV5AbduYNHaxR
         SgIg==
X-Forwarded-Encrypted: i=1; AJvYcCU1FxagXhyQVn3wSO72JzEzS69rnbzIP4L3HFn9LXyiL0qIzQsNSZv0UUZg2wCgvK1DvncSK7Pv8OI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTjWLyupCuIaugk0jCcX3NlSw/dhqaAAdl+ATbbD1/My16Oi6+
	ngdnW7q1Her55/5IijCXxz8MS9VstbbpSIRiM+2PP54gNbz6Afk0OhkyCt9gjmkLM8LZ/DBhcYF
	EFEb2FuQWMFeDMnDwHkOCtW2jUT/gfjH5sBE9
X-Google-Smtp-Source: AGHT+IFqtIPpQJsc7jyZAn718b4uKPn4dZBFMgeJxtohg1PFwMBWzsu9Up8tGLWlLeZprh/19Ar11aLSbpd88jMMo6w=
X-Received: by 2002:a05:6214:5bca:b0:6c3:64b6:3e29 with SMTP id
 6a1803df08f44-6c57e0b5f9cmr65012116d6.30.1726269912814; Fri, 13 Sep 2024
 16:25:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906005803.1824339-1-royluo@google.com> <20240907005829.ldaspnspaegq5m4t@synopsys.com>
 <CA+zupgxMefawABGDkpRy9XmWJ5S50H1U9AF9V3UqX2b5G3pj-Q@mail.gmail.com> <20240913181251.3upf6zme2j2mobv3@synopsys.com>
In-Reply-To: <20240913181251.3upf6zme2j2mobv3@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Fri, 13 Sep 2024 16:24:36 -0700
Message-ID: <CA+zupgzyK8hL3=b-P5uA+bhuhZUVDva26a7fo-JdTmPqRVgDnA@mail.gmail.com>
Subject: Re: [PATCH v1] usb: dwc3: re-enable runtime PM after failed resume
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "badhri@google.com" <badhri@google.com>, 
	"frank.wang@rock-chips.com" <frank.wang@rock-chips.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 11:12=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsy=
s.com> wrote:
>
> Can you include this info in the commit message?
>
> And while at it, can you also update minor style change to remove the
> brackets for single line if statement to this:
>
>         ret =3D dwc3_resume_common(dwc, PMSG_RESUME);
>         if (ret)
>                 pm_runtime_set_suspended(dev);
>

Sure, sent out v2 for review.

Regards,
Roy Luo

