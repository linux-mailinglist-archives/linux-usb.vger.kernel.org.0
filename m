Return-Path: <linux-usb+bounces-26185-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A038CB125D5
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 22:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C988C5A5CBD
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 20:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3255525B1F4;
	Fri, 25 Jul 2025 20:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OjhrxQr+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C74625178C
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 20:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753476687; cv=none; b=Hjo9XhenRmsus5UBbsVgTReG7j9haNgaOK2MNqbr+wTVjdH/9W52WjVgzeknKyB9bQZ6Bq65k6Mwn1ThFN2dn4/30bFgjcq41T6IKM2mgWvJjaBqTbBcN2akjqfTMr0xOxTgPj9ux22dfhUjfvhEuDPgyYvVEYP2WRXFPj5QiU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753476687; c=relaxed/simple;
	bh=FthdTqsDncCCx6NjU7yT98rPjj0CY461gcD1JzafDOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhPNe5Wvl9yTsR+DA/hAHSLgwp30nenGdh7vXbgKJ5I4Cn9mPKA3MdIe+tGDrEFSExhMsRaeIqzTeK30xTd9A0QKFe7LTudfdh2FXY/kJ6j4PZfbnBpHtdYOWrJ345mHRYvamLBpv5Par0OPcRTbLj632BTYKktsTjqvNtEFpkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OjhrxQr+; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32ca160b4bcso27260871fa.3
        for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 13:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753476684; x=1754081484; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a5BT1SS+jMIoUQB40I1MJEAumu30MbcFpZLbewQz58c=;
        b=OjhrxQr+ioDs4SV22uosvInNx6w6EjDEn+ndoCzOoYmcxC/6vAYxoKq1zkvtDMVsgE
         6qDjrO6br1mb3QWByg/XBW7e9wb3Gta9APgnkKfvB0Ns6JAff2QaalVRsR76NwU3ymoI
         QqGhn7ssMxW1qABlYR/syhcPv9dqCgFkH2OZNutXZTgZuefn+fEaE8e91cC7Qo7IlebP
         iK87DOvNtzdnPOtYCOHRJKEP5iGsY1G2jaIn6ViTzgPU/pGjGaqZeZWa9DQ1s+hsO0B7
         rvEKTqFZStT89iOSDaI2rpUBtjh/0Cc3/m9nrwU+Y+I0Nv5JbX3dD8+azS80086yllvr
         u7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753476684; x=1754081484;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5BT1SS+jMIoUQB40I1MJEAumu30MbcFpZLbewQz58c=;
        b=irMjyQpuBq3MWH/Fsg8U+itwEX/5/3vTVfc8GbnOXjBmdIi4fFMVUx1SO5hzwMgUts
         TlWOO2FE8fxCqQ3Vxr9Z/2fsQbHSUTZI9VweL9V/rGnDoH7RjgGHmlvThUVk4F2hdmJu
         yagDCdWkUIzHhaqUdM7ORsG+ACHyRHScpgsTbScJIWxWCdho7oeFzn3kxKBFhsjoDWzy
         pBTElWYyzujf/4jZi7kbIcL6hNYjiKddkoYCfaG25JtSOhij07Jx96ElmlSHqFsVgVuo
         Rujk++KIiV+0NRpBnmK47oDhdzYJNH3/W+dENL63eE2fbOQWOHOPCLc+4F/d9WD9uDZa
         d1fg==
X-Forwarded-Encrypted: i=1; AJvYcCUgb3LCQVCibLlTr0ZO20ZUsZcmghZcGT0hdNWat3k5AsEf8kxivJq+l10TOms6RnT86u5nOgkqhnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD0eGNahun4/PezQbPBQ61J14I4t3TzWbWb7IZrRAyo9hjgjgO
	bpsjuP6pS7UHA2BpW9G1yDAPto+uJXnFTdK+ucoZ7561SqaxtQ+nrxKzAFHQ3E3Ocw2enejxzdg
	GsK0jaDZ9dI7ksB74m2GjbS733Zdcx+a7l550esp7TxRtjUf30eGYnTTHW6o=
X-Gm-Gg: ASbGnctRm9DBKg8E3bQmLOff3TmkAkC0Uq6L7U9MbcLTpf9DbqD9JdrEBvF+HrM+zmT
	M+MQxZHhTDTPSiVD/XnbTfmrQ4/UMKKOSGo+cu5NbjWU4SneXuAMi2AEglwf/CbfMZgZlkhWX/D
	rooLpDDNL0FXhKT3NKbTQbdV4riseLbT5OG9M037u9O/H23T5qjdXYhwG8uq1JapCqHtVSm447M
	gq/6Euy3EK8ouXb8g==
X-Google-Smtp-Source: AGHT+IH+Jx4ZVR8xsi+R7T5/6uBGsohHzNqjS4AjQ+RbAbQSOQFok2ZyRsJDVjLzhi47t1GIEtgSaXyg0LMrkdLcVa0=
X-Received: by 2002:a05:6512:1101:b0:55a:521a:6e8a with SMTP id
 2adb3069b0e04-55b5f495b6cmr1063198e87.37.1753476684043; Fri, 25 Jul 2025
 13:51:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALU+5Va_zeqS5YK7v3HNvDKkg8srqc87P5ZaQUK5tGFUMyNrkg@mail.gmail.com>
 <2025072527-entrust-childless-3ae9@gregkh>
In-Reply-To: <2025072527-entrust-childless-3ae9@gregkh>
From: Olivier Tuchon <tcn@google.com>
Date: Fri, 25 Jul 2025 22:51:08 +0200
X-Gm-Features: Ac12FXxB6lJSsBmXWiJdn2DxsrweBfmgkR5E-bsr6x5D-7RampktPFHTwlVDO4Q
Message-ID: <CALU+5Va2Onf8AaZx0WEVN4fVY8ErrvHQmRDF+gPFmLEV7HsMiA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: Add gadgetmon traffic monitor
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > Signed-off-by: Oliv <tcn@google.com>
>
> Doesn't match the From: line :(

Indeed, fixed for the next patch.

> > +config GADGETMON_BUFFER_SIZE_MB
> > + int "Buffer size for gadget monitor (in MiB)"
> > + depends on USB_GADGET_MON
> > + default 4
> > + help
> > +   Sets the size of the ring buffer used to transfer event data
> > +   from the kernel to userspace. A larger buffer reduces the risk
> > +   of dropping events during high-speed traffic bursts but uses
> > +   more kernel memory. Value is in Megabytes (MiB).
>
> <snip>
>
> Patch is totally corrupted with whitespace issues everywhere, making it
> impossible to apply or even review :(

Arggh, not caught by ./scripts/checkpatch.pl.
Fixed for the next patch.

Thanks,
Olivier

On Fri, 25 Jul 2025 at 17:33, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> Cool, but:
>
> On Fri, Jul 25, 2025 at 05:25:49PM +0200, Olivier Tuchon wrote:
> > Signed-off-by: Oliv <tcn@google.com>
>
> Doesn't match the From: line :(
>
> > +config GADGETMON_BUFFER_SIZE_MB
> > + int "Buffer size for gadget monitor (in MiB)"
> > + depends on USB_GADGET_MON
> > + default 4
> > + help
> > +   Sets the size of the ring buffer used to transfer event data
> > +   from the kernel to userspace. A larger buffer reduces the risk
> > +   of dropping events during high-speed traffic bursts but uses
> > +   more kernel memory. Value is in Megabytes (MiB).
>
> <snip>
>
> Patch is totally corrupted with whitespace issues everywhere, making it
> impossible to apply or even review :(
>
> thanks,
>
> greg k-h

