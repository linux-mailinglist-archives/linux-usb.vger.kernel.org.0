Return-Path: <linux-usb+bounces-21661-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3ABA5D00D
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 20:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 465A8189F20E
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 19:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72E4264612;
	Tue, 11 Mar 2025 19:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mek/6VyV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E292627E3
	for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 19:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741722969; cv=none; b=GUsDADX1tYyr5pqPM8EBJpttovaSojJWb7WKUXTaHYTyhva46EDqbtLnO4jT88d9XA4/vRZ9IFnMMEjik3MXm2yCT5zGM5hxLQCEdg0cga6Pdx1xizdKG3G88Ifx1fnLwy3CIYETOAT/ElQgDG5UdgGeJjAagRfRmpYqUNyWFsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741722969; c=relaxed/simple;
	bh=NSP51JkzDr1wqNpJgHnxtGrvxwbE+LKdl2O1eR1bKMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VAaQxfuTwrxurWdt09tKbjn/o4HhjUK99jv3SzmcGHmjm7N73iSxOKh+YS/Y9HbXSKyQeOD584SgHkyBdL5nGEMw1h1T/8sfxSzByYjSwpDDgoKAYL/A200dz8K3+bPj9832zm3Ev14Xw+8fZ5EtCSW7xOXKRtAF2T8EMnT3HMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mek/6VyV; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e8ffa00555so37150206d6.0
        for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 12:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741722965; x=1742327765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31VOcLmm9fDn4onPCz8nw3m5WfGa6pmjNlwRDXAKVBw=;
        b=mek/6VyVqrp2q9z7kd1KonLsYD9VVrx5NZpSoUUkF6xlnq8J9yWKJ7jASkJISpL/Bg
         fJsNmS/BiQAcYbQ/E/F/DQhbOl0CxTnDEzU+nEiiOciy9A0SuQ1uREqFj5/3JyUBTUb6
         yUd8Ma7CnMgGTJYNgpVAfXWYEnOmvlKymU6DvsJlrEQecevxObt1IPxFRg6jNiMsd65P
         7g4wz5hiXFup2pqxnJbo2xzsL/+rEMbY/K6IA5+SDDTWC+wj4LjN+XJCbriNBNyPyAX8
         /x09+3Hvc5TduO1DfgIjSi0WzIwtMN7VUnZQYMVp8EZ1XnZM0PMLr99zpQzvtGNOPDEU
         ziTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741722965; x=1742327765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31VOcLmm9fDn4onPCz8nw3m5WfGa6pmjNlwRDXAKVBw=;
        b=CoN8R1DBsYCpExFPel9k8gi9O5RpEfabrzima6lJDhGEYQNcjrd6YKk3JnP1YMlblo
         A3pg2ffQkTdEYTWZrL4P1FkJv/oAP6P512PTEVnbiGTBajruBA/CiXPHVgOJ1sXDP7CU
         OIlQFpgoUqfHe/w3viAWwB28r4YvcHGhnJg9QwCNsyJgKYW+qVG2enzRUZZGzIng9gGY
         UGo8LYif18uSNBy34fsDZpB1mO9+vI/Ajda5zYlWPuF5JKZHKCB5J74iVzB9+w0eOJEV
         hVPVMpufjGO69cO9/cSBr9DgLGiFT4e/ODFZvGFewqDaOfHssZrxN8yIZeIkyaV+8z51
         HpcA==
X-Forwarded-Encrypted: i=1; AJvYcCVgkVWyTNyzyj+MyT2Xco6BhJcPiL2zrjNc6aTtQbPcOVy4DfAjfZcQ2ae7EBgYHxATqHOHtmfLCyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLysHD6ayNgL+82K1Fa7+eiQ2jxp0+btyUgnHMgmAqYlV5+JdG
	AVdmBMGVhIKnBYml/0dsKBQCgby/HpdAqrZ3TNDoMkqqQRtSejTTL/kRTxsxlbpymg0YjMaB3L+
	IThM/tqjz8A/iWfC4w1/nI4sLekNJ8O70c+8X
