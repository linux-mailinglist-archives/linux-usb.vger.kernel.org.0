Return-Path: <linux-usb+bounces-18005-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6979E09F9
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 18:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8E26B48097
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 15:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65BE20899B;
	Mon,  2 Dec 2024 15:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dhRrVLuJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5062E208993
	for <linux-usb@vger.kernel.org>; Mon,  2 Dec 2024 15:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733153710; cv=none; b=GvxHS3QF7jh9zQmB/gvFWB62qNPbEvTUfCtzYRI2E75x1Nxyda4ChrhK94CbpFEzGrmHqYCi4ODn/r69ags65BxD5DKpOwhAdLFtElBnkmP9c75Q37/u+lUTKoLDqvVHDBV6gHo03FZASVBivW+xAYxwlkbc/p4C1Ov3Zx0wdfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733153710; c=relaxed/simple;
	bh=wET5iUvdjdRBR+mAqN2BzzvlWPpGl4352cNBjiC+WwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMTqO53RW6Z3vH03v93FD9mh0SEA0jDJQsryVJYbeERqYW8JMVADTnCsU+y8eWNhXECyRd6Pdio8mQV8Hw/d3gszG8T1N1BXACe2GVai23DcCAwve6WuPj+pJDyfCxRGTB7BXFFh5BdGeOolZDHtaWIF2rcmgioHSJ/2y4BV+A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dhRrVLuJ; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffc86948dcso43843781fa.2
        for <linux-usb@vger.kernel.org>; Mon, 02 Dec 2024 07:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733153706; x=1733758506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTNygzoOaggPdN5UwohHlIdEXipF1yLKnsPhAigGFzk=;
        b=dhRrVLuJg6V5SNjB+Nxt8gwl1XfcpJhdZcgiCa8ab/58WG5vAn9NlR0e80z7DF4Xn9
         aWHNY1yfs/BwoVoUWSNamaIEoM8ih4Yzho4nizXAw89qng+feC6cDd81ycQLBlXAxPR7
         cGXtUl/aXfLcEiEdCe19fhSFvwnpkflCdxXOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153706; x=1733758506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTNygzoOaggPdN5UwohHlIdEXipF1yLKnsPhAigGFzk=;
        b=bBNsrvNBG1C8hVjXd8o8Kx+VztyvwU5tWyojUJnB5BhBdV5A9BpzUG6zRFMADsitCV
         YVHTDlfsovKXYNrHvqYA8hOLjWa5s3L2HhVLK252KRoVHEhEyH/SgDqhGIk9rdlKsVbd
         jPIfOqiVPPJB6ZdAWu95RgxymZ1/Pzv3Qdxci879zHXltQxWV4GjuZfXMgfApdWbR94g
         rVAzM7f5p3Vqe5gp0LJQpoSwkaQW1dMo4CfcsUayU/p4LE5EKReM87KNa/iyhdQg9pqY
         IG8aErGYbRy1PmHuQCWkAaU9USExuCLLIckiSgV+jNAyASf0Z/0cAmQe0NB/FKqRRx9t
         Saug==
X-Forwarded-Encrypted: i=1; AJvYcCUR5bdd4jFMDJMncZxsk2a99M0uPYp7J0hBJMxOn7hBs+RzOwrcowNAR16BfynF5T6Zoe9+XI8V9Ds=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsas5+qLdGCAELL7mHMNRPXuSIdYnWBDwe07fq1iJt3nSbJ0+f
	3e/RAdqmIl1oT7QUENKo6PaT6YU5hXuZ7tNqSZZtInuaUUGKwxePR4wkh6eN4fF7KJx96Ym6LGM
	0zyvk1isEK8lNEr4iuDWe+Mp61MypZczAVE0=
X-Gm-Gg: ASbGnculAazluRsFli1B2lDFeY6/eBYkQS7ga4I2HVyz3xdp6jFu7ZtdMHJSOnmuPIk
	luhQHnLGBossAT1+lJ5iaCNf+01y7rn8RhYyS2B+2zlZf39+K2I4rcOQ7hbU=
