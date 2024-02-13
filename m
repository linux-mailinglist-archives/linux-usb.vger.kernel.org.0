Return-Path: <linux-usb+bounces-6319-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A31DF852D84
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 11:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C54D51C20D03
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 10:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F99224FD;
	Tue, 13 Feb 2024 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3zY1m6ZK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD34D2260B
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 10:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819000; cv=none; b=DzfKmdZi7lfg20NDkt+j0d6e2bAV4coOINhGJj12BYNvcYRo96AVdLLFjoqoP2O9/ydysU5oXL9uJbCnRFrvQi5VkOX9S4NbWUmpQWmZSKO2IG4gqNbh2RuRnql6xapHuP45H8FA54d38O3Rkr5hXQT2FkA2Q0tuB54lsKCchzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819000; c=relaxed/simple;
	bh=iV0LNlu09L+usvqCOo1VRBf+A61/7Q4YqPsN6h9xJrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0v9dJgVmZApReYzvj5WYej/IM4UezYTSFH0qcdVRb01nh0tQeXRDp/Ox5P5i1Xw90jYPQsQqA6A/UmGvcGcOVU+Zq0UmvDec0rkjPgkrTUHz3mrEdTHL3bAR484VN35HjDIFnC4DT7Qnr+h3vxyqBQHvhYgTb/ttru3xhKisMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3zY1m6ZK; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e09143c7bdso2105596b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 02:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707818998; x=1708423798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gCHmuatdsgry8k30N4puCgoRyQDLlrHu4bpm0vi5/U=;
        b=3zY1m6ZK3msONF5aOHtyxp5yhMulnBt5mBsbsG/eVhufWc/WRZAxc9jIFcu7kDqoyh
         F/HYC+kgqYFtAtCP4FNkvZYjkhPCVaHTlbAayY3Uh5BubB65usdfJ8tua1S3wz+rQj+D
         f5cCVhvjCtc7zpBQDS4s/ossAtWhfONdxnfM02VSxiUgVYSMvimR/OrtEmrZESDiWOI6
         IIHe1PJ6NUaiE7rNlhTTXF1FjD+PrfFGVcuWu3/3XQIXVXuQufgXkYHdw1AvDmnNhbly
         UscxeZ8ol6BYcCkEwYaerisBAZH7Pf3kPvqsgZbgelSTWfZU3TmSpGN2m6b9jmZIdngi
         PUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707818998; x=1708423798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gCHmuatdsgry8k30N4puCgoRyQDLlrHu4bpm0vi5/U=;
        b=qFgKDJK++Q9RnW66tkwomWqKl3WcI+D0VdWHi2jHfEgwap6rkxakCN33x88KLDHcLv
         GASj8yqWHwXqejGUtHTUz4xQv8GMHhZR9gxcrjE+VmAdmDGf0cqukxPQjzyPSFRtVgha
         d9oZ/1XQhut2t2aRN1mwQ0qkB6pGc/sCPxJMD5wqAAlYXAzonr/+CpWMif565XYdD1Im
         hqFrTttd85I8tHX0XZQSfL2ppIBITaXkaHRVDHlSmsmShJu6ElSmE+oapa3gLF1G7g+7
         +eEk+sIh3oKPK9Y8unAkdAcHQ4nX3kZGNiZdpvu+Sy/n6nBjg6Mh6dRcjzCeCM6Dtltd
         3JBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5zQS57LGszaLWcynq7GmUyBJRtY93shoPlaX4rV9uwEJu5OG2bf7+PP4GIGwhJg4rMJ5X1z3hs19d6oSiNU7cw7rRBe2re7NX
X-Gm-Message-State: AOJu0YxWUNLQ8lTbh9mm11ez9Pb6yiUA3aKCu7/qDydVKc9jrQYRb2Ky
	cch4OuqSNPhUtTjxlmBuI6sW9rb+yEHmK1wheqk40zmZRjD3xCIG7mtOqHolFf2cYjr19Rjq69o
	zSYxQ64zmUARKrlEmcZvpfStzuSSnsUPQnsMQ
