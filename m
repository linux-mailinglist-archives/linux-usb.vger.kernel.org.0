Return-Path: <linux-usb+bounces-16205-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 509CC99DC59
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 04:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 823611C2107F
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 02:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88934166F32;
	Tue, 15 Oct 2024 02:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JZ/kWLsF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F69E157A6B
	for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 02:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728959924; cv=none; b=Ib2aY20SfJKZtRPIdcL3zZhnAD72LHXuMb/k0kGUpMFOqtzjjkiYjlBoIl1aMuEzp/gAVm/z2JxuvP1iXm1XLmvb3vNiZU+hYpdly6ClQwOzlgPNqUlqzCDPE57ey/lIG66/REu/+SOMJlE0D5K1bkn0tEI69VGrzX9ZdjuXg+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728959924; c=relaxed/simple;
	bh=M2JgZaz30LdYB7pnjYW05KdJlMXHhnQJ8mtF1DaiUyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PH5M3MQ/RbG9GVhoB22tddG2i/bFS89ZY6l6UgzNI8nd3BJW8vlZwSujw5ldHk5PFw9hofeBql/j0jU5LIbO7+jjmdCvosA7zOZJiuoyHv8Bkiczmgj/v53adndOTag5sctZJto8mIrWUYtgH03XeCPD/tUAf/R1L/p98vGdilI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JZ/kWLsF; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e2e4d16c2fso41484567b3.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 19:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728959921; x=1729564721; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhwQPR/bY7k43N1dPh5SKshRpx07AdIeIccwyPKJuoM=;
        b=JZ/kWLsFPsR3Je1qqru0dnOcvZuf7EBjzvozR11zBAyNG6QO4vUmuAg/iywbCPrYn3
         eGzCWoTAzCKYAioYFlzTZsdyuZJpPB06+8ga2/6zgREj0ZjbZWa7/qkO0TUYHrwGG6lv
         Y/LuJxxsy8+okEjyPTGkHzAOOX9e+rMdBwfI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728959921; x=1729564721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LhwQPR/bY7k43N1dPh5SKshRpx07AdIeIccwyPKJuoM=;
        b=Mw/bSXIu/7ZayleOuXqomRP0g1tFutv+FbEvC8FyVzIFfQbg7WBfGL0fK/247UD41K
         O6iFEclCwjtSc0XawlCTRyTjQexx91ajwIad+/1TfF80kNiDAXwqSXtkqEhH1ouNOjSs
         T4vPdKG4WHIExq05e98BKLp2E8pq9ONuT3JqUVIgWhQjW/b3RqItOy/zJZPvTmp4L85y
         4Equq0sEtyJw8T6kUFpp+Wy+KmFcgtJAvrqsr8ns6lxdSQZpqt9DwSINxC0Bh8Z+3mBb
         qtYeMadSsfTSD0LdXv9YIjkhjueIqjGv3RskuzwhFfzx4F5a7XHz3e/FP0YtqVSwIMZ2
         yd2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3yhZhvz/h7vY21Tem1S0EDgC/AuY2B7aDzcstpdG/YZcT74bRf/OWIE3pmgWARRJOc2K4vNUNW0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Zqfo9lcKMJEmVrtOnFXU8toeVI3lSVJ2WXLSo1O2HecMZX/t
	/ohQDJJQajyDA+eGaSOHPtBVjw8iD5zxZwblTCmr303SoNFxCeMSiZgnlPLaESy0250CuKTc2B4
	cxK3LnYTjMilESJ5qLF6Tsd/3Za4XtEvgE0qk+GoUOMGEkus=
