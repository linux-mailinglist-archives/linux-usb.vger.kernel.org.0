Return-Path: <linux-usb+bounces-26087-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B41B0E014
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jul 2025 17:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29A5616DAFB
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jul 2025 15:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E647273816;
	Tue, 22 Jul 2025 15:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OetOF787"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE939288C10
	for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 15:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753196910; cv=none; b=PTCRBAoJtarLFaaX97cArikvK+KqLCX3ir7wI7XbfguK7Hiw5Ae1zmDN3khB3bfe/vZSSBQJg1AEjc2QUXlI6p6QRfCkm61ZZNrxPjXd/QQPvX3CZVTt/0TGWYdxyMLTN2Sxq3l62D7V4RoPdoHxdccy1YrTaUBPtXcHFF5joOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753196910; c=relaxed/simple;
	bh=TdHd72rU+sWqaPfxkx1W9QKt9zFCkcy+bitA/Lhnc+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gmxuG1+tV1O08QbnluxLnA6N5vtHHh11Px+T+I4nJxwLpKhORTGrGKQeF9lq6ab69GQmLzbKQmcdeGVWkMlR7q5y3pWzgD2HZ13E3W018IeW1CRf0lgoIp1yTAmmb3oS9xx1g6+NdWWRqNWBZ5+ITdy+zBi714NkddOPPK4H/U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OetOF787; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-31329098ae8so5111347a91.1
        for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 08:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753196908; x=1753801708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvnddP3Fqnz0/+hWWQQyPfey79NsrjEo5E6FDf5e2gA=;
        b=OetOF787f1DLstrK4ysEduOmzi+EseEyxttp/tJ+8npZgcW6Bz4RZ1bc+VtIulvfrR
         ibU0cwTfTVmSXb1RlTy4yK5n9nRnihBTvVpwcj3l7IqiPOTZUbCIYD1f1juvzkAxR2dD
         bDZ7qf0nK/WY1wmr5twU9wgzRvhYa2udJDTa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753196908; x=1753801708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvnddP3Fqnz0/+hWWQQyPfey79NsrjEo5E6FDf5e2gA=;
        b=RuvefkLTVS5VyihEN7+/Z6HHQzVGfyYtpvtgrAgHJBb/qXoCfFXSpLnry6zQAGp+yL
         H4bZTgsg0wb30rl6SUhydrBhnu7pvppfCHilRIETE/Eg4+muEK2YCjBLEVOTWfTm0fRt
         7qInGiOpwXkw74G/p7gxglZN7cMEw5KU9w+pNJMru873sVHgjZMkDBjWDVZRIG7yG2kV
         +ibqWktv8PwD/lmChpuYanYycmoO1aabo6yKs6J/GcFzRPOiYWW6GQwWo+WWkFhZZbVY
         yXEvAINiNzYl+LdCpQj19piJMli5BvGL9dRe+FX0JlgeOKAsQ9+JULQh+p2J5fJqntmv
         J8Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUGxj9JvWYKXfIhK3wHu6NBH33JAueeztAwgrPVmjm/TejgA8v7V9ltq4D8lmOU4+b47ZSgWpLuqSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXsv1j2HfB+j4alc2+k+1Y1Ig5XAyh9254HPQT3iwfxUbeaPAj
	4O9d3Onh93u00732KWNWAsypCx9azwILgGyGoMcFol1ZZfAUB16mUqz0AWmwtsHaWyQDqKJlQks
	uuP8BLGUU2sRjMzSF/oCTsw0rnOfZ3qCXx8PT7Rax
X-Gm-Gg: ASbGncv0rKfLkS2MP3jZqa+Vo2WSNBz8nvrC/p6JKKkwOlhJQZ2rYfAeF9qNCyPSrVS
	4fVCt1VlDC0Hr9SH2qNzDZdUiJd0tPRhxd/fqb65JyqPPm3a7QP6P20qSOGovPYylOsC7GstmgG
	ajlOXXm95uGuF8aWB2VVPkglRUYyDjdLNRQgl12PV7bOpjlX7WeoHytqw2XHpqGh0J/pJ3cGreL
	q9x2NYFjzGoSq+PmVYmv36h4KH/IlQDJg==
