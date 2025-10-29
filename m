Return-Path: <linux-usb+bounces-29835-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FDAC197C0
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 10:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD0DB561AE8
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 09:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091292E54A3;
	Wed, 29 Oct 2025 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXvyNhLs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF17C2D8799
	for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 09:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761731159; cv=none; b=sEZtSFoBTw8cU78+kY8oiWw81xp0XT9pGIZgtmF0YgIAWIi35WlzAzDjycm30SMnt47NlguolkPT4QQ0bW9ICQgvxUnYL4oU5qwQ9ilrEa9eL+s0uphqYfrqbzNbiymFtyBuTgv5lpMKiOCpyAiKJA5Y44v8maQBrTooxak2Buk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761731159; c=relaxed/simple;
	bh=4o1P0z9zgAdcg3159+pZiazrU0J4QU5VpIS8Y7AdyTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZ0OJixsTBDMCV3Z6jL3+aLM8P1kp/FCDPxwc7pBSssmsiXM4488g94i/6AVDCZNYMEQEQttPi8ziYGavKdK6pWZ1KTZc4rD3dp9/3AGTxHNMsMdKUyYUn+RTzwAqFX07GSDg3sfrbDsY6nrQxwRQRd3PzgHHsG3ussRgBN2NFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXvyNhLs; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-63e10cd6efeso7513158d50.0
        for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 02:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761731156; x=1762335956; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T+0dV49Z0hZQvL1JwoyFgg+j9v/HxeFYx2d1Gt9wCQ4=;
        b=nXvyNhLsiC4mm3n0m2EBak1+nEu0PBavqaH1RVnAxjtT9Y4SQwQ0hYXC37SaVdUqNq
         cIzw+jBiAKZIXCA92prJliUZjArWgaLt0Nt4+1o0YL2R+WJqpei4kSS6yAuU8/Gn/vBY
         376mH2ffCsHWRyeIqYfTt/RxvuYwGXKxCtg1myKYt67I8YyqZAC6X1nXEu+3kypt+a/0
         oKLnv861ibTA1bQJ5wM3e7AC3fB8hYV/Nv3dL+82FUTZabk7s03AdRDhErCUtqhrLmZi
         M9QVypEqxMx176JycHS7SybFT//ZAwRrmDQJzIXpjr8kE9hYY6DjYxQ5uza1QpcvGXV0
         IH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761731156; x=1762335956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+0dV49Z0hZQvL1JwoyFgg+j9v/HxeFYx2d1Gt9wCQ4=;
        b=R4Fpih7NbZZ9SY0DfJ3hkh7dxJU8ZvPOD13N8JnErfoCzI7V9fWaieSdGKfQAM+cVG
         k1nzYVBKhR8qiLmkI7IHIA6xfZVRPrPr++dYexkJ/+i7sfiFsoNhof11vx2zgrFCeEoz
         TX8cdJOg+OeNeab2fTQi77yJbX1iZaaG7kjoZwHaiz67ux99zAPRyZKP8ZjBZcbxWDEf
         iPjdJhekmxB9ddLKKsrWutLcOJe4Lzs3qlxwvehPh+djjKTi/uHushwcFS2rY1h26Kg9
         RIX9ecF/yUWIJZz9fltU3Roy2wfKJI1YX+3w/dcvvxkLf7wIMRipVoph0rATo4ee4zzB
         0uPg==
X-Forwarded-Encrypted: i=1; AJvYcCXKxoGSLTp9fhFsxSZzh5utf/QPIYouWls4yDYbBRCcaP8g1DTgz9zwOI7HyyQ7Jk1o6XfRREU90lg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUqoxTg8mYMtrMKTO8p8Mi6yQ3W+kP4PpH4Eavctv8MD+9xI/F
	vcSK0Kx1eojk7JrezgyAb9Bfj6Hn2JC55/OfoOA7aOUvFlQF9MmNP9ZWLozB++ejteVfrhDylWG
	fT5zrYXfSTiLwNR5FDrH+HzVBnchCGIo=
