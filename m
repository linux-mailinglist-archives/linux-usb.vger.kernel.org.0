Return-Path: <linux-usb+bounces-31977-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 100B3CFCB6D
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 10:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A312301D9D6
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 09:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B502F5A13;
	Wed,  7 Jan 2026 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WDiz5NTL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634DD285C8D
	for <linux-usb@vger.kernel.org>; Wed,  7 Jan 2026 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767776579; cv=none; b=fl+NjnpjXrYZ20kCsgcWzNjVNyj/6DAjjBkbiE1stSEXneI6NOrns/CSDUiNYu3UDCK+WgtMf42lar6nRadpUCCNYLiTmCNPUKD7VDpxg76WVswu1klX5Fws6VJD2xa9scNpPDxJk1kQ3KKeENfxWZih6WwD2tNnay1iS+wd1/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767776579; c=relaxed/simple;
	bh=c9Eaq6NHgJs1gmcbceR7Po8zxZJ42JrGgdOHIl1O1Zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RWMdiWKCkMuNkanDTWg6bkrl2qx6GLcKTzTya8oOOpRot1q6qMzErj5L5LxzI/n6mQ3lg/ZViIvTKt4sVV8ZPuakOnPbfUlFxLLiAaDkdeeDnfOojoHvRM2kxJzegS+ji9oADf4B0q77vs6NspMoGeQPMygnStCgKavLxLgITfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WDiz5NTL; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so1275668b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 07 Jan 2026 01:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767776578; x=1768381378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2G0+ow3aEvj9nCmuMZLN+Bl7iDn9WopMZQcreUCtuo=;
        b=WDiz5NTL+pcO00Pp9ZK6FFLTsawZyMJrJoY9ZSfvUqXD80rqjBAgOTWKSZf1g1HVCu
         /mG7vVAPSG9mWuVNyIJQ8n8kIvlNKlGRee2tViaJhSRaValqD5CTWyR8wUMnpYsEcRvL
         Cwr6zml30BqiXRFNzPHmX5TLUFdN77AKkxElc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767776578; x=1768381378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j2G0+ow3aEvj9nCmuMZLN+Bl7iDn9WopMZQcreUCtuo=;
        b=r7zc+ghz4DK7b7M7ainNbQtDmx/2kIoIX9/ihHJXx0sYDk7xT+zFaT1/ugmCQuiISE
         XWK7+4BfffJJvCa3KVBIHcQXHgR1bz970jUp5gCOZWATKB1VH1dvCJCaR5/M3RUNXY7q
         lKCqRAbxabxMMhqth7GvOV8+m8KbtPXLaLZvj1cfUMvHtdeaHS+uO6GFCva25SP9cF76
         w3dQfU1iPlqMvrj5XPPjpPAO7C9rb8noYi8UjLdDkMapn9QQlow3UGvs3EU5OqSLZuAX
         PpPWQOts4t16oMbNXgRWILDwdBfZ1Sf6Y9vdrd/BS2xApvq9z7GVjU66fs2MZLrLntDS
         MsOA==
X-Forwarded-Encrypted: i=1; AJvYcCUJydzIQmaGvv5MgsPVLGtChBn7fX/ZKYrPXHSp60mRK51fb6+DYihrZ+u4Yxy8Q37zzu0Sfez0mPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGD9Oe3gpuksVHWA6TtQOV5K1edc3xxEUv+B5mltV8v+8XDV1g
	Gi5aIsj5rj7cqNsgxkrvNybi+1RYOCZ5GbKJ3x9OHxYLlikQ1+RvYzZT6trbVjL/gML7igOgjc6
	g9ZjdvReYnKGWvrkhxoaXeAMDWUHk4lO252Jewnqk
X-Gm-Gg: AY/fxX6KVu/hBVV1x/P9Y+zLiw7BzdfNXITFU0v3xK9Oc3aMLut6It85RdRCOOADoAT
	x42/R2FLGeqh54+ASAipN6+Qdf8o1Gp5HkhaRwexP6ctpHuq8/ccyRdJJDErCBDYbR5OqSTit4A
	bCwWxOPQ2GUgXsmtFXW9QGUeJIcGKbGxuX+rFyGwnTKZCUdScLBmvYEJYFNfwFJypOwj5cv3rW2
	BvDw1LbgNGHjAvxpYxvmEl42EJXtYoUprnoALhbuYHrgcU5D/x0kf9Z23sNZCLul07f0EOoIwwv
	HduNCEfua0PrKvqh/h7d
