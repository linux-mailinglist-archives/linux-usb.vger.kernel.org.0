Return-Path: <linux-usb+bounces-9577-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A408AD085
	for <lists+linux-usb@lfdr.de>; Mon, 22 Apr 2024 17:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4477FB21A45
	for <lists+linux-usb@lfdr.de>; Mon, 22 Apr 2024 15:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3D1152E1F;
	Mon, 22 Apr 2024 15:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jQw5bpIE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D45152E1D
	for <linux-usb@vger.kernel.org>; Mon, 22 Apr 2024 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713799383; cv=none; b=bTv0K7zY/RzD/w0/gP9CKtZdYDC9shupJAwMIzY6a/7RAC/LsUKloaTpCY6DkRtdtSV+oe16DWVtv7Wh2rxbiAMjgp4Lp2XVCcx9R+0OVUuZEGscJz1IzBJLRg7gh1pW4GAjOS69iizFHdNbHzHeY3zXDBYp+DsaIwwgEyjJvVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713799383; c=relaxed/simple;
	bh=Wrq2FY2zLnIrPEkDumetUyWCevLG168o+veXdsJ3oYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgNGZPIZaiq7UZBRxO+vE0e56vLOSr8vJQngWMfCvaoYJcNEF0aBoDV8Gu405rXkiCdKnDKtEeFoivDu4oafvpiooUdt/2SGuUyXN09xeAquXvZeBWJvGPq0y5+V0bPq8dE8QxKTVWbnfHpqyrOQCsynn8FhPqscqvBPNOY80MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jQw5bpIE; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-de45d4ca525so4499718276.0
        for <linux-usb@vger.kernel.org>; Mon, 22 Apr 2024 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713799380; x=1714404180; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H49d5wg6b03lJ7C3k9uG4OXg+mNjiFzDv8QLMVLBemE=;
        b=jQw5bpIE0p9aU2jm1kfJ2vTPk/opLoE9MDNoi7SFfHBH2wPbgRRL0+/mEhh8N94ilO
         iwWQDiD/FbpiKvrPhgHHCCOWosBqa9x6/VKuJQOmYLarw6Co2zD9S7HLYUd95khS2Sqv
         nITgCA+iWCViBKrRQdi/jkFejGMnbl0w0GTH0PGRin1wFNg8I/vKQxdTIolBjZ1YvSFm
         53zbSyVKxpTkid+IVXJMiRjoJBHroYwhsMdkXdIK61cI8avcfrrF7DQsEA2BDpL3lMpT
         uW4bIPkCT6rJ0E5YZl5rW99681pRizvqE6pj2YTQbBgxxJqL/wjvNMSiKHjOup1uO/Cz
         ejtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713799380; x=1714404180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H49d5wg6b03lJ7C3k9uG4OXg+mNjiFzDv8QLMVLBemE=;
        b=M3vwKYoLq3VSwsWXzktdyMWpGwPNMNSv1TKiutQMiQGpX5yOzrUTCRiIZ1odm8G515
         jOxvW5ywFL+2OvNwk9QqzWmfLEfLarPST1mh1s0M/O88jIZGSsYAr58fupYdjzxHHJJV
         DhPSXP6RI+E23Li3rRA5BydvceuT7Q13fOWQFbRWK8SdiJo4SmFWrfKQmKAV3B6aHCgR
         kwq4zXbDh1ZWHrrxIrON9bbBcBB+Ee1snq1bWsoVtjWHXfToxWvqMOIf6TTzNIdgBY7k
         7LOjUZYtNjZySB+MoHjBdVIOfNuQpzPzjYw7vuiUnvw5ri5WoBXB5eV/PtRBacDjvDrz
         Eodg==
X-Forwarded-Encrypted: i=1; AJvYcCWZUUBKa3uGl42TOiax9hbV38rfR1mjnQPFgFHFqDegwDBAeo7EvwUL6Y8eno09WHsMjIl+HNw64iTXum9csZHYePMv+lCJ5/UM
X-Gm-Message-State: AOJu0Yx3fIPh9W0g21jqde1lA7eRF925muVATGxpLDU8MitnSJaeEim1
	6xanT8LBJ268jEmE3rD1Wwh71f+kKOU4LlzOb9tTnWablxRTUz5FFIxFlM3YQPiGfYjW8HmFH8v
	2AXA3HNIaYp8Qu/tIBk1nxEQ5NU9L+BaMRtNlwg==
X-Google-Smtp-Source: AGHT+IGvjDpakTVXulryQs11vXQ+nvpmucg042VWFjr8BwSv+KjHoQyGhHw+EPl15xSE7OqXMj40JwK1OaDhgNUuqFs=
X-Received: by 2002:a25:9343:0:b0:de4:7831:919 with SMTP id
 g3-20020a259343000000b00de478310919mr9864357ybo.38.1713799380128; Mon, 22 Apr
 2024 08:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-7-890db00877ac@linaro.org>
 <ZiZC/l9nOmzWx+j6@kuha.fi.intel.com> <46fktwtp3xers6tcpov3qo4zswptvajewsdltm45zbz2kmmpzp@cthu6ylttup3>
 <ZiZ8El4779l0W1Ig@kuha.fi.intel.com>
