Return-Path: <linux-usb+bounces-18458-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B5C9F14FD
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2024 19:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E25A11693DE
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2024 18:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51311E882F;
	Fri, 13 Dec 2024 18:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CQla3uUn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819A21E1C26
	for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 18:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734114814; cv=none; b=OIr9gzsfCAd5BFK4azhAOyItjkybgFgvQEXBp017K4wi+yWXao/6ruL7RcoqWRlZUslPLs2nsAvOptoMkdi7SjxdCP/8kNkeiBh6XG6sif0JClnCnqWJlQwmkB01w82K2BMn/YN0Gi1U95w8DqgF9SSO02jvFgu4OBP39JZBy1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734114814; c=relaxed/simple;
	bh=bT8KlM+ZL/eiWqAMprSqiRuYUiHzyEZIk1F8RSU/WBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HeUQzPu4FnDUofXIfcxmuU8Y3qd9njjx6WuXo+J2FHS6LDjumT/DlrDlzMbMsNRHqJHmgSTOzg7hBLXiJGuv84/rOr8PtuDN+xNa9uxWiki5MTFmBeFBz7goE3WwpWMo/dKCWZxYGUv9zA9OjW2WO/FVaOXL12wmSKeF5Q72brk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CQla3uUn; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e3a0d2d15adso1489241276.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 10:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734114810; x=1734719610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=829Wt2h4wc7zRVWwHu94uPaVmsfJV58oeCdGN9YNk7Q=;
        b=CQla3uUn1A5Hvb2qfmrmCqm+TCtbWBA03ZCHR32unBBeNmy0jPkA0VeFAu5MzaCBS9
         KMU8PiJwAaN33qYbqjgLNamp2eIMobKXVrmJYSiYllrkt/ZcA66/7TQUg14eKFnC4Jgq
         efvxEJMXIoh+tpnMEeVwUqblSi5WNO6FLLN4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734114810; x=1734719610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=829Wt2h4wc7zRVWwHu94uPaVmsfJV58oeCdGN9YNk7Q=;
        b=swfOnVHAyc8Q2G4mtB/zYK5UrbsLq1Y89RMQCDS4dPEgJdFuNyornmEvlDTS5nFnNj
         LPleoiMHJre2Jfz6umdG6PIK73NDk8mHcNL31vijhTxg2GcOr8ujEzVY5ESQaNWt2Fvq
         rnOYlMJZMLllF5Oll9X79z4bUqsTQgwUuWLHrr8IEmO59NFX8sIjWATx+JePIhbmOU/P
         /ujfFLT0Ekiiisj8min94FFi+3x6Ed0lk5RD4c7OzILVIBylq5Q7/14cklR7Is7Vbbgk
         b62xaZnl/HXvMJ/muFOTb0+szCsgn46pYagOm5hqt3+oziJCxZYQM380scZBqmrDNR2h
         zu1g==
X-Forwarded-Encrypted: i=1; AJvYcCVJT+kMaVpHn8ffharM54EVCB1aCm50PReAeTPpjc9i/+ZKVZT3+Haey/beFzhuqJs8S1xsAv5Ew5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwONRlK4ubY8qbEJb5PLZjkzivOAyvrvplwnK10xvYVTxnTArMD
	TLZSaCfqQl9Mk00FmCik0qilFCvFHhe+Z6LhKpPnH6mQIUMFYGBPHQsq/SW6+lWoSYEAuZs4xbN
	xu4WG20ADY+sN+iYYgz6dJq6TW8O99ajjZ/3/
X-Gm-Gg: ASbGncsoVOMZp/EcLxreN3jaJcO/1EH9MdpJtfJ/EOux1UkBLKnt54dHK1DF76HlgiO
	XyopEg0a8YGGbE9GTECBWth7CLxpDTLFgriT2JQ==
X-Google-Smtp-Source: AGHT+IE3568CmXdR+xkSlTDpC9QvSdoqyGIUGd4ssW2QqVKIifwb+ku9xLRguvMe2zp8+ZbKiJWLJDRE0IcvnUcstHw=
X-Received: by 2002:a05:6902:1583:b0:e39:921c:e41a with SMTP id
 3f1490d57ef6-e43500fbd93mr3457706276.48.1734114810649; Fri, 13 Dec 2024
 10:33:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206233830.2401638-1-abhishekpandit@chromium.org>
 <20241206153813.v4.5.I142fc0c09df58689b98f0cebf1c5e48b9d4fa800@changeid> <2bfe74d6a29ca13a7f89f116a2f0c6be.sboyd@kernel.org>
