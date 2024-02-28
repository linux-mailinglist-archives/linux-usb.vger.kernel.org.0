Return-Path: <linux-usb+bounces-7160-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4744686A43F
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 01:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6560286579
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 00:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431D21852;
	Wed, 28 Feb 2024 00:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pDv1DsS8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664B9111E
	for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 00:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709078826; cv=none; b=SN3gsi29lht9hJ8XcSS3Am7SravzFB7MS+W5mPoMVE3kMAr8cLpqV8vLaXrzwy7eAWiKPpvS21q8roPiDx3NW8dytl63tMxyvbC2C6HKEqrZDPfI6dyKdWRvqxZLjiT/MqM0itb4/s2GJ7Bo0wyL5QltojZ3I+oelmaS34/hjZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709078826; c=relaxed/simple;
	bh=y3oeCWuiY7SKVrYuIRHS+ZMSQe7tGBXllwPklBBcm7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwjlfOKF1yHLP4OiDx7tDdSA3YzVyWNzC8Ay0INT+tERvU9Dgk82EYVlukXY0IsUqPZJCDthJLWdcVLGnEZJv3hascX7KDpdPsgcQVZQzJUSBlwCRc6pMKtZKT29Xb32U+OGifIfOphk0Uw+ksa3QNO/zJwNKnIflnd+kOGLBvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pDv1DsS8; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e09143c7bdso2998502b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 16:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709078824; x=1709683624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwJ7r+hhbElRRt/Ehuz+IMcLRUC1TV153CrNCo3tLcw=;
        b=pDv1DsS8vCxLehRIvwqgPu4hvL6Yjte+QKydppB2WKMvf/gPBDz8Qwu+A6ZS09Avxs
         LS6+t2dblHHwsn0SfeC8J2aAGz1mM9NN48EZ1xJUhO+FGBU7MNYYY3eLdLexc7ZgIrh/
         RrkgyOhAga+03tROj9LrrWxwrGuq+kW0Wf2XpZttI5b7BkSyMfUAag5UhLPaJ4AtqZvK
         5aLn0r2JVaecs4RSG0xa2soI+KI7f8Nq2wAegUBBCYUVWI7XtsCA7svmz/jWkFOsI+FF
         Rsv4ZWFFmSyGLPX+mquh+49hxINyq3F4aor4gCKUzz1BJQZBCrB80HpOJJ3EltzvXF5A
         7veA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709078824; x=1709683624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwJ7r+hhbElRRt/Ehuz+IMcLRUC1TV153CrNCo3tLcw=;
        b=Qz9nEEXKhld++Kyewxlnx6LLbEQvvfXNn1+hNrDrxNzAPG10V/QUcDFlcpc9CWvNPy
         px4LzsmPnHMiNmhsNj4UmuUAeVfvs7sV7DBYsGIVtumnPgQoeLBeVoJgRWL/n1k/kzOH
         SxgZLJ/zvjg3UD8/JItLewaNaaDJozx8TCNTaokrJsvepAcQ3Mugo2bU3cXuKQh9hQ5d
         yIUbkg0Boq5PX7RdYhUdcF94pCnTC28Brtch/HCbNKpt2VIuDOH27KUVdV4OFGaR3eCA
         4PRy6pImCQMvBC9Oa8oROBqktwQmYmbl2ShEdSwCmi4VdvQwKnCCJjQq+tCf4HaOv1OM
         HWdA==
X-Forwarded-Encrypted: i=1; AJvYcCW4sosQGpPtZsBUPMo3ej6ppGbRly3lx7Qt1iMN2Elh18SIhGPVaEClYlY4+32uWgWq8Pt8drdelrpowwjVrMxifqW80zKcLP44
X-Gm-Message-State: AOJu0YzEk56llNt+QJwebE5QGMkdwoUvVuxAVU6lYnmyxty2ob+JswuN
	N3tfYfyjJ87+ctt/ex0a5Wk8tR53MY+ka5igZzrbo6IrzNsIF4Nly4rdYYnhuMP5SgygmW4JZKH
	WT1Khvz48+uF+/nGDqFLYoM01PePYpIvkqP71
