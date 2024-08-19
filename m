Return-Path: <linux-usb+bounces-13696-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A518957897
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 01:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FFD21C23202
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 23:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B038D1DF680;
	Mon, 19 Aug 2024 23:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XyrrPhyF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881F73C6BA
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 23:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724109852; cv=none; b=FC9dzOiT1UGjq0cJVvbVx5HN5ZxQWjXCrSw83Lf6IP0mo6eeZ/96CziiHIQhuRS43PmG5tUFFpqBNLT1APLwqzno287+Wa2L1rH/1BbmhmJaHgPOmL1/hCgpjfOuD8F2bs2xzMh2YaIKZui2ozm6VJeRv2b+p90L4GOE6nMEjJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724109852; c=relaxed/simple;
	bh=m2W4hDehd0ZGZGubZMW4TJyIXvDItdb0zSf1+fsUfYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9UpPHTw3yqjRJmhkhdoAmeJXhRdrI/P6DxvCGX0JF+Tu8Kd/9j3X6B86Nv7BxMLazzZc4AemrQJewjtP1MsHbTxFbIuMPomw5ngbZTcNcMaST1Z0tY2NxDvkFJ4TS3mkxlsusJyLSJHoy5YTFrf5jHa2WJzduNb+Dxw/apgwCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XyrrPhyF; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6b5c37a3138so19779627b3.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 16:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724109848; x=1724714648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9kCc15HRAnrpQifFpDAbwnVZsK6aNG+sFUOK0ddJMY=;
        b=XyrrPhyFjd/+zBgcrIQfZmR6PMMPDx+KMtSz5jgRuQFcB8e6SbPjpr9rddYfIzUHi5
         uy0efMHvf2UREFQoIgdmy/a1zPG/E4CHVPMA8p2HzvkDCaRJp9gnp+VYRqNKHtvubmEO
         FVvD/JmeqypZe1BQ2lCKPm30cRX4G/Wdcz9Jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724109848; x=1724714648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9kCc15HRAnrpQifFpDAbwnVZsK6aNG+sFUOK0ddJMY=;
        b=IiHAtlS1vjARgkd0x8iSglqdj2ShTf7uo4rAmnpAeuOVYEkIbAAlKlc2vWfyehIXuT
         oXdf0fmti7BpU2BPukJl+t+cVLypsabhyabmY41TIWeJrjHxyO6LpGvfQcXr4zmBvtVn
         dpuRNS+MjkBjYCELQb2NYHIiWqLO35TNk0XmH4G0k9hzspA+Q6bqEYkWGuBrqNYP11eV
         h9ZkIMv8Nha8xBpQiZlX/Mdr5fHpKGBAsmLcpwYYIjcpdTqSiL7DXIR9LCwxgOJ5xQ4m
         YuUxnoaJ5qygh8JptBYGlSQRn4nn7LJNGSBu2fHTE/kx7TdlZko0WMsDv0jZATKK453F
         C95Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwUZx3NHRjcxTxDOAzOGCTO4CyIlLCZQF9WkPVa+owvGCdH/zrvmCYK5YOs90f4YzW8iKsLPNNb1K2xmgHr7BMAx+uG8fabzpx
X-Gm-Message-State: AOJu0YxDlmXEyb1p8wEiA/B8rPeqnZqvcxwAkGRhYrv0/6vYuHSf2aWG
	oajLWZpmRMzrwp+iKioKFv6lyIhFmMwD+cDCDrfqcnhW0+ygZ5tAW/QX6sKB2Ts+p5mGTO0WYsG
	6LT//Q/hgPH/a/x2TXh0SgoM1muEfHsXoEx7v
