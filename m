Return-Path: <linux-usb+bounces-27180-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA508B31323
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 11:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B12BB1CC4B8B
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 09:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36622F3613;
	Fri, 22 Aug 2025 09:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m+y63BuS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966982F291E
	for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854888; cv=none; b=LaH06Ls6s9e2/3xdfBOfbZHHeHRtWqa9WORObR30WlWNq6LOyg3LOAB439QmYCRq89oM4mcxpITGjw1kz1esw6dcpRvSE2hdfgucW5NXKaQiV1Rap5Dm2bxOu2YqxtpDcVw9xeAljQsyB3paiPTCNeFy10LsF0nD5T+pQHEpKsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854888; c=relaxed/simple;
	bh=bISrXedBRm1542hk6g7KVXrJFTF811Z2NiT0bOZwz4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/I1k5lxtsS2T/nh66ItE7fAK8RMSvMFxyp6wc6wQNYdG4LhIkWhYkDLhG2WjBzzKcrhw2fjkHSxLUEahKjsGpFsZLmbPIa+uDeLPIfJt5Xw7Tpat33TkWRuPso5i/2c+4cru54EFZw20Uhsr786PibQ3WNuBXNyPP+EHQgA/1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m+y63BuS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-459fbc92e69so57785e9.0
        for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 02:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755854885; x=1756459685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcdOq3/AhZc4gzL/OcA3gLcMXE9NwnaXeS3V/wGL+YM=;
        b=m+y63BuSmWlFVo/kYAHykNLHBpMWPxI19O0xYO/7FYmJRBmAei3Fkq4iKMJR8mE3yr
         V3r//ZoO84puYgxC5RubD/6Gi/fNDcAPNn2l9rLLq9XEzUopJLcK51ikGhZxV+dUTVzD
         155m53bCinqaCMaB6pMw/U+9DPppl/PE8FE9rFzBtacwpLHsu3P4Qh3MJNF+LirdUYSW
         BY19CqrQTSVuMpNhBqB2E515znvDuzUv52TTezWpsKcf4UxNylIs0nm6iWx4pfiN71vP
         NUWQoJJzSNxsAbdyoJlgW7KuOhub8lyqLf2lgIhgXZjrwX7upt8rx2r27SAROaCDbgo+
         Oq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854885; x=1756459685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcdOq3/AhZc4gzL/OcA3gLcMXE9NwnaXeS3V/wGL+YM=;
        b=HxIq4dk1/mM35vsQdV+QaA8c9pu07JTkcZl+yeb/H+hLGvRRZ1jS1P0GAgXeOOB1el
         Z/15ht6tuX0vvqe5h+BjxgF8UxMvBTkEAi0SOeoMMABa6s0IwGSdtnwOrLJE4WsA9mw8
         AYVm0NKGZQzAbBKH8/OUhZgkPQZK5ABIMWiN1NihMD0MaftWhUAmQf+gLi86U30WxDMm
         OkalsD7KSA/hH2tnE0BrbJrYo9CxgnMCSw/ot5X89oIvqwB0TvbmPjg5Kzv7Jz7xnwie
         VovxmydtHsXUY4O0PXoIO6Cldx47fH3iNGafrRFBzBdVQKMimnAHfRrleJzu4ymnisQ5
         kspg==
X-Forwarded-Encrypted: i=1; AJvYcCX4k47VdgeK2arUcO1uEVsAEpHHsPZ/3VUItpnNF8eB+khc0ZXIqSRKU7NT0SV7cy0mT1MdgD0OqOY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+yPlwGvkWOOUtR7lDMYqrVXj8FMMxWIurHP6cyH3yJPfGVnS2
	r5/M9LFxsBVH6DpfDUHInhGQXsbB8vwplECwf2EMoZlhFpG3Z4pnol/PeNGEkMrK2zKKeUVP1Fi
	eqh3iyeVmTtJ6zXhlLOvTOz64wwCkhI1NYQf75gCU
X-Gm-Gg: ASbGncsOJhHYsKOEMl1p/T3DfWWwZqeGJ+p/9xpTZmpC+H/nbTbxrntnOreZn0xf29L
	Ij+ugzBl7fRaIWYe6P6aF41hSO/VULugWljonwyuqJiLYtyuuqmuWvdrtTqZ6vojEYdlCI9z8Jb
	9YHUG5YC6u3pBycz0jyVoAXSj8EAeaUSuyRqPDut/llVeiBkfRzTUTR5nTJRiM5A+zbby7nfG5y
	bX+RRRxunva9ciSDyjZaQfKXVlaKwJ1WJwmW/ynOLo=
X-Google-Smtp-Source: AGHT+IECdN7Gh5fqjQyNp7ltDXL7VtmhAF9xVecCo7XiPFvuWtgfwPRPVcIIo4icw0CZIP8dQjiU5C5FrDl+Krj73Ks=
X-Received: by 2002:a05:600c:2d47:b0:45b:4acd:836d with SMTP id
 5b1f17b1804b1-45b52128850mr881855e9.5.1755854884609; Fri, 22 Aug 2025
 02:28:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818060757.2519126-1-khtsai@google.com> <20250821233035.e2yl3yvoq5i4jpdz@synopsys.com>
In-Reply-To: <20250821233035.e2yl3yvoq5i4jpdz@synopsys.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Fri, 22 Aug 2025 17:27:38 +0800
X-Gm-Features: Ac12FXzruHBanMhLpp_WNWc69jWB0ds2jW9yuoEE6XI5pqlE8vzK2YCyhFb7asg
Message-ID: <CAKzKK0rrCojqGKh9N8vSHOZkzu27wM88Fj8HQoX38QLD5FVr1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: dwc3: Add trace event for dwc3_set_prtcap
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thinh,

On Fri, Aug 22, 2025 at 7:30=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Mon, Aug 18, 2025, Kuen-Han Tsai wrote:
> > Changes to the port capability can be indirectly observed by tracing
> > register writes to DWC3_GCTL. However, this requires interpreting the
> > raw value, which is neither intuitive nor precise for debugging.
> > Monitoring these mode changes is essential for resolving issues related
> > to USB role switching and enumeration.
> >
> > Introduce a dedicated trace event to provide a human-readable log when
> > the port capability is configured.
> >
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> > ---
> >  drivers/usb/dwc3/core.c  |  1 +
> >  drivers/usb/dwc3/debug.h | 18 ++++++++++++++++++
> >  drivers/usb/dwc3/trace.h | 17 +++++++++++++++++
> >  3 files changed, 36 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index 8002c23a5a02..370fc524a468 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -156,6 +156,7 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bo=
ol ignore_susphy)
> >       dwc3_writel(dwc->regs, DWC3_GCTL, reg);
> >
> >       dwc->current_dr_role =3D mode;
> > +     trace_dwc3_set_prtcap(mode);
> >  }
> >
> >  static void __dwc3_set_mode(struct work_struct *work)
> > diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
> > index 09d703852a92..70d90790f872 100644
> > --- a/drivers/usb/dwc3/debug.h
> > +++ b/drivers/usb/dwc3/debug.h
> > @@ -13,6 +13,24 @@
> >
> >  #include "core.h"
> >
> > +/**
> > + * dwc3_mode_string - returns mode name
> > + * @mode: mode code
>
> Minor nit: would be better to document as GCTL.PrtCapDir value, but it's
> obvious looking at this small function. So it's fine.

Thanks for the review. I've updated the description for @mode in the
second patch as you suggested.

Regards,
Kuen-Han

