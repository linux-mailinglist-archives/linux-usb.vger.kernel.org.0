Return-Path: <linux-usb+bounces-6942-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D204860A5A
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 06:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD993285B25
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 05:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF7112B60;
	Fri, 23 Feb 2024 05:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bl5DMgAR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF6E11CBD
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 05:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708666936; cv=none; b=ehFUJSyebsKzMSszPdtNIO+GOPVCywemcIDro+HCQ0D61lp/aJ8plaJq79UbW4vYmLgACxzlPc/KjJyXr2Hyom3bjcDAcQlsHy2LpNUWaoyFN1o6u3Ohw7Dp4pZFAPNo9VB4Ksk+NpfPxPfg2deEGJ2FsQ6sG4WTAW3kbrCTkWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708666936; c=relaxed/simple;
	bh=aE447Jap12eZD5a1J/X6aRmA5nuWBHWGqwLZ3ceezro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7yeoQbjmOqBsZubZSkVyw50NOY8XIpTUQHhBayHP0sP5xLL5PcEQhcxpapCskL/ZUufaKH62sUjQGzj0hfaK5XxOJkkVbIo+b7LL1jDJiJRy9THy2S/LiEbumzohnm4zDJr+kD5dENOp1oiYqsXn5wqhQd+d2xVZoTYvHdpLKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bl5DMgAR; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-607dec82853so5087117b3.3
        for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 21:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708666934; x=1709271734; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qxG/aeJii+Y6qs4HnHvwGhjAHF46EFaC1e+Ez20c7pw=;
        b=bl5DMgARj+D+NSCbArcFBXnLAEDBjJOdEorOEQzMgFtv6yVutUbN+7bA0RHUFACOl4
         977ElcbeF+Dq8N6F8Ga9KxI5Y6aoPGAJ8qCWCH+ZLFnkzu0fRgelv6pWbKhPeQ9HNdg0
         rsjZvjaq+w7cSJTHbfcsyZ+RKkh7ZJJ1qS38HQ6FgeCvazqVdFJ+QtkACT5yI2duIlyq
         /aNo/LDD+IwwDhIYrMxjd5jpW+wbhw82j9HCvzswIk3yOOP/Z+Bg33NAH+Glt6a1+zPO
         jsgbyt8l1CdDFc2kv93+50C7MhkOlRvjgepd8nS+YgUCUijh8erLl/aqc6s9mR8GIB8Y
         xpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708666934; x=1709271734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxG/aeJii+Y6qs4HnHvwGhjAHF46EFaC1e+Ez20c7pw=;
        b=XJSV/56lFxJIexHdhllwOGr02Y4YWYe7t1//trPNugQ7sDMzSPxksjgsLbcoDAMVki
         Negj9UlYwp5qgodsMItBzDJhee2mNoaquenIWv/rqlJpKrXr4JzMWqWjzFzM8L/MpbWi
         Z17ty9xtZ+EaQecgtU/BPquizzefty+0zgroPD6WiPQqxmRTCKBI/5YpyoQ5dJLgOqrI
         HW1zLErcwPqDJt5RP564ESTWPN90Zf6IylECyJMxQq0Vls++7CsMEGi3TkUC3qIz5Opw
         w4m8xKhCWGuXByp5xdPA2hN2rQmvjzQosOb1d2Nr6LpbT2LsVu0h5/SJ9gre2upCk+he
         KeWA==
X-Forwarded-Encrypted: i=1; AJvYcCUMOTtr1ratzz1niI+SN6/39FtWTFmJXrDbQVFlXLycPpjkSj9iA7POSS3yxEzq9L4vDssqua2/ZeT0ZmzxBQpat5u3OYeGpj0m
X-Gm-Message-State: AOJu0YxViB2IuZMlyJsIzPsfRq9FE7f2pc97Vokq0nE2G5sSL4pAcCqQ
	pDEWYE5CO2acnIhtAxHA2kgN2JcJx6fcQIjv2hMgNJzcaKxVzetPw2u/L4gbaTv7vwdUw7dBQ66
	qMAkG50QdV1tqKucAO9FBhVIvzLNyN5BDQ3CAEQ==
X-Google-Smtp-Source: AGHT+IF/QZMnajs0JjUHCMx28red/epx+Y/HhYTPBEkGWCOf4Uh5iSRWNv2AP/FAxhjejhgXsjPCMbgv2BO4KbI5jSc=
X-Received: by 2002:a25:b58a:0:b0:dc7:4268:3a1c with SMTP id
 q10-20020a25b58a000000b00dc742683a1cmr1151956ybj.18.1708666933963; Thu, 22
 Feb 2024 21:42:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223010328.2826774-1-jthies@google.com> <20240223010328.2826774-3-jthies@google.com>
In-Reply-To: <20240223010328.2826774-3-jthies@google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 23 Feb 2024 07:42:02 +0200
Message-ID: <CAA8EJpqf5NPwqDdrm3-T5S1mLRnVtNEr=z72GCsZN03J=y7qwQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] usb: typec: ucsi: Register cables based on GET_CABLE_PROPERTY
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Feb 2024 at 03:04, Jameson Thies <jthies@google.com> wrote:
>
> Register cables with the Type-C Connector Class in the UCSI driver based
> on the PPM response to GET_CABLE_PROPERTY. Registered cable properties
> include plug type, cable type and major revision.
>
> Signed-off-by: Jameson Thies <jthies@google.com>
> ---
> Tested on v6.6 kernel. Expected cable properties populate the USB Type-C
> connector class sysfs paths:
> redrix-rev3 /sys/class/typec # ls port2-cable
> device  identity  plug_type  port2-plug0  power  subsystem  type  uevent
> usb_power_delivery_revision
>
>  drivers/usb/typec/ucsi/ucsi.c | 69 +++++++++++++++++++++++++++++++++++
>  drivers/usb/typec/ucsi/ucsi.h |  5 +++
>  2 files changed, 74 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
>

-- 
With best wishes
Dmitry

