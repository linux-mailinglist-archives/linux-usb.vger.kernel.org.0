Return-Path: <linux-usb+bounces-21739-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03004A6054F
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 00:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DA374212B3
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 23:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26EEF1F9F7C;
	Thu, 13 Mar 2025 23:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lfsOlFpb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46041F8BDF
	for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 23:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741908556; cv=none; b=TSk5PeLWKJTrUMRRhEOXOX5fhp89D/JzVSR72V+NjLwJS2et4gqXxbYq+G1lfED0j/1OnVrERWwbP3FH21WlKz/2VTC4KDA79tMEc10f1ii0Hj+7Yzq6MBLyknpX3JHrSWk2WRxEKRjJFubA0HWirIPCzRsAlZoFGQRd6cCYYHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741908556; c=relaxed/simple;
	bh=fLmgjAemiovWofaWjxUzmEbQJocXHzEtlxZq33BB5yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhUuAkyQJV69KyINboULBBe88iVV8q28NGnDzxix1Q2x8MYqXtVGs8Ke9azGvo2JEoEG7n6ibE/gePJExDzcOZZ1WczmBPE7DpBSEPdUvPGkfCogRa1ZbuYCtQmMMo/CnyGbtQ21opdxtRoQHLQcZObHUyEV+y70HCEeT+Nyogc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lfsOlFpb; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab771575040so494465666b.1
        for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 16:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741908553; x=1742513353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLmgjAemiovWofaWjxUzmEbQJocXHzEtlxZq33BB5yw=;
        b=lfsOlFpbTPBRbIvsQsXstONyoujQ9WYBfAVAZDm8fj5yVu302FMqndYW63WGKRacz8
         Wob56WUv7RiopHEgwubaiTQNz7LGH60lnhU5zQojeTU5bZkxrwnBzY8sV8YkOYKJnujS
         Vo9NS93Y2QEvc9w+xlXp/LPpEicdxWIwSvVqg0/SUx9TJ8YyuoQewMhnTvUiAIB1OKqH
         28U7fr59mMsddTJpya9PXaQNpmyylQwTAxeSjmTcfBXc2Q5ZF21OD3qYH+f9j7tHG8F5
         ZmggM9cUgqkSSDuKqVWK5kGTvua7OX2uHf5lm/gvdrHExalE0kAWJzwIL5jcWFYXog6Y
         8Kfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741908553; x=1742513353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLmgjAemiovWofaWjxUzmEbQJocXHzEtlxZq33BB5yw=;
        b=Je8r69TpQPV1D2RN8Y/mNfxZphPH5znMJq90hzS4hcA5vSVxSBruzp1NcIugplWY3z
         NvvbRkwXUkEecef5L+3SIEkL7MOGCCtSG2mUiEGrS6qQrG4GTEUVKvhstz1TfG/GTIbk
         jNTEvRgdvkoVwuRBC0kY9nUoPYEAWiIaQocRVZHudD7cJdRg7yNq3mlTteEvPAdsbPFs
         bi9Vb91lqTdKmyo5BfCOoSq3kGyx27YcDH+IvD0nEm8zkJTQ2geHed5pgw66hJaM0TaR
         OoW39/4WNeTwncvz01lz5tH4ya9/LIp16L2XtFOWLj0gD6fqcZcHeVGz0OoZygE4uDI5
         s4dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdgmXwueZ+KRhv48dCNKg9eEfnkqlonh146mILRGbEiYXABymv1OcUJF4yEnmih8DUHiuZu/RPc1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6+ohnl13lMs09mGf64wMxaqkeidnmoV/KIR9RsPEOoBTqpBxe
	G1IwUxtRPAXo5142sLURmV+Iu4xqzi/LC4HauHhMC0rtK++/ch6HPNWS9wncPYvVwQDXVl4IwDj
	IyLioCZA6MWrecKCnY6Xl4svwJCXfdxjjHd1X
X-Gm-Gg: ASbGnctVhyWW/ybnHRkLs8ZdM1mJDjhD8Tbwnt1BesX3m2LMkomOKrc9fZZURjEC4PP
	tSkma9NctuJr1/IPB4VxZGlebofr9d/73DdBOXhK+jTqz8zknetsJ5wsJeIJDRl3/zop7TMEZjG
	QULG5tvw9P/Jei8C6xyDQKeoETu4m5kDBGcIyEsvGMcXbeR/H4DSWs1s++sCOZ1+wC/w==
X-Google-Smtp-Source: AGHT+IEhG6Uj2ZgXODFDQkPgzEVnFaKEkMeOMCOgSAKxsS7ffAl3Oika6RfeExnwIHlB01YBUlfrm+cZgMXZ8GfGSBI=
X-Received: by 2002:a17:907:6ea9:b0:ac0:4364:4083 with SMTP id
 a640c23a62f3a-ac330de660fmr24794366b.0.1741908552998; Thu, 13 Mar 2025
 16:29:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250312195951.1579682-4-jthies@google.com> <202503132357.RnlF5A0E-lkp@intel.com>
In-Reply-To: <202503132357.RnlF5A0E-lkp@intel.com>
From: Jameson Thies <jthies@google.com>
Date: Thu, 13 Mar 2025 16:29:01 -0700
X-Gm-Features: AQ5f1JrveV3I6ofpSQly6Maa1d3lFcNQ3Xq7VBo9SbjQm6kMIPtOwMRmVpnj6fw
Message-ID: <CAMFSARdJgVQitDWmszbhSiVfu4hCoyyNVj3LPHb+7wq64C1BiA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
To: kernel test robot <lkp@intel.com>
Cc: tzungbi@kernel.org, ukaszb@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, groeck@chromium.org, swboyd@chromium.org, 
	akuchynski@chromium.org, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Echoing my response on patch 1/3, thank you for taking a look at this.
I=E2=80=99ll follow up with a v2 series to address your comments and resolv=
e
the build issues. Additional responses below.

> > devices will be created automatically. None of parent devices should
> > ever check if the child exist to create a child - it makes no sense.
>
> This is still valid - none of parents should be poking around to see if
> there is a child or not. The core handles it, DT handles it etc.
>

Understood, we can remove this for DT. We need to keep part of this
check for ACPI because there are platforms which need this driver and
haven't defined proper ACPI nodes in their FW to load cros_ec_ucsi.

Thanks,
Jameson

