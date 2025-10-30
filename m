Return-Path: <linux-usb+bounces-29870-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7672C1E29D
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 03:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6E4B400140
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 02:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212A132C93B;
	Thu, 30 Oct 2025 02:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDmSfMcI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191B032AADB
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 02:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761792628; cv=none; b=TjQh9+s5m8hbGVJPKibZbfdpOjA2oj6j5Q46IKUMQsJSA7dgSMYxDl6bc7EVWDIgZ/gW0B0msZAJ6u79KsUvqk2HNiaDZe1o9T6/FGVoZHPL0m+4HBjYgQeYvbzdU/4rp2otrYrc5vG2cCOStqIc6FZN12dQ+4XAp4WXNNoID2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761792628; c=relaxed/simple;
	bh=ULHZ+cHHaL+5iHaOLJNUHVNaWClPu5YSGCKCYmnu47w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hOwiknjwKBICzlClvE8tOv2jvtV8Ov2mv/jcbj7kjbpYNrXMSMrb8dsQWKOr5ixX2k7VRZP2m3KJZkIJwVLSYvWwlxNxiSaxtpFJ+vgcYXSDhkGg0DY8cxsME3iFGpTe7g64Ry+GYyEHF61H76VZgRXVLSg543gzGMSWSkv8SYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDmSfMcI; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78487b0960bso6725257b3.2
        for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 19:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761792626; x=1762397426; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=49j9QrYlm4qxZHbvYSYUJsJt0aMp426fig3D6hH+fj0=;
        b=EDmSfMcI1I0RB3mL+KS6FaXru/zT9nI9bPxO8dUeZOTkNh1MHBjO2te+pUa1T5EvS5
         qry+N/5WTv4eEOU1wnMMKUhY8q4s2qAmXvx8Ml6vnU7xPor/nTbGKb5nOYe0+zJLjeK+
         v9o5XfgB0JvmGyX6Hsoffmb2SltZdvxrWZRvPmtyG9pEykkVFDWfQBGDg5v/npxL6k95
         nnvnVhJJhmj1Ubc+413h7hLwA9k76z79lESUR/rcuT3f7r5wezXpGfQ2sERYgATbEbTu
         U5yeIM+COkMA2QFti8fvSHF14E4JA9KrIt1tvxD4hHsqpJCKsxKam91NO/s3kVx47u36
         LzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761792626; x=1762397426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49j9QrYlm4qxZHbvYSYUJsJt0aMp426fig3D6hH+fj0=;
        b=U1L8lHkLz16ifVI2LMz8pGslVQL50Vi/S3tdFYqObAV+8yS3Ar97SzZnkNLBNd3TvY
         cPW6ezmHPR3An+jV0zTVpHOCeqR7krNItVDCr1v5gOcslNpvAElLajUc9NwUlmx+/zCh
         kFALuHOeXLNThAd4cULa+eqHKXrD7xXnDDvlBkhK4F7BzOTnWAQSRL47O1nz2MrZa8D2
         H+FMrR7pjIkEs2oU8OstaHkuh+2drdJsI2kMqFncqlhcmLS9Fob1NtrJqMTFYhKPKQpF
         rl33S7YUu9T4ubK3bpvh6+VLZCGDgyeh7y0S6xXI6sHcM8MY4t29DFbxAry8UQAvcLQx
         uqIw==
X-Forwarded-Encrypted: i=1; AJvYcCVR3K7SDUThrctMqk+WtcTxQqYYiqarK5P6PZnKC9pJJylQPSjSoHJAUO7JXJjDbb6R/5jUFR+A2EY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsFsXh8mJZ3oaU/Alv8Jfim0ucxEdKULZ44t1SSF4kCNqrxk2s
	jXEHBWtwWckXjlds1uHaFRhdtRkwGTePWzVFWPyynEMzA1X+M6HWTReTddqfRknUJ3dRqwTYhtL
	Z6HDIG0KWkWj6irlhsJfOa3vWuldBS+o=
X-Gm-Gg: ASbGncsCEdpKiqbNdxWkPQemsKhaEEo33w/GlDUViBB+Mn2qtaiDWSUnKDSab6Cuctg
	rdDyMGgiL+znoEtDlCzJfgaGKkptCXzeTDJvxDqruAjayYucHBSbzMi12smAglmCX15tFB1Cfla
	/4xSB63lUNn5LSOAF70KLxBfTQB9pyWSBMJi1jYR03O6IIPPg83ahieXmS4NaC9UKVludBaiLzY
	HGbG3ywro4OLU/wlme8n9n5gMbeQyvnqDwCHZ1B2M7ZBO1PKvHjbwET+NhUixLLCTyqVw==