X-Google-Smtp-Source: AGHT+IFbcgWLigGId4RU9uYlUZvt9W4RnnU69Uv78HX3R5mO1+ACmJmHNus7LLTVSoHLMIVgHNTJiSKijjkUYLw42n8=
X-Received: by 2002:a05:6a20:94cb:b0:19e:3a94:6272 with SMTP id
 ht11-20020a056a2094cb00b0019e3a946272mr8092548pzb.44.1707818998063; Tue, 13
 Feb 2024 02:09:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212-usb-fix-renegade-v1-1-22c43c88d635@kernel.org>
In-Reply-To: <20240212-usb-fix-renegade-v1-1-22c43c88d635@kernel.org>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Tue, 13 Feb 2024 02:09:16 -0800
Message-ID: <CAPTae5LOresaK3Epd4R_ifpx2kw21tubQDENg4OMrhJWsar-oA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tpcm: Fix issues with power being removed
 during reset
To: Mark Brown <broonie@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?G=C3=A1bor_Stefanik?= <netrolller.3d@gmail.com>, 
	rdbabiera@google.com, amitsd@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

While HI-Zing CC pins disrupts power for batteryless devices, not
Hi-Zing CC pins would prevent clean error recovery for self powered
devices which is why "usb: typec: tcpm: fix cc role at port reset" was reve=
rted.
Please note that the breakage in error recovery behavior is a
regression as well.
Hi-Zing CC pins would make the port partner recognize it as disconnect
and will result in bringup the connection back cleanly.

How about leveraging "self-powered" device tree property and Hi-Zing
CC pins only when using "self-powered" ?
This should help devices which don't have batteries while NOT regressing
the error recovery behavior for the self powered devices.

--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4897,7 +4897,11 @@ static void run_state_machine(struct tcpm_port *port=
)
                break;
        case PORT_RESET:
                tcpm_reset_port(port);
-               tcpm_set_cc(port, TYPEC_CC_OPEN);
+               if (port->self_powered)
+                       tcpm_set_cc(port, TYPEC_CC_OPEN);
+               else
+                       tcpm_set_cc(port, tcpm_default_state(port) =3D=3D
SNK_UNATTACHED ?
+                               TYPEC_CC_RD : tcpm_rp_cc(port));
                tcpm_set_state(port, PORT_RESET_WAIT_OFF,
                               PD_T_ERROR_RECOVERY);

Thanks,
Badhri


On Mon, Feb 12, 2024 at 10:42=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> Since the merge of b717dfbf73e8 ("Revert "usb: typec: tcpm: fix
> cc role at port reset"") into mainline the LibreTech Renegade
> Elite/Firefly has died during boot, the main symptom observed in testing
> is a sudden stop in console output.  G=C3=A1bor Stefanik identified in re=
view
> that the patch would cause power to be removed from devices without
> batteries (like this board), observing that while the patch is correct
> according to the spec this appears to be an oversight in the spec.
>
> Given that the change makes previously working systems unusable let's
> revert it, there was some discussion of identifying systems that have
> alternative power and implementing the standards conforming behaviour in
> only that case.
>
> Fixes: b717dfbf73e8 ("Revert "usb: typec: tcpm: fix cc role at port reset=
"")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index f7d7daa60c8d..a0978ed1a257 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4876,7 +4876,8 @@ static void run_state_machine(struct tcpm_port *por=
t)
>                 break;
>         case PORT_RESET:
>                 tcpm_reset_port(port);
> -               tcpm_set_cc(port, TYPEC_CC_OPEN);
> +               tcpm_set_cc(port, tcpm_default_state(port) =3D=3D SNK_UNA=
TTACHED ?
> +                           TYPEC_CC_RD : tcpm_rp_cc(port));
>                 tcpm_set_state(port, PORT_RESET_WAIT_OFF,
>                                PD_T_ERROR_RECOVERY);
>                 break;
>
> ---
> base-commit: 841c35169323cd833294798e58b9bf63fa4fa1de
> change-id: 20240212-usb-fix-renegade-837d35cfc0c2
>
> Best regards,
> --
> Mark Brown <broonie@kernel.org>
>

