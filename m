Return-Path: <linux-usb+bounces-2149-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6D27D5C3C
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 22:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D041B1C20CFC
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 20:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A8D3E478;
	Tue, 24 Oct 2023 20:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jqgTtIoV"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63743E469
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 20:14:08 +0000 (UTC)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B972D7A
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 13:14:07 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5a7a80a96dbso1545517b3.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 13:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698178446; x=1698783246; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dC2atrRSIB/YiTVS/2rjfPCeXytCc5iWQP0atJqNYrA=;
        b=jqgTtIoVh88LngPB+173ZfjfX2OxMcBYshQjT0aZdLlJy7pgrnacsQR0iZ8AiPEMsv
         hWB+2t/eihA1qLI6OFuZ+9JiiKvrNo77AYnvSeQJkd2pv5WgMIGSToNumOx8YBn8pEoi
         aG71Tl1MX2KnZPUAe2f56PgmoHfH4BKx1SN53Z9loCUKf6Ljc3imQpb4hQHQ7uyVBT62
         4IlubW9WdSwEPOtC4c6SffMziM2rBIZAZdFUgfzp+RmRl57+CiqqqRR/AlF6fM1ZRul1
         2wpm2+mnsaNIuYdCZZB85UA2+tnjnXlW/0vvhAKRXd1D5klJVkPFIr18+va6AZUfLdQv
         yZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698178446; x=1698783246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dC2atrRSIB/YiTVS/2rjfPCeXytCc5iWQP0atJqNYrA=;
        b=Fhna5jHGpjflhM4mG4f/DVqlfwJKZkWxRgxiBQfBmz9n+Qu3UG3aQNWlD0tLWZMGjS
         xEFY5jAOWzO6D63XDdfdFA2vMyyBjADnXdpZSijCzffF7zeyAcbgxs+7fZQD+6I0yuAO
         MesuWU7/tMFLteOEJIMbPka6EqvRhL8t606jw19KrkI/ag6sWs7njbZxGA5iNaJuECmg
         NiprbgErnuB+gmurAqyxk7ooz+0gNXQ+d9959ie39HkzOl/CfUKdNtGpM7znbPsXIaGl
         hvDgTUCvHMjN3w5opc8KHverO/uOMwCbbrV8D8SWpLQTDpcs8eiMTTUNCLCrdCZBi8lV
         PBuQ==
X-Gm-Message-State: AOJu0Yxo9yTfNLBtzP0jGRWpz6+x4LFxleyXt0IwapiAF6flpX4DAhT0
	frvjDx+J6vJ0lvv8sJBhQE03YFI1XlipErVJuU5RCQ==
X-Google-Smtp-Source: AGHT+IH+YE5cS3MCTNpJE0MbWyfP6NB9VzBuKjHGcDlHWkZ98wZhkbWeB0ONrk0GStbHMSg424rNShJo3nK/aCpyKqw=
X-Received: by 2002:a05:6902:e91:b0:da0:3648:c3c5 with SMTP id
 dg17-20020a0569020e9100b00da03648c3c5mr4432774ybb.27.1698178446333; Tue, 24
 Oct 2023 13:14:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231023215327.695720-1-dmitry.baryshkov@linaro.org>
 <20231023215327.695720-2-dmitry.baryshkov@linaro.org> <20231023224715.GN3553829@hu-bjorande-lv.qualcomm.com>
 <CAA8EJppen6Ebmv_fjdrHoUXRsFFH5TZonKck=bRDKgXTTWOxoQ@mail.gmail.com> <20231024164254.GP3553829@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20231024164254.GP3553829@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Oct 2023 23:13:55 +0300
