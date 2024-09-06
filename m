Return-Path: <linux-usb+bounces-14794-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE6096F7E6
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 17:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 242561C241CC
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 15:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD751D2787;
	Fri,  6 Sep 2024 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RMp5olOx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B61A1C9EA4
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 15:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635477; cv=none; b=WFjwRHDktxLUv+cL0jeTbTw+xQU2AnWngtuu5pM9wR0iSCTCkzPDwvJoJqd67/DoJkG29etjuxnmsadtMGwzK7/9KczbrwzIaItsummdmNgIjacRkKp5/7VhCA+m/Ka8Fo/2khLxL6ydn8aDUhfKIZIMG8diJCCEEHMZTSIZa64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635477; c=relaxed/simple;
	bh=rf4UTRwtuX4PsvIkw4m23QYyCQdn7lNWAwtBCUtCyww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=by6H50v5pHuMvrq4OQX3zkma5AB1ZYHRat7qChjVeKcIRtDBY01Rc+8LeAlQoj4GG8pkYkbreDkCyvGFFRiHOuf1yd6Sqdveyi1kg/w2kHhiVG+YRBIvtHggXIQvmwEFwNX8DgLlkA2c8EXn9NmBWXtQQhP7/2Q0z7qaoq6kspI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RMp5olOx; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5334b0e1a8eso2614683e87.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2024 08:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725635473; x=1726240273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tui8ro7/0J4XAAKxms9MBaVs88CJKZbuhtKePx9SuEI=;
        b=RMp5olOx0EsfQaXRS6Iw6yXOXwqqvQkQ6xEA9zhV73bbibDgJaPH1i1klVTho3QtH4
         W07D3tblzGWsVL0uMO5bFpUMOCt30hG8MovY2i9648jeS26Z+GaiTJnPwE86hI4Asg3L
         +KsEI7oILJXa/cYhLdu1mPi3BN7gfgE1weH0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725635473; x=1726240273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tui8ro7/0J4XAAKxms9MBaVs88CJKZbuhtKePx9SuEI=;
        b=ro1hUJ+gm8Yby/k4UcgmholHBkf2h0VDcWBsoMMUqJaRXcqD6hM6V6ut/9cHfewtJI
         D5KOa9+PTIUPhHYOVKZcu9rjzdSwJxEgXnlbcSq6SsG9lUVzhqKobJTOxSYGbMmCDa0Y
         mQRy62QyeNclrmiQtkiDv5MuHDxiM0ZYak4CemD3CmRuWP8FVZmYQRHQcJRUvkqWlxtG
         QKA5NVu0adAtAFXo/MQJBOM8+errFw6toIDvy+hUyOQoQkqd6jYkX9BGP2I5OuJGOdae
         obPKlPmqmyN5LhSL5QTcXvKNAT5UDhWO0sjBCRTEztpQRu/CgAifmXk9j92csql+ppqC
         HCiw==
X-Forwarded-Encrypted: i=1; AJvYcCWrffGS7y9pX/nSleiU9ZPVB+pxVaVgct5f/PpVdFsbypPJS0GKAMQ17DwT2ZjyOY9DM6omUJc6hWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS6Qqhm7XCuySq2itoRlnO1oPQhFbYNT8D4F6626pHCiRA0emS
	QG4HtEICeyDRGikAVgekX9w0vNAeFlrB4UA60CPilpUzsTgZkzrDqHIrWLPP4plDsaB6BprhN66
	MOd8onZmr3reqsgNRXhN6oxx2I0yTMq7XuDE=
X-Google-Smtp-Source: AGHT+IH4P9eM8i2IIHGd9L4brJirB7x2Q+j1nT07a975rHbXmAf4GceRUszC0hwV7Z2cieMb0UOlUX93hGD/hXWsKak=
X-Received: by 2002:a05:6512:3d86:b0:52e:74f5:d13 with SMTP id
 2adb3069b0e04-536587b3f46mr1927825e87.30.1725635472796; Fri, 06 Sep 2024
 08:11:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903163033.3170815-1-ukaszb@chromium.org> <20240903163033.3170815-3-ukaszb@chromium.org>
 <ZtrA8y0266RTm5Z3@google.com> <CALwA+NbiW+Gt9fi6Y+_xJFUEQWZFp5cvB5kqw_LVd4Mcf03Xtw@mail.gmail.com>
 <2024090608-slick-shaft-1c8b@gregkh>
In-Reply-To: <2024090608-slick-shaft-1c8b@gregkh>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 6 Sep 2024 17:11:01 +0200
Message-ID: <CALwA+NapBsJH68S50N62etimstUg6QUrMqUJ2wDJWKyvxHF6SQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] platform/chrome: Update EC feature flags
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Pavan Holla <pholla@chromium.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 4:07=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Sep 06, 2024 at 03:53:06PM +0200, =C5=81ukasz Bartosik wrote:
> > On Fri, Sep 6, 2024 at 10:44=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.o=
rg> wrote:
> > >
> > > On Tue, Sep 03, 2024 at 04:30:27PM +0000, =C5=81ukasz Bartosik wrote:
> > > > From: Pavan Holla <pholla@chromium.org>
> > > >
> > > > Define EC_FEATURE_UCSI_PPM to enable usage of the cros_ec_ucsi
> > > > driver. Also, add any feature flags that are implemented by the EC
> > > > but are missing in the kernel header.
> > > >
> > > > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > >
> > > Same as previous patch, it needs your S-o-b tag at the end.  See [1].
> > >
> > > [1]: https://www.kernel.org/doc/html/latest/process/submitting-patche=
s.html#when-to-use-acked-by-cc-and-co-developed-by
> >
> > I have not added any modifications to this patch. I understand that my
> > S-o-b tag is not needed in such a case. Is that not correct ?
>
> If you are forwarding on patches from someone else, yes, you HAVE TO
> sign off on it as well saying that you are allowed to do the forwarding.
>

Thanks for the clarification Greg.
I will add S-o-b then.

Thanks,
Lukasz

> thanks,
>
> greg k-h
>

