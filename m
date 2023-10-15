Return-Path: <linux-usb+bounces-1626-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD67B7C97D0
	for <lists+linux-usb@lfdr.de>; Sun, 15 Oct 2023 06:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AF22281A4E
	for <lists+linux-usb@lfdr.de>; Sun, 15 Oct 2023 04:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3279C1C08;
	Sun, 15 Oct 2023 04:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y1S+MeNi"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E696C1861
	for <linux-usb@vger.kernel.org>; Sun, 15 Oct 2023 04:00:29 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547D4DD
	for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 21:00:26 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c9e06f058bso21577335ad.0
        for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 21:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697342426; x=1697947226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzO4BqlPO7qDmEdeQReZNA+4qs9vum2qt+JfzQGEZSI=;
        b=Y1S+MeNiZEUvHZ8Q0ktJrTII/ZpYTt/xVL3ztOICGYij7iu/O0nf31PNwg/AGzwJ1w
         QZBsBlxJL8X71xmTuzypzCjahbf6SspkAWog9FBNzm8QFbpwID9jTcp8FqKhOa/QF5dP
         cnRIPNjWwJlalYp0PbLcN565BIT3nY9EoxNUnGs7INKNygpj8SuGr+39cbeshL/P8kpk
         3r8OlVS8t5fKLjL5k671el3tuBxb6ki0fXP6kydK6wed0FH4saPBCCZI2Dkhuo1qI2+Q
         tE3RrFusDAC4Lc/L09cGxQZAaEFZ5Ft1irEuhRWhZn1IIpUOHSgTA03orAQIEJzQHSpS
         4ceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697342426; x=1697947226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzO4BqlPO7qDmEdeQReZNA+4qs9vum2qt+JfzQGEZSI=;
        b=e7wKxJ9lODUM7WtfcCspR1rAEE9oar4QERpKP/DhIoTtiUHdeeN3VIZjDwjsRfxcVu
         WWWXJZtKpJKF9K1sUFW4nCovDSHKZaCK/XhLPSVCKBA7ClgzoO78Lbfjd5mB6VqTqtOY
         rrerEMaqAVAmCCHlXInDQfJ0Ri0p12PNCtuMz8kkQejRtwfZmSQ9rEActLZlfLJancPA
         pLbdtw4d4Jif2i2VzmrGmd5Sb84p1qp/V3SbVnPY0Psu6Xb1+0ppWB3LyzxHyUR7L4US
         2GVXtFCEjKaYtpz966K8lqRqEvVUZOwm0cLPA2UUjFJcks6Z4YQhmOX7JsPyeLJ9PO8C
         6kaQ==
X-Gm-Message-State: AOJu0YzaitiMQCTSRjfiL/B+BswRDrCkJYwcAeOkBnunXWjmGFbCcjIS
	48wbp7QliL1i2JtvtdRs6Rg2AqTDKdvG3wUi6yzL3Q==
X-Google-Smtp-Source: AGHT+IENIyXuZvVQEb1c9JRKIDTyTcixWzrs+mdKGzh6VX0i9HeDX6JW7W6SwgDg2IJ/5YjezZPsnwa1SSHIzoeQCFw=
X-Received: by 2002:a17:903:41d0:b0:1bc:4415:3c1 with SMTP id
 u16-20020a17090341d000b001bc441503c1mr6507153ple.7.1697342425521; Sat, 14 Oct
 2023 21:00:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231014031709.1900370-1-badhri@google.com> <636e2ace-30cb-4d05-b67f-7047f6fad2a9@roeck-us.net>
In-Reply-To: <636e2ace-30cb-4d05-b67f-7047f6fad2a9@roeck-us.net>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Sat, 14 Oct 2023 20:59:48 -0700
Message-ID: <CAPTae5+omQJRcNZ5V8+3rRe6WZ0r1nG_w9Q-AMsqnKBOWkw2tg@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: tcpm: Check for sink pdp op current only
 for pd
To: Guenter Roeck <linux@roeck-us.net>
Cc: gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, 
	kyletso@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rdbabiera@google.com, amitsd@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Oct 14, 2023 at 4:59=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Sat, Oct 14, 2023 at 03:17:09AM +0000, Badhri Jagan Sridharan wrote:
> > TCPM checks for sink caps operational current even when PD is disabled.
> > This incorrectly sets tcpm_set_charge() when PD is disabled.
> > Check for sink caps only when PD is disabled.
>                                       ^^^^^^^^
>
> enabled ?

Ah yes ! Fixed in V2. Reworded the commit title as well.

Thanks,
Badhri

>
>
> >
> > [   97.572342] Start toggling
> > [   97.578949] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, di=
sconnected]
> > [   99.571648] CC1: 0 -> 0, CC2: 0 -> 4 [state TOGGLING, polarity 0, co=
nnected]
> > [   99.571658] state change TOGGLING -> SNK_ATTACH_WAIT [rev3 NONE_AMS]
> > [   99.571673] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ =
170 ms [rev3 NONE_AMS]
> > [   99.741778] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 1=
70 ms]
> > [   99.789283] CC1: 0 -> 0, CC2: 4 -> 5 [state SNK_DEBOUNCED, polarity =
0, connected]
> > [   99.789306] state change SNK_DEBOUNCED -> SNK_DEBOUNCED [rev3 NONE_A=
MS]
> > [   99.903584] VBUS on
> > [   99.903591] state change SNK_DEBOUNCED -> SNK_ATTACHED [rev3 NONE_AM=
S]
> > [   99.903600] polarity 1
> > [   99.910155] enable vbus discharge ret:0
> > [   99.910160] Requesting mux state 1, usb-role 2, orientation 2
> > [   99.946791] state change SNK_ATTACHED -> SNK_STARTUP [rev3 NONE_AMS]
> > [   99.946798] state change SNK_STARTUP -> SNK_DISCOVERY [rev3 NONE_AMS=
]
> > [   99.946800] Setting voltage/current limit 5000 mV 500 mA
> > [   99.946803] vbus=3D0 charge:=3D1
> > [  100.027139] state change SNK_DISCOVERY -> SNK_READY [rev3 NONE_AMS]
> > [  100.027145] Setting voltage/current limit 5000 mV 3000 mA
> > [  100.466830] VBUS on
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 34fde9ec08a3 ("FROMGIT: usb: typec: tcpm: not sink vbus if opera=
tional current is 0mA")
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index 6e843c511b85..994493481c24 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -4268,7 +4268,8 @@ static void run_state_machine(struct tcpm_port *p=
ort)
> >                               current_lim =3D PD_P_SNK_STDBY_MW / 5;
> >                       tcpm_set_current_limit(port, current_lim, 5000);
> >                       /* Not sink vbus if operational current is 0mA */
> > -                     tcpm_set_charge(port, !!pdo_max_current(port->snk=
_pdo[0]));
> > +                     tcpm_set_charge(port, port->pd_supported ?
> > +                                     !!pdo_max_current(port->snk_pdo[0=
]) : true);
> >
> >                       if (!port->pd_supported)
> >                               tcpm_set_state(port, SNK_READY, 0);
> >
> > base-commit: 1034cc423f1b4a7a9a56d310ca980fcd2753e11d
> > --
> > 2.42.0.655.g421f12c284-goog
> >

