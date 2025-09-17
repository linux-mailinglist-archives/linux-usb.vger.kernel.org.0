Return-Path: <linux-usb+bounces-28204-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E31B7CFBF
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 14:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38E36586628
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 11:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C301A32B4B2;
	Wed, 17 Sep 2025 11:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eP4/C49y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E592FFF9A
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758108391; cv=none; b=pSGY6m3rXAL3JlWvchanWhOXBuv7hsENVuT8oX22q8Lydcxkf8qBLO9WQmV2nmPRuYPbVdJltte9tKXFHjxWD6Ibgg42BcenTEKpKVjIBolB8o18JUbMTWDTlpb0SRPxKCfi4g6F6VUwnMLyRBBSvBV1TuvdIEmQj0A+U7FXw7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758108391; c=relaxed/simple;
	bh=ppa9xqtoGfGGmWZPvjGVyKSOFbJHHlCDfK1ROI9sSuc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=m+SvZzORG38SmuXZDoA/zeKp6POhkytW0spUtFLOnm+DeeFXu+Fv0OI9comSZMpsfRUDfADac+sZ3AahT6/tnA6Z9EOywnLVo5EDa68uMnCnsMWskcDQuzan/0LhKb32c1acZv49DrsVCyCHNbIv0CzhjavNoWQ8oryaI74qJUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eP4/C49y; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so1092344466b.2
        for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 04:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758108386; x=1758713186; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgyP1skDDpJkVrmkkvIDINFO9MgyddQrfr7riBVEJpU=;
        b=eP4/C49yE/BRvaU3klF2lUBfV5xFx4nym6GMuSa3xR2rbLkwV85cKFvaf+GEJE+wjk
         dnAiIBZQWDdPFNqQ0O4XdKOQwIUZukP+HrIrz7rREM918n/XuMmKfcguv/mTJNhOX0U3
         sHmFjL+JOguJgshk1dRs+60vR/ZhMBaLJAN/abEFYUc1qG27uGk5v0Ne+szca+mlZjyP
         YKKzAZ313FhKoj29YoqhxLQmScpKSHgJ2O6RXBNMfAKS7r748BMaKje7priHMZy+gK/H
         s8p5qh7eJcVNqyBZ88mzCaX+7hIAUznTqUzdx0nJhbisdq4wPVUBGKXeR409g81HYVws
         q1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758108386; x=1758713186;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HgyP1skDDpJkVrmkkvIDINFO9MgyddQrfr7riBVEJpU=;
        b=VtHx4MU+uIiXDpGPlpO6ZxVrdmIu3N3XGSZuw/KYcOtYNfU8ob4xxtMJ+MQqpra++p
         77nda3bNV5ax3JuMX5hIkt7OxNlmBrGAk2myz/z2v+G5bBA3zS9szBnhhvc7ZurYLeAC
         pQZEWssoFhjo6UXf00XY939493JH2Ax6OvNWPCKLlbRnp0icL1KWG5HoSskyrLTLYC1i
         ap9TP0GFh5vqnZMXAzTNqIYo9KUC0zsShldiu8U4RzlFf58GAr7WPctFedsGEzmNnaik
         2gSDPCacthW9nH+sXSInKZeQhgBqF1GSFu/QxmWAJVBTyL9dDfJ845F+UULVTsdGGLT5
         cQOA==
X-Forwarded-Encrypted: i=1; AJvYcCXDEYeTRpId96BLbYrMnnsIa3oYFaz12cUZcm7vVpiM8eVqkSPaSuOHLK7/L3X6dTtVu+o9Cz/4I5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxEXgst1SiRLaElhunJezXXKOeKHP1dg5SSMtb6O/8+ixgR+bJ
	20rqvAR45CowKJFQn6Gw2rz7ehZn3/ootmUe/q0RFC3P1gPuunyjJJhV
