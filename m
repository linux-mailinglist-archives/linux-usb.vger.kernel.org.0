Return-Path: <linux-usb+bounces-28937-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 788F4BBFCA7
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 01:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 39C9A4E69AE
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 23:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15F91ACED5;
	Mon,  6 Oct 2025 23:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0jaz0iRz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D201034BA35
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 23:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759794347; cv=none; b=skVbnaQJaUi5PD8hu9QW4l+F5xwePEFGTEbz0DNEKAbtsUPaXsJb6E62ck9BviVPj3tx+9/zNr1pPmUZcf6G9OG5g6EerTs0qX9CGXaG4Boeixi0KB1gPzYQ7ceHVrDIJQ9sd9npiNJd4kCkMaObziFLMVVrmZYEZ2xpzmXGz5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759794347; c=relaxed/simple;
	bh=gXvJffdAxF0/O5h8eNDDbbiC6L12/V/MPW79Uxalt7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NyK6oM/aePhE5P8XYt9iHm3cOQIXYqj1owLelEBmruP66qIK1WaUkgiG9NlFuI2TsX91C95j+MPY4Zn3eUpQGyIhfBP2iIc6ldabEruaQsO8FgmwdQ71GACYdyXsKakqfd/MCVh3M0aQr3HP00HtdnABOl2ChcFVnjynBXt1ceQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0jaz0iRz; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7bc626c5461so1858478a34.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 16:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759794345; x=1760399145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMH6EOUzh7sixQHmneVhPBgq4T9np1jeTouTUMIwLd0=;
        b=0jaz0iRzfBm7VRL9s0FfVdU78d+brF0+pVseCq1wmjD3hjxbMjDG7H0XbwvV+8JsMQ
         Z3VlUt4Zx1yqrvKsZdrLNgyoZL8XWlO91Ys1V1fV7uHX6MZGW5M7xFv1jU2RgTz5opCt
         CVvvSck7IVN0jdveQEUrRkq0E141f4CDF8alncaZrJi98xAoww7p0lgaxjhTs6SexH18
         uH3OYmXw8cpbL5xjbVlfPLJBl2BT18t4TaNoDJuIhGb5DlUoAVtI2zsxeLNk/OK8gKuI
         HuTAlRTwL3vIRyr8nh31lS3iBRg47Cds/YUKUrpAQ2RqSBpOo0oHtrzEyKDBoesY+M98
         n+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759794345; x=1760399145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMH6EOUzh7sixQHmneVhPBgq4T9np1jeTouTUMIwLd0=;
        b=ad2SExb04G2fcxOAXoc1zEv14k6y2UFhPF+jt4MukICGQsbTpJl1dBTauBX6wAGuWz
         lWT4RNoWrWltrjBG6QjsHzmEoA+7dVHRVfvA1G0tXrpbcgUzx0BJDnDVjewrQzXM2I8E
         X0ychgZFsHKRX2awX0YVnyHyQeondayQxxbdPBWrmsht3hbnmbOXj8Zg85F8RUi6OjGx
         O6EcEO9bo0tyugW7XofA+jhneEUYAxRFuwOiULSfa5RBH1ej65YOG0ynvc77yQp0pWse
         5nbWPNuQ/BAR5NKwAJGF8vVbRLFBcKo9zPFBWwejUY47itrpyaA4lKSrA3GnyYEET+FN
         MMeA==
X-Forwarded-Encrypted: i=1; AJvYcCW36mqUpzMdGhnkJb4xVrkW9Kpd6LynepPXfKx5z+pXYT+Y4tZ81ueUcjfnH9qZ0C3V6ujqI7aRQQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSSB35L+EskKYhGhmNwg1bIXayVblhk4nL0AgM1WUjgaxUokM1
	4+c5hzO+5DtVSmQz7JyOzVf2R23hDgcmIj0Yx36YQyCxLKk26xIOKn3Mc537eHltbPZU/RiNIY0
	Z1KiTK1Gy4GvchGHVINBrZWogNBjBLdmZcXrQzLzE
