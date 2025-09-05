Return-Path: <linux-usb+bounces-27596-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C216B457B5
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 14:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A06B3AC986
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 12:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB9C2D8DCE;
	Fri,  5 Sep 2025 12:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZcDZfvg9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65CD34DCDD
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757074976; cv=none; b=Yi7ubx2YysUhvmxiDH7lCGQ0jDaDNmFotVg5qLuTmlBa4lRYQRTSXXgBLySm0hUxXOsOf+R6DW/jfXoZZpyz8gh1vHJ7hWq5YT5J7wIj+ipy9EMxLn5Ixc3A0Ua12DIgaY1kyyCfCncVGgd4xqGXoxQXnAcEzs/0AKHZNEFf5hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757074976; c=relaxed/simple;
	bh=f88gDGGRbMwX7i/jLItg/xSlOYP4VRiz0z3DVlv7lp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InnoDoIf2GeQrBM+dAS1k/chQyyCaGsT3NKtrcm0ImeVJsFnQv3hMD/qhTm9iKqiidbk7o/DE5VjPJaKu70thyFv+nIRdDspl1Wp/o9LULBMVURFrNPYiLRPL0GfDEYFrChpt10ILDEOk/i87ZmqaAYupCWOad5feHZ1PwPH7/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZcDZfvg9; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-32b02d88d80so1829111a91.0
        for <linux-usb@vger.kernel.org>; Fri, 05 Sep 2025 05:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757074973; x=1757679773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6lxWl4V7y/wDq+LroI79aYAazd8UwfuBLrDZ9Wkh6o=;
        b=ZcDZfvg9I2bRfVaxkaMhG0zdzk0xKSkjiJDrY9+xoL0FwGP4vDoF8q8F59cypTym0i
         ysBQ8mUX94CVFz0toM4fmacAXH5A9p/ooUS7WjY+2OwljbDt/oaZM8hU+sa/vZXjwBQq
         ngfpTcmIhdOG9jOuljJC2aB9o1bgRyOeJ3w+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757074973; x=1757679773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6lxWl4V7y/wDq+LroI79aYAazd8UwfuBLrDZ9Wkh6o=;
        b=L/S7Jc40yYxKNEnGhrpzEJQvcCHvE0npfg7ZEe16bfNLedHVnb6p99aihoRFedAJ7I
         VhwrTWLmSssFXnEWlLbhd0xW0SFiHyfK4dLKVl32HJTy+yNEtkFbDSYX0BSCzql55brC
         lFFVxVAIfZ+5sW278KQXf7uFPLd0oMHYUbWfhy72ZsSsQmCaKZWv5oNgsiiv3qvzqbbs
         eyDWfqfknqAnnjhGX3maAsyQM+oSIwB+NWKZq4hUJAgfrhbTWNMrVhhagKcoqn/2CdwI
         5c2qaijnV5LZCCCYmLYR5JpSexRwCJ9Rqp5pBoOhwG3nZAy9LLwZ6Izdr49u00ywNPW5
         sdqg==
X-Forwarded-Encrypted: i=1; AJvYcCUZWSz8coS7Yfcc1x28s7bseGq9Y2kpN6JfduQFeMrsTfVyAt03M3129AeXbzAbWt6KJmEu69BzZJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0vcMlWC9gsrRb9P7Nq4EN5UIbiz97opymSpy83qAxianPFhOs
	w70Vyh1LdiPqOIq0BXaQgkF/TahXMSYkkYlYkfEPztB4tgiRsIgom1FD+xFyZkXp/fLMJkGPWe3
	LdyzBUttkv5Ww1SU2P49YEcIq/xHzAzEdLqBZbYGG6s6VwcmuNauy9A==
X-Gm-Gg: ASbGncvAip2+5p13sYxMxfpJA/nQ6uRrlgulfdb8xHhwwKwncJzNcKyQSfi9c7/sWub
	ZHFJd3bD8n4EQqXonLs/zE+LEWqcxKIeA3pLun9btKnpLgkatn7MMAdQfW2jOaqYMkbyudvya98
	CRlSOgurHaMw4ENGW9+ZNH2xHKuw1sgUU6GQH7nEv7Xw7Hg/GXN4kOyXD1ly4AfDEdw1tOTx4ks
	zVcV/XNwWBJAv51EiUQjQIysGr6VLBCezDidlWP0aK6
X-Google-Smtp-Source: AGHT+IGUt0+NPYxAOfpcTKsdIZgMD/2aTOnjQauBXAsedoGoDooyWb+qeKpbfOZSEHR/boIOsnXxSpzklV+PIcXMqPQ=
X-Received: by 2002:a17:90b:3f8f:b0:32b:be39:7804 with SMTP id
 98e67ed59e1d1-32bbe3978aemr3553401a91.8.1757074973067; Fri, 05 Sep 2025
 05:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825145750.58820-1-akuchynski@chromium.org>
 <20250825145750.58820-6-akuchynski@chromium.org> <aLq8tUogl67VptRC@kuha.fi.intel.com>
In-Reply-To: <aLq8tUogl67VptRC@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Fri, 5 Sep 2025 14:22:39 +0200
X-Gm-Features: Ac12FXyeappBWW9ObA85nA1cNYhj4olXtKb4gTth6JkKRBs9zpklMmd4xbjPsrc
Message-ID: <CAMMMRMf1g+EwYfRmygCYiJGJd_XEeHrt-jrQaqKk1_SPyoRhXg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] usb: typec: Expose alternate mode priority via sysfs
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 12:34=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Aug 25, 2025 at 02:57:50PM +0000, Andrei Kuchynski wrote:
> > This patch introduces a priority sysfs attribute to the USB Type-C
> > alternate mode port interface. This new attribute allows user-space to
> > configure the numeric priority of alternate modes managing their prefer=
red
> > order of operation.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec | 11 +++++++
> >  drivers/usb/typec/class.c                   | 32 ++++++++++++++++++++-
>
> Maybe patch 4/5 could be squashed into this patch, and I'm wondering
> would it make sense to just keep the typec_mode_set_priority() in this
> file (drivers/usb/typec/class.c).
>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>
> --
> heikki

You're right, mode_selection.c is quite empty now. However, in the next
series, it will be the only user of the priority variable. So I'd prefer to
keep it there, if you don=E2=80=99t mind.
I think putting it in class.c would create a mess.

Thank you for the review!

Andrei

