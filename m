Return-Path: <linux-usb+bounces-4306-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD63816AC5
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 11:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52A78B21633
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 10:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E4B13AD9;
	Mon, 18 Dec 2023 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5PVsihA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD70F13FF6;
	Mon, 18 Dec 2023 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-28b93b04446so150968a91.0;
        Mon, 18 Dec 2023 02:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702894618; x=1703499418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cE+4PArKzxxf52RI2qZGv30986Mi3tB/nuE1GoXNM8Q=;
        b=a5PVsihAfPpgTtdfTz/CkrMAyKPCOHnL6wlo0LB1B7yZAp0H/KlsDmmZbbnR4NH5kh
         GVjrGZCOGHQ+hj89QNd3sxjXHPoiMjAx/ENOKmP24wH/MVuk4FUIrkGjz8hcAwFCQt9e
         +3hcebHO1zaeny9ZrZhEOf49++hEYDiJx60FblNKutrE2xkmc6Cz5AkecEktqH94Inf2
         3zihByHq/XDyEiHTCj73jvYPqXO10fLEGFH9fA3kQenvlUNh63Mh1pzWdm3L8cNcPODY
         fx0ggVVaJyo/ibsxk1B5gfK3sWchQNGGKiDCZfPbN3gzd+/blXy/QLgQs7JnVm5/6WO6
         b+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702894618; x=1703499418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cE+4PArKzxxf52RI2qZGv30986Mi3tB/nuE1GoXNM8Q=;
        b=NOUW7LBAU+1V95zj+O7YNSSley6s8en0M8RO2TyKzHZZr4sjLZ6UPGizaKwTELjcvF
         C3Uk0LzAsxZerWEFl1DQLW+KWMG5P0B9t5r3RvHyoYuybotFEYK3aavuVvBZkI1/fJny
         hOekq6iQ4NS789xDGn1MiPzed1edjlXIWAInK9PR6UAk2NVuwhSGYKMv0HIuGiJgp7fm
         kCCGBzqzYVY40L4gzNhsCbtJiAFAx15znQrltaQTEIZ4J6d2EmfieMYgDB6JrCJJRB05
         1HyWV3IswOseF+atidZELMvPdxDCwyXUsCSgr2T8zzReWEi7cG1rc2smhQ1H+aMBuPQ9
         4jpg==
X-Gm-Message-State: AOJu0Yy0Tq1R169QYPsqU+oFoJX2lMNGLFMJEnbT2h//ODzKMoyLha08
	Ioh8UC5OwlY8529TmyQkZNrcc8Fm+CpjlnbvlRY=
X-Google-Smtp-Source: AGHT+IHN34Dj3XVOxJpSdc2f7yxWGK98cJd0I+UZvwAYLq6x7/xaYp9IC9nEmMrH1uI1CND4Ly0LKQwP6occKSEFcIA=
X-Received: by 2002:a17:90a:4583:b0:28b:c60:8dd0 with SMTP id
 v3-20020a17090a458300b0028b0c608dd0mr10301346pjg.2.1702894618069; Mon, 18 Dec
 2023 02:16:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231218085456.3962720-1-xu.yang_2@nxp.com> <20231218085456.3962720-2-xu.yang_2@nxp.com>
In-Reply-To: <20231218085456.3962720-2-xu.yang_2@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 18 Dec 2023 07:16:46 -0300
Message-ID: <CAOMZO5AZ6oLgeqvwf5_u9YhrFvwgRSiNjGq+wVMjXYsq7t3MxA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: imx8ulp-evk: enable usb nodes and add
 ptn5150 nodes
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, linux-imx@nxp.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jun.li@nxp.com, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 5:49=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:

> +
> +       ptn5150_1: typec@1d {
> +               compatible =3D "nxp,ptn5150";
> +               reg =3D <0x1d>;
> +               int-gpios =3D <&gpiof 3 IRQ_TYPE_EDGE_FALLING>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pinctrl_typec1>;
> +               status =3D "disabled";

Why disabled?

No connector and no port properties. Please run dt-schema check
against linux-next.

> +       };
> +
> +       ptn5150_2: typec@3d {
> +               compatible =3D "nxp,ptn5150";
> +               reg =3D <0x3d>;
> +               int-gpios =3D <&gpiof 5 IRQ_TYPE_EDGE_FALLING>;
> +                       pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pinctrl_typec2>;
> +               status =3D "disabled";

Same here.

