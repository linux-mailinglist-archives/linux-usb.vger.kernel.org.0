Return-Path: <linux-usb+bounces-5062-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A38382D75F
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 11:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6CDD28238E
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 10:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA74511182;
	Mon, 15 Jan 2024 10:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="V03DsCS4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255B42BAEB;
	Mon, 15 Jan 2024 10:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1705314555; x=1736850555;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e+fhLohLEAkqECX4w407jckAgLOeSKJ3Wqr5z5MJab0=;
  b=V03DsCS4W+1jS9ZJWyHNHyQKLh60ZU13kriu66c3yAvLKMNXAnNC3Vxn
   0vpKGsq90SfmflwxhzP3DN7rnL2x1rEf1tDv/e9p2IHH4C6T4w6deLKNa
   E227Y96ljY7lfuSnumCNYU3gJMKvjylFfE3SnuNyczTMVyiKGdDmoOT7c
   G87WJC5LRuklB239e0sHWQqxRldE3p0rww7jQudMiurzUSnWxh1ksozem
   umxOdSiMASzZXyH+yNi+m2A638/dyidbpj3iiYzcXPOhNwkBT3kYTOwlR
   zfDrU9qXT83gkn/fFI+Nb4PpKFzeeyoq0fuXsSh98+5QCAWQ9he81VWSQ
   A==;
X-IronPort-AV: E=Sophos;i="6.04,196,1695679200"; 
   d="scan'208";a="34893428"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Jan 2024 11:29:12 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 26851280075;
	Mon, 15 Jan 2024 11:29:12 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, Xu Yang <xu.yang_2@nxp.com>
Cc: linux-imx@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jun.li@nxp.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 4/6] dt-bindings: usb: ci-hdrc-usb2: add compatible and clock-names restriction for imx93
Date: Mon, 15 Jan 2024 11:29:11 +0100
Message-ID: <4863085.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240112111747.1250915-4-xu.yang_2@nxp.com>
References: <20240112111747.1250915-1-xu.yang_2@nxp.com> <20240112111747.1250915-4-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

Am Freitag, 12. Januar 2024, 12:17:45 CET schrieb Xu Yang:
> The i.MX93 needs a wakup clock to work properly. This will add compatible
> and restriction for i.MX93 platform.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Looks good to me:
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

>=20
> ---
> Changes in v2:
>  - no changes
> Changes in v3:
>  - add clocks restriction
> ---
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml index
> b7e664f7395b..6e75099b6394 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -57,6 +57,7 @@ properties:
>            - enum:
>                - fsl,imx8mm-usb
>                - fsl,imx8mn-usb
> +              - fsl,imx93-usb
>            - const: fsl,imx7d-usb
>            - const: fsl,imx27-usb
>        - items:
> @@ -412,6 +413,21 @@ allOf:
>          samsung,picophy-pre-emp-curr-control: false
>          samsung,picophy-dc-vol-level-adjust: false
>=20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx93-usb
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: usb_ctrl_root_clk
> +            - const: usb_wakeup_clk
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +
>  unevaluatedProperties: false
>=20
>  examples:


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