X-Google-Smtp-Source: AGHT+IF6Y45ROTMne27xC4ORln067WR8PTJiN33sd62jEyUVDaw2u554x+rc6uhLR80s1PRcLn+147VFTDkzg/LLA/o=
X-Received: by 2002:a05:6a20:ac44:b0:1a1:15ce:1f64 with SMTP id
 dh4-20020a056a20ac4400b001a115ce1f64mr1594408pzb.29.1709078824383; Tue, 27
 Feb 2024 16:07:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227235832.744908-1-badhri@google.com>
In-Reply-To: <20240227235832.744908-1-badhri@google.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Tue, 27 Feb 2024 16:06:27 -0800
Message-ID: <CAPTae5JAKe_16SkyTkSsbZ15Q6XtGJXGRomZJN4gCMEO+fRYBw@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: tpcm: Fix PORT_RESET behavior for self
 powered devices
To: gregkh@linuxfoundation.org, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com
Cc: kyletso@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdbabiera@google.com, amitsd@google.com, 
	stable@vger.kernel.org, frank.wang@rock-chips.com, broonie@kernel.org, 
	stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI all,

Please ignore this patch. Adding the right tag "Cc:
stable@vger.kernel.org"  for CCing stable.

Thanks,
Badhri

On Tue, Feb 27, 2024 at 3:58=E2=80=AFPM Badhri Jagan Sridharan
<badhri@google.com> wrote:
>
> While commit 69f89168b310 ("usb: typec: tpcm: Fix issues with power being
> removed during reset") fixes the boot issues for bus powered devices such
> as LibreTech Renegade Elite/Firefly, it trades off the CC pins NOT being
> Hi-Zed during errory recovery (i.e PORT_RESET) for devices which are NOT
> bus powered(a.k.a self powered). This change Hi-Zs the CC pins only for
> self powered devices, thus preventing brown out for bus powered devices
>
> Adhering to spec is gaining more importance due to the Common charger
> initiative enforced by the European Union.
>
> Quoting from the spec:
>     4.5.2.2.2.1 ErrorRecovery State Requirements
>     The port shall not drive VBUS or VCONN, and shall present a
>     high-impedance to ground (above zOPEN) on its CC1 and CC2 pins.
>
> Hi-Zing the CC pins is the inteded behavior for PORT_RESET.
> CC pins are set to default state after tErrorRecovery in
> PORT_RESET_WAIT_OFF.
>
>     4.5.2.2.2.2 Exiting From ErrorRecovery State
>     A Sink shall transition to Unattached.SNK after tErrorRecovery.
>     A Source shall transition to Unattached.SRC after tErrorRecovery.
>
> Fixes: 69f89168b310 ("usb: typec: tpcm: Fix issues with power being remov=
ed during reset")
> Cc: stable@kernel.org
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index c9a78f55ca48..bbe1381232eb 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -5593,8 +5593,11 @@ static void run_state_machine(struct tcpm_port *po=
rt)
>                 break;
>         case PORT_RESET:
>                 tcpm_reset_port(port);
> -               tcpm_set_cc(port, tcpm_default_state(port) =3D=3D SNK_UNA=
TTACHED ?
> -                           TYPEC_CC_RD : tcpm_rp_cc(port));
> +               if (port->self_powered)
> +                       tcpm_set_cc(port, TYPEC_CC_OPEN);
> +               else
> +                       tcpm_set_cc(port, tcpm_default_state(port) =3D=3D=
 SNK_UNATTACHED ?
> +                                   TYPEC_CC_RD : tcpm_rp_cc(port));
>                 tcpm_set_state(port, PORT_RESET_WAIT_OFF,
>                                PD_T_ERROR_RECOVERY);
>                 break;
>
> base-commit: a560a5672826fc1e057068bda93b3d4c98d037a2
> --
> 2.44.0.rc1.240.g4c46232300-goog
>

