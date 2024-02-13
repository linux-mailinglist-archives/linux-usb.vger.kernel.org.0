Return-Path: <linux-usb+bounces-6362-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C008536A3
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 17:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC2D1B2276B
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 16:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E9B5F856;
	Tue, 13 Feb 2024 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hJ0ir3bi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2865FDA5
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 16:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707843335; cv=none; b=ccv1WTkm7qiFfoUDr22FH5KnuTXaAnqSLIrac8GNsNksXIJ1Z3armkrem/Yplh6MRxodg6rTMKzV+NkFA8pdc5zZa11dGw7KoG4QmR96n7ljePTt5zOI18yXklhBQVhwSVyEU1HFJpn29kvpsEChoj/LI68fyYDBpHDlWHKzhBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707843335; c=relaxed/simple;
	bh=HE/20Xm9WCTyMPH/lmK4IPJtvUMDxg+CfKS4AXTMswA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+Mw23eN1qbYRmw5eIVGQpJewv91xN4D6U5g+eOCM9aIZIYs9zzhWs7KgxFb/IFkCMDCA+GF7wm5Gk3y7T8YDG+dxcmtze6ZlmqALNq2kk2afDj4An/2sIPuEfmrCn85DX4VIYTmzlbSduBvjj37LiCdmaqlcJUA70vaWU/8rNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hJ0ir3bi; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c049ccb623so164036b6e.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 08:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707843332; x=1708448132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4lPSxTY6wTzszL0a5uZSwuzQyy5laP/IX8YJFhtcMQ=;
        b=hJ0ir3biFRyJOa95GJT1sIelu/9HHCFooTNOy0k6iF5kbqHZqgzxvM1mWiX9YN1qfQ
         fe9vcN6aKgkVB0tRns5PXpr3Oi2zgL+exr5MlCMbT6maFXwq+AC0Tq3F0Nu+z3pz49fN
         0Adk/QvqpX4kkw3veMoFVLJEDrDq1dFpy9ylA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707843332; x=1708448132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4lPSxTY6wTzszL0a5uZSwuzQyy5laP/IX8YJFhtcMQ=;
        b=S5e3B4580+cZ221imBC/zS01SyUcgfrp/LYIkngO8FnUr9sfcI4wODt5O8dzYYCmZW
         fwcwWr56aTe270iVS510ysexz3NbW+6rkjNJv4cbCYm8qK+CJZD4C7rzhbXL0TGsZos/
         HKD6QSQVcV5Kgq0sQrGy+bV9EUJ1/cYW+9daLIjuDGUy6YTRILlDqvtWVGf9qlMpRdss
         CG+7yvpn6TfZOI4ZtwtUym8kuIIdpRbGYhLWqXn71MFYRFIgRiV4LiRv+fFTHM2t6jW4
         duQkBYiIjn8EBozNOf72VWhp/tMb77IXPPciSupLdkMR6yboIAzFOvnxtWOiQlP1Oafi
         +sfw==
X-Forwarded-Encrypted: i=1; AJvYcCVlHz1g6Cjt9IaTPCfT0jXuqH0uu2Yd2ra5aFf2ZPsIzJOQASfDrQfTFoc2SK0A6TEAtBu5iFGvMfYUdcH5ZOrX7i6jcPasAQFd
X-Gm-Message-State: AOJu0Yxy0wF9gxKRqAfIovO3PAIT+aeHys6/+kd+6W2jIT1wAYZxAGCr
	CD2Iae3JCnGpvtmzNPNqCan3/vAtBBM+Waqcb+kVPhvKSlGDelgcpBaEzmXr7zP4fMmx0wjS/WF
	30XmWfxXLxGCNUJ1d2ald4+LbjKIIAyk6C4q6
X-Google-Smtp-Source: AGHT+IF621AcZlHabo8tSWMrLrYcsvXNOTbA67xsv4QZQyYYW0BcYdZTIRHza0q2P5iytSfC6OBpB6w1KP2sxrbZPoI=
X-Received: by 2002:a05:6808:188d:b0:3c0:4719:45ad with SMTP id
 bi13-20020a056808188d00b003c0471945admr1531810oib.40.1707843332527; Tue, 13
 Feb 2024 08:55:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213130018.3029991-1-heikki.krogerus@linux.intel.com> <20240213130018.3029991-3-heikki.krogerus@linux.intel.com>
In-Reply-To: <20240213130018.3029991-3-heikki.krogerus@linux.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 13 Feb 2024 08:55:20 -0800
Message-ID: <CACeCKadLKg89c8s68QD6VsqiKBMms6765O7mFFihqtET30pUyQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/chrome: cros_ec_typec: Make sure the USB
 role switch has PLD
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Emilie Roberts <hadrosaur@google.com>, "Nyman, Mathias" <mathias.nyman@intel.com>, 
	"Regupathy, Rajaram" <rajaram.regupathy@intel.com>, 
	"Radjacoumar, Shyam Sundar" <ssradjacoumar@google.com>, Samuel Jacob <samjaco@google.com>, 
	Uday Bhat <uday.m.bhat@intel.com>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heikki,

On Tue, Feb 13, 2024 at 5:00=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> The USB role switch does not always have the _PLD (Physical
> Location of Device) in ACPI tables. If it's missing,
> assigning the PLD hash of the port to the switch. That
> should guarantee that the USB Type-C port mapping code is
> always able to find the connection between the two (the port
> and the switch).
>
> Tested-by: Uday Bhat <uday.m.bhat@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 2b2f14a1b711..4d305876ec08 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -24,6 +24,23 @@
>  #define DP_PORT_VDO    (DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BI=
T(DP_PIN_ASSIGN_D)) | \
>                                 DP_CAP_DFP_D | DP_CAP_RECEPTACLE)
>
> +static void cros_typec_role_switch_quirk(struct fwnode_handle *fwnode)
> +{
> +#ifdef CONFIG_ACPI
> +       struct fwnode_handle *switch_fwnode;
> +
> +       /* Supply the USB role switch with the correct pld_crc if it's mi=
ssing. */
> +       switch_fwnode =3D fwnode_find_reference(fwnode, "usb-role-switch"=
, 0);
> +       if (!IS_ERR_OR_NULL(switch_fwnode)) {
> +               struct acpi_device *adev =3D to_acpi_device_node(switch_f=
wnode);
> +
> +               if (adev && !adev->pld_crc)
> +                       adev->pld_crc =3D to_acpi_device_node(fwnode)->pl=
d_crc;
> +               fwnode_handle_put(switch_fwnode);
> +       }
> +#endif
> +}
> +

I'll reiterate my comment[ 1] from v1: can this be in the
common Type-C code, i.e typec_register_port() ?

I don't see anything in this implementation which is Chrome OS specific.

Thanks,

-Prashant

[1] https://lore.kernel.org/chrome-platform/CACeCKaffZBPA0Q_Bqs1hjKJB4HCj=
=3DVKrqO21dXj4AF5C5VwtVQ@mail.gmail.com/

