Return-Path: <linux-usb+bounces-6050-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1A084E77C
	for <lists+linux-usb@lfdr.de>; Thu,  8 Feb 2024 19:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE35F1F23547
	for <lists+linux-usb@lfdr.de>; Thu,  8 Feb 2024 18:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F10E85C56;
	Thu,  8 Feb 2024 18:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EOloWcLe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3641823C2
	for <linux-usb@vger.kernel.org>; Thu,  8 Feb 2024 18:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707416076; cv=none; b=YShCOkt+qtwxfw+utzBAkXm+LONNNYFfwRSaKsY7bytv5l2dtIziBh6Kaj7HLVTUWASLA0ZIuWCQiMMi/q1bBVnHryGHdGig9iZYf3DCX2lLjUoks5NVBrWWX99x/2QKQeE1DMlxYvig61yUWZq2A9dv9sCGYAUdzPWbr9WEkD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707416076; c=relaxed/simple;
	bh=raktRbRT/30YboSLtBUFxeNmuuB0czI5c0h//xAnajU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bJ+JWNNeylchXRfZ8tTXpE0D6jJkEDjVAnHWIZ5HJj0FApU7r3RnIJkhTn7zJch+GSDOU1wDWjIo7zVmlcoKhL4rrh6aL+DW6mzp9aVupqFfNmLSteJ9jI51oJ+YR2QwL6XBeuIShEKnwvSfeomArFaz5PHF/x8FaGCB9zpSXT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EOloWcLe; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6e0f43074edso38399a34.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Feb 2024 10:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707416073; x=1708020873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP2DrPejZ4y9GWeuess5B/7wBkV0f7f91rTBUzRBkq8=;
        b=EOloWcLe2sSpma/uytSR9jojn0HW5vuD6NvtwWR08B+qRnuhO/4aeo+46IzydWlxvs
         zL/5M6+7AkxfZyXpCspWs8xYyM4beU+aXcPISD/NJ2mq6JV63ZvrrALbKwahBhZy16p+
         f5jmdV2aHMM47buGbIzRZd7upOKm8qbODDyO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707416073; x=1708020873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XP2DrPejZ4y9GWeuess5B/7wBkV0f7f91rTBUzRBkq8=;
        b=ffID4TYIvWtR0n7xir1dQ/sZNlRlQwACeuoah4wOp8Nhi9sWfvULyXSCDQasOJRS2m
         N+4/M8sLLFtQ9tyChjxW5kvZuieiOcqr4PMxS3uiQc0vP94Nzr0LASLJqw8+NICzu32H
         ZCI1iTAj1Kb1zYMDWj6oxrkigZEX7HDiVabzr0jdbViWAVGiwL0geSioxtsRc+f85ut2
         EZod91sM10pbD2FwA9qMbBj2cv5KCkcv/vMYxAIIZMlNP/6mEE41Kk5MER4aqSL4DXVv
         sAtNBiP1fn5va63wPstpIkuLAHWbeS+ufocJySVUq9HzV7g0U2cTia04C7pA9n56yDOL
         FObg==
X-Gm-Message-State: AOJu0YxeACSpuG3xC01S6dTjy3sRfqIlOy0lfAu66a3p7waWIoOB8xy8
	fM9+WTmnDZcg1GkjZRaax+t3f7XzyPWye6/VMUHDlLHqKzAAuLphWj/uJ9BCwZo3kCP/Q1nAm32
	8lTVbnIBwycku7LOgdDoDQlDordzDbRVTnGur
X-Google-Smtp-Source: AGHT+IH+qDHRnUdLJutzlN4b7pMy+thkGoe7hkl8pgXZ0zfa7tKazwCMgVBQmcEjJITTaGbfbAm+SCOgcOTd2UDmzy0=
X-Received: by 2002:a05:6830:1248:b0:6e1:d90:c429 with SMTP id
 s8-20020a056830124800b006e10d90c429mr323749otp.7.1707416072966; Thu, 08 Feb
 2024 10:14:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240207145851.1603237-1-heikki.krogerus@linux.intel.com> <20240207145851.1603237-3-heikki.krogerus@linux.intel.com>
In-Reply-To: <20240207145851.1603237-3-heikki.krogerus@linux.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 8 Feb 2024 10:14:21 -0800
Message-ID: <CACeCKaffZBPA0Q_Bqs1hjKJB4HCj=VKrqO21dXj4AF5C5VwtVQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/chrome: cros_ec_typec: Make sure the USB
 role switch has PLD
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Emilie Roberts <hadrosaur@google.com>, "Nyman, Mathias" <mathias.nyman@intel.com>, 
	"Regupathy, Rajaram" <rajaram.regupathy@intel.com>, 
	"Radjacoumar, Shyam Sundar" <ssradjacoumar@google.com>, Samuel Jacob <samjaco@google.com>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Uday Bhat <uday.m.bhat@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heikki,

On Wed, Feb 7, 2024 at 6:59=E2=80=AFAM Heikki Krogerus
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
>  drivers/platform/chrome/cros_ec_typec.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 2b2f14a1b711..5c14e8db08b5 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -28,6 +28,7 @@ static int cros_typec_parse_port_props(struct typec_cap=
ability *cap,
>                                        struct fwnode_handle *fwnode,
>                                        struct device *dev)
>  {
> +       struct fwnode_handle *sw_fwnode;
>         const char *buf;
>         int ret;
>
> @@ -66,6 +67,16 @@ static int cros_typec_parse_port_props(struct typec_ca=
pability *cap,
>                 cap->prefer_role =3D ret;
>         }
>
> +       /* Assing the USB role switch the correct pld_crc if it's missing=
. */
> +       sw_fwnode =3D fwnode_find_reference(fwnode, "usb-role-switch", 0)=
;
> +       if (!IS_ERR_OR_NULL(sw_fwnode)) {
> +               struct acpi_device *adev =3D to_acpi_device_node(sw_fwnod=
e);
> +
> +               if (adev && !adev->pld_crc)
> +                       adev->pld_crc =3D to_acpi_device_node(fwnode)->pl=
d_crc;
> +               fwnode_handle_put(sw_fwnode);
Can this be in common Type-C code (maybe typec_register_port())?
It doesn't strike me as ChromeOS specific, but perhaps I am missing somethi=
ng.

Thanks,

