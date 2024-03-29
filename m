Return-Path: <linux-usb+bounces-8659-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D33AD892046
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 16:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EEB31F243DA
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 15:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3548913D252;
	Fri, 29 Mar 2024 15:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PZUTkH/M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D7913CF9B
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 15:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711724942; cv=none; b=vAz8uyjVkYMuNiAINnHW4EFxR9grDbbLcopBmdlhkPalVQiCRYcHDxNhADxVGsKbbPPJjNUWWtGKhxJV3WUPYiKhOi3HkGYyJUo3OdFO3/2l7PcvYwjb4264LKdZIVPaxakwFZ+IzpV0GAl7XagRDQ5ZY4kMi8xxWBQrtAUiln4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711724942; c=relaxed/simple;
	bh=daePYgjkq+cQ2AzVZ2YunxMLLLX5go5iQcMTmOzir+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b1j2HiRlObqhahCA3VYanpIUV27k84ybOqwAIe/x/WSv4caoExSWAjWAnDtJZ1z0PDPZgx+Ym3FO0V+ic/k5e2Nd0fi8R5pZRsOr2octuieq6lEkW3kABDkwvzBPW8GoCmjoyZxxMOpXI9WXVETO349r+t/xKC6TBEExAhBpNio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PZUTkH/M; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6e6a5bd015dso944117a34.2
        for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 08:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711724940; x=1712329740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daePYgjkq+cQ2AzVZ2YunxMLLLX5go5iQcMTmOzir+k=;
        b=PZUTkH/MOC0Jceh/rkKgCr1YUcNqSVErVjXTgkANc2osLlrRtFOZzNfTIQYE2TBvc4
         b2yI+okOM/oRgloxsKePl4gDxp1WBaswllpybF/BzyZCFjDOpgvBnM4ap/qZcEj/EGN4
         QduGIg5fH8zwajKdZNo4btz84A/wyPHSqhBAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711724940; x=1712329740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daePYgjkq+cQ2AzVZ2YunxMLLLX5go5iQcMTmOzir+k=;
        b=Yr7cTVGZ2wBENdPz0p5YurUmlsu6NvNAhuh6OgmRgEcmnjc5QDYDJjHRqqkonUxQbJ
         VxEFn6MLRK0qs7SuuLqrL4WcqEIDkBuxMp0+jliXRERz4RKSyUW2wIXRNUofGfhTN3co
         ymhdysJtivd3a8DaR0U7m9GwucWhUytiOzI+ctnw4Mmcjewfg3MGa24pKX3Xo6yz3hg6
         kKJAFzkOs/YbPdLHoCxL32gWTyTMbyMLB3oZOgoIy8bqEZSr9vGtzUGB0BSZ6FQe+fDr
         PZvf9LCkP0fNEW2I8NLs43trR8sclgJNa+CwGsOawSgvLkjyTq1a11C063ihUlJk5nRL
         /K5g==
X-Forwarded-Encrypted: i=1; AJvYcCXnr3TKjkWV2ksSFdIuDlyoLzyPpJ+BKaPLO1tWR2MXWZNfjg4a3IY3CXW+jvx+Rb9gaHFBF8xkmsp6XaDDWw2vnd+yczCrM9GT
X-Gm-Message-State: AOJu0YzsPRDujYG397yhTKIR9id+mq+vz0nGsXl9p3pkESrgyhwCpGQH
	ej8Kx0CREZ9Q5UoEWwtKhCZ4pB0t2BME5Z+cSr0rdAE/E780A/RpISzYhD4xxUSQ0NUeioxv+q7
	e0Cx4C8NrrlK8ztDG1UraVHPukFs4yDd3bGr9
X-Google-Smtp-Source: AGHT+IHkCQP3YZsgrbXv26rrddE1rn42JrcOzPiLaSGOjMcGGGjCzEJoZhIHs5VGpIwznGGn1zH7hw2r9eb8NNiLD8o=
X-Received: by 2002:a05:6808:1792:b0:3c4:2f37:f158 with SMTP id
 bg18-20020a056808179200b003c42f37f158mr694924oib.30.1711724940397; Fri, 29
 Mar 2024 08:09:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org>
 <20240325-public-ucsi-h-v2-3-a6d716968bb1@chromium.org> <1b040be3-acd7-40dc-bc9b-24ea6d4b8377@linaro.org>
In-Reply-To: <1b040be3-acd7-40dc-bc9b-24ea6d4b8377@linaro.org>
From: Pavan Holla <pholla@chromium.org>
Date: Fri, 29 Mar 2024 08:08:24 -0700
Message-ID: <CAB2FV=614YLrsj6yPxRd1uVsF4n3EabLoXwL1Mtrk9Eg+5Mo9g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] platform/chrome: cros_ec_ucsi: Implement UCSI PDC driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Thanks for the review.

On Thu, Mar 28, 2024 at 8:32=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> While it's fine to use platform/chrome for platform drivers, please
> place drivers which have a subsystem into the subsystem dir. I think we
> don't want to hunt UCSI implementations all over the codebase. Please
> use drivers/usb/typec/ucsi/ location for your driver. This also removes
> a need for a global header.

I agree with your assessment that drivers/usb/typec/ucsi/ is a good
location for the driver currently. However, the driver is still in
early stages of development. We may have to account for PDC/ EC quirks
(we have multiple vendors), add FW update functionality outside the
UCSI spec, or add PDC logging functionality. While I'd like to write
separate drivers for those, some of this functionality will need to
acquire a lock over communication to the PDC. Even if I were to write
separate drivers for new functionality related to the PDC, maybe it's
better for all ChromeOS PDC related drivers to reside in the same
location. I am not sure what form this driver will take in the near
future, thus I would prefer to keep it in platform/chrome. Maybe
cros_ec_ucsi isn't the best name here, cros_ec_pdc probably conveys
the intention better.

Thanks,
Pavan

