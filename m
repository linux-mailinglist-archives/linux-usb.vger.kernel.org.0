Return-Path: <linux-usb+bounces-27889-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04023B51F1A
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 19:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE67D443240
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 17:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AA333436F;
	Wed, 10 Sep 2025 17:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mfs0XGga"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E8B281531
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 17:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757525917; cv=none; b=p/60fdXEltTMgMdEn+9vvhQsokKigdBW5g9WvdzR2aRB8vkvnpwdyBXk8ZNEgfMORRP6PddZ7U8pCXCebkTyGOn6rxNxJMshTelLHf97RiaFS/pQb/Aw6CrmcUDn0RN4E+5T7t2aPizICke6RqeB+cCsoSIzGLjOJWZxS7EYvxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757525917; c=relaxed/simple;
	bh=/maRrN03GREpqejLxXVtvRXFXTXkAYd7s3DzF3MkSA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1PfBDGk06jJNt0iarf7BbFPfPouZLGEOrAXETh+EiBZGkAKLq597smh45kFSSdaZoP/D9JLaeMDT7PNiJAvk2O9QbbAwhdGRDrDdqH2f4D6/uY20N0yWlqH4JauyVAKCZNutnBXkfOAjWD73v0HXBqTxPVaqoYVHQMIyXTb3Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mfs0XGga; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3547C4CEFB
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 17:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757525917;
	bh=/maRrN03GREpqejLxXVtvRXFXTXkAYd7s3DzF3MkSA0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Mfs0XGgaE4FfWKqeDbTYcU010yi1fQCKbvrt6OWWm9esUIZompP/ajtnwFgNohD76
	 ShfgQvk+QyHq4rhJlVQpHSZ/Lu4H3v5bve+nj8tiZ5nWeLcBB9K5eHUCZNnN1tDtGS
	 UmLvPPy6/fFE1Zzp8IJwA3oixl2kKT92E8INA4siuOSrPNTPmpR4RgzrjoDIn+Pbxl
	 DojEs6RPprS4Sd+J38sTaCpFjDzxyPc5PyTz8GyKw3cjznQPwjzxzJm2EWsrKmAa4K
	 bDHco9AtrUyeXEmmec9M9dRVy8ggwW4FFCUoe6QptZNNE+eCVH5vIRf95LamHJBpiE
	 XcThL1V+bnmEA==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-61bf9ef4cc0so4131939eaf.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 10:38:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9HoKynlkb1p5Glt1Ptss/eAIL1vTlQHGLcXKbouXTMxfBM+C1H7cumjWy4dih9jQUU2JO82os4PE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhajpvtl1seQg0U2otw91K2THZ6Ib4PVtRBSNW5MvvQOcHyoSx
	WrukYHMKHMCOXHkzXArVtm+MzM6D1Vr1IGBfUn1Op5RHW3ky76Z0EDQd/yeL7je/FIhPOa4uaoQ
	T3sYonyb3+nhvPDOXTeOsSYmxtRlGUI4=
X-Google-Smtp-Source: AGHT+IGHCt4j1R4FaC3Lmj2Z0gXRtZrpcrYqlzpLE4lKDo55KW3cWbFI81cNR/IODEnBUt82RlGcoSR69Iy2e6L8enw=
X-Received: by 2002:a05:6820:221e:b0:61f:f777:8e61 with SMTP id
 006d021491bc7-62178aad31fmr6849169eaf.8.1757525916115; Wed, 10 Sep 2025
 10:38:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910171132.GA1541776@bhelgaas> <0bb2cb92-0d31-4e42-b6ef-2cc3fdf0df40@kernel.org>
In-Reply-To: <0bb2cb92-0d31-4e42-b6ef-2cc3fdf0df40@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 10 Sep 2025 19:38:25 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g5GPhRkQjo-Z6gmcP7f6dsFthbaO+DT2=SnsDawi_3HA@mail.gmail.com>
X-Gm-Features: Ac12FXz69VCkP7reTy_nIeLgfD-T8DfWoDH6oE-W2ZngcIbPfm1dm4_CpZRhoRs
Message-ID: <CAJZ5v0g5GPhRkQjo-Z6gmcP7f6dsFthbaO+DT2=SnsDawi_3HA@mail.gmail.com>
Subject: Re: [PATCH v7 05/12] PCI/PM: Disable device wakeups when halting or
 powering off system
