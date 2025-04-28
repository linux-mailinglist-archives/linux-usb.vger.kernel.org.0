Return-Path: <linux-usb+bounces-23542-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 590AAA9FDE0
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 01:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD126466D4F
	for <lists+linux-usb@lfdr.de>; Mon, 28 Apr 2025 23:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A23A214A96;
	Mon, 28 Apr 2025 23:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FUDiRG1l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D7D1DFE0A
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 23:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745883965; cv=none; b=h9hOxIIhRM7j0SWyTMNMr5/6GOv/Hz/XM0wsv4Gwu+M+3gnVa0C9+IxSbuMQXurbDtRXqDBnnlShOPSyNCmqa1NCPn+CHcKXC/0s7cSTNy3C7C9XTrBVEaBPFBrVJ+UlFMTojykNJ1XMMttEjIbbwmNLSd03t/k4+rpE/hERO2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745883965; c=relaxed/simple;
	bh=by91SW8m0U7AG3e8tvW7sekaz3lZRJOY/esWgdxCMJM=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3bwAKi/RC4Ld4Oxroh/BoAMnOe5ppiHV3e/HFHIMwPHErDzIpDEo5LiQ3yIcPm8j/+svuGHc0E36KdViS1zdb1vS2eFqqPefFRtpEd+s0h5kYhbSDL8dD0wTMj9q25RhkUXr9kUlhH+s6ly8n+/6SiOJHy/rfCfGeSssudghSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FUDiRG1l; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f2b05f87fdso53657746d6.2
        for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 16:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745883961; x=1746488761; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VE8Je+jYUaDWSmFxs8ADixhFpj6cC8hZZDrQSJNeCU=;
        b=FUDiRG1lo4/H91J1D8aDQihTEgARVJGqF7zohvZZW1KquyaU/yMAp0KXM7IRHfRrK2
         65Vx5HIc+SSpWeWh1osws/xAHIIhGu+c4jfqjKTZkZntKm6KqUFj6BnTbLLad8v910FA
         isHK0uX+2tc6F/uF0Qbw7tH2L6IjcaZn1SVPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745883961; x=1746488761;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VE8Je+jYUaDWSmFxs8ADixhFpj6cC8hZZDrQSJNeCU=;
        b=HCbka44vl+IALTQNWIiMCmGy5irtO51+g4mpnHvgkk6oNndAfqllgXu8SU5Si+Dm5O
         JSVgn6mb7Ch8qCKFb2H7hygV8XXlkk0N6BV1usKWPLoDFTjiPko3cqm5H8LuGa+w5aFR
         UL6K0W9B4w6qG9FTrhu5FptDLKXvOvcw+jQNmILqhLY65xHSh7OZ7PxSpmnXH3qRgiqr
         buYTb5N+FoC250qMFPMdCzUuZeRrux8PIgNyeUi3nDl7T5xb0s0bUg828AWI8EACW9bN
         lp0PpQPhkLS3N/jEmNec7SsuGrtNJayDj4SZnQwjRMjPm8uKmXzfRT1KAgxtMu8UTop4
         aZrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgtbyIiQdzcEK9Bj/lVNPsvdiAhtuPO/TRFi4U9tMkD7JAeABipMd/q46qD7SoUNGZ7woRQoPjiXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkiPil8etXUKxyJlAicCJJJ3z9X6OSeeKhHEeCR3f+ieCh5HoC
	/uC+wpJS/U+Ok0Y3GOU+zOQQHIl2fyzimT/T/tCd/CLPxPT1KF5cprGRCilKOLdwJuoNHWvWxUO
	LcX0ZFQszRZeu6kWrHnbzxYmzWeOnEFKgG78c
X-Gm-Gg: ASbGncvfl/+pTv0aGTdrhIM813Q+IGDZQ3lamCbtKaRLP2+QXw0fOWfzCUq0EirBOzx
	rb1d5ZLCP7HWEGiUQfe+sZ+pSValmokveOb6Z4MnHFQZWxgXo4lBlWo4Bg0W2sSWyWWn7v3gGxw
	/AadnKR13PzkrjoauxEUt+BZWQIT3hAgySjDv83TUjDHp05+AXJg==
X-Google-Smtp-Source: AGHT+IFT3g0BYPOptg37k21ZoiyICUp9dUnCNnXOjhOeBejDgO2ZHYly94hoOyehQ8LteVC6kVaQQcW7F1AvS61YrSk=
X-Received: by 2002:ad4:5ccc:0:b0:6d8:ada3:26c9 with SMTP id
 6a1803df08f44-6f4f1ba925amr20159256d6.10.1745883961685; Mon, 28 Apr 2025
 16:46:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 16:45:59 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 16:45:59 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250422082957.2058229-4-treapking@chromium.org>
References: <20250422082957.2058229-1-treapking@chromium.org> <20250422082957.2058229-4-treapking@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev8+g17a99a841c4b
Date: Mon, 28 Apr 2025 16:45:59 -0700
X-Gm-Features: ATxdqUGhJ84Msn7xBIME_dKVHCYNJ-hlMGgL-TiHFD5bx9lm_Zsl3wWl5GrA3mA
Message-ID: <CAE-0n52cwBxJ3gYzSi1+nNcRRSgbMToYBFLJwdVWSMOxBmUN1A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: usb: realtek,rts5411: Adapt usb-hub.yaml
To: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Pin-yen Lin <treapking@chromium.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Pin-yen Lin (2025-04-22 01:28:29)
> diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> index 6577a61cc07531..a020afaf2d6e7a 100644
> --- a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> +++ b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Matthias Kaehlcke <mka@chromium.org>
>
>  allOf:
> -  - $ref: usb-device.yaml#
> +  - $ref: usb-hub.yaml#
>
>  properties:
>    compatible:
> @@ -19,61 +19,35 @@ properties:
[...]
>
> -      port@4:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description:
> -          4th downstream facing USB port
> -
> -patternProperties:
> -  '^.*@[1-4]$':
> -    description: The hard wired USB devices
> -    type: object
> -    $ref: /schemas/usb/usb-device.yaml
> -    additionalProperties: true
> +additionalProperties:
> +  properties:
> +    reg:
> +      minimum: 1
> +      maximum: 4

Is this limiting the 'reg' property of the hub node and not the child
usb-device nodes?

>
>  required:
>    - peer-hub
>    - compatible
>    - reg

Can 'reg' be dropped because usb-hub.yaml requires it?