X-Gm-Gg: ASbGncsGlNY56Xuu9NNozxEaP6hM6zJU1iVbELuK1wMJK0Sm1qDsXv20vycuKc+2Fcz
	MDBcY+fZwqh8IGueoxuWV6b43n/PGuwnmcTje/vxupJhkkZWZJOpOSeTo3vsu7yDMb+i0lPmN08
	xGOYjFfrr2KYs2wQjjlQuTLafUEAki7EMfenaneRPpqgD/ZPweG1yiefs=
X-Google-Smtp-Source: AGHT+IH9gTxRRVZurcx3e26Hp+fZKO67d6CNS5S/S3DuF2W4E5YBfDGSPgWN7xZQJzrS2FfR4qUjQdM040JpDDFDCJE=
X-Received: by 2002:a05:6214:268b:b0:6d8:b115:76a6 with SMTP id
 6a1803df08f44-6e9004fa164mr313351926d6.0.1741722965136; Tue, 11 Mar 2025
 12:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304000458.1826450-1-royluo@google.com> <20250308010409.n55ivdubj7ylkr7j@synopsys.com>
 <CA+zupgzB2aKRn_KDcqSLctqmvnEW1923XQPDwDzfDVZxU70ORg@mail.gmail.com>
In-Reply-To: <CA+zupgzB2aKRn_KDcqSLctqmvnEW1923XQPDwDzfDVZxU70ORg@mail.gmail.com>
From: Roy Luo <royluo@google.com>
Date: Tue, 11 Mar 2025 12:55:29 -0700
X-Gm-Features: AQ5f1JpDaJKKRTioXXjj44HVtzY57c-FJzL5oQeDpxM-yGm2Us0vUxsM44D1878
Message-ID: <CA+zupgzw0Fr-PHzj0PPRQGuvxB+py0EMseiToq5iPKe=iRNtgg@mail.gmail.com>
Subject: Re: [PATCH v1] usb: dwc3: core: Avoid redundant system suspend/resume callbacks
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies, I noticed the formatting in my previous email was incorrect.
Please find the same content below, reformatted for improved readability.

