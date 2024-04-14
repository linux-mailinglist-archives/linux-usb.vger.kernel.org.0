Return-Path: <linux-usb+bounces-9230-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B348A01B9
	for <lists+linux-usb@lfdr.de>; Wed, 10 Apr 2024 23:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D0611F23BFC
	for <lists+linux-usb@lfdr.de>; Wed, 10 Apr 2024 21:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94CD1836D9;
	Wed, 10 Apr 2024 21:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yadLgMaq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A636B1E877
	for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2024 21:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712783378; cv=none; b=fBY/oNP18QEdTKBezerANaWUjHvzLQjcvAycSl7DHwlgjpIhtBdRvaqil0qtH1VjYD5X4zjN0epcCS6GsA3bcHefQrb41ognE6r+U7j9AUBn+cAAb0WeIjoaktZNB7WoVtMTQxl6DA8w213xnmAlRA1SroGAzvgyfdc6Z/rqEsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712783378; c=relaxed/simple;
	bh=WAW9t2DThjMy2xKQv7rDe/rTV+u/8A0589ytEQxdCh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOdLB3XiU0NpDrjVL3Y3Gr43ncISOdLLXKdkjq+zdDB6kRCMkNe4bNNtqHwxnOmgw2xNobi6OIvDc71T6nu2eCdZY0SkswJ/YZ9pTO3rO2owVLwsVAlcU/4vgdLIpii+oBvuPxMdno/Gb8oGWp17kNzqWHFyLLvxWFmtqTjhqJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yadLgMaq; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-516d264d0e4so243029e87.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2024 14:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712783374; x=1713388174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3sq6cL+yZCWXGwoBU9BEGIVYWjjNj7BcR817H9ZPTm4=;
        b=yadLgMaqD5Y+LhN4ER0Yq/z64krORJjXS3JhVmz8/mneaN10jSbQtit4Kjo6e5gaPp
         DUeaM7mMyq5yJakto0gG9rtUfzg+/DyQQlsalSPYS4InA36xZhe/mSD96BWOcXZ8yz9K
         wAOj9JI3xtOUPufllaLucdsWDKtyamEI4+A3oJWzh48YCElLJVQ4r7/Tjh6z0jhA9diy
         AJyEyj8YA45EdInT/NnjnzFJAKj82xzYD6smu7Tv4jTuMO838tdb1D2Bpe42ySP2yWQ/
         GpoRnPQgmXVHU/aWMH8PdcP+Lf5TpleJqWkiD2me/N/G0ZXDayDM5KZwas5QCVgMgL+4
         MFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712783374; x=1713388174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sq6cL+yZCWXGwoBU9BEGIVYWjjNj7BcR817H9ZPTm4=;
        b=ZpPic2/W3pulfiuzsyL4eZBV5sXa82zPGQT1FE7vGZcISNhFIAmxPVzUdSh/eV/ibO
         h1zdQftOYdQ91PEft0+QjNT5dOoYvXLQmCL4sGncSmy3cUpS5JpXe0hA6/KrWn5J//C7
         IAvKs5zwmOR14p6xWqbhknwQUdTPxkyqxvE2+dQ+HYaalvHafCYT4iYSAeiuAznizRSc
         fO28ilHnpK95I2am5eaxt7vgTZ9uJt7GR6h6rgZvsYIooUBHN91+LLD65L7Z0yn+a41L
         dfZASMRP6quegpAy7O7dnrlg2177yHutiXYVp97z/XMRKXeTb4JICWbHqlwyhKNlGdkS
         p+wQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/xAo/X2sbybFN5TYAotwcYSsq3ux6AOBuSmZxwiON2JnBVozFDRr82tcAftV5+5MEvg1r06+63CIu+mwu2mlFgvgLEr0mFf9B
X-Gm-Message-State: AOJu0YxHEhlQGMHLzC4fY7q+ubuJIZAUlpsgP1ohhCrWO24L16qgy4bQ
	K8arIohecpbSBMh0awrMoRMaw64W6UwyGf7T7BBunLA5nONtdNNwdVKqc69b0pw=
X-Google-Smtp-Source: AGHT+IEqfZtA5IXLhzSXHUGyAGjypXAWIlAlr+3Je8YOnecyrhDB0Jb266QBNeEz0oVkfnh/ZR74OQ==
X-Received: by 2002:a05:6512:11ed:b0:513:c47e:d811 with SMTP id p13-20020a05651211ed00b00513c47ed811mr177254lfs.33.1712783373633;
        Wed, 10 Apr 2024 14:09:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id d10-20020ac24c8a000000b00516d2489f16sm14619lfl.260.2024.04.10.14.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 14:09:32 -0700 (PDT)
Date: Thu, 11 Apr 2024 00:09:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/3] usb: typec: ucsi_glink: drop special handling for
 CCI_BUSY
Message-ID: <s2w7qfrbm3lq46hp4r4grmljg7cs24d6lmpiqr2mllxszte6wc@w7rh47o3z6rc>
References: <20240409-qcom-ucsi-fixes-bis-v2-0-6d3a09faec90@linaro.org>
 <20240409-qcom-ucsi-fixes-bis-v2-3-6d3a09faec90@linaro.org>
 <ZhWWYQMluJCvYFKF@cae.in-ulm.de>
 <CAA8EJprTbtTSkZ18dejEgvhJOEQKQiwpE+6JkbHiO4H-yeKuhg@mail.gmail.com>
 <ZhZCsyeXa093OZnR@cae.in-ulm.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZhZCsyeXa093OZnR@cae.in-ulm.de>

