Return-Path: <linux-usb+bounces-5972-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4885784BCA6
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 19:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFF48B22FDA
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 18:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DC0134BC;
	Tue,  6 Feb 2024 18:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ix20IlZA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73242DF42
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 18:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707242690; cv=none; b=Xni6fmdxQtFtCOyPGdyifBm/LSNeUO74CCxI0+eXWFh3PMUw7+NXJyvRuHpwF4UMDPgf55qsDsXTAUXO7vixJPG3pJAcA0LAvRMzAn0Icsa/J4xFyBEQSG+usJxTTt3LFMe/3gT6F+bT3sRmhQbs1JthjQydF8vpOIY6ev1tX68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707242690; c=relaxed/simple;
	bh=LHhTCuH4A/0wFtRKTVPMRZgG2il7EIGIfjfqz07u/cI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l5OLY3+pjZF8Iys4hAUNA5n3/3FS9/DSTuqQkQywWk7mlg1PAUhFNSxVI9Dk5E9CHDDobbdPsNcH1dIpOt/lxNrJ7iPUKWThoulmGiQRj2UO2r1vPsRFWpLMR9IVKmlCFDcSczLolCJ1otJD28V51Ls/wDc2FL+OPJpMoAvROyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ix20IlZA; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-68c444f9272so26981756d6.3
        for <linux-usb@vger.kernel.org>; Tue, 06 Feb 2024 10:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707242686; x=1707847486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHhTCuH4A/0wFtRKTVPMRZgG2il7EIGIfjfqz07u/cI=;
        b=ix20IlZA8Du6dARbz/uQ9oJv3f5fy10dOqo7uaLtVIGyXq9jtNgYd+jWgCN+/Ab0Wx
         C/I1U1FCK3DVSPMCHcvCEDzWKLTBe3lVpznbY7PH3fzoQn0cy43hbwSG2ZHe887+UbN2
         bP5brBgWGMhLLIJVT9izhI9W/yevQzh5Jn8jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707242686; x=1707847486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHhTCuH4A/0wFtRKTVPMRZgG2il7EIGIfjfqz07u/cI=;
        b=VTkvfo6eEDr+CdqFyVo2XbcKVKxVS+ecYhuACiFylz9qiP0GrYbF7Xxa5k2mRMvQ5X
         0oT/xWLSbgPTsESHuS6rXmSW1eRdl0egU6c2z0QFvE1pyZ5d9poKG3+k/Uj/4zMBYOMM
         uqbWz8ZfdOrxxmoY+Fm5jZD97f3cROp16X1N7r87Ayh9EfgOeTHc8g3GrrZBuBIMX9zx
         RYg+tdka4L6EldGm2VlRY7JZjwgbL9ufaRrFfTI4ELk6ZjV3pBTlcBd4G9Aphb+FiTM0
         aUI+jd43YBCcaMthUlE6TzIoNJbVa27k5ThcUTdiUgRjeaA5SXSImP+ITCMxrtPLAGdB
         fPAQ==
X-Gm-Message-State: AOJu0YxWfPj7o2Cg9IUSh0GJO0EHvT/QNItdLDbkvh+Js8eiiLB2V6HQ
	Q5zRPWdG+53Y7mE2oleBf3k6ltLDqgKDq18dp1dXnIHK70DiSsXGS1MXsGYq6M3hhRprRcX0Rxr
	QnCqgP7kw0gtDgc1yM6wjKvnk+SM0MvYMn6m7
X-Google-Smtp-Source: AGHT+IFUlTRnDijctSI2MtUfRs5X3q8MZ8/UBu5rOlOOICbk1W0bwDf8CTes6qhfmyTO+dacWNRZQ4t7SBk3NvQeld8=
X-Received: by 2002:ad4:4ee1:0:b0:68c:8d67:fce0 with SMTP id
 dv1-20020ad44ee1000000b0068c8d67fce0mr2870871qvb.26.1707242686276; Tue, 06
 Feb 2024 10:04:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126183930.1170845-1-abhishekpandit@chromium.org>
 <20240126103859.v3.3.Idf7d373c3cbb54058403cb951d644f1f09973d15@changeid>
 <CACeCKaeVtU3ckmGU932d-pPn=eOnt6KjAavNY3rSOUgrJNriDg@mail.gmail.com>
 <CANFp7mXOXc6TzLJ+EJ9VYxqGHcjW099oBhDctarUdM5eJGz5bg@mail.gmail.com> <ZcIHePkgN2in5AAX@kuha.fi.intel.com>
In-Reply-To: <ZcIHePkgN2in5AAX@kuha.fi.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 6 Feb 2024 10:04:34 -0800
Message-ID: <CACeCKad_ODKKa1QY2O=VOdYZ0MHOrLH5aOte_bPaY-10aRh1YA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] usb: typec: ucsi: Get PD revision for partner
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, linux-usb@vger.kernel.org, 
	jthies@google.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rajaram Regupathy <rajaram.regupathy@intel.com>, 
	Saranya Gopal <saranya.gopal@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 2:18=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Abhishek,
>
> On Mon, Feb 05, 2024 at 02:05:38PM -0800, Abhishek Pandit-Subedi wrote:
> > Hi Heikki,
> >
> > Friendly ping to review this patch (I see you added Reviewed-by to the
> > other two in this series).
>
> I think Prashant said that he prefers macros with those version checks,
> and I kinda agree. But I'll leave this to you to decide. I think
> that's also something that can be improved later.

Yeah, the macro strikes me as unnecessary here. Anyhow, for the rest of it:

Reviewed-by: Prashant Malani <pmalani@chromium.org>