X-Google-Smtp-Source: AGHT+IGKwaBpJMTXPo/un93lrWTCG9AV90ecizwDOXgJH27UZeQcG/X1W2FuPmMOuzSyMBbdPoEEaHdp1aIJoJbhjME=
X-Received: by 2002:a05:690c:428c:b0:6b2:7bd8:d7b1 with SMTP id
 00721157ae682-6b27bd8da3emr103986827b3.44.1724109848430; Mon, 19 Aug 2024
 16:24:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240816135859.3499351-1-heikki.krogerus@linux.intel.com>
 <20240816135859.3499351-2-heikki.krogerus@linux.intel.com>
 <CANFp7mUDm9Ya9Gjv9Bv_neL22SuDocmz_8HCGVbnd8y-0gd7tA@mail.gmail.com> <ZsMoUWSMtaxteBBf@kuha.fi.intel.com>
In-Reply-To: <ZsMoUWSMtaxteBBf@kuha.fi.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Mon, 19 Aug 2024 16:23:56 -0700
Message-ID: <CANFp7mU69-4_v5JaycrPjt3ZnfyRa8PypFa=_gbuW9qW6_z9dw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] usb: typec: ucsi: Remove unused fields from struct ucsi_connector_status
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jameson Thies <jthies@google.com>, 
	Benson Leung <bleung@chromium.org>, Prashant Malani <pmalani@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-usb@vger.kernel.org, 
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@google.com>, Bartosz Szpila <bszpila@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 4:11=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Abhishek,
>
> On Sun, Aug 18, 2024 at 05:02:28PM -0700, Abhishek Pandit-Subedi wrote:
> > On Fri, Aug 16, 2024 at 6:59=E2=80=AFAM Heikki Krogerus
> > <heikki.krogerus@linux.intel.com> wrote:
> > >
> > > The new fields are valid only with the new UCSI versions.
> > > They are at offsets that go beyond the MAX_DATA_LENGTH (16
> > > bytes) with the older UCSI versions. That has not caused any
> > > problems before because nothing uses those new fields yet.
> > > Because they are not used yet, dropping them for now.
> > >
> > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > ---
> > >  drivers/usb/typec/ucsi/ucsi.h | 27 ++-------------------------
> > >  1 file changed, 2 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/u=
csi.h
> > > index 57129f3c0814..7bc132b59027 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi.h
> > > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > > @@ -344,35 +344,12 @@ struct ucsi_connector_status {
> > >  #define   UCSI_CONSTAT_PARTNER_TYPE_AUDIO      6
> > >         u32 request_data_obj;
> > >
> > > -       u8 pwr_status[3];
> > > -#define UCSI_CONSTAT_BC_STATUS(_p_)            ((_p_[0]) & GENMASK(1=
, 0))
> > > +       u8 pwr_status;
> > > +#define UCSI_CONSTAT_BC_STATUS(_p_)            ((_p_) & GENMASK(1, 0=
))
> > >  #define   UCSI_CONSTAT_BC_NOT_CHARGING         0
> > >  #define   UCSI_CONSTAT_BC_NOMINAL_CHARGING     1
> > >  #define   UCSI_CONSTAT_BC_SLOW_CHARGING                2
> > >  #define   UCSI_CONSTAT_BC_TRICKLE_CHARGING     3
> > > -#define UCSI_CONSTAT_PROVIDER_CAP_LIMIT(_p_)   (((_p_[0]) & GENMASK(=
5, 2)) >> 2)
> > > -#define   UCSI_CONSTAT_CAP_PWR_LOWERED         0
> > > -#define   UCSI_CONSTAT_CAP_PWR_BUDGET_LIMIT    1
> > > -#define UCSI_CONSTAT_PROVIDER_PD_VERSION_OPER_MODE(_p_)        \
> > > -       ((get_unaligned_le32(_p_) & GENMASK(21, 6)) >> 6)
> > > -#define UCSI_CONSTAT_ORIENTATION(_p_)          (((_p_[2]) & GENMASK(=
6, 6)) >> 6)
> > > -#define   UCSI_CONSTAT_ORIENTATION_DIRECT      0
> > > -#define   UCSI_CONSTAT_ORIENTATION_FLIPPED     1
> > > -#define UCSI_CONSTAT_SINK_PATH_STATUS(_p_)     (((_p_[2]) & GENMASK(=
7, 7)) >> 7)
> > > -#define   UCSI_CONSTAT_SINK_PATH_DISABLED      0
> > > -#define   UCSI_CONSTAT_SINK_PATH_ENABLED       1
> > > -       u8 pwr_readings[9];
> > > -#define UCSI_CONSTAT_REV_CURR_PROT_STATUS(_p_) ((_p_[0]) & 0x1)
> > > -#define UCSI_CONSTAT_PWR_READING_VALID(_p_)    (((_p_[0]) & GENMASK(=
1, 1)) >> 1)
> > > -#define UCSI_CONSTAT_CURRENT_SCALE(_p_)                (((_p_[0]) & =
GENMASK(4, 2)) >> 2)
> > > -#define UCSI_CONSTAT_PEAK_CURRENT(_p_) \
> > > -       ((get_unaligned_le32(_p_) & GENMASK(20, 5)) >> 5)
> > > -#define UCSI_CONSTAT_AVG_CURRENT(_p_) \
> > > -       ((get_unaligned_le32(&(_p_)[2]) & GENMASK(20, 5)) >> 5)
> > > -#define UCSI_CONSTAT_VOLTAGE_SCALE(_p_) \
> > > -       ((get_unaligned_le16(&(_p_)[4]) & GENMASK(8, 5)) >> 5)
> > > -#define UCSI_CONSTAT_VOLTAGE_READING(_p_) \
> > > -       ((get_unaligned_le32(&(_p_)[5]) & GENMASK(16, 1)) >> 1)
> > >  } __packed;
> > >
> > >  /*
> > > --
> > > 2.43.0
> > >
> > >
> >
> > I'm working on a patch series that depends on the sink path status so
> > I would prefer we don't remove it:
> > https://chromium-review.googlesource.com/c/chromiumos/third_party/kerne=
l/+/5784952
> >
> > Since GET_CONNECTOR_STATUS is the only command that exceeds 16 bytes
> > for MESSAGE_IN, can we just add a wrapper that checks the UCSI version
> > for that command only and limits the size sent to ucsi_run_command?
>
> It's always "just this one command" :). It's actually not only the
> GET_CONNECTOR_STATUS command in this case - at least GET_PD_MESSAGE
> can also exceed 16 bytes - but even if it was, it would still not be
> okay to simply guard the read. You would also have to check the
> version with every access of those extended fields, and that's where
> it's basically guaranteed to fail. Somebody will access those extended
> fields unconditionally without anybody noticing sooner or later, and
> that's why they can't be part of this data structure.

So this kind of points out a fundamental question to UCSI 1.2 vs
UCSI2+ in this driver: should we be doing a single driver that checks
the UCSI version before doing things or have two separate drivers?

I'm in favor of a single driver approach as I think there are a lot of
commonalities between the different UCSI versions. I think zero-ing
out the extended data on reads should be sufficient to support both
versions from the same code-base.
The alternative of creating a separate driver comes with more problems
-- do we fork for ucsi2 AND ucsi3? ucsi3 adds additional commands
(i.e. set_usb) and, in the case of get_pd_message, adds additional
behavior to existing commands (Get_Revision).

If your main worry is that people will unconditionally use the new
bits, why don't we simply change the macros from UCSI_CONSTAT to
UCSI_CONSTAT_v2 to indicate they need a revision bump? We can make
similar changes to other macros + enums to indicate the minimum UCSI
version that added those values.

>
> So there needs to be a completely separate data structure for the
> extended version.
>
> struct ucsi_connector_status_extended {
>         u8 status[16];
>         u8 extended[3];
> } __packed;
>
> Something like that. But that of course should not be introduced
> before there is an actual user for it.
>
> thanks,
>
> --
> heikki

