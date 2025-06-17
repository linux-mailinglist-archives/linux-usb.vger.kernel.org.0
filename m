Return-Path: <linux-usb+bounces-24831-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22126ADCC0D
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 14:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B34AE7A9742
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 12:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE09F28BA9C;
	Tue, 17 Jun 2025 12:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MXPtRxzw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD72D230D0E
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164885; cv=none; b=FUkLc5e34R00GxY3SQgR5mqTur/asnA9AWGlcUHpNJ57jk+yRyvR4OaqdzKLrNZrNx1dJBvavCi1+twPpCoICv28kXjHDuFdipFB8bulQ9nT5n/VPOlcduSIu1AZUUEN4EBq7tRLQLHiHC0lZn7WumDrmtxFMrSIf12sbC5wXOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164885; c=relaxed/simple;
	bh=FxzlxQZZ8ErMBigR9fc+Rjf5JKpOe1VdKISwtp/3ATE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMda+mrH/gCx6JjBgGjmOIpSfkpnq5y2o129VpiUfI3wB1zYytT9dKBpbFfXij9OizyexrFt8TWzCi65jx2AJ2M736ntoS/jMG7CGjhPnBUk3CSj3mgFg+JdkvQIbfl3mIXxHHBWplFIMWzhIV5I49UlvTtT3pP+F5yqBwHpSTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MXPtRxzw; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-748d982e97cso354175b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 05:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750164883; x=1750769683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIz/FMRtgwsTC+HYTMdCl4f60+W4V34OeVftKEDL+z8=;
        b=MXPtRxzwQXk2l3JY8lPGaA8SNNErTITJVRy38BJeZXZ8rj9SZthnZgFA9PKeHBAYbq
         G6BB0Q7pMQyJzTnTuVg3mK4xv3RJrzZzJD/8EzAzBz4XV2t+Ihyl/BK1x3yUINNqQQuI
         65FIjlr7XZU0CrV0c5f+dHuoaupgsfReN2JFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750164883; x=1750769683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIz/FMRtgwsTC+HYTMdCl4f60+W4V34OeVftKEDL+z8=;
        b=GGyJPzYkWPGpn09rBpxaKarLdC2hv7ecGqiqXT37DRrtbBNxVo8hl/lTcv2NWdiSGA
         U6TywX/xXP9iLPFVrw5Gy6NoINnPCBha8zuI93Lx4/WOUwylXqbYxsI4zCkPNyKitBGc
         fUfkEBS28uzKCpTd1zdu3hVRvX31x5hKvVwoF7N495SnrsUBpxf+mbsHNVVL8HnMukZB
         A4etXB3WpbswcRv5LwiS1OZaeZPkCYiL2/MqG4iNYyTsS9FxhLP2+Vtmomnti6Zet+a9
         I62gzJzn583qo91LpxTKDj/moFPPjtPocJ+mC04Kt6t/94C5l2LeGSHg4wzfAS4hjqgA
         rEMA==
X-Forwarded-Encrypted: i=1; AJvYcCVmIKJTiMy0vAtuktDKtjWfMhoexeceKUvqu70XjBX5yK1dReYO/w82SDfQaGhB2cPspT6141seyH8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj9YB1gOAZ3WKM8eAQqiXR/AD8+0/3FXDpsKzmTLQ9vfzeKWpx
	Y3luBAcIo8fho+GckrLLrp/XHPQG8YhIhmJ5yRwGy3PKsUNMbaPbZEPsoNWlnD9I4dJKIUYL/nu
	gOIbAHgX9AhhZniI4HcrKJJ0km+Dp4wpXxfx18L89
X-Gm-Gg: ASbGncvqeRV7PH9QtiS3o1WlbF2ML+RMFFl/xhMv+dOKrnbu1s1KpZf5YUC+MFr5oQ9
	D7X7AE8wPNNkOnd0cg8u+hXIYSYrrbauAe0Dqz7S2F1yfpjXhJAmwJLLWbfBN/Hoxp1sJAuZpjq
	jr+F+/1CESlD+Qa+m9DoOmgtiVZUd38bgE3VYPOi9XqWIT7AxPJxe+nb5XYbZwfMm9CLVe
