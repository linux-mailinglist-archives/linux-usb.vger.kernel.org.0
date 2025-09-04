Return-Path: <linux-usb+bounces-27534-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EB9B431C9
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 07:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFF7C1897D78
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 05:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E31E244670;
	Thu,  4 Sep 2025 05:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PWzAy9wB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BB624468D
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 05:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756964999; cv=none; b=bJ2XpVAcF2eaQwTfu5RJSpxrg7Yi9LD1NDUFEryQszkg303Naa3kuC3OjHIrRwXK1m2voJrPpldPzBJDR4dWyIWwtZMRvnvgCw6V+biXxUlNoKruCZosPzFFJq+l+n9TcOgLOviCYtx7MAO8Gi/+nve001nDMUidt3n8JH2QHOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756964999; c=relaxed/simple;
	bh=cHXL6xHUHiNr78dezyhRkZqCf3fXZn4s6BpkJKXpUTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XtK6yrZLiU5aqMr/S2dGPSnaFgX42LJyHbQ9CwOtTvK6ATvaTfS7k2u2VUAiMIhR/RR/H8xfuhIbNT3si9szeAOqEHjPVsBwWd3mRq2AD+sEqwGqDx/btZ/JQB3dX1XHT7P7ZDZgyh58WlmIxBRXO7ffsM2X8D1rGNZHQzIuXgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PWzAy9wB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45bd1783cf5so35875e9.1
        for <linux-usb@vger.kernel.org>; Wed, 03 Sep 2025 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756964996; x=1757569796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZekwazS2g2pYhPPIj8vSuvjbizjS9SUCjW0PdNHHTI=;
        b=PWzAy9wBy2SRDWfkd7iPMJv3ENxLy50CSD2Pq0enS/j7x/LIq5uBrHXdaZXbAZXAwP
         HLc8C367SntH04TRBZrsZNM89idujw/a70LbUvtvWqM0hvKMkd38MrLlpB6CjQ47wBC4
         JklXA/2gOrnBXg0X5WH9BDLfLVgGZ0+kE/FQhO9NMVGniFLI+IGxgdz2sauA9YF0bg2Z
         Nh7tWF7YWRHGr/hTfyuRdc6J58ThCQChFFAp5kHMf89IwtPJvEh12dFpMRBUZpgV+zPD
         i0RCivn/v3S1c6/YYRoR+BiQ87Q0aXeE3r8CPBFVVHo55wyltyK7nIp4uAl+MfMNNW+P
         TFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756964996; x=1757569796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uZekwazS2g2pYhPPIj8vSuvjbizjS9SUCjW0PdNHHTI=;
        b=QNjqGuxlCYzyc/w+0sZiEsiv6VtPXRGqUX6/xk48JwgIFZei8cMCVn2rqfkNZxqn5b
         /z47UMYTpkwtAf45YTH1JUMXZA9RbdLYd+tuUjPE0BFgqMBJ9j2I/S8mYV0Hdqq58PC4
         kvLByJWfSi7IGqSstMl16UqIAR4w9+NwS+NioyalXbAFtmJoBf690hZPS2+igEgIphCU
         Rsv4J9s49LMTZbQPzUL4POTcBHW8NvbV9uV5nGYJpZrpHKgA/hlvRgyUNAyvVkcGh1Oy
         D7RcKs7+CGtJIjDlv9/J8oewHhvBrQag7IhSKoYZI8thpjyoK8XvK4M9RDeo+2RGBN+O
         3hrA==
X-Forwarded-Encrypted: i=1; AJvYcCWnokJMsSruEsof5F2Y0JXLRUanTlMeltne6Spg2c5Yn8/Oiwtb33ONIAMU4AvsGUhWd7DbgpaQgdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCYdeC13wSaOoAQaMh/Pih41raD7y3ZRFNDZSyuzWViwFZLX0i
	EtZXX4HjWiNsHpwaZNFBD1dr5iGHzy/7Njhc/3cGkj86O0x/T3houHTIklD+xBACYMfVg9Wt8Ic
	VksNifuoeRXLDY8Z7q0b43cEK1L0otJfwAlgSwt5VzE0OzZMU+YCdNQKW
