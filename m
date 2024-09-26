Return-Path: <linux-usb+bounces-15500-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A8B987372
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2024 14:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31E8B1C22EEB
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2024 12:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398671779BC;
	Thu, 26 Sep 2024 12:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JOjTuC4P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3450215B12B
	for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2024 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727353231; cv=none; b=p0g+RGtShvwIz3/xEWa6+RvyMjhpUGEcJNoujzI2vg9/+acTBLfVNbISwo21xXNluF46MS0boM+7j28hUL3bBKfvoIt+/AEBPnINkQk4gMcPi4ysHbrsQRFkpMGBnVT3HJ3tDhzgiX4bJDffL4MYugmP3iOW3meL1DtyoUrXJk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727353231; c=relaxed/simple;
	bh=vOTpzB5vd/CwIsuye/jBaiRBDbMI1JUdjxFFIctmwEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MV+FDqIVJl/51XeqXTsm1IL8ts4CsRIbASgOMSw4jmgFqedfVvbAxEaa74u6Cvk/MMqW8nyULiv3Td6HtZcS5Wm7RiRSoiphe4HRcpQyApMESI0hLyDl1ad3uemS6xfMEimhsBW5tTZ50/G7KTLFyxHktEE4Z+q2wwd7U6gfdvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JOjTuC4P; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e25cc9c93a9so724852276.2
        for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2024 05:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727353229; x=1727958029; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/chIijZxfaJZTmXeHsE7W1Ywlan6j7i6j6yboptQjwE=;
        b=JOjTuC4Pg3j/gHHx9Uy+VfdebUOaxqcoEbibnDgwFfk9/CpyX6esgGmH9oHWNriWwZ
         tpYwRVh+cYtx2TxWAEoZBuHlgurVXYQ0HlAq4VhmWRqX1VYj/aqJc40inEZ8SAG5bh2e
         sCZT+gmzPRTfee6eXi2UwDxZpjR+V5SBJXPOdWwqSadizel+jfiPCzgpZGrjB6TmRiGo
         h7C3KicEWiDV4NQWpqBnGU1POP07aw5T+J7sBu47ZTMsLSkZZPvH0bXsSHUjh2cSGgqL
         XCbQ2+brdwq9U66sbzQIF9Gk6kQskpCsfxScVeGw80LPW9oV8JNNK04ZUm+G9pXlTnUA
         pMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727353229; x=1727958029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/chIijZxfaJZTmXeHsE7W1Ywlan6j7i6j6yboptQjwE=;
        b=a2h4uN2cVTW0efU0wtSwAaWK1TBqBXyY4Q2OCYnyjdfQWa67/BMy3cV5BB9sGC6PWZ
         XCamqGpPLrJMp8SBYD1vD4ZeSryyDEzUpHaGDuh6QWdusxITKMEDdrXs2PLrPnlt75lS
         Mhq0Rz58WdPTi4ZHTjkHfoRxJ2cBIuZ+RYFETIMTRs76VBpYCKqZoamehX7k88PPWgnn
         2ZNcZlPxpS9AAnLJwI4gm8HGCoiMY7KdE2RRy8Qy5ZuHkPHseIRE1bs3SBw3/wsC5CTh
         c2gUz4nF1JG6+0ICRxqDpa1yq55xiAKndFBIICbQ0MZrl3OesyYAsOnHVQOEbSez76yl
         bvzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBz3NDY5Fog09LHivWSavYB/i1P4+pkrz86MmfhURvwCKJ4lxbluL8VIN89MrCKo04ppLaFQMP6q4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5hEnH57R21/K3Kr7LUxso2lILfbhMBQI7v6siJoyMNYfZNMjE
	nmvX5pXHic7jc7RZ9BCqYt//GqWxujs9XLrq0vkIK5TdBoCO452pPeYuhBjG6jjNBpkQgu/ZEZc
	1tHPsaI1BZ+4yrx6TVxHxOxYr6hI8/wjp1Z37lQ==
X-Google-Smtp-Source: AGHT+IFYe6avJXcb20Z3oY/wCbFOgqRRn6CzbS+mU2MwuBkHglhoEJHCWq1HMAvQiZOvmabxdtU+nRUUoxytEl305oc=
X-Received: by 2002:a05:690c:5c03:b0:6b5:5042:2c9d with SMTP id
 00721157ae682-6e21d848317mr47670397b3.24.1727353229221; Thu, 26 Sep 2024
 05:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b890361e-e99b-43da-8571-7478b5eab475@web.de> <jjsbnitbajdw7dc4plkbb55ezl2cdbnrfws7hnoigbzasvdzua@puhrwwlu4lvv>
 <ZvVPlInCFajkeFy9@smile.fi.intel.com>
In-Reply-To: <ZvVPlInCFajkeFy9@smile.fi.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Sep 2024 14:20:19 +0200
Message-ID: <CAA8EJpo0Q0Wn-GzqmPeNFfG_Hr-o8E7F_VuO47EbxKx=0OQhyQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] usb: typec: ucsi: ccg: Adjustments for common code in
 two functions
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-usb@vger.kernel.org, 
	Ajay Gupta <ajayg@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Haotien Hsu <haotienh@nvidia.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Utkarsh Patel <utkarsh.h.patel@intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Wolfram Sang <wsa@the-dreams.de>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Sept 2024 at 14:12, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Sep 26, 2024 at 12:26:24AM +0300, Dmitry Baryshkov wrote:
> > On Wed, Sep 25, 2024 at 07:31:04PM GMT, Markus Elfring wrote:
> > > From: Markus Elfring <elfring@users.sourceforge.net>
> > > Date: Wed, 25 Sep 2024 19:19:01 +0200
> > >
> > > A few update suggestions were taken into account
> > > from static source code analysis.
> > >
> > > Markus Elfring (2):
> > >   Use common code in ccg_write()
> > >   Use common code in ccg_read()
> > >
> > >  drivers/usb/typec/ucsi/ucsi_ccg.c | 15 ++++++++-------
> > >  1 file changed, 8 insertions(+), 7 deletions(-)
> >
> > For the series:
> >
> > Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> I believe there is no-one to take it,

I guessed so.

> but in any case the thing is that kfree()
> probably can be done using __free(). Then PM runtime handled differently.

That's a separate cleanup in my opinion.

-- 
With best wishes
Dmitry