On Fri, Mar 7, 2025 at 5:04=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> On Tue, Mar 04, 2025, Roy Luo wrote:
> > dwc3 device suspend/resume callbacks were being triggered during system
> > suspend and resume even if the device was already runtime-suspended.
> > This is redundant for device mode because the suspend and resume routin=
es
> > are essentially identical for system PM and runtime PM. The minor
> > difference in pinctrl state changes has been moved to the common sectio=
n
> > in this patch.
> > To prevent these unnecessary callbacks, indicate to the PM core that it
> > can safely leave the device in runtime suspend if it's already
> > runtime-suspended in device mode by returning a positive value in
> > prepare() callback.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/usb/dwc3/core.c | 27 ++++++++++++++++++++++-----
> >  1 file changed, 22 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index dfa1b5fe48dc..b83f094ff1c5 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -2398,10 +2398,12 @@ static int dwc3_suspend_common(struct dwc3 *dwc=
, pm_message_t msg)
> >               dwc3_gadget_suspend(dwc);
> >               synchronize_irq(dwc->irq_gadget);
> >               dwc3_core_exit(dwc);
> > +             pinctrl_pm_select_sleep_state(dwc->dev);
> >               break;
> >       case DWC3_GCTL_PRTCAP_HOST:
> >               if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
> >                       dwc3_core_exit(dwc);
> > +                     pinctrl_pm_select_sleep_state(dwc->dev);
> >                       break;
> >               }
> >
> > @@ -2436,6 +2438,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, =
pm_message_t msg)
> >
> >               dwc3_otg_exit(dwc);
> >               dwc3_core_exit(dwc);
> > +             pinctrl_pm_select_sleep_state(dwc->dev);
> >               break;
> >       default:
> >               /* do nothing */
> > @@ -2453,6 +2456,7 @@ static int dwc3_resume_common(struct dwc3 *dwc, p=
m_message_t msg)
> >
> >       switch (dwc->current_dr_role) {
> >       case DWC3_GCTL_PRTCAP_DEVICE:
> > +             pinctrl_pm_select_default_state(dwc->dev);
> >               ret =3D dwc3_core_init_for_resume(dwc);
> >               if (ret)
> >                       return ret;
> > @@ -2462,6 +2466,7 @@ static int dwc3_resume_common(struct dwc3 *dwc, p=
m_message_t msg)
> >               break;
> >       case DWC3_GCTL_PRTCAP_HOST:
> >               if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
> > +                     pinctrl_pm_select_default_state(dwc->dev);
> >                       ret =3D dwc3_core_init_for_resume(dwc);
> >                       if (ret)
> >                               return ret;
> > @@ -2490,6 +2495,7 @@ static int dwc3_resume_common(struct dwc3 *dwc, p=
m_message_t msg)
> >               if (PMSG_IS_AUTO(msg))
> >                       break;
> >
> > +             pinctrl_pm_select_default_state(dwc->dev);
> >               ret =3D dwc3_core_init_for_resume(dwc);
> >               if (ret)
> >                       return ret;
> > @@ -2608,8 +2614,6 @@ static int dwc3_suspend(struct device *dev)
> >       if (ret)
> >               return ret;
> >
> > -     pinctrl_pm_select_sleep_state(dev);
> > -
> >       return 0;
> >  }
> >
> > @@ -2618,8 +2622,6 @@ static int dwc3_resume(struct device *dev)
> >       struct dwc3     *dwc =3D dev_get_drvdata(dev);
> >       int             ret =3D 0;
> >
> > -     pinctrl_pm_select_default_state(dev);
> > -
> >       pm_runtime_disable(dev);
> >       ret =3D pm_runtime_set_active(dev);
> >       if (ret)
> > @@ -2647,14 +2649,29 @@ static void dwc3_complete(struct device *dev)
> >               dwc3_writel(dwc->regs, DWC3_GUCTL3, reg);
> >       }
> >  }
> > +
> > +static int dwc3_prepare(struct device *dev)
> > +{
> > +     struct dwc3     *dwc =3D dev_get_drvdata(dev);
> > +
> > +     /*
> > +      * Indicate to the PM core that it may safely leave the device in
> > +      * runtime suspend if runtime-suspended already in device mode.
> > +      */
> > +     if (dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE)
> > +             return 1;
>
> Why are you skipping suspend for all cases when in device mode? Don't we
> need to check for current runtime suspend status?
> (ie. check pm_runtime_status_suspended()).
>

I was looking at drivers/base/power/main.c device_suspend() to see how
direct complete works, and there are a bunch of checks in the function to
determine direct complete eligibility, including pm_runtime_status_suspende=
d().
That's why I thought it's already taken care of by the PM framework.
However, looking at the documentation
https://docs.kernel.org/power/runtime_pm.html
again "Namely, if a system suspend .prepare() callback returns a positive
number for a device, that indicates to the PM core that the device appears =
to
be runtime-suspended and its state is fine.". You're right, we should also
do the check inside our .prepare callback. Will fix it in the next patch.

> I'm also a bit concernt about moving pinctrl_pm_select* to the
> suspend/resume_common function. Is your device using pinctrl? If not,
> how did you validate this?
>
> Thanks,
> Thinh
>

I couldn't find any device node that's actually utilizing the pinctrl "slee=
p"
state in upstream. I digged into the patch that introduced pinctrl to dwc3,=
 i.e.
https://lore.kernel.org/all/9dd70870cfee40154a37186d4cf3ae0e9a452cbd.144102=
9572.git.nsekhar@ti.com/
The intention was to control DRVVBUS pins using the pinctrl API so
that VBUS can be turned off to conserve power when device is suspended
(which also implies this is only relevant in host mode, at least in the ini=
tial
patch). Since there was no runtime PM support in dwc3 at that time, the
code was only added in the system suspend/resume path. Yet I don't see
why this cannot be extended to the runtime suspend/resume path,
ultimately it should be safe to turn off VBUS once the controller is
completely torn down with dwc3_core_exit() regardless of which suspend
path it's taking.

Besides looking at how pinctrl in dwc3 is intended to be used, I did
an inventory on how it actually is used. There are 3 major players:
ti, qcom and socionext that has pinctrl property set in their dwc3 device n=
ode.
1. ti/omap
The pinctrl property is only set when dr_mode is host or otg.
Only the "default" state is defined, none of boards has "sleep" state
defined, not even the first user
arch/arm/boot/dts/omap/am437x-gp-evm.dts
that introduced the API to dwc3.
(https://lore.kernel.org/all/4a8a072030c2a82867c6548627739146681b35a5.14410=
29572.git.nsekhar@ti.com/)
Setting pinctrl "default" state seems to be pretty common in ti/omap,
and the usage is aligned with the original intention: control DRVVBUS.
It's unclear why "sleep" state is no longer used though.

2. qcom
The following 2 boards have pinctrl property defined, dr_mode are all
host and also only the "default" state is defined.
- sa8155p-adp.dts  &usb_1_dwc3 {
                               dr_mode =3D "host";
                               pinctrl-names =3D "default";
                               pinctrl-0 =3D <&usb2phy_ac_en1_default>;
                               };
                               &usb_2_dwc3 {
                               dr_mode =3D "host";
                               pinctrl-names =3D "default";
                               pinctrl-0 =3D <&usb2phy_ac_en2_default>;
                               };
- sm8350-hdk.dts  &usb_2_dwc3 {
                              dr_mode =3D "host";
                              pinctrl-names =3D "default";
                              pinctrl-0 =3D <&usb_hub_enabled_state>;
                              };
It seems the pinctrl is used to control phy and perhaps downstream usb hub.
Nothing is turned off explicitly during sleep as "sleep" state isn't define=
d.
It's more like setting the required pins for host mode to work.

3. socionext
The pinctrl property is set on controllers with dr_mode peripheral or host.
Still, only the "default" state is defined.
The pin is assigned according to its dr_mode, controllers with dr_mode
host will be assigned with pinctrl_usb* pin, while controllers with dr_mode
peripheral will get pinctrl_usb*_device pin.
        pinctrl_usb0: usb0 {
                groups =3D "usb0";
                function =3D "usb0";
        };
        pinctrl_usb0_device: usb0-device {
                groups =3D "usb0_device";
                function =3D "usb0";
        };
Again, these pins are not related to power management, it's tied to dr_mode=
.

To summarize the current pinctrl usage in dwc3:
1. No user of "sleep" state, meaning it's unlikely to cause any impact
on suspend flow.
2. Typically, the default pin state reflects the controller's dr_mode,
acting as a pre-configuration step to set the operational mode.

Based on the above observation, the code change on the pinctrl is
unlikely to introduce a regression as it aligns with the original intention
of the pinctrl property, and the pinctrl_pm_select_sleep_state() is
essentially an NOP in upstream as of now. Besides,
pinctrl_pm_select_default_state() is called whenever we try to
re-initialize the controller.
I hope this addresses your concern.

Best,
Roy

> > +
> > +     return 0;
> > +}
> >  #else
> >  #define dwc3_complete NULL
> > +#define dwc3_prepare NULL
> >  #endif /* CONFIG_PM_SLEEP */
> >
> >  static const struct dev_pm_ops dwc3_dev_pm_ops =3D {
> >       SET_SYSTEM_SLEEP_PM_OPS(dwc3_suspend, dwc3_resume)
> >       .complete =3D dwc3_complete,
> > -
> > +     .prepare =3D dwc3_prepare,
> >       /*
> >        * Runtime suspend halts the controller on disconnection. It reli=
es on
> >        * platforms with custom connection notification to start the con=
troller
> >
> > base-commit: 99fa936e8e4f117d62f229003c9799686f74cebc
> > --
> > 2.48.1.711.g2feabab25a-goog
> >
> >

