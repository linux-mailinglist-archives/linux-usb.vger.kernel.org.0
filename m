Return-Path: <linux-usb+bounces-14329-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155F96521C
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 23:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A61881C23044
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 21:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D901BAEC7;
	Thu, 29 Aug 2024 21:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lM6JrCXt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B408B1BA27F
	for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 21:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724967460; cv=none; b=tUk1lnpxKSdWhYxm4Cev7XhIetDD7aGlDStjFxh6N5Tn8ZIAdbeVB5UBd+lvK2QOAXlB7m1bpbah47o+FZQmMOAsXvrZg4530HugHeMfNwvE2oECru/QgGz/pmol6uIQZSJBP/bprx6UWjzLCp0EPMyzqwf5cJcBRNrz/bOhlEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724967460; c=relaxed/simple;
	bh=+eo0sM74o1cvovA5wwiknxli9njx2BhmPFpnn3mcvqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fOPbhmyL+uz7easL3WKIrQIzAmcOGOyM0275zD9tyVl7KSnlx5EPaPkQT7e2iHQ1zxqaCrzCaYB7yaVKKrlsV87HA8RIxKaGPbOn5DIGfcEGR5IYn49/oG5CeIg38EpiZ9C0uOPS/FotoAHgnUgJuvu0BgHsHomSOKxwgLZ9lqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lM6JrCXt; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6b3afc6cd01so17888997b3.1
        for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 14:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724967456; x=1725572256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgtTLxWFNZ+47poAX+aIW3eKREBLwDJCmC34DwIVTpM=;
        b=lM6JrCXtWFnT8HmUzsZToiY/LL7p4wjSEjFlM7ccAB3XxcgCz+FcF3GRl1OxegOnmX
         vPVBcskogzxMfhqKE8zHkJLDsHVK8FZEfZndsPWFk/nkQSAcpDcf8NzuwidZ82A1gg5c
         XZGIR06a1PhnWZAfTQBwbv8CKqXdkAOpyMOrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724967456; x=1725572256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgtTLxWFNZ+47poAX+aIW3eKREBLwDJCmC34DwIVTpM=;
        b=MgBRBUqzcolkkt2LUHD6WuTIT5YVp4S0DBYDEwMz3UibSxwIgVLLvFSzPYtxCNoo3k
         apb5bW5ARgxwMWrfYl/GAUEDqcnRnWu1ogFIEyLHYzPPeYRro/bELbXftWqdhcjeiqvl
         D7BFZ3IXDi+2vpF/Zh4YxGtHADoPxUU4VXuI/BBz91GjYviIwTjDdP2SXgHCOnw4vXb+
         gxnAaB9BqcE5gVjLeAzy7trofJQwf7wgJazSK8//lu4mDj68qQRhJHKKRMv/EPrcpj4/
         vItHckpW6Xe0FRkZcD/fPtHtXKrPEgRfqtJerAltgocSqEc2h6JBl909MZvaitSWw67K
         dBAw==
X-Forwarded-Encrypted: i=1; AJvYcCW5gegxwUMP3t0B93vm9mh5QyIr7p/pgtiYFNDXBJ2rKB3RO/2oNXgjz57I583Foj6IhwNt9XqP4QM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8tybg/CzemGpp3hCm5tu/ATqEKL+oFU3FT1GLBRObNcl8NMpg
	kaTLq//xm8+MigVzYci9XEqwF7VeNdmzvJCSfpbs8kBRpk4UmGMcbbTuxlEUCI5nxYyHwAiSH5h
	F1tRnZzBGN5SV8NhQLeV2CMoXNOrKx0bOJxEO
X-Google-Smtp-Source: AGHT+IF5KTTWMEeoHP9ZP3VVFVsgQa4jUKn2lfPKAsF0iEdkj+t4lkK2bUf+E4bUuBKB8DpubJ8va5fuWliXIlHHgyg=
X-Received: by 2002:a05:690c:dc1:b0:6d0:f91e:2ffa with SMTP id
 00721157ae682-6d3f7faeb23mr2358407b3.3.1724967456370; Thu, 29 Aug 2024
 14:37:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828161502.2774996-1-heikki.krogerus@linux.intel.com> <20240828161502.2774996-3-heikki.krogerus@linux.intel.com>
