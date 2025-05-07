Return-Path: <linux-usb+bounces-23774-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0B8AAD287
	for <lists+linux-usb@lfdr.de>; Wed,  7 May 2025 03:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82F7A983ABA
	for <lists+linux-usb@lfdr.de>; Wed,  7 May 2025 01:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2199013633F;
	Wed,  7 May 2025 01:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0tg0+v9I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CCB376
	for <linux-usb@vger.kernel.org>; Wed,  7 May 2025 01:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746580433; cv=none; b=YuqofxDIg7pT1fxD2or8l+eAloPIt2bmHSNRouTvRw2exaPvyzjSirVfWEXRgFxHDzmGMilcCv7JZVN6W3mnNu623tIDmpMGXCq358VfBTL/9vsUAFUghZbP1Kqjgiy7O6EQKOzq7EZ1hT6BBD/I0s5QRXRFNQGD/exwmUxXjWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746580433; c=relaxed/simple;
	bh=WrXfVRulXDziNtXtBoVglWYEXv2Va9CGfJ/WHXjf05Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fPm85qrqpAH/ullnnifhguzV9YRgsXIfQqoSSVx5ubqDwG5mSGS6q1KGODOuGtvpP521UXT29FJNxFhb7Q4sknqB/g47BhBH2YAdnU+YnXYZmYjJw0fTWlk2LKAcVPdX7Zbem9qcZJAb82VGtYmUetbXpHtxRbRG4kKATtRxEjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0tg0+v9I; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2d060c62b61so5319383fac.0
        for <linux-usb@vger.kernel.org>; Tue, 06 May 2025 18:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746580429; x=1747185229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAHA2M2gzA72P5wKFeQgvr3kaxJ0NObndlV+xQGVuNA=;
        b=0tg0+v9ILroYxB1jXa/VZtbF7OELhGZC5Z3zB/ntuWLZNS7P4tfA9awivRkyeAvR/W
         Cuy6BTqPKCknTBbqlgXk58pku64ppa8Oy4xB3gPPp6HbQguT5FFmntkGRefDG2/GMlYt
         Zj5IIVtlK+jSttsiBorYItyXsZxoE6iYmypDXDEz9Du6c4Yld9Jg9AfS0GMGn4AxVqcb
         a4bcrTa5lK9cgm8/M+EaZxUgzNQTz39Qk8OmivRPTat43kGgs13rtgGFesat8gTqs4Wl
         nfIbDm6LGEVaHh6En5bLC8jFFEXbb70ye+CkE4CJj/9Szmtw63wW85G28LBCvjNQnK/+
         sGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746580429; x=1747185229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAHA2M2gzA72P5wKFeQgvr3kaxJ0NObndlV+xQGVuNA=;
        b=Ma3qgI4SZUwPPzeFgseQhcwpxvaq61nzCC7Q1eTSLX4o528/X9/cgZFcKJoSxWp35j
         1Yf85I+9c7uyi7mS0si4HrrRCigSb7m/sbbKUezQ0XvOKutK3oC49f7PVDIk4j8+4yOa
         Sf8ANxO2biXcR7yvDmJRVMWy9GcCKNOyHxJfnlDEFiM30hX/dH31Ye6S55AtRcXPDqx7
         X6bxK5JnF8hphyhrlVRtx1xChFMc8N7i0MjobtPPSrRRHB1sRggIGXxNxYM5AbFmmPWD
         Rn8115cw2KVCqtP5CMH7TDD6n/4zpcGK03wqVWVHrFHBfUoflekcF2wz6hvRRx2GWmL7
         9SCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkAZuOCvVjG6rdDPpCCy+9ifEHisgjCU3I2No3IX1n3bNWURCMwg1lIVICt1Rovzd++uQDyW9CcfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHdtJP91GXMlWCsSVnBqDQJCvRvdi6UuX1/OccErak/+uMVpsK
	QwQtFypeU0MhZazRREKzP9+UZFpFSab1KvhElx4sSdLRT5q4pMOdgRX8ETDc+5NPmvFUNEh7f2j
	QxR3lI57v0Qhc0bHbzqT0w9zRZ6pleoMl6P/ANtIfu8G5FSWW3yIC