X-Google-Smtp-Source: AGHT+IEPeejhAmRbk14P17x+h1flJqBJXlgKJ5dzFNqYXacOJiHw9gueZKyo727SDt2/E2hmuOpJP1mxD7wHPUlZD8M=
X-Received: by 2002:a17:90a:d883:b0:315:aa6d:f20e with SMTP id
 98e67ed59e1d1-31e3e0ffbc7mr5339484a91.4.1753196907937; Tue, 22 Jul 2025
 08:08:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630141239.3174390-1-akuchynski@chromium.org>
 <20250630141239.3174390-6-akuchynski@chromium.org> <2025070143-safeness-prewashed-6e9f@gregkh>
In-Reply-To: <2025070143-safeness-prewashed-6e9f@gregkh>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 22 Jul 2025 17:08:15 +0200
X-Gm-Features: Ac12FXz73vDrhwbwuJ6ue9xHPqxv1oqYSoyD_s9s7OeX_260niD-XymVJv-L_NQ
Message-ID: <CAMMMRMeKyi56Pha-X86BaQwcHGCx-xu5F67HCGZg=Yhxuk==OQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] usb: typec: Implement automated mode selection
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, "Christian A. Ehrhardt" <lk@c--e.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 10:41=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 30, 2025 at 02:12:34PM +0000, Andrei Kuchynski wrote:
> > This commit introduces mode_selection sysfs attribute to control automa=
ted
> > mode negotiation. Writing "yes" to this file activates the automated
> > selection process for DisplayPort, Thunderbolt alternate modes, and USB=
4
> > mode. Conversely, writing "no" will cancel any ongoing selection proces=
s
> > and exit the currently active mode.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec |  17 +
> >  drivers/usb/typec/class.c                   |  52 ++-
> >  drivers/usb/typec/class.h                   |  10 +
> >  drivers/usb/typec/mode_selection.c          | 413 ++++++++++++++++++++
> >  drivers/usb/typec/mode_selection.h          |  30 ++
> >  include/linux/usb/pd_vdo.h                  |   2 +
> >  include/linux/usb/typec_altmode.h           |   5 +
> >  7 files changed, 527 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentatio=
n/ABI/testing/sysfs-class-typec
> > index ff3296ee8e1c..0ffc71a7c374 100644
> > --- a/Documentation/ABI/testing/sysfs-class-typec
> > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > @@ -263,6 +263,23 @@ Description:     The USB Modes that the partner de=
vice supports. The active mode
> >               - usb3 (USB 3.2)
> >               - usb4 (USB4)
> >
> > +What:                /sys/class/typec/<port>-partner/mode_selection
> > +Date:                June 2025
> > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > +Description: Lists the partner-supported alternate modes and mode entr=
y
> > +             results with the currently entered mode bracketed. If a c=
able doesn't
> > +             support a mode, it's marked as 'nc'. An ellipsis indicate=
s a mode
> > +             currently in progress. Automated mode selection is activa=
ted by writing
> > +             "yes" to the file. Conversely, writing "no" will cancel a=
ny ongoing
> > +             selection process and exit the currently active mode, if =
any.
> > +
> > +             Example values:
> > +             - "DP TBT=3D... USB4=3Dnc": The cable does not support US=
B4 mode,
> > +                     The driver is currently attempting to enter Thund=
erbolt alt-mode.
> > +             - "[DP] TBT=3D-EOPNOTSUPP USB4=3D-ETIME": USB4 mode entry=
 failed due to
> > +                     a timeout, Thunderbolt failed with the result -EO=
PNOTSUPP,
> > +                     and DisplayPort is the active alt-mode.
>
> We don't print error codes to userspace like this :(
>