X-Gm-Gg: ASbGncs05SUTT/B9YhPpHabXRFDdxEn/v5cgezsF2hvWzzOZz1kafvPJg/12snIi1Sn
	Yp+2nR6Dw79Aj+ULSq28pCPnEHS3DKLootiSxyoarmHnVRNim0CLzz+V1et9xatbfg5w3n1wGh/
	25s6Gzuydk7E/vmSsKmMjvpJ7CxdxruO+VRhCDmtrjqOHN9uDAwAzwb8Er1aaAHxGXo9DQcQx/A
	KQOvUCVBeHlux8I9FATEpqa4V0imEB6p/17x7oNs9xv7mYmma21oqBD+Gho6ng9tESXIO+x6TP1
	hAU=
X-Google-Smtp-Source: AGHT+IF7pQFnR4aI/o7CArYsp36gcIh/KOTTl2/IwMMUXfTdS/EiNd3z3pzcJlN14CUdCT+thqvKfuqT9pUnwvmmJWo=
X-Received: by 2002:a05:6808:5191:b0:43f:7287:a5b1 with SMTP id
 5614622812f47-43fc186346bmr6505503b6e.39.1759794344612; Mon, 06 Oct 2025
 16:45:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003-b4-ml-topic-tcpm-v1-1-3cdd05588acb@pengutronix.de>
In-Reply-To: <20251003-b4-ml-topic-tcpm-v1-1-3cdd05588acb@pengutronix.de>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Mon, 6 Oct 2025 16:45:08 -0700
X-Gm-Features: AS18NWCS0HhVdR_luF4uTj0G7T69NeusmEFoJOwYrVN0XPMCKmyNP-mxL580U1o
Message-ID: <CAPTae5Jn_visQUHaHvb2yXZdBhFySz+24TJuY8uyVB1v7tVisA@mail.gmail.com>
Subject: Re: [PATCH] tcpm: switch check for role_sw device with fw_node
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@pengutronix.de, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

.

On Fri, Oct 3, 2025 at 3:34=E2=80=AFAM Michael Grzeschik
<m.grzeschik@pengutronix.de> wrote:
>
> When there is no port entry in the tcpci entry itself, the driver will
> trigger an error message "OF: graph: no port node found in /...../typec" =
.
>
> It is documented that the dts node should contain an connector entry
> with ports and several port pointing to devices witch usb-role-switch

s/witch/with

> property set. Only when those connecter entry is missing, it should

s/connecter/connector

> check for port entries in the main node.
>
> We switch the search order for looking after ports, which will avoid the
> failure message while there are explicit connector entries.
>

Missing Fixes: tag ?

> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index b2a568a5bc9b0ba5c50b7031d8e21ee09cefa349..cc78770509dbc6460d75816f5=
44173d6ab4ef873 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -7876,9 +7876,9 @@ struct tcpm_port *tcpm_register_port(struct device =
*dev, struct tcpc_dev *tcpc)
>
>         port->partner_desc.identity =3D &port->partner_ident;
>
> -       port->role_sw =3D usb_role_switch_get(port->dev);
> +       port->role_sw =3D fwnode_usb_role_switch_get(tcpc->fwnode);


Seems to be a reasonable thing to do esp. given that bindings
documention mentions that port/ports node is part of connector
class:https://github.com/gregkh/linux/blob/master/Documentation/devicetree/=
bindings/connector/usb-connector.yaml#L189.


Adding hdegoede@, jun.li@ as they submitted patches for USB role switch in =
tcpm.
hdegoede@, jun.li@ Please let us know if there are any concerns from
your side regarding accepting this patch.

Thanks,
Badhri


>
>         if (!port->role_sw)
> -               port->role_sw =3D fwnode_usb_role_switch_get(tcpc->fwnode=
);
> +               port->role_sw =3D usb_role_switch_get(port->dev);
>         if (IS_ERR(port->role_sw)) {
>                 err =3D PTR_ERR(port->role_sw);
>                 goto out_destroy_wq;
>
> ---
> base-commit: e406d57be7bd2a4e73ea512c1ae36a40a44e499e
> change-id: 20251003-b4-ml-topic-tcpm-27146727d76a
>
> Best regards,
> --
> Michael Grzeschik <m.grzeschik@pengutronix.de>
>

