Return-Path: <linux-usb+bounces-3683-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B4580328F
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 13:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFDDD280FA6
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 12:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A69241E0;
	Mon,  4 Dec 2023 12:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vlgUHoGq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F99C0
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 04:26:27 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-db3a09e96daso2704391276.3
        for <linux-usb@vger.kernel.org>; Mon, 04 Dec 2023 04:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701692786; x=1702297586; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tFWyFPjADp1Fc6HbLi6uPiaZmfeg0/fMint0EXwMSxg=;
        b=vlgUHoGqnwXZdK6T8Z6RUseeI1b4WsYrEI1RMwtuyvmTMCBamhw/n5ZPTRyDdK7tl8
         Z1/7gzd1rY9RQVOHAzYkc+HF3MsAQo0eFVFrYaKtXdNtfNIHCGHO2lOr1BbCfkUghrq8
         wl1LELn6SSlbp1Gwzux7u8JrK86yAH+tNWvhqHV8WTjSK3l9Tz4lUbv5KQDCGxqoCNRT
         TawHEtdXdRUcyzRzluKwpR//57BgMfny/A/M4lmAxcu/lXGRp8b9MIIQDR3Y97sXwKAy
         Uct57Hdu/81z8SAw/jm7erNq6gkR35sF5kug6zYsrw2DFcZgwZX72ssLHsvAi8q5sgxd
         bSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701692786; x=1702297586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFWyFPjADp1Fc6HbLi6uPiaZmfeg0/fMint0EXwMSxg=;
        b=Q5Fy/G5wY8RqjD/CF2z67l3JUfKuDdF95f83xuUS7v5vv1590BdDblGxZNIT790SGy
         umqWCVwD5mthQksBV7+jy4RbQ6vlm7/mpyTjWY7MLkqbQ7PvyaZtf0IqJCW8InQUkQ+4
         1IMDUEe2qO5ZG0/Y38byyUxT8LfzvqaHRYjhj5BHljm3Nyc24ofQ2uXRGPwrvtye1qEc
         UBKJLmBR9o8vm6S1c3vzTNhUcfv+6keEe3H0b/s6tBUnjnMSjsB3gP/xgbfY4H6baEHH
         //DvZc7AT20d0/PZp33fukrYNc/FXSClJEm4ErX+Oa/r57GSFb0tzxLn8CCYeLYFj6Ex
         sJaA==
X-Gm-Message-State: AOJu0Yyd7euE4NmZS2Q9xLJDMHUx9qqm2zm6goV/3AF+BAErJe3gmU8s
	OKKUwb0X6Vt3tmUgtKOctWAJioN6T67n92Tdl14QkQ==
X-Google-Smtp-Source: AGHT+IE+L1664SYHtY+cUpFkqq4X1I85OOyU1mq606IScbstXyiJjcP/Vfcc7mySBINjIKn/y2Cz19SvoVwqk/DjCeM=
X-Received: by 2002:a25:d85:0:b0:db5:4d4f:b3bb with SMTP id
 127-20020a250d85000000b00db54d4fb3bbmr1816647ybn.18.1701692786300; Mon, 04
 Dec 2023 04:26:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org> <2023120426-frosting-manliness-14bd@gregkh>
In-Reply-To: <2023120426-frosting-manliness-14bd@gregkh>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 14:26:15 +0200
Message-ID: <CAA8EJpriJ-Y0Gb+PW7f5p4Sh_BXsDpeDckgnGZ+eKmWTQBegaA@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/6] drm: simplify support for transparent DRM bridges
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Dec 2023 at 14:21, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Dec 03, 2023 at 02:43:27PM +0300, Dmitry Baryshkov wrote:
> > Greg, could you please ack the last patch to be merged through the
> > drm-misc tree? You have acked patch 3, but since that time I've added
> > patches 4-6.
>
> That is up to the typec maintainer to ack, not me!

Hmm, true. I didn't notice supporter vs maintainer.

Heikki, then we should bug you about that patch.

-- 
With best wishes
Dmitry

