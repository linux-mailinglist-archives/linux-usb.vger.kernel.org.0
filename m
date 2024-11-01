Return-Path: <linux-usb+bounces-16958-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C179B968F
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2024 18:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAF88282F79
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2024 17:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3FD1CCEF7;
	Fri,  1 Nov 2024 17:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GJjGvwBs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04C21CB321
	for <linux-usb@vger.kernel.org>; Fri,  1 Nov 2024 17:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730482218; cv=none; b=PlFNW07K9YxzvzmpH2XBmCICOd7wTOYCgdl6DDUNMlrh1PI29s742yAGpq87ZiS2ZCB3OjdKpXO1qq+j5cvWj/ObsxIC1QLGwA9NNE1oY0Hu9nNG8viO5lRUPKHdp5i0CEqLOKgJ+ZyaZBq/hrNXRhQWzI2TY6CQRj/1B/8frag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730482218; c=relaxed/simple;
	bh=tVVSkubMUHxh4zFuiD/6FACJcCUEjMZLpvgMpnMNOEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEwSFMmfUnVfG7XYOWJEOEAHFjLf5f1pK5vvEWkzM1Jhujn+WTu3iTnTQeSE52wkD3NtMhpDY+XEXfD0VU/TTKax6aGaN04LnQLVP5XKHYFxgYJ8DQS6QzBHr7ygIvFBO01n45zGieT3rMDtJWy5JEihQBvdyEMSuxOBdsAGBLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GJjGvwBs; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e9ed5e57a7so17634687b3.1
        for <linux-usb@vger.kernel.org>; Fri, 01 Nov 2024 10:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730482215; x=1731087015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52o+lpTOxQtf6iFG54v2WFfcgDtahawI1AnUAEDIoqI=;
        b=GJjGvwBspKAaprm9vSUKsdbHShR4ufmVXer5psaey2PNJNtVwrVb/+OBwbsdn6aAd4
         36yJSorHV7Rat0qhflm2I3OW7EzwRsM6WRXn8IQtBDSpRsy110VC6o3dCrLJT9LrqVqM
         ypnlCl7+P1X/7fNj8JKhrzya6MfyVXgIe2cts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730482215; x=1731087015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52o+lpTOxQtf6iFG54v2WFfcgDtahawI1AnUAEDIoqI=;
        b=CpKIyBohm5U2Zg2sK5LIrU8PhI6onJeXgBCBQa4LbHw/86LvB3WEJONHClgIjtQRSP
         jiSOabN/hbwPCXcloodPPt3w95RJW5Oh1d615/CttERawhLmJTOAMKIhQ0bytI9phlAC
         FeUFVlKpMTudCBDU8rCA6bq99gzA4TP7T6qkZC/Dy3Pyzh4dHQUYCsyb+lp3wBDilPkl
         I3Bu+qjHpajRbHuLDeN/0Hr3Rs8KV8IHT2BtsG9ju/rQzu/Teynk3nAGf1NcBlJLyC/t
         +SVzZ4ZAg+XFNVGguO3CAa2p7v167Y6O2Q1f06YJzLgEeh68QsI3kvVDYZW0p4fCY/vo
         JQBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2PWltkC8GN2a+Gwoxm50dg+m0jVSNeJ01m5rany0dY20kLcGdxx2+e2D3vK2y0C4UH9QAYqtlUvg=@vger.kernel.org
X-Gm-Message-State: AOJu0YydKVg/eEzLFXMQ8elVyfbA6vF0tGNuPu2hG8kk27QsU7jm7cQm
	lxcH5SRbn84t6+to91uxc0HyjAxwFgncmz6e8innUt5udeeZRRqSjwxTOL97c2TM89+GuC2SU+l
	DmIHZXyMw+G8uz+r20IMfOZq9OaEG77VaXWNlqG1yb95fGqjsRw==
X-Google-Smtp-Source: AGHT+IHCOWneNo2ZlErAu66/1IDmVo1Tl5YqmvXopF6fYPRNTil9cheh8IjQczRXypP8j/8JSOpBlN41bLW+a7p0+MY=
X-Received: by 2002:a05:690c:b8b:b0:6e3:167e:c70e with SMTP id
 00721157ae682-6ea525521a9mr74318357b3.45.1730482214578; Fri, 01 Nov 2024
 10:30:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031154122.2641624-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20241031154122.2641624-1-heikki.krogerus@linux.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Fri, 1 Nov 2024 10:30:02 -0700
