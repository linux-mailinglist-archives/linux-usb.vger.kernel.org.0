Return-Path: <linux-usb+bounces-7404-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C41C86E9B6
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 20:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F536286F8A
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 19:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF04A3C08D;
	Fri,  1 Mar 2024 19:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wrh1aiWz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9577B3B78B
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 19:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709321872; cv=none; b=AQpEZWFE5D3GpVYvXDp3OqBwnYSNEUXXNXbBaHYdD7o+XYk6D/ioxkSNboUlThV5AD4R5/XD5poPdse/vojErnbpwMXMl96Oc/5wIE3V8QGY09GQuvQFnMwjITNBUz76SiKHzKy1+5M7QDPc5PPXTnJ3Udy8bx+TWkw3SvRSaxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709321872; c=relaxed/simple;
	bh=jKrG6QS9qQWHcoFkHR26CKL4wC+kkLGosTa//iiHXm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rkf1oDtKpNsA2+sGAMTWfsVV/0ZlshBk206Kom+V50/ZEBQxMMmJpaDEPOmUsZ8MfAO5olgOzYX+aE0P2hGDLyrsONhfvvuXlPuNXxhDDc7Wae2jQYruA5ln4XnbwgNvLPd7fA7yXpiyWNpVoAQ0UYDTkqnIcpqPwQllI3VB9XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wrh1aiWz; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-68f41af71ebso18305376d6.1
        for <linux-usb@vger.kernel.org>; Fri, 01 Mar 2024 11:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709321868; x=1709926668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGkeNRdG2FczCV6rPVYPMJDiNjYVnLlJt0xSA7ew594=;
        b=Wrh1aiWzy0flhM6unY8+oMzHUQ04G9/VlLWcsMviZ3NU5wt6562z/v/4A75Yn7VROV
         TVfp884V/7ulafkLTry+NCweIHozpM+9iwS6yT5gHj5A4/9TjfIWx/w89i+bxY2rXr7y
         ijEydEEXSHZ5Jzy2+qw+Akf2Roelz3R2Gu4Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709321868; x=1709926668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGkeNRdG2FczCV6rPVYPMJDiNjYVnLlJt0xSA7ew594=;
        b=E+2xTa7xQYydDLBOrpe5LCKZ8U2+mTH5ll3b3CzbcL2sPFRWEW43CBbvH+F9r/w2B+
         TUVvs1aqUoyBlBXUFJJ9y3137VlHvi43BaboBsc68dS2TgGbaVf683ljpzhLJ0FrGP0I
         W8JeXziotwNOlRgtOSeW1tqZeTuTpN9L/BcyD50D5j46GeeOB8nqb/uV0DiJ2PMWX+n+
         wGuyvn/fpktjjdv6pzCVuH5GgmVc+vfoO9sAkIsBIs03vTs35xT7r8FAwVASR+qE8VMg
         a9TcNnb6lQjKd4WxLEZcNHIslcmO088ubFd5Ay11IDwwVd+NvzLuWWrpMywFuetypH+7
         TAmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRLmhm6OTNEPf+52vtviqsImTP7qmeJ4HU+vVusbwy72UIOt2VkljGLOzd7XRmuO1WJAjdprScr4XSK27Z2YLQa2DMVJPug42B
X-Gm-Message-State: AOJu0YzyNXGZvtjZkdWmJInDJN/+f07xQhLuPfEkDAs1cjJSqZWIkILx
	qEnRWsUB3u1FNB9B8uR5HYjmbD0qM/qjmHxoYM4sGud47p17/mW9G70baV/66jEqkOL70/GNL/M
	00qQkooTvVFtsRKTM53onQSIY+/0UNmaACPoM
X-Google-Smtp-Source: AGHT+IHi1hjTt1ARy97BXMT6VU6Qb4Dz7SjLHKe0bYzv6iRPppZu6eRnfb1sb9m2IyWlA5swq9IJNVUtpDsf8IdzdwM=
X-Received: by 2002:a0c:fa8e:0:b0:68f:4645:8cad with SMTP id
 o14-20020a0cfa8e000000b0068f46458cadmr2723328qvn.57.1709321868606; Fri, 01
 Mar 2024 11:37:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229232625.3944115-1-jthies@google.com> <20240229232625.3944115-4-jthies@google.com>