In-Reply-To: <20240828161502.2774996-3-heikki.krogerus@linux.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Thu, 29 Aug 2024 14:37:23 -0700
Message-ID: <CANFp7mWJ49ogzPgJWuxOADdXcJP=DdVw1cGAGJNxyrzrdVhZHw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] usb: typec: ucsi: Remove struct ucsi_connector_status
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Bartosz Szpila <bszpila@google.com>, 
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 9:15=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> GET_CONNECTOR_STATUS fields don't align naturally, which
> makes handling it with a data structure a bit awkward. The
> members of struct ucsi_connector_status don't match the
> actual GET_CONNECTOR_STATUS fields.
>
> Instead of using the custom data structure, simply accessing
> the fields directly. This introduces a helper UCSI_FIELD()
> for that purpose.
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/psy.c       | 28 +++++------
>  drivers/usb/typec/ucsi/trace.h     | 22 ++++----
>  drivers/usb/typec/ucsi/ucsi.c      | 81 ++++++++++++++----------------
>  drivers/usb/typec/ucsi/ucsi.h      | 62 +++++++++++++----------
>  drivers/usb/typec/ucsi/ucsi_acpi.c |  7 +--
>  5 files changed, 98 insertions(+), 102 deletions(-)
>
> diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
> index e623d80e177c..76a646d154c1 100644
> --- a/drivers/usb/typec/ucsi/psy.c
> +++ b/drivers/usb/typec/ucsi/psy.c
> @@ -55,8 +55,8 @@ static int ucsi_psy_get_online(struct ucsi_connector *c=
on,
>                                union power_supply_propval *val)
>  {
>         val->intval =3D UCSI_PSY_OFFLINE;
> -       if (con->status.flags & UCSI_CONSTAT_CONNECTED &&
> -           (con->status.flags & UCSI_CONSTAT_PWR_DIR) =3D=3D TYPEC_SINK)
> +       if (UCSI_CONSTAT_CONNECTED(con->status) &&
> +           (UCSI_CONSTAT_PWR_DIR(con->status) =3D=3D TYPEC_SINK))
>                 val->intval =3D UCSI_PSY_FIXED_ONLINE;
>         return 0;
>  }
> @@ -66,7 +66,7 @@ static int ucsi_psy_get_voltage_min(struct ucsi_connect=
or *con,
>  {
>         u32 pdo;
>
> -       switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
> +       switch (UCSI_CONSTAT_PWR_OPMODE(con->status)) {
>         case UCSI_CONSTAT_PWR_OPMODE_PD:
>                 pdo =3D con->src_pdos[0];
>                 val->intval =3D pdo_fixed_voltage(pdo) * 1000;
> @@ -89,7 +89,7 @@ static int ucsi_psy_get_voltage_max(struct ucsi_connect=
or *con,
>  {
>         u32 pdo;
>
> -       switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
> +       switch (UCSI_CONSTAT_PWR_OPMODE(con->status)) {
>         case UCSI_CONSTAT_PWR_OPMODE_PD:
>                 if (con->num_pdos > 0) {
>                         pdo =3D con->src_pdos[con->num_pdos - 1];
> @@ -117,7 +117,7 @@ static int ucsi_psy_get_voltage_now(struct ucsi_conne=
ctor *con,
>         int index;
>         u32 pdo;
>
> -       switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
> +       switch (UCSI_CONSTAT_PWR_OPMODE(con->status)) {
>         case UCSI_CONSTAT_PWR_OPMODE_PD:
>                 index =3D rdo_index(con->rdo);
>                 if (index > 0) {
> @@ -145,7 +145,7 @@ static int ucsi_psy_get_current_max(struct ucsi_conne=
ctor *con,
>  {
>         u32 pdo;
>
> -       switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
> +       switch (UCSI_CONSTAT_PWR_OPMODE(con->status)) {
>         case UCSI_CONSTAT_PWR_OPMODE_PD:
>                 if (con->num_pdos > 0) {
>                         pdo =3D con->src_pdos[con->num_pdos - 1];
> @@ -173,9 +173,7 @@ static int ucsi_psy_get_current_max(struct ucsi_conne=
ctor *con,
>  static int ucsi_psy_get_current_now(struct ucsi_connector *con,
>                                     union power_supply_propval *val)
>  {
> -       u16 flags =3D con->status.flags;
> -
> -       if (UCSI_CONSTAT_PWR_OPMODE(flags) =3D=3D UCSI_CONSTAT_PWR_OPMODE=
_PD)
> +       if (UCSI_CONSTAT_PWR_OPMODE(con->status) =3D=3D UCSI_CONSTAT_PWR_=
OPMODE_PD)
>                 val->intval =3D rdo_op_current(con->rdo) * 1000;
>         else
>                 val->intval =3D 0;
> @@ -185,11 +183,9 @@ static int ucsi_psy_get_current_now(struct ucsi_conn=
ector *con,
>  static int ucsi_psy_get_usb_type(struct ucsi_connector *con,
>                                  union power_supply_propval *val)
>  {
> -       u16 flags =3D con->status.flags;
> -
>         val->intval =3D POWER_SUPPLY_USB_TYPE_C;
> -       if (flags & UCSI_CONSTAT_CONNECTED &&
> -           UCSI_CONSTAT_PWR_OPMODE(flags) =3D=3D UCSI_CONSTAT_PWR_OPMODE=
_PD)
> +       if (UCSI_CONSTAT_CONNECTED(con->status) &&
> +           UCSI_CONSTAT_PWR_OPMODE(con->status) =3D=3D UCSI_CONSTAT_PWR_=
OPMODE_PD)
>                 val->intval =3D POWER_SUPPLY_USB_TYPE_PD;
>
>         return 0;
> @@ -197,18 +193,18 @@ static int ucsi_psy_get_usb_type(struct ucsi_connec=
tor *con,
>
>  static int ucsi_psy_get_charge_type(struct ucsi_connector *con, union po=
wer_supply_propval *val)
>  {
> -       if (!(con->status.flags & UCSI_CONSTAT_CONNECTED)) {
> +       if (!(UCSI_CONSTAT_CONNECTED(con->status))) {
>                 val->intval =3D POWER_SUPPLY_CHARGE_TYPE_NONE;
>                 return 0;
>         }
>
>         /* The Battery Charging Cabability Status field is only valid in =
sink role. */
> -       if ((con->status.flags & UCSI_CONSTAT_PWR_DIR) !=3D TYPEC_SINK) {
> +       if (UCSI_CONSTAT_PWR_DIR(con->status) !=3D TYPEC_SINK) {
>                 val->intval =3D POWER_SUPPLY_CHARGE_TYPE_UNKNOWN;
>                 return 0;
>         }
>
> -       switch (UCSI_CONSTAT_BC_STATUS(con->status.pwr_status)) {
> +       switch (UCSI_CONSTAT_BC_STATUS(con->status)) {
>         case UCSI_CONSTAT_BC_NOMINAL_CHARGING:
>                 val->intval =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;
>                 break;
> diff --git a/drivers/usb/typec/ucsi/trace.h b/drivers/usb/typec/ucsi/trac=
e.h
> index a0d3a934d3d9..ad51d684ea20 100644
> --- a/drivers/usb/typec/ucsi/trace.h
> +++ b/drivers/usb/typec/ucsi/trace.h
> @@ -40,7 +40,7 @@ DEFINE_EVENT(ucsi_log_command, ucsi_reset_ppm,
>  );
>
>  DECLARE_EVENT_CLASS(ucsi_log_connector_status,
> -       TP_PROTO(int port, struct ucsi_connector_status *status),
> +       TP_PROTO(int port, u8 *status),
>         TP_ARGS(port, status),
>         TP_STRUCT__entry(
>                 __field(int, port)
> @@ -55,14 +55,14 @@ DECLARE_EVENT_CLASS(ucsi_log_connector_status,
>         ),
>         TP_fast_assign(
>                 __entry->port =3D port - 1;
> -               __entry->change =3D status->change;
> -               __entry->opmode =3D UCSI_CONSTAT_PWR_OPMODE(status->flags=
);
> -               __entry->connected =3D !!(status->flags & UCSI_CONSTAT_CO=
NNECTED);
> -               __entry->pwr_dir =3D !!(status->flags & UCSI_CONSTAT_PWR_=
DIR);
> -               __entry->partner_flags =3D UCSI_CONSTAT_PARTNER_FLAGS(sta=
tus->flags);
> -               __entry->partner_type =3D UCSI_CONSTAT_PARTNER_TYPE(statu=
s->flags);
> -               __entry->request_data_obj =3D status->request_data_obj;
> -               __entry->bc_status =3D UCSI_CONSTAT_BC_STATUS(status->pwr=
_status);
> +               __entry->change =3D UCSI_CONSTAT_CHANGE(status);
> +               __entry->opmode =3D UCSI_CONSTAT_PWR_OPMODE(status);
> +               __entry->connected =3D UCSI_CONSTAT_CONNECTED(status);
> +               __entry->pwr_dir =3D UCSI_CONSTAT_PWR_DIR(status);
> +               __entry->partner_flags =3D UCSI_CONSTAT_PARTNER_FLAGS(sta=
tus);
> +               __entry->partner_type =3D UCSI_CONSTAT_PARTNER_TYPE(statu=
s);
> +               __entry->request_data_obj =3D UCSI_CONSTAT_RDO(status);
> +               __entry->bc_status =3D UCSI_CONSTAT_BC_STATUS(status);
>         ),
>         TP_printk("port%d status: change=3D%04x, opmode=3D%x, connected=
=3D%d, "
>                 "sourcing=3D%d, partner_flags=3D%x, partner_type=3D%x, "
> @@ -73,12 +73,12 @@ DECLARE_EVENT_CLASS(ucsi_log_connector_status,
>  );
>
>  DEFINE_EVENT(ucsi_log_connector_status, ucsi_connector_change,
> -       TP_PROTO(int port, struct ucsi_connector_status *status),
> +       TP_PROTO(int port, u8 *status),
>         TP_ARGS(port, status)
>  );
>
>  DEFINE_EVENT(ucsi_log_connector_status, ucsi_register_port,
> -       TP_PROTO(int port, struct ucsi_connector_status *status),
> +       TP_PROTO(int port, u8 *status),
>         TP_ARGS(port, status)
>  );
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index 2e6773715efe..399ea2700d19 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -652,7 +652,9 @@ static int ucsi_get_connector_status(struct ucsi_conn=
ector *con, bool conn_ack)
>         struct ucsi *ucsi =3D con->ucsi;
>         int ret;
>
> -       ret =3D ucsi_send_command_common(ucsi, command, &con->status, siz=
eof(con->status), conn_ack);
> +       ret =3D ucsi_send_command_common(ucsi, command, &con->status,
> +                                      min(sizeof(con->status), UCSI_MAX_=
DATA_LENGTH(ucsi)),
> +                                      conn_ack);
>         return ret < 0 ? ret : 0;
>  }

This seems equivalent to what we were doing previously (clamping to
UCSI_MAX_DATA_LENGTH based on version). Do we not want to use exact
sizes by version?

>
> @@ -666,8 +668,7 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
>
>         if (is_partner &&
>             ucsi->quirks & UCSI_NO_PARTNER_PDOS &&
> -           ((con->status.flags & UCSI_CONSTAT_PWR_DIR) ||
> -            !is_source(role)))
> +           (UCSI_CONSTAT_PWR_DIR(con->status) || !is_source(role)))
>                 return 0;
>
>         command =3D UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(c=
on->num);
> @@ -971,9 +972,9 @@ static void ucsi_unregister_cable(struct ucsi_connect=
or *con)
>
>  static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
>  {
> -       switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
> +       switch (UCSI_CONSTAT_PWR_OPMODE(con->status)) {
>         case UCSI_CONSTAT_PWR_OPMODE_PD:
> -               con->rdo =3D con->status.request_data_obj;
> +               con->rdo =3D UCSI_CONSTAT_RDO(con->status);
>                 typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_PD);
>                 ucsi_partner_task(con, ucsi_get_src_pdos, 30, 0);
>                 ucsi_partner_task(con, ucsi_check_altmodes, 30, HZ);
> @@ -996,7 +997,7 @@ static void ucsi_pwr_opmode_change(struct ucsi_connec=
tor *con)
>
>  static int ucsi_register_partner(struct ucsi_connector *con)
>  {
> -       u8 pwr_opmode =3D UCSI_CONSTAT_PWR_OPMODE(con->status.flags);
> +       u8 pwr_opmode =3D UCSI_CONSTAT_PWR_OPMODE(con->status);
>         struct typec_partner_desc desc;
>         struct typec_partner *partner;
>
> @@ -1005,7 +1006,7 @@ static int ucsi_register_partner(struct ucsi_connec=
tor *con)
>
>         memset(&desc, 0, sizeof(desc));
>
> -       switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
> +       switch (UCSI_CONSTAT_PARTNER_TYPE(con->status)) {
>         case UCSI_CONSTAT_PARTNER_TYPE_DEBUG:
>                 desc.accessory =3D TYPEC_ACCESSORY_DEBUG;
>                 break;
> @@ -1058,7 +1059,7 @@ static void ucsi_partner_change(struct ucsi_connect=
or *con)
>         enum usb_role u_role =3D USB_ROLE_NONE;
>         int ret;
>
> -       switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
> +       switch (UCSI_CONSTAT_PARTNER_TYPE(con->status)) {
>         case UCSI_CONSTAT_PARTNER_TYPE_UFP:
>         case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
>                 u_role =3D USB_ROLE_HOST;
> @@ -1074,8 +1075,8 @@ static void ucsi_partner_change(struct ucsi_connect=
or *con)
>                 break;
>         }
>
> -       if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
> -               switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
> +       if (UCSI_CONSTAT_CONNECTED(con->status)) {
> +               switch (UCSI_CONSTAT_PARTNER_TYPE(con->status)) {
>                 case UCSI_CONSTAT_PARTNER_TYPE_DEBUG:
>                         typec_set_mode(con->port, TYPEC_MODE_DEBUG);
>                         break;
> @@ -1083,14 +1084,14 @@ static void ucsi_partner_change(struct ucsi_conne=
ctor *con)
>                         typec_set_mode(con->port, TYPEC_MODE_AUDIO);
>                         break;
>                 default:
> -                       if (UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags)=
 =3D=3D
> -                                       UCSI_CONSTAT_PARTNER_FLAG_USB)
> +                       if (UCSI_CONSTAT_PARTNER_FLAGS(con->status) =3D=
=3D
> +                           UCSI_CONSTAT_PARTNER_FLAG_USB)
>                                 typec_set_mode(con->port, TYPEC_STATE_USB=
);
>                 }
>         }
>
>         /* Only notify USB controller if partner supports USB data */
> -       if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) & UCSI_CONSTA=
T_PARTNER_FLAG_USB))
> +       if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status) & UCSI_CONSTAT_PART=
NER_FLAG_USB))
>                 u_role =3D USB_ROLE_NONE;
>
>         ret =3D usb_role_switch_set_role(con->usb_role_sw, u_role);
> @@ -1122,7 +1123,7 @@ static int ucsi_check_connector_capability(struct u=
csi_connector *con)
>
>  static int ucsi_check_connection(struct ucsi_connector *con)
>  {
> -       u8 prev_flags =3D con->status.flags;
> +       u8 prev_state =3D UCSI_CONSTAT_CONNECTED(con->status);
>         int ret;
>
>         ret =3D ucsi_get_connector_status(con, false);
> @@ -1131,10 +1132,9 @@ static int ucsi_check_connection(struct ucsi_conne=
ctor *con)
>                 return ret;
>         }
>
> -       if (con->status.flags =3D=3D prev_flags)
> -               return 0;
> -
> -       if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
> +       if (UCSI_CONSTAT_CONNECTED(con->status)) {
> +               if (prev_state)
> +                       return 0;
>                 ucsi_register_partner(con);
>                 ucsi_pwr_opmode_change(con);
>                 ucsi_partner_change(con);
> @@ -1212,14 +1212,14 @@ static void ucsi_handle_connector_change(struct w=
ork_struct *work)
>                 goto out_unlock;
>         }
>
> -       trace_ucsi_connector_change(con->num, &con->status);
> +       trace_ucsi_connector_change(con->num, con->status);
>
>         if (ucsi->ops->connector_status)
>                 ucsi->ops->connector_status(con);
>
> -       role =3D !!(con->status.flags & UCSI_CONSTAT_PWR_DIR);
> +       role =3D UCSI_CONSTAT_PWR_DIR(con->status);
>
> -       if (con->status.change & UCSI_CONSTAT_POWER_DIR_CHANGE) {
> +       if (UCSI_CONSTAT_CHANGE(con->status) & UCSI_CONSTAT_POWER_DIR_CHA=
NGE) {
>                 typec_set_pwr_role(con->port, role);
>
>                 /* Complete pending power role swap */
> @@ -1227,12 +1227,12 @@ static void ucsi_handle_connector_change(struct w=
ork_struct *work)
>                         complete(&con->complete);
>         }
>
> -       if (con->status.change & UCSI_CONSTAT_CONNECT_CHANGE) {
> +       if (UCSI_CONSTAT_CHANGE(con->status) & UCSI_CONSTAT_CONNECT_CHANG=
E) {
>                 typec_set_pwr_role(con->port, role);
>                 ucsi_port_psy_changed(con);
>                 ucsi_partner_change(con);
>
> -               if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
> +               if (UCSI_CONSTAT_CONNECTED(con->status)) {
>                         ucsi_register_partner(con);
>                         ucsi_partner_task(con, ucsi_check_connection, 1, =
HZ);
>                         ucsi_partner_task(con, ucsi_check_connector_capab=
ility, 1, HZ);
> @@ -1241,19 +1241,18 @@ static void ucsi_handle_connector_change(struct w=
ork_struct *work)
>                         if (con->ucsi->cap.features & UCSI_CAP_CABLE_DETA=
ILS)
>                                 ucsi_partner_task(con, ucsi_check_cable, =
1, HZ);
>
> -                       if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) =
=3D=3D
> -                           UCSI_CONSTAT_PWR_OPMODE_PD)
> +                       if (UCSI_CONSTAT_PWR_OPMODE(con->status) =3D=3D U=
CSI_CONSTAT_PWR_OPMODE_PD)
>                                 ucsi_partner_task(con, ucsi_register_part=
ner_pdos, 1, HZ);
>                 } else {
>                         ucsi_unregister_partner(con);
>                 }
>         }
>
> -       if (con->status.change & UCSI_CONSTAT_POWER_OPMODE_CHANGE ||
> -           con->status.change & UCSI_CONSTAT_POWER_LEVEL_CHANGE)
> +       if (UCSI_CONSTAT_CHANGE(con->status) & (UCSI_CONSTAT_POWER_OPMODE=
_CHANGE |
> +                                                 UCSI_CONSTAT_POWER_LEVE=
L_CHANGE))
>                 ucsi_pwr_opmode_change(con);
>
> -       if (con->partner && con->status.change & UCSI_CONSTAT_PARTNER_CHA=
NGE) {
> +       if (con->partner && UCSI_CONSTAT_CHANGE(con->status) & UCSI_CONST=
AT_PARTNER_CHANGE) {
>                 ucsi_partner_change(con);
>
>                 /* Complete pending data role swap */
> @@ -1261,10 +1260,10 @@ static void ucsi_handle_connector_change(struct w=
ork_struct *work)
>                         complete(&con->complete);
>         }
>
> -       if (con->status.change & UCSI_CONSTAT_CAM_CHANGE)
> +       if (UCSI_CONSTAT_CHANGE(con->status) & UCSI_CONSTAT_CAM_CHANGE)
>                 ucsi_partner_task(con, ucsi_check_altmodes, 1, HZ);
>
> -       if (con->status.change & UCSI_CONSTAT_BC_CHANGE)
> +       if (UCSI_CONSTAT_CHANGE(con->status) & UCSI_CONSTAT_BC_CHANGE)
>                 ucsi_port_psy_changed(con);
>
>  out_unlock:
> @@ -1424,7 +1423,7 @@ static int ucsi_dr_swap(struct typec_port *port, en=
um typec_data_role role)
>                 goto out_unlock;
>         }
>
> -       partner_type =3D UCSI_CONSTAT_PARTNER_TYPE(con->status.flags);
> +       partner_type =3D UCSI_CONSTAT_PARTNER_TYPE(con->status);
>         if ((partner_type =3D=3D UCSI_CONSTAT_PARTNER_TYPE_DFP &&
>              role =3D=3D TYPEC_DEVICE) ||
>             (partner_type =3D=3D UCSI_CONSTAT_PARTNER_TYPE_UFP &&
> @@ -1468,7 +1467,7 @@ static int ucsi_pr_swap(struct typec_port *port, en=
um typec_role role)
>                 goto out_unlock;
>         }
>
> -       cur_role =3D !!(con->status.flags & UCSI_CONSTAT_PWR_DIR);
> +       cur_role =3D UCSI_CONSTAT_PWR_DIR(con->status);
>
>         if (cur_role =3D=3D role)
>                 goto out_unlock;
> @@ -1491,8 +1490,7 @@ static int ucsi_pr_swap(struct typec_port *port, en=
um typec_role role)
>         mutex_lock(&con->lock);
>
>         /* Something has gone wrong while swapping the role */
> -       if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) !=3D
> -           UCSI_CONSTAT_PWR_OPMODE_PD) {
> +       if (UCSI_CONSTAT_PWR_OPMODE(con->status) !=3D UCSI_CONSTAT_PWR_OP=
MODE_PD) {
>                 ucsi_reset_connector(con, true);
>                 ret =3D -EPROTO;
>         }
> @@ -1623,7 +1621,7 @@ static int ucsi_register_port(struct ucsi *ucsi, st=
ruct ucsi_connector *con)
>         if (ucsi->ops->connector_status)
>                 ucsi->ops->connector_status(con);
>
> -       switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
> +       switch (UCSI_CONSTAT_PARTNER_TYPE(con->status)) {
>         case UCSI_CONSTAT_PARTNER_TYPE_UFP:
>         case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
>                 u_role =3D USB_ROLE_HOST;
> @@ -1640,9 +1638,8 @@ static int ucsi_register_port(struct ucsi *ucsi, st=
ruct ucsi_connector *con)
>         }
>
>         /* Check if there is already something connected */
> -       if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
> -               typec_set_pwr_role(con->port,
> -                                 !!(con->status.flags & UCSI_CONSTAT_PWR=
_DIR));
> +       if (UCSI_CONSTAT_CONNECTED(con->status)) {
> +               typec_set_pwr_role(con->port, UCSI_CONSTAT_PWR_DIR(con->s=
tatus));
>                 ucsi_register_partner(con);
>                 ucsi_pwr_opmode_change(con);
>                 ucsi_port_psy_changed(con);
> @@ -1653,7 +1650,7 @@ static int ucsi_register_port(struct ucsi *ucsi, st=
ruct ucsi_connector *con)
>         }
>
>         /* Only notify USB controller if partner supports USB data */
> -       if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) & UCSI_CONSTA=
T_PARTNER_FLAG_USB))
> +       if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status) & UCSI_CONSTAT_PART=
NER_FLAG_USB))
>                 u_role =3D USB_ROLE_NONE;
>
>         ret =3D usb_role_switch_set_role(con->usb_role_sw, u_role);
> @@ -1663,15 +1660,13 @@ static int ucsi_register_port(struct ucsi *ucsi, =
struct ucsi_connector *con)
>                 ret =3D 0;
>         }
>
> -       if (con->partner &&
> -           UCSI_CONSTAT_PWR_OPMODE(con->status.flags) =3D=3D
> -           UCSI_CONSTAT_PWR_OPMODE_PD) {
> +       if (con->partner && UCSI_CONSTAT_PWR_OPMODE(con->status) =3D=3D U=
CSI_CONSTAT_PWR_OPMODE_PD) {
>                 ucsi_register_device_pdos(con);
>                 ucsi_get_src_pdos(con);
>                 ucsi_check_altmodes(con);
>         }
>
> -       trace_ucsi_register_port(con->num, &con->status);
> +       trace_ucsi_register_port(con->num, con->status);
>
>  out:
>         fwnode_handle_put(cap->fwnode);
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.=
h
> index 63cc7f982663..dfbc0f6c1b9b 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -4,6 +4,7 @@
>  #define __DRIVER_USB_TYPEC_UCSI_H
>
>  #include <linux/bitops.h>
> +#include <linux/bitfield.h>
>  #include <linux/completion.h>
>  #include <linux/device.h>
>  #include <linux/power_supply.h>
> @@ -312,48 +313,55 @@ struct ucsi_cable_property {
>  } __packed;
>
>  /* Data structure filled by PPM in response to GET_CONNECTOR_STATUS comm=
and. */
> -struct ucsi_connector_status {
> -       u16 change;
> -#define UCSI_CONSTAT_EXT_SUPPLY_CHANGE         BIT(1)
> -#define UCSI_CONSTAT_POWER_OPMODE_CHANGE       BIT(2)
> -#define UCSI_CONSTAT_PDOS_CHANGE               BIT(5)
> -#define UCSI_CONSTAT_POWER_LEVEL_CHANGE                BIT(6)
> -#define UCSI_CONSTAT_PD_RESET_COMPLETE         BIT(7)
> -#define UCSI_CONSTAT_CAM_CHANGE                        BIT(8)
> -#define UCSI_CONSTAT_BC_CHANGE                 BIT(9)
> -#define UCSI_CONSTAT_PARTNER_CHANGE            BIT(11)
> -#define UCSI_CONSTAT_POWER_DIR_CHANGE          BIT(12)
> -#define UCSI_CONSTAT_CONNECT_CHANGE            BIT(14)
> -#define UCSI_CONSTAT_ERROR                     BIT(15)
> -       u16 flags;
> -#define UCSI_CONSTAT_PWR_OPMODE(_f_)           ((_f_) & GENMASK(2, 0))
> +#define UCSI_CONSTAT_CHANGE(status)            UCSI_FIELD(status, 0, 16)
> +#define   UCSI_CONSTAT_EXT_SUPPLY_CHANGE       BIT(1)
> +#define   UCSI_CONSTAT_POWER_OPMODE_CHANGE     BIT(2)
> +#define   UCSI_CONSTAT_PDOS_CHANGE             BIT(5)
> +#define   UCSI_CONSTAT_POWER_LEVEL_CHANGE      BIT(6)
> +#define   UCSI_CONSTAT_PD_RESET_COMPLETE       BIT(7)
> +#define   UCSI_CONSTAT_CAM_CHANGE              BIT(8)
> +#define   UCSI_CONSTAT_BC_CHANGE               BIT(9)
> +#define   UCSI_CONSTAT_PARTNER_CHANGE          BIT(11)
> +#define   UCSI_CONSTAT_POWER_DIR_CHANGE                BIT(12)
> +#define   UCSI_CONSTAT_CONNECT_CHANGE          BIT(14)
> +#define   UCSI_CONSTAT_ERROR                   BIT(15)
> +#define UCSI_CONSTAT_PWR_OPMODE(status)                UCSI_FIELD(status=
, 16, 3)
>  #define   UCSI_CONSTAT_PWR_OPMODE_NONE         0
>  #define   UCSI_CONSTAT_PWR_OPMODE_DEFAULT      1
>  #define   UCSI_CONSTAT_PWR_OPMODE_BC           2
>  #define   UCSI_CONSTAT_PWR_OPMODE_PD           3
>  #define   UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5     4
>  #define   UCSI_CONSTAT_PWR_OPMODE_TYPEC3_0     5
> -#define UCSI_CONSTAT_CONNECTED                 BIT(3)
> -#define UCSI_CONSTAT_PWR_DIR                   BIT(4)
> -#define UCSI_CONSTAT_PARTNER_FLAGS(_f_)                (((_f_) & GENMASK=
(12, 5)) >> 5)
> +#define UCSI_CONSTAT_CONNECTED(status)         UCSI_FIELD(status, 19, 1)
> +#define UCSI_CONSTAT_PWR_DIR(status)           UCSI_FIELD(status, 20, 1)
> +#define UCSI_CONSTAT_PARTNER_FLAGS(status)     UCSI_FIELD(status, 21, 8)
>  #define   UCSI_CONSTAT_PARTNER_FLAG_USB                1
>  #define   UCSI_CONSTAT_PARTNER_FLAG_ALT_MODE   2
> -#define UCSI_CONSTAT_PARTNER_TYPE(_f_)         (((_f_) & GENMASK(15, 13)=
) >> 13)
> +#define UCSI_CONSTAT_PARTNER_TYPE(status)      UCSI_FIELD(status, 29, 3)
>  #define   UCSI_CONSTAT_PARTNER_TYPE_DFP                1
>  #define   UCSI_CONSTAT_PARTNER_TYPE_UFP                2
> -#define   UCSI_CONSTAT_PARTNER_TYPE_CABLE      3 /* Powered Cable */
> -#define   UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP      4 /* Powered Cabl=
e */
> +#define   UCSI_CONSTAT_PARTNER_TYPE_CABLE      3   /* Powered Cable */
> +#define   UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP 4 /* Powered Cable */
>  #define   UCSI_CONSTAT_PARTNER_TYPE_DEBUG      5
>  #define   UCSI_CONSTAT_PARTNER_TYPE_AUDIO      6
> -       u32 request_data_obj;
> -
> -       u8 pwr_status;
> -#define UCSI_CONSTAT_BC_STATUS(_p_)            ((_p_) & GENMASK(1, 0))
> +#define UCSI_CONSTAT_RDO(status)               UCSI_FIELD(status, 32, 32=
)
> +#define UCSI_CONSTAT_BC_STATUS(status)         UCSI_FIELD(status, 64, 2)
>  #define   UCSI_CONSTAT_BC_NOT_CHARGING         0
>  #define   UCSI_CONSTAT_BC_NOMINAL_CHARGING     1
>  #define   UCSI_CONSTAT_BC_SLOW_CHARGING                2
>  #define   UCSI_CONSTAT_BC_TRICKLE_CHARGING     3
> -} __packed;
> +#define UCSI_CONSTAT_PD_VERSION(status)                UCSI_FIELD(status=
, 70, 16)
> +
> +/*
> + * UCSI specific wrapper for FIELD_GET() that allows access to fields be=
yond
> + * 64-bits.
> + */
> +#define UCSI_FIELD(data, offset, size)                                 \
> +       ({                                                              \
> +               u8 m =3D ((offset) % 8);                                 =
 \
> +               FIELD_GET((GENMASK((m + ((size) - 1)), m)),             \
> +                         (*((u32 *)(&((u8 *)data)[((offset) / 8)])))); \
> +       })

This macro could try to read beyond the bounds of the array. I made a
similar attempt at the macros in the past here:
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/=
5274219
I wasn't happy with how verbose things turned out so didn't end up
sending an RFC but that code could probably be cleaned up to fit into
what you're trying to accomplish in this patch.

>
>  /* ---------------------------------------------------------------------=
----- */
>
> @@ -433,7 +441,7 @@ struct ucsi_connector {
>
>         struct typec_capability typec_cap;
>
> -       struct ucsi_connector_status status;
> +       u8 status[19];

I think it's still useful to declare a struct containing the array
otherwise the "19" just looks like a magic number.


>         struct ucsi_connector_capability cap;
>         struct ucsi_cable_property cable_prop;
>         struct power_supply *psy;
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/=
ucsi_acpi.c
> index 7a5dff8d9cc6..41158620f4da 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -143,7 +143,6 @@ static int ucsi_gram_read_message_in(struct ucsi *ucs=
i, void *val, size_t val_le
>         u16 bogus_change =3D UCSI_CONSTAT_POWER_LEVEL_CHANGE |
>                            UCSI_CONSTAT_PDOS_CHANGE;
>         struct ucsi_acpi *ua =3D ucsi_get_drvdata(ucsi);
> -       struct ucsi_connector_status *status;
>         int ret;
>
>         ret =3D ucsi_acpi_read_message_in(ucsi, val, val_len);
> @@ -152,11 +151,9 @@ static int ucsi_gram_read_message_in(struct ucsi *uc=
si, void *val, size_t val_le
>
>         if (UCSI_COMMAND(ua->cmd) =3D=3D UCSI_GET_CONNECTOR_STATUS &&
>             ua->check_bogus_event) {
> -               status =3D (struct ucsi_connector_status *)val;
> -
>                 /* Clear the bogus change */
> -               if (status->change =3D=3D bogus_change)
> -                       status->change =3D 0;
> +               if (UCSI_CONSTAT_CHANGE(val) =3D=3D bogus_change)
> +                       *(u16 *)val =3D 0;
>
>                 ua->check_bogus_event =3D false;
>         }
> --
> 2.45.2
>

