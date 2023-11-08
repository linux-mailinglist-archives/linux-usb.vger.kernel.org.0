Return-Path: <linux-usb+bounces-2678-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB017E521D
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 09:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DEB41C20BC1
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 08:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABF463D9;
	Wed,  8 Nov 2023 08:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vgGSK1Sn"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D939863B3
	for <linux-usb@vger.kernel.org>; Wed,  8 Nov 2023 08:45:56 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C91771718
	for <linux-usb@vger.kernel.org>; Wed,  8 Nov 2023 00:45:55 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-54366bb1c02so7153a12.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Nov 2023 00:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699433154; x=1700037954; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnYR7bmgd7KfD+AkE17auBtmcY5ZsQOdpLALwgXFEH4=;
        b=vgGSK1SnFwOdreuBoQIe37R2MUQdJ8CaAUB13Sbhq8XCk8NtjkoVgC0hkpuIX0MOjD
         Ymiv+MJFF82Zv1tdR+prIev9ohM/gcM85T2jNHdH4LMeQMErhmzdI9ua3to3BLxsiMX9
         PNw8Uw0OwZVC6CfvwmJs48KuwtS1TmRBgzILrue5OA5dVYcoQQdFvDqnQHbQ9Q5lo8E1
         N6KMN+4x/JEnjondlWHEb7yXhTxPgf2iPbFUxHElLDpk3QYtB96bS2PLDglFWmmzV9Ss
         M2t9xr59ZhAnNyHO5r4RF731uFCTiVzFHuNjzwdby7+M2WqCywYM+MWv2+05RM9PzeOJ
         mNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699433154; x=1700037954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnYR7bmgd7KfD+AkE17auBtmcY5ZsQOdpLALwgXFEH4=;
        b=u6iPuCFyGtvdegxWRcgMTHvv8YlsalreeD2jxhlCbeaG01TBMrvLZuoKk1aD4BOCLi
         Ebbh2DM1F3/i4GsZSg+cHJa4OagXk2q3URp4KHfolHBxS3+qRXIlI/McrzbETnSxVpse
         P4VXFdkTXS4cNgu2zFDowHn3DKcj2G3tEDzdjJF6bQHtDZ64nZzwS6DLeST/RqwcWz0h
         byAxrNd+heTtdygKrrylWXSvCPzNCaqI3leN6/knDJNsz064vPHr4LB8mAsTHKg6Vu5o
         5zHuPtLrLBYUe7MCgBGVPwfeq2IZyv+P63Skj1aOgEGMkAUEkHNSeraw7GQWHmg76F0A
         cVGg==
X-Gm-Message-State: AOJu0YxwEQAJeI+pxWQ5Quk2gpudYd1YzEMHOEY2/nbWt/EoeYQSlATd
	CY35tY0swDpb354VrHqt05l1Ls9cGsAD1J6TQIRGzA==
X-Google-Smtp-Source: AGHT+IHAGDE6Z1bTpaCcy23RjlMGNDAdGNwJ4C1SrldWsiu21577HL+eBwG41/PmtCgI9MYo+YHDL4vN6GX348PYOEw=
X-Received: by 2002:a05:6402:528e:b0:544:e37e:d597 with SMTP id
 en14-20020a056402528e00b00544e37ed597mr233926edb.7.1699433154082; Wed, 08 Nov
 2023 00:45:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231031093921.755204-1-guanyulin@google.com> <f75d6cd2-fa9f-4820-969f-2a8839d78c9e@rowland.harvard.edu>
In-Reply-To: <f75d6cd2-fa9f-4820-969f-2a8839d78c9e@rowland.harvard.edu>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 8 Nov 2023 16:45:43 +0800
Message-ID: <CAOuDEK0NcijUKAL3fGtO=Ks+Y38TRhJcVx+ff-QUyUA0LcQ1Bw@mail.gmail.com>
Subject: Re: [PATCH] rpm: pm: enable PM_RPM_EXCEPTION config flag
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, len.brown@intel.com, 
	pavel@ucw.cz, heikki.krogerus@linux.intel.com, mkl@pengutronix.de, 
	hadess@hadess.net, mailhol.vincent@wanadoo.fr, ivan.orlov0322@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, pumahsu@google.com, raychi@google.com, 
	albertccwang@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 10:39=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Tue, Oct 31, 2023 at 05:38:55PM +0800, Guan-Yu Lin wrote:
> > Introducing PM_RPM_EXCEPTION config flag, which may alter the priority
> > between system power management and runtime power management. In
> > suspend-to-idle flow, PM core will suspend all devices to avoid device
>
> Your patch affects all forms of system suspend, not just
> suspend-to-idle.  What do you actually mean here?
>
> > interact with the system. However, chances are devices might be used by
> > other systems rather than a single system. In this case, PM core should=
n't
> > suspend the devices. One may use PM_RPM_EXCEPTION config flag to mark
> > such exception, and determine the power state of a device with runtime
> > power management rather than system power management.
>
> This sort of arrangement -- a device shared between two different
> systems -- could happen with any sort of device.  Why does your patch
> affect only USB devices?
>
> > diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
> > index 4b31629c5be4..beba7a0f3947 100644
> > --- a/kernel/power/Kconfig
> > +++ b/kernel/power/Kconfig
> > @@ -193,6 +193,14 @@ config PM
> >         responsible for the actual handling of device suspend requests =
and
> >         wake-up events.
> >
> > +config PM_RPM_EXCEPTION
> > +     bool "Prioritize Runtime Power Management more than Power Managem=
ent"
>
> Runtime Power Management is a form of Power Management, so what you
> wrote doesn't make sense.  What you really meant is: Prioritize Runtime
> Power Management more than System Power Management.
>
> > +     default n
> > +     help
> > +     Provides a way to prioritize Runtime Power Management more than P=
ower
> > +     Management. This way system can suspnd with maintaining specific
>
> s/suspnd/suspend/
> s/with/while/
>
> > +     components in operation.
>
> Your patch does not allow _specific_ components to be kept in operation.
> _All_ in-use components that support prioritized PM (with this patch,
> all USB components) will remain powered during system suspend, even if
> the user wants only _some_ of them to be kept powered.
>
> Alan Stern
>
> > +
> >  config PM_DEBUG
> >       bool "Power Management Debug Support"
> >       depends on PM
> > --
> > 2.42.0.820.g83a721a137-goog
> >

Thanks for the questions. Let me first introduce my motivation for
proposing this feature. We can discuss the implementation details later.

Motivation:
Currently, system PM operations always override runtime PM operations.
As runtime PM reflects the power status of devices, there is a
possibility that runtime PM states that a device is in use, but system
PM decides to suspend it. Up to now, we have assumed that a device can't
function without resources from the system, so the device should acquire
a wakelock to prevent this from happening. However, what if the device
does not need the system's support to function? Or only needs limited
resources (e.g., only limited power source or clock) to function? In this
situation, we would like to keep the device on but allow the system to
suspend. This is an example where we would like devices to follow runtime
PM rather than system PM.

Feature Supported:
1. Devices could control the priority of system PM and runtime PM during
   runtime.
2. The control should be at the device level, meaning that different
   devices should control their own priorities.

Goal of This Patch:
1. Design a framework to support features above.
2. Apply it into usb for demonstration.

Thanks,
Guan-Yu