X-Gm-Gg: ASbGnct8zIVHVw1+1V6LwpoOJv0SdZ/50z25GyOWM9QHnpQ0osSZ2ATFFanjh2cYla5
	OhrM/9VQY2o/lGklc7T7Gfvc6Q3VkxCIK9a21hgfLQhpHORtLxVREbymOttnxnacT2PSDIV5Ka9
	rXOxAuC2z/EiWyQe7LvaZwTZA3iCnJLxtwFz4W8B8w4Jm6GSVdyO7b+dM=
X-Google-Smtp-Source: AGHT+IFg7onsRcfW9p2ae/Oe0BGAstesZ+L8NOJ0MgGdWACRw9F3FsOllD+Wy2qUmglbDlGhJHy1sBqFOMdpFgiMnPg=
X-Received: by 2002:a05:6870:241d:b0:2d4:e420:926d with SMTP id
 586e51a60fabf-2db5c0850e3mr949492fac.29.1746580429185; Tue, 06 May 2025
 18:13:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506232853.1968304-2-rdbabiera@google.com>
In-Reply-To: <20250506232853.1968304-2-rdbabiera@google.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Tue, 6 May 2025 18:13:02 -0700
X-Gm-Features: ATxdqUGD8McOHHnYUncpoXvq_evnAJPqE7k_aMyyJmSESXHQcbPz9OZeg1Zk9bU
Message-ID: <CAPTae5LXuXSTONbh0u1O-mHzCb30jesczJB7ZS8e6bW_9T-syw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpm: move tcpm_queue_vdm_unlocked to
 asynchronous work
