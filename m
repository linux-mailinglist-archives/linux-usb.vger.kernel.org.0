Return-Path: <linux-usb+bounces-9244-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431618A096B
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 09:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49F47B289D1
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 07:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B399513DDD0;
	Thu, 11 Apr 2024 07:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Rq+9B/eE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3761E13DDAA
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 07:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712819597; cv=none; b=a+i1Sk2UXN+LBwtjEIDLoOq/JcA+F4tKwd359ucsUOYqN135AoxMB7SFJdRsl4wSPIz+6wdEfXEYYYO6tK34L/oo1UeISJoWQyHB9v3GcneWEAjiqRZcfvymsJ9q9Xe6IVD05dPfNhc7hDoUtSWM/FlGZJxMUjfy4TTUK/6rfw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712819597; c=relaxed/simple;
	bh=0ezShjubPfyqqfET0cKMfGNJ1KOyAHFPa4/ZQHuNViI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=knou4hrRchUzV3wftm7Esy0CguqH8As2tI7qPMzT+IPF7RJ0OJ6XIaFfPqqi5SLxopWH7KEC6azQFYNeir8TXjH26Af20RphticHhGp+ZcGD/M1/vSHF/lC75ajZye4UAkMac7sBGIBvPBQPghoqRQJiImC8tGkFVD+v7QhsYcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Rq+9B/eE; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a519e1b0e2dso801271766b.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 00:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1712819593; x=1713424393; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrbBAtH1jVxXi0Y7F3AAKpCddxZL6g6UJ6sMsXaG4hc=;
        b=Rq+9B/eEE7oKPYdYrPdDdBA9cX7j/4jW1EJjtb0LWLpOLBxVVip3b2RU894qTfV5Lc
         jnxkpqJ6QgaHoW/hTCnS3WQvo6q1lC/KilNCrOkZ61ID53WwBb8ggBk5rpsjpf2yBER4
         cSUJ838za6a2fPgPfLqTrs6fXLzu8t+DjoG8ibUyDgag6XbbrBarKLPiS1IayGyRCoEe
         LT8RIlJM89Ay+EvF6DvYMcHlsURSZ2uBWKakQP8TD/Ay5Xlu1u1ehuSN0q0CkztGstn5
         pVkPn033PGMlBjELMKz3AwMLS/yelDXz0e5WBauqpeqbOpsf09Y5Y9agVQMFS6S4D7Z+
         PR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712819593; x=1713424393;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LrbBAtH1jVxXi0Y7F3AAKpCddxZL6g6UJ6sMsXaG4hc=;
        b=XlsgbGVjjx6VgmzZ3TcemmfgB/4HUwMB9Xbn0iRe+gq5WjGMHOgxXa44u06HZ98zLJ
         6YsAhNYSjmmaOusvkQUcpgb9SP4LW7uEBwMCuuAfWVyzn95LFRmOVOiOHf0Os1PqOvWD
         z/H+3+laTE5DBp6RP2q99mt+AnYsU4yHS8v8iLfoza7j2NlzPcWDQaAQkJKPwPJAlrdr
         oOkK+H6YcQZCVPMmbnja32K3YWVgsLpdRUF1sK+EhZZz4l1+LcMVLztjLDQqAPY0yiLb
         aXLXj+P235OGwxp5FDWxs2PBqUSmqOI2cu5N78b0aa0eFWQMroq3jmkA3SjJcaa5tjoD
         mTjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYWYQNFrIFCkSctt3wjohXWe5oRjpnH/P9ZWRYULbX+upJx3vkHisBSUsq4iGboxAnORaAAO7c5lW20cIeiSBuHLKRHrR2LWfJ
X-Gm-Message-State: AOJu0YycF2at8pSzLV2V2/GwS374eqwBlMrDeBE7sr0lhYoYIiGxHQPI
	3eHR7FzCG4wbRKBO6wg3E/JVp5/Iq9q7EWEAiX575m0V8Yj0j2O9Adx0/d9wr1gM12+61XsYDIw
	X