The intention is to provide detailed status updates regarding failures.
I will revise this to simplify string parsing in user-space and omit
any error codes.

> And "yes" and "no" are not the traditional sysfs apis for on/off, please
> use the in-kernel function for that instead that takes many more types
> of values.
>

kstrtobool() is used. It is just not documented here. I will update the
documentation

> And again, multiple values in a sysfs file are not usually a good idea
> at all as now userspace has to parse them properly.  What userspace tool
> is going to do that?
>

By combining results into a single, complex status string, the user can
receive the information atomically. This is why type_mode_selection_get
function is mutex-protected. It prevents the user from encountering
inconsistent states when reading different files.

> > +
> >  USB Type-C cable devices (eg. /sys/class/typec/port0-cable/)
> >
> >  Note: Electronically Marked Cables will have a device also for one cab=
le plug
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 93eadbcdd4c0..8455e07a9934 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -741,6 +741,33 @@ static ssize_t number_of_alternate_modes_show(stru=
ct device *dev, struct device_
> >  }
> >  static DEVICE_ATTR_RO(number_of_alternate_modes);
> >
> > +static ssize_t mode_selection_show(struct device *dev,
> > +                                struct device_attribute *attr,
> > +                                char *buf)
> > +{
> > +     struct typec_partner *partner =3D to_typec_partner(dev);
> > +
> > +     return typec_mode_selection_get(partner, buf);
> > +}
> > +
> > +static ssize_t mode_selection_store(struct device *dev, struct device_=
attribute *attr,
> > +                           const char *buf, size_t size)
> > +{
> > +     struct typec_partner *partner =3D to_typec_partner(dev);
> > +     bool start;
> > +     int ret =3D kstrtobool(buf, &start);
> > +
> > +     if (!ret) {
> > +             if (start)
> > +                     ret =3D typec_mode_selection_start(partner);
> > +             else
> > +                     ret =3D typec_mode_selection_reset(partner);
> > +     }
> > +
> > +     return ret ? : size;
>
> Again, only use ? : if you have to (hint, you don't have to here.)
>

Will be replaced with an if/else statement.

> > +static unsigned int mode_selection_timeout =3D 4000;
> > +module_param(mode_selection_timeout, uint, 0644);
> > +MODULE_PARM_DESC(mode_selection_timeout, "The timeout mode entry, ms")=
;
> > +
> > +static unsigned int mode_selection_delay =3D 1000;
> > +module_param(mode_selection_delay, uint, 0644);
> > +MODULE_PARM_DESC(mode_selection_delay,
> > +     "The delay between attempts to enter or exit a mode, ms");
> > +
> > +static unsigned int mode_selection_entry_attempts =3D 4;
> > +module_param(mode_selection_entry_attempts, uint, 0644);
> > +MODULE_PARM_DESC(mode_selection_entry_attempts,
> > +     "Max attempts to enter mode on BUSY result");
>
> This is not the 1990's, please NEVER add new module parameters
> (especially ones that you never even documented in the changelog!)
>
> This just will not work, attributes for functionality either need to
> "just work properly" or you need to make them on a per-controller type
> basis as remember, systems have multiple controllers in them...
>

The current values are suitable for all controllers we work with,
rendering per-controller adjustments unnecessary. Therefore, I will
proceed with removing these module parameters.

> > +
> >  static const char * const mode_names[] =3D {
> >       [TYPEC_DP_ALTMODE] =3D "DP",
> >       [TYPEC_TBT_ALTMODE] =3D "TBT",
> > @@ -15,6 +31,15 @@ static const char * const mode_names[] =3D {
> >  };
> >  static const char * const default_priorities =3D "USB4 TBT DP";
> >
> > +struct mode_selection_state {
> > +     int mode;
>
> Shouldn't this be an enum?
>

enum is much better, thanks

> > +     bool enable;
> > +     bool cable_capability;
> > +     bool enter;
> > +     int attempt_count;
> > +     int result;
> > +};
>
> No documentation for what this structure is for?
>

This, of course, needs to be described.

> > +
> >  /* -------------------------------------------------------------------=
------- */
> >  /* port 'mode_priorities' attribute */
> >  static int typec_mode_parse_priority_string(const char *str, int *list=
)
> > @@ -114,3 +139,391 @@ int typec_mode_priorities_get(struct typec_port *=
port, char *buf)
> >
> >       return count + sysfs_emit_at(buf, count, "\n");
> >  }
> > +
> > +/* -------------------------------------------------------------------=
------- */
> > +/* partner 'mod_selection' attribute */
> > +
> > +/**
> > + * mode_selection_next() - Process mode selection results and schedule=
 next
> > + * action
> > + *
> > + * This function evaluates the outcome of the previous mode entry or e=
xit
> > + * attempt. Based on this result, it determines the next mode to proce=
ss and
> > + * schedules `mode_selection_work()` if further actions are required.
> > + *
> > + * If the previous mode entry was successful, the mode selection seque=
nce is
> > + * considered complete for the current cycle.
> > + *
> > + * If the previous mode entry failed, this function schedules
> > + * `mode_selection_work()` to attempt exiting the mode that was partia=
lly
> > + * activated but not fully entered.
> > + *
> > + * If the previous operation was an exit (after a failed entry attempt=
),
> > + * `mode_selection_next()` then advances the internal list of candidat=
e
> > + * modes to determine the next mode to enter.
> > + */
> > +static void mode_selection_next(
> > +     struct typec_partner *partner, struct mode_selection_state *ms)
> > +{
> > +     if (!ms->enter) {
> > +             kfifo_skip(&partner->mode_sequence);
> > +     } else if (!ms->result) {
> > +             dev_info(&partner->dev, "%s mode entered\n", mode_names[m=
s->mode]);
>
> Please remove debugging code.
>
> > +
> > +             partner->active_mode =3D ms;
> > +             kfifo_reset(&partner->mode_sequence);
> > +     } else {
> > +             dev_err(&partner->dev, "%s mode entry failed: %pe\n",
> > +                     mode_names[ms->mode], ERR_PTR(ms->result));
>
> What can a user do with this error message?
>

All prints will be removed.

> > +
> > +             if (ms->result !=3D -EBUSY ||
> > +                     ms->attempt_count >=3D mode_selection_entry_attem=
pts)
> > +                     ms->enter =3D false;
> > +     }
> > +
> > +     if (!kfifo_is_empty(&partner->mode_sequence))
> > +             schedule_delayed_work(&partner->mode_selection_work,
> > +                     msecs_to_jiffies(mode_selection_delay));
> > +}
> > +
> > +static void mode_selection_complete(struct typec_partner *partner,
> > +                             const int mode, const int result)
> > +{
> > +     struct mode_selection_state *ms;
> > +
> > +     mutex_lock(&partner->mode_sequence_lock);
>
> You use a lock here, but not in the function above? Why?
>

`mode_sequence_lock` mutex protects `mode_sequence` kfifo state. It
should be locked before kfifo_peek()

> > +     if (kfifo_peek(&partner->mode_sequence, &ms)) {
> > +             if (ms->mode =3D=3D mode) {
> > +                     ms->result =3D result;
> > +                     cancel_delayed_work(&partner->mode_selection_work=
);
> > +                     mode_selection_next(partner, ms);
>
> Ah, you need to have the lock held, you didn't document that in text or
> in a way the compiler can verify/check it :(
>
>

It is a good case for __must_hold macro. Thanks

> > +             }
> > +     }
> > +     mutex_unlock(&partner->mode_sequence_lock);
> > +}
> > +
> > +void typec_mode_selection_altmode_complete(struct typec_altmode *alt,
> > +                             const int result)
> > +{
> > +     mode_selection_complete(to_typec_partner(alt->dev.parent),
> > +             typec_svid_to_altmode(alt->svid), result);
> > +}
> > +EXPORT_SYMBOL_GPL(typec_mode_selection_altmode_complete);
> > +
> > +void typec_mode_selection_usb4_complete(struct typec_partner *partner,
> > +                             const int result)
> > +{
> > +     mode_selection_complete(partner, TYPEC_USB4_MODE, result);
> > +}
> > +EXPORT_SYMBOL_GPL(typec_mode_selection_usb4_complete);
> > +
> > +static void mode_selection_activate_usb4_mode(struct typec_partner *pa=
rtner,
> > +     struct mode_selection_state *ms)
> > +{
> > +     struct typec_port *port =3D to_typec_port(partner->dev.parent);
> > +     int result =3D -EOPNOTSUPP;
> > +
> > +     if (port->ops && port->ops->enter_usb_mode) {
> > +             if (ms->enter && port->usb_mode !=3D USB_MODE_USB4)
> > +                     result =3D -EPERM;
> > +             else
> > +                     result =3D port->ops->enter_usb_mode(port,
> > +                             ms->enter ? USB_MODE_USB4 : USB_MODE_USB3=
);
> > +     }
> > +
> > +     if (ms->enter)
> > +             ms->result =3D result;
> > +}
> > +
> > +static int mode_selection_activate_altmode(struct device *dev, void *d=
ata)
> > +{
> > +     struct typec_altmode *alt =3D to_typec_altmode(dev);
> > +     struct mode_selection_state *ms =3D (struct mode_selection_state =
*)data;
> > +     int result =3D -ENODEV;
> > +
> > +     if (!strcmp(dev->type->name, ALTERNATE_MODE_DEVICE_TYPE_NAME)) {
> > +             if (ms->mode =3D=3D typec_svid_to_altmode(alt->svid)) {
> > +                     if (alt->ops && alt->ops->activate)
> > +                             result =3D alt->ops->activate(alt, ms->en=
ter ? 1 : 0);
> > +                     else
> > +                             result =3D -EOPNOTSUPP;
> > +             }
> > +     }
> > +
> > +     if (ms->enter)
> > +             ms->result =3D result;
> > +
> > +     return result =3D=3D -ENODEV ? 0 : 1;
> > +}
> > +
> > +static void mode_selection_activate_mode(struct typec_partner *partner=
,
> > +     struct mode_selection_state *ms)
> > +{
> > +     dev_info(&partner->dev, "%s %s mode\n",
> > +             ms->enter ? "Enter" : "Exit", mode_names[ms->mode]);
>
> Again, please remove debugging code.
>
> When drivers work properly, they are quiet.
>
> And this really is the only valid use for ? : around, so that's ok here :=
)
>

Sadly, the only good case will be removed :)

> > +void typec_mode_selection_add_cable(struct typec_partner *partner,
> > +             struct typec_cable *cable)
> > +{
> > +     const u32 id_header =3D cable->identity->id_header;
> > +     const u32 vdo1 =3D cable->identity->vdo[0];
> > +     const u32 type =3D PD_IDH_PTYPE(id_header);
> > +     const u32 speed =3D VDO_TYPEC_CABLE_SPEED(vdo1);
> > +     bool capability[] =3D {
> > +             [TYPEC_DP_ALTMODE] =3D true,
> > +             [TYPEC_TBT_ALTMODE] =3D false,
> > +             [TYPEC_USB4_MODE] =3D false,
> > +     };
>
> Why are these the default capabilities?  Where is that documented?  Why
> these specific values to start with?
>

These values are currently utilized in ChromeOS when VDO is 0 and the
cable is neither passive nor active. This unfortunately includes some USB
dongles with DisplayPort support. I will document this behavior.

Thanks for the review!
Andrei

> thanks,
>
> greg k-h

