Return-Path: <linux-usb+bounces-5539-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5700083E1A6
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 19:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D4F92818E2
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 18:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17A820B20;
	Fri, 26 Jan 2024 18:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VZRmIzkd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9957B208BA
	for <linux-usb@vger.kernel.org>; Fri, 26 Jan 2024 18:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706294272; cv=none; b=gQPHWR8GRGV7UXbhJCE0u/qo47O5txU2LKkrJx9C2c9bQv0IlsOF89bDJrVBl9bVNjxbIG6KfG2wSDjo/4TD+xMJn/tS5bS3VMr9kn0Way/HSoRGqaJz1ebhvq2647Cy8ri/FKaEF1jv5IfNU8FwvLoriDstlGzFVU0oI66vzKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706294272; c=relaxed/simple;
	bh=XZ2hRyKad9HfIgpa+F9en0MefeDawNEJlY0vs6zijUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLKkDUBwEI6C3SZAZOFeaZGMHSjsEodKBbVU5CtXoncrRPkhM/w+ZgkOovy1qY+VgFzGIDs90LE/cf9pkOi0N5+9ofleSqu98g0QQQxej+Cy3THXgASpTS61uASbFmhSoMlt1ptigjsBrVPKtWIvCmsVwytvfiecDCWth7A/DsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VZRmIzkd; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dbed0710c74so686770276.1
        for <linux-usb@vger.kernel.org>; Fri, 26 Jan 2024 10:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706294269; x=1706899069; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQ9LWpRZqhGXr17Sut+fsyT3gP0HQr5bswuLlV5/xTo=;
        b=VZRmIzkd5BF7pS+vQAVSqz58UIJHWRKEaMNxNCUEZv3Gn6lQp8+FDfdTostyjJDni1
         ySrE8rj/M88GIXWywMOFXHiXFDzxGesIriZqaTT+ks1dnOcWKyIPvygZA25AYuGfSfgk
         IMAph3bzCvUEq5oVejaykqE+az7hbEcTM/p1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706294269; x=1706899069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQ9LWpRZqhGXr17Sut+fsyT3gP0HQr5bswuLlV5/xTo=;
        b=KFXeru4L8ypcV58MIsNnRkvDl8jJGSXEeIeCqRYlQKK3YCWKoNRUPskwyv4RnKvBY0
         AunXGvfoQokDiRz13pgEj2E5gRJXXBW7qn1WsKLiJhYDqNNRHCKHTk9JYvSSh/cIYQiG
         MZsY8z2I2fkyxy+eBHPPkuXS5/+z0Zw0mxBsne2jzfu4UyprifHLxrnjpDVAol0gEdCT
         tqVtHHkHACVr44i7LxxJxjICdaB3fVJaDMK0PNAZMVr8sDl8inTbWkNwX5Ha/aNvYZPK
         kJKXEF4djQlp6xMEgcvpxEYDZDU1emTiJXOOwg6qV+LcRLwvDTS6qkPKzQj9t6ULIM+L
         jybQ==
X-Gm-Message-State: AOJu0Yz7Le83EacI/Irc3AhYE3af0rE1zrokDl9nuBZcR/y03kF9qW0M
	Z0ttr+Nc9YGXmjwEFDfmUz/GGTPULOjpAhfapqO79bolehkwTUEEnHUBFxjX1MZ497R9Et9xXYP
	kGD/oK8Y1pYCA2CeKUU6AtC/BIMSiHVGG6i4o
X-Google-Smtp-Source: AGHT+IEpHnEbx0+AMZ0M2gO/OYPS/R7gEZJGXz4BLNVvBTAgAaTOXAb/wCVHOzmASX9xMb1zXAS5xStp87PXvBxk7XA=
X-Received: by 2002:a5b:80c:0:b0:dc6:57cf:d905 with SMTP id
 x12-20020a5b080c000000b00dc657cfd905mr125981ybp.7.1706294269467; Fri, 26 Jan
 2024 10:37:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125004456.575891-1-abhishekpandit@google.com>
 <20240124164443.v2.2.I3d909e3c9a200621e3034686f068a3307945fd87@changeid>
 <2024012512-haphazard-mobster-f566@gregkh> <CANFp7mWzA5df9iFpCWFRpXuOP06yDmBehYDYNACjrW2fPvp_Ow@mail.gmail.com>
 <2024012555-nuclear-chummy-6079@gregkh> <CANFp7mVPahm+6MjD_+MWMNUz=RViNh777h=Q2dW0UVVDK6dA0A@mail.gmail.com>
 <2024012612-giggling-diabetes-3a74@gregkh>