In-Reply-To: <20240229232625.3944115-4-jthies@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Fri, 1 Mar 2024 11:37:37 -0800
Message-ID: <CACeCKaeSdAwS5NJd0UtwZKvfvWMJmrJAg73e8SB+ToM5exOVUg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] usb: typec: ucsi: Register SOP/SOP' Discover
 Identity Responses
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	bleung@google.com, abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 3:28=E2=80=AFPM Jameson Thies <jthies@google.com> w=
rote:
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index 7c84687b5d1a3..4088422b33c74 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -646,6 +646,121 @@ static int ucsi_get_src_pdos(struct ucsi_connector =
*con)
>         return ret;
>  }
>
> +static int ucsi_read_identity(struct ucsi_connector *con, u8 recipient,
> +                             struct usb_pd_identity *id)
> +{
> +       struct ucsi *ucsi =3D con->ucsi;
> +       struct ucsi_pd_message_disc_id resp =3D {};
> +       u64 command;
> +       int ret;
> +
> +       if (ucsi->version < UCSI_VERSION_2_0) {
> +               /*
> +                * Before UCSI v2.0, MESSAGE_IN is 16 bytes which cannot =
fit
> +                * the 28 byte identity response including the VDM header=
.
> +                * First request the VDM header, ID Header VDO, Cert Stat=
 VDO
> +                * and Product VDO.
> +                */
> +               command =3D UCSI_COMMAND(UCSI_GET_PD_MESSAGE) |
> +                   UCSI_CONNECTOR_NUMBER(con->num);
> +               command |=3D UCSI_GET_PD_MESSAGE_RECIPIENT(recipient);
> +               command |=3D UCSI_GET_PD_MESSAGE_OFFSET(0);
> +               command |=3D UCSI_GET_PD_MESSAGE_BYTES(0x10);
> +               command |=3D UCSI_GET_PD_MESSAGE_TYPE(
> +                   UCSI_GET_PD_MESSAGE_TYPE_IDENTITY);
> +
> +               ret =3D ucsi_send_command(ucsi, command, &resp, 0x10);
> +               if (ret < 0) {
> +                       dev_err(ucsi->dev,
> +                               "UCSI_GET_PD_MESSAGE v1.2 failed first re=
quest (%d)\n",
> +                               ret);
> +                       return ret;
> +               }
> +
> +               /* Then request Product Type VDO1 through Product Type VD=
O3. */
> +               command =3D UCSI_COMMAND(UCSI_GET_PD_MESSAGE) |
> +                   UCSI_CONNECTOR_NUMBER(con->num);
> +               command |=3D UCSI_GET_PD_MESSAGE_RECIPIENT(recipient);
> +               command |=3D UCSI_GET_PD_MESSAGE_OFFSET(0x10);
> +               command |=3D UCSI_GET_PD_MESSAGE_BYTES(0xc);
> +               command |=3D UCSI_GET_PD_MESSAGE_TYPE(
> +                   UCSI_GET_PD_MESSAGE_TYPE_IDENTITY);
> +
> +               ret =3D ucsi_send_command(ucsi, command, &resp.vdo[0], 0x=
c);
> +               if (ret < 0) {
> +                       dev_err(ucsi->dev,
> +                               "UCSI_GET_PD_MESSAGE v1.2 failed second r=
equest (%d)\n",
> +                               ret);
> +                       return ret;
> +               }
> +       } else {
> +               /*
> +                * In UCSI v2.0 and after, MESSAGE_IN is large enough to =
request
> +                * the large enough to request the full Discover Identity
> +                * response at once.
> +                */
> +               command =3D UCSI_COMMAND(UCSI_GET_PD_MESSAGE) |
> +                   UCSI_CONNECTOR_NUMBER(con->num);
> +               command |=3D UCSI_GET_PD_MESSAGE_RECIPIENT(recipient);
> +               /* VDM Header + 6 VDOs (0x1c bytes) without an offset */
> +               command |=3D UCSI_GET_PD_MESSAGE_OFFSET(0);
> +               command |=3D UCSI_GET_PD_MESSAGE_BYTES(0x1c);
> +               command |=3D UCSI_GET_PD_MESSAGE_TYPE(
> +                   UCSI_GET_PD_MESSAGE_TYPE_IDENTITY);
> +
> +               ret =3D ucsi_send_command(ucsi, command, &resp, sizeof(re=
sp));
> +               if (ret < 0) {
> +                       dev_err(ucsi->dev, "UCSI_GET_PD_MESSAGE failed (%=
d)\n",
> +                               ret);
> +                       return ret;
> +               }
> +       }
> +
> +       id->id_header =3D resp.id_header;
> +       id->cert_stat =3D resp.cert_stat;
> +       id->product =3D resp.product;
> +       id->vdo[0] =3D resp.vdo[0];
> +       id->vdo[1] =3D resp.vdo[1];
> +       id->vdo[2] =3D resp.vdo[2];
> +       return 0;
> +}

There is some repetition here, both with the "if" block and the
UCSI command itself. You can factor out the command setup code into a separ=
ate
function (it can take offset and size as arguments). Then, factor out
common parts in the "if" block. For example:

int ucsi_pd_message_get_identity(struct *ucsi, u8 offset, u8 size, u8 recip=
ient,
                                                              void *data) {
        u64 command =3D UCSI_COMMAND(UCSI_GET_PD_MESSAGE) |
UCSI_CONNECTOR_NUMBER(ucsi->con->num) |
                      UCSI_GET_PD_MESSAGE_RECIPIENT(recipient) |
                      UCSI_GET_PD_MESSAGE_OFFSET(offset) |
UCSI_GET_PD_MESSAGE_BYTES(size) |

UCSI_GET_PD_MESSAGE_TYPE(UCSI_GET_PD_MESSAGE_TYPE_IDENTITY);

        return ucsi_send_command(ucsi, command, data, size);
}

Then in the ucsi_read_identity() :
        u8 offset =3D 0;
        u8 size;

        /*
         * In UCSI v2.0 and after, MESSAGE_IN is large enough to request
         * the large enough to request the full Discover Identity
         * response at once.
         */
        if (ucsi->version >=3D UCSI_VERSION_2_0) {
                size =3D 0x1c;
        else
                size =3D 0x10;

        ret =3D ucsi_pd_message_get_identity(ucsi, offset, size, &resp);
        if (ret < 0) {
                /* Handle error */
        }

        /* Request Product Type VDO1 through Product Type VDO3. */
        if (ucsi->version < UCSI_VERSION_2_0) {
                offset =3D 0x10;
                size =3D 0xC;
                ret =3D ucsi_pd_message_get_identity(ucsi, offset, size,
&resp.vdo[0]);
                if (ret < 0) {
                /* Handle error */
                }
        }

BR,

-Prashant