To: Mario Limonciello <superm1@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, Steven Rostedt <rostedt@goodmis.org>, 
	"open list:HIBERNATION (aka Software Suspend, aka swsusp)" <linux-pm@vger.kernel.org>, 
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
	"open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>, 
	"open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, 
	"open list:TRACING" <linux-trace-kernel@vger.kernel.org>, AceLan Kao <acelan.kao@canonical.com>, 
	Kai-Heng Feng <kaihengf@nvidia.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	=?UTF-8?Q?Merthan_Karaka=C5=9F?= <m3rthn.k@gmail.com>, 
	Eric Naim <dnaim@cachyos.org>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 7:24=E2=80=AFPM Mario Limonciello <superm1@kernel.o=
rg> wrote:
>
> On 9/10/25 12:11 PM, Bjorn Helgaas wrote:
> > On Wed, Sep 10, 2025 at 11:52:00AM -0500, Mario Limonciello wrote:
> >> On 9/10/25 10:06 AM, Bjorn Helgaas wrote:
> >>> On Tue, Sep 09, 2025 at 02:16:12PM -0500, Mario Limonciello (AMD) wro=
te:
> >>>> PCI devices can be configured as wakeup sources from low power state=
s.
> >>>> However, when the system is halting or powering off such wakeups are
> >>>> not expected and may lead to spurious behavior.
> >>>
> >>> I'm a little unclear on the nomenclature for these low power states,
> >>> so I think it would be helpful to connect to the user action, e.g.,
> >>> suspend/hibernate/etc, and the ACPI state, e.g.,
> >>>
> >>>     ... when the system is hibernating (e.g., transitioning to ACPI S=
4
> >>>     and halting) or powering off (e.g., transitioning to ACPI S5 soft
> >>>     off), such wakeups are not expected ...
> >>
> >> I will try to firm it up in the commit message.  But yes you're gettin=
g the
> >> intent, having a wakeup occur at S5 would be unexpected, and would lik=
ely
> >> change semantics of what people "think" powering off a machine means.
> >>
> >>> When I suspend or power off my laptop from the GUI user interface, I
> >>> want to know if keyboard or mouse activity will resume or if I need t=
o
> >>> press the power button.
> >>
> >> The way the kernel is set up today you get a single wakeup sysfs file =
for a
> >> device and that wakeup file means 3 things:
> >> * abort the process of entering a suspend state or hibernate
> >> * wake up the machine from a suspend state
> >> * wake up the machine from hibernate
> >>
> >>>> ACPI r6.5, section 16.1.5 notes:
> >>>>
> >>>>       "Hardware does allow a transition to S0 due to power button pr=
ess
> >>>>        or a Remote Start."
> >>>
> >>> Important to note here that sec 16.1.5 is specifically for "S5
> >>> Soft Off State".
> >>>
> >>> S4 is a sleeping state and presumably sec 16.1.6 ("Transitioning
> >>> from the Working to the Sleeping State") applies.  That section
> >>> mentions wakeup devices, so it's not obvious to me that PCI device
> >>> wakeup should be disabled for S4.
> >>
> >> It actually /shouldn't/ be disabled for S4 - it should only be
> >> disabled for S5.
> >>
> >> Are you implying a bug in the flow?  I didn't think there was one:
> >>
> >> During entering hibernate the poweroff() call will have system_state
> >> =3D SYSTEM_SUSPEND so wakeups would be enabled.
> >>
> >> For powering off the system using hibernate flows poweroff() call
> >> would have system_state =3D SYSTEM_HALT or SYSTEM_POWER_OFF.
> >
> > OK.  I assumed that since you check for two states (SYSTEM_HALT or
> > SYSTEM_POWER_OFF), one must be hibernate (ending up in S4?) and the
> > other a soft power off (ending up in S5?).
> >
> > But it sounds like there are two ways to power off.  I'm just confused
> > about the correspondence between hibernate, soft poweroff, S4, S5,
> > SYSTEM_HALT, and SYSTEM_POWER_OFF.
> >
> > *Do* both SYSTEM_HALT and SYSTEM_POWER_OFF lead to S5 on an ACPI
> > system?  If so, what's the difference between them?
>
> The two functions are kernel_halt() and kernel_power_off().
>
> And looking again, Ahhhh!  kernel_power_off() is the only thing that
> actually leads to machine_power_off().  Halt just stops the CPUs.
>
> I think we should only be using the hibernate flows for SYSTEM_POWER_OFF.

That's correct.

