Return-Path: <linux-usb+bounces-6940-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7D2860A45
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 06:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33FC61C226DD
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 05:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1244711CB1;
	Fri, 23 Feb 2024 05:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K9vYX+C3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F02DF9EB
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 05:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708666459; cv=none; b=hl8VHKNF8sy7omWDn1oHGaZjcI+ZnLMYmsU7Q0lb+Oe7v+aot2L2gyVoYFye0855yAafxH2oxGRIbAB3imOyQDB/LtNFNiScwIH7daLkqmRUnMtnBoJ5ovDtTD6BYHrn/2wiHc8jk9eKtai/y+Q4305kgobZkPKxmF/9mKeruAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708666459; c=relaxed/simple;
	bh=i2JifP25a53XHtwcXig/NwceTcdJ0ADWfEzWQ/IWSdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jH/IxdRyg6KrHv/5F5xtRwDkMlWXg6viuavxQGl3X+AVpypMRPmW/JlDy/JLccFkzngKARqe7vbzfqF/ndN0/880g2OeNrNdeUCbOKDTazq+nMQGZHdyXjeIRbbkJM7oQYSLe+pQXBAOXCePas0U+ggVQOGUFkLi2Lq1D1T6z1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K9vYX+C3; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcc86086c9fso461956276.3
        for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 21:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708666457; x=1709271257; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2+4f7N01YGRuzC3H7YfM29rrKfvtFFpp035VmvYqKh8=;
        b=K9vYX+C3qtdFJXupZc9GnFEvy5DrONW8wDQj24DmNevZu5MfJ6XvF9sfkJPYzel8eS
         lEdVKlxf6LYQDoIEDZeMXjKSDAtb/38VE2cYGmDtLk/uFTOceVRfNJ9Iqd5sbz+pz7xu
         qFoH26TKZN4REWpd3x61A8V85g+ejrKf0WyV7Y794xEm7ZACz789V9S9UoZma4h5UAJ0
         9HjpBoFoTKM5xIpWjxNWNeLEu5gVee2DxGGbmf+8r7KiwtoxWL5O7qouDdq090XJxqrN
         UOtlo7+hciOW4aCmZNuLlAqxuewfMznOJw2vOKx+J74wLPTZuO2nBnDTDyF8yL1lKCG/
         dy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708666457; x=1709271257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+4f7N01YGRuzC3H7YfM29rrKfvtFFpp035VmvYqKh8=;
        b=hU9qcLRB3uo09bRNO2qhq9H/h89YW1E35t8aQEmqaSjDWH/WpJht2+JEpWfni4jEPf
         g8uRx/MmM8ZbFWiDf62yqc0+KxHgkKotiqsq8Rdpu5Oql8Z+SKXRDIfgYcLdyfj701hJ
         6ovyH4bYYd43gTZYhe6lOoiVoRT9PtHROHgS/LMfYrl8aVo7S80EM0Wb+cq0C7EnvRBo
         t8i9C5X+BW85WG+yHwF4j0S+4CtMAl406FNKSmnnNN4kCR1Oy2bjxnSMMwlPQk7iXHZY
         k0ETi9P8pieKwhJ+ibdq+uMAs2cgXiXnycCCNJqFTUcf+y4EHp8EpwKloA1fXvKcK34a
         30HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvJE2IRiYD+mKd8M4i3LE1SiyqB5vm39FmlHwSqcfD0Ci4XDUu3pB68LsYl2aGO87stR3RWkvv23iqOPYBeckTZ/Dg5ymepnQh
X-Gm-Message-State: AOJu0YzdiNoFMZMiuEnd6ONsTdlIKxTyMXg8iGbnAwsOw/rq2mahmbc+
	fr5lueBdhR8/4ltfU67dr70L727kA1qPMnP88gUwP2ptgsH3uI40ci3gDAPArVQ1ueMTSUHRu4h
	stQXGScN6SfXClwj8NU90EmlCbsZzM+iKdMLfLw==
X-Google-Smtp-Source: AGHT+IEIoWhbAWndlBi8oVDHO2DKmfrv13BTSSEDbAyCI/96CgFgGNUl2BDpjrXGck56iGDlhhcC2mBehcpO4kLorjk=
X-Received: by 2002:a05:6902:565:b0:dc7:45df:a04c with SMTP id
 a5-20020a056902056500b00dc745dfa04cmr1246211ybt.43.1708666457014; Thu, 22 Feb
 2024 21:34:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223010328.2826774-1-jthies@google.com>
In-Reply-To: <20240223010328.2826774-1-jthies@google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 23 Feb 2024 07:34:05 +0200
Message-ID: <CAA8EJpqwAg-qenTq3MZCb74rn8rRaMxrsnmZGMwff+ABGENEGg@mail.gmail.com>
Subject: Re: [PATCH 0/4] usb: typec: ucsi: Expand SOP/SOP' Discovery
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jameson,

On Fri, 23 Feb 2024 at 03:04, Jameson Thies <jthies@google.com> wrote:
>
> Hi Heikki,
>
> This patch series expands support for partner and cable discover in the
> UCSI driver. There are a few pieces here.
>
> 1. Some cleanup of the GET_CABLE_PROP definitions in ucsi.h.
> 2. Cable discovery and registration with the USB Type-C connector class.
> 3. Partner/Cable identity registration with the USB Type-C connector
> class.
> 4. SOP' alternate mode registration with the USB-C connector class using
> a cable plug.
>
> These have been tested on a v6.6 kernel build running a usermode ppm
> with a Realtek EVB. Let me know if you have any questions.

First and the most obvious comment: 6.6 is four months old. I see that
your base commit is the usb-testing tip, however you declare that you
tested only on 6.6. Now I'm confused. Did you test your patches on top
of usb-testing before sending them?


-- 
With best wishes
Dmitry