X-Gm-Gg: ASbGncsBd6D6GTeCQsAmSBdoiuY9xEzz3K/2Uop0yRmOjj9a1tx9nbfg7hhgYSEkmjh
	ecy/W709wYE7ott0QXr6f7xfx/IjO2OqZGc7hgjVJe8hA+gPGFnmXqZQErT7ccMS76E+Nn/WDq7
	hzflFkxFIirFFr396HN1PAb2r6i/Fy0YaOc+YRECGeWE55dnj+ndZnh3EIm/o6zBw6ANW9cs7o9
	UXFDro6/ITBRy2jlgRHZsMhtfF/SuWvqVNn1wbIrB5FOYLuiVoSpCFoXD7pqtDeGdnUAA==
X-Google-Smtp-Source: AGHT+IFXTGFBQZQCvoFTcD2XW69zJNvRv2jA1skYdjLaN3X9V8WOQAc0sJLs73yBIhsOL2y0JL1ybcsga9Zkjczkf4s=
X-Received: by 2002:a05:690c:680d:b0:785:bfd8:c4ad with SMTP id
 00721157ae682-78629298707mr36580707b3.3.1761731156514; Wed, 29 Oct 2025
 02:45:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029071435.88-1-kernel@airkyi.com> <20251029071435.88-11-kernel@airkyi.com>
In-Reply-To: <20251029071435.88-11-kernel@airkyi.com>
From: Peter Chen <hzpeterchen@gmail.com>
Date: Wed, 29 Oct 2025 17:45:45 +0800
X-Gm-Features: AWmQ_blYmsodv_vg4uKolYRe0NzpqIhwJ3rq0FrOe8J4voY-HqIG6eRi0roVBPc
Message-ID: <CAL411-o6mF71oBeRsJ-OPZNbLegn4iJ_ELN9xVdppTM3ssUPOw@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] arm64: dts: rockchip: rk3399-evb-ind: Add
 support for DisplayPort
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
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
	Amit Sunil Dhamne <amitsd@google.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

> +&i2c4 {
> +       i2c-scl-rising-time-ns = <475>;
> +       i2c-scl-falling-time-ns = <26>;
> +       status = "okay";
> +
> +       usbc0: typec-portc@22 {
> +               compatible = "fcs,fusb302";
> +               reg = <0x22>;
> +               interrupt-parent = <&gpio1>;
> +               interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&usbc0_int>;
> +               vbus-supply = <&vbus_typec>;
> +
> +               usb_con: connector {
> +                       compatible = "usb-c-connector";
> +                       label = "USB-C";
> +                       data-role = "dual";
> +                       power-role = "dual";
> +                       try-power-role = "sink";
> +                       op-sink-microwatt = <1000000>;
> +                       sink-pdos =
> +                               <PDO_FIXED(5000, 2500, PDO_FIXED_USB_COMM)>;
> +                       source-pdos =
> +                               <PDO_FIXED(5000, 1500, PDO_FIXED_USB_COMM)>;
> +
> +                       altmodes {
> +                               displayport {
> +                                       svid = /bits/ 16 <0xff01>;
> +                                       vdo = <0x00001c46>;
> +                               };
> +                       };
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +
> +                                       usbc_hs: endpoint {
> +                                               remote-endpoint = <&u2phy0_typec_hs>;
> +                                       };
> +                               };
> +

Why USB2 PHY needs to be notified for Type-C connection?

> +                               port@1 {
> +                                       reg = <1>;
> +
> +                                       usbc_ss: endpoint {
> +                                               remote-endpoint = <&tcphy0_typec_ss>;
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg = <2>;
> +
> +                                       usbc_dp: endpoint {
> +                                               remote-endpoint = <&tcphy0_typec_dp>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +};
> +

.....
>
>  &u2phy0 {
>         status = "okay";
> +
> +       port {
> +               u2phy0_typec_hs: endpoint {
> +                       remote-endpoint = <&usbc_hs>;
> +               };
> +       };
>  };
>

There is no switch and mux, how to co-work with Type-C?

Best regards,
Peter

