Return-Path: <linux-usb+bounces-14787-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B88F296F5E7
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 15:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7494C284F2F
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 13:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C1A1CDFD6;
	Fri,  6 Sep 2024 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Sin3IB+H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554761CEAC9
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 13:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725630802; cv=none; b=gMm/pkiilQKdGrJ+qNNBY0RjgyNT4mYulR7jZaplhPYaQmLAy13JfildYRCNYFUSG2cSSERLnTH/a+sXjGP438X+Pbdezf7QMB/573iitE9bZDUGek/O7iy+4NfSywUr/dGQQdgmtOc+IBuT4JJ2/03PFs/Jt5xFGv61fM8RRio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725630802; c=relaxed/simple;
	bh=Em8bvn/f2H5KfpZ0ThOOeCWybP6uMU6Mon9pWOSdXgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvZa6XAKhM+GJGvmbXQSommSNckZcu9g+BeVAMI3VJj4iJ6q4xsmfeCzo1OlsXCmbMHZptaAifmWh5fA07QvCSWcmKOABAfO195HUHJ6d5TqULNBaAyL1jGYL7iufzctLyAfXEWZTkDDCBjCN2fe+ut9bP0d2mA4uIoQKT4eJiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Sin3IB+H; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso3582461e87.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2024 06:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725630798; x=1726235598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiDpLiwQWRQKgEUyDLSR0/UKgRFrC686Eaq4LU0p0Rs=;
        b=Sin3IB+HrjwmBUg2GxoYpT1Z4tXNp5mCR3tGRzzKPSFSR/La2p7feUSGMv0VBCZapF
         wsKzlxfXGq5VL/y36S0RKcnOgMcU4PDygKGN3EdEcuxtScgAQ45L2sKi6ALCk1GNcWyU
         lx8BHuiK19DJcRmZK7G4wpZFBJfic1xWxUdHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725630798; x=1726235598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiDpLiwQWRQKgEUyDLSR0/UKgRFrC686Eaq4LU0p0Rs=;
        b=NQNiSMXPKCxaqITbWPLL6U1SfvME+qEgMbJ8yvs7HUqFp6vUsS7F2pfK1xupBzHWxM
         Emh3iBDy3aguxJ7e/rTIDXfqMQG5Gvh+PDkhuRhO5s2pOBm2vkzGat1BodPXqfgRNSrS
         /ccImPIjj6Dyjnk/4fnFSipumeAqoc3GDYDCzcZsJxKyy5UytbkMsmyYsJdfwK8oWIci
         JUR3G6WkUlIxilOUF67tRZNC/zz2G9K+vipGOFPWv1vgBG988qWRLGddxVOyCIssKlKl
         y198fsQVy5rDlKAkwsmuo1uqOhLSepqAYE6I6u6Qw+YCvjLRdjN7G67RZ/0K5ZWDMWku
         O/Og==
X-Forwarded-Encrypted: i=1; AJvYcCXUq02J/VzmOGArso9vo6U3FKuSKFQCP4cioV3oXtU1EAZfXDLG65SmS7uuWxHwpQAhMJ0Mo1f/s58=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/BV6Ms9oQAEtUq8fXPhyy/8EvWxEHdMPpH/HDKrzU6aQx1TwB
	z3ujgzZ2qfGiWr82K7k94HYnOhQ3wN4dB00sZdkwnkWMxY+A5cJXc+Zv5jdV7U8y/QDB6lceGYJ
	hwoTBJszJuf4Jh0upDFgxjH8eHwjSsUsyOww=
X-Google-Smtp-Source: AGHT+IEw61CvBBoRPiccYSMUEy0oGgYCG2GgCkWOPBK65MyPZmUJ6aZypgSS1/nrR6LwN9Rq/SX47iUq960J99ro+zE=
X-Received: by 2002:a05:6512:a92:b0:52f:d15f:d46b with SMTP id
 2adb3069b0e04-536587abfa0mr1738029e87.14.1725630798085; Fri, 06 Sep 2024
 06:53:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903163033.3170815-1-ukaszb@chromium.org> <20240903163033.3170815-3-ukaszb@chromium.org>
 <ZtrA8y0266RTm5Z3@google.com>
In-Reply-To: <ZtrA8y0266RTm5Z3@google.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 6 Sep 2024 15:53:06 +0200
Message-ID: <CALwA+NbiW+Gt9fi6Y+_xJFUEQWZFp5cvB5kqw_LVd4Mcf03Xtw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] platform/chrome: Update EC feature flags
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 10:44=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Tue, Sep 03, 2024 at 04:30:27PM +0000, =C5=81ukasz Bartosik wrote:
> > From: Pavan Holla <pholla@chromium.org>
> >
> > Define EC_FEATURE_UCSI_PPM to enable usage of the cros_ec_ucsi
> > driver. Also, add any feature flags that are implemented by the EC
> > but are missing in the kernel header.
> >
> > Signed-off-by: Pavan Holla <pholla@chromium.org>
>
> Same as previous patch, it needs your S-o-b tag at the end.  See [1].
>
> [1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.ht=
ml#when-to-use-acked-by-cc-and-co-developed-by

I have not added any modifications to this patch. I understand that my
S-o-b tag is not needed in such a case. Is that not correct ?

Thanks,
Lukasz

