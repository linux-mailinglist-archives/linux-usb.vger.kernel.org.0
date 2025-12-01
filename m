Return-Path: <linux-usb+bounces-31054-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 278F1C96182
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 09:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BFCEE4E149A
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 08:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44612DA771;
	Mon,  1 Dec 2025 08:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DuyOC+Ei"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DB728851C
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 08:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764577371; cv=none; b=XL6Ho0/iYegdLJ1/NYAarIX+WmpLQHIoDaOBRyTV8I0/EcuNeYPv+B81E4VDXP4u6+EPQcKbtvZNcVjj7GDiZHpJUddpU0RxVTAdXDvkMzt9ebybU5NO4aOMSUVyWWmK0YBwErDZhWK3EoQlovPPCG8+cZ5uiXBnmqAmg8J+7OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764577371; c=relaxed/simple;
	bh=tezhH6g+Oo3Ep2YJM2R5MfJjZnq1NndRUUIAt4C1nnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PbgVwQrT8N1t+UelgoE7UuHgz3IP7cRkPkmJUrkVrWAvPerll+O3EzhIYM9c84rEAfH0Gmt2GL5JSQOpIaQPmNh6WfOOMu3daTgfqF/nP0biuRq+2IFoMuQSHXwGHowy7T8Ie1bGiO9HuXYynvCDUaExkx+FGDdGBJDzrBFsBaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DuyOC+Ei; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3436cbb723fso3111293a91.2
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 00:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764577369; x=1765182169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DkKGTzDIQjUjyaKZQTcpj/1tCVQMkC/PnSyMv8/Z4k=;
        b=DuyOC+Ei0ApnaYR/fzM/yOMP3rDtdEiU46A//OgqcLIwDTh0w5JZtYnmLLq+EfI2Iy
         leCztmUnnVSqLMZbNrrGNrL2H4Yflfek7tDBjWUy5EXNfJeo9CnhIiYuBkFl4YHxrYjj
         dl0SO72501+wKjYK+FesLNbNdrUQPyd/Nwv14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764577369; x=1765182169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6DkKGTzDIQjUjyaKZQTcpj/1tCVQMkC/PnSyMv8/Z4k=;
        b=EjlDosK+Lby3yYVb9rqGOv9nDm6vK6Vh48mRBZRFD68rdmEjvofrD4h+EjpVKpIor/
         lgCBKXYsDIdUGFwNgFXBWAqVYbjNXUHt6e//TtKfjAL9PjfJcXf3EMe2AXAnrQTmeOB6
         rWhxn1OkIWHkngXbQAc1RJt6zjUkUzfk1VH0mit0wrla2DvdIHqyuWoBfMXY9bh7xSgc
         LCdiYhZAMAy/+C28e68lxTtpudNvDT0uurUf2FcIcEC7zCUG5fnac331/sIYQZq9ii4N
         EepvhmQY7WtMlbymCxHt6xjEDuZ/BKA+YJhtnaacZOBRdm0PF1zOBfMQ9SmD3OB1bDli
         jLhw==
X-Forwarded-Encrypted: i=1; AJvYcCW7lop+ncU3GENmCS8NiSoNHFl5cTHfAl9gNAqzSss0bUDmKKulkcsRpPXKW5nG+jW13z9fYESmfvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywai+RfvBfSfjnrRTy6BlWrZbplj0p7/UGnQ0m1Eb0q2GF5sJUm
	prdMTuyhJnT2DaPdIa6Zde8IbWLNhslq/nlUvRrz84EC2x5dOvqoToTkcetxYu/GlghD2nl4FXI
	MGZvGsL2SnF+gQrQX64flSbClgdA279QMU+HbF+BY
X-Gm-Gg: ASbGncs8LzgoH7yDK/oyaLdnYBlRrVVDg7gh1jqnuVHxVHriyXsfWTFyaW9SkilgLy9
	mhftaEylFrFa7p5M/6da82deuxMQVaG7ZStT0OPesHVIVS9pRBedN2JkBuGeRgMv4DggWKgUIsK
	/sbrVK82QF7XVnneVU3eKD7WfGI2wYTN/bPcXzbTOa1LrmJpUlQzQO4KlhbANGiwx+mUovxsRNG
	h5LeisOj5jzW5PYp+5/n5IHDvs+epNHguU93CzSN/2aSKaKR99rWciQdwxVbMcWs0SrDftlmRZF
	TXO/ZQYJn7Vd6LuEV7yx7g==
X-Google-Smtp-Source: AGHT+IH9WSUA5mPr1et4ou+6+pf7OYX2I/zBaCmnpZxjq11HhJ+53Hocn79pmbMcGHkJoCXw8NRlWPt/W1Qvgt180Fs=
X-Received: by 2002:a17:90b:4b52:b0:330:7ff5:2c58 with SMTP id
 98e67ed59e1d1-3475ebe7422mr26700066a91.7.1764577369237; Mon, 01 Dec 2025
 00:22:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124124639.1101335-1-akuchynski@chromium.org> <aSbHHXIFYAqLzxzY@kuha>
In-Reply-To: <aSbHHXIFYAqLzxzY@kuha>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 1 Dec 2025 09:22:37 +0100
X-Gm-Features: AWmQ_bnNY5HEWFzHIK9AgQ3xZPJYBh875E9LzGBKj698eUubrtrBARNrxshHZZc
Message-ID: <CAMMMRMf7Nk1rAbusWCtjBds=_YMGTJ3Vg_hMmMPmXsBmZmsddg@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] USB Type-C alternate mode priorities
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Abel Vesa <abel.vesa@linaro.org>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 10:23=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Andrei, guys,
>
> Mon, Nov 24, 2025 at 12:46:35PM +0000, Andrei Kuchynski kirjoitti:
> > This patch series introduces a mechanism for setting USB Type-C alterna=
te
> > mode priorities. It allows the user to specify their preferred order fo=
r
> > mode selection, such as USB4, Thunderbolt, or DisplayPort.
> >
> > A new sysfs attribute named 'priority' is exposed to provide user-space
> > control over the mode selection process.
> >
> > This series was tested on a Android OS device running kernel 6.18.0-rc6=
.
> >
> > Changes in v5:
> > - Patches 3 and 4 (v4) have been consolidated into a singular patch,
> > keeping the mode priority implementation within drivers/usb/typec/class=
.c.
> >
> > Andrei Kuchynski (4):
> >   usb: typec: Add mode_control field to port property
> >   platform/chrome: cros_ec_typec: Set no_mode_control flag
> >   usb: typec: ucsi: Set no_mode_control flag
> >   usb: typec: Expose alternate mode priority via sysfs
> >
> >  Documentation/ABI/testing/sysfs-class-typec | 11 +++
> >  drivers/platform/chrome/cros_ec_typec.c     |  1 +
> >  drivers/usb/typec/class.c                   | 99 ++++++++++++++++++++-
> >  drivers/usb/typec/class.h                   |  1 +
> >  drivers/usb/typec/ucsi/ucsi.c               |  1 +
> >  include/linux/usb/typec.h                   |  2 +
> >  include/linux/usb/typec_altmode.h           |  1 +
> >  7 files changed, 112 insertions(+), 4 deletions(-)
>
> These are okay by me. I think we can move to the next step. But I'm
> not sure we apply these before that, because the file has no effect
> at the moment.
>
> Br,
>
> --
> heikki

Hi Heikki, Abel, Benson,

Thank you for your review of the series.
I will send the subsequent series detailing how we are going to use
priorities in cros_ec_typec and cros_ec_ucsi drivers.

Thanks,
Andrei