X-Google-Smtp-Source: AGHT+IFqYhtJ2dBQM8qdyDDimGAJt9zOkhn/4khwtuivcKq/3IG/EsJL5J1H0EcrxhlxUadOzCQBDg==
X-Received: by 2002:a17:906:11cf:b0:a52:143c:1901 with SMTP id o15-20020a17090611cf00b00a52143c1901mr2424383eja.22.1712819593496;
        Thu, 11 Apr 2024 00:13:13 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id r18-20020a170906549200b00a4e98679e7dsm469635ejo.87.2024.04.11.00.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 00:13:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Apr 2024 09:13:12 +0200
Message-Id: <D0H3VE6RLM2I.MK2NT1P9N02O@fairphone.com>
Subject: Re: [PATCH v2] dt-bindings: usb: add common Type-C USB Switch
 schema
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <20240122094406.32198-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240122094406.32198-1-krzysztof.kozlowski@linaro.org>

On Mon Jan 22, 2024 at 10:44 AM CET, Krzysztof Kozlowski wrote:
> Several bindings implement parts of Type-C USB orientation and mode
> switching, and retiming.  Keep definition of such properties in one
> place, new usb-switch schema, to avoid duplicate defines.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Changes in v2:
> 1. Fix language typos handle->handler (Luca)
> 2. Drop debugging left-over (Luca)
> ---
>  .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 12 ++--
>  .../devicetree/bindings/usb/gpio-sbu-mux.yaml | 12 ++--
>  .../devicetree/bindings/usb/nxp,ptn36502.yaml | 12 ++--
>  .../bindings/usb/onnn,nb7vpq904m.yaml         | 13 ++--
>  .../bindings/usb/qcom,wcd939x-usbss.yaml      | 12 ++--
>  .../devicetree/bindings/usb/usb-switch.yaml   | 67 +++++++++++++++++++
>  6 files changed, 92 insertions(+), 36 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-switch.yaml
>
> diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/Doc=
umentation/devicetree/bindings/usb/fcs,fsa4480.yaml
> index f9410eb76a62..8b25b9a01ced 100644
> --- a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
> +++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
> @@ -27,13 +27,8 @@ properties:
>    vcc-supply:
>      description: power supply (2.7V-5.5V)
> =20
> -  mode-switch:
> -    description: Flag the port as possible handle of altmode switching
> -    type: boolean
> -
> -  orientation-switch:
> -    description: Flag the port as possible handler of orientation switch=
ing
> -    type: boolean
> +  mode-switch: true
> +  orientation-switch: true
> =20
>    port:
>      $ref: /schemas/graph.yaml#/$defs/port-base
> @@ -79,6 +74,9 @@ required:
>    - reg
>    - port
> =20
> +allOf:
> +  - $ref: usb-switch.yaml#
> +
>  additionalProperties: false
> =20
>  examples:

Hi Krzysztof,

This patch seems to break validation for fsa4480 if data-lanes is set in
the endpoint like the following

diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/Docum=
entation/devicetree/bindings/usb/fcs,fsa4480.yaml
index f9410eb76a62..3aa03fd65556 100644
--- a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
+++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
@@ -102,6 +102,7 @@ examples:
           port {
             fsa4480_ept: endpoint {
               remote-endpoint =3D <&typec_controller>;
+              data-lanes =3D <0 1>;
             };
           };
         };

Similar to how it's already used on qcom/qcm6490-fairphone-fp5.dts

I'm guessing the 'port' definition in the common schema somehow
disallows the fsa4480 schema from describing it further?

Regards
Luca


> diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Do=
cumentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> index d3b2b666ec2a..88e1607cf053 100644
> --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> @@ -33,13 +33,8 @@ properties:
>    vcc-supply:
>      description: power supply
> =20
> -  mode-switch:
> -    description: Flag the port as possible handle of altmode switching
> -    type: boolean
> -
> -  orientation-switch:
> -    description: Flag the port as possible handler of orientation switch=
ing
> -    type: boolean
> +  mode-switch: true
> +  orientation-switch: true
> =20
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
> @@ -54,6 +49,9 @@ required:
>    - orientation-switch
>    - port
> =20
> +allOf:
> +  - $ref: usb-switch.yaml#
> +
>  additionalProperties: false
> =20
>  examples:
> diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml b/Do=
cumentation/devicetree/bindings/usb/nxp,ptn36502.yaml
> index eee548ac1abe..d805dde80796 100644
> --- a/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml
> +++ b/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml
> @@ -20,13 +20,8 @@ properties:
>    vdd18-supply:
>      description: Power supply for VDD18 pin
> =20
> -  retimer-switch:
> -    description: Flag the port as possible handle of SuperSpeed signals =
retiming
> -    type: boolean
> -
> -  orientation-switch:
> -    description: Flag the port as possible handler of orientation switch=
ing
> -    type: boolean
> +  orientation-switch: true
> +  retimer-switch: true
> =20
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> @@ -49,6 +44,9 @@ required:
>    - compatible
>    - reg
> =20
> +allOf:
> +  - $ref: usb-switch.yaml#
> +
>  additionalProperties: false
> =20
>  examples:
> diff --git a/Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml b=
/Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml
> index c0201da002f6..589914d22bf2 100644
> --- a/Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml
> +++ b/Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml
> @@ -21,14 +21,8 @@ properties:
>      description: power supply (1.8V)
> =20
>    enable-gpios: true
> -
> -  retimer-switch:
> -    description: Flag the port as possible handle of SuperSpeed signals =
retiming
> -    type: boolean
> -
> -  orientation-switch:
> -    description: Flag the port as possible handler of orientation switch=
ing
> -    type: boolean
> +  orientation-switch: true
> +  retimer-switch: true
> =20
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> @@ -95,6 +89,9 @@ required:
>    - compatible
>    - reg
> =20
> +allOf:
> +  - $ref: usb-switch.yaml#
> +
>  additionalProperties: false
> =20
>  examples:
> diff --git a/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yam=
l b/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml
> index 7ddfd3313a18..96346723f3e9 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml
> @@ -35,13 +35,8 @@ properties:
>    vdd-supply:
>      description: USBSS VDD power supply
> =20
> -  mode-switch:
> -    description: Flag the port as possible handle of altmode switching
> -    type: boolean
> -
> -  orientation-switch:
> -    description: Flag the port as possible handler of orientation switch=
ing
> -    type: boolean
> +  mode-switch: true
> +  orientation-switch: true
> =20
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> @@ -63,6 +58,9 @@ required:
>    - reg
>    - ports
> =20
> +allOf:
> +  - $ref: usb-switch.yaml#
> +
>  additionalProperties: false
> =20
>  examples:
> diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Docu=
mentation/devicetree/bindings/usb/usb-switch.yaml
> new file mode 100644
> index 000000000000..da76118e73a5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/usb-switch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: USB Orientation and Mode Switches Common Properties
> +
> +maintainers:
> +  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> +
> +description:
> +  Common properties for devices handling USB mode and orientation switch=
ing.
> +
> +properties:
> +  mode-switch:
> +    description: Possible handler of altmode switching
> +    type: boolean
> +
> +  orientation-switch:
> +    description: Possible handler of orientation switching
> +    type: boolean
> +
> +  retimer-switch:
> +    description: Possible handler of SuperSpeed signals retiming
> +    type: boolean
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      A port node to link the device to a TypeC controller for the purpo=
se of
> +      handling altmode muxing and orientation switching.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Super Speed (SS) Output endpoint to the Type-C connector
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description:
> +          Super Speed (SS) Input endpoint from the Super-Speed PHY
> +        unevaluatedProperties: false
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                $ref: /schemas/types.yaml#/definitions/uint32-array
> +                minItems: 1
> +                maxItems: 8
> +                uniqueItems: true
> +                items:
> +                  maximum: 8
> +
> +oneOf:
> +  - required:
> +      - port
> +  - required:
> +      - ports
> +
> +additionalProperties: true