X-Google-Smtp-Source: AGHT+IFSgQAg+iv9BdyK3Tg4JWt6tUDK5l6qV0i9nXILLuUTtITsTnQDUNw9LFDunFpS8QGL+I606Ji65XMvOZkowwc=
X-Received: by 2002:a05:6a20:6a1b:b0:366:55c4:c5a8 with SMTP id
 adf61e73a8af0-3898f91d59emr1861329637.25.1767776577681; Wed, 07 Jan 2026
 01:02:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201122604.1268071-1-akuchynski@chromium.org>
 <aTrJwA7Y4fWiTMzB@kuha> <aTrTvA8Srak1mNGS@kuha> <CAMMMRMdwX8wKJz6OEvosVXFH2npr+7pd0pdq3eY9r-Pbr3tjMw@mail.gmail.com>
 <aUp6FxThy1r2pNxD@kuha>
In-Reply-To: <aUp6FxThy1r2pNxD@kuha>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Wed, 7 Jan 2026 10:02:45 +0100
X-Gm-Features: AQt7F2oR4AXcYvx0awKh4BmgsMZ09ybzehFPckjy8ioYO2rxAKcsk9BTPRutVcM
Message-ID: <CAMMMRMfk1Rv7P4NMkYnG+2RFqVm-7Effb_xiBQU3NXhPJeeg_g@mail.gmail.com>
Subject: Re: [PATCH RFC 0/8] USB Type-C alternate mode selection
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Abel Vesa <abel.vesa@linaro.org>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Pavan Holla <pholla@chromium.org>, Madhu M <madhu.m@intel.com>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 12:17=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi,
>
> Tue, Dec 16, 2025 at 03:57:40PM +0100, Andrei Kuchynski kirjoitti:
> > On Thu, Dec 11, 2025 at 3:23=E2=80=AFPM Heikki Krogerus
> > <heikki.krogerus@linux.intel.com> wrote:
> > >
> > > Thu, Dec 11, 2025 at 03:40:24PM +0200, Heikki Krogerus kirjoitti:
> > > > Without going into the code review yet, I'm okay with this in gener=
al,
> > > > except with the artificial SID for the USB4. I still don't understa=
nd
> > > > why do you guys think we should use that instead of an USB4 specifi=
c
> > > > device type?
> > > >
> > > > I think somebody said earlier that the user space can't see the dev=
ice
> > > > type of the alt modes? If that's really the case, then I think ther=
e
> > > > is some bigger issue here. Are you really sure that if you check th=
e
> > > > device type of an alternate mode for example with udevadm, it does =
not
> > > > say DEVTYPE=3Dtypec_alternate_mode ?
> > > >
> > > >         % udevadm info -q property --property=3DDEVTYPE /sys/bus/ty=
pec/devices/port0-partner.0
> > > >         DEVTYPE=3Dtypec_alternate_mode
> > >
> > > Or just use grep :)
> > >
> > >         % grep DEVTYPE /sys/bus/typec/devices/port0-partner.0/uevent
> > >         DEVTYPE=3Dtypec_alternate_mode
> > >
> > > So, if that really does not work, then there is a bug somewhere that
> > > we obviously need to fix.
> > >
> > > Please note that the port altmodes are now also part of the bus.
> > >
> > > Br,
> > >
> > > --
> > > heikki
> >
> > Thank you for the review, Heikki.
> >
> > The USB4 SID is utilized for distinguishing between USB4 and alternate
> > modes internally and is not exposed to user-space. This represents inte=
rnal
> > implementation detail, for example the boolean variable `is_alternate`
> > could serve the same purpose as the SID.
> > This patch series introduces no new sysfs entries; the only new attribu=
te,
> > `priority`, was introduced in the mode priority series, available at
> > https://lore.kernel.org/all/20251124124639.1101335-1-akuchynski@chromiu=
m.org/
> >
> > It is possible to use already existing `usb_capabily` and `usb_mode`
> > attributes to manage USB4 mode, allowing verification of USB4 support o=
n
> > both the port and the partner. The activation of USB4 is accomplished
> > through the implementation of the `enter_usb_mode` typec operation.
> >
> > I would like your opinion on whether using a USB4 device type would be =
a
> > better approach.
>
> The device for the USB4 mode will need to have its own device type in
> any case, but I'm indeed mainly concerned about how we expose the USB4
> mode device to the user space.
>
> As a kernel internal implementation detail the custom SID is probable
> fine for now, although I was actually hoping that we could improve the
> API a bit. So something like typec_register_mode() type of API. You
> probable could introduce something like this for that API:
>
>         struct typec_mode {
>                 /* enum typec_accessory         accessory; */
>                 enum usb_mode                   usb;      /* or just USB4=
 flag */
>                 struct typec_altmode_desc       *altmode; /* NULL with US=
B4 */
>         };

Got it.
If you don=E2=80=99t have objections regarding the mode selection, I will p=
roceed
with sending the current patch series, omitting the USB4 support.
The support for USB4 mode will be in a subsequent series.

Thanks,
Andrei