To: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 4:29=E2=80=AFPM RD Babiera <rdbabiera@google.com> wr=
ote:
>
> A state check was previously added to tcpm_queue_vdm_unlocked to
> prevent a deadlock where the DisplayPort Alt Mode driver would be
> executing work and attempting to grab the tcpm_lock while the TCPM
> was holding the lock and attempting to unregister the altmode, blocking
> on the altmode driver's cancel_work_sync call.
>
> Because the state check isn't protected, there is a small window
> where the Alt Mode driver could determine that the TCPM is
> in a ready state and attempt to grab the lock while the
> TCPM grabs the lock and changes the TCPM state to one that
> causes the deadlock. The callstack is provided below:
>
> [110121.667392][    C7] Call trace:
> [110121.667396][    C7]  __switch_to+0x174/0x338
> [110121.667406][    C7]  __schedule+0x608/0x9f0
> [110121.667414][    C7]  schedule+0x7c/0xe8
> [110121.667423][    C7]  kernfs_drain+0xb0/0x114
> [110121.667431][    C7]  __kernfs_remove+0x16c/0x20c
> [110121.667436][    C7]  kernfs_remove_by_name_ns+0x74/0xe8
> [110121.667442][    C7]  sysfs_remove_group+0x84/0xe8
> [110121.667450][    C7]  sysfs_remove_groups+0x34/0x58
> [110121.667458][    C7]  device_remove_groups+0x10/0x20
> [110121.667464][    C7]  device_release_driver_internal+0x164/0x2e4
> [110121.667475][    C7]  device_release_driver+0x18/0x28
> [110121.667484][    C7]  bus_remove_device+0xec/0x118
> [110121.667491][    C7]  device_del+0x1e8/0x4ac
> [110121.667498][    C7]  device_unregister+0x18/0x38
> [110121.667504][    C7]  typec_unregister_altmode+0x30/0x44
> [110121.667515][    C7]  tcpm_reset_port+0xac/0x370
> [110121.667523][    C7]  tcpm_snk_detach+0x84/0xb8
> [110121.667529][    C7]  run_state_machine+0x4c0/0x1b68
> [110121.667536][    C7]  tcpm_state_machine_work+0x94/0xe4
> [110121.667544][    C7]  kthread_worker_fn+0x10c/0x244
> [110121.667552][    C7]  kthread+0x104/0x1d4
> [110121.667557][    C7]  ret_from_fork+0x10/0x20
>
> [110121.667689][    C7] Workqueue: events dp_altmode_work
> [110121.667697][    C7] Call trace:
> [110121.667701][    C7]  __switch_to+0x174/0x338
> [110121.667710][    C7]  __schedule+0x608/0x9f0
> [110121.667717][    C7]  schedule+0x7c/0xe8
> [110121.667725][    C7]  schedule_preempt_disabled+0x24/0x40
> [110121.667733][    C7]  __mutex_lock+0x408/0xdac
> [110121.667741][    C7]  __mutex_lock_slowpath+0x14/0x24
> [110121.667748][    C7]  mutex_lock+0x40/0xec
> [110121.667757][    C7]  tcpm_altmode_enter+0x78/0xb4
> [110121.667764][    C7]  typec_altmode_enter+0xdc/0x10c
> [110121.667769][    C7]  dp_altmode_work+0x68/0x164
> [110121.667775][    C7]  process_one_work+0x1e4/0x43c
> [110121.667783][    C7]  worker_thread+0x25c/0x430
> [110121.667789][    C7]  kthread+0x104/0x1d4
> [110121.667794][    C7]  ret_from_fork+0x10/0x20
>
> Change tcpm_queue_vdm_unlocked to queue for tcpm_queue_vdm_work,
> which can perform the state check while holding the TCPM lock
> while the Alt Mode lock is no longer held. This requires a new
> struct to hold the vdm data, altmode_vdm_event.
>
> Fixes: cdc9946ea637 ("usb: typec: tcpm: enforce ready state when queueing=
 alt mode vdm")
> Cc: stable@vger.kernel.org
> Signed-off-by: RD Babiera <rdbabiera@google.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

> ---
> Changes from v1:
> * modified commit message to include call stack
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 91 +++++++++++++++++++++++++++--------
>  1 file changed, 71 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index 784fa23102f9..9b8d98328ddb 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -597,6 +597,15 @@ struct pd_rx_event {
>         enum tcpm_transmit_type rx_sop_type;
>  };
>
> +struct altmode_vdm_event {
> +       struct kthread_work work;
> +       struct tcpm_port *port;
> +       u32 header;
> +       u32 *data;
> +       int cnt;
> +       enum tcpm_transmit_type tx_sop_type;
> +};
> +
>  static const char * const pd_rev[] =3D {
>         [PD_REV10]              =3D "rev1",
>         [PD_REV20]              =3D "rev2",
> @@ -1610,18 +1619,68 @@ static void tcpm_queue_vdm(struct tcpm_port *port=
, const u32 header,
>         mod_vdm_delayed_work(port, 0);
>  }
>
> -static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 he=
ader,
> -                                   const u32 *data, int cnt, enum tcpm_t=
ransmit_type tx_sop_type)
> +static void tcpm_queue_vdm_work(struct kthread_work *work)
>  {
> -       if (port->state !=3D SRC_READY && port->state !=3D SNK_READY &&
> -           port->state !=3D SRC_VDM_IDENTITY_REQUEST)
> -               return;
> +       struct altmode_vdm_event *event =3D container_of(work,
> +                                                      struct altmode_vdm=
_event,
> +                                                      work);
> +       struct tcpm_port *port =3D event->port;
>
>         mutex_lock(&port->lock);
> -       tcpm_queue_vdm(port, header, data, cnt, tx_sop_type);
> +       if (port->state !=3D SRC_READY && port->state !=3D SNK_READY &&
> +           port->state !=3D SRC_VDM_IDENTITY_REQUEST) {
> +               tcpm_log_force(port, "dropping altmode_vdm_event");
> +               goto port_unlock;
> +       }
> +
> +       tcpm_queue_vdm(port, event->header, event->data, event->cnt, even=
t->tx_sop_type);
> +
> +port_unlock:
> +       kfree(event->data);
> +       kfree(event);
>         mutex_unlock(&port->lock);
>  }
>
> +static int tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 hea=
der,
> +                                  const u32 *data, int cnt, enum tcpm_tr=
ansmit_type tx_sop_type)
> +{
> +       struct altmode_vdm_event *event;
> +       u32 *data_cpy;
> +       int ret =3D -ENOMEM;
> +
> +       event =3D kzalloc(sizeof(*event), GFP_KERNEL);
> +       if (!event)
> +               goto err_event;
> +
> +       data_cpy =3D kcalloc(cnt, sizeof(u32), GFP_KERNEL);
> +       if (!data_cpy)
> +               goto err_data;
> +
> +       kthread_init_work(&event->work, tcpm_queue_vdm_work);
> +       event->port =3D port;
> +       event->header =3D header;
> +       memcpy(data_cpy, data, sizeof(u32) * cnt);
> +       event->data =3D data_cpy;
> +       event->cnt =3D cnt;
> +       event->tx_sop_type =3D tx_sop_type;
> +
> +       ret =3D kthread_queue_work(port->wq, &event->work);
> +       if (!ret) {
> +               ret =3D -EBUSY;
> +               goto err_queue;
> +       }
> +
> +       return 0;
> +
> +err_queue:
> +       kfree(data_cpy);
> +err_data:
> +       kfree(event);
> +err_event:
> +       tcpm_log_force(port, "failed to queue altmode vdm, err:%d", ret);
> +       return ret;
> +}
> +
>  static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, =
int cnt)
>  {
>         u32 vdo =3D p[VDO_INDEX_IDH];
> @@ -2832,8 +2891,7 @@ static int tcpm_altmode_enter(struct typec_altmode =
*altmode, u32 *vdo)
>         header =3D VDO(altmode->svid, vdo ? 2 : 1, svdm_version, CMD_ENTE=
R_MODE);
>         header |=3D VDO_OPOS(altmode->mode);
>
> -       tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0, TCPC_TX_S=
OP);
> -       return 0;
> +       return tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0, TC=
PC_TX_SOP);
>  }
>
>  static int tcpm_altmode_exit(struct typec_altmode *altmode)
> @@ -2849,8 +2907,7 @@ static int tcpm_altmode_exit(struct typec_altmode *=
altmode)
>         header =3D VDO(altmode->svid, 1, svdm_version, CMD_EXIT_MODE);
>         header |=3D VDO_OPOS(altmode->mode);
>
> -       tcpm_queue_vdm_unlocked(port, header, NULL, 0, TCPC_TX_SOP);
> -       return 0;
> +       return tcpm_queue_vdm_unlocked(port, header, NULL, 0, TCPC_TX_SOP=
);
>  }
>
>  static int tcpm_altmode_vdm(struct typec_altmode *altmode,
> @@ -2858,9 +2915,7 @@ static int tcpm_altmode_vdm(struct typec_altmode *a=
ltmode,
>  {
>         struct tcpm_port *port =3D typec_altmode_get_drvdata(altmode);
>
> -       tcpm_queue_vdm_unlocked(port, header, data, count - 1, TCPC_TX_SO=
P);
> -
> -       return 0;
> +       return tcpm_queue_vdm_unlocked(port, header, data, count - 1, TCP=
C_TX_SOP);
>  }
>
>  static const struct typec_altmode_ops tcpm_altmode_ops =3D {
> @@ -2884,8 +2939,7 @@ static int tcpm_cable_altmode_enter(struct typec_al=
tmode *altmode, enum typec_pl
>         header =3D VDO(altmode->svid, vdo ? 2 : 1, svdm_version, CMD_ENTE=
R_MODE);
>         header |=3D VDO_OPOS(altmode->mode);
>
> -       tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0, TCPC_TX_S=
OP_PRIME);
> -       return 0;
> +       return tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0, TC=
PC_TX_SOP_PRIME);
>  }
>
>  static int tcpm_cable_altmode_exit(struct typec_altmode *altmode, enum t=
ypec_plug_index sop)
> @@ -2901,8 +2955,7 @@ static int tcpm_cable_altmode_exit(struct typec_alt=
mode *altmode, enum typec_plu
>         header =3D VDO(altmode->svid, 1, svdm_version, CMD_EXIT_MODE);
>         header |=3D VDO_OPOS(altmode->mode);
>
> -       tcpm_queue_vdm_unlocked(port, header, NULL, 0, TCPC_TX_SOP_PRIME)=
;
> -       return 0;
> +       return tcpm_queue_vdm_unlocked(port, header, NULL, 0, TCPC_TX_SOP=
_PRIME);
>  }
>
>  static int tcpm_cable_altmode_vdm(struct typec_altmode *altmode, enum ty=
pec_plug_index sop,
> @@ -2910,9 +2963,7 @@ static int tcpm_cable_altmode_vdm(struct typec_altm=
ode *altmode, enum typec_plug
>  {
>         struct tcpm_port *port =3D typec_altmode_get_drvdata(altmode);
>
> -       tcpm_queue_vdm_unlocked(port, header, data, count - 1, TCPC_TX_SO=
P_PRIME);
> -
> -       return 0;
> +       return tcpm_queue_vdm_unlocked(port, header, data, count - 1, TCP=
C_TX_SOP_PRIME);
>  }
>
>  static const struct typec_cable_ops tcpm_cable_ops =3D {
>
> base-commit: 588d032e9e566997db3213dee145dbe3bda297b6
> --
> 2.49.0.967.g6a0df3ecc3-goog
>

