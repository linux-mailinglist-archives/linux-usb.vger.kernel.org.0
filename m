Return-Path: <linux-usb+bounces-14783-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3152F96F4F7
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 15:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B107DB25F70
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 13:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9041CDA37;
	Fri,  6 Sep 2024 13:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="in+1EuOu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93A5266AB
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725627716; cv=none; b=Rl5TIfLDp1pxWqR5lr+p7tSw4JLkz3g/zfNTmlJE8urGVQQT0PutnHv5z+s8U+4uDJcVcuWVz+SDWtSFXmNdVwSPjMt2frY49Ozu8qAMtnn9JzTaTONDsmJcn6thgnbUs1F3t83V3ciF/ZLXjOrzGQw4To+DgQfR0DOvrQYQlGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725627716; c=relaxed/simple;
	bh=a36nfuHe6Dl2uvLqBUCT5/YEPTuh96aYfsSQlya8Mo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imEF9jUdLPTYh9Q+vHxBzxTowgXugOxtDU28J6lsiKiNnLaMKiuj1SlpUmI+ZAILC840+cltwUyqwYnZO7Iifd0zbZl2S5DftHHeDJxGYkL3YbNOcu14rMpQQQBmIrGBpjoxuE+wx5358lSfPNlYADamp7dRFHmyrHzJ9omPfLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=in+1EuOu; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5343e75c642so2345542e87.2
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2024 06:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725627712; x=1726232512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebm7CEtOskf5reMpVf4B+fPAj2BHCamh5NPhK4/w3Iw=;
        b=in+1EuOuz+wsjIF1uKond6pdS4eL/p+MAvdASpSIiCtpSfi0xi4G5I9PD5NARTUXIS
         X2NnmckSA9tfHj800p1oGpl4Nd/Wk5NLe5REczY5+01dq4Jb7HbAMV9bDgDucMDzDwDQ
         z83UwPOhPjKANukBUaWRrdE7kwmH6C2tJUaBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725627712; x=1726232512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebm7CEtOskf5reMpVf4B+fPAj2BHCamh5NPhK4/w3Iw=;
        b=Oiabh3/cNt0L37lknxmG2Gl1QP/aAmGDFD/R3HdTfRs2GN8yF43EljD3l9MLOKzQa6
         nSU7eI595pV5RzFyLTnAfaD7F7kDNTrGjK2HDWClmO/gefQtRJ5+WSUG+/A/mdz7NNYI
         +qsSBQfu+01B2/RitwQfoqXR9N3IqN+1UBcoRnMP6B+WirosapQkD7iP7rYPaF7+EIRn
         /pb0kXfdgCcpuvqXQrKs6uIViKT2+o4bQVbZenykz/vEEdh9inZzSNUYO+1da06L69yn
         DfzgYuL+UxkprLs8jnCX3jlA4APRyn6vIY0sm9z9uEq02Ep7YCwuoAnBkLRuhcDCQFpu
         Jc1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2Dymq65LbIXGjTqqJaX5ZFXTexJB6skBkVsYuHBHxRBTEYGd/LiiJ4Pda4sJa2nS5ixzHCeYA13w=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdk7nhzKIjQ+O3IBzhl4Lpq9Qutl2OVzmBT5Wan/bnNTbUTd2q
	W01NwzhqfclNSwM9n0RsThOan1TKgsk/wTz8aaLBwlL/Hd1uvX1IB+rigCYPk7adJwZ5LlCUtVw
	0kyAteo6R9YStaeqkuonnhV6K0cG4rlVAW8s=
X-Google-Smtp-Source: AGHT+IFbsnq2ddYPgTx5GqK9vGZE+Uqpb6HVg5+nuD/YEPznUEqrqZwrmZj8wm1A1nPL7HFG4fXZPv01bjW3R3SEHY0=
X-Received: by 2002:a05:6512:318d:b0:533:d28:b9d9 with SMTP id
 2adb3069b0e04-5365881a387mr1497792e87.58.1725627709465; Fri, 06 Sep 2024
 06:01:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903163033.3170815-1-ukaszb@chromium.org> <20240903163033.3170815-2-ukaszb@chromium.org>
 <ZtrA3FAKgXOm-FzE@google.com>
In-Reply-To: <ZtrA3FAKgXOm-FzE@google.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 6 Sep 2024 15:01:38 +0200
Message-ID: <CALwA+NbWvomutA_BZ54ZbFX0+_2kzrmj3WaMQ=AtpeBLgoua9w@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] platform/chrome: Update ChromeOS EC header for UCSI
To: Tzung-Bi Shih <tzungbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 10:44=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Tue, Sep 03, 2024 at 04:30:26PM +0000, =C5=81ukasz Bartosik wrote:
> > From: Pavan Holla <pholla@chromium.org>
> >
> > Add EC host commands for reading and writing UCSI structures
> > in the EC. The corresponding kernel driver is cros-ec-ucsi.
> >
> > Also update PD events supported by the EC.
> >
> > Signed-off-by: Pavan Holla <pholla@chromium.org>
>
> It needs your S-o-b tag at the end.  See [1].
>
> [1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.ht=
ml#when-to-use-acked-by-cc-and-co-developed-by
>
> > --- a/include/linux/platform_data/cros_ec_commands.h
> > +++ b/include/linux/platform_data/cros_ec_commands.h
> > @@ -5012,8 +5012,10 @@ struct ec_response_pd_status {
> [...]
> >  struct ec_response_host_event_status {
> > -     uint32_t status;      /* PD MCU host event status */
> > +     u32 status;      /* PD MCU host event status */
>
> Even though ./scripts/checkpatch.pl dislikes it, but please don't do that=
.
> The header is a re-import from EC's repo.  We should try not to be diverg=
ent
> from the origin too much.
>
> > +/*
> > + * Read/write interface for UCSI OPM <-> PPM communication.
> > + */
>
> Same reason: it'd be better if it can align to [2].
>
> [2]: https://crrev.com/1454f2e8dac20ca37428744345c1bb4fdec30255/include/e=
c_commands.h#8055
>

I will do.

> > +#define EC_CMD_UCSI_PPM_SET 0x0140
> > +
> > +/* The data size is stored in the host command protocol header. */
> > +struct ec_params_ucsi_ppm_set {
> > +     u16 offset;
> > +     u8 data[];
>
> Same for the u16 and u8.
>
> > +struct ec_params_ucsi_ppm_get {
> > +     u16 offset;
> > +     u8 size;
>
> Same here.

It was a comment from Greg no to use uint*_t types but I agree the
changes I made are inconsistent with the rest of cros_ec_commands.h
file.

Greg would you be ok to stay with uint*_t types in cros_ec_commands.h
to be consistent with the rest of the file ?

Thanks,
Lukasz

