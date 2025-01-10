Return-Path: <linux-usb+bounces-19199-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B5CA095EE
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 16:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43A163A54CF
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 15:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B941E211297;
	Fri, 10 Jan 2025 15:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ru+35QVc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29902066E5
	for <linux-usb@vger.kernel.org>; Fri, 10 Jan 2025 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523541; cv=none; b=J0I/gTI7Isp0dsb5SeKPLslP2VIOIDWlS55lUxjModjb2VGQKzy3BHy9xmFymcM7IHSpeFqXAcPdcxd8lQWMUwkXrB86vc+L5O5bZ79zBYr40iHxp91pbtvxBR++SjRdHqwI1o7ieDs7uYZoKwEQy/a8J1j8sd+FmEAEtt9ZCSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523541; c=relaxed/simple;
	bh=dguGAvjO1k2ksf6Wi1QR1v12mrQeonkG+zVOUsOlMT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kGtOQs5UuwQmJ/zBTK/CgvoiionYjGhu18vespM+OjGAGwWhecwQI+XeKGbEiwd3h1NMGQivvggruMBXxzYwKROo5DI9bdzNUxlqa+eaPA1nVPTrepSao/dcQyQGQuSAIRMB8DPyj1gWiSGRYP6wsz7js9cxZdNoO+xyalfK5Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ru+35QVc; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3eb87127854so588148b6e.2
        for <linux-usb@vger.kernel.org>; Fri, 10 Jan 2025 07:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736523539; x=1737128339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/EZ0rj+IZqLFNk3BBR2b6wuYkByDNp1Zv35hpXQEpI=;
        b=ru+35QVcgeHn685ERYeUNs5oq89fzViC2/ZAAFF2ZzxTEigyzMS6n3l/ZegN3FB86p
         QY9ZnnnBtmJcA9iQ9Lz7NOLJORfCdx5hoKz0/wEXOejm+g6792Zq3wCbxRwpgAcf3hvs
         +fqJTdDNtqwIMFLANGYy5X//bH6tZwxK9QER02V4DNTdQgr82B/8HIaRlcDUNNQ6Zxpx
         RpaI0FayluBpOvGE//gPhEWLoIbyB+7nxe8CKKcZ7iCTfLs785SdkiRRRSFtJ3tF+3Ll
         FTWhH/UDDOE8Bw6OIsSeAecai3X6frHuw1+d2xCXQYJ1QCemkZQlPRt2SX9NZo4IIHXK
         r+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736523539; x=1737128339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/EZ0rj+IZqLFNk3BBR2b6wuYkByDNp1Zv35hpXQEpI=;
        b=rM3o7BmU1C4zx0vhueHepun/AeXrHFw0oUG76mcP3Nl+TcyVs6wvsktgRUQaPE2gP+
         1oSDMWbDy9Kvyb1t/WlcxnhYjuPxzqpsdiy6C2g6t+z/EamEZBCY0I+iloST2kQknXvt
         xnlAO7x/6w/ZFWMm2wt22nNpPYL2IS2wEmN37SpDPsXMP601XNPzZe7oUPmIqs+63QE2
         9OSefc4GXCRNkQbnyKuORCXN8hbePrAokLPJOhZyxeUqa3GCpaKBjyuQTzVFOkqRUpor
         alT/S3F7e7zjnYZPIipQfzCDDuoShNCSYEj8/XHhjE/SI04AsR4r73Q+Att28nhSY+IS
         DvYA==
X-Forwarded-Encrypted: i=1; AJvYcCVibWqVvXSrciDqFTUjsmTBkW13lW5V8IG9WwJNLqzh7W6jQcL4mz2zv/vJ/LhpTFVgTDLsLXIbuVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpSuXL3rMeUFqx3ezAI3VrTE+VhFPKEoeXvCetR9tY+UhWXPLt
	2Qqb7y7+Zy2E2C6dqvqELzioq5BvLGRuIjrSDF2lunYUG2ia3CpzjAdcKWhcCFSjtRbjr1y4dva
	p+l4YCrAgECqbnYdb+f6JIfKA3fKCYdYPwdcB
X-Gm-Gg: ASbGncv75jK3U0WIFLw9Y2DsSgyXzsniyBMxW1dhjh5lNynEUbK44PPNSr2Ohqnjtsy
	XwuxswRHj2b4xHv7jQhBI4d1v9+pFNI/ItoDqxQ72BatFvo3YKqy3qd0Wy/0I3kjXPh50cA==
X-Google-Smtp-Source: AGHT+IFW6NEU0HhZ7+KVsm6xKbbPBrtAz8729VXGQZ6HRAHS4LQggtFiUsIOin45YkuQ59WhaZMjFdW3q/MlLIpSXVA=
X-Received: by 2002:a05:6871:d307:b0:29e:75ff:4d0c with SMTP id
 586e51a60fabf-2aa066493f2mr6175890fac.4.1736523538623; Fri, 10 Jan 2025
 07:38:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250105135245.7493-1-joswang1221@gmail.com> <Z3z92o0XlaqXLwrb@kuha.fi.intel.com>
In-Reply-To: <Z3z92o0XlaqXLwrb@kuha.fi.intel.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Fri, 10 Jan 2025 07:38:22 -0800
X-Gm-Features: AbW1kvYgs1JdPShDrkbOkv9xVK82I3DMUSiJmqqz0XOcf5NodvGpPJans-vFzOs
Message-ID: <CAPTae5+exinnRhvU1DePuEwq6HNUPBvb1WjPH1i7PtUHq_VGOg@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: typec: tcpm: set SRC_SEND_CAPABILITIES timeout
 to PD_T_SENDER_RESPONSE
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: joswang <joswang1221@gmail.com>, dmitry.baryshkov@linaro.org, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jos Wang <joswang@lenovo.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 2:11=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> +Badhri
>
> On Sun, Jan 05, 2025 at 09:52:45PM +0800, joswang wrote:
> > From: Jos Wang <joswang@lenovo.com>
> >
> > As PD2.0 spec ("8.3.3.2.3 PE_SRC_Send_Capabilities state"), after the
> > Source receives the GoodCRC Message from the Sink in response to the
> > Source_Capabilities message, it should start the SenderResponseTimer,
> > after the timer times out, the state machine transitions to the
> > HARD_RESET state.
> >
> > Fixes: f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jos Wang <joswang@lenovo.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index 460dbde9fe22..57fae1118ac9 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -4821,7 +4821,7 @@ static void run_state_machine(struct tcpm_port *p=
ort)
> >                       port->caps_count =3D 0;
> >                       port->pd_capable =3D true;
> >                       tcpm_set_state_cond(port, SRC_SEND_CAPABILITIES_T=
IMEOUT,
> > -                                         PD_T_SEND_SOURCE_CAP);
> > +                                         PD_T_SENDER_RESPONSE);

This aligns with what the spec says as Jos Wang has already mentioned.
However, itdoes reduce the time within which the sink has to reply back wit=
h the
request message. So if there are non-compliant sinks, which we don't
know of yet, we would know now and we can later see how we can handle
the interoperability.

Regards,
Badhri



> >               }
> >               break;
> >       case SRC_SEND_CAPABILITIES_TIMEOUT:
>
> This looks okay to me, but let's get comments from Badhri, just in
> case.
>
> thanks,
>
> --
> heikki