Message-ID: <CANFp7mUQCPM3N9WFOCoj85e1vP6ctvrSHeNROgvt1sXCK35qkw@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: ucsi: Convert connector specific commands
 to bitmaps
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jameson Thies <jthies@google.com>, 
	Benson Leung <bleung@chromium.org>, Bartosz Szpila <bszpila@google.com>, 
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 8:42=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> That allows the fields in those command data structures to
> be easily validated. If an unsupported field is accessed, a
> warning is generated.
>
> This will not force UCSI version checks to be made in every
> place where these data structures are accessed, but it will
> make it easier to pinpoint issues that are caused by the
> unconditional accesses to those fields, and perhaps more
> importantly, allow those issues to be noticed immediately.
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
> Hi,
>
> This was an RFC that I send earlier [1]. I used Dmitry's proposal
> for the macros, so they are now UCSI_DECLARE_BITFIELD_Vx_x.
>
> [1] https://lore.kernel.org/linux-usb/20240903145342.3449969-3-heikki.kro=
gerus@linux.intel.com/
>
> thanks,
> ---
>  drivers/usb/typec/ucsi/psy.c       |  28 ++--
>  drivers/usb/typec/ucsi/trace.h     |  28 ++--
>  drivers/usb/typec/ucsi/ucsi.c      | 114 +++++++------
>  drivers/usb/typec/ucsi/ucsi.h      | 252 +++++++++++++++++------------
>  drivers/usb/typec/ucsi/ucsi_acpi.c |   7 +-
>  5 files changed, 235 insertions(+), 194 deletions(-)
>
> diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
> index 1c631c7855a9..62ac69730405 100644
> --- a/drivers/usb/typec/ucsi/psy.c
> +++ b/drivers/usb/typec/ucsi/psy.c
> @@ -55,8 +55,8 @@ static int ucsi_psy_get_online(struct ucsi_connector *c=
on,
>                                union power_supply_propval *val)
>  {
>         val->intval =3D UCSI_PSY_OFFLINE;
> -       if (con->status.flags & UCSI_CONSTAT_CONNECTED &&
> -           (con->status.flags & UCSI_CONSTAT_PWR_DIR) =3D=3D TYPEC_SINK)
> +       if (UCSI_CONSTAT(con, CONNECTED) &&
> +           (UCSI_CONSTAT(con, PWR_DIR) =3D=3D TYPEC_SINK))
>                 val->intval =3D UCSI_PSY_FIXED_ONLINE;
>         return 0;
>  }
> @@ -66,7 +66,7 @@ static int ucsi_psy_get_voltage_min(struct ucsi_connect=
or *con,
>  {
>         u32 pdo;
>
> -       switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
> +       switch (UCSI_CONSTAT(con, PWR_OPMODE)) {
>         case UCSI_CONSTAT_PWR_OPMODE_PD:
>                 pdo =3D con->src_pdos[0];
>                 val->intval =3D pdo_fixed_voltage(pdo) * 1000;
> @@ -89,7 +89,7 @@ static int ucsi_psy_get_voltage_max(struct ucsi_connect=
or *con,
>  {
>         u32 pdo;
>
> -       switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
> +       switch (UCSI_CONSTAT(con, PWR_OPMODE)) {
>         case UCSI_CONSTAT_PWR_OPMODE_PD:
>                 if (con->num_pdos > 0) {
>                         pdo =3D con->src_pdos[con->num_pdos - 1];
> @@ -117,7 +117,7 @@ static int ucsi_psy_get_voltage_now(struct ucsi_conne=
ctor *con,
>         int index;
>         u32 pdo;
>
> -       switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
> +       switch (UCSI_CONSTAT(con, PWR_OPMODE)) {
>         case UCSI_CONSTAT_PWR_OPMODE_PD:
>                 index =3D rdo_index(con->rdo);
>                 if (index > 0) {
> @@ -145,7 +145,7 @@ static int ucsi_psy_get_current_max(struct ucsi_conne=
ctor *con,
>  {
>         u32 pdo;
>
> -       switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
> +       switch (UCSI_CONSTAT(con, PWR_OPMODE)) {
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
> +       if (UCSI_CONSTAT(con, PWR_OPMODE) =3D=3D UCSI_CONSTAT_PWR_OPMODE_=
PD)
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
> +       if (UCSI_CONSTAT(con, CONNECTED) &&
> +           UCSI_CONSTAT(con, PWR_OPMODE) =3D=3D UCSI_CONSTAT_PWR_OPMODE_=
PD)
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
> +       if (!(UCSI_CONSTAT(con, CONNECTED))) {
>                 val->intval =3D POWER_SUPPLY_CHARGE_TYPE_NONE;
>                 return 0;
>         }
>
>         /* The Battery Charging Cabability Status field is only valid in =
sink role. */
> -       if ((con->status.flags & UCSI_CONSTAT_PWR_DIR) !=3D TYPEC_SINK) {
> +       if (UCSI_CONSTAT(con, PWR_DIR) !=3D TYPEC_SINK) {
>                 val->intval =3D POWER_SUPPLY_CHARGE_TYPE_UNKNOWN;
>                 return 0;
>         }
>
> -       switch (UCSI_CONSTAT_BC_STATUS(con->status.pwr_status)) {
> +       switch (UCSI_CONSTAT(con, BC_STATUS)) {
>         case UCSI_CONSTAT_BC_NOMINAL_CHARGING:
>                 val->intval =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;
>                 break;
> diff --git a/drivers/usb/typec/ucsi/trace.h b/drivers/usb/typec/ucsi/trac=
e.h
> index a0d3a934d3d9..41701dee7056 100644
> --- a/drivers/usb/typec/ucsi/trace.h
> +++ b/drivers/usb/typec/ucsi/trace.h
> @@ -40,8 +40,8 @@ DEFINE_EVENT(ucsi_log_command, ucsi_reset_ppm,
>  );
>
>  DECLARE_EVENT_CLASS(ucsi_log_connector_status,
> -       TP_PROTO(int port, struct ucsi_connector_status *status),
> -       TP_ARGS(port, status),
> +       TP_PROTO(int port, struct ucsi_connector *con),
> +       TP_ARGS(port, con),
>         TP_STRUCT__entry(
>                 __field(int, port)
>                 __field(u16, change)
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
> +               __entry->change =3D UCSI_CONSTAT(con, CHANGE);
> +               __entry->opmode =3D UCSI_CONSTAT(con, PWR_OPMODE);
> +               __entry->connected =3D UCSI_CONSTAT(con, CONNECTED);
> +               __entry->pwr_dir =3D UCSI_CONSTAT(con, PWR_DIR);
> +               __entry->partner_flags =3D UCSI_CONSTAT(con, PARTNER_FLAG=
S);
> +               __entry->partner_type =3D UCSI_CONSTAT(con, PARTNER_TYPE)=
;
> +               __entry->request_data_obj =3D UCSI_CONSTAT(con, RDO);
> +               __entry->bc_status =3D UCSI_CONSTAT(con, BC_STATUS);
>         ),
>         TP_printk("port%d status: change=3D%04x, opmode=3D%x, connected=
=3D%d, "
>                 "sourcing=3D%d, partner_flags=3D%x, partner_type=3D%x, "
> @@ -73,13 +73,13 @@ DECLARE_EVENT_CLASS(ucsi_log_connector_status,
>  );
>
>  DEFINE_EVENT(ucsi_log_connector_status, ucsi_connector_change,
> -       TP_PROTO(int port, struct ucsi_connector_status *status),
> -       TP_ARGS(port, status)
> +       TP_PROTO(int port, struct ucsi_connector *con),
> +       TP_ARGS(port, con)
>  );
>
>  DEFINE_EVENT(ucsi_log_connector_status, ucsi_register_port,
> -       TP_PROTO(int port, struct ucsi_connector_status *status),
> -       TP_ARGS(port, status)
> +       TP_PROTO(int port, struct ucsi_connector *con),
> +       TP_ARGS(port, con)
>  );
>
>  DECLARE_EVENT_CLASS(ucsi_log_register_altmode,
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index e430a0ca4a2b..2249fa8a01df 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -651,10 +651,11 @@ static void ucsi_unregister_altmodes(struct ucsi_co=
nnector *con, u8 recipient)
>  static int ucsi_get_connector_status(struct ucsi_connector *con, bool co=
nn_ack)
>  {
>         u64 command =3D UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER=
(con->num);
> -       struct ucsi *ucsi =3D con->ucsi;
> +       size_t size =3D min(UCSI_GET_CONNECTOR_STATUS_SIZE, UCSI_MAX_DATA=
_LENGTH(con->ucsi));
>         int ret;
>
> -       ret =3D ucsi_send_command_common(ucsi, command, &con->status, siz=
eof(con->status), conn_ack);
> +       ret =3D ucsi_send_command_common(con->ucsi, command, &con->status=
, size, conn_ack);
> +
>         return ret < 0 ? ret : 0;
>  }
>
> @@ -668,8 +669,7 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
>
>         if (is_partner &&
>             ucsi->quirks & UCSI_NO_PARTNER_PDOS &&
> -           ((con->status.flags & UCSI_CONSTAT_PWR_DIR) ||
> -            !is_source(role)))
> +           (UCSI_CONSTAT(con, PWR_DIR) || !is_source(role)))
>                 return 0;
>
>         command =3D UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(c=
on->num);
> @@ -997,16 +997,16 @@ static int ucsi_check_connector_capability(struct u=
csi_connector *con)
>         }
>
>         typec_partner_set_pd_revision(con->partner,
> -               UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(con->cap.fla=
gs));
> +               UCSI_SPEC_REVISION_TO_BCD(UCSI_CONCAP(con, PARTNER_PD_REV=
ISION)));
>
>         return ret;
>  }
>
>  static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
>  {
> -       switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
> +       switch (UCSI_CONSTAT(con, PWR_OPMODE)) {
>         case UCSI_CONSTAT_PWR_OPMODE_PD:
> -               con->rdo =3D con->status.request_data_obj;
> +               con->rdo =3D UCSI_CONSTAT(con, RDO);
>                 typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_PD);
>                 ucsi_partner_task(con, ucsi_get_src_pdos, 30, 0);
>                 ucsi_partner_task(con, ucsi_check_altmodes, 30, HZ);
> @@ -1030,7 +1030,7 @@ static void ucsi_pwr_opmode_change(struct ucsi_conn=
ector *con)
>
>  static int ucsi_register_partner(struct ucsi_connector *con)
>  {
> -       u8 pwr_opmode =3D UCSI_CONSTAT_PWR_OPMODE(con->status.flags);
> +       u8 pwr_opmode =3D UCSI_CONSTAT(con, PWR_OPMODE);
>         struct typec_partner_desc desc;
>         struct typec_partner *partner;
>
> @@ -1039,7 +1039,7 @@ static int ucsi_register_partner(struct ucsi_connec=
tor *con)
>
>         memset(&desc, 0, sizeof(desc));
>
> -       switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
> +       switch (UCSI_CONSTAT(con, PARTNER_TYPE)) {
>         case UCSI_CONSTAT_PARTNER_TYPE_DEBUG:
>                 desc.accessory =3D TYPEC_ACCESSORY_DEBUG;
>                 break;
> @@ -1057,6 +1057,9 @@ static int ucsi_register_partner(struct ucsi_connec=
tor *con)
>                 desc.identity =3D &con->partner_identity;
>         desc.usb_pd =3D pwr_opmode =3D=3D UCSI_CONSTAT_PWR_OPMODE_PD;
>
> +       if (con->ucsi->version >=3D UCSI_VERSION_2_1)
> +               desc.pd_revision =3D UCSI_SPEC_REVISION_TO_BCD(UCSI_CONCA=
P(con, PARTNER_PD_REVISION));
> +
>         partner =3D typec_register_partner(con->port, &desc);
>         if (IS_ERR(partner)) {
>                 dev_err(con->ucsi->dev,
> @@ -1067,13 +1070,11 @@ static int ucsi_register_partner(struct ucsi_conn=
ector *con)
>
>         con->partner =3D partner;
>
> -       if ((con->ucsi->version >=3D UCSI_VERSION_3_0) &&
> -           (UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) &
> -            UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN4))
> +       if (con->ucsi->version >=3D UCSI_VERSION_3_0 &&
> +           UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN4))
>                 typec_partner_set_usb_mode(partner, USB_MODE_USB4);
> -       else if ((con->ucsi->version >=3D UCSI_VERSION_2_0) &&
> -                (UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) &
> -                 UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN3))
> +       else if (con->ucsi->version >=3D UCSI_VERSION_2_0 &&
> +                UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN3))
>                 typec_partner_set_usb_mode(partner, USB_MODE_USB4);
>
>         return 0;
> @@ -1100,7 +1101,7 @@ static void ucsi_partner_change(struct ucsi_connect=
or *con)
>         enum usb_role u_role =3D USB_ROLE_NONE;
>         int ret;
>
> -       switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
> +       switch (UCSI_CONSTAT(con, PARTNER_TYPE)) {
>         case UCSI_CONSTAT_PARTNER_TYPE_UFP:
>         case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
>                 u_role =3D USB_ROLE_HOST;
> @@ -1116,8 +1117,8 @@ static void ucsi_partner_change(struct ucsi_connect=
or *con)
>                 break;
>         }
>
> -       if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
> -               switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
> +       if (UCSI_CONSTAT(con, CONNECTED)) {
> +               switch (UCSI_CONSTAT(con, PARTNER_TYPE)) {
>                 case UCSI_CONSTAT_PARTNER_TYPE_DEBUG:
>                         typec_set_mode(con->port, TYPEC_MODE_DEBUG);
>                         break;
> @@ -1125,14 +1126,13 @@ static void ucsi_partner_change(struct ucsi_conne=
ctor *con)
>                         typec_set_mode(con->port, TYPEC_MODE_AUDIO);
>                         break;
>                 default:
> -                       if (UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags)=
 =3D=3D
> -                                       UCSI_CONSTAT_PARTNER_FLAG_USB)
> +                       if (UCSI_CONSTAT(con, PARTNER_FLAG_USB))
>                                 typec_set_mode(con->port, TYPEC_STATE_USB=
);
>                 }
>         }
>
>         /* Only notify USB controller if partner supports USB data */
> -       if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) & UCSI_CONSTA=
T_PARTNER_FLAG_USB))
> +       if (!(UCSI_CONSTAT(con, PARTNER_FLAG_USB)))
>                 u_role =3D USB_ROLE_NONE;
>
>         ret =3D usb_role_switch_set_role(con->usb_role_sw, u_role);
> @@ -1143,7 +1143,7 @@ static void ucsi_partner_change(struct ucsi_connect=
or *con)
>
>  static int ucsi_check_connection(struct ucsi_connector *con)
>  {
> -       u8 prev_flags =3D con->status.flags;
> +       u8 prev_state =3D UCSI_CONSTAT(con, CONNECTED);
>         int ret;
>
>         ret =3D ucsi_get_connector_status(con, false);
> @@ -1152,10 +1152,9 @@ static int ucsi_check_connection(struct ucsi_conne=
ctor *con)
>                 return ret;
>         }
>
> -       if (con->status.flags =3D=3D prev_flags)
> -               return 0;
> -
> -       if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
> +       if (UCSI_CONSTAT(con, CONNECTED)) {
> +               if (prev_state)
> +                       return 0;
>                 ucsi_register_partner(con);
>                 ucsi_pwr_opmode_change(con);
>                 ucsi_partner_change(con);
> @@ -1211,6 +1210,7 @@ static void ucsi_handle_connector_change(struct wor=
k_struct *work)
>                                                   work);
>         struct ucsi *ucsi =3D con->ucsi;
>         enum typec_role role;
> +       u16 change;
>         int ret;
>
>         mutex_lock(&con->lock);
> @@ -1227,14 +1227,15 @@ static void ucsi_handle_connector_change(struct w=
ork_struct *work)
>                 goto out_unlock;
>         }
>
> -       trace_ucsi_connector_change(con->num, &con->status);
> +       trace_ucsi_connector_change(con->num, con);
>
>         if (ucsi->ops->connector_status)
>                 ucsi->ops->connector_status(con);
>
> -       role =3D !!(con->status.flags & UCSI_CONSTAT_PWR_DIR);
> +       change =3D UCSI_CONSTAT(con, CHANGE);
> +       role =3D UCSI_CONSTAT(con, PWR_DIR);
>
> -       if (con->status.change & UCSI_CONSTAT_POWER_DIR_CHANGE) {
> +       if (change & UCSI_CONSTAT_POWER_DIR_CHANGE) {
>                 typec_set_pwr_role(con->port, role);
>
>                 /* Complete pending power role swap */
> @@ -1242,12 +1243,12 @@ static void ucsi_handle_connector_change(struct w=
ork_struct *work)
>                         complete(&con->complete);
>         }
>
> -       if (con->status.change & UCSI_CONSTAT_CONNECT_CHANGE) {
> +       if (change & UCSI_CONSTAT_CONNECT_CHANGE) {
>                 typec_set_pwr_role(con->port, role);
>                 ucsi_port_psy_changed(con);
>                 ucsi_partner_change(con);
>
> -               if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
> +               if (UCSI_CONSTAT(con, CONNECTED)) {
>                         ucsi_register_partner(con);
>                         ucsi_partner_task(con, ucsi_check_connection, 1, =
HZ);
>                         if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MES=
SAGE)
> @@ -1255,8 +1256,7 @@ static void ucsi_handle_connector_change(struct wor=
k_struct *work)
>                         if (con->ucsi->cap.features & UCSI_CAP_CABLE_DETA=
ILS)
>                                 ucsi_partner_task(con, ucsi_check_cable, =
1, HZ);
>
> -                       if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) =
=3D=3D
> -                           UCSI_CONSTAT_PWR_OPMODE_PD) {
> +                       if (UCSI_CONSTAT(con, PWR_OPMODE) =3D=3D UCSI_CON=
STAT_PWR_OPMODE_PD) {
>                                 ucsi_partner_task(con, ucsi_register_part=
ner_pdos, 1, HZ);
>                                 ucsi_partner_task(con, ucsi_check_connect=
or_capability, 1, HZ);
>                         }
> @@ -1265,11 +1265,10 @@ static void ucsi_handle_connector_change(struct w=
ork_struct *work)
>                 }
>         }
>
> -       if (con->status.change & UCSI_CONSTAT_POWER_OPMODE_CHANGE ||
> -           con->status.change & UCSI_CONSTAT_POWER_LEVEL_CHANGE)
> +       if (change & (UCSI_CONSTAT_POWER_OPMODE_CHANGE | UCSI_CONSTAT_POW=
ER_LEVEL_CHANGE))
>                 ucsi_pwr_opmode_change(con);
>
> -       if (con->partner && con->status.change & UCSI_CONSTAT_PARTNER_CHA=
NGE) {
> +       if (con->partner && (change & UCSI_CONSTAT_PARTNER_CHANGE)) {
>                 ucsi_partner_change(con);
>
>                 /* Complete pending data role swap */
> @@ -1277,10 +1276,10 @@ static void ucsi_handle_connector_change(struct w=
ork_struct *work)
>                         complete(&con->complete);
>         }
>
> -       if (con->status.change & UCSI_CONSTAT_CAM_CHANGE)
> +       if (change & UCSI_CONSTAT_CAM_CHANGE)
>                 ucsi_partner_task(con, ucsi_check_altmodes, 1, HZ);
>
> -       if (con->status.change & UCSI_CONSTAT_BC_CHANGE)
> +       if (change & UCSI_CONSTAT_BC_CHANGE)
>                 ucsi_port_psy_changed(con);
>
>  out_unlock:
> @@ -1440,7 +1439,7 @@ static int ucsi_dr_swap(struct typec_port *port, en=
um typec_data_role role)
>                 goto out_unlock;
>         }
>
> -       partner_type =3D UCSI_CONSTAT_PARTNER_TYPE(con->status.flags);
> +       partner_type =3D UCSI_CONSTAT(con, PARTNER_TYPE);
>         if ((partner_type =3D=3D UCSI_CONSTAT_PARTNER_TYPE_DFP &&
>              role =3D=3D TYPEC_DEVICE) ||
>             (partner_type =3D=3D UCSI_CONSTAT_PARTNER_TYPE_UFP &&
> @@ -1484,7 +1483,7 @@ static int ucsi_pr_swap(struct typec_port *port, en=
um typec_role role)
>                 goto out_unlock;
>         }
>
> -       cur_role =3D !!(con->status.flags & UCSI_CONSTAT_PWR_DIR);
> +       cur_role =3D UCSI_CONSTAT(con, PWR_DIR);
>
>         if (cur_role =3D=3D role)
>                 goto out_unlock;
> @@ -1507,8 +1506,7 @@ static int ucsi_pr_swap(struct typec_port *port, en=
um typec_role role)
>         mutex_lock(&con->lock);
>
>         /* Something has gone wrong while swapping the role */
> -       if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) !=3D
> -           UCSI_CONSTAT_PWR_OPMODE_PD) {
> +       if (UCSI_CONSTAT(con, PWR_OPMODE) !=3D UCSI_CONSTAT_PWR_OPMODE_PD=
) {
>                 ucsi_reset_connector(con, true);
>                 ret =3D -EPROTO;
>         }
> @@ -1576,19 +1574,18 @@ static int ucsi_register_port(struct ucsi *ucsi, =
struct ucsi_connector *con)
>         if (ret < 0)
>                 goto out_unlock;
>
> -       if (con->cap.op_mode & UCSI_CONCAP_OPMODE_DRP)
> +       if (UCSI_CONCAP(con, OPMODE_DRP))
>                 cap->data =3D TYPEC_PORT_DRD;
> -       else if (con->cap.op_mode & UCSI_CONCAP_OPMODE_DFP)
> +       else if (UCSI_CONCAP(con, OPMODE_DFP))
>                 cap->data =3D TYPEC_PORT_DFP;
> -       else if (con->cap.op_mode & UCSI_CONCAP_OPMODE_UFP)
> +       else if (UCSI_CONCAP(con, OPMODE_UFP))
>                 cap->data =3D TYPEC_PORT_UFP;
>
> -       if ((con->cap.flags & UCSI_CONCAP_FLAG_PROVIDER) &&
> -           (con->cap.flags & UCSI_CONCAP_FLAG_CONSUMER))
> +       if (UCSI_CONCAP(con, PROVIDER) && UCSI_CONCAP(con, CONSUMER))
>                 cap->type =3D TYPEC_PORT_DRP;
> -       else if (con->cap.flags & UCSI_CONCAP_FLAG_PROVIDER)
> +       else if (UCSI_CONCAP(con, PROVIDER))
>                 cap->type =3D TYPEC_PORT_SRC;
> -       else if (con->cap.flags & UCSI_CONCAP_FLAG_CONSUMER)
> +       else if (UCSI_CONCAP(con, CONSUMER))
>                 cap->type =3D TYPEC_PORT_SNK;
>
>         cap->revision =3D ucsi->cap.typec_version;
> @@ -1596,9 +1593,9 @@ static int ucsi_register_port(struct ucsi *ucsi, st=
ruct ucsi_connector *con)
>         cap->svdm_version =3D SVDM_VER_2_0;
>         cap->prefer_role =3D TYPEC_NO_PREFERRED_ROLE;
>
> -       if (con->cap.op_mode & UCSI_CONCAP_OPMODE_AUDIO_ACCESSORY)
> +       if (UCSI_CONCAP(con, OPMODE_AUDIO_ACCESSORY))
>                 *accessory++ =3D TYPEC_ACCESSORY_AUDIO;
> -       if (con->cap.op_mode & UCSI_CONCAP_OPMODE_DEBUG_ACCESSORY)
> +       if (UCSI_CONCAP(con, OPMODE_DEBUG_ACCESSORY))
>                 *accessory =3D TYPEC_ACCESSORY_DEBUG;
>
>         if (UCSI_CONCAP_USB2_SUPPORT(con))
> @@ -1646,7 +1643,7 @@ static int ucsi_register_port(struct ucsi *ucsi, st=
ruct ucsi_connector *con)
>         if (ucsi->ops->connector_status)
>                 ucsi->ops->connector_status(con);
>
> -       switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
> +       switch (UCSI_CONSTAT(con, PARTNER_TYPE)) {
>         case UCSI_CONSTAT_PARTNER_TYPE_UFP:
>         case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
>                 u_role =3D USB_ROLE_HOST;
> @@ -1663,9 +1660,8 @@ static int ucsi_register_port(struct ucsi *ucsi, st=
ruct ucsi_connector *con)
>         }
>
>         /* Check if there is already something connected */
> -       if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
> -               typec_set_pwr_role(con->port,
> -                                 !!(con->status.flags & UCSI_CONSTAT_PWR=
_DIR));
> +       if (UCSI_CONSTAT(con, CONNECTED)) {
> +               typec_set_pwr_role(con->port, UCSI_CONSTAT(con, PWR_DIR))=
;
>                 ucsi_register_partner(con);
>                 ucsi_pwr_opmode_change(con);
>                 ucsi_port_psy_changed(con);
> @@ -1676,7 +1672,7 @@ static int ucsi_register_port(struct ucsi *ucsi, st=
ruct ucsi_connector *con)
>         }
>
>         /* Only notify USB controller if partner supports USB data */
> -       if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) & UCSI_CONSTA=
T_PARTNER_FLAG_USB))
> +       if (!(UCSI_CONSTAT(con, PARTNER_FLAG_USB)))
>                 u_role =3D USB_ROLE_NONE;
>
>         ret =3D usb_role_switch_set_role(con->usb_role_sw, u_role);
> @@ -1686,16 +1682,14 @@ static int ucsi_register_port(struct ucsi *ucsi, =
struct ucsi_connector *con)
>                 ret =3D 0;
>         }
>
> -       if (con->partner &&
> -           UCSI_CONSTAT_PWR_OPMODE(con->status.flags) =3D=3D
> -           UCSI_CONSTAT_PWR_OPMODE_PD) {
> +       if (con->partner && UCSI_CONSTAT(con, PWR_OPMODE) =3D=3D UCSI_CON=
STAT_PWR_OPMODE_PD) {
>                 ucsi_register_device_pdos(con);
>                 ucsi_get_src_pdos(con);
>                 ucsi_check_altmodes(con);
>                 ucsi_check_connector_capability(con);
>         }
>
> -       trace_ucsi_register_port(con->num, &con->status);
> +       trace_ucsi_register_port(con->num, con);
>
>  out:
>         fwnode_handle_put(cap->fwnode);
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.=
h
> index b82dc4c16a0d..831b79a6a6e4 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -4,6 +4,7 @@
>  #define __DRIVER_USB_TYPEC_UCSI_H
>
>  #include <linux/bitops.h>
> +#include <linux/bitmap.h>
>  #include <linux/completion.h>
>  #include <linux/device.h>
>  #include <linux/power_supply.h>
> @@ -95,27 +96,31 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num)=
;
>  /* ---------------------------------------------------------------------=
----- */
>
>  /* Commands */
> -#define UCSI_PPM_RESET                 0x01
> -#define UCSI_CANCEL                    0x02
> -#define UCSI_CONNECTOR_RESET           0x03
> -#define UCSI_ACK_CC_CI                 0x04
> -#define UCSI_SET_NOTIFICATION_ENABLE   0x05
> -#define UCSI_GET_CAPABILITY            0x06
> -#define UCSI_GET_CONNECTOR_CAPABILITY  0x07
> -#define UCSI_SET_UOM                   0x08
> -#define UCSI_SET_UOR                   0x09
> -#define UCSI_SET_PDM                   0x0a
> -#define UCSI_SET_PDR                   0x0b
> -#define UCSI_GET_ALTERNATE_MODES       0x0c
> -#define UCSI_GET_CAM_SUPPORTED         0x0d
> -#define UCSI_GET_CURRENT_CAM           0x0e
> -#define UCSI_SET_NEW_CAM               0x0f
> -#define UCSI_GET_PDOS                  0x10
> -#define UCSI_GET_CABLE_PROPERTY                0x11
> -#define UCSI_GET_CONNECTOR_STATUS      0x12
> -#define UCSI_GET_ERROR_STATUS          0x13
> -#define UCSI_GET_PD_MESSAGE            0x15
> -#define UCSI_SET_SINK_PATH             0x1c
> +#define UCSI_PPM_RESET                         0x01
> +#define UCSI_CANCEL                            0x02
> +#define UCSI_CONNECTOR_RESET                   0x03
> +#define UCSI_ACK_CC_CI                         0x04
> +#define UCSI_SET_NOTIFICATION_ENABLE           0x05
> +#define UCSI_GET_CAPABILITY                    0x06
> +#define UCSI_GET_CAPABILITY_SIZE               128
> +#define UCSI_GET_CONNECTOR_CAPABILITY          0x07
> +#define UCSI_GET_CONNECTOR_CAPABILITY_SIZE     32
> +#define UCSI_SET_UOM                           0x08
> +#define UCSI_SET_UOR                           0x09
> +#define UCSI_SET_PDM                           0x0a
> +#define UCSI_SET_PDR                           0x0b
> +#define UCSI_GET_ALTERNATE_MODES               0x0c
> +#define UCSI_GET_CAM_SUPPORTED                 0x0d
> +#define UCSI_GET_CURRENT_CAM                   0x0e
> +#define UCSI_SET_NEW_CAM                       0x0f
> +#define UCSI_GET_PDOS                          0x10
> +#define UCSI_GET_CABLE_PROPERTY                        0x11
> +#define UCSI_GET_CABLE_PROPERTY_SIZE           64
> +#define UCSI_GET_CONNECTOR_STATUS              0x12
> +#define UCSI_GET_CONNECTOR_STATUS_SIZE         152
> +#define UCSI_GET_ERROR_STATUS                  0x13
> +#define UCSI_GET_PD_MESSAGE                    0x15
> +#define UCSI_SET_SINK_PATH                     0x1c
>
>  #define UCSI_CONNECTOR_NUMBER(_num_)           ((u64)(_num_) << 16)
>  #define UCSI_COMMAND(_cmd_)                    ((_cmd_) & 0xff)
> @@ -127,7 +132,6 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num)=
;
>  #define UCSI_CONNECTOR_RESET_HARD_VER_1_0      BIT(23) /* Deprecated in =
v1.1 */
>  #define UCSI_CONNECTOR_RESET_DATA_VER_2_0      BIT(23) /* Redefined in v=
2.0 */
>
> -
>  /* ACK_CC_CI bits */
>  #define UCSI_ACK_CONNECTOR_CHANGE              BIT(16)
>  #define UCSI_ACK_COMMAND_COMPLETE              BIT(17)
> @@ -251,50 +255,6 @@ struct ucsi_capability {
>         u16 typec_version;
>  } __packed;
>
> -/* Data structure filled by PPM in response to GET_CONNECTOR_CAPABILITY =
cmd. */
> -struct ucsi_connector_capability {
> -       u8 op_mode;
> -#define UCSI_CONCAP_OPMODE_DFP                 BIT(0)
> -#define UCSI_CONCAP_OPMODE_UFP                 BIT(1)
> -#define UCSI_CONCAP_OPMODE_DRP                 BIT(2)
> -#define UCSI_CONCAP_OPMODE_AUDIO_ACCESSORY     BIT(3)
> -#define UCSI_CONCAP_OPMODE_DEBUG_ACCESSORY     BIT(4)
> -#define UCSI_CONCAP_OPMODE_USB2                        BIT(5)
> -#define UCSI_CONCAP_OPMODE_USB3                        BIT(6)
> -#define UCSI_CONCAP_OPMODE_ALT_MODE            BIT(7)
> -       u32 flags;
> -#define UCSI_CONCAP_FLAG_PROVIDER              BIT(0)
> -#define UCSI_CONCAP_FLAG_CONSUMER              BIT(1)
> -#define UCSI_CONCAP_FLAG_SWAP_TO_DFP           BIT(2)
> -#define UCSI_CONCAP_FLAG_SWAP_TO_UFP           BIT(3)
> -#define UCSI_CONCAP_FLAG_SWAP_TO_SRC           BIT(4)
> -#define UCSI_CONCAP_FLAG_SWAP_TO_SINK          BIT(5)
> -#define UCSI_CONCAP_FLAG_EX_OP_MODE(_f_) \
> -       (((_f_) & GENMASK(13, 6)) >> 6)
> -#define   UCSI_CONCAP_EX_OP_MODE_USB4_GEN2     BIT(0)
> -#define   UCSI_CONCAP_EX_OP_MODE_EPR_SRC       BIT(1)
> -#define   UCSI_CONCAP_EX_OP_MODE_EPR_SINK      BIT(2)
> -#define   UCSI_CONCAP_EX_OP_MODE_USB4_GEN3     BIT(3)
> -#define   UCSI_CONCAP_EX_OP_MODE_USB4_GEN4     BIT(4)
> -#define UCSI_CONCAP_FLAG_MISC_CAPS(_f_) \
> -       (((_f_) & GENMASK(17, 14)) >> 14)
> -#define   UCSI_CONCAP_MISC_CAP_FW_UPDATE       BIT(0)
> -#define   UCSI_CONCAP_MISC_CAP_SECURITY                BIT(1)
> -#define UCSI_CONCAP_FLAG_REV_CURR_PROT_SUPPORT BIT(18)
> -#define UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV(_f_) \
> -       (((_f_) & GENMASK(20, 19)) >> 19)
> -#define UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(_f_) \
> -       UCSI_SPEC_REVISION_TO_BCD(UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV(_=
f_))
> -} __packed;
> -
> -#define UCSI_CONCAP_USB2_SUPPORT(_con_) ((_con_)->cap.op_mode & UCSI_CON=
CAP_OPMODE_USB2)
> -#define UCSI_CONCAP_USB3_SUPPORT(_con_) ((_con_)->cap.op_mode & UCSI_CON=
CAP_OPMODE_USB3)
> -#define UCSI_CONCAP_USB4_SUPPORT(_con_)                                 =
       \
> -       ((_con_)->ucsi->version >=3D UCSI_VERSION_2_0 &&                 =
 \
> -        ((_con_)->cap.flags & (UCSI_CONCAP_EX_OP_MODE_USB4_GEN2 |      \
> -                               UCSI_CONCAP_EX_OP_MODE_USB4_GEN3 |      \
> -                               UCSI_CONCAP_EX_OP_MODE_USB4_GEN4)))
> -
>  struct ucsi_altmode {
>         u16 svid;
>         u32 mid;
> @@ -320,51 +280,143 @@ struct ucsi_cable_property {
>         u8 latency;
>  } __packed;
>
> -/* Data structure filled by PPM in response to GET_CONNECTOR_STATUS comm=
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
> +/* Get Connector Capability Fields. */
> +#define UCSI_CONCAP_OPMODE                     UCSI_DECLARE_BITFIELD(0, =
0, 8)
> +#define   UCSI_CONCAP_OPMODE_DFP               UCSI_DECLARE_BITFIELD(0, =
0, 1)
> +#define   UCSI_CONCAP_OPMODE_UFP               UCSI_DECLARE_BITFIELD(0, =
1, 1)
> +#define   UCSI_CONCAP_OPMODE_DRP               UCSI_DECLARE_BITFIELD(0, =
2, 1)
> +#define   UCSI_CONCAP_OPMODE_AUDIO_ACCESSORY   UCSI_DECLARE_BITFIELD(0, =
3, 1)
> +#define   UCSI_CONCAP_OPMODE_DEBUG_ACCESSORY   UCSI_DECLARE_BITFIELD(0, =
4, 1)
> +#define   UCSI_CONCAP_OPMODE_USB2              UCSI_DECLARE_BITFIELD(0, =
5, 1)
> +#define   UCSI_CONCAP_OPMODE_USB3              UCSI_DECLARE_BITFIELD(0, =
6, 1)
> +#define   UCSI_CONCAP_OPMODE_ALT_MODE          UCSI_DECLARE_BITFIELD(0, =
7, 1)
> +#define UCSI_CONCAP_PROVIDER                   UCSI_DECLARE_BITFIELD(0, =
8, 1)
> +#define UCSI_CONCAP_CONSUMER                   UCSI_DECLARE_BITFIELD(0, =
9, 1)
> +#define UCSI_CONCAP_SWAP_TO_DFP                        UCSI_DECLARE_BITF=
IELD_V1_1(10, 1)
> +#define UCSI_CONCAP_SWAP_TO_UFP                        UCSI_DECLARE_BITF=
IELD_V1_1(11, 1)
> +#define UCSI_CONCAP_SWAP_TO_SRC                        UCSI_DECLARE_BITF=
IELD_V1_1(12, 1)
> +#define UCSI_CONCAP_SWAP_TO_SNK                        UCSI_DECLARE_BITF=
IELD_V1_1(13, 1)
> +#define UCSI_CONCAP_EXT_OPMODE                 UCSI_DECLARE_BITFIELD_V2_=
0(14, 8)
> +#define   UCSI_CONCAP_EXT_OPMODE_USB4_GEN2     UCSI_DECLARE_BITFIELD_V2_=
0(14, 1)
> +#define   UCSI_CONCAP_EXT_OPMODE_EPR_SRC       UCSI_DECLARE_BITFIELD_V2_=
0(15, 1)
> +#define   UCSI_CONCAP_EXT_OPMODE_EPR_SINK      UCSI_DECLARE_BITFIELD_V2_=
0(16, 1)
> +#define   UCSI_CONCAP_EXT_OPMODE_USB4_GEN3     UCSI_DECLARE_BITFIELD_V2_=
0(17, 1)
> +#define   UCSI_CONCAP_EXT_OPMODE_USB4_GEN4     UCSI_DECLARE_BITFIELD_V2_=
0(18, 1)
> +#define UCSI_CONCAP_MISC                       UCSI_DECLARE_BITFIELD_V2_=
0(22, 4)
> +#define   UCSI_CONCAP_MISC_FW_UPDATE           UCSI_DECLARE_BITFIELD_V2_=
0(22, 1)
> +#define   UCSI_CONCAP_MISC_SECURITY            UCSI_DECLARE_BITFIELD_V2_=
0(23, 1)
> +#define UCSI_CONCAP_REV_CURR_PROT_SUPPORT      UCSI_DECLARE_BITFIELD_V2_=
0(26, 1)
> +#define UCSI_CONCAP_PARTNER_PD_REVISION                UCSI_DECLARE_BITF=
IELD_V2_1(27, 2)
> +
> +/* Helpers for USB capability checks. */
> +#define UCSI_CONCAP_USB2_SUPPORT(_con_) UCSI_CONCAP((_con_), OPMODE_USB2=
)
> +#define UCSI_CONCAP_USB3_SUPPORT(_con_) UCSI_CONCAP((_con_), OPMODE_USB3=
)
> +#define UCSI_CONCAP_USB4_SUPPORT(_con_)                                 =
       \