In-Reply-To: <2bfe74d6a29ca13a7f89f116a2f0c6be.sboyd@kernel.org>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Fri, 13 Dec 2024 10:33:19 -0800
Message-ID: <CANFp7mV75SpTAyh=A4kZA2=NWi7+ry0+W+a5kpcjLrPwyhJ8UQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] platform/chrome: cros_ec_typec: Displayport support
To: Stephen Boyd <sboyd@kernel.org>
Cc: chrome-platform@lists.linux.dev, heikki.krogerus@linux.intel.com, 
	linux-usb@vger.kernel.org, tzungbi@kernel.org, akuchynski@google.com, 
	pmalani@chromium.org, jthies@google.com, dmitry.baryshkov@linaro.org, 
	badhri@google.com, rdbabiera@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 1:58=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting Abhishek Pandit-Subedi (2024-12-06 15:38:16)
> > diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/pla=
tform/chrome/cros_typec_altmode.c
> > new file mode 100644
> > index 000000000000..bb7c7ad2ff6e
> > --- /dev/null
> > +++ b/drivers/platform/chrome/cros_typec_altmode.c
> > @@ -0,0 +1,281 @@
> [...]
> > +
> > +static const struct typec_altmode_ops cros_typec_altmode_ops =3D {
> > +       .enter =3D cros_typec_altmode_enter,
> > +       .exit =3D cros_typec_altmode_exit,
> > +       .vdm =3D cros_typec_altmode_vdm,
> > +};
> > +
> > +#if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
> > +int cros_typec_displayport_status_update(struct typec_altmode *altmode=
,
> > +                                        struct typec_displayport_data =
*data)
> > +{
> > +       struct cros_typec_dp_data *dp_data =3D
> > +               typec_altmode_get_drvdata(altmode);
>
> How does this work? I see that the type of the drvdata is struct
> cros_typec_altmode_data per the allocation in
> cros_typec_register_displayport(), but here we're treating it as the
> type struct cros_typec_dp_data, which has a struct
> cros_typec_altmode_data as the first member. The allocation is too small
> from what I can tell. The same problem looks to be there in
> cros_typec_displayport_vdm().
>
> > +       struct cros_typec_altmode_data *adata =3D &dp_data->adata;
> > +
> > +       if (!dp_data->pending_status_update) {
> > +               dev_dbg(&altmode->dev,
> > +                       "Got DPStatus without a pending request");
> > +               return 0;
> > +       }
> > +
> > +       if (dp_data->configured && dp_data->data.conf !=3D data->conf)
> > +               dev_dbg(&altmode->dev,
> > +                       "DP Conf doesn't match. Requested 0x%04x, Actua=
l 0x%04x",
> > +                       dp_data->data.conf, data->conf);
> > +
> > +       mutex_lock(&adata->lock);
> > +
> > +       dp_data->data =3D *data;
> > +       dp_data->pending_status_update =3D false;
> > +       adata->header |=3D VDO_CMDT(CMDT_RSP_ACK);
> > +       adata->vdo_data =3D &dp_data->data.status;
> > +       adata->vdo_size =3D 2;
> > +       schedule_work(&adata->work);
> > +
> > +       mutex_unlock(&adata->lock);
> > +
> > +       return 0;
> > +}
> > +
> > +struct typec_altmode *
> > +cros_typec_register_displayport(struct cros_typec_port *port,
> > +                               struct typec_altmode_desc *desc,
> > +                               bool ap_mode_entry)
> > +{
> > +       struct typec_altmode *alt;
> > +       struct cros_typec_altmode_data *data;
> > +
> > +       alt =3D typec_port_register_altmode(port->port, desc);
> > +       if (IS_ERR(alt))
> > +               return alt;
> > +
> > +       data =3D devm_kzalloc(&alt->dev, sizeof(*data), GFP_KERNEL);
> > +       if (!data) {
> > +               typec_unregister_altmode(alt);
> > +               return ERR_PTR(-ENOMEM);
> > +       }
> > +
> > +       INIT_WORK(&data->work, cros_typec_altmode_work);
> > +       mutex_init(&data->lock);
> > +       data->alt =3D alt;
> > +       data->port =3D port;
> > +       data->ap_mode_entry =3D ap_mode_entry;
> > +       data->sid =3D desc->svid;
> > +       data->mode =3D desc->mode;
> > +
> > +       typec_altmode_set_ops(alt, &cros_typec_altmode_ops);
> > +       typec_altmode_set_drvdata(alt, data);
>
> 'data' is of type struct cros_typec_altmode_data here
This should have been allocated as cros_typec_dp_data. Missed during a
previous refactor that changed the type from a union to this format.

>
> > +
> > +       return alt;
> > +}

