Return-Path: <linux-usb+bounces-14796-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A90896F817
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 17:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB9112878D4
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 15:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AE01D27B3;
	Fri,  6 Sep 2024 15:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C+Kif5Xw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE0D1D04B6
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 15:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635969; cv=none; b=OraMtVwmruUB1twZTgcvBID3kA0gByv58jpswq12WuFP2Mrkwfwx5A/RUSKtgNiO20ijHJRwCPn/ppBrirbMbNEOmzmxFCOrj6NGWKGg2oMgfpeTHXHKtSQOLz6+RKzQcOTxfqTAqre7sIuBHzVwurarP8plXShTXppBoR/JrEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635969; c=relaxed/simple;
	bh=OSOuZkL/X/mNYuXEJFd7gBdX1eJI67yAbSVWtX/fPfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=co3qKOTyoFiTvYa1Vx5AVdVx4/FshNbNcTxKYSlDxdGhWeG9wuJyfXgapM7FG9Ex++xTp8XPHfNA1UcPAtnClQOPPhBpbaU6AgiuCe/jCNFS+FV0Un+ETTrgaMLQOCa+OEqqsmGlWjNps5WMZ3JAvkyFyBaEow6m1cYNTXmcuqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C+Kif5Xw; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5356ab89665so2769225e87.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2024 08:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725635965; x=1726240765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noleaBBmcHPsgizwxXud/rVIz/5Px6kF4LobwcN7U0c=;
        b=C+Kif5XwYx+u9HexTZxylPeye91tZHolPPlpjxExO22LrL9ec9Uk2b4lnAEmt/Auu8
         1L+OWoa6mDcNW7nKdpDT+/mAkZyHFaTHnRBbdrNdMShrleavUDuSyAARvJdQHZonzs0m
         mm1NrxoDcEOhdH9/uk0goiaoqUBzYOCmR4XiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725635965; x=1726240765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=noleaBBmcHPsgizwxXud/rVIz/5Px6kF4LobwcN7U0c=;
        b=s0gw1Ejysf2m5skE7Igzrfdt2v/f0RSR6L/2lw/qgb/0GukyUynEuDg935F/EA8eIY
         wlTUhEpc0TvZyLm0ZEUP/mAZc8Fel1Y+0mStgxo9NjMAS3CFCY/I60CdWqORGjDeJyTN
         X516MgP0CQZl+DN01/MdLig8X5b0Zkt6Z7L+VwBfI/OG7tCNvgPXtADTwv0lbgw32dfz
         8LubYuzPg3hNXrM2cZyGlnpyBZiRoheU7yJmf8ztiMNzfgc2JLKwdlrg3q0MKUMgl7Sw
         XRiDB2nDBCnGBAwYxZ1WW7qZwVHJNbWJ3B0xMFlA4QecWpvVEn7bcPeDmctyS/1Dk/e9
         lVsg==
X-Forwarded-Encrypted: i=1; AJvYcCVuaBL1BCr7OW7Y/vBsc4ToTlBz71egJcH/CNjmlDFkKQk3OLueiiJMcne8tOelvw9LEffo0yhypGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjesK3yhDa9EtL39CCvdhgAzmAm45khaRryPs0vjjhWWaRVlmq
	A7/Faf++luIm60Pf/k1XyiTuyqkurIPTkbjWDx7gbYQG71KVPDY/Jd2nGlB6ol2EGydkIX0D08y
	+DYYxhln7mJ3A/WDxd/WKud1hxMtLHTxsjAk=
X-Google-Smtp-Source: AGHT+IFVAM63Bs3VAvkqUDPEevU3qk7fsjHoPUg2mzp90Yr8MmCSObJgVxVt+3ywvZD2kgDj118t+VIs4MviiAaHop8=
X-Received: by 2002:a05:6512:110f:b0:530:daaa:271c with SMTP id
 2adb3069b0e04-536587b3427mr2273671e87.16.1725635964384; Fri, 06 Sep 2024
 08:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903163033.3170815-1-ukaszb@chromium.org> <20240903163033.3170815-4-ukaszb@chromium.org>
 <ZtsPdWRHkHWufsVh@kuha.fi.intel.com>
In-Reply-To: <ZtsPdWRHkHWufsVh@kuha.fi.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 6 Sep 2024 17:19:13 +0200
Message-ID: <CALwA+NY0LOhCNHidMfr4x0=4VOgGUODE1EU8up4BddretwLLxA@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 4:20=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi,
>
> Sorry to go back on this, but I noticed something..
>
> On Tue, Sep 03, 2024 at 04:30:28PM +0000, =C5=81ukasz Bartosik wrote:
> > +static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
> > +{
> > +     struct cros_ucsi_data *udata =3D ucsi_get_drvdata(ucsi);
> > +     struct ec_params_ucsi_ppm_set *req;
> > +     size_t req_len;
> > +     int ret;
> > +
> > +     req_len =3D sizeof(struct ec_params_ucsi_ppm_set) + sizeof(cmd);
> > +     req =3D kzalloc(req_len, GFP_KERNEL);
> > +     if (!req)
> > +             return -ENOMEM;
>
> Where is the memory for req released?
>
> First I though that cros_ec_cmd() does it, but it's actually
> allocating it's own cros_ec_command, and then releasing that in the
> end, so I just got confused about it.
>
> Is this a memory leak, or am I missing something?
>

Yes, you are right this is a memory leak.
Thanks for catching this. I will fix it in the next version.

Regards,
Lukasz

> > +
> > +     req->offset =3D UCSI_CONTROL;
> > +     memcpy(req->data, &cmd, sizeof(cmd));
> > +     ret =3D cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_SET,
> > +                       req, req_len, NULL, 0);
> > +     if (ret < 0) {
> > +             dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_=
SET: error=3D%d", ret);
> > +             return ret;
> > +     }
> > +     return 0;
> > +}
>
> thanks,
>
> --
> heikki

