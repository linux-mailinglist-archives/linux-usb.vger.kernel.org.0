Return-Path: <linux-usb+bounces-29057-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32704BC6ED9
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 01:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 22D584EDF62
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 23:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62542D0618;
	Wed,  8 Oct 2025 23:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vw7Bb92h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C852D0619
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 23:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759966510; cv=none; b=AD1TQMxX9n4uJvwDqyUqy+IX1u2Q85usaEIFk3fgLMgmd6s6Dk2CsdvNSZE6IoVh4qTjmQeWOFHFtaIlBdOKwu1kXRp0qbk/7lFG8e03wehDLgCLUso1UZ8vmhNJ558/pFhxpXBKqOUMKiCFl298Qbxr230ttv/AuUsaJ6RYUSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759966510; c=relaxed/simple;
	bh=9igNQRi1zsIULgFOJ+Hpha80v02kSWzsiG8eRfeHWOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWibqGkRgTsO57+Zremnz6uJuV5L8gqXoCLuIzi7g48AkNmciNRy5bf2W/lGXU2xTc/lxfpQoPV5awiSF/dFCrn6AkusHAyxnr7INOBXwybp79Y5cKT8oOE4n0biYhvoJpex4I4HPonPFrvczSZdoahlH+w+CGfHJXahRkeFDcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vw7Bb92h; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42421b1514fso199784f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 16:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759966507; x=1760571307; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9igNQRi1zsIULgFOJ+Hpha80v02kSWzsiG8eRfeHWOg=;
        b=vw7Bb92hM90H9chxoWRY7TYUuNiZkaPWRN8l+Rh0APRdDAgKPQijy8I0B0+/yG+vMS
         2QxwPhHyOzPjOqQXmGf7kto9UTlPIOkm+SSSU7J8EQHt2gO5keOeUlQM3uZDLzkBoVcX
         Nb2y9450owpUl9irmBkbQdw61by0hcAWmRc6csFjcEVypZeVemzjBtr2KlTfD3JcHfMP
         BpiuQa+9pKuuCpQfg5+wl2RUHJWLvb7yZ5Pvsw56ModGSQ3MLHnNJb18K7nPgJWMtlSN
         X9avtg1e0LT8tvXdEk7B+F19TrJgDB3vKjdFmZ5mlx34Mu56ePezV8zS2/o2xDeuDnSH
         jlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759966507; x=1760571307;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9igNQRi1zsIULgFOJ+Hpha80v02kSWzsiG8eRfeHWOg=;
        b=g6UnOcqFV7ilUe2w4jbKW0WLkuc4ul17w1v34MuG267zzMLMucqLAHTYzjsz2QPq5q
         yM5pBuTTlF7iMeWyEUrIDOpX9VIIYSXAvlVgQ6DSH+Aq6tdw/11lHdj/SV9uG/JZ50YD
         ZsP4xtoiOnyC7DPj2cxASmC1+6FEPuVxJx8lCjLfI6k7HZaZTMPP2LCVrL9W2H7Dn1J0
         0OXiJYgmUznrdLy+jMtjFRpDfsMdK/GJ2Uw3bDUSxxQlUYWWbl1QELXzrbhnd53QEFvR
         z4fMyE0znHN2GSU9YgvZ+YMjfXWU8LRbI0lauxUovaOqe4VHH5I/YgWL2go7XHByClnm
         afLw==
X-Forwarded-Encrypted: i=1; AJvYcCUBf3FwFo6LtVGnMdvUvprySTvexs0Ai0HKMftDTlu0keQtjVx1ZrDvHfxqpUchxle31THU55OEpyI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+I2IlqNd+f3ZhZY3UlqgsFNH/hKRL1JvEeXWsTNHiKktFKdSp
	iM7qTqlOEcdtBXtE0TN2t6YPgA4vuZDUgP8nbW7s4hVZYl889+wou4K3L92mYbcRRYIMx/nzfNO
	ZyyzOPc7oG+D8JKrdyorJ7ovjKDz5BJYK+XGizedA
X-Gm-Gg: ASbGncs3p9DaKyc3QG+yV+y/Qb7Za5BDZ3U8XROF/SOI5Im4khmBpNbZrhe2MIQ4GWz
	VayYxWU63Gxy422WGm2JyRXJedKHo4Y85Nl3kgwMUd8D3tm1Bqq+XednQP4JhMEH//m5Md8V/Jg
	TlwfKivd3rWB2/dte5Z7frOv01pz9vF/CFPn/dnTSRDE7j9Y2S1V9HJhAZWpogO1DzX4h67SWJ/
	5jYVIdZ+lA2hvl5gPYzw5TY4JwsWTinu8yKgq4c8iXPfmi8AMQ7x+EiHScjMiGjJcW/HPigCjp7
	vOmFWH11UAMxXQ==
X-Google-Smtp-Source: AGHT+IEqmdZ9VxhWMpDcRldSURNd0QiDBJUs0+1kYdV5l/JzukTnaa5H9DzGsLurz4/S6KkfONlhR48b+fTHniX4RxU=
X-Received: by 2002:a05:6000:4313:b0:3ea:6680:8fb5 with SMTP id
 ffacd0b85a97d-42666ab29d5mr2881250f8f.2.1759966506486; Wed, 08 Oct 2025
 16:35:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001193346.1724998-1-jthies@google.com> <20251001193346.1724998-4-jthies@google.com>
 <aOZUq6K8bZtciL6Q@kuha.fi.intel.com>
In-Reply-To: <aOZUq6K8bZtciL6Q@kuha.fi.intel.com>
From: Jameson Thies <jthies@google.com>
Date: Wed, 8 Oct 2025 16:34:54 -0700
X-Gm-Features: AS18NWDl9Wn1v62FRwVNd2rJ20xgecQEZIHrqIoqrT8lQI_Q_BqxHXid5fR55og
Message-ID: <CAMFSARfn_ULu2+JXjGSjz4KPDOSD=MAcKS8XwZNqbHf7YL6JBg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, ukaszb@chromium.org, tzungbi@kernel.org, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> If you are not using that for anything, then couldn't you just use
> acpi_dev_found("GOOG0021") ?

Thanks, this is a good suggestion. I'll switch to acpi_dev_found() in
the v3 update.

> Can there be multiple UCSI interfaces on these systems?

None of our devices will support multiple UCSI interfaces.