Message-ID: <CAA8EJpqbxAo8kxw6RXx18dyT0X9us=2p=bNCxJNHk6aP5012Sg@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: typec: ucsi: fix UCSI on buggy Qualcomm devices
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Oct 2023 at 19:42, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Tue, Oct 24, 2023 at 02:08:33AM +0300, Dmitry Baryshkov wrote:
> > On Tue, 24 Oct 2023 at 01:47, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> > >
> > > On Tue, Oct 24, 2023 at 12:47:26AM +0300, Dmitry Baryshkov wrote:
> > > > On sevral Qualcomm platforms (SC8180X, SM8350, SC8280XP) a call to
> > > > UCSI_GET_PDOS for non-PD partners will cause a firmware crash with no
> > > > easy way to recover from it. Since we have no easy way to determine
> > > > whether the partner really has PD support, shortcut UCSI_GET_PDOS on
> > > > such platforms. This allows us to enable UCSI support on such devices.
> > > >
> > >
> > > Really nice to see this. Thanks.
> > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/usb/typec/ucsi/ucsi.c       | 3 +++
> > > >  drivers/usb/typec/ucsi/ucsi.h       | 3 +++
> > > >  drivers/usb/typec/ucsi/ucsi_glink.c | 3 +++
> > > >  3 files changed, 9 insertions(+)
> > > >
> > > > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > > > index 61b64558f96c..5392ec698959 100644
> > > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > > @@ -578,6 +578,9 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
> > > >       u64 command;
> > > >       int ret;
> > > >
> > > > +     if (ucsi->quirks & UCSI_NO_PARTNER_PDOS)
> > > > +             return 0;
> > > > +
> > > >       command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);
> > > >       command |= UCSI_GET_PDOS_PARTNER_PDO(is_partner);
> > > >       command |= UCSI_GET_PDOS_PDO_OFFSET(offset);
> > > > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> > > > index 474315a72c77..6478016d5cb8 100644
> > > > --- a/drivers/usb/typec/ucsi/ucsi.h
> > > > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > > > @@ -317,6 +317,9 @@ struct ucsi {
> > > >  #define EVENT_PENDING        0
> > > >  #define COMMAND_PENDING      1
> > > >  #define ACK_PENDING  2
> > > > +
> > > > +     unsigned long quirks;
> > > > +#define UCSI_NO_PARTNER_PDOS BIT(0)  /* Don't read partner's PDOs */
> > > >  };
> > > >
> > > >  #define UCSI_MAX_SVID                5
> > > > diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> > > > index db6e248f8208..5c159e7b2b65 100644
> > > > --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> > > > +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> > > > @@ -327,6 +327,8 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
> > > >       if (ret)
> > > >               return ret;
> > > >
> > > > +     ucsi->ucsi->quirks = id->driver_data;
> > > > +
> > > >       ucsi_set_drvdata(ucsi->ucsi, ucsi);
> > > >
> > > >       device_for_each_child_node(dev, fwnode) {
> > > > @@ -379,6 +381,7 @@ static void pmic_glink_ucsi_remove(struct auxiliary_device *adev)
> > > >
> > > >  static const struct auxiliary_device_id pmic_glink_ucsi_id_table[] = {
> > > >       { .name = "pmic_glink.ucsi", },
> > > > +     { .name = "pmic_glink.ucsi-no-pdos", .driver_data = UCSI_NO_PARTNER_PDOS, },
> > >
> > > In altmode and battmgr drivers we apply quirks based on the compatible
> > > of the pmic_glink of_node.
> >
> > ... and I can't say that I like that. In typical drivers we perform
> > driver tuning by looking at the device's data (e.g. by using
> > of_device_is_compatible or by of_device_get_match_data. Checking the
> > parent device seems like breaking the layering.
>
> It felt like it was the cleaner option of the two when I did it. I think
> there was some variation of quirks which made me feel this would grow
> large - but I might misremember things now.
>
> > But if you insist, I can follow that approach.
>
> I insist that we should use the same mechanism of dealing with the
> quirks across the three parts, and following the existing approach
> doesn't seem too unreasonable...

The problem with the current approach is that it adds dependency
between patches. We can not apply patch2 without patch1 being in
place, since applying will enable buggy UCSI.

-- 
With best wishes
Dmitry

