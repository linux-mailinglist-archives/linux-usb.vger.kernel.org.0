Return-Path: <linux-usb+bounces-19814-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF212A20BA5
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 14:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EA2B167936
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 13:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A719A1A9B27;
	Tue, 28 Jan 2025 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/9SDYC8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A2C199FAB;
	Tue, 28 Jan 2025 13:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738072705; cv=none; b=rCmJpaZL5/6roJY/4Gtie/AQBGqHRyNRbuuHJcpsyytUJxAmPTGh8eNXtXKslnz/ZucfSJUc6TfXuosHhYV/kDUO3zESWdQdE1rtdVSb+fp495kO07Iyp7qx5oEXpLWAPEO8CZo92GUrlDbt0oTysE6ZJhJ5tgjKrTogEuVICz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738072705; c=relaxed/simple;
	bh=L/N1UyMhJM8D1vSPpY3W9GtRsEmDz+Ur6m8k4hG6x70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIDCs8htALplNaO3mPFYkU/14IYnWMKb5g26lVYqyaIPceH5v4s0QJRZbdq/MC0cNwnDV7uupeo9GGZF3Tr3DK44+DICLxxGmQ4QkXKO0Nz5r2ExSJIfI/sWQ7g9iVF18oGm6+0yR2fvgk8kfMjkiydP2/cjN7/y+0UYcsOXSHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/9SDYC8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5401be44b58so6095881e87.0;
        Tue, 28 Jan 2025 05:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738072701; x=1738677501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eQ90IBVG/ODxevEiX2M/CTWgY1R9RIJ2lmDuYGkT+dg=;
        b=G/9SDYC8SI+U+FxQFltz2GqYop61MjSYbtSlOLZlRa+KbYjv/3IcHl770KA7v+xW4s
         sz2M2FUkRzhzKU8eH3VcszRSa1ZhLhLgxQyYqmyeUY7s4CmlPK2LcTFti8/E9k3EDKua
         Zaoub8rq05JlWs3MBHXkPEjF9gaB9BPvhqpwPJkzemj69n3hs5eSYykvMsw/78ZSKmRE
         uiWkGmOfWqGrJJR2mltmbE9//pe7uqFIofc1LOVeT5qBv2qGfexI3CIESvSsBL0i0mQp
         4AEgfVnGyawW8Ww7QEvCZsgdmpQri+ahYdmxj1taebXII2MCHVcKyWGP8HEKugda8ssm
         DiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738072701; x=1738677501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQ90IBVG/ODxevEiX2M/CTWgY1R9RIJ2lmDuYGkT+dg=;
        b=qy0vt98kU+1a52ozqDhhu9Ps2Qii0isaCj/ahwzE4ptRSde6b+4zRd9cnLK4hkDjgV
         H3PQ5xR+KzoSoD3uHnOrNwlDm84usNWnmtKQmw2d8ibLpcI8fUj/rUim6h5zn8w9l8Dy
         su/KisM5wsFWznr+VZcRhnbfHIzlQQqEjg4Fyiv/39ChuQLCsGwDnsOlRD3HRU7IWYyK
         7ce9AAt0yoWwvZccTTap+zw7n8tC+TrzAL7p4RNJDKbx6gsyM+F+s8IJLnVMEPim5XfA
         spTi5q8JcexvSQuqfOrSAIp0sD0hOIn4WYf5X5VlrD0lkdNoBpKybk9UI3frYOZCa+/S
         xLYA==
X-Forwarded-Encrypted: i=1; AJvYcCWEdstdaBdZjPxZ02bIFCGU1yEIqV3H6etOQmLTtjk5+Mczcz1qCF9uX5nVejV6HvJo2a6bFNEMtwNb1j8=@vger.kernel.org, AJvYcCXwAJ1GT6Epx9z8v6G6j2y1QV3rqGXnFI8LJuEYP54U17f4xyaKeZkNTNz0qi2FLXwqmM/Tc1Rf6OH1@vger.kernel.org
X-Gm-Message-State: AOJu0YyivtaGKFMdGnf5gYgs+9K6amjHi1T6D4qgdMalxtqUuaQ0/a4X
	r7LZ3AeFyLg7anyV/cCaXqytQV8goYBeToeA6Ta6vymnESUBQR0B
