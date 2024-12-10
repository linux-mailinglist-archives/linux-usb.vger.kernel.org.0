Return-Path: <linux-usb+bounces-18285-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B879EAE17
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2024 11:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E15F188958E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2024 10:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B111DC9A9;
	Tue, 10 Dec 2024 10:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T/XzY4rc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1FA199E84
	for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2024 10:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733826970; cv=none; b=aNNJRNcESs4pYDrjH8ZqevIBUpsa/POusuReqO+gDQ2Z3skhEdlMAg9bL+SI0K95x9hHy81qfP7LzDQ80R12RaWcuEq3E4hfb3+U66/n6HWs9w0BucJiMpa4eo5pwkItPE7kOjsBpvmJQK9yHbl1dEPtu2Z0zgkjSgpk5muRlp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733826970; c=relaxed/simple;
	bh=YD4DPyt77vM5kpEyoMHScyBM2DsqlsK7weUQ83fXJPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/bqppLg1GzRGQ867xu0eThQdRcLVgSiW96b/M6Ri5Lhp8VUYeIpiuWNBtqz65xXFf0KypPadnVOkDZ+baELSGyNcl8xfjqhw7JoywiK4yNRYvBDDNSzWKZGzUfZuzoq4FAm+qCOUzE/mc55/9ynD9jIigMuEHd6NOfbu5zmGgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T/XzY4rc; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ff976ab0edso51427381fa.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2024 02:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733826967; x=1734431767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBjd/GdRJ3YYowPtUfDCPBoNnQF+ifMRJipY4XKeceY=;
        b=T/XzY4rczZqOLBAMKhqkDbEuQHOTft/5BqYgJseflzzTmFF9xzV9fkymY+CuX4qMOM
         A54SBPj93GIK6szSAnxB927KHVHobIrPEhguwXrrRfGbmSi6OtS1BWQ2AmeakS5FEgH6
         0/3KVr+vIGTlCVGAojxMFtDobXcmfA3+slBSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733826967; x=1734431767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBjd/GdRJ3YYowPtUfDCPBoNnQF+ifMRJipY4XKeceY=;
        b=eCRUjwgI7LkaH+An6O9m/SMZ6H6GUvTwOGkkWXBP53CpQZ7PL93T/ySMYndi+MzRiW
         nbHexv8zT71l5lOKmZbrTRdzwoXtM0uX9tQJlSAs9A8SvnlVJ3cCu5Gh3UOppivIIlfh
         ngI3/CmERBNguJiYKD5o+kssxz/shU4Zx1MEjGr9Nu/Q/PE6soLHCFWJAmtpC5eYvu4t
         dbZd5mlqjFXR8tgTKhqmMjgJU5cClP7I5zu3fB9KaM9AYJMYTza2ZVLEwqaZidVvcJG3
         D2ZTkWGc+TZXNR3I8Ra/+vgXXwOz2hksSLj7/ZZCNhUsZVzLgzIrNZKJ5/dXriTvCTD0
         OgIA==
X-Forwarded-Encrypted: i=1; AJvYcCXz784sBq1apxCegXn0NjNH3RDnlImO2CUzviemqoCe4IcTI6y6V+0GZMiX37KzDJNSlB6D7h5ht64=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoJQq0DpBrOzEvIXSH4EI10I2+s72FychBmTfiGIsUQD4lGxQM
	Lf1cSVk/s67CDGzdHxeYmk+RrHoULqvPDj0t5wLTxse5kwJqWq9B3TrzIl85jdgMPYD6YyIg2zO
	XfDXGBU8HCqs696zHWnUnWHs8DDWYPwuO/lU=
X-Gm-Gg: ASbGncs8X+idTBVzsMKhZlOL5ytDR04Ni7FmJ32wJw4M8BZsxiIpxnRnuMU0cD2qkBN
	7firwNGGXXqzrj/O+uO9fYFzYe0tFw9baC9h4H6QWWvsW7aDoqSUWSZ7P5mbuvU8=
X-Google-Smtp-Source: AGHT+IGhhDQa8q/vGS7A5wcHx+Znt/cqjXkPygqO/ypJR5fAvdJe/Be8Rw1cqGp598vMAg/fm+hf+JpWOK5lISOUGUw=
X-Received: by 2002:a05:651c:b29:b0:2fb:5f9d:c284 with SMTP id
 38308e7fff4ca-3002f8e7df4mr68507181fa.16.1733826966648; Tue, 10 Dec 2024
 02:36:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204194900.371696-1-ukaszb@chromium.org> <20241204194900.371696-3-ukaszb@chromium.org>
 <CANFp7mU6__K9fve_PDac4KbVTs3cfzvc53aG1oOBt+Q2k7fJWg@mail.gmail.com>