X-Gm-Gg: ASbGnctOFFty1DJu3aH1fasm7oKJ+o7Dpzn3odKDnMPE2yZPW74V5//L5RgoNNpcRtc
	VR0KL90jNoak3OkxzlxHK6hOMRFaB0O5Nbye3QftMmUY0h6hkLTwF/cISi39ctR78JfKJFwKeeo
	04y/kAM+09gis/qe8BIJFx9H6jj+9pr4/fhOWOtSBYGi52TgRD8oqLS06dyDfHFf/p8WR1SNikZ
	gBtfjyUNpxhIjglR4yQt4YK4ekW+PjGV/3mYyi9b/WKA5Tnxaxy0DW2QYe99R22rrdxwGURQhq9
	0am1O2LUkrWLp5n69VWuZJKbBc5HXJ6IOV4SIU2oM49pCJI+dYgYF8efQUlvcXHQE04QZnhFVGJ
	ClHSyfrDPTxptZInnq0MpOLlLlkVICCsL9juehQUGyXr/ep+UpkVE5xAP/VDNfXVMdEE=
X-Google-Smtp-Source: AGHT+IFZoOXXk0BzdVxzupl6UXjj53Xlysq4bZMGAJDUG5f0y1MlvEMSvXFKvK4gq4mVVf9cuDDYRA==
X-Received: by 2002:a17:906:f592:b0:b0d:61a0:9a28 with SMTP id a640c23a62f3a-b1baf60b87cmr182559666b.6.1758108385868;
        Wed, 17 Sep 2025 04:26:25 -0700 (PDT)
