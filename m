Return-Path: <linux-usb+bounces-12432-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7B793C89F
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 21:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C0E71C20E27
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 19:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9974D8CB;
	Thu, 25 Jul 2024 19:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="03oi1sol"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEABD25569
	for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 19:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721934704; cv=none; b=C5o+Dkax7b1fZwGcw8QhETXu5QCZhmt8Ky1a+Co1xKlNrxLIVeL5LSAqGHwo4nUJ03uHjNWKxg9JHv2ctn8nQRCj/LTSxKSLpPLvjih87euBaw54yjU6WFlRTccQvuf6+/SLX4MyeKkzVnzkOV9ax1YrIrtI18AXp5Zv7tGpDSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721934704; c=relaxed/simple;
	bh=yVBTPVX3Lp7l8RaImy225IQQYMhdecaQ2QYzAbRxVh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jC326+KiC8V7anyUAZJfaQNGnfhidqnyGZP2OS/t1JWq4ZtYh2kyGfGPSrWF8zx38EddiY4K8F79EObbyFtjfUGc4RQyQ0bxNeRBgtlyjVd1omri11/2AhOsS7CV/D15172MhrXbiQAHZHdxEx9gqHuV8hHd1UnEzu2TySdLY+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=03oi1sol; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5a18a5dbb23so3803a12.1
        for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 12:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721934701; x=1722539501; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yVBTPVX3Lp7l8RaImy225IQQYMhdecaQ2QYzAbRxVh0=;
        b=03oi1solLSm7M4Vvi2WhTlIBJRybKehA+HnMR8oGJpPeyhz7Sd9redANvbrR9prHm1
         9z/9rp7RJGPl+1AQQZ8FnnRwuQc6Mqy6oYhpVktc0JM2uBSMDDDuRFuXIDi5PRkPB0dc
         FsqwiusBKMMDx0/EYIzVjYgrkhwh9IwrYEtJhMHCUhaquuFYuFQdXiGmQHUAM7pOmUvM
         FrIKz6WEfP4I99LkI1GtF5uwcPjkSrhdM5UIH4y/Ioxqh1OYOxotRk6BPUpeQe4C2ab+
         dn8DpXuvo6+UDJNdfjv/AMsNVQLJWEGWykNo9aWAKTdLVZd19aW70dkQFJ2Pe7va/AWk
         OKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721934701; x=1722539501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVBTPVX3Lp7l8RaImy225IQQYMhdecaQ2QYzAbRxVh0=;
        b=JbQmoSrnxuRN1WZnhsO5pgH2nnLSg2Hbm5optDpL8WEj5O5XtKtWJgbLcFyHAVLERu
         fdlqHs54cG6C4FjmyZWmlWu+5h+ORk2TfHm26gNxfRqv+VNt0y6CvMTpNJ97aqWnBbbd
         TBaoGeok0XSUiix4bjkJs7dH3qdXmmF/FfZkcaCAlScAiNXoL+rJ1Lxyg5bQeGM8KThi
         h0eC6HJhjHbL+CNDrjo1I9GIO0hJO+UFxSeTN94sP0K+8+MbYLpKfsnZ1nyljP7S5bol
         ovcZugI/tYQ34iw5/rlshku1lsfU7hOvPe11G0TpkVZCsfhmPdSXZSr1szjdbYgFYOwd
         pYCw==
X-Forwarded-Encrypted: i=1; AJvYcCXrajfvKej1b9/KHk+IQBYiKLfh+DFgqWNE7hp8g1DwPOKn41D8cp/p+IEUqKhBEzbP7NppySkQAh01iCmnzTFL+abAAnr590hc
X-Gm-Message-State: AOJu0Yw43mZeWMd0jO3n7WWhDtwwblcp3hMvOwlou3OV7W00Q22jMTHM
	EEL9+NEBbmvxOPxBvbeBFLPJJ22dB6gYfdkgG2tilAKkBJvJTl1raUZAhzesFXo767/lcdBNyw0
	Qi2K7nlbFYrc3PAfOGcMsdPwr847wA88XRrFO
X-Google-Smtp-Source: AGHT+IEkP1TAs73/GVZXcs9RX2QfLgqSt1NLQOoJkJYk2T/i8tERi/9BrKyDw68Dq5/fUQZA7zrbrAqrGL+oKomEZww=
X-Received: by 2002:a05:6402:2112:b0:57d:436b:68d6 with SMTP id
 4fb4d7f45d1cf-5aedd10d485mr25013a12.7.1721934700834; Thu, 25 Jul 2024
 12:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724201116.2094059-1-jthies@google.com> <20240724201116.2094059-4-jthies@google.com>
 <5eloulbppelko7hwyppq4apkuqowe3yv5bd7rlipispetg6aqj@u3mzwubs6xxf>
In-Reply-To: <5eloulbppelko7hwyppq4apkuqowe3yv5bd7rlipispetg6aqj@u3mzwubs6xxf>
From: Jameson Thies <jthies@google.com>
Date: Thu, 25 Jul 2024 12:11:28 -0700
Message-ID: <CAMFSARc8D2q2YO6-Mz7jDQv15Yc9f5U7eCXaFTPjLJu_UMXwcQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] usb: typec: ucsi: Set sink path based on UCSI
 charge control
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, heikki.krogerus@linux.intel.com, 
	linux-usb@vger.kernel.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,
thank you for your feedback on this patch. The intention here is to
allow power source selection through the UCSI driver. The existing
typec operation wouldn't work here because setting the power roles
alone won't set the charge source. That's also why there is no
pr_set(TYPEC_SOURCE) call for a negative value. It should disable
charging from that port, but it doesn't need to change the power role.
But I take your point that writing positive/negative values to
charge_control_limit_max is not an intuitive way to enable this
functionality.

Thanks for catching this issues with UCSI version and inconsistencies
between sysfs and system state. I need to revisit the design here.
I'll remove this patch from the V3 series and take another look at how
we could implement power source selection.

Thanks,
Jameson

