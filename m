Return-Path: <linux-usb+bounces-11589-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 695A491518D
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 17:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC1011F21A37
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 15:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D9E19E7CE;
	Mon, 24 Jun 2024 15:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FHQJBe4H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B6619D063
	for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 15:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719241777; cv=none; b=iHNYgGBvYfRejP2PQa5UrBu8oNaeoHwtMe+oV72fFWJCQLSGcNZAdk89ZtjAIxJdrINcPBcTQZWktJfTI5OxW53YQtTy+9JFGomYUznUSGTKIHvLHHTo3SFMaMc9thlkLxN2X0is9kAc6GYrszBz067t0EYCNusopscHP3pkrx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719241777; c=relaxed/simple;
	bh=Ibi8sYn7ylQL5y3VEu7Upgb5wJZ1JdA3xJL82aIZMfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCUrVHI/596+8ECR1iIA2azxw3v7JRCHXjxYio8Qh9p06oJK+YaLeJjqRfFDBk8qtgP2bdRdtEGnolTdFfznSo2jIr5roxSc9TDHOsaWGjT9a0s0rY1/W/vghQ0wyPv37+o+nU57wnrHSlbqUQvR/sKJb4NrCgtS/HTcI2GwW6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FHQJBe4H; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-63bca6db118so42119587b3.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 08:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719241775; x=1719846575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASZd4wKEAiwtqiPptjvJp63/aDvJWAQ0c9DP1WpI4QM=;
        b=FHQJBe4HVSxW5+hmTn3nNtqFZ5VwhPHZ6oHGd0mf52Rrn1zUo7VUwMSLIlqO1NAHmO
         skhz7W6ar00UG2QskuxJoLr5GZlmH/dAoHeA+aM9t+zRF+k+uJUfZZttUzBtr0TEwJwe
         z5VkB80/CMgkLPnCKRbBZvU0ZZolRjX6UeB3vo4ubE+SttK+a+H+ZndLIovGyofYMDZE
         sfZfOiMbLJq0Ewqv2g5MHPTTpUqvyBsL+2QjDgqzCv/BQmlzMENUbkrfukYS34wU7DMu
         FWAKjk7RMT2A0zMAwli6ULGhsAiTp82PUi+Qvzf3kcw3n2aoiQtaBrErbZGsQvLaUslC
         Qt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719241775; x=1719846575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASZd4wKEAiwtqiPptjvJp63/aDvJWAQ0c9DP1WpI4QM=;
        b=gkVxMnvmM3RKnepbXpmku/1LhkE0DaOf3jEewvYZ/9Ohc1HoqdHMxDF1ebWEelfcDM
         q0A0kKukbYh9nvsa5fsDADXqvE/w7yG/UMxBTLLebiPpy4/fFFQNwkBHlfIgOyr3fkwp
         1u7vSJJVzsjarA6eVzECKPnMvHPOZN5MnwJBVlwMjTd3BlNEEjxJz7Dwee4Tf/JfCqp9
         EgD/5Z1hHVJy3RPLixo4WbCN+qVeGNr5T0vDIAWIcWnP6qkrx6maWQwOFFxsAnsah8Oc
         cBu+ibPXtZx901+66FILRvwuTjd1/6U46i3rsZMAeQfOneSafyud8kscd6WSSgRSJcs/
         Q7IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmqNLx38TEbcVtBKI+A7gPsr5T8FpweYgu22nnEH4T09bgVqYY/pG/xuIO6I8+eB+LQ/pftGZeZHMFod/DGuRSGXwK7ExpYeYT
X-Gm-Message-State: AOJu0YwixT6Zn8VsdQCLA5GJls2kD4A7EioezBoEhlhN+uJsmADjKvoN
	KSRfymmYS/UHDfcMFAZ96kR6hPtxT9tgqbq/7q3p33aK66udNNvrOnn8Fg+RZMefYKrGLglskFc
	wYzYdBOuuo0K3noAd2yYnX3MIqURt+NfkeiepIw==