X-Gm-Gg: ASbGnctAMS0yolLy5tD00a4Ash/b+/B5OMiK/A46W7ts3r5ZPZ9/gZZNyLvEAPBj7hT
	eV9cLi4KfttBAloNTBDb/8nFPTU/M4Q32YJP3TphV3svEl0xR5D/UJVvuvIz72lqSsukmVG1ANt
	dDHrcD755V4iak12ocxleC4CtwYshq+lUVR8WGcjiEG245YonZexrHmf3LxCD5autgH2W//RICi
	/dfr4iIBBIbf7sCR0Wf+tii6zApzHrMr+nks+DiQV3w+eLFEzCVDraD3n1x5JpmGlvlynGoVnq9
	LQN9eNJ53l0f11GYNgyJjabV
X-Google-Smtp-Source: AGHT+IEeqiSR3eoaeBts+pZUrBzG3rB9GucZo3t+CAKJFWav7Spkh2V27cLieEyT7CnGf71nIwGSsw==
X-Received: by 2002:ac2:4c05:0:b0:540:1d37:e6e with SMTP id 2adb3069b0e04-5439c26753fmr12614886e87.33.1738072700632;
        Tue, 28 Jan 2025 05:58:20 -0800 (PST)
Received: from localhost (morra.ispras.ru. [83.149.199.253])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c837993dsm1636624e87.162.2025.01.28.05.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 05:58:20 -0800 (PST)
Date: Tue, 28 Jan 2025 16:58:18 +0300
From: Fedor Pchelkin <boddah8794@gmail.com>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: Saranya Gopal <saranya.gopal@intel.com>, linux-kernel@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Prashant Malani <pmalani@chromium.org>, Jameson Thies <jthies@google.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>, 
	linux-usb@vger.kernel.org, Kenneth Crudup <kenny@panix.com>, 
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 5/5] usb: typec: ucsi: Clear UCSI_CCI_RESET_COMPLETE
 before reset
Message-ID: <coagi34rszmagqfsixava2gkswmdbj5ezfkzbdxoo4yn6nzva3@3bb5a6egkpli>
References: <Z2Cf1AI8CXao5ZAn@cae.in-ulm.de>
 <ie6okmkyqr7qiydcrcepghs6aewgi7stipcydgcpaoedhgp2ef@ye7y43aceofl>
 <Z5FfE7ps0Cc25qIL@cae.in-ulm.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z5FfE7ps0Cc25qIL@cae.in-ulm.de>

On Wed, 22. Jan 22:11, Christian A. Ehrhardt wrote:
> 
> Hi Fedor,
> 
> On Sun, Jan 19, 2025 at 04:23:21PM +0300, Fedor Pchelkin wrote:
> > Christian A. Ehrhardt wrote:
> > > The (compile tested) diff below should fix it and I can turn this
> > > into a proper patch but I lost access to test hardware with UCSI,
> > > thus this would need a "Tested-by:" from someone else before it can
> > > be included. Maybe Saranya can do this?
> > > 
> > >      Best regards   Christian
> > > 
> > > 
> > > commit b44ba223cd840e6dbab6c7f69da6203c7a8ba570
> > > Author: Christian A. Ehrhardt <lk@c--e.de>
> > > Date:   Mon Dec 16 21:52:46 2024 +0100
> > > 
> > >     acpi: typec: ucsi: Introduce a ->poll_cci method
> > 
> > WARNING: CPU: 0 PID: 8 at drivers/usb/typec/ucsi/ucsi.c:1377 ucsi_reset_ppm+0x1af/0x1c0 [typec_ucsi]
> > is triggered on my laptop on roughly every system boot. When it's not,
> > there is a
> >   ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed
> > message observed in the log.
> > 
> > I've tried the above patch "acpi: typec: ucsi: Introduce a ->poll_cci
> > method" but the issue is still triggered [1].
> > 
> > Is there any useful info/logs I can provide you for further
> > investigation of the warning in question?
> > 
> > As the warning is quite reliably triggered on my system, I may help with
> > the testing of other patches.
> 
> Hard to say what might be going on. Some obvious questions to
> narrow it down, though:
> - Is this something new and UCSI worked before or has UCSI been broken
>   with older kernels as well (maybe with different or no error
>   messages).