In-Reply-To: <2024012612-giggling-diabetes-3a74@gregkh>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Fri, 26 Jan 2024 10:37:38 -0800
Message-ID: <CANFp7mWQZru7uR-vi=s1j5XT1Wz5FYZhBrCjwwtv38PeBOYLqw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] usb: typec: ucsi: Update connector cap and status
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@google.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	jthies@google.com, pmalani@chromium.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rajaram Regupathy <rajaram.regupathy@intel.com>, Saranya Gopal <saranya.gopal@intel.com>, 
	linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 10:30=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jan 26, 2024 at 10:08:16AM -0800, Abhishek Pandit-Subedi wrote:
> > On Thu, Jan 25, 2024 at 5:50=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, Jan 25, 2024 at 04:21:47PM -0800, Abhishek Pandit-Subedi wrot=
e:
> > > > On Thu, Jan 25, 2024 at 3:03=E2=80=AFPM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Wed, Jan 24, 2024 at 04:44:53PM -0800, Abhishek Pandit-Subedi =
wrote:
> > > > > > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/=
ucsi/ucsi.h
> > > > > > index bec920fa6b8a..94b373378f63 100644
> > > > > > --- a/drivers/usb/typec/ucsi/ucsi.h
> > > > > > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > > > > > @@ -3,6 +3,7 @@
> > > > > >  #ifndef __DRIVER_USB_TYPEC_UCSI_H
> > > > > >  #define __DRIVER_USB_TYPEC_UCSI_H
> > > > > >
> > > > > > +#include <asm-generic/unaligned.h>
> > > > >
> > > > > Do you really need to include a asm/ include file?  This feels ve=
ry
> > > > > wrong.
> > > >
> > > > I didn't see any header in include/linux that already had these
> > > > unaligned access functions so I opted to include
> > > > asm-generic/unaligned.h. Is there a reason not to use an asm/ inclu=
de
> > > > file?
> > >
> > > Yes, you should never need to include a asm/ file, unless you are
> > > arch-specific code.
> > >
> > > But the big issue is that you don't really need this, right?
> >
> > The UCSI struct definitions have lots of unaligned bit ranges (and I
> > will be refactoring <linux/bitfield.h> to support this but that's
> > coming later). As an example, the GET_CONNECTOR_STATUS data structure
> > has unaligned fields from bit 88-145.
> > Rather than define my own macro, it was suggested I use the
> > get_unaligned_le32 functions (see
> > https://chromium-review.googlesource.com/c/chromiumos/third_party/kerne=
l/+/5195032/3..4/drivers/usb/typec/ucsi/ucsi.h#b183).
> >
> > I did a quick ripgrep on the drivers folder -- it looks like the "You
> > should never need to include a asm/ file unless you are arch specific"
> > isn't being followed for this file:
> >   $ (cd drivers && rg -g '*.h' "unaligned\.h" -l) | wc -l
> >   22
> >
> > The unaligned access functions (get_unaligned_le16,
> > get_unaligned_le32, etc) are really useful and widely used. Maybe they
> > SHOULD be exposed from a <linux/unaligned.h> since they are so useful?
> > I can send a follow-on patch that creates <linux/unaligned.h> (that
> > simply just includes <asm/unaligned.h>) and moves all includes of
> > <asm/unaligned.h> outside of "arch" to the linux header instead (this
> > will also create a checkpatch warning now as you are expecting).
>
> This is being worked on, see:
>         https://lore.kernel.org/r/20231212024920.GG1674809@ZenIV
>
> thanks,
>
> greg k-h

Thanks, I see the move here:
https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git/commit/?h=3Dhe=
aders.unaligned&id=3D3169da8e80dfca2bcbfb6e998e2f36bcdcd5895a
I'm not sure how the logistics of this is going to work but I assume
it's ok to merge with <asm/unaligned.h> for now and let the later
merge from viro fix this? (+Viro as FYI)

I'll send up Patch 3 of this series with the fixes discussed (use
asm/unaligned.h and reorder includes)

Abhishek