> +       ((_con_)->ucsi->version >=3D UCSI_VERSION_2_0 &&                 =
 \
> +        (UCSI_CONCAP((_con_), EXT_OPMODE_USB4_GEN2) |                  \
> +         UCSI_CONCAP((_con_), EXT_OPMODE_USB4_GEN3) |                  \
> +         UCSI_CONCAP((_con_), EXT_OPMODE_USB4_GEN4)))
> +
> +/* Get Connector Status Fields. */
> +#define UCSI_CONSTAT_CHANGE                    UCSI_DECLARE_BITFIELD(0, =
0, 16)
> +#define UCSI_CONSTAT_PWR_OPMODE                        UCSI_DECLARE_BITF=
IELD(0, 16, 3)
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
> -#define   UCSI_CONSTAT_PARTNER_FLAG_USB                1
> -#define   UCSI_CONSTAT_PARTNER_FLAG_ALT_MODE   2
> -#define   UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN3  4
> -#define   UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN4  8
> -#define UCSI_CONSTAT_PARTNER_TYPE(_f_)         (((_f_) & GENMASK(15, 13)=
) >> 13)
> +#define UCSI_CONSTAT_CONNECTED                 UCSI_DECLARE_BITFIELD(0, =
19, 1)
> +#define UCSI_CONSTAT_PWR_DIR                   UCSI_DECLARE_BITFIELD(0, =
20, 1)
> +#define UCSI_CONSTAT_PARTNER_FLAGS             UCSI_DECLARE_BITFIELD(0, =
21, 8)
> +#define   UCSI_CONSTAT_PARTNER_FLAG_USB                UCSI_DECLARE_BITF=
IELD(0, 21, 1)
> +#define   UCSI_CONSTAT_PARTNER_FLAG_ALT_MODE   UCSI_DECLARE_BITFIELD(0, =
22, 1)
> +#define   UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN3  UCSI_DECLARE_BITFIELD(0, =
23, 1)
> +#define   UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN4  UCSI_DECLARE_BITFIELD(0, =
24, 1)
> +#define UCSI_CONSTAT_PARTNER_TYPE              UCSI_DECLARE_BITFIELD(0, =
29, 3)
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
> +#define UCSI_CONSTAT_RDO                       UCSI_DECLARE_BITFIELD(0, =
32, 32)
> +#define UCSI_CONSTAT_BC_STATUS                 UCSI_DECLARE_BITFIELD(0, =
64, 2)
>  #define   UCSI_CONSTAT_BC_NOT_CHARGING         0
>  #define   UCSI_CONSTAT_BC_NOMINAL_CHARGING     1
>  #define   UCSI_CONSTAT_BC_SLOW_CHARGING                2
>  #define   UCSI_CONSTAT_BC_TRICKLE_CHARGING     3
> -} __packed;
> +#define UCSI_CONSTAT_PD_VERSION                        UCSI_DECLARE_BITF=
IELD_V1_2(70, 16)
> +
> +/* Connector Status Change Bits.  */
> +#define UCSI_CONSTAT_EXT_SUPPLY_CHANGE         BIT(1)
> +#define UCSI_CONSTAT_POWER_OPMODE_CHANGE       BIT(2)
> +#define UCSI_CONSTAT_PDOS_CHANGE               BIT(5)
> +#define UCSI_CONSTAT_POWER_LEVEL_CHANGE                BIT(6)
> +#define UCSI_CONSTAT_PD_RESET_COMPLETE         BIT(7)
> +#define UCSI_CONSTAT_CAM_CHANGE                        BIT(8)
> +#define UCSI_CONSTAT_BC_CHANGE                 BIT(9)
> +#define UCSI_CONSTAT_PARTNER_CHANGE            BIT(11)
> +#define UCSI_CONSTAT_POWER_DIR_CHANGE          BIT(12)
> +#define UCSI_CONSTAT_CONNECT_CHANGE            BIT(14)
> +#define UCSI_CONSTAT_ERROR                     BIT(15)
> +
> +#define UCSI_DECLARE_BITFIELD_V1_1(_offset_, _size_)                   \
> +         UCSI_DECLARE_BITFIELD(UCSI_VERSION_1_1, (_offset_), (_size_))
> +#define UCSI_DECLARE_BITFIELD_V1_2(_offset_, _size_)                   \
> +         UCSI_DECLARE_BITFIELD(UCSI_VERSION_1_2, (_offset_), (_size_))
> +#define UCSI_DECLARE_BITFIELD_V2_0(_offset_, _size_)                   \
> +         UCSI_DECLARE_BITFIELD(UCSI_VERSION_2_0, (_offset_), (_size_))
> +#define UCSI_DECLARE_BITFIELD_V2_1(_offset_, _size_)                   \
> +         UCSI_DECLARE_BITFIELD(UCSI_VERSION_2_1, (_offset_), (_size_))
> +#define UCSI_DECLARE_BITFIELD_V3_0(_offset_, _size_)                   \
> +         UCSI_DECLARE_BITFIELD(UCSI_VERSION_3_0, (_offset_), (_size_))
> +
> +#define UCSI_DECLARE_BITFIELD(_ver_, _offset_, _size_)                 \
> +(struct ucsi_bitfield) {                                               \
> +       .version =3D _ver_,                                              =
 \
> +       .offset =3D _offset_,                                            =
 \
> +       .size =3D _size_,                                                =
 \
> +}
> +
> +struct ucsi_bitfield {
> +       const u16 version;
> +       const u8 offset;
> +       const u8 size;
> +};
> +
> +/**
> + * ucsi_bitfield_read - Read a field from UCSI command response
> + * @_map_: UCSI command response
> + * @_field_: The field offset in the response data structure
> + * @_ver_: UCSI version where the field was introduced
> + *
> + * Reads the fields in the command responses by first checking that the =
field is
> + * valid with the UCSI interface version that is used in the system.
> + * @_ver_ is the minimum UCSI version for the @_field_. If the UCSI inte=
rface is
> + * older than @_ver_, a warning is generated.
> + *
> + * Caveats:
> + * - Removed fields are not checked - @_ver_ is just the minimum UCSI ve=
rsion.
> + *
> + * Returns the value of @_field_, or 0 when the UCSI interface is older =
than
> + * @_ver_.
> + */
> +#define ucsi_bitfield_read(_map_, _field_, _ver_)                      \
> +({                                                                     \
> +       struct ucsi_bitfield f =3D (_field_);                            =
 \
> +       WARN((_ver_) < f.version,                                       \
> +       "Access to unsupported field at offset 0x%x (need version %04x)",=
 \
> +            f.offset, f.version) ? 0 :                                 \
> +       bitmap_read((_map_), f.offset, f.size);                         \
> +})
> +
> +/* Helpers to access cached command responses. */
> +#define UCSI_CONCAP(_con_, _field_)                                    \
> +       ucsi_bitfield_read((_con_)->status, UCSI_CONCAP_##_field_, (_con_=
)->ucsi->version)
> +
> +#define UCSI_CONSTAT(_con_, _field_)                                   \
> +       ucsi_bitfield_read((_con_)->status, UCSI_CONSTAT_##_field_, (_con=
_)->ucsi->version)