X-Google-Smtp-Source: AGHT+IFk7ZptCfvr3I0bCaSAgeH41ekniw2KW5iMHWyieVMoyZ19l2fUERsJJEo6b9A6UwAFeBQR0LS33DKM2r3otCI=
X-Received: by 2002:a81:6e54:0:b0:63c:486a:289e with SMTP id
 00721157ae682-643abf3cbd5mr46006067b3.32.1719241774654; Mon, 24 Jun 2024
 08:09:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621-ucsi-yoga-ec-driver-v8-1-e03f3536b8c6@linaro.org>
 <2024062411-neutron-striving-f16c@gregkh> <CAA8EJppDtmNxfjc-f9MA1Za=jvZFqahKtM+FA66jG6Dg=zp1Cw@mail.gmail.com>
 <2024062400-stimulant-barn-2daa@gregkh>
In-Reply-To: <2024062400-stimulant-barn-2daa@gregkh>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 18:09:19 +0300
Message-ID: <CAA8EJpqNd45CF+hw-fqXzUT51+6wmxYy3R8UBxzH+9C3AcgO+g@mail.gmail.com>
Subject: Re: [PATCH v8] usb: typec: ucsi: add Lenovo Yoga C630 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Nikita Travkin <nikita@trvn.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 24 Jun 2024 at 17:43, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 24, 2024 at 05:37:05PM +0300, Dmitry Baryshkov wrote:
> > On Mon, 24 Jun 2024 at 17:25, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Jun 21, 2024 at 01:21:26AM +0300, Dmitry Baryshkov wrote:
> > > > The Lenovo Yoga C630 WOS laptop provides implements UCSI interface =
in
> > > > the onboard EC. Add glue driver to interface the platform's UCSI
> > > > implementation.
> > > >
> > > > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > > Add driver for the UCSI on the Lenovo Yoga C630 laptop, as implemen=
ted
> > > > by the Embedded Controlller of the laptop.
> > > >
> > > > Support for this EC was implemented by Bjorn, who later could not w=
ork
> > > > on this driver. I've picked this patchset up and updated it followi=
ng
> > > > the pending review comments.
> > > >
> > > > NOTE: the patch depends on the header from the platform driver. Ilp=
o
> > > > J=C3=A4rvinen has created an immutable branch based on v6.10-rc1, p=
lease pull
> > > > it before merging the patches:
> > > >
> > > >   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-dr=
ivers-x86.git tags/platform-drivers-x86-ib-lenovo-c630-v6.11
> > > >
> > > >   platform: arm64: add Lenovo Yoga C630 WOS EC driver (2024-06-14 1=
2:51:30 +0300)
> > >
> > > I have that branch, yet when building this driver as a module I get t=
he
> > > following errors:
> > > ERROR: modpost: "yoga_c630_ec_unregister_notify" [drivers/usb/typec/u=
csi/ucsi_yoga_c630.ko] undefined!
> > > ERROR: modpost: "yoga_c630_ec_ucsi_get_version" [drivers/usb/typec/uc=
si/ucsi_yoga_c630.ko] undefined!
> > > ERROR: modpost: "yoga_c630_ec_register_notify" [drivers/usb/typec/ucs=
i/ucsi_yoga_c630.ko] undefined!
> > > ERROR: modpost: "yoga_c630_ec_ucsi_write" [drivers/usb/typec/ucsi/ucs=
i_yoga_c630.ko] undefined!
> > > ERROR: modpost: "yoga_c630_ec_ucsi_read" [drivers/usb/typec/ucsi/ucsi=
_yoga_c630.ko] undefined!
> > >
> > > So something went wrong :(
> > >
> > > I'll unwind that branch pull now as well and wait for a fixed up vers=
ion
> > > to be sent.
> >
> > Could you please share your .config? I could not reproduce the issue
> > here. The EC driver has all the necessary EXPORT_SYMBOL_GPL()
> > declarations.
>
> Sure, attached.

Thanks! Fixed in v9, drivers/platform/Kconfig issue.

--=20
With best wishes
Dmitry

