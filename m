Return-Path: <linux-usb+bounces-6414-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A84068551D8
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 19:14:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BC021F28B34
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 18:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC7112C557;
	Wed, 14 Feb 2024 18:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PSU0UOPZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B7E1272CA
	for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 18:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707934328; cv=none; b=akROm7uUHW3UuC5oi8Bpo/95PlQp18EfERern41ELJ98FJbzk2V1K6Tk6g4Cp76KLhq1Q6iVu+YUTsKw575IUkRYC3mV9/x/eZIqZ60XkiN+mZ4I3OZMmAX7MqepgmKgyXbnof2tMkIc7sw3NjBdLH5B2Pt9/Hhk11mYmzwTKmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707934328; c=relaxed/simple;
	bh=OE9ONYhRtt1RT9UxYhOGWQZAzy9csxc4vRQdMTFcZmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NcmzVkxnnaAC3bCIWq9SAKn1CF9Bs2q/dUc4E8nJUBTevOYuEx0TAcLhrIDVCn1MBtW5astPp/18iAGEb0U8++wDaIv/yO1CBO+MxUrvmSv4FBl4V/3RyrgiMvaEVxVt7qQXG3odeQC2um/FJzRZ7rN1UqTi/9AdheLiHbFi130=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PSU0UOPZ; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-68d0bcb4a46so387766d6.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 10:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707934325; x=1708539125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OE9ONYhRtt1RT9UxYhOGWQZAzy9csxc4vRQdMTFcZmE=;
        b=PSU0UOPZ9NlWZVaWaV04SwNGPWr91c8VwQpPIbQYsFzhvQSd0XngDiCSSn54Ab1LU2
         36U06+osPCMF799tHgtOPeHi9Jus2qgofT2kNlGvWu5i0iFGT8o0Yk8p/pmBhRD0dahw
         vEmPwKcgBj5fHXRxX9KCnCMdnukJKllrnemoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707934325; x=1708539125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OE9ONYhRtt1RT9UxYhOGWQZAzy9csxc4vRQdMTFcZmE=;
        b=mS8ZuzRl6T8IWwnKo9B/vlO0XC5OqqpxTDNR9A9IlWsxZUj4g51A0f24ZjI1+qo5He
         /idKvvgz68P//eDQhGieeGWvu/udTmAkzKbGhXJr7miOsn8aZsKG3nnRF/56DMziptOB
         vd/0Jz0idZqTwGieOYps6pcivFKn1mpZe1Dj5JNrt+AN7PUAnlzqol/VRUHrvrTTgYXh
         8KpRe0hGdj0dQauVH4mjXnZY0iXhOuKJNXRCMPmNOyg0DIePKjQA+zf1EffSaX4MtnLu
         K4ayO/kIdeYqUBsKzhAW1ReiMfUCuE+kJ8zK1fpoEobnPm9Z+nWF2LJ3Ib9BwTfB7y93
         wZ6w==
X-Forwarded-Encrypted: i=1; AJvYcCWahkVK+Sx9UueF8W6LZwPQJR8fDuEVRvtH79jL2N/w1VwtKoeEhZNUC1iMO3PrI7Yvyd9or8G/c6VW8c9gEBuw6M3+iB8Oty6T
X-Gm-Message-State: AOJu0YyXhSeZm+VrlC2Rl24AkOVGr/ZOCDBPT7pGT1VxzmcYuiwUrB+b
	CwIeSo0GX3gimWzfFERixW4wb9T6nV7JlWx8ooNVUdAw1ZMASi1J9pcMRJEo/klZl+3/Bb20+I1
	t12BZI0oqhCoa4XvVCbEPnOQfJUcPvmuBX22U
X-Google-Smtp-Source: AGHT+IEgrWvxXcraQzc1baiUPwiEzauqEskx3AucYV5QX8er4b9bpYzTMRyz2B2QxRzh4QRdmPCoEcLyLXCe6Vd4YFM=
X-Received: by 2002:a05:6214:e82:b0:68c:da0a:10ef with SMTP id
 hf2-20020a0562140e8200b0068cda0a10efmr4022290qvb.57.1707934325206; Wed, 14
 Feb 2024 10:12:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213130018.3029991-1-heikki.krogerus@linux.intel.com>
 <20240213130018.3029991-3-heikki.krogerus@linux.intel.com>
 <CACeCKadLKg89c8s68QD6VsqiKBMms6765O7mFFihqtET30pUyQ@mail.gmail.com>
 <ZcyUblecufzeso17@kuha.fi.intel.com> <CAAuZZi9h=d2_CM4tU4-H9wJfhLZbw99X2dGSddiCeDFDdb+kjw@mail.gmail.com>
 <ZcyrCosNDXxGZh9O@kuha.fi.intel.com>
In-Reply-To: <ZcyrCosNDXxGZh9O@kuha.fi.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 14 Feb 2024 10:11:53 -0800
Message-ID: <CACeCKacOFLKGCBTuFTVj+=W9C+rC++7DfzkG=M23i0Qh4qTOxA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/chrome: cros_ec_typec: Make sure the USB
 role switch has PLD
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Emilie Roberts <hadrosaur@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, "Nyman, Mathias" <mathias.nyman@intel.com>, 
	"Regupathy, Rajaram" <rajaram.regupathy@intel.com>, 
	"Radjacoumar, Shyam Sundar" <ssradjacoumar@google.com>, Samuel Jacob <samjaco@google.com>, 
	Uday Bhat <uday.m.bhat@intel.com>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heikki,

On Wed, Feb 14, 2024 at 3:59=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Emilie,
>
> On Wed, Feb 14, 2024 at 12:04:22PM +0100, Emilie Roberts wrote:
> > My understanding is that this is related to the wiring spec and not
> > ChromeOS specific. It seems possible that OEMs making non-ChromeOS devi=
ces
> > may have this same issue. Or are we certain that only Chromebooks will =
ever
> > see this?
>
> Non-ChromeOS platforms do not have this issue.
>
> The issue is with the ACPI tables - the USB role switch ACPI device
> nodes don't have the _PLD object on these systems. Ideally this could
> be fixed there by simply adding the _PLD to those ACPI device objects,
> but I understood that that is not an option.
>
> But maybe I misunderstood... Can the ACPI tables on these platforms
> still be updated?

Since it's just a _PLD update to, it should be possible to do a "light" fir=
mware
update on the relevant boards. Shyam/Emilie/Won, how practical is this?

I'd much prefer this to be fixed properly in the ACPI table than relying
on this quirk.

IAC, if we absolutely *have* to use this quirk:
Acked-by: Prashant Malani <pmalani@chromium.org>

Thanks,