X-Google-Smtp-Source: AGHT+IFPOW/PBXlXISgBNbsm8JFf9elQ7ANUjxVk1ccIsCOebyPL6vwU5RRey6/urghRw6UuG/4c/0cfiDnNP2ywpSI=
X-Received: by 2002:a05:690c:1e:b0:615:1a0:78ea with SMTP id
 00721157ae682-6e3643a6345mr79464947b3.34.1728959921447; Mon, 14 Oct 2024
 19:38:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011124402.3306994-1-heikki.krogerus@linux.intel.com>
 <20241011124402.3306994-2-heikki.krogerus@linux.intel.com>
 <2024101155-goes-demote-f6f6@gregkh> <ZwkvJkOZHvvLMxvj@kuha.fi.intel.com>
In-Reply-To: <ZwkvJkOZHvvLMxvj@kuha.fi.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Mon, 14 Oct 2024 19:38:30 -0700
Message-ID: <CANFp7mU3NPEio2NE3TRXf1C_Ckd-5wPbxnvRnNSjRyTozKDPEA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] usb: typec: Add attribute file showing the
 supported USB modes of the port
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 6:59=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Fri, Oct 11, 2024 at 03:07:21PM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Oct 11, 2024 at 03:43:59PM +0300, Heikki Krogerus wrote:
> > > +What:              /sys/class/typec/<port>/usb_capability
> > > +Date:              May 2024
> >
> > It's a bit past May 2024 :)
>
> Yes. I'm sorry about that.
>
> > > +static ssize_t
> > > +usb_capability_show(struct device *dev, struct device_attribute *att=
r, char *buf)
> > > +{
> > > +   enum usb_mode mode =3D to_typec_port(dev)->usb_mode;
> > > +   u8 cap =3D to_typec_port(dev)->cap->usb_capability;
> > > +   int len =3D 0;
> > > +   int i;
> > > +
> > > +   for (i =3D USB_MODE_USB2; i < USB_MODE_USB4 + 1; i++) {
> > > +           if (!(BIT(i - 1) & cap))
> > > +                   continue;
> > > +
> > > +           if (i =3D=3D mode)
> > > +                   len +=3D sysfs_emit_at(buf, len, "[%s] ", usb_mod=
es[i]);
> > > +           else
> > > +                   len +=3D sysfs_emit_at(buf, len, "%s ", usb_modes=
[i]);
> > > +   }
> > > +
> > > +   buf[len - 1] =3D '\n';
> >
> > Nit, shouldn't this be another call to sysfs_emit_at()?
>
> Yes.
>
> > > @@ -240,6 +251,7 @@ struct typec_partner_desc {
> > >   * @port_type_set: Set port type
> > >   * @pd_get: Get available USB Power Delivery Capabilities.
> > >   * @pd_set: Set USB Power Delivery Capabilities.
> > > + * @default_usb_mode_set: USB Mode to be used by default with Enter_=
USB Message
> > >   */
> > >  struct typec_operations {
> > >     int (*try_role)(struct typec_port *port, int role);
> > > @@ -250,6 +262,7 @@ struct typec_operations {
> > >                          enum typec_port_type type);
> > >     struct usb_power_delivery **(*pd_get)(struct typec_port *port);
> > >     int (*pd_set)(struct typec_port *port, struct usb_power_delivery =
*pd);
> > > +   int (*default_usb_mode_set)(struct typec_port *port, enum usb_mod=
e mode);
> >
> > Naming is hard, but usually it's "noun_verb" so wouldn't this be just
> > "mode_set_default"?  We know it's usb :)
> >
> > But why default, why not just "mode_set"?  or "set_mode" given you have
> > "try_role" here, but then you have "pd_set".  Ick, I don't know, it's
> > your code, so your call, nevermind...
>
> I think I'll just change it this back to the way it was in the last
> version, and drop "default" from the name.

What's being set underneath is what USB mode to enter on the next
reset or attach -- i.e. the default USB mode to enter. So appropriate
naming here may be one of usb_set_default, usb_set_next. Dropping
"usb" makes less sense vs dropping "mode", which could also refer to
alternate modes so I'd prefer we don't call it mode_set.

>
> thanks,
>
> --
> heikki