X-Gm-Gg: ASbGncsAkw9C7FVKHynvhX6vxWKvRUgg0zA5L1F5qGGWprpuw9xwhvZevuegpz6sxZQ
	Slh1t4qoi8OFI4vzPZ9RJyUs6tjWBR5PMM3ktsUpgVboM2rwKWWhHmzxzQbGMtkbbMXzji0d/8T
	fhg6rQdcObfd9v4jYhX7nqoLR+lZ/JGyd2S4yOZCjIPAWek1Wj7K2wphNDqZDtSr62aBJ8JUZE/
	59AwOodb40WlO84f4LyW7VIk7LeqNTwg1Z9lgjG
X-Google-Smtp-Source: AGHT+IGKXKMOwaX1XwiLYd9cWPAOn8fRshNus9S9PFRUt8IGNa0sD7+Q7RKYMmonPYpj8+GPY4e60I9X1xIgZWTCRrM=
X-Received: by 2002:a05:600c:b96:b0:45b:9a6e:ceaf with SMTP id
 5b1f17b1804b1-45dd0d16286mr549045e9.0.1756964995324; Wed, 03 Sep 2025
 22:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903083017.795065-1-khtsai@google.com> <b50f9d10-88a3-4b1c-a75e-6c67b9d1504c@linaro.org>
In-Reply-To: <b50f9d10-88a3-4b1c-a75e-6c67b9d1504c@linaro.org>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Thu, 4 Sep 2025 13:49:28 +0800
X-Gm-Features: Ac12FXwuISttGL2s4mMoPJlKjujNxzCkzweDYjIHvsxMp4VbNeORKHN870izq7s
Message-ID: <CAKzKK0q4aioOOYZyXVp1-GTcQFaU036YoecKzvVCRPjeUAyNKA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_ecm: Fix ecm_opts->bound logic in bind path
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: gregkh@linuxfoundation.org, prashanth.k@oss.qualcomm.com, 
	Thinh.Nguyen@synopsys.com, s.hauer@pengutronix.de, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Wed, Sep 3, 2025 at 4:33=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/09/2025 10:30, Kuen-Han Tsai wrote:
> > The bound flag in ecm_opts is being set to true even if
> > gether_register_netdev() failed.
> >
> > Set ecm_opts->bound to true only upon success.
> >
> > Fixes: d65e6b6e884a ("usb: gadget: f_ecm: Always set current gadget in =
ecm_bind()")
> > Cc: stable@kernel.org
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> > ---
> >  drivers/usb/gadget/function/f_ecm.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/f=
unction/f_ecm.c
> > index 027226325039..9f5ed6f32a62 100644
> > --- a/drivers/usb/gadget/function/f_ecm.c
> > +++ b/drivers/usb/gadget/function/f_ecm.c
> > @@ -690,13 +690,14 @@ ecm_bind(struct usb_configuration *c, struct usb_=
function *f)
> >
> >       if (!ecm_opts->bound) {
> >               status =3D gether_register_netdev(ecm_opts->net);
> > -             ecm_opts->bound =3D true;
> >       }
> >
> >       mutex_unlock(&ecm_opts->lock);
> >       if (status)
> >               return status;
> >
> > +     ecm_opts->bound =3D true;
>
> Now it is outside of mutex, so this is raising questions you should have
> answered in commit msg.
>

Thanks for the review.

1. Commit da92801c647c ("usb: gadget: f_ecm: add configfs support")
introduced a mutex_lock in the ecm_bind function, but this lock did
not protect the ecm_opts->bound flag. Subsequently, commit
d65e6b6e884a ("usb: gadget: f_ecm: Always set current gadget in
ecm_bind()") moved the status check outside the locked section but
neglected to also move the assignment for ecm_opts->bound.
2. The caller, configfs_composite_bind(), binds functions
sequentially, which prevents race conditions when accessing
ecm_opts->bound.

I will update the commit message and submit a new version shortly.

Regards,
Kuen-Han

