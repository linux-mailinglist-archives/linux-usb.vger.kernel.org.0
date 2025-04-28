Return-Path: <linux-usb+bounces-23543-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7BCA9FDE4
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 01:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98C33466E27
	for <lists+linux-usb@lfdr.de>; Mon, 28 Apr 2025 23:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92BB7214A98;
	Mon, 28 Apr 2025 23:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a7H/flpV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D0F213245
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 23:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745884080; cv=none; b=RtTM/P9VxnnJJ4UIS324Uo/PCoHR6LJee3lewGxJHa4DTHXvtFNHTc6t6LBYOoe8/WWmPW1mokJksKIUFMKEmZG35v2GpbVv5KLJuwdu6qr5kBFtNTNrvchvWMe5XvdRu/IKy+UeFkIIOElQ+SN8eJlI9jMmM45jufZVo8vY55g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745884080; c=relaxed/simple;
	bh=WZj44QHQBnk6/jl3xb6TT+AiJGLpd1Hrwoo45YNQDy0=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJwx9EeMAtS3/eq/0b6j838afKs7O4Ct3U2DKccCxIjlPaw6hMgun5LCdMP0gvtkE/iheETVEXw/HFY1Qq6Bkn+2b2xhQuFPbArCdTwKdeHDMEPip0Baq3M2O7QkOngQLTwxuuh2LbtyG20io988Ypn8k4rzFCS315LNLcQCcn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a7H/flpV; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c07cd527e4so586659085a.3
        for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 16:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745884077; x=1746488877; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ak6BhAJ6X0RHy54tG0/xdLDkXO0ZMwVkyD18C7XTCJw=;
        b=a7H/flpVap2HExlt3SXbVZznTZrAdeg9AAZDlh5Eo9+KPK8HjYtwsO5DHT5+2iFX2i
         Lw8Qm+Uoh6rcJMvWpzQ50ZOIN+M33MTOkFLWygCAEhUgLS3T4+6DWA8t/SLCu2b91nD1
         Moy4Y2yHBO0RHgGBCmzFWc+aQMomHOFH1kSeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745884077; x=1746488877;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ak6BhAJ6X0RHy54tG0/xdLDkXO0ZMwVkyD18C7XTCJw=;
        b=I/tSIr9g95qsLO5n88EtNYUZQnOnCXg1dF+P9Nou5h6Csrh6jzstj48hBvxLp9lBTW
         fXIkXgutHX581lCd1O+FmqGr61eRJY7mmPwiLhWxBAFlfORd11x7Q9yTUUBP+N24/F/k
         i6k/YfFrjO7X4PNf04QCbLa9OWrt1XUhJHCaTzB8ZxvRH2QAUpPE8l44y5/etw1GB2HN
         pE9iwir/Aq0MvL3kJB8b4miGTPc7wr7vUX+ekClExp3CI+CPXwy/+Ika43Qou2mgBxJS
         Bvm7m9mPWhjx8NH1u4Z8aqFUDfbhaErFpIw0yAZAjMjIwzEqy1zg3kDDbMlXyKB7aXf3
         S7GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgD7P+w9orG2K54wX2ykTADN/o4b8NLTT0WZ78zU0Q6v/8IiQ91r6ZuIg6nEAEJ20zAIhNNnTyvww=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzpksGBFQzlS2/fc1ncHAdgWbo76O+ouK4zx6rBIRGxYjrcxHZ
	oP0Gcf3TsP+dghck/k0c/HS1/Fu6LAB1AQwxpA1P7to0WhavKPxiMWbJQkHqXd/mEG5Ay8EkE4s
	9bj+XJyKHovHWysaRlOCVpWJV4Cxad3O84v1a
X-Gm-Gg: ASbGncsr6/lyG6JPEtrMurq55v4V4dem8QvQfVYT2I+J8dVOrZ/KX3Ip8datg0Ilk9s
	swDrQRMixNcY5KF4QMWkAvrCKn0Q1TvgpsvhayMtdjhfKEVkgzfW5SVLbzO0Quv/kjWcPQJoDJv
	VJLf8iL4NjNNANdKOn7j7fFmQ7vHESkB1+Kt4eryohUKCPRgElIBHEBJXBrwhX
X-Google-Smtp-Source: AGHT+IEOwwLCnV38tgYzdwBpHh/iuQ/Dg5WIoTl/PdYaLVHLxP22Y6T/XnZs7REl2/ug1JMK2C7MjZvEkwHCSYTEpTA=
X-Received: by 2002:a05:620a:d95:b0:7c7:b4de:12f0 with SMTP id
 af79cd13be357-7cabe6042dbmr154141985a.32.1745884076974; Mon, 28 Apr 2025
 16:47:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 16:47:56 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 16:47:56 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250422082957.2058229-2-treapking@chromium.org>
References: <20250422082957.2058229-1-treapking@chromium.org> <20250422082957.2058229-2-treapking@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev8+g17a99a841c4b
Date: Mon, 28 Apr 2025 16:47:56 -0700
X-Gm-Features: ATxdqUGt6hXcRm7OLJk9Kd93IRb1IeGk61Kri8RoIXMe8x8uCjahMbyGOUSl8Co
Message-ID: <CAE-0n52fsf37Xg+Qpj-VwAiUO-kOWFRXKtqLL4VmxtCzAck2dA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: Introduce usb-hub.yaml
To: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Pin-yen Lin <treapking@chromium.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Pin-yen Lin (2025-04-22 01:28:27)
> diff --git a/Documentation/devicetree/bindings/usb/usb-hub.yaml b/Documentation/devicetree/bindings/usb/usb-hub.yaml
> new file mode 100644
> index 00000000000000..5238ab10576308
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/usb-hub.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/usb-hub.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic USB Hub
> +
> +maintainers:
> +  - Pin-yen Lin <treapking@chromium.org>
> +
> +allOf:
> +  - $ref: usb-device.yaml#
> +
> +properties:
> +  '#address-cells':
> +    const: 1
> +
> +  peer-hub:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to the peer hub on the controller.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      The downstream facing USB ports
> +
> +    patternProperties:
> +      "^port@[1-9a-f][0-9a-f]*$":
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +patternProperties:
> +  '^.*@[1-9a-f][0-9a-f]*$':
> +    description: The hard wired USB devices
> +    type: object
> +    $ref: /schemas/usb/usb-device.yaml
> +    additionalProperties: true
> +
> +required:
> +  - compatible
> +  - reg

Can 'reg' be dropped because usb-device.yaml requires it?

