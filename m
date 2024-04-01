Return-Path: <linux-usb+bounces-8697-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1618945FE
	for <lists+linux-usb@lfdr.de>; Mon,  1 Apr 2024 22:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 278911C21BD3
	for <lists+linux-usb@lfdr.de>; Mon,  1 Apr 2024 20:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDFE50271;
	Mon,  1 Apr 2024 20:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AKmcHhhW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2805E2A1BF
	for <linux-usb@vger.kernel.org>; Mon,  1 Apr 2024 20:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712003573; cv=none; b=c4csC7eRXZ2tKNQLriJOxo/SGaknK2K3p/0p32XzYmieBeni0hx1fMZbuDWPuXx+NSPeTBCx9NTJpOSR4T+aAiYLqkYt9mJ/Kg3ZDXw9p1OlGBwH38yXMtqTue2JRz6rbopCNrSXeAJlLE6wrSgBqrSycdiTqDXHXh91QM7BEuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712003573; c=relaxed/simple;
	bh=WlWF4sZthTybsqjHZ3Wo3dh3Wr4y3oJSrsc10FAPues=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NxO9bWG/2RRuF6yUU2/VmrTHtYmG9vUNhXv3pPZpDzd82s988KVZu6jQ39xdgfel/O53G+/Oia487HGOc/pBF3slFBub9/feqfhzZXJZ7Tca5D61Sz3YRwb2clZevwAH14JujRS7QQ1jkO1Bbuyep4PCSswc3sZYxkrnPw/gz9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AKmcHhhW; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4788939769fso157357137.1
        for <linux-usb@vger.kernel.org>; Mon, 01 Apr 2024 13:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712003571; x=1712608371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlWF4sZthTybsqjHZ3Wo3dh3Wr4y3oJSrsc10FAPues=;
        b=AKmcHhhWDMsQ+7vp/S1IgPhqwTgKRW1EL9voEr26+4ZuTfAv8IiQO+jz3oZLRMHbfB
         LS4BYnE20RySCks+AlE3cQ3rZiOadp9w/mWxAGaKtXBT1mGE3G/jtFb9fswth3W2E86V
         n3IK70UmPvnSKOhBFs7RN/KBYs0D2yWIITHBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712003571; x=1712608371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlWF4sZthTybsqjHZ3Wo3dh3Wr4y3oJSrsc10FAPues=;
        b=pziaJ/MEOKDXKh4v7/TOuYoMMOojr09/qOKHEK5IhQ9JosmER7BZl8wZikSbtDxt75
         FsveGAOukULCTiWXGWuiHAk9d/OlMBy5cgVMlZ2P+N+B49EEbyAm+ZSTZHQ+GzhvvbnF
         SwdEJsK98hkJq2a2TQ/+Wf46n/ArW5CwsJa2Bhsb+zpCwewvgahg6uSovZASL+IrlByl
         fZHLpOn1CMkXgZ9nw/ZEhUzyXk/MI3rLUHjwpEMBfxR0Dl8m07cirP2+9SvaEOhAu3Uw
         j/HpMyZQ4L71nQKuZYIy5aj/BKGLxe1Uv1TfISLM3L9XLh7ol52yrPczGmtgSrdOJvSV
         IDSA==
X-Forwarded-Encrypted: i=1; AJvYcCUOmK+UxV/YF5Z06FIN5AeC5ehAB6D6EGw0BBsbEQetlpdnLLjS1vKc/Xrs27O3YIs0EyzV/jp+X2qjGd38MKsfhUVDMTRlOd5t
X-Gm-Message-State: AOJu0YxPajvJUfHdPvwUDIErWekK95zydpdhNVpwFF6FuAeVHssRGdCc
	RvRcPXg2GECgTibgO5NEAjHeEfSTqP04oBSrCXIDlu9BYtswSitd+4YBIiog4vWhzAKTqV8VzHj
	VqPvCYyhDJVeEFhPyArUx12FZrnuVXrgZVuE2
X-Google-Smtp-Source: AGHT+IEBUFuHC1uovMRbuGkUNY7LgsBGowAQKo3d4i+4cDqZFxwCT/kL8PqtYC40kciKNJcNDSxwr9+UZ8+Pke79mBc=
X-Received: by 2002:a05:6102:3bc4:b0:478:2f66:f641 with SMTP id
 a4-20020a0561023bc400b004782f66f641mr7884700vsv.34.1712003570896; Mon, 01 Apr
 2024 13:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org>
 <20240325-public-ucsi-h-v2-3-a6d716968bb1@chromium.org> <1b040be3-acd7-40dc-bc9b-24ea6d4b8377@linaro.org>
 <CAB2FV=614YLrsj6yPxRd1uVsF4n3EabLoXwL1Mtrk9Eg+5Mo9g@mail.gmail.com> <CAA8EJprn_95+ZnwmAHEQpQjQqZ5-Na1pj32TCY5BFMt7Uv7eWA@mail.gmail.com>
In-Reply-To: <CAA8EJprn_95+ZnwmAHEQpQjQqZ5-Na1pj32TCY5BFMt7Uv7eWA@mail.gmail.com>
From: Pavan Holla <pholla@chromium.org>
Date: Mon, 1 Apr 2024 13:32:14 -0700
Message-ID: <CAB2FV=56z2dRYWNWf7Cbr+ubygO1TRgZzg-RqFzZeByx+tBehA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] platform/chrome: cros_ec_ucsi: Implement UCSI PDC driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 8:13=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 29 Mar 2024 at 17:09, Pavan Holla <pholla@chromium.org> wrote:
> >
> > Hi Dmitry,
> >
> > Thanks for the review.
> >
> > On Thu, Mar 28, 2024 at 8:32=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > > While it's fine to use platform/chrome for platform drivers, please
> > > place drivers which have a subsystem into the subsystem dir. I think =
we
> > > don't want to hunt UCSI implementations all over the codebase. Please
> > > use drivers/usb/typec/ucsi/ location for your driver. This also remov=
es
> > > a need for a global header.
> >
> > I agree with your assessment that drivers/usb/typec/ucsi/ is a good
> > location for the driver currently. However, the driver is still in
> > early stages of development. We may have to account for PDC/ EC quirks
> > (we have multiple vendors), add FW update functionality outside the
> > UCSI spec, or add PDC logging functionality. While I'd like to write
> > separate drivers for those, some of this functionality will need to
> > acquire a lock over communication to the PDC. Even if I were to write
> > separate drivers for new functionality related to the PDC, maybe it's
> > better for all ChromeOS PDC related drivers to reside in the same
> > location. I am not sure what form this driver will take in the near
> > future, thus I would prefer to keep it in platform/chrome. Maybe
> > cros_ec_ucsi isn't the best name here, cros_ec_pdc probably conveys
> > the intention better.
>
> In such a case please consider using auxilliary device bus or MFD
> cells to describe pdc / ucsi relationship. See how this is handled for
> pmic-glink / ucsi_glink.
> The drivers/platform should really be limited to simple drivers, which
> don't have a better place. Otherwise it becomes a nightmare to handle
> driver changes (this applies not only to the UCSI but also to other
> drivers which have their own subsystem tree).

Thanks for the pointers. I will move the driver to drivers/usb/typec/ucsi/

