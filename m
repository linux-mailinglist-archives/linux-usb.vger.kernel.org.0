Return-Path: <linux-usb+bounces-13740-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FE0958C96
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 18:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 123EC1F21C69
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 16:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A481A1A00C5;
	Tue, 20 Aug 2024 16:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PgkrxX3Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A26195B28
	for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2024 16:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724172538; cv=none; b=dpuKaB1/sQzDdsY71TkZmNeGv6TLzX8yG0S42/WLbBH1wRXu684jKBVRIgdVLByPnaSeJ/cW4IH3C1y5RKnOE1meRe7zgbgWj/3DKQx5/oULd1JZK+0PjLY9ONU6xOwB9hraY0xdiPcQIN8xvp+tMbj2nnmV8lQZTI15iACvPPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724172538; c=relaxed/simple;
	bh=Xyqt2Xnsc2n+gM7/Si2yovmSsalj4DxWLDHMyZ2/eUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRr538z/SHXXjujkIZDGZ0fUjHb8a2lvRxqNwupFpNzkFjUGzPdkunQXUf7Dwjr93xQ632h7DDH9khhALM0WxAjf9+Vuh0YmIhj/gjXY7pr2PkieWUbwf92Q9TX3dd6BADHfif9sUrtn8k/SyHfhBlG6FnD8oJXOg1SxMC/F/QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PgkrxX3Y; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso30980111fa.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2024 09:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724172534; x=1724777334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M63qcmZLzsnqkEOavvEsqxfIzWSAV6Ujmy4ct4mEBL8=;
        b=PgkrxX3YmcFSPCzgdDbROQMZHQDkn8JTx8tEdVg1ByBhJSdldWZeVw/KE5QGrQADFM
         khnuY10ArTYCGFG/do5LjjAr/OUx2NNZk3NZqj/Ic2nBi+yYhSqVo9clbBRSNTVEcSSy
         zcemibobDisQQicL2ZIa/N/Dvf0dnq2cr89XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724172534; x=1724777334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M63qcmZLzsnqkEOavvEsqxfIzWSAV6Ujmy4ct4mEBL8=;
        b=cSuoSzdhvRoNmmjzpl5yZsrdrVOZbMvVbYnQRuVGufyZYlwZlRqTASz8xlopHjTyeW
         kvY5y0hKhoYyxDXccAA5nBrvh1crF+ujRkJ533lJePIdbZfcT1rmJpVEz0FkaArpkWlx
         rg6nqzVWoqEJj9P7JOmfk7tXiKnKsGSutpvrVcZZ2hUnh4UQ4l2uWBZ/v915IVTwm3YL
         8RCVVSXmXt+GkbizxgRN9ejS7JuiU50zGNpzGoZX+1dbJUdOzyZWzK2Hs+DQAiARl6CF
         vXjosmsTVKBuCzSU2kzy4DMxI/+zDpqZJ/OYHfczBsglOmR3lnxTEi4Y5EB8+3xWA70G
         bsmw==
X-Forwarded-Encrypted: i=1; AJvYcCWn+eiMg83883K5N/+iNvHeTREqBc+5CUi1XndxQQBzyF83QSdtxSFs9s+15f7qpOZ1UY7sVVgltkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGuXynybvQ+mbGhhyJE3RIjIROsLjrm6yCSo4mVklDBO6rLm+1
	orENdi/w1qFe6zDO4xRRIAA3TfvWe3WEm9d/oJv/ngdvqdzU3BdMtxSvmlZrG+Ef27ysi+lKMiV
	1Q7rtSi/XNLuFI+6rWsVgx3mTd8+j+7JBMipb
X-Google-Smtp-Source: AGHT+IEAl7ZhiDTnzt2fNvXjSmpyQkj8MaYP0lRRkQRDS5VSfps6K1PrvhaNeU+Cw9VLAKe2T4ltzGfbztE+WPPlv8Y=
X-Received: by 2002:a2e:a9a8:0:b0:2ef:2c68:a776 with SMTP id
 38308e7fff4ca-2f3be5d9f6bmr138057821fa.37.1724172533894; Tue, 20 Aug 2024
 09:48:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240816135859.3499351-1-heikki.krogerus@linux.intel.com>
 <20240816135859.3499351-2-heikki.krogerus@linux.intel.com>
 <CANFp7mUDm9Ya9Gjv9Bv_neL22SuDocmz_8HCGVbnd8y-0gd7tA@mail.gmail.com>
 <ZsMoUWSMtaxteBBf@kuha.fi.intel.com> <CANFp7mU69-4_v5JaycrPjt3ZnfyRa8PypFa=_gbuW9qW6_z9dw@mail.gmail.com>
 <ZsSWIQ7sMAeF9v9Y@kuha.fi.intel.com>
