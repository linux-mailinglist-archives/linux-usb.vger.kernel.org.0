Return-Path: <linux-usb+bounces-15116-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E227F979367
	for <lists+linux-usb@lfdr.de>; Sat, 14 Sep 2024 23:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FB3D2839D2
	for <lists+linux-usb@lfdr.de>; Sat, 14 Sep 2024 21:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AA713A868;
	Sat, 14 Sep 2024 21:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YlxcgQCF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C9B12C465
	for <linux-usb@vger.kernel.org>; Sat, 14 Sep 2024 21:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726350792; cv=none; b=EWwfAcwYrEI/9Uc0/+3bzTdgUSUppXsLzmC50e0r54KKCIcMXO3URRUKDYnQjnFqjGuUC60X5y6qwTdkfceK6eyQ3Hc4Ax7m5M5M2haTds4uEewkLMIULMO0Ufc5mOcQpdXs0gxrbzk86NYAvJ0uqAmi8w5qrvjl1aO2P6RaOSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726350792; c=relaxed/simple;
	bh=UpNvkLzkGjwqkjimss974ang+etxYSifzA8mGMgNG8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S4iPheqzRw5XijH2lJVHiFfztw4Smglquz0dyhKu/KcHvN1KbqfQ5KXRMy0SAhaeqZR8IoX7MejHA/LzbhtqbRY0w5nLlR6m3tNJ1wnQoxUjSAbP+ega4z82mbS1XnxS3uHxnw3CSMHiFsobXld3VVmBDu8EdLPuYH76oENKr0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YlxcgQCF; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f753375394so30333491fa.0
        for <linux-usb@vger.kernel.org>; Sat, 14 Sep 2024 14:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726350789; x=1726955589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6Bzk4dLYxHFcdldpQy2JJvKI7rQO/9ma1QASgYBCBQ=;
        b=YlxcgQCFZTp9tuif/2Uy/gW/TlFebWklsjARHU8N1heWNj4JZhYVDV20ZoP4k8+mxo
         7Mfta5DoTohjQkuCo5h8I8lg8kAFmCq6IbTVst/M1SX9M+Iy9N65D5rgOBrtCPi4ktE2
         zpZU5O0G0fuFDm+Lmh0kJD/wF0MP1iVI9iJG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726350789; x=1726955589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6Bzk4dLYxHFcdldpQy2JJvKI7rQO/9ma1QASgYBCBQ=;
        b=trjH/bpqLGOS0sEQOUDEbdAXkqQQZ5e/XQRAUetHP7iT6fyiFGup0g41VURDY/2k4B
         zMF94HZa6DRwa6yJvJxU54CcI+FW64D5tCO6cP0uGdqK/4nOxPgjO6nuB6l59jFsP+8l
         duPBTPK8aKffjGXjpr4R3nOwajYyscG31m/SUqMLiDrErOcLINDRnVEkxHHDy2HXza3E
         QowAwUmAdjk7M2O67wU3xDZlLEhRJwSUi7zl7ewrwfz1A3vLI9alRMHEV4zLp1KhEZp+
         BbwTm/V+frtPq0YqTBn7vrz13o3tPOaVe7tsa163uuPB65iThjeay+YVa+z06qmlQaja
         C9KQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6Ry4PVMWw5iqOcyGXcBtKE0gmKcS+w/uzShSYfnq5KPJN62FpSaeKg+m3J+LfOPUoL19C1IMUA7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYWqFGU5ddxokpsgL+wfZ+8dJKl/4w5fKTMR2+5S2EwhRhjeFm
	JXenrowbgzXZnoSKYhXP0zK23nxI5Ui0U+spObV0iIKKN667euSwtA2z7MmFw5YJpNmS+O0l+vH
	X/LZFsQRYahSWpGaNBNpiX4RLM21VnxspU3g=
X-Google-Smtp-Source: AGHT+IGjKbgiyhU5o5TCUvFphkQECQYbcubMDKYXnsb12tJXkdY5CbXCmUkm2BVC68I2DEksfJ+H0pu9y9hKevcCKCA=
X-Received: by 2002:a05:6512:10ce:b0:530:ba4b:f65d with SMTP id
 2adb3069b0e04-53678fbf80fmr5797188e87.28.1726350787710; Sat, 14 Sep 2024
 14:53:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910101527.603452-1-ukaszb@chromium.org> <20240910101527.603452-6-ukaszb@chromium.org>
 <ZuGcw9y0hIiuIXvK@kuha.fi.intel.com>
