Return-Path: <linux-usb+bounces-7996-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FD387D258
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 18:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B1911F2279A
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 17:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1713E4AEC8;
	Fri, 15 Mar 2024 17:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RYI0qYCo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA2D53E39
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 17:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710522062; cv=none; b=HpYuNmQ/5BhMtEkpFsCHMHHJskN7d6jSjtM0JrscdSKmE+fDzUAECi/vUeRZJ09oQqn23d/NScjyz0kytcBjMnOow3IJavAIb1zZUQ3ZUfYmpSA3AIu0lqYLLFuzzNeiCb0yJTuu84ZRdMyMqh69YKsAku+wrA382XqwxgxJhEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710522062; c=relaxed/simple;
	bh=VxvSDm2ZfaL9xq0aOb0UcMoXGUO8PigKdEpcIWxJyOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rzr/+iegJCR3yT8PKWbklSDO4tdS8SVgrEpyS/N8rxo0liYtZtoYMNjkY9uBnPNt1uWxUKzy6JvvpzPDeTDaLazBVGTvI7odyjBHCMHPK10XbrF+UTUlygPIUozfRFh9ElP4bN8GttlG9863KATix+Gb5p5Id0xeboT+luQcsxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RYI0qYCo; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-609fd5fbe50so25051737b3.0
        for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 10:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710522060; x=1711126860; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wGuDPW+xpxE1rhhXhV3L94phIhzcr2uwDr/5oD2kEEE=;
        b=RYI0qYCoxfMjX8uEqHEd7GmldLToUBpan169dPPtDCYi5kKFbbN9xRXllx4Ech4m0k
         FRvQI1abiC/4HyfN6xlrTPJRK30p02wnhrC3p6Qpp2OJUO5vhCJw214p9IK6VXWrDs0R
         GzoVAp4Y82HyH7+fVp+AmrP/t/04Q9/d7zYm6V/1zIJa+AAkVLLXyieFsyPRkRKE62QP
         0deM5p66TXgLHvILV0B4IcJI2NoJN4qIyCxtCMsHZYJltPBAW6DQgzjQp2WD3bdnMcOZ
         RV8RUOcnwXusl30ZJOiDahqCS0Te8fbXM3m1oRNzEWBz0lMNHrI9nXqUkaUE+NDHt5bx
         bxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710522060; x=1711126860;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGuDPW+xpxE1rhhXhV3L94phIhzcr2uwDr/5oD2kEEE=;
        b=WDnjcRGEq7fgOz9glh7JCWWgIJJ+WXhX2zUaolp3MSLilAqLsK5Rz56SPmd4TU7A6N
         JK3RJDp+Q9d04oR+/btpWDGc2laZHRC0wGrY8zOBUQf8SDpCpSQMNz5fApHhu1CS8TTV
         wlzluk5Nckcxu8PijtbRrsJqSyFnCw1JNXCwXT5hUp3jrRm5fr9nSXi3YitGf4CEFziz
         HT7qD20cbJKjF6ZhkfX4051QKdyRJrX5ofBbnRffKqec/SmXW+X76jJRebheiNE7ME4V
         5EOtPDRjtruH3xISM00AHXzSbhMtFUWONe7qcXsLCY4XW+B6mYrnq0+Kahj1/ndef1tU
         tGSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8ypHkWhjp/jLiRkWELNTxhsm9eOBJvBQrT6AKi40bXjUv86ptX1/UGAPvDLKBgy+nS79IZyJEkXJJUElqXS3j0WxLKN3uN/zv
X-Gm-Message-State: AOJu0Yw3Hxg4NkCQbU8O9mIBwp5TGlWTKrIN491baU1IYFsXIY5T0OiU
	QcqIVgW8wR4JQfv6oeBH/3mP9ymAV3k/Vi6GAA9aYqHWkjYlGaX3hjSgmNEtFqocNX+ExlSxl5m
	yFadf4g5/qjiZnqlldYdEaXYJzrdgqCm5cwNj2g==
X-Google-Smtp-Source: AGHT+IEUASmPSE9Y5xTuqIoFFoAAA7FGv98DXuvrPHA/u9CgZstT/gZzcts5gk/gDtXUlsOJuiJ/ZzXxRwlYryzCNCw=
X-Received: by 2002:a25:ac57:0:b0:dc7:4363:4532 with SMTP id
 r23-20020a25ac57000000b00dc743634532mr4712203ybd.53.1710522060086; Fri, 15
 Mar 2024 10:01:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315-ptn36502-aux-v1-1-c9d3c828ff2e@fairphone.com>
In-Reply-To: <20240315-ptn36502-aux-v1-1-c9d3c828ff2e@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 19:00:48 +0200
Message-ID: <CAA8EJpo=g6jsmd1W=PK3YZOdnKx2DP-tvvS0nND8BO7LtzVThw@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ptn36502: switch to DRM_AUX_BRIDGE
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Mar 2024 at 18:04, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Switch to using the new DRM_AUX_BRIDGE helper to create the transparent
> DRM bridge device instead of handcoding corresponding functionality.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Very similar to this patch:
> c5d296bad640 ("usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE")

Thanks! LGTM

> ---
>  drivers/usb/typec/mux/Kconfig    |  2 +-
>  drivers/usb/typec/mux/ptn36502.c | 44 ++--------------------------------------
>  2 files changed, 3 insertions(+), 43 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