X-Google-Smtp-Source: AGHT+IHyoJ9K1Vnf2DZwS2Kk6JM2P4IoAuduJ5ZhKYBvP2Erk/Knw6rAfD9/QlPYp3ts6NwBBaU6zsVdEYEe2Nqfv+s=
X-Received: by 2002:a05:690c:22c2:b0:784:8a26:b74 with SMTP id
 00721157ae682-78628cf728dmr50871897b3.0.1761792625956; Wed, 29 Oct 2025
 19:50:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029071435.88-1-kernel@airkyi.com> <20251029071435.88-11-kernel@airkyi.com>
 <CAL411-o6mF71oBeRsJ-OPZNbLegn4iJ_ELN9xVdppTM3ssUPOw@mail.gmail.com>
 <cc8b583a-77ec-4a7f-97cc-2d148f7fee9f@rock-chips.com> <e0c5bda3-7428-49e0-9955-fa23f1e4f35d@rock-chips.com>
 <CAL411-oXfvp-iqN+uRmFHijdmW=1omKwozKOoZ2shxukMHmwPg@mail.gmail.com> <C6253E8254C80B0F+839b71d0-1bd8-40b7-9515-7ce4a1eb8673@airkyi.com>
In-Reply-To: <C6253E8254C80B0F+839b71d0-1bd8-40b7-9515-7ce4a1eb8673@airkyi.com>
From: Peter Chen <hzpeterchen@gmail.com>
Date: Thu, 30 Oct 2025 10:50:15 +0800
X-Gm-Features: AWmQ_bl1mNxPmQHnKmASAzhusTRjlDlCn6q9Kp_CyHmpybtPIUgHFck3iJTK_U4
Message-ID: <CAL411-pULVu4AYybW9oW7kmr4M_kJhdytgBjLPb4y6w_2dj+0w@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] arm64: dts: rockchip: rk3399-evb-ind: Add
 support for DisplayPort
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Frank Wang <frank.wang@rock-chips.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

> > Okay.  My question is basic: USB2 PHY supplies DP/DM, and the DP/DM is
> > short for Type-C connector,
> > and no control is needed for Type-C application.
> > Why is there a remote-endpoint connection between USB2 PHY and Type-C connector?
>
>  From the perspective of Type-C, this should not be added.  Is the approach in v2 correct [0] ?
>

Have you tried debugging based on upstream code?
v2 is correct, but the dts needs to improve.
- There is a remote-endpoint connection for USB role switch between
Type-C connector
device and USB controller device
- There is a remote-endpoint connection for orientation and lane configuration
between Type-C connector device and USB/DP PHY device.

Peter

> [0]: https://lore.kernel.org/all/20250715112456.101-6-kernel@airkyi.com/
>
> Or is the following approach correct?
>
>
> port@0 {
>      reg = <0>;
>
>      usbc_hs: endpoint {
>          remote-endpoint = <&tcphy0>;
>      };
> };
>
> port@1 {
>      reg = <1>;
>
>      usbc_ss: endpoint {
>          remote-endpoint = <&tcphy0>;
>      };
> };
>
> port@2 {
>      reg = <2>;
>
>      usbc_dp: endpoint {
>          remote-endpoint = <&tcphy0_typec_dp>;
>      };
> };
>
>
> >
> >>>>> +                               port@1 {
> >>>>> +                                       reg = <1>;
> >>>>> +
> >>>>> +                                       usbc_ss: endpoint {
> >>>>> + remote-endpoint = <&tcphy0_typec_ss>;
> >>>>> +                                       };
> >>>>> +                               };
> >>>>> +
> >>>>> +                               port@2 {
> >>>>> +                                       reg = <2>;
> >>>>> +
> >>>>> +                                       usbc_dp: endpoint {
> >>>>> + remote-endpoint = <&tcphy0_typec_dp>;
> >>>>> +                                       };
> >>>>> +                               };
> >>>>> +                       };
> >>>>> +               };
> >>>>> +       };
> >>>>> +};
> >>>>> +
> >>>> .....
> >>>>>    &u2phy0 {
> >>>>>           status = "okay";
> >>>>> +
> >>>>> +       port {
> >>>>> +               u2phy0_typec_hs: endpoint {
> >>>>> +                       remote-endpoint = <&usbc_hs>;
> >>>>> +               };
> >>>>> +       };
> >>>>>    };
> >>>>>
> >>>> There is no switch and mux, how to co-work with Type-C?
> >>> I checked the phy-rockchip-inno-usb2.c but did not find any switch or mux. Does this mean that we need to implement them? Thank you.
> >> Wait a minute, actually we have multiple hardware interfaces, one of which is Type-C, eventually connected to USBDPPHY, and the other is micro-usb connected to U2PHY.
> > I assume the Micro-USB connector does not use Type-C/PD IC, is it
> > right? Does it relate to this patch?
> >
> > Best regards,
> > Peter
> >
>

