Return-Path: <linux-usb+bounces-9061-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0801389C015
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 15:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DF3D1F24B13
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 13:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9E07D09D;
	Mon,  8 Apr 2024 13:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V6V/JtZx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3768C7D07C
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 13:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712581479; cv=none; b=sGHoFiTVOvrt3VGxXYjddCjKKYwqn2vYLxVGzM4N0wHLrP5h+EN/p0CPSvgbOQOV8khso2liud0aHKEdP+GnpoatXi/Cdz10kr5/93xOqLr82wdbjYEjInvrdUZsPaiuXmZkVsGN+NOxqaCeH4rn0znHR7KjksDIDItXV4MPGQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712581479; c=relaxed/simple;
	bh=7bpRSGGPDQCS7wFqBB78vDQoO6pcgett9EASBZ5btWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kreP4RidDVCafM9ON+lTX0bKbHmRKGg4K8B/LbDCemu8J0gEf9f2nJbDR/Hqj0Z9R0dnNY7Gw8p6HzMqH6LIfxejjfl0HHYIj9wA14KIsswvcqvKSvebWSEde1E7uuviajZi1plsS2CSz0AbviVlJOvLg2uojKVGmYlxrb0x1mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V6V/JtZx; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-43477091797so344171cf.1
        for <linux-usb@vger.kernel.org>; Mon, 08 Apr 2024 06:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712581477; x=1713186277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVioy9EMNQnc5SXcQapeY7Z9K+iAa8Z5L7a/jg+l4cY=;
        b=V6V/JtZxF+/LndpdhRmbOuo/U1EUSxttljOGzrE+EYarMRJhqEEIgiDu4CsM1Rtzgc
         Bn4ku4kJdDrpz3KiK4Ie+zt0mKIB/PTxj5/LDT9Ijr4jydu/cCGGmGNhnaAEtyqn3Jqx
         OAsgszri7Xgg4E4q5vSKJ9TK8odjahLuUIrdoUIicGTlf2snFgCpWJEfYItZSkk8JmhW
         hb72eE2ANh9jW4ca6uH5jCx20bmxaOPzi2kTZcLWCovCiW0lri6J0lOWG46jNZTnsU+a
         /TakSItP2mKngyv4cbTTctHtPLKHRhaE5+J++vrA6fe4dtZ76iWAL2f/rtjUOOJGTvJJ
         Z67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712581477; x=1713186277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVioy9EMNQnc5SXcQapeY7Z9K+iAa8Z5L7a/jg+l4cY=;
        b=DY5p0QulYULwwdR8YYxvcYbdwSgAnYUcEW8wfB1eDGuRellbQEWSLD4A8L2Yq9PlnL
         dynUBqjdMM0IwWPUt6c3kg0+oifwzVvZ2aB+aPTirdwFYxZfj7EsZ2bHxehuZB2RJoEW
         b9aQD1mAGoZGL3iT8ZkXEtI8i5bARGCzK/HMWlqQXD9Sgf4z0bkkj5+XMOsIj5nSNgWc
         d5FApZBH7rxxH2aBA7LtZ2WjHi6LlUfEgeGNNN3WUpK6Zb05dulcs16msX69ms8b2zr0
         XCampRsh4/Q6vcsNOHzyaOC00upkGlaRUBPSlbu1tTgml81mQ50sInNXCQikwMKpnyVN
         Aong==
X-Forwarded-Encrypted: i=1; AJvYcCX67AVNTKBTMqjq9BRwHJak44xMnWpcmma+8VgBvvn7K/q9tbykyefPleVfPbGDmZBJpmLaTLdxLGrPBRf6uFpxRqldZWqXQoXG
X-Gm-Message-State: AOJu0YwWLTYSL0dbXZy/BrgRF3YusMj+HB5EO2C51Wd0/weSoqWqTleO
	ah0SpyEc5GHdT6tvwp2b15c2Ov5YIIqZ8uR5p5jUSnEYY6resHfi0dNAj1bnzpVFXhM3Dl8qb9v
	8xq1vXUq0CJdIHi9IYogpP+gnS9LiGW6K1MFL
X-Google-Smtp-Source: AGHT+IFZaV9W1guyCiCFvlxL0Tuf2HLr1fiYCHIb/nvtokprZt499aOhX2wlCRAmDZ6qHpx8t/vS6dcU4G703dCeYVM=
X-Received: by 2002:a05:622a:4812:b0:434:7bb9:f231 with SMTP id
 fb18-20020a05622a481200b004347bb9f231mr343464qtb.12.1712581476934; Mon, 08
 Apr 2024 06:04:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org>
 <20240403-public-ucsi-h-v3-2-f848e18c8ed2@chromium.org> <3ezjocthsigo3t746slmgzffnmpxw7wwf3s535basiaf2qy6io@7ocxva6ndsbt>
 <2024040449-average-foyer-defa@gregkh> <oi3bwdyvyaezpmyxfdtsbiwwprxi2ufc3hlzoz23d5rxdkperl@cxpd7enatg7h>
 <2024040422-ripcord-bladder-bdda@gregkh>
In-Reply-To: <2024040422-ripcord-bladder-bdda@gregkh>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 8 Apr 2024 06:04:22 -0700
Message-ID: <CABXOdTeqz5Kza5tYXbCdTyPT66xtezai4C5TFkqmOpQc+1r8Xg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Pavan Holla <pholla@chromium.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 6:30=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
[ ... ]

> > > > if (WARN_ON_ONCE(val_len > MAX_EC_DATA_SIZE))
> > > >   return -EINVAL;
> > >
> > > So if you trigger this, you just rebooted all boxes that have
> > > panic-on-warn enabled (hint, the HUGE majority in quantity of Linux
> > > systems out there.)
> > >
> > > So don't do that, just handle it like this.
> >
> > Does that mean that we should not use WARN at all? What is the best
> > current practice for WARN usage?
>
> To never use it.  Handle the issue and recover properly.
>
> > I'm asking because for me this looks like a perfect usecase. If I were
> > at the positiion of the driver developer, I'd like to know the whole
> > path leading to the bad call, not just the fact that the function was
> > called with the buffer being too big.
>
> Then use ftrace if you are a driver developer, don't crash users boxes
> please.
>
> If you REALLY need a traceback, then provide that, but do NOT use WARN()
> for just normal debugging calls that you want to leave around in the
> system for users to trip over.
>

That is not common practice.

$ git grep WARN_ON drivers/gpu | wc
   3004   11999  246545
$ git grep WARN_ON drivers/net/ | wc
   3679   14564  308230
$ git grep WARN_ON drivers/net/wireless | wc
   1985    8112  166081

We get hundreds of thousands of reports with warning backtraces from
Chromebooks in the field _every single day_. Most of those are from
drm and wireless subsystems. We even had to scale back the percentage
of reported warning backtraces because the large volume overwhelmed
the reporting system. When approached about it, developers usually
respond with "this backtrace is absolutely necessary", but nothing
ever happens to fix the reported problems. In practice, they are just
ignored.

This means that any system using drm or wireless interfaces just can
not really enable panic-on-warn because that would crash the system
all the time.

Guenter