On Wed, Apr 10, 2024 at 09:41:39AM +0200, Christian A. Ehrhardt wrote:
> 
> Hi Dmitry,
> 
> On Wed, Apr 10, 2024 at 01:58:58AM +0300, Dmitry Baryshkov wrote:
> > On Tue, 9 Apr 2024 at 22:26, Christian A. Ehrhardt <lk@c--e.de> wrote:
> > >
> > >
> > > Hi Dmitry,
> > >
> > > On Tue, Apr 09, 2024 at 06:29:18PM +0300, Dmitry Baryshkov wrote:
> > > > Newer Qualcomm platforms (sm8450+) successfully handle busy state and
> > > > send the Command Completion after sending the Busy state. Older devices
> > > > have firmware bug and can not continue after sending the CCI_BUSY state,
> > > > but the command that leads to CCI_BUSY is already forbidden by the
> > > > NO_PARTNER_PDOS quirk.
> > > >
> > > > Follow other UCSI glue drivers and drop special handling for CCI_BUSY
> > > > event. Let the UCSI core properly handle this state.
> > > >
> > > > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/usb/typec/ucsi/ucsi_glink.c | 10 ++++------
> > > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> > > > index 9ffea20020e7..fe9b951f5228 100644
> > > > --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> > > > +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> > > > @@ -176,7 +176,8 @@ static int pmic_glink_ucsi_sync_write(struct ucsi *__ucsi, unsigned int offset,
> > > >       left = wait_for_completion_timeout(&ucsi->sync_ack, 5 * HZ);
> > > >       if (!left) {
> > > >               dev_err(ucsi->dev, "timeout waiting for UCSI sync write response\n");
> > > > -             ret = -ETIMEDOUT;
> > > > +             /* return 0 here and let core UCSI code handle the CCI_BUSY */
> > > > +             ret = 0;
> > > >       } else if (ucsi->sync_val) {
> > > >               dev_err(ucsi->dev, "sync write returned: %d\n", ucsi->sync_val);
> > > >       }
> > > > @@ -243,11 +244,8 @@ static void pmic_glink_ucsi_notify(struct work_struct *work)
> > > >               ucsi_connector_change(ucsi->ucsi, con_num);
> > > >       }
> > > >
> > > > -     if (ucsi->sync_pending && cci & UCSI_CCI_BUSY) {
> > > > -             ucsi->sync_val = -EBUSY;
> > > > -             complete(&ucsi->sync_ack);
> > > > -     } else if (ucsi->sync_pending &&
> > > > -                (cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))) {
> > > > +     if (ucsi->sync_pending &&
> > > > +         (cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))) {
> > > >               complete(&ucsi->sync_ack);
> > > >       }
> > > >  }
> > >
> > > This handling of the command completion turned out to be racy in
> > > the ACPI case: If a normal command was sent one should wait for
> > > UCSI_CCI_COMMAND_COMPLETE only. In case of an UCSI_ACK_CC_CI
> > > command the completion is indicated by UCSI_CCI_ACK_COMPLETE.
> > >
> > > While not directly related, a port of this
> > >     https://lore.kernel.org/all/20240121204123.275441-3-lk@c--e.de/
> > > would nicely fit into this series.
> > 
> > Ack, I'll take a look.
> 
> Thanks.
> 
> > However... I can not stop but notice that CCG and STM32 glue drivers
> > use the same old approach as we do. Which probably means that they
> > might have the same issue.
> 
> I did ping the ccg people wrt. this but they have a different
> workaround that saves them at least most of the time, so I let
> this drop.
> 
> > Could you please consider pulling up that
> > code into the UCSI driver? Maybe the low-level code really should just
> > read/write the messages, leaving all completions and CCI parsing to
> > the core layer?
> 
> I did consider that but one of the ideas behind the new API for
> UCSI backends was that backends can send commands (e.g. as part of
> a quirk) even in the middle of a ->sync_write() call. Currently,
> I don't really see how to combine this with completion handling
> in the UCSI core.
> 
> > > I don't have the hardware to do this myself.
> 
> I did propose other changes to the API with little respone here:
>     https://lore.kernel.org/all/20240218222039.822040-1-lk@c--e.de/
> That could possibly be extended to achieve this. But again, that
> would require testers for all the backends.

Well, I think that the patchset is too intrusive and (from the
pmic-glink perspective) is too low-level.

I'd start by pulling the sync_write() into the core layer, leaving just
async_write in the glue layer. The async_write() then can be renamed to
something like send_cmd(). Once required we can add the data pointer to
this callback.

I liked the idea of getting the CCI from the notification (in case of
pmic-glink it works this way on all platforms except sc8180x).

So what about having a really simple interface:

sruct ucsi_operations {
	/*
	 * send the command without waiting for the result
	 * can be extended with u8 *data, size_t data_len once
	 * necessary.
	 * maybe use u8 control[8] instead of u64 control.
	 */
	int send_command(struct ucsi *, u64 control);

	int read_data(struct ucsi *, void *buf, size_t len);
	int read_version(struct ucsi *, u16 *version);
	/* to be used only for reset handling */
	int read_cci(struct ucsi *, u32 cci);

	// other ops like update_altmode, as is
};

/* to be called by the glue driver once it gets the notification from
 * PPM */
void ucsi_notify(struct ucsi *ucsi, u32 cci);

This way we can pull all the common ACK/connection_changed/completion
code into the core, while keeping glue layers flexible enough.

-- 
With best wishes
Dmitry

