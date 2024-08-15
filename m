Return-Path: <linux-usb+bounces-13519-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C709953671
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 17:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B1F5B24E35
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 15:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294B91A4F22;
	Thu, 15 Aug 2024 14:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V4iI9vpg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1311A00CF
	for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2024 14:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723733992; cv=none; b=DKIaMTFZRl08XErNw9907C3z2ll4dtDjvQd/xhDyOdkUuY+Sn95xC/3xx7dmFNdcynq0cMsO/H9EwCl0PxPyPbaZeE5x5564PzGEQwD+w+13HDrDkpqBK37bAmoP1Nzm5Kq6pn9YuDVU4JQJD7aKrQLPkDv6eOyqlJ9O5qKuhYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723733992; c=relaxed/simple;
	bh=dJsfiu1qRep/HH1UDakRRZfQDl5G8EGy1STI15+AATE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j45UZvFKTsBEXIiDS9Kn0l334++W8T+F/egMO2X1xEVNf0/BBBHIFnngbxq+3EBdxXjML/EMrHBOLWX408Mp1t6AM5JUWkFKB1tX2BTOd9QnqJ2Y4Q5v+iTzoEWfXK/clKv1hiV43tvagmgdcsyZ5kQcYLgSrNiXJityYkyfoNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V4iI9vpg; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5a156557029so1257153a12.2
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2024 07:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723733989; x=1724338789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0L4FRMkSLz2Y/uXhLcMkWpzajvtCHbG8LKAOZhe04WU=;
        b=V4iI9vpgbJBZYnsNkb/0tH78b9FK9wdThR2A8mHohE+KqGCy4wGzI0z/pqFoCI8l3e
         QGRZXJcNGn8Sfv7DAcrLiclKqDDeX3EUuz4U67tjKNL6SKKEMA+cxvvZ5fMgbtDgNCO0
         HfCGSFJk8V5Fz0O/I825iV5KPY/SvrwKwBFUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723733989; x=1724338789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0L4FRMkSLz2Y/uXhLcMkWpzajvtCHbG8LKAOZhe04WU=;
        b=BDHVTTh0MR0+NpwXF+Tlxyadd8QEl/NYfjfbzXV49T6lJkN92qUvjPa66BuGtv5jd4
         zJR5dV1/lDv+KFMKhFiNWxBZN7QhoCXTJPR7RP0s3sGgpf1NweZcpOY5plrQpbMUqgA2
         0hBP7YU/5abqcflPcliRfjxqQ5m+tuMzy+LA6WHamMkouXTkqh7HIVhY/N5b5sZRWY8t
         T+fCVqlJ+5Phfx80zzQET3QiFVZmOqfwER9wpqds81B57+4pRMANp7NHtFAeqKJYcmr7
         gVA3komNGeJ4XsztGQbVEZfWXGDARndCEvYSOIvubYCk7dKnoOpCwr7J4lo14FjHHJ8w
         hm3g==
X-Forwarded-Encrypted: i=1; AJvYcCX1fBU+lLkBRpAKYJM6CFoa+XQdX1RD+dqRzEFOann3TY/k9XWnp63nhlX78zwdFYVBwMekhKwqfnvV/y2H0+wfBZxkTZVia2x5
X-Gm-Message-State: AOJu0Yw5WYVKU9w/5JpcFm9v5TwPOyZk6qiH1B/4WoMyL98UapxfG76B
	mVmdiy4qG58yPnDIJX4wRIFND/YCZOWx1jSVhUCNMp4j/auUkgNcIXROH1kpFtz+o8l8fp5Ipah
	f7qo5R/ihjuX0Fk/df/j9zIIxmSSZ+bTLQh9/
X-Google-Smtp-Source: AGHT+IGXmv1EnuZXW51eluTITncAt1f4tGqnLgkykGkBsUpUlM6rGEmp374HumYd4G9I5dExVmlFSuxEmOpxRHvcE2U=
X-Received: by 2002:a05:6402:2102:b0:5aa:2a06:d325 with SMTP id
 4fb4d7f45d1cf-5bea1c69bc9mr4565320a12.7.1723733988765; Thu, 15 Aug 2024
 07:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815085726.2865482-1-heikki.krogerus@linux.intel.com> <Zr4V13mBemOZz2rU@kuha.fi.intel.com>
In-Reply-To: <Zr4V13mBemOZz2rU@kuha.fi.intel.com>
From: Benson Leung <bleung@chromium.org>
Date: Thu, 15 Aug 2024 07:59:31 -0700
Message-ID: <CANLzEktGqa4SNkG=ZJHHaeQLH54wvJm0OAKaECmBE658+p19Vg@mail.gmail.com>
Subject: Re: [PATCH 0/5] usb: typec: ucsi: Minor improvements
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jameson Thies <jthies@google.com>, 
	Prashant Malani <pmalani@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-usb@vger.kernel.org, Abhishek Pandit-Subedi <abhishekpandit@google.com>, 
	Bartosz Szpila <bszpila@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heikki,


On Thu, Aug 15, 2024 at 7:51=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Thu, Aug 15, 2024 at 11:57:21AM +0300, Heikki Krogerus wrote:
> > Hi,
> >
> > The two first patches prevent potential issues. The rest are just
> > cleanups - removing duplicated or otherwise useless code.
> >
> > James, can you test these? I'm changing the handling of the identity
> > discovery in patch 3/5. It would be great if you (or somebody else)
> > could confirm that it continues to work as expected.
> >
> > thanks,
> >
> > Heikki Krogerus (5):
> >   usb: typec: ucsi: Don't truncate the reads
> >   usb: typec: ucsi: Only assign the identity structure if the PPM
> >     supports it
> >   usb: typec: ucsi: Common function for the GET_PD_MESSAGE command
> >   usb: typec: ucsi: Call CANCEL from single location
> >   usb: typec: ucsi: Remove useless error check from ucsi_read_error()
> >
> >  drivers/usb/typec/ucsi/ucsi.c | 126 ++++++++++------------------------
> >  drivers/usb/typec/ucsi/ucsi.h |  14 +---
> >  2 files changed, 39 insertions(+), 101 deletions(-)
>
> These are in wrong order. They break bisectability. I'll prepare v2.

Can you please cc +Abhishek Pandit-Subedi <abhishekpandit@google.com>
and +Bartosz Szpila  <bszpila@google.com> on v2?

They're also working on UCSI and can help too.

Thanks,
Benson


--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

