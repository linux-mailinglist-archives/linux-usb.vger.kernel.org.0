Return-Path: <linux-usb+bounces-27593-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47342B45700
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 13:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01BCC3BCA07
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 11:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F1A34A33E;
	Fri,  5 Sep 2025 11:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VmCkVL9c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03752220F37
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 11:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757073447; cv=none; b=WHm0JSU7F5YfDtpPLfj4ZN8Lp+qRWF3JHeAtyLYN/TKhTcReAgI7A9Q3deM5NzNXoiGcUMWd6J3X9Buk73Y6EY9YWSVAT29AghdkTcuOW6rG1gLW1+FiiZ6/hU4ofvfTZMD8OVzpWlgwIx7/2TI7p/VhObkuh5JA2MUAVhUssV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757073447; c=relaxed/simple;
	bh=BluZ0n/EBlrhIwiF/nNBirH31HIee/3BeX4W5N3bLk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LSsSF83DWtGZFILzvyKY3R5yLVHJ0Ttm0gEh9RvaT82MGmAs70SRw7YRoh/k+AL/iUD2cicfYNgEuQmhXZV8WAfCHgWcfK+nZlIYqlKNqycfYQqg2GadZ2/KXVOtCZfna9r3tlYg6Buqt1mHYWthfLtoJIUrN/7ms8kuhWJTVpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VmCkVL9c; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso1349567a12.3
        for <linux-usb@vger.kernel.org>; Fri, 05 Sep 2025 04:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757073445; x=1757678245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwRu3z/1tyWo2AWlw49rwHDq7UFt7Y05nNStcD8eOx0=;
        b=VmCkVL9ceOg+Re7PUO1xnFzASe9Q/vMXp4Nl1wmJpAEHq6bRXyTCpjoIxqsyWNpCAj
         OyD/7IpCfoIMgmh1F20hLrYpzLwjjsRWvvDaArHy7f9mCJPWlH2ws+zatZ+tq8lsX5u0
         crg2LK83k8Q3SvzcTpxPRaf6h+Vit2VJVjKX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073445; x=1757678245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwRu3z/1tyWo2AWlw49rwHDq7UFt7Y05nNStcD8eOx0=;
        b=j6w0sGsePUKjppPpb37lFdhIUQDbJXqYTzvvTpiBxe/lncRJUKGWHWcit+cgaWV9kT
         pUsaW7bupF8sdOO3Jh/Rt8SD0slHVDXnqwAF17bTaMlMXyj0F/EpXlG8wbFdHJ+oteZg
         dPij0QJQndyQBOjGN+MZkfM4uwmeql6Xw/7/5n18hi0y5wOAaN95CKqGKdDzDG0rxdLO
         nzrWlhMhdnlhHa0+CLwDykTBtqeaDeyFVcMxEgwacXXDBAmKDK7ioX2IqbWgElkWuqzR
         0AKVnQPYLHZnKMaDu5iP4z4ENXoBuEa46bDs92aickycc7PUszZ6aNjXVKqcDxBN0Mh+
         +8hw==
X-Forwarded-Encrypted: i=1; AJvYcCXzcGyYtlETr6LWSczi776nrXC98qLziPfh3ruUpMDQIuIPuIuANbaWpKF/NVpENix7Fy96kzKL62U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxufYeSSvvZIBHpRVwBEjVmZ3jw4+opi/xHQ3xBbhMRJhFdOuoz
	YG4CTZK6/IdL8JoKYllSrQNS8dm9HsyVe1af/ip4PN84XsQQXZo7aZR223PmhDDTmhwuSXcEQVb
	JzW+oApEGEIrs6/fz+hYuv6NasmPenqZj3fqXce/U
X-Gm-Gg: ASbGnct0mxLCk/5FwhCcDZWyAE2ikVhoZyRNqKGg4bnEwjlMERmHNAKHW62Rq9Ne6KM
	mRHe23ruqaU6WV7s/u4ixeO7N7phl6PmUGWVFAsLrfBotewVS0/kTAsVkIM+uymttzj7fdM2EhH
	HJ5VgC37qr+mPmL0pz89UWwJDcL6TV53BD4Yajt54luFsKQDPIamO6+3Jr4YU5EOdr3ImX7wk38
	+qTDLb28s72W5PeF/PDou4tAW7YvteV/A==
X-Google-Smtp-Source: AGHT+IFSzOFurkAZqFfxwqHBU2GIUt8H3fpkz2wPZsZF2x3IJHiAn287LcomXMAQvQuyZgs8kf5c0zVpFXrvE8TpcWE=
X-Received: by 2002:a17:90b:33cc:b0:32b:958a:51da with SMTP id
 98e67ed59e1d1-32b958a55bfmr8103099a91.16.1757073445301; Fri, 05 Sep 2025
 04:57:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825145750.58820-1-akuchynski@chromium.org>
 <20250825145750.58820-4-akuchynski@chromium.org> <aLq0a4fPzeWKzaxk@kuha.fi.intel.com>
In-Reply-To: <aLq0a4fPzeWKzaxk@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Fri, 5 Sep 2025 13:57:13 +0200
X-Gm-Features: Ac12FXyOmhtycsbCUf38YB5fZkBYaTh89EyZOhotIirneDMW79KBs6Uep0MbAXY
Message-ID: <CAMMMRMdU91u1dqhXyRPMrB2ybxMMUMgQNfpWZWMBqOTCJ+Cwmw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] usb: typec: ucsi: Set alt_mode_override flag
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 11:59=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Aug 25, 2025 at 02:57:48PM +0000, Andrei Kuchynski wrote:
> > This flag indicates that the PPM allows the OPM to change the currently
> > negotiated alternate mode using the SET_NEW_CAM command.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index 0d6b0cf5a7cd..85a6b7fc6d93 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -1632,6 +1632,8 @@ static int ucsi_register_port(struct ucsi *ucsi, =
struct ucsi_connector *con)
> >
> >       cap->driver_data =3D con;
> >       cap->ops =3D &ucsi_ops;
> > +     cap->no_mode_control =3D
> > +             !(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
>
> Fits to one.
>
> thanks,
>
> --
> heikki

I miscalculated it. One line

Thanks,
Andrei

