Return-Path: <linux-usb+bounces-14623-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 574CD96B067
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 07:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E1FE2853A4
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 05:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948F482488;
	Wed,  4 Sep 2024 05:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f1I511wr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E71954BD4
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 05:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725427048; cv=none; b=eC2ekAxQVGsMDMZ7+Y9Kb7NQO/GNzp5x1RYczobFFHZAU/EQLZiaJkSXOG1ZmQx/lWs2VyVv3NO9v4EtJ53T0IcfH5zatL/seuTgpnXX7xu542baP/HSkm+0zLXib5mDe5iAEttzLGEJHqlJW2/wiF+whdobWvFUwFp3eDABRcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725427048; c=relaxed/simple;
	bh=GXsPB9FSeK9RJ5MpXDc2AUH8ZCfeulmiyLYOqZgjgEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I89xxFV0x9fgm4mx6S+gQbdgk7H77MgOfKu9l/FUX8QEwc+4Vvoj0HhcVKn9ptggnGGV+WYVcu10WcPxoddg9+VTpiqb8FIeLUIlCwgyayDTz9AZKKZgDqSq8poIokyDmtLoM+Jr7f7ty1SY0aKzkh3CGBCHFaNWmaLIwgkt/dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f1I511wr; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6d3c10af2efso45682167b3.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Sep 2024 22:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725427045; x=1726031845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oS3AO73RG6FN/+WIV2MlfaORV9Z7EP5GhaEq4vwng3I=;
        b=f1I511wrH//KXLuzsbgTOGLnkLXgzop1XQbUxmwdM6GBO89k35iR81wUzcJgYKWrmp
         zo+b6fNjTWQcHo87l4fwUOm7+0YcqBq0Zx7XyNU8Mo24VOSSqnINp4gAZoDJrcR85Md+
         UK+y3T/wVW7KcTZDwrdEfLKQKjkYEpsPWIakE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725427045; x=1726031845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oS3AO73RG6FN/+WIV2MlfaORV9Z7EP5GhaEq4vwng3I=;
        b=WH3lTQbu0M3n4wZXyx00UdYP1dJkFpmMyXX6ZfXRTiKiliHEAkt4bT3DL2gUbvrSt4
         7XOTgnSoRjDHYM5yrcI/2/u/0+f6eZfLEUW3l0E33DTqk2OZHE6SgxbDUpTVFRVmSWJK
         Ss6T2CIMGKiD50qBOsINSuw8/SUfdL1FLC2wu0P6pIPZdUeJy0K5Ays3Ik/VFWch5Krq
         r6qObunA1SohdXcAn9k/ShW6OuGUP6L50XCit4N+ZMLgZcbo8Pd6dx4x82tZnDXgdFcU
         K9NMFBy+I6WkpvRj/HZgteVyYJbflz6HLpkaEC4S8gqxM5j91P2/7j14S6eBtTCcnabO
         rU5w==
X-Forwarded-Encrypted: i=1; AJvYcCUUkv8B4SnXnHsTKtIPW4MwM/qoR8sUySVuogdAarUspw02/Vp6laQcisZ1ZUJ6nNHk1TC372ugcw0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs01NSyXhebtfUpvwIY6L//pN3prv36HAaZnSTp+mwyE4p5FCR
	rIGYX/Iyaju8tBA0ZcHxaz7tLboS+oYUX5WEmozlsu3fWtxwQisj39Y3KEp+rtqCkZ86coO45H0
	REtMzV5SWqtnw7o7PfKcfg2989vCfiZc9c5xI
X-Google-Smtp-Source: AGHT+IEze1dC92Djh3B7v9O+YQRjHpM6MX+rd578GuHadSdM1dBjEueEmpPZIz0zJrKzGLYxdNN8xMdw2ypI7DsqM4Y=
X-Received: by 2002:a05:690c:dc1:b0:643:6087:efb8 with SMTP id
 00721157ae682-6d40d88f38amr199369457b3.3.1725427045227; Tue, 03 Sep 2024
 22:17:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903145342.3449969-1-heikki.krogerus@linux.intel.com> <20240903145342.3449969-2-heikki.krogerus@linux.intel.com>