In-Reply-To: <ZiZ8El4779l0W1Ig@kuha.fi.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 22 Apr 2024 18:22:49 +0300
Message-ID: <CAA8EJppLAMFwp6T+7u8N3PVaEPR7JDg1Te8a2fodqPVjsvbM-Q@mail.gmail.com>
Subject: Re: [PATCH 7/8] usb: typec: ucsi: glink: merge pmic_glink_altmode driver
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Apr 2024 at 18:02, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Dmitry,
>
> On Mon, Apr 22, 2024 at 03:45:22PM +0300, Dmitry Baryshkov wrote:
> > On Mon, Apr 22, 2024 at 01:59:10PM +0300, Heikki Krogerus wrote:
> > > Hi Dmitry,
> > >
> > > On Tue, Apr 16, 2024 at 05:20:56AM +0300, Dmitry Baryshkov wrote:
> > > > Move handling of USB Altmode to the ucsi_glink driver. This way the
> > > > altmode is properly registered in the Type-C framework, the altmode
> > > > handlers can use generic typec calls, the UCSI driver can use
> > > > orientation information from altmode messages and vice versa, the
> > > > altmode handlers can use GPIO-based orientation inormation from UCSI
> > > > GLINK driver.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/soc/qcom/Makefile             |   1 -
> > > >  drivers/soc/qcom/pmic_glink_altmode.c | 546 ----------------------------------
> > > >  drivers/usb/typec/ucsi/ucsi_glink.c   | 495 ++++++++++++++++++++++++++++--
> > > >  3 files changed, 475 insertions(+), 567 deletions(-)
> > > >
> >
> > [skipped the patch]
> >
> > > > +
> > > > +static void pmic_glink_ucsi_register_altmode(struct ucsi_connector *con)
> > > > +{
> > > > + static const u8 all_assignments = BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D) |
> > > > +                      BIT(DP_PIN_ASSIGN_E);
> > > > + struct typec_altmode_desc desc;
> > > > + struct typec_altmode *alt;
> > > > +
> > > > + mutex_lock(&con->lock);
> > > > +
> > > > + if (con->port_altmode[0])
> > > > +         goto out;
> > > > +
> > > > + memset(&desc, 0, sizeof(desc));
> > > > + desc.svid = USB_TYPEC_DP_SID;
> > > > + desc.mode = USB_TYPEC_DP_MODE;
> > > > +
> > > > + desc.vdo = DP_CAP_CAPABILITY(DP_CAP_DFP_D);
> > > > +
> > > > + /* We can't rely on the firmware with the capabilities. */
> > > > + desc.vdo |= DP_CAP_DP_SIGNALLING(0) | DP_CAP_RECEPTACLE;
> > > > +
> > > > + /* Claiming that we support all pin assignments */
> > > > + desc.vdo |= all_assignments << 8;
> > > > + desc.vdo |= all_assignments << 16;
> > > > +
> > > > + alt = typec_port_register_altmode(con->port, &desc);
> > >
> > >         alt = ucsi_register_displayport(con, 0, 0, &desc);
> >
> > Note, the existing UCSI displayport AltMode driver depends on the UCSI
> > actually handling the altomode. It needs a partner, etc.
> >
> > > You need to export that function, but that should not be a problem:
> > >
> > > diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
> > > index d9d3c91125ca..f2754d7b5876 100644
> > > --- a/drivers/usb/typec/ucsi/displayport.c
> > > +++ b/drivers/usb/typec/ucsi/displayport.c
> > > @@ -315,11 +315,13 @@ struct typec_altmode *ucsi_register_displayport(struct ucsi_connector *con,
> > >         struct ucsi_dp *dp;
> > >
> > >         /* We can't rely on the firmware with the capabilities. */
> > > -       desc->vdo |= DP_CAP_DP_SIGNALLING(0) | DP_CAP_RECEPTACLE;
> > > +       if (!desc->vdo) {
> > > +               desc->vdo = DP_CAP_DP_SIGNALLING(0) | DP_CAP_RECEPTACLE;
> > >
> > > -       /* Claiming that we support all pin assignments */
> > > -       desc->vdo |= all_assignments << 8;
> > > -       desc->vdo |= all_assignments << 16;
> > > +               /* Claiming that we support all pin assignments */
> > > +               desc->vdo |= all_assignments << 8;
> > > +               desc->vdo |= all_assignments << 16;
> > > +       }
> > >
> > >         alt = typec_port_register_altmode(con->port, desc);
> > >         if (IS_ERR(alt))
> > > @@ -342,3 +344,4 @@ struct typec_altmode *ucsi_register_displayport(struct ucsi_connector *con,
> > >
> > >         return alt;
> > >  }
> > > +EXPORT_SYMBOL_GPL(ucsi_register_displayport);
> > >
> > > <snip>
> > >
> > > > +static void pmic_glink_ucsi_set_state(struct ucsi_connector *con,
> > > > +                               struct pmic_glink_ucsi_port *port)
> > > > +{
> > > > + struct typec_displayport_data dp_data = {};
> > > > + struct typec_altmode *altmode = NULL;
> > > > + unsigned long flags;
> > > > + void *data = NULL;
> > > > + int mode;
> > > > +
> > > > + spin_lock_irqsave(&port->lock, flags);
> > > > +
> > > > + if (port->svid == USB_SID_PD) {
> > > > +         mode = TYPEC_STATE_USB;
> > > > + } else if (port->svid == USB_TYPEC_DP_SID && port->mode == DPAM_HPD_OUT) {
> > > > +         mode = TYPEC_STATE_SAFE;
> > > > + } else if (port->svid == USB_TYPEC_DP_SID) {
> > > > +         altmode = find_altmode(con, port->svid);
> > > > +         if (!altmode) {
> > > > +                 dev_err(con->ucsi->dev, "altmode woth SVID 0x%04x not found\n",
> > > > +                         port->svid);
> > > > +                 spin_unlock_irqrestore(&port->lock, flags);
> > > > +                 return;
> > > > +         }
> > > > +
> > > > +         mode = TYPEC_MODAL_STATE(port->mode - DPAM_HPD_A);
> > > > +
> > > > +         dp_data.status = DP_STATUS_ENABLED;
> > > > +         dp_data.status |= DP_STATUS_CON_DFP_D;
> > > > +         if (port->hpd_state)
> > > > +                 dp_data.status |= DP_STATUS_HPD_STATE;
> > > > +         if (port->hpd_irq)
> > > > +                 dp_data.status |= DP_STATUS_IRQ_HPD;
> > > > +         dp_data.conf = DP_CONF_SET_PIN_ASSIGN(port->mode - DPAM_HPD_A);
> > > > +
> > > > +         data = &dp_data;
> > > > + } else {
> > > > +         dev_err(con->ucsi->dev, "Unsupported SVID 0x%04x\n", port->svid);
> > > > +         spin_unlock_irqrestore(&port->lock, flags);
> > > > +         return;
> > > > + }
> > > > +
> > > > + spin_unlock_irqrestore(&port->lock, flags);
> > > > +
> > > > + if (altmode)
> > > > +         typec_altmode_set_port(altmode, mode, data);
> > >
> > > So if the port altmode is using the ucsi_displayport_ops, you can
> > > simply register the partner altmode here instead. That should
> > > guarantee that it'll bind to the DP altmode driver which will take
> > > care of typec_altmode_enter() etc.
> >
> > In our case the altmode is unfortunately completely hidden inside the
> > firmware. It is not exported via the native UCSI interface. Even if I
> > plug the DP dongle, there is no partner / altmode being reported by the
> > PPM. All DP events are reported via additional GLINK messages.
>
> I understand that there is no alt mode being reported, but I assumed
> that there is a notification about connections.

Yes, there is a notification.

>
> If that's not the case, then you need to use this code path to
> register the partner device as well I think. The partner really has to
> be registered somehow.
>
> > The goal is to use the core Type-C altmode handling, while keeping UCSI
> > out of the altmode business.
> >
> > This allows the core to handle switches / muxes / retimers, report the
> > altmode to the userspace via sysfs, keep the link between the DP part of
> > the stack and the typec port, but at the same time we don't get errors
> > from UCSI because of the PPM reporting unsupported commands, etc.
>
> I understand, and just to be clear, I don't have a problem with
> bypassing UCSI. But that does not mean you can skip the alt mode
> registration.
>
> The primary purpose of drivers/usb/typec/ucsi/displayport.c is to
> emulate the partner DP alt mode device a little so that the actual DP
> alt mode driver drivers/usb/typec/altmodes/displayport.c is happy. The
> altmode driver will then make sure that all the muxes, switches and
> what have you, are configured as they should, and more importantly,
> make sure the DP alt mode is exposed to the user space exactly the
> same way as it's exposed on all the other systems.

Ack. I'll take a look at implementing it this way. If it works, then
it becomes even easier.

A bit of justification from my side. I was comparing this
implementation with the Lenovo p53s laptop. Running 6.7 kernel, I see
two Type-C ports. They register altmodes, etc. However for the DP
partner (Lenovo USB-C dock) I only get the partner device, there are
no altmodes of the partner. /sys/bus/typec/devices/ is empty. The DP
works perfectly despite not having the typec device. But maybe it's
just some i915's extension or platform hack.

> There are a couple of UCSI commands that are being used there yes, but
> by modifying it so that those UCSI commands are executed conditionally
> - by checking the ALT_MODE_DETAILS feature - you should be able to use
> it also in this case.
>
> You really need to register the partner alt mode(s) one way or the
> other in any case, and the partner device itself you absolutely must
> register. The user space interface needs to be consistent.

Ack

-- 
With best wishes
Dmitry

