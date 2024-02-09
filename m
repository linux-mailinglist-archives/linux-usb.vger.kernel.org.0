Return-Path: <linux-usb+bounces-6180-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA72850031
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 23:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC4E6B2DBE0
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 22:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1639328370;
	Fri,  9 Feb 2024 22:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TyS7bt6p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD272134B
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 22:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707518054; cv=none; b=KUlTKpdLbKv+NglsjOIrbhOkR4iXiNeM6OPc5dzoiDR/LsurNEbhE4CaLfwvR3YPPMeTOkmpNcY9kWkQdtxIMezRxTlRUHvTpm3+GRRK0Bsorh6l10bphbAEF8hZ3GFcuq6lK7hn5xFZefmzAnHUNJuvNA82IOTcV7FyLn6GaVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707518054; c=relaxed/simple;
	bh=4h7WJ4BT+GJLocVAc06kxKXfu/9WVi543Y6ttRuJ7oU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPhOYWEuC2WSS5L0+tx9F0+zOE4ZEzsSS2TjsNPfnxpYKGHjV3dl2bYMVv0UQesrIu8efTkp6v+NsGpL2tfdUQC1VKA7yeuWLcacarj3jVOn6GSfJGF5rmTEWAw/nYN0P9O6GGO8tpor+/zswaXTdmBg31bOz5dUA5CMvtF104c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TyS7bt6p; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-604aab67616so16100217b3.2
        for <linux-usb@vger.kernel.org>; Fri, 09 Feb 2024 14:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707518052; x=1708122852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOsPZzNjTKMmb1hLhWGHgsYjPAZfnhQ0s7pVdVmGej4=;
        b=TyS7bt6pHXhrZwcidRDAljsnYLWULP3JeBRSw73DhTkTavGj2I8HH7ylz/5tcPGAqd
         itknjYmKlEoDe64ZcAZ4aYPefsxFG7mBybiwkgC7Z5Pz8HLIqOA9SO8PRu2FU5PUr8jZ
         fgXY0RjpQwMiF/tNq0i6+IVxMm4dTu6jn67V0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707518052; x=1708122852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOsPZzNjTKMmb1hLhWGHgsYjPAZfnhQ0s7pVdVmGej4=;
        b=LFtFdyznQComgTbRFXk3PVlUROSQyekMYJPNtM3V/0yS9Xx7sJ+df86HznKSqer5K5
         8t1F6qQ1YnPb6ADdwNhvzYuyG5AF69jFHiEV0kRs0gDQAutHYT1+yEfSl6+paROyBJRi
         mgk2oA7lQyCbR+bQFPkKTD7xIlpEMmNY73FnvyGo1O1UZ7zw5nJVbt5y9lwMEil828VB
         f5CfPVDROPD40Rg2/ep42R/8cWlvXhgEXTm0XXltc58PUsT3KyHXVv8TV29oQk5w3GUq
         ZELCkwUDVJVpRC8ccU7l2vfISnv0iP0BGulQu1KMGFhhlz+zJsBubpXnBg6hwhMu12wG
         KZPQ==
X-Gm-Message-State: AOJu0Yz3aMT6NPfzwKlHov0uklesHL718aq2RIIROJTdxWQ5i4tvhsuh
	lCUsWYXavdn4/X6i/hJ5qKV09kX/P1v5EjpQ3ZFSdgzFzMt8W1ap9Gc6ih0pYhLRCf1GKinxXSx
	+TqRFeq8zR6pP00GFqkdlJdoiuJ9On9O7Zadq
X-Google-Smtp-Source: AGHT+IElCJUqExUwUAO5y9FRujH1kMeB0B3NaJ3+IJcu/O0XGCv5BfaoFl6DNxM3Gr+qhIhZCIjPS+Kj+bcnmMXoDlM=
X-Received: by 2002:a81:4fcd:0:b0:5ee:65b3:f289 with SMTP id
 d196-20020a814fcd000000b005ee65b3f289mr672977ywb.3.1707518051975; Fri, 09 Feb
 2024 14:34:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209060353.6613-1-abhishekpandit@chromium.org>
 <20240208220230.v4.1.Iacf5570a66b82b73ef03daa6557e2fc0db10266a@changeid>
 <ZcY2kVlUn7SJ5pW8@smile.fi.intel.com> <CANFp7mW0F_zyaKJg0LusT6Cp4h0_8Z4jq+R1GUGtpyZrv99iVw@mail.gmail.com>
 <ZcZ_he1jYx8w57mK@smile.fi.intel.com>
In-Reply-To: <ZcZ_he1jYx8w57mK@smile.fi.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Fri, 9 Feb 2024 14:34:00 -0800
Message-ID: <CANFp7mUzXCvdKKGoBZys5KqW8ZD_3Bhy3R1aunrSmJWxd7RcLw@mail.gmail.com>
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

On Fri, Feb 9, 2024 at 11:39=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Feb 09, 2024 at 10:01:07AM -0800, Abhishek Pandit-Subedi wrote:
> > On Fri, Feb 9, 2024 at 6:28=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Feb 08, 2024 at 10:02:38PM -0800, Abhishek Pandit-Subedi wrot=
e:
>
> ...
>
> > > > +     if (ucsi->version <=3D UCSI_VERSION_1_2)
> > > > +             buf_size =3D min_t(size_t, 16, buf_size);
> > >
> > > Please, avoid using min_t(). Here the clamp() can be used.
> > I think this is likely the 4th time I've been tripped up by an
> > undocumented practice in this patch series. <linux/minmax.h> says
> > nothing about avoiding min_t -- why prefer clamp()?
>
> While in this case it will work correctly, the size_t is unsigned type an=
d 16
> is signed, while buf_size is unknown in this context. It means if buf_siz=
e is
> signed, the min_t gives wrong result. clamp() is better choice.
>
> See also, e.g., https://lore.kernel.org/all/20231004064220.31452-1-biju.d=
as.jz@bp.renesas.com/.
>
> > Please add the
> > recommendation here
> > (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/include/linux/minmax.h#n10)
> > and I am more than happy to change it after.
>
> It's not my recommendation :-)
>
> https://lore.kernel.org/all/CAHk-=3DwhwEAc22wm8h9FESPB5X+P4bLDgv0erBQMa1b=
uTNQW7tA@mail.gmail.com/
>
> Feel free to submit a patch.
>

Ack, will send up a PATCH v5. And add to my backlog of foot-gun
checkpatch and docs fixes I need to send up :)

> ...
>
> > > Shouldn't magic number be defined?
> > The comment right above this line documents the number.
> > As this is the only use right now, I don't see a need to make it a
> > macro/constant yet.
>
> OK.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