In-Reply-To: <20240903145342.3449969-2-heikki.krogerus@linux.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Tue, 3 Sep 2024 22:17:13 -0700
Message-ID: <CANFp7mWsgDo7orAWugH9DHdP3=P06Uat8qEeBadOrEmjGJMTiA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] usb: typec: ucsi: Helper for Get Connector
 Status command
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Bartosz Szpila <bszpila@google.com>, 
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 7:53=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> That command is executed from several locations in the
> driver, so providing a dedicated helper function for it.
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index 35dce4057c25..71cf64a424d9 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -646,6 +646,16 @@ static void ucsi_unregister_altmodes(struct ucsi_con=
nector *con, u8 recipient)
>         }
>  }
>
> +static int ucsi_get_connector_status(struct ucsi_connector *con, bool co=
nn_ack)
> +{
> +       u64 command =3D UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER=
(con->num);
> +       struct ucsi *ucsi =3D con->ucsi;
> +       int ret;
> +
> +       ret =3D ucsi_send_command_common(ucsi, command, &con->status, siz=
eof(con->status), conn_ack);
> +       return ret < 0 ? ret : 0;
> +}
> +
>  static int ucsi_read_pdos(struct ucsi_connector *con,
>                           enum typec_role role, int is_partner,
>                           u32 *pdos, int offset, int num_pdos)
> @@ -1123,12 +1133,10 @@ static void ucsi_partner_change(struct ucsi_conne=
ctor *con)
>  static int ucsi_check_connection(struct ucsi_connector *con)
>  {
>         u8 prev_flags =3D con->status.flags;
> -       u64 command;
>         int ret;
>
> -       command =3D UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con=
->num);
> -       ret =3D ucsi_send_command(con->ucsi, command, &con->status, sizeo=
f(con->status));
> -       if (ret < 0) {
> +       ret =3D ucsi_get_connector_status(con, false);
> +       if (ret) {
>                 dev_err(con->ucsi->dev, "GET_CONNECTOR_STATUS failed (%d)=
\n", ret);
>                 return ret;
>         }
> @@ -1192,16 +1200,12 @@ static void ucsi_handle_connector_change(struct w=
ork_struct *work)
>                                                   work);
>         struct ucsi *ucsi =3D con->ucsi;
>         enum typec_role role;
> -       u64 command;
>         int ret;
>
>         mutex_lock(&con->lock);
>
> -       command =3D UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con=
->num);
> -
> -       ret =3D ucsi_send_command_common(ucsi, command, &con->status,
> -                                      sizeof(con->status), true);
> -       if (ret < 0) {
> +       ret =3D ucsi_get_connector_status(con, true);
> +       if (ret) {
>                 dev_err(ucsi->dev, "%s: GET_CONNECTOR_STATUS failed (%d)\=
n",
>                         __func__, ret);
>                 clear_bit(EVENT_PENDING, &con->ucsi->flags);
> @@ -1611,14 +1615,11 @@ static int ucsi_register_port(struct ucsi *ucsi, =
struct ucsi_connector *con)
>         }
>
>         /* Get the status */
> -       command =3D UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con=
->num);
> -       ret =3D ucsi_send_command(ucsi, command, &con->status, sizeof(con=
->status));
> -       if (ret < 0) {
> +       ret =3D ucsi_get_connector_status(con, false);
> +       if (ret) {
>                 dev_err(ucsi->dev, "con%d: failed to get status\n", con->=
num);
> -               ret =3D 0;
>                 goto out;
>         }
> -       ret =3D 0; /* ucsi_send_command() returns length on success */
>
>         if (ucsi->ops->connector_status)
>                 ucsi->ops->connector_status(con);
> --
> 2.45.2
>

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