In-Reply-To: <ZsSWIQ7sMAeF9v9Y@kuha.fi.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Tue, 20 Aug 2024 09:48:41 -0700
Message-ID: <CANFp7mUB4oiyEfh4P5cOucvdaWaC5N=OwcVdZ0Wm8EKBf=Ss9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] usb: typec: ucsi: Remove unused fields from struct ucsi_connector_status
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jameson Thies <jthies@google.com>, 
	Benson Leung <bleung@chromium.org>, Prashant Malani <pmalani@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-usb@vger.kernel.org, 
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@google.com>, Bartosz Szpila <bszpila@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 6:12=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Aug 19, 2024 at 04:23:56PM -0700, Abhishek Pandit-Subedi wrote:
> > On Mon, Aug 19, 2024 at 4:11=E2=80=AFAM Heikki Krogerus
> > <heikki.krogerus@linux.intel.com> wrote:
> > >
> > > Hi Abhishek,
> > >
> > > On Sun, Aug 18, 2024 at 05:02:28PM -0700, Abhishek Pandit-Subedi wrot=
e:
> > > > On Fri, Aug 16, 2024 at 6:59=E2=80=AFAM Heikki Krogerus
> > > > <heikki.krogerus@linux.intel.com> wrote:
> > > > >
> > > > > The new fields are valid only with the new UCSI versions.
> > > > > They are at offsets that go beyond the MAX_DATA_LENGTH (16
> > > > > bytes) with the older UCSI versions. That has not caused any
> > > > > problems before because nothing uses those new fields yet.
> > > > > Because they are not used yet, dropping them for now.
> > > > >
> > > > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > > ---
> > > > >  drivers/usb/typec/ucsi/ucsi.h | 27 ++-------------------------
> > > > >  1 file changed, 2 insertions(+), 25 deletions(-)
> > > > >
> > > > > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/uc=
si/ucsi.h
> > > > > index 57129f3c0814..7bc132b59027 100644
> > > > > --- a/drivers/usb/typec/ucsi/ucsi.h
> > > > > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > > > > @@ -344,35 +344,12 @@ struct ucsi_connector_status {
> > > > >  #define   UCSI_CONSTAT_PARTNER_TYPE_AUDIO      6
> > > > >         u32 request_data_obj;
> > > > >
> > > > > -       u8 pwr_status[3];
> > > > > -#define UCSI_CONSTAT_BC_STATUS(_p_)            ((_p_[0]) & GENMA=
SK(1, 0))
> > > > > +       u8 pwr_status;
> > > > > +#define UCSI_CONSTAT_BC_STATUS(_p_)            ((_p_) & GENMASK(=
1, 0))
> > > > >  #define   UCSI_CONSTAT_BC_NOT_CHARGING         0
> > > > >  #define   UCSI_CONSTAT_BC_NOMINAL_CHARGING     1
> > > > >  #define   UCSI_CONSTAT_BC_SLOW_CHARGING                2
> > > > >  #define   UCSI_CONSTAT_BC_TRICKLE_CHARGING     3
> > > > > -#define UCSI_CONSTAT_PROVIDER_CAP_LIMIT(_p_)   (((_p_[0]) & GENM=
ASK(5, 2)) >> 2)
> > > > > -#define   UCSI_CONSTAT_CAP_PWR_LOWERED         0
> > > > > -#define   UCSI_CONSTAT_CAP_PWR_BUDGET_LIMIT    1
> > > > > -#define UCSI_CONSTAT_PROVIDER_PD_VERSION_OPER_MODE(_p_)        \
> > > > > -       ((get_unaligned_le32(_p_) & GENMASK(21, 6)) >> 6)
> > > > > -#define UCSI_CONSTAT_ORIENTATION(_p_)          (((_p_[2]) & GENM=
ASK(6, 6)) >> 6)
> > > > > -#define   UCSI_CONSTAT_ORIENTATION_DIRECT      0
> > > > > -#define   UCSI_CONSTAT_ORIENTATION_FLIPPED     1
> > > > > -#define UCSI_CONSTAT_SINK_PATH_STATUS(_p_)     (((_p_[2]) & GENM=
ASK(7, 7)) >> 7)
> > > > > -#define   UCSI_CONSTAT_SINK_PATH_DISABLED      0
> > > > > -#define   UCSI_CONSTAT_SINK_PATH_ENABLED       1
> > > > > -       u8 pwr_readings[9];
> > > > > -#define UCSI_CONSTAT_REV_CURR_PROT_STATUS(_p_) ((_p_[0]) & 0x1)
> > > > > -#define UCSI_CONSTAT_PWR_READING_VALID(_p_)    (((_p_[0]) & GENM=
ASK(1, 1)) >> 1)
> > > > > -#define UCSI_CONSTAT_CURRENT_SCALE(_p_)                (((_p_[0]=
) & GENMASK(4, 2)) >> 2)
> > > > > -#define UCSI_CONSTAT_PEAK_CURRENT(_p_) \
> > > > > -       ((get_unaligned_le32(_p_) & GENMASK(20, 5)) >> 5)
> > > > > -#define UCSI_CONSTAT_AVG_CURRENT(_p_) \
> > > > > -       ((get_unaligned_le32(&(_p_)[2]) & GENMASK(20, 5)) >> 5)
> > > > > -#define UCSI_CONSTAT_VOLTAGE_SCALE(_p_) \
> > > > > -       ((get_unaligned_le16(&(_p_)[4]) & GENMASK(8, 5)) >> 5)
> > > > > -#define UCSI_CONSTAT_VOLTAGE_READING(_p_) \
> > > > > -       ((get_unaligned_le32(&(_p_)[5]) & GENMASK(16, 1)) >> 1)
> > > > >  } __packed;
> > > > >
> > > > >  /*
> > > > > --
> > > > > 2.43.0
> > > > >
> > > > >
> > > >
> > > > I'm working on a patch series that depends on the sink path status =
so
> > > > I would prefer we don't remove it:
> > > > https://chromium-review.googlesource.com/c/chromiumos/third_party/k=
ernel/+/5784952
> > > >
> > > > Since GET_CONNECTOR_STATUS is the only command that exceeds 16 byte=
s
> > > > for MESSAGE_IN, can we just add a wrapper that checks the UCSI vers=
ion
> > > > for that command only and limits the size sent to ucsi_run_command?
> > >
> > > It's always "just this one command" :). It's actually not only the
> > > GET_CONNECTOR_STATUS command in this case - at least GET_PD_MESSAGE
> > > can also exceed 16 bytes - but even if it was, it would still not be
> > > okay to simply guard the read. You would also have to check the
> > > version with every access of those extended fields, and that's where
> > > it's basically guaranteed to fail. Somebody will access those extende=
d
> > > fields unconditionally without anybody noticing sooner or later, and
> > > that's why they can't be part of this data structure.
> >
> > So this kind of points out a fundamental question to UCSI 1.2 vs
> > UCSI2+ in this driver: should we be doing a single driver that checks
> > the UCSI version before doing things or have two separate drivers?
>
> Nobody is proposing a driver split.
>
> > I'm in favor of a single driver approach as I think there are a lot of
> > commonalities between the different UCSI versions. I think zero-ing
> > out the extended data on reads should be sufficient to support both
> > versions from the same code-base.
>
> Unfortunately 0 is a valid value also in this case.
>
> > The alternative of creating a separate driver comes with more problems
> > -- do we fork for ucsi2 AND ucsi3? ucsi3 adds additional commands
> > (i.e. set_usb) and, in the case of get_pd_message, adds additional
> > behavior to existing commands (Get_Revision).
>
> Again, nobody is proposing a driver split. I don't know where did you
> get this idea.

Well you did revert a backwards compatible structure :)

>
> > If your main worry is that people will unconditionally use the new
> > bits, why don't we simply change the macros from UCSI_CONSTAT to
> > UCSI_CONSTAT_v2 to indicate they need a revision bump? We can make
> > similar changes to other macros + enums to indicate the minimum UCSI
> > version that added those values.
>
> Simply naming a macro is not enough. A macro is fine, but it must have
> the means to check the version and fail if it does not match.
>
> We have a golden opportunity here to do exactly that. In most cases
> only fields are extended, which is much more difficult situation, but
> in this case we actually have completely new fields that extend the
> data structure. That makes it possible to use the size like I'm doing
> in patch 3/5 which guarantees that driver fails if those extended
> fields are accessed when they are not available. That is exactly what
> we want.
>
> Otherwise accessing those fields when they are not available will
> create the issues silently, most likely in form of a horrible user
> experience: the cable works only if you plug it one way but not the
> other because something thinks the orientation field is valid, or the
> screen may simply be black. There are no error messages in dmesg, so
> from kernel PoW everything seems to be working as it should. This is
> not what we want. What we want is a spectacular failure if something
> like that happens.
>
> That failure will give us these two things:
>
> 1. It pin points the root cause of these issues.
> 2. If forces us to actually fix the issue (these are usually not
>    considered as critical issues unfortunately).
>
> These "silent" issues are really common and they always take a lot of
> time to debug. I'm not going to waste this opportunity to make them a
> bit less "silent" in this case.

You have me convinced on the "failing loudly" part but I'm still
confused about the "how".

Making sure we always check versions to access the bits makes me think
we need wrappers on casting to the rightly versioned connector status.
Should we be versioning access for everything that's not in UCSI 1.2
then?

Example:

struct ucsi_connector_status_raw {
  u8 bytes[19];
};

struct ucsi_connector_status_v1 {
  ...
};

struct ucsi_connector_status_v2 {
  ...
};

struct ucsi_connector_status_v1* get_connector_status_v1(struct
ucsi_connector *con) {
  return (struct ucsi_connector_status_v1 *)con->raw_status;
}

struct ucsi_connector_status_v2* get_connector_status_v2(struct
ucsi_connector *con) {
  return con->ucsi->version >=3D UCSI_VERSION_2_0 ? (struct
ucsi_connector_status_v2 *)&con->raw_status : NULL;
}

/* Read all bits supported by the current version. */
int ucsi_read_connector_status(struct ucsi_connector *con, struct
ucsi_connector_status_raw *raw_conn_status);

>
> thanks,
>
> --
> heikki