Received: from localhost (public-gprs292944.centertel.pl. [31.62.31.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da388sm1340847766b.22.2025.09.17.04.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 04:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Sep 2025 13:26:23 +0200
Message-Id: <DCV1EPLCX5L5.3MWOCVTH5AWM4@gmail.com>
Cc: "Marek Szyprowski" <m.szyprowski@samsung.com>, <stable@vger.kernel.org>,
 <kernel@pengutronix.de>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, "Lukas Wunner" <lukas@wunner.de>, "Russell King"
 <linux@armlinux.org.uk>, "Xu Yang" <xu.yang_2@nxp.com>,
 <linux-usb@vger.kernel.org>
Subject: Re: [PATCH net v1 1/1] net: usb: asix: forbid runtime PM to avoid
 PM/MDIO + RTNL deadlock
From: =?utf-8?q?Hubert_Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>
To: "Oleksij Rempel" <o.rempel@pengutronix.de>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>
X-Mailer: aerc 0.20.0
References: <20250917095457.2103318-1-o.rempel@pengutronix.de>
In-Reply-To: <20250917095457.2103318-1-o.rempel@pengutronix.de>

On Wed Sep 17, 2025 at 11:54 AM CEST, Oleksij Rempel wrote:
> Forbid USB runtime PM (autosuspend) for AX88772* in bind.
>
> usbnet enables runtime PM by default in probe, so disabling it via the
> usb_driver flag is ineffective. For AX88772B, autosuspend shows no
> measurable power saving in my tests (no link partner, admin up/down).
> The ~0.453 W -> ~0.248 W reduction on 6.1 comes from phylib powering
> the PHY off on admin-down, not from USB autosuspend.
>
> With autosuspend active, resume paths may require calling phylink/phylib
> (caller must hold RTNL) and doing MDIO I/O. Taking RTNL from a USB PM
> resume can deadlock (RTNL may already be held), and MDIO can attempt a
> runtime-wake while the USB PM lock is held. Given the lack of benefit
> and poor test coverage (autosuspend is usually disabled by default in
> distros), forbid runtime PM here to avoid these hazards.
>
> This affects only AX88772* devices (per-interface in bind). System
> sleep/resume is unchanged.
>
> Fixes: 4a2c7217cd5a ("net: usb: asix: ax88772: manage PHY PM from MAC")
> Reported-by: Hubert Wi=C5=9Bniewski <hubert.wisniewski.25632@gmail.com>
> Closes: https://lore.kernel.org/all/20220622141638.GE930160@montezuma.acc=
.umu.se
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/b5ea8296-f981-445d-a09a-2f389d7f6fdd@=
samsung.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> Link to the measurement results:
> https://lore.kernel.org/all/aMkPMa650kfKfmF4@pengutronix.de/
> ---
>  drivers/net/usb/asix_devices.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/drivers/net/usb/asix_devices.c b/drivers/net/usb/asix_device=
s.c
> index 792ddda1ad49..0d341d7e6154 100644
> --- a/drivers/net/usb/asix_devices.c
> +++ b/drivers/net/usb/asix_devices.c
> @@ -625,6 +625,22 @@ static void ax88772_suspend(struct usbnet *dev)
>  		   asix_read_medium_status(dev, 1));
>  }
> =20
> +/*
> + * Notes on PM callbacks and locking context:
> + *
> + * - asix_suspend()/asix_resume() are invoked for both runtime PM and
> + *   system-wide suspend/resume. For struct usb_driver the ->resume()
> + *   callback does not receive pm_message_t, so the resume type cannot
> + *   be distinguished here.
> + *
> + * - The MAC driver must hold RTNL when calling phylink interfaces such =
as
> + *   phylink_suspend()/resume(). Those calls will also perform MDIO I/O.
> + *
> + * - Taking RTNL and doing MDIO from a runtime-PM resume callback (while
> + *   the USB PM lock is held) is fragile. Since autosuspend brings no
> + *   measurable power saving for this device with current driver version=
, it is
> + *   disabled below.
> + */
>  static int asix_suspend(struct usb_interface *intf, pm_message_t message=
)
>  {
>  	struct usbnet *dev =3D usb_get_intfdata(intf);
> @@ -919,6 +935,16 @@ static int ax88772_bind(struct usbnet *dev, struct u=
sb_interface *intf)
>  	if (ret)
>  		goto initphy_err;
> =20
> +	/* Disable USB runtime PM (autosuspend) for this interface.
> +	 * Rationale:
> +	 * - No measurable power saving from autosuspend for this device.
> +	 * - phylink/phylib calls require caller-held RTNL and do MDIO I/O,
> +	 *   which is unsafe from USB PM resume paths (possible RTNL already
> +	 *   held, USB PM lock held).
> +	 * System suspend/resume is unaffected.
> +	 */
> +	pm_runtime_forbid(&intf->dev);
> +
>  	return 0;
> =20
>  initphy_err:
> @@ -948,6 +974,10 @@ static void ax88772_unbind(struct usbnet *dev, struc=
t usb_interface *intf)
>  	phylink_destroy(priv->phylink);
>  	ax88772_mdio_unregister(priv);
>  	asix_rx_fixup_common_free(dev->driver_priv);
> +	/* Re-allow runtime PM on disconnect for tidiness. The interface
> +	 * goes away anyway, but this balances forbid for debug sanity.
> +	 */
> +	pm_runtime_allow(&intf->dev);
>  }
> =20
>  static void ax88178_unbind(struct usbnet *dev, struct usb_interface *int=
f)
> @@ -1600,6 +1630,10 @@ static struct usb_driver asix_driver =3D {
>  	.resume =3D	asix_resume,
>  	.reset_resume =3D	asix_resume,
>  	.disconnect =3D	usbnet_disconnect,
> +	/* usbnet will force supports_autosuspend=3D1; we explicitly forbid RPM
> +	 * per-interface in bind to keep autosuspend disabled for this driver
> +	 * by using pm_runtime_forbid().
> +	 */
>  	.supports_autosuspend =3D 1,
>  	.disable_hub_initiated_lpm =3D 1,
>  };

Well, this fixes the issue for me. No suspend/resume -- no deadlock -- no
problem. Thanks.

Tested-by: Hubert Wi=C5=9Bniewski <hubert.wisniewski.25632@gmail.com>