Thanks for the feedback and sorry for the delay!

Yep, I've eventually checked this: as it stands, there's always been a
"-ETIMEDOUT: PPM init failed" observed on starting ucsi_init_work during
the boot. Back to v5.12 at least - the oldest kernel I've managed to boot
on this laptop.

On the other hand, the WARNING appears only after the commit fa48d7e81624
("usb: typec: ucsi: Do not call ACPI _DSM method for UCSI read operations").

> - If you get the warning but not the "PPM init failed" message,
>   does UCSI actually work? Try to plug something into the USB-C
>   ports and watch out for additional error messages (possibly after
>   a timeout). Do new files/devices show up in sysfs?

Well, it's interesting. When there is a WARNING and no "PPM init failed"
message, it works because ucsi_init() goes on. When there is a "PPM init
failed", UCSI doesn't actually initialize successfully and it doesn't work.

And I probably didn't pay attention to the "PPM init failed" messages
earlier because I'm not an active UCSI user, utilize Type-C port only for
the power supply (this always works and I guess the not working UCSI
doesn't affect this directly). On the opposite, the big WARNING during the
boot now became more visible :)


It appears like PPM is not ready yet for communication during the boot.

Increasing a timeout just to 2x eliminates the errors in my case:

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index fcf499cc9458..b1a4470214b6 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1362,7 +1362,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
                if (ret < 0)
                        goto out;
 
-               tmo = jiffies + msecs_to_jiffies(UCSI_TIMEOUT_MS);
+               tmo = jiffies + msecs_to_jiffies(UCSI_TIMEOUT_MS * 2);
                do {
                        ret = ucsi->ops->read_cci(ucsi, &cci);
                        if (ret < 0)
@@ -1382,7 +1382,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
        if (ret < 0)
                goto out;
 
-       tmo = jiffies + msecs_to_jiffies(UCSI_TIMEOUT_MS);
+       tmo = jiffies + msecs_to_jiffies(UCSI_TIMEOUT_MS * 2);
 
        do {
                if (time_is_before_jiffies(tmo)) {


Turning the laptop several times on and off, I'd say the average time
taken for the initial reset takes around 8000ms:

[    2.568534] ucsi_acpi USBC000:00: enter ucsi_reset_ppm()
[   10.875710] ucsi_acpi USBC000:00: exit ucsi_reset_ppm(), ret 0

I see that UCSI_TIMEOUT_MS is already chosen to be a rather significant
value, much bigger than what the specs say. Maybe ucsi_init_work races
with something? Could this ever happen here? Or just a firmware/hardware
issue...

> - Printing the value of CCI at various stages of the init process
>   might help us to understand what's going on.

During ucsi_reset_ppm() in case of a timeout the reported value of CCI is
always zero and doesn't change on read/poll attempts. In case of the
WARNING it's always read as UCSI_CCI_RESET_COMPLETE thus it WARNs but
ucsi_reset_ppm() returns zero and the further initialization goes on
without any errors.

Is the usage of WARN macros justifiable here if it may potentially be
caused only by the firmware/hardware errors (well, at a quick glance) and
not an issue which can fixed at the kernel level? E.g. the timeout
situation here is not reported by WARN, but by simple printks..