In-Reply-To: <CANFp7mU6__K9fve_PDac4KbVTs3cfzvc53aG1oOBt+Q2k7fJWg@mail.gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Tue, 10 Dec 2024 11:35:55 +0100
Message-ID: <CALwA+NZ3ZBcYmi8Ay6SN1ruvKUvHEgPBFj9uP5p_+SdOjtPGPw@mail.gmail.com>
Subject: Re: [PATCH v10 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 5:48=E2=80=AFPM Abhishek Pandit-Subedi
<abhishekpandit@chromium.org> wrote:
>
> On Wed, Dec 4, 2024 at 11:49=E2=80=AFAM =C5=81ukasz Bartosik <ukaszb@chro=
mium.org> wrote:
> >
> > From: Pavan Holla <pholla@chromium.org>
> >
> > Implementation of a UCSI transport driver for ChromeOS.
> > This driver will be loaded if the ChromeOS EC implements a PPM.
> >
> > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  MAINTAINERS                           |   7 +
> >  drivers/usb/typec/ucsi/Kconfig        |  13 +
> >  drivers/usb/typec/ucsi/Makefile       |   1 +
> >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 337 ++++++++++++++++++++++++++
> >  4 files changed, 358 insertions(+)
> >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1e930c7a58b1..36eebe1ad078 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5452,6 +5452,13 @@ L:       chrome-platform@lists.linux.dev
> >  S:     Maintained
> >  F:     drivers/watchdog/cros_ec_wdt.c
> >
> > +CHROMEOS UCSI DRIVER
> > +M:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > +M:     =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > +L:     chrome-platform@lists.linux.dev
> > +S:     Maintained
> > +F:     drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > +
> >  CHRONTEL CH7322 CEC DRIVER
> >  M:     Joe Tessler <jrt@google.com>
> >  L:     linux-media@vger.kernel.org
> > diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kc=
onfig
> > index 680e1b87b152..75559601fe8f 100644
> > --- a/drivers/usb/typec/ucsi/Kconfig
> > +++ b/drivers/usb/typec/ucsi/Kconfig
> > @@ -69,6 +69,19 @@ config UCSI_PMIC_GLINK
> >           To compile the driver as a module, choose M here: the module =
will be
> >           called ucsi_glink.
> >
> > +config CROS_EC_UCSI
> > +       tristate "UCSI Driver for ChromeOS EC"
> > +       depends on MFD_CROS_EC_DEV
> > +       depends on CROS_USBPD_NOTIFY
> > +       depends on !EXTCON_TCSS_CROS_EC
> > +       default MFD_CROS_EC_DEV
> > +       help
> > +         This driver enables UCSI support for a ChromeOS EC. The EC is
> > +         expected to implement a PPM.
> > +
> > +         To compile the driver as a module, choose M here: the module
> > +         will be called cros_ec_ucsi.
> > +
> >  config UCSI_LENOVO_YOGA_C630
> >         tristate "UCSI Interface Driver for Lenovo Yoga C630"
> >         depends on EC_LENOVO_YOGA_C630
> > diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/M=
akefile
> > index aed41d23887b..be98a879104d 100644
> > --- a/drivers/usb/typec/ucsi/Makefile
> > +++ b/drivers/usb/typec/ucsi/Makefile
> > @@ -21,4 +21,5 @@ obj-$(CONFIG_UCSI_ACPI)                       +=3D uc=
si_acpi.o
> >  obj-$(CONFIG_UCSI_CCG)                 +=3D ucsi_ccg.o
> >  obj-$(CONFIG_UCSI_STM32G0)             +=3D ucsi_stm32g0.o
> >  obj-$(CONFIG_UCSI_PMIC_GLINK)          +=3D ucsi_glink.o
> > +obj-$(CONFIG_CROS_EC_UCSI)             +=3D cros_ec_ucsi.o
> >  obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)    +=3D ucsi_yoga_c630.o
> > diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/=
ucsi/cros_ec_ucsi.c
> > new file mode 100644
> > index 000000000000..cd2231d6a0ea
> > --- /dev/null
> > +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > @@ -0,0 +1,337 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * UCSI driver for ChromeOS EC
> > + *
> > + * Copyright 2024 Google LLC.
> > + */
> > +
> > +#include <linux/container_of.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_data/cros_ec_commands.h>
> > +#include <linux/platform_data/cros_usbpd_notify.h>
> > +#include <linux/platform_data/cros_ec_proto.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <linux/wait.h>
> > +
> > +#include "ucsi.h"
> > +
> > +/*
> > + * Maximum size in bytes of a UCSI message between AP and EC
> > + */
> > +#define MAX_EC_DATA_SIZE       256
> > +
> > +/*
> > + * Maximum time in milliseconds the cros_ec_ucsi driver
> > + * will wait for a response to a command or and ack.
> > + */
> > +#define WRITE_TMO_MS           5000
> > +
> > +/* Number of times to attempt recovery from a write timeout before giv=
ing up. */
> > +#define WRITE_TMO_CTR_MAX      5
> > +
> > +struct cros_ucsi_data {
> > +       struct device *dev;
> > +       struct ucsi *ucsi;
> > +
> > +       struct cros_ec_device *ec;
> > +       struct notifier_block nb;
> > +       struct work_struct work;
> > +       struct delayed_work write_tmo;
> > +       int tmo_counter;
> > +
> > +       struct completion complete;
> > +       unsigned long flags;
> > +};
> > +
> > +static int cros_ucsi_read(struct ucsi *ucsi, unsigned int offset, void=
 *val,
> > +                         size_t val_len)
> > +{
> > +       struct cros_ucsi_data *udata =3D ucsi_get_drvdata(ucsi);
> > +       struct ec_params_ucsi_ppm_get req =3D {
> > +               .offset =3D offset,
> > +               .size =3D val_len,
> > +       };
> > +       int ret;
> > +
> > +       if (val_len > MAX_EC_DATA_SIZE) {
> > +               dev_err(udata->dev, "Can't read %zu bytes. Too big.", v=
al_len);
> > +               return -EINVAL;
> > +       }
> > +
> > +       ret =3D cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_GET,
> > +                         &req, sizeof(req), val, val_len);
> > +       if (ret < 0) {
> > +               dev_warn(udata->dev, "Failed to send EC message UCSI_PP=
M_GET: error=3D%d", ret);
> > +               return ret;
> > +       }
> > +       return 0;
> > +}
> > +
> > +static int cros_ucsi_read_version(struct ucsi *ucsi, u16 *version)
> > +{
> > +       return cros_ucsi_read(ucsi, UCSI_VERSION, version, sizeof(*vers=
ion));
> > +}
> > +
> > +static int cros_ucsi_read_cci(struct ucsi *ucsi, u32 *cci)
> > +{
> > +       return cros_ucsi_read(ucsi, UCSI_CCI, cci, sizeof(*cci));
> > +}
> > +
> > +static int cros_ucsi_read_message_in(struct ucsi *ucsi, void *val,
> > +                                    size_t val_len)
> > +{
> > +       return cros_ucsi_read(ucsi, UCSI_MESSAGE_IN, val, val_len);
> > +}
> > +
> > +static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
> > +{
> > +       struct cros_ucsi_data *udata =3D ucsi_get_drvdata(ucsi);
> > +       u8 ec_buf[sizeof(struct ec_params_ucsi_ppm_set) + sizeof(cmd)];
> > +       struct ec_params_ucsi_ppm_set *req =3D (struct ec_params_ucsi_p=
pm_set *) ec_buf;
> > +       int ret;
> > +
> > +       req->offset =3D UCSI_CONTROL;
> > +       memcpy(req->data, &cmd, sizeof(cmd));
> > +       ret =3D cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_SET,
> > +                         req, sizeof(ec_buf), NULL, 0);
> > +       if (ret < 0) {
> > +               dev_warn(udata->dev, "Failed to send EC message UCSI_PP=
M_SET: error=3D%d", ret);
> > +               return ret;
> > +       }
> > +       return 0;
> > +}
> > +
> > +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> > +{
> > +       struct cros_ucsi_data *udata =3D ucsi_get_drvdata(ucsi);
> > +       int ret;
> > +
> > +       ret =3D ucsi_sync_control_common(ucsi, cmd);
> > +       switch (ret) {
> > +       case -EBUSY:
> > +               /* EC may return -EBUSY if CCI.busy is set.
> > +                * Convert this to a timeout.
> > +                */
> > +       case -ETIMEDOUT:
> > +               /* Schedule recovery attempt when we timeout
> > +                * or tried to send a command while still busy.
> > +                */
> > +               cancel_delayed_work_sync(&udata->write_tmo);
> > +               schedule_delayed_work(&udata->write_tmo,
> > +                                     msecs_to_jiffies(WRITE_TMO_MS));
> > +               break;
> > +       case 0:
> > +               /* Successful write. Cancel any pending recovery work. =
*/
> > +               cancel_delayed_work_sync(&udata->write_tmo);
> > +               break;
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> > +struct ucsi_operations cros_ucsi_ops =3D {
> > +       .read_version =3D cros_ucsi_read_version,
> > +       .read_cci =3D cros_ucsi_read_cci,
> > +       .read_message_in =3D cros_ucsi_read_message_in,
> > +       .async_control =3D cros_ucsi_async_control,
> > +       .sync_control =3D cros_ucsi_sync_control,
> > +};
> > +
> > +static void cros_ucsi_work(struct work_struct *work)
> > +{
> > +       struct cros_ucsi_data *udata =3D container_of(work, struct cros=
_ucsi_data, work);
> > +       u32 cci;
> > +
> > +       if (cros_ucsi_read_cci(udata->ucsi, &cci))
> > +               return;
> > +
> > +       ucsi_notify_common(udata->ucsi, cci);
> > +}
> > +
> > +static void cros_ucsi_write_timeout(struct work_struct *work)
> > +{
> > +       struct cros_ucsi_data *udata =3D
> > +               container_of(work, struct cros_ucsi_data, write_tmo.wor=
k);
> > +       u32 cci;
> > +       u64 cmd;
> > +
> > +       if (cros_ucsi_read(udata->ucsi, UCSI_CCI, &cci, sizeof(cci))) {
> > +               dev_err(udata->dev,
> > +                       "Reading CCI failed; no write timeout recovery =
possible.");
> > +               return;
> > +       }
> > +
> > +       if (cci & UCSI_CCI_BUSY) {
> > +               udata->tmo_counter++;
> > +
> > +               if (udata->tmo_counter <=3D WRITE_TMO_CTR_MAX)
> > +                       schedule_delayed_work(&udata->write_tmo,
> > +                                             msecs_to_jiffies(WRITE_TM=
O_MS));
> > +               else
> > +                       dev_err(udata->dev,
> > +                               "PPM unresponsive - too many write time=
outs.");
> > +
> > +               return;
> > +       }
> > +
> > +       /* No longer busy means we can reset our timeout counter. */
> > +       udata->tmo_counter =3D 0;
> > +
> > +       /* Need to ack previous command which may have timed out. */
> > +       if (cci & UCSI_CCI_COMMAND_COMPLETE) {
> > +               cmd =3D UCSI_ACK_CC_CI | UCSI_ACK_COMMAND_COMPLETE;
> > +               cros_ucsi_async_control(udata->ucsi, &cmd);
> > +
> > +               /* Check again after a few seconds that the system has
> > +                * recovered to make sure our async write above was suc=
cessful.
> > +                */
> > +               schedule_delayed_work(&udata->write_tmo,
> > +                                     msecs_to_jiffies(WRITE_TMO_MS));
> > +               return;
> > +       }
> > +
> > +       /* We recovered from a previous timeout. Treat this as a recove=
ry from
> > +        * suspend and call resume.
> > +        */
> > +       ucsi_resume(udata->ucsi);
> > +}
> > +
> > +static int cros_ucsi_event(struct notifier_block *nb,
> > +                          unsigned long host_event, void *_notify)
> > +{
> > +       struct cros_ucsi_data *udata =3D container_of(nb, struct cros_u=
csi_data, nb);
> > +
> > +       if (!(host_event & PD_EVENT_PPM))
> > +               return NOTIFY_OK;
> > +
> > +       dev_dbg(udata->dev, "UCSI notification received");
> > +       flush_work(&udata->work);
> > +       schedule_work(&udata->work);
> > +
> > +       return NOTIFY_OK;
> > +}
> > +
> > +static void cros_ucsi_destroy(struct cros_ucsi_data *udata)
> > +{
> > +       cros_usbpd_unregister_notify(&udata->nb);
> > +       cancel_delayed_work(&udata->write_tmo);
>
> Prefer cancel_delayed_work_sync.
>
> > +       cancel_work_sync(&udata->work);
> > +       ucsi_destroy(udata->ucsi);
> > +}
> > +
> > +static int cros_ucsi_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev =3D &pdev->dev;
> > +       struct cros_ec_dev *ec_data =3D dev_get_drvdata(dev->parent);
> > +       struct cros_ucsi_data *udata;
> > +       int ret;
> > +
> > +       udata =3D devm_kzalloc(dev, sizeof(*udata), GFP_KERNEL);
> > +       if (!udata)
> > +               return -ENOMEM;
> > +
> > +       udata->dev =3D dev;
> > +
> > +       udata->ec =3D ec_data->ec_dev;
> > +       if (!udata->ec) {
> > +               dev_err(dev, "couldn't find parent EC device");
> > +               return -ENODEV;
> > +       }
> > +
> > +       platform_set_drvdata(pdev, udata);
> > +
> > +       INIT_WORK(&udata->work, cros_ucsi_work);
> > +       INIT_DELAYED_WORK(&udata->write_tmo, cros_ucsi_write_timeout);
> > +       init_completion(&udata->complete);
> > +
> > +       udata->ucsi =3D ucsi_create(dev, &cros_ucsi_ops);
> > +       if (IS_ERR(udata->ucsi)) {
> > +               dev_err(dev, "failed to allocate UCSI instance");
> > +               return PTR_ERR(udata->ucsi);
> > +       }
> > +
> > +       ucsi_set_drvdata(udata->ucsi, udata);
> > +
> > +       udata->nb.notifier_call =3D cros_ucsi_event;
> > +       ret =3D cros_usbpd_register_notify(&udata->nb);
> > +       if (ret) {
> > +               dev_err(dev, "failed to register notifier: error=3D%d",=
 ret);
> > +               ucsi_destroy(udata->ucsi);
> > +               return ret;
> > +       }
> > +
> > +       ret =3D ucsi_register(udata->ucsi);
> > +       if (ret) {
> > +               dev_err(dev, "failed to register UCSI: error=3D%d", ret=
);
> > +               cros_ucsi_destroy(udata);
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static void cros_ucsi_remove(struct platform_device *dev)
> > +{
> > +       struct cros_ucsi_data *udata =3D platform_get_drvdata(dev);
> > +
> > +       ucsi_unregister(udata->ucsi);
> > +       cros_ucsi_destroy(udata);
> > +}
> > +
> > +static int __maybe_unused cros_ucsi_suspend(struct device *dev)
> > +{
> > +       struct cros_ucsi_data *udata =3D dev_get_drvdata(dev);
> > +
> > +       cancel_delayed_work(&udata->write_tmo);
>
> This should probably be cancel_delayed_work_sync. Otherwise, the
> writes coming from that work item may cause an interrupt after this
> suspend method completes.
>

You're right. I need to send the next patchset version then.
Stay tuned ;).

Thanks,
Lukasz

> > +       cancel_work_sync(&udata->work);
> > +
> > +       return 0;
> > +}
> > +
> > +static void __maybe_unused cros_ucsi_complete(struct device *dev)
> > +{
> > +       struct cros_ucsi_data *udata =3D dev_get_drvdata(dev);
> > +
> > +       ucsi_resume(udata->ucsi);
> > +}
> > +
> > +/*
> > + * UCSI protocol is also used on ChromeOS platforms which reply on
> > + * cros_ec_lpc.c driver for communication with embedded controller (EC=
).
> > + * On such platforms communication with the EC is not available until
> > + * the .complete() callback of the cros_ec_lpc driver is executed.
> > + * For this reason we delay ucsi_resume() until the .complete() stage
> > + * otherwise UCSI SET_NOTIFICATION_ENABLE command will fail and we won=
't
> > + * receive any UCSI notifications from the EC where PPM is implemented=
.
> > + */
> > +static const struct dev_pm_ops cros_ucsi_pm_ops =3D {
> > +#ifdef CONFIG_PM_SLEEP
> > +       .suspend =3D cros_ucsi_suspend,
> > +       .complete =3D cros_ucsi_complete,
> > +#endif
> > +};
> > +
> > +static const struct platform_device_id cros_ucsi_id[] =3D {
> > +       { KBUILD_MODNAME, 0 },
> > +       {}
> > +};
> > +MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
> > +
> > +static struct platform_driver cros_ucsi_driver =3D {
> > +       .driver =3D {
> > +               .name =3D KBUILD_MODNAME,
> > +               .pm =3D &cros_ucsi_pm_ops,
> > +       },
> > +       .id_table =3D cros_ucsi_id,
> > +       .probe =3D cros_ucsi_probe,
> > +       .remove =3D cros_ucsi_remove,
> > +};
> > +
> > +module_platform_driver(cros_ucsi_driver);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("UCSI driver for ChromeOS EC");
> > --
> > 2.47.0.338.g60cca15819-goog
> >