X-Google-Smtp-Source: AGHT+IFNOIUYi+5hHdN381jMozlhdv8TZWEs3iifK29iavCfU0mKB9p4IykhjV/IvnnwJXRpXtMdEPE9xxaRduPeRhY=
X-Received: by 2002:a05:6a00:a86:b0:73e:598:7e5b with SMTP id
 d2e1a72fcca58-7489cfc27edmr16829475b3a.1.1750164883054; Tue, 17 Jun 2025
 05:54:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616133147.1835939-1-akuchynski@chromium.org>
 <20250616133147.1835939-7-akuchynski@chromium.org> <aFEtT5JAaGQIs-vG@kuha.fi.intel.com>
In-Reply-To: <aFEtT5JAaGQIs-vG@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 17 Jun 2025 14:54:29 +0200
X-Gm-Features: AX0GCFsTu0UqkokKiq4xWkmUWDTeZ6ZnpJ0o1xk-NKRJ9vpe9u9k_-Fhg2uUkHU
Message-ID: <CAMMMRMctfOabMK3Rwfk_i+P0XsLECg5yOfhYO+9yqp-SFZrVEQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] Revert "usb: typec: displayport: Receive DP Status
 Update NAK request exit dp altmode"
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <groeck@chromium.org>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 10:54=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Andrei,
>
> On Mon, Jun 16, 2025 at 01:31:43PM +0000, Andrei Kuchynski wrote:
> > This reverts commit b4b38ffb38c91afd4dc387608db26f6fc34ed40b.
> >
> > The commit introduced a deadlock with the cros_ec_typec driver.
> > The deadlock occurs due to a recursive lock acquisition of
> > `cros_typec_altmode_work::mutex`.
> > The call chain is as follows:
> > 1. cros_typec_altmode_work() acquires the mutex
> > 2. typec_altmode_vdm() -> dp_altmode_vdm() ->
> > 3. typec_altmode_exit() -> cros_typec_altmode_exit()
> > 4. cros_typec_altmode_exit() attempts to acquire the mutex again
> >
> > This revert is considered safe as no other known driver sends back
> > DP_CMD_STATUS_UPDATE command with the NAK flag.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/altmodes/displayport.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typ=
ec/altmodes/displayport.c
> > index b09b58d7311d..ac84a6d64c2f 100644
> > --- a/drivers/usb/typec/altmodes/displayport.c
> > +++ b/drivers/usb/typec/altmodes/displayport.c
> > @@ -393,10 +393,6 @@ static int dp_altmode_vdm(struct typec_altmode *al=
t,
> >               break;
> >       case CMDT_RSP_NAK:
> >               switch (cmd) {
> > -             case DP_CMD_STATUS_UPDATE:
> > -                     if (typec_altmode_exit(alt))
> > -                             dev_err(&dp->alt->dev, "Exit Mode Failed!=
\n");
> > -                     break;
>
> Commit b4b38ffb38c9 ("usb: typec: displayport: Receive DP Status
> Update NAK request exit dp altmode") addressed a very real problem
> with failure to execute data role swap. You are not really offering
> anything else for that issue here.

Thanks, I see the problem now. Reverting the patch is not feasible.

>
> Is it not an option to just schedule the mode exit here instead to
> solve the problem?

Of course, that's an option. Alternatively, maybe I could resolve the
deadlock within the `cros_ec_typec` driver. Regardless, this seems like
a separate patch.

>
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec=
/altmodes/displayport.c
> index b09b58d7311d..2abbe4de3216 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -394,8 +394,7 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
>         case CMDT_RSP_NAK:
>                 switch (cmd) {
>                 case DP_CMD_STATUS_UPDATE:
> -                       if (typec_altmode_exit(alt))
> -                               dev_err(&dp->alt->dev, "Exit Mode Failed!=
\n");
> +                       dp->state =3D DP_STATE_EXIT;
>                         break;
>                 case DP_CMD_CONFIGURE:
>                         dp->data.conf =3D 0;
>
>
> --
> heikki

