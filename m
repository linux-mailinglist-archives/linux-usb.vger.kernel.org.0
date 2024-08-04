Return-Path: <linux-usb+bounces-12924-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9D3946DB7
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 11:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2E8B280FF4
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 09:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109A220DC4;
	Sun,  4 Aug 2024 09:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yi2MryGf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEDA1CD2C
	for <linux-usb@vger.kernel.org>; Sun,  4 Aug 2024 09:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722762060; cv=none; b=Zi4NZZl1WSIYkTEAtW+qSjqbxz0j+Qbz/eztorYrdcr8oebzvAXwnR920wc/J6ygXi4vuDbSHqrZosSxErcbu/Crp1xI1dfz4Dug1MeOKYsKedS8dZa+Fqc8tJ5nEEx08cNfxA12UA6ry3gYoJsmLxCSN6e/vjwPTtdE4CrGhxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722762060; c=relaxed/simple;
	bh=6douQ4r2VxBlUL7tGaGwEWLLUW2L8btVaNP1WvxxqPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XlmMfAdiubFyIV8J4gKUJ+RKcUqZtOlRFfOhX3nxYX+4JUc2TxbyAuRL3s3cL9L1GhRaAPhNaA+7kevtA5h0sb/TsiFxDZy5CXBh+EOIh6HswnJ/MvVP/Hy0qJamggz/Fy0TOKacVFmxafDbDRIdzj9O84CrFmbCyR01BFmvuf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yi2MryGf; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a28b61b880so3831a12.1
        for <linux-usb@vger.kernel.org>; Sun, 04 Aug 2024 02:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722762057; x=1723366857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6douQ4r2VxBlUL7tGaGwEWLLUW2L8btVaNP1WvxxqPc=;
        b=yi2MryGfRfL5+OaS3j0+ZbkZ2XfT1kiRtxk+Cm+UG7NwQHmPOeftQtD8QNoxrqapYv
         SzwrQR/TJHgn+gFVZSqz7o9N8vD1JWmMNCli7O8I8npxQc0uKf4FhtZnM9uhGZ3x8kgz
         /vruJykneqHkCs/HL7J8pom5mix3YZ56zaG/BSmvFmn6K4YnxzFGC8EREeConDh3AO0I
         LazwDIhDtS/wDpksIlJECXePQgB2qAbRg1CtsCG4b4dBn6QDelmPPzam45gUl4o++J3W
         B9RrQhAYa3r6Sjzv07WX71ENOGqk4cufYcvWw3HeBfYlgX1txvo10/nhJahzFO+tAg+Z
         t+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722762057; x=1723366857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6douQ4r2VxBlUL7tGaGwEWLLUW2L8btVaNP1WvxxqPc=;
        b=kihPOPSeiWG12wn7qjBLDAvoqqnQ3LCsbduRS/1WviXdGQalWa58psxTyhudpVXHG6
         9quTnwln7r4PA0mBSDpmu36LKBD5SfguP+TYLmNN8O4I+VMNPes+fvZJF9bm/gvi9tUT
         ChDr9XXfOKNDCeitHFI/Mze/khc6cKgTN3uBmKM4P4OB+GNr6nTnvIRjyXXhMJjJDPhe
         tEPav0Wvb5OQ/KxwMP5/ijjM6NV6ckDVIlv0JtjBHyqjly11NxAb9Jpibs/3YrG97728
         KSPLQyjO4qxdq0wEcr+S+cxswxZRkNP0a8cUJs2zEU4aDQokmbnVgd4qeP8slbSJbZEa
         bf4w==
X-Forwarded-Encrypted: i=1; AJvYcCUz6afs8Qjr1D8ywNKLZc/QcDHSSaO7uSdzyvsE66vqZ5kfd3VK6eX0W9inew32gJFVOWVYeahH+zA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGEo1bYPplQs/jg/R6H0z6BFzI0wjykFb+2XJwNOlfRSUVdazA
	//laqWuhfLDbfV/23mQ9UwlaKoSqTPZKMGzdnIpFsCc+Xga1bxHh0NHR2gTHGW1SDuqUcx0/QIz
	dkcKxIHoccSV6xWU5rIj2vRUY/OS0BJQLjpCc
X-Google-Smtp-Source: AGHT+IHsOaLbEQDa/SLhfvl6vLUewKN8IIB9s8eNAiEJa6lQ5kE9/RutK1KXfjzWrUXk4vVOzUic+NxyV5tQ3pnhzzE=
X-Received: by 2002:a05:6402:2816:b0:58b:b1a0:4a2d with SMTP id
 4fb4d7f45d1cf-5b9c7adc509mr156359a12.1.1722762056858; Sun, 04 Aug 2024
 02:00:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240726122814.729082-1-kyletso@google.com> <CAGZ6i=165A5k59MKqZxH4DvB8XNsZJ+26_0SuMZ+hidam2qRLA@mail.gmail.com>
In-Reply-To: <CAGZ6i=165A5k59MKqZxH4DvB8XNsZJ+26_0SuMZ+hidam2qRLA@mail.gmail.com>
From: Kyle Tso <kyletso@google.com>
Date: Sun, 4 Aug 2024 17:00:40 +0800
Message-ID: <CAGZ6i=0shz-2cW6BD-MUm4jEz9hXCM9ZsP5kwD9bS52PZgmYdQ@mail.gmail.com>
Subject: Re: [PATCH v2] usb: dwc3: Runtime get and put usb power_supply handle
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, raychi@google.com
Cc: badhri@google.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	royluo@google.com, bvanassche@acm.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 2, 2024 at 3:55=E2=80=AFPM Kyle Tso <kyletso@google.com> wrote:
>
> On Fri, Jul 26, 2024 at 8:28=E2=80=AFPM Kyle Tso <kyletso@google.com> wro=
te:
> >
> > It is possible that the usb power_supply is registered after the probe
> > of dwc3. In this case, trying to get the usb power_supply during the
> > probe will fail and there is no chance to try again. Also the usb
> > power_supply might be unregistered at anytime so that the handle of it
> > in dwc3 would become invalid. To fix this, get the handle right before
> > calling to power_supply functions and put it afterward.
> >
> > Fixes: 6f0764b5adea ("usb: dwc3: add a power supply for current control=
")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Kyle Tso <kyletso@google.com>
> > ---
> > v1 -> v2:
> > - move power_supply_put out of interrupt context
> >
>
> Hi maintainers,
>
> It seems that there are some problems in version 2. I will send out
> version 3 later.
>
> Kyle

version 3 sent

https://lore.kernel.org/all/20240804084612.2561230-1-kyletso@google.com/

Kyle

