Return-Path: <linux-usb+bounces-12713-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1F1942E6B
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 14:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1961928AB70
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 12:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C471AED5A;
	Wed, 31 Jul 2024 12:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EvhkjTlY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978A41AB53D
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 12:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722428943; cv=none; b=GjKGHtXe6vA34NscOy+rQMnc2VltIiFT+cyNMsLI2Q1vt8sPc47NIizLVW5pFHmTaZOjRaQxCGfQKFAAx/79KonDFyr3Q/3i3sifZbRVfKnBOqeyZJFOuD81aj89oDRO7pjfbGQ12lM08gPrH8PW+VUAvxjGDCznx55h1rIMqLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722428943; c=relaxed/simple;
	bh=7SImBkPzwBvPH1KTt848yOLO+/PGhbaK7RRtqvT4ezQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RnEjKdbib8CxEtLjkWbXEYdMSL01bZMbcLHnYLITWKF9Re4glmH7X09HeZEzKl/5IGFxMzBxJD9QV/Q25b9GKaelJI2g70XG3jRJFqcK7jkXUlzszBVne3+eW+mC4u1ycmGITS73cHcuOHryQMH5r3k+mi08KW2I1LjkdThT1ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EvhkjTlY; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52efdf02d13so9207881e87.2
        for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 05:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722428940; x=1723033740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SImBkPzwBvPH1KTt848yOLO+/PGhbaK7RRtqvT4ezQ=;
        b=EvhkjTlYgP0Wzs28P8vKHYiyuGhsAREnAdYYoDjtp1fW4STaxDiZ82ZNy4inCWqKgx
         KrFKC/Ig5F1Wu47u9k626jQjcY/pVsd0xbGeH4ocFjIPqJzxC9X5/GdZzHceuVzlrwqF
         AH6WD4Sm1Lqi+S0WYv0QmzK4/n7dnCmmPXGJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722428940; x=1723033740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SImBkPzwBvPH1KTt848yOLO+/PGhbaK7RRtqvT4ezQ=;
        b=QEAp+55OxghUH2uWT6Fc17n3fDB2MXYGP41HojgLLxVO9UrIYSL/M2IKMuqUm/uRbR
         Vyshf/3GNuR7U/NaT68WJtm5d+pzoE5RC1yp8ydp6rXdCbTk9i2qHzFr38SPlDE3mjc0
         65hfLCiUyp7bPo5tdjutgf/t5FnZtvBk2RKQ0Dzki2LSU/agjv7SYFnoOH1PWwYzEoZ0
         6jna7zonHY7JRrnMdwGaGdXDtKzbLrHlA3ZM1siRqzrdZN8AttZEHcn8T4+lMoP1I0nq
         tqMSj/VOBMDTgsz/wMdLChyoMTrYleDxBRwqoFkNZTk63sAHq/y5w+ZRTrLycbS92KYW
         afmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV217J0HrBvnG3e9VW5oTSVcsHAUBIlLqARdvRBhJ6b7CidfmLARrg1bkSf6wmHu695dRTt8wShnaqsc8wTRk3HN2X5L+dCNxSE
X-Gm-Message-State: AOJu0Yw4uKNa8fmU9RZDr9KdbH5twWCqeq1XDS34nowy/ixQI5Jf5cP1
	Nr8CeMEBMuPegvu5pHyEDHaDU6e9zAJ1pI+QigwwYdxa8lUigO7PpFoqYAXid7kmIvbEsw8DSj8
	XWyuRUEt5/l02YbTS/UEwLthrzMGOn3KS/ac=
X-Google-Smtp-Source: AGHT+IHKDZw4UHavgEP4WJc7yu6+M7HKDPYQR7MyYwvbKTWQB83Zv1HddT1enWQhAhG93VlGKiB/lP+tVHQLWatfbHs=
X-Received: by 2002:a05:6512:3484:b0:52e:716a:1898 with SMTP id
 2adb3069b0e04-5309b2d8c35mr9954332e87.58.1722428939569; Wed, 31 Jul 2024
 05:28:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725074857.623299-1-ukaszb@chromium.org> <121d85fe-976a-43c4-95d2-1a066234a758@linux.intel.com>
 <CALwA+Na218B0PK3QG20_XFovJMfB4ud7B9Z=4kX=xwu8bjAvHA@mail.gmail.com> <115eb4be-e336-4a29-84d2-bdafb84a0f9f@linux.intel.com>
In-Reply-To: <115eb4be-e336-4a29-84d2-bdafb84a0f9f@linux.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Wed, 31 Jul 2024 14:28:48 +0200
Message-ID: <CALwA+NbLsg2qfmaHagMNimN0mvU6vNP-rsY31O-9X6oZovAOJQ@mail.gmail.com>
Subject: Re: [PATCH v2] xhci: dbc: fix handling ClearFeature Halt requests
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 5:45=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 30.7.2024 3.17, =C5=81ukasz Bartosik wrote:
> > On Mon, Jul 29, 2024 at 4:11=E2=80=AFPM Mathias Nyman
> > <mathias.nyman@linux.intel.com> wrote:
> >>
> >> Hi
> >>
> >> On 25.7.2024 10.48, =C5=81ukasz Bartosik wrote:
> >>> DbC driver does not handle ClearFeature Halt requests correctly
> >>> which in turn may lead to dropping packets on the receive path.
> >>
> >> Nice catch.
> >> Looks like a halted endpoint is treated almost as a disconnect.
> >>
>
> ...
>

Sorry I didn't get that ?

> >>
> >> Hmm, I need to dig into this.
> >>
> >> I don't think we should push this problem up to the request completion=
 handler.
> >> Maybe we are flushing requests that should not be flushed?
> >>
> >
> > Section 7.6.4.3 "Halted DbC Endpoints" in Intel's xHCI specification
> > says the endpoint can
> > be halted by HW in case of error. Also it can be halted by software
> > through HIT or HOT flags for DbC.
> > I wonder how to recover properly from the Halted state caused by HW
> > error ? Does it make sense to continue with
> > the requests or just restart the endpoint (flush all requests) as this
> > patch does ?
>
> DbC should respond with STALL packets to host if HIT or HOT is set.
> Host side should react to this by sending a ClearFeature(HALT) request to=
 DbC,
> which should clear the halted endpoint and HIT/HOT flags.
>

Based on that I wonder when the DbC endpoint is not halted and it
receives the ClearFeature(Halt) request
whether this is correct behavior for the DbC endpoint to report a
STALL error in such a case ?

> I think we may lose more data in DbC bulk-out stall cases (data from DbC =
to host)
> when flushing the requests.
> Data is copied from kfifo to the requests while queuing them, if we then =
flush them
> we will never send that data to host.
>
> >
> >> Do you have an easy way to reproduce the stall error case?
> >>
> >
> > Yes I can easily reproduce the case with the stall errors.
> > Would you like me to run any specific scenarios ?
>
> I pushed my thoughts to a "fix_dbc_halted_ep" branch, it compiles but is =
not complete.
> It mostly focuses on getting the STALL case for bulk-in working which thi=
s report was
> about.
>
> I think the code itself best describes what I'm trying to do.
>
> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_dbc_hal=
ted_ep
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?h=
=3Dfix_dbc_halted_ep&id=3D8532b621314e93336535528d5d45e41974c75e01
>
> If you can try it out it would be great.
>

Sure I will test your patch and get back with the result.

Thanks,
Lukasz

> Thanks
> -Mathias
>

