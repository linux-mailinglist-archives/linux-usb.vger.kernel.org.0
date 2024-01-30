Return-Path: <linux-usb+bounces-5676-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2719842FB4
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 23:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D40621F21B4F
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 22:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9BF78674;
	Tue, 30 Jan 2024 22:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Po/F5nmz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA267BB1E
	for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 22:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706653862; cv=none; b=hiq7R6VoihebiZ2Du3+ey5idb7V/OWPF4LkoWxZW/hTRK2AYEAAdSyFbj/tmk5FMXzXs7TJcg8MyQLThZkfF5nknL8hgJqw8ZcfVSYEI3Hk7hJhojEgKnxGaj/wHE6tdTmerKOyi7CEsY+7QWIC/NwpA9fvYbDuQX7kSCpGsnmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706653862; c=relaxed/simple;
	bh=5HmmswglN9pKy7g/0osHBxBGg837xJKysUQuN28gYCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MALQZzIC9iFRyQ/yxK2hCP+27L8+HALGuUu+TGUFI2lCZwhIOBqR9KKC9/oWf6vUORXedZlF5CtLxP9jHsLz330Vv0b1Lsf/pO63zWiTWDK2X2VNVMckW7SyaU5X+Lop/KL0ru1tVKLf53ciukhWN+Lw4INFFO22Z5L1SciYwcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Po/F5nmz; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5ffb07bed9bso39921757b3.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 14:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706653859; x=1707258659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHsI7G6NUmy3rPPwHz9CEuB456j8VcvU1g80bBBdmy4=;
        b=Po/F5nmzXFvpYSgc3N8xcqQCr64afyVWlKhdEXHpxsEx6HIQadDbOn1QpC/lKAwyIo
         i+B+PcFZJko7gfD94/o6DWj9lDuOYhLpy00jVQ7AXSLBJGA0Ovm+f2FQDq9ro9tVQq6M
         dnW6OEebcGPsKEtVr1m/s3TNZrA5aEGmwCgQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706653859; x=1707258659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHsI7G6NUmy3rPPwHz9CEuB456j8VcvU1g80bBBdmy4=;
        b=RNu2ZxAwAQMKOxwWe0us+q1PLbpfgkEx2aSqxffwEZJWExLWT0rrwEDFWViQ+u5CqR
         BUq8WO/gjawQO2ChrbPTXunWyGiz1AAgp1HZcDbltzj5RnApQcxYGYLVlSPyrSVEifo4
         cvvGXvGBzBan5gmrg6EwEQtaWGFxIDuAw+/jEUEoLWyr+23mmTu+O2Nc3anyYjIfdQoZ
         qBds7oOLVBB4rq+qqCNFRVi5p8rDC9He6/yijeo8uzhH3TYmQmyMp//tz+llq3kJFe0o
         gw01mBAoUip08nt5PSOI7BGMfT2rabZoC8fsoDsr4+Pw7nmtab9OQM1WWq0bP+v3u5tY
         YiIg==
X-Gm-Message-State: AOJu0Yw4Al+nZdNaxvvA5DR34Q6tz0SkuUorifUNiDp2dqxPuzvjnFqN
	qaN299nAqf5ziMrMFqHpSl6RSp3LXb+kCHLsSmkpCz7ToKveJGLWsD5SnNBRO/FQEo2zoiep+eK
	ce6424opxQXaGgCybkqL0vvlNjYS/JciYIGI6
X-Google-Smtp-Source: AGHT+IHMScdK7mGPuwHixhxjRCDpmBCo5GXuOWgJu/vIpXO032ijbHWpSLsxWPzpaIR1UM/1sJfFdkxClOeiOaSYPlM=
X-Received: by 2002:a81:eb0e:0:b0:5ff:6084:421e with SMTP id
 n14-20020a81eb0e000000b005ff6084421emr6945261ywm.32.1706653858789; Tue, 30
 Jan 2024 14:30:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126183930.1170845-1-abhishekpandit@chromium.org> <8cf38c26-c8ec-401e-8aab-527ef811af90@amd.com>
In-Reply-To: <8cf38c26-c8ec-401e-8aab-527ef811af90@amd.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Tue, 30 Jan 2024 14:30:47 -0800
Message-ID: <CANFp7mV-DiHq_aZZNF0E4e=-aQUupxg+ECwj5dsaG-n4epa4CA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] usb: typec: ucsi: Adding support for UCSI 3.0
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, jthies@google.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Prashanth K <quic_prashk@quicinc.com>, 
	Rajaram Regupathy <rajaram.regupathy@intel.com>, Saranya Gopal <saranya.gopal@intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 28, 2024 at 8:06=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 1/26/2024 12:39, Abhishek Pandit-Subedi wrote:
> >
> > Hi Heikki,
> >
> > This series starts the work adding UCSI 3.0 support to the UCSI driver.
> >
> > There's a couple of pieces to start here:
> > * Add version checks and limit read size on 1.2.
> > * Update Connector Status and Connector Capability structures.
> > * Expose Partner PD revision from Capability data.
> >
> > These were tested against on a 6.6 kernel running a usermode PPM agains=
t
> > a Realtek Evaluation board.
> >
> > One additional note: there are a lot more unaligned fields in UCSI now
> > and the struct definitions are getting a bit out of hand. We can discus=
s
> > alternate mechanisms for defining these structs in the patch that
> > changes these structures.
>
> On the Windows side I notice that Microsoft explicitly checks the UCSI
> version to decide what data structures to use.
>
> https://learn.microsoft.com/en-us/windows-hardware/drivers/usbcon/ucsi#uc=
m-ucsi-acpi-device-for-ucsi-20-and-greater
>
> Perhaps doing something similar makes sense in Linux?

That probably belongs in `ucsi_acpi` and would be good to add there. I
don't have a Windows device reporting a UCSI version 2.0 but wanting
1.2 so I can't add or test this patch.

>
> >
> > Thanks,
> > Abhishek
> >
> > Changes in v3:
> >    - Change include to asm/unaligned.h and reorder include.
> >
> > Changes in v2:
> >    - Changed log message to DEBUG
> >    - Formatting changes and update macro to use brackets.
> >    - Fix incorrect guard condition when checking connector capability.
> >
> > Abhishek Pandit-Subedi (3):
> >    usb: typec: ucsi: Limit read size on v1.2
> >    usb: typec: ucsi: Update connector cap and status
> >    usb: typec: ucsi: Get PD revision for partner
> >
> >   drivers/usb/typec/ucsi/ucsi.c | 49 +++++++++++++++++++++++++--
> >   drivers/usb/typec/ucsi/ucsi.h | 64 ++++++++++++++++++++++++++++++++--=
-
> >   2 files changed, 107 insertions(+), 6 deletions(-)
> >
>