X-Google-Smtp-Source: AGHT+IFho6OCDoejpt8T1j/LPhusZpc57QvNJuFpM3qw8J9ipJ/39T9tYhrHkiywnuBcmRC7AjGn+JFtfWTKEXFxY1E=
X-Received: by 2002:a05:651c:19aa:b0:2ff:afef:3ec5 with SMTP id
 38308e7fff4ca-2ffd60de30bmr118782021fa.27.1733153706401; Mon, 02 Dec 2024
 07:35:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128232035.1525978-1-ukaszb@chromium.org> <20241128232035.1525978-4-ukaszb@chromium.org>
 <Z02-57oN7h_E1VQ1@kuha.fi.intel.com>
In-Reply-To: <Z02-57oN7h_E1VQ1@kuha.fi.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Mon, 2 Dec 2024 16:34:55 +0100
Message-ID: <CALwA+NbCupB-N8j1-a96EJPimd1VpLfH8tAYKbE1j+RC_J0q4g@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] usb: typec: cros_ec_ucsi: Recover from write timeouts
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 3:06=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi =C5=81ukasz,
>
> On Thu, Nov 28, 2024 at 11:20:35PM +0000, =C5=81ukasz Bartosik wrote:
> > From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> >
> > In a suspend-resume edge case, the OPM is timing out in ucsi_resume and
> > the PPM is getting stuck waiting for a command complete ack. Add a writ=
e
> > timeout recovery task that will get us out of this state.
>
> Sorry, I did not realise this before, but this is in practice a fix
> (or workaround) to the driver that you just introduced in the previous
> patch. Please merge it into that.
>

Hi Heikki,

Yes I will merge it. I deliberately sent it as a separate commit for
review so that
it would be easier to see the changes.

> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 88 ++++++++++++++++++++++++++-
> >  1 file changed, 87 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/=
ucsi/cros_ec_ucsi.c
> > index c588d9a57643..6daf61e7e62a 100644
> > --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > @@ -7,6 +7,7 @@
> >
> >  #include <linux/container_of.h>
> >  #include <linux/dev_printk.h>
> > +#include <linux/jiffies.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_data/cros_ec_commands.h>
> > @@ -29,6 +30,9 @@
> >   */
> >  #define WRITE_TMO_MS         5000
> >
> > +/* Number of times to attempt recovery from a write timeout before giv=
ing up. */
> > +#define WRITE_TMO_CTR_MAX    5
> > +
> >  struct cros_ucsi_data {
> >       struct device *dev;
> >       struct ucsi *ucsi;
> > @@ -36,6 +40,8 @@ struct cros_ucsi_data {
> >       struct cros_ec_device *ec;
> >       struct notifier_block nb;
> >       struct work_struct work;
> > +     struct delayed_work write_tmo;
> > +     int tmo_counter;
> >
> >       struct completion complete;
> >       unsigned long flags;
> > @@ -99,12 +105,43 @@ static int cros_ucsi_async_control(struct ucsi *uc=
si, u64 cmd)
> >       return 0;
> >  }
> >
> > +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> > +{
> > +     struct cros_ucsi_data *udata =3D ucsi_get_drvdata(ucsi);
> > +     int ret;
> > +
> > +     ret =3D ucsi_sync_control_common(ucsi, cmd);
> > +     if (ret)
> > +             goto out;
> > +
> > +     /* Successful write. Cancel any pending recovery work. */
> > +     cancel_delayed_work_sync(&udata->write_tmo);
> > +
> > +     return 0;
> > +out:
>
> This label looks a bit unnecessary to me. How about a switch statement?
>

Good point. I will rework this part of the code to use switch.

Thanks,
=C5=81ukasz

>         ret =3D ucsi_sync_control_common(ucsi, cmd);
>         switch (ret) {
>         case -EBUSY:
>         case -ETIMEDOUT:
>                 cancel_delayed_work_sync(&udata->write_tmo);
>                 schedule_delayed_work(&udata->write_tmo, msecs_to_jiffies=
(WRITE_TMO_MS));
>                 break;
>         case 0:
>                 cancel_delayed_work_sync(&udata->write_tmo);
>                 break;
>         }
>
>         return ret;
>
> > +     /* EC may return -EBUSY if CCI.busy is set. Convert this to a tim=
eout.
> > +      */
> > +     if (ret =3D=3D -EBUSY)
> > +             ret =3D -ETIMEDOUT;
> > +
> > +     /* Schedule recovery attempt when we timeout or tried to send a c=
ommand
> > +      * while still busy.
> > +      */
> > +     if (ret =3D=3D -ETIMEDOUT) {
> > +             cancel_delayed_work_sync(&udata->write_tmo);
> > +             schedule_delayed_work(&udata->write_tmo,
> > +                                   msecs_to_jiffies(WRITE_TMO_MS));
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> >  struct ucsi_operations cros_ucsi_ops =3D {
> >       .read_version =3D cros_ucsi_read_version,
> >       .read_cci =3D cros_ucsi_read_cci,
> >       .read_message_in =3D cros_ucsi_read_message_in,
> >       .async_control =3D cros_ucsi_async_control,
> > -     .sync_control =3D ucsi_sync_control_common,
> > +     .sync_control =3D cros_ucsi_sync_control,
> >  };
> >
> >  static void cros_ucsi_work(struct work_struct *work)
> > @@ -118,6 +155,54 @@ static void cros_ucsi_work(struct work_struct *wor=
k)
> >       ucsi_notify_common(udata->ucsi, cci);
> >  }
> >
> > +static void cros_ucsi_write_timeout(struct work_struct *work)
> > +{
> > +     struct cros_ucsi_data *udata =3D
> > +             container_of(work, struct cros_ucsi_data, write_tmo.work)=
;
> > +     u32 cci;
> > +     u64 cmd;
> > +
> > +     if (cros_ucsi_read(udata->ucsi, UCSI_CCI, &cci, sizeof(cci))) {
> > +             dev_err(udata->dev,
> > +                     "Reading CCI failed; no write timeout recovery po=
ssible.");
> > +             return;
> > +     }
> > +
> > +     if (cci & UCSI_CCI_BUSY) {
> > +             udata->tmo_counter++;
> > +
> > +             if (udata->tmo_counter <=3D WRITE_TMO_CTR_MAX)
> > +                     schedule_delayed_work(&udata->write_tmo,
> > +                                           msecs_to_jiffies(WRITE_TMO_=
MS));
> > +             else
> > +                     dev_err(udata->dev,
> > +                             "PPM unresponsive - too many write timeou=
ts.");
> > +
> > +             return;
> > +     }
> > +
> > +     /* No longer busy means we can reset our timeout counter. */
> > +     udata->tmo_counter =3D 0;
> > +
> > +     /* Need to ack previous command which may have timed out. */
> > +     if (cci & UCSI_CCI_COMMAND_COMPLETE) {
> > +             cmd =3D UCSI_ACK_CC_CI | UCSI_ACK_COMMAND_COMPLETE;
> > +             cros_ucsi_async_control(udata->ucsi, &cmd);
> > +
> > +             /* Check again after a few seconds that the system has
> > +              * recovered to make sure our async write above was succe=
ssful.
> > +              */
> > +             schedule_delayed_work(&udata->write_tmo,
> > +                                   msecs_to_jiffies(WRITE_TMO_MS));
> > +             return;
> > +     }
> > +
> > +     /* We recovered from a previous timeout. Treat this as a recovery=
 from
> > +      * suspend and call resume.
> > +      */
> > +     ucsi_resume(udata->ucsi);
> > +}
> > +
> >  static int cros_ucsi_event(struct notifier_block *nb,
> >                          unsigned long host_event, void *_notify)
> >  {
> > @@ -162,6 +247,7 @@ static int cros_ucsi_probe(struct platform_device *=
pdev)
> >       platform_set_drvdata(pdev, udata);
> >
> >       INIT_WORK(&udata->work, cros_ucsi_work);
> > +     INIT_DELAYED_WORK(&udata->write_tmo, cros_ucsi_write_timeout);
> >       init_completion(&udata->complete);
> >
> >       udata->ucsi =3D ucsi_create(dev, &cros_ucsi_ops);
>
> thanks,
>
> --
> heikki

