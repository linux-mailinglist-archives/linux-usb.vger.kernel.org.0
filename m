Return-Path: <linux-usb+bounces-18909-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 090159FEF5F
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 13:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DBDE7A1618
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 12:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9D4199E8D;
	Tue, 31 Dec 2024 12:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ty+c4lPS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE6A1925AC
	for <linux-usb@vger.kernel.org>; Tue, 31 Dec 2024 12:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735649591; cv=none; b=WqnczyN10mv4LvCXml83EWUcitawGBPuVLMuxn+dajm9wXUKTY9Xp27nyA0kS0d/Miw1Rp5Y5itt03eo4Kj8Eu3+z98M6DphLlk66f5oQhwOY9S/GEPkVKY+LPRwArhcVXEKLYyqqDExV5ab5zRJLejQkgBkgJGyYDzgUMPt1Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735649591; c=relaxed/simple;
	bh=mHgMfzIy6Z8Ln5l7csbV5A8Il3cuympWdAIQVuINgJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYkzuCtajkuI+9g2vPthOIyLTrxINKax+88y4FdEMc1cGWEUwRstwKBBcBVoifDuv4Oj2JpiCTqyyZszqX+rymUyK24Okxqg0NzS0VL2RXc1EAbHHAqZhEqZn7MNJN6wgHzWkm4rbYSUglaCxdNoaMlf+vl+cSCPa+ySI6NdJjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ty+c4lPS; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso128689251fa.1
        for <linux-usb@vger.kernel.org>; Tue, 31 Dec 2024 04:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735649586; x=1736254386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UY6vVA4LyUqtSVdwehSSHUM9l1vc+Xv02RXTSBH2nIE=;
        b=Ty+c4lPSrdK8lYg5bn6fe0GTVf78CLyx328heAE79yrAbRSgDt/Sq+nMWkFr261WWT
         j1C9sNDYYrmNAcIWbJlSCStp604Gf2Uefc2XFU5S8lf4ahGAMWFbmwsqcYECnO2q5TvP
         2Lzu31lFK0EMRO/9FsD6Yxqm0KgyyZwll70QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735649586; x=1736254386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UY6vVA4LyUqtSVdwehSSHUM9l1vc+Xv02RXTSBH2nIE=;
        b=BuNuCKbLZMMbw08XaSunuuEJr6kD/AXY+KcD8NR5RAIKC13sE55BQY9P0GB1u7PHIH
         XX0sU1EESY1isLYzHfy4J6GrCflQZT1LPtg7WFCOV7U9Hk4Ak9oB/jGMXsqYoOZZlIZL
         8Iks8o+IE3LBjsSRkQrJWIFyKIvY6KPUdacQtDPTAgc4FhSx7QnCGGL1nGFW/m6TL3Ss
         AQvuGCjraCFbVQV/c3K3OxXZmF/9ec91P7JpmHZkWYzjeRYZ/dPfc5TGoWcBbtWCf6po
         DXICq/4L/1+aANnDHtJVxNvMT/RnHFK7CuYEcTy2ly0tabkGx87/kAHDJwKoVXzERYcL
         6CUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbktTS2DfyFDw6ffZSvK99wMPJGmpQUJaweLnlx0yBajoEcuU2h647Dtx+B68NjdjqPBI7tcKQ0TE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMCdTFIvj+Y4G+7LxKDnAZivXmcrWFfLlIBWQc76o87QgAvNiN
	QORo4gidzfEqJEqvGoqZTlD65RS8DqNXUvbZkl4KhG+CzOIWdMGKGMW8gWgKRg6xMTFJhR20/Hy
	GBIpFvhRJUr9AodfYv4IhbBQj1HkO7F2176M=
X-Gm-Gg: ASbGncs7fdg9Tbw63jPnRONnLotH3NgN+iB2BqgUwTCvoilk/yj98NHA4JIwkTEzgh6
	V4ijQ5mFadezc5O4LIn35ZAzl1Q6Ghrd93EI63UTFuSx/+ECWHG54xIJNm8o3LZBv
X-Google-Smtp-Source: AGHT+IHiwVcJE1fyzGyiAhI/TbDO2ITJnQrx87hjj+3eBLt7Okgpz0KALafRb0edl/pzyfeIvWCljmtHVBDAM66EcAg=
X-Received: by 2002:a2e:bc2a:0:b0:302:40ec:a1b9 with SMTP id
 38308e7fff4ca-30468548c00mr109866921fa.5.1735649586212; Tue, 31 Dec 2024
 04:53:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210144527.1657888-1-ukaszb@chromium.org> <20241210144527.1657888-3-ukaszb@chromium.org>
 <2024122433-aids-varnish-8a5b@gregkh>
In-Reply-To: <2024122433-aids-varnish-8a5b@gregkh>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Tue, 31 Dec 2024 13:52:55 +0100
Message-ID: <CALwA+Nb8U9Ff-BaDqonNNvv6U7t=+-mvqP+VAixQWpRsEAWERQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 24, 2024 at 7:57=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Dec 10, 2024 at 02:45:27PM +0000, =C5=81ukasz Bartosik wrote:
> > From: Pavan Holla <pholla@chromium.org>
> >
> > Implementation of a UCSI transport driver for ChromeOS.
> > This driver will be loaded if the ChromeOS EC implements a PPM.
> >
> > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  MAINTAINERS                           |   7 +
> >  drivers/usb/typec/ucsi/Kconfig        |  13 +
> >  drivers/usb/typec/ucsi/Makefile       |   1 +
> >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 337 ++++++++++++++++++++++++++
>
> Given all of the 0-day reports I now have in my inbox for this driver,
> I'm going to drop this series from my tree.  Chromium developers, please
> do better testing, these are simple build issues that you all should
> have caught way before version 11 of the driver :(
>

Hi Greg,

This is indeed lame on my side. But on the other hand it is a good
lesson learned that sticking
to one config/compiler as a verification method of patches is not
enough. I was surprised when I verified
why I missed this failure because it turned out in my environment
clang didn't even posted a warning for the issue
  CALL    /mnt/host/source/src/third_party/kernel/upstream/scripts/checksys=
calls.sh
  CC [M]  drivers/usb/typec/ucsi/cros_ec_ucsi.o
  MODPOST Module.symvers

Anyway I have prepared patchset v12 with the fix and verified that all
the failures reported by the 0-Day CI passed:
https://lore.kernel.org/linux-usb/202412240743.tzTftk4H-lkp@intel.com/
https://lore.kernel.org/linux-usb/202412240903.xAqTOQpa-lkp@intel.com/
https://lore.kernel.org/linux-usb/202412241137.ld79A9Iq-lkp@intel.com/

Sorry for the inconvenience.

Thanks,
Lukasz

> thanks,
>
> greg k-h