In-Reply-To: <ZuGcw9y0hIiuIXvK@kuha.fi.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Sat, 14 Sep 2024 23:52:56 +0200
Message-ID: <CALwA+NbY1qbV_01NcOSN=C=9hiE3UV3aYvrKzaGKm95Q2EQ8EA@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] usb: typec: cros_ec_ucsi: Add trace events
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 3:36=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Tue, Sep 10, 2024 at 10:15:24AM +0000, =C5=81ukasz Bartosik wrote:
> > Add trace events to ChromeOS UCSI driver to enable debugging.
> >
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  MAINTAINERS                                 |  1 +
> >  drivers/usb/typec/ucsi/cros_ec_ucsi.c       |  8 ++
> >  drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h | 92 +++++++++++++++++++++
> >  3 files changed, 101 insertions(+)
> >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8c030ea0b503..d084f32208f0 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5306,6 +5306,7 @@ M:      =C5=81ukasz Bartosik <ukaszb@chromium.org=
>
> >  L:   chrome-platform@lists.linux.dev
> >  S:   Maintained
> >  F:   drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > +F:   drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h
> >
> >  CHRONTEL CH7322 CEC DRIVER
> >  M:   Joe Tessler <jrt@google.com>
> > diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/=
ucsi/cros_ec_ucsi.c
> > index 422b3b14028c..70185616ec86 100644
> > --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > @@ -16,7 +16,9 @@
> >  #include <linux/slab.h>
> >  #include <linux/wait.h>
> >
> > +#define CREATE_TRACE_POINTS
> >  #include "ucsi.h"
> > +#include "cros_ec_ucsi_trace.h"
> >
> >  /*
> >   * Maximum size in bytes of a UCSI message between AP and EC
> > @@ -62,6 +64,8 @@ static int cros_ucsi_read(struct ucsi *ucsi, unsigned=
 int offset, void *val,
> >               dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_=
GET: error=3D%d", ret);
> >               return ret;
> >       }
> > +
> > +     trace_cros_ec_opm_to_ppm_rd(offset, val, val_len);
> >       return 0;
> >  }
> >
> > @@ -96,6 +100,8 @@ static int cros_ucsi_async_control(struct ucsi *ucsi=
, u64 cmd)
> >               dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_=
SET: error=3D%d", ret);
> >               return ret;
> >       }
> > +
> > +     trace_cros_ec_opm_to_ppm_wr(req->offset, &cmd, sizeof(cmd));
> >       return 0;
> >  }
> >
> > @@ -138,6 +144,8 @@ static void cros_ucsi_work(struct work_struct *work=
)
> >       struct cros_ucsi_data *udata =3D container_of(work, struct cros_u=
csi_data, work);
> >       u32 cci;
> >
> > +     trace_cros_ec_ppm_to_opm(0);
> > +
> >       if (cros_ucsi_read_cci(udata->ucsi, &cci))
> >               return;
> >
> > diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h b/drivers/usb/=
typec/ucsi/cros_ec_ucsi_trace.h
> > new file mode 100644
> > index 000000000000..b765ef5c8236
> > --- /dev/null
> > +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h
> > @@ -0,0 +1,92 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#undef TRACE_SYSTEM
> > +#define TRACE_SYSTEM cros_ec_ucsi
> > +
> > +#if !defined(__CROS_EC_UCSI_TRACE_H) || defined(TRACE_HEADER_MULTI_REA=
D)
> > +#define __CROS_EC_UCSI_TRACE_H
> > +
> > +#include <linux/tracepoint.h>
> > +
> > +#define decode_cmd(cmd)                                               =
                       \
> > +     __print_symbolic(cmd,                                            =
               \
> > +             { 0,                            "Unknown command"        =
       },      \
> > +             { UCSI_PPM_RESET,               "PPM_RESET"              =
       },      \
> > +             { UCSI_CONNECTOR_RESET,         "CONNECTOR_RESET,"       =
       },      \
> > +             { UCSI_ACK_CC_CI,               "ACK_CC_CI"              =
       },      \
> > +             { UCSI_SET_NOTIFICATION_ENABLE, "SET_NOTIFICATION_ENABLE"=
       },      \
> > +             { UCSI_GET_CAPABILITY,          "GET_CAPABILITY"         =
       },      \
> > +             { UCSI_GET_CONNECTOR_CAPABILITY, "GET_CONNECTOR_CAPABILIT=
Y"     },      \
> > +             { UCSI_SET_UOM,                 "SET_UOM"                =
       },      \
> > +             { UCSI_SET_UOR,                 "SET_UOR"                =
       },      \
> > +             { UCSI_SET_PDM,                 "SET_PDM"                =
       },      \
> > +             { UCSI_SET_PDR,                 "SET_PDR"                =
       },      \
> > +             { UCSI_GET_ALTERNATE_MODES,     "GET_ALTERNATE_MODES"    =
       },      \
> > +             { UCSI_GET_CAM_SUPPORTED,       "GET_CAM_SUPPORTED"      =
       },      \
> > +             { UCSI_GET_CURRENT_CAM,         "GET_CURRENT_CAM"        =
       },      \
> > +             { UCSI_SET_NEW_CAM,             "SET_NEW_CAM"            =
       },      \
> > +             { UCSI_GET_PDOS,                "GET_PDOS"               =
       },      \
> > +             { UCSI_GET_CABLE_PROPERTY,      "GET_CABLE_PROPERTY"     =
       },      \
> > +             { UCSI_GET_CONNECTOR_STATUS,    "GET_CONNECTOR_STATUS"   =
       },      \
> > +             { UCSI_GET_ERROR_STATUS,        "GET_ERROR_STATUS"       =
       })
>
> Couldn't you just export ucsi_cmd_str() ?
>

I ran into an issue when using exported ucsi_cmd_str(). Trace-cmd
report reports [FAILED TO PARSE].
For example
trace-cmd record -e cros_ec_ucsi
...
trace-cmd report
     kworker/0:3-1891  [000]    59.432234: cros_ec_ppm_to_opm:   notificati=
on
     kworker/0:3-1891  [000]    59.432971: cros_ec_opm_to_ppm_rd:
[FAILED TO PARSE] cmd=3D4 offset=3D4 length=3D4 msg=3DARRAY[04, 00, 00, 20]

I believe this issue applies also to some UCSI trace events.

With decode_cmd from the above it works fine
For example
trace-cmd record -e cros_ec_ucsi
...
trace-cmd report
     kworker/0:1-10    [000]    49.248920: cros_ec_ppm_to_opm:   notificati=
on
     kworker/0:1-10    [000]    49.249857: cros_ec_opm_to_ppm_rd:
(CCI) : 04 00 00 20
     kworker/0:1-10    [000]    49.253230: cros_ec_opm_to_ppm_wr:
(CTRL) GET_CONNECTOR_STATUS: 12 00 02 00 00 00 00 00

> > +#define decode_offset(offset)                                        \
> > +     __print_symbolic(offset,                                \
> > +             { UCSI_VERSION,         "VER"           },      \
> > +             { UCSI_CCI,             "CCI"           },      \
> > +             { UCSI_CONTROL,         "CTRL"          },      \
> > +             { UCSI_MESSAGE_IN,      "MSG_IN"        },      \
> > +             { UCSI_MESSAGE_OUT,     "MSG_OUT"       },      \
> > +             { UCSIv2_MESSAGE_OUT,   "MSG_OUTv2"     })
> > +
> > +DECLARE_EVENT_CLASS(cros_ec_opm_to_ppm,
> > +     TP_PROTO(u16 offset, const void *value, size_t length),
> > +     TP_ARGS(offset, value, length),
> > +     TP_STRUCT__entry(
> > +             __field(u8, cmd)
> > +             __field(u16, offset)
> > +             __field(size_t, length)
> > +             __dynamic_array(char, msg, length)
> > +     ),
> > +     TP_fast_assign(
> > +             __entry->cmd =3D *((u64 *) value + 3);
> > +             __entry->offset =3D offset;
> > +             __entry->length =3D length;
> > +             memcpy(__get_dynamic_array(msg), value, length);
> > +     ),
> > +     TP_printk("(%s) %s: %s",
> > +             decode_offset(__entry->offset),
> > +             __entry->offset =3D=3D UCSI_CONTROL ?
> > +             decode_cmd(__entry->cmd) : "",
> > +             __print_hex(__get_dynamic_array(msg), __entry->length))
> > +);
> > +
> > +DEFINE_EVENT(cros_ec_opm_to_ppm, cros_ec_opm_to_ppm_rd,
> > +     TP_PROTO(u16 offset, const void *value, size_t length),
> > +     TP_ARGS(offset, value, length)
> > +);
> > +
> > +DEFINE_EVENT(cros_ec_opm_to_ppm, cros_ec_opm_to_ppm_wr,
> > +     TP_PROTO(u16 offset, const void *value, size_t length),
> > +     TP_ARGS(offset, value, length)
> > +);
> > +
> > +TRACE_EVENT(cros_ec_ppm_to_opm,
> > +     TP_PROTO(int x),
> > +     TP_ARGS(x),
> > +     TP_STRUCT__entry(__array(char, x, 0)),
> > +     TP_fast_assign((void)x),
> > +     TP_printk("notification%s", "")
> > +);
>
> This does not look cros_ec specific. Could you check if this could be
> made part of the ucsi core tracepoints?
>

Good point. I will look into it.

> I can also look into this more carefully, and throw ideas if you like.
> Let me know.
>

I would definitely like to hear your ideas on the topic :).

Thanks,
Lukasz

> Br,



>
> --
> heikki