Repeating my comment from the RFC
(https://lore.kernel.org/linux-usb/CANFp7mXKR1zY85SLZ3vVf6Ozk0abho_4dXwvREO=
uY=3D-3q4t09w@mail.gmail.com/):

<quote>
One other goal for this refactor was to make sure it was obvious at
the callsite when a field from a newer version was being used (so we
could make sure version checks are being done). My suggestion:

#define UCSI_CONCAP_V2_EXT_OPMODE DECLARE_BITFIELD(0x200, 14, 8)
#define UCSI_CONCAP_V2(_con_, _field_) UCSI_CONCAP(_con_, V2_##_field_)
#define UCSI_CONCAP_V2_1(...)
#define UCSI_CONCAP_V3(...)

This duplicates the versioning in declare_bitfield but also enforces
that the caller must acknowledge they're using a field that requires a
certain minimum version.
</quote>

We can add this as a follow-on since this patch is already pretty
large but this adds a layer of compile-time protection + a clearer
signal during code review that the field being accessed needs to be
protected by reading the version.

>
>  /* ---------------------------------------------------------------------=
----- */
>
> @@ -444,8 +496,10 @@ struct ucsi_connector {
>
>         struct typec_capability typec_cap;
>
> -       struct ucsi_connector_status status;
> -       struct ucsi_connector_capability cap;
> +       /* Cached command responses. */
> +       DECLARE_BITMAP(cap, UCSI_GET_CONNECTOR_CAPABILITY_SIZE);
> +       DECLARE_BITMAP(status, UCSI_GET_CONNECTOR_STATUS_SIZE);
> +
>         struct power_supply *psy;
>         struct power_supply_desc psy_desc;
>         u32 rdo;
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/=
ucsi_acpi.c
> index 789f67dd9f81..5c5515551963 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -104,7 +104,6 @@ static int ucsi_gram_read_message_in(struct ucsi *ucs=
i, void *val, size_t val_le
>         u16 bogus_change =3D UCSI_CONSTAT_POWER_LEVEL_CHANGE |
>                            UCSI_CONSTAT_PDOS_CHANGE;
>         struct ucsi_acpi *ua =3D ucsi_get_drvdata(ucsi);
> -       struct ucsi_connector_status *status;
>         int ret;
>
>         ret =3D ucsi_acpi_read_message_in(ucsi, val, val_len);
> @@ -113,11 +112,9 @@ static int ucsi_gram_read_message_in(struct ucsi *uc=
si, void *val, size_t val_le
>
>         if (UCSI_COMMAND(ua->cmd) =3D=3D UCSI_GET_CONNECTOR_STATUS &&
>             ua->check_bogus_event) {
> -               status =3D (struct ucsi_connector_status *)val;
> -
>                 /* Clear the bogus change */
> -               if (status->change =3D=3D bogus_change)
> -                       status->change =3D 0;
> +               if (*(u16 *)val =3D=3D bogus_change)
> +                       *(u16 *)val =3D 0;
>
>                 ua->check_bogus_event =3D false;
>         }
> --
> 2.45.2
>

Looks like you missed addressing a couple of my comments in the RFC
(https://lore.kernel.org/linux-usb/CANFp7mXKR1zY85SLZ3vVf6Ozk0abho_4dXwvREO=
uY=3D-3q4t09w@mail.gmail.com/)
Aside from that, looks good to me.

