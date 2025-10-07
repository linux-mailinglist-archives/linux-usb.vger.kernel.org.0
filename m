Return-Path: <linux-usb+bounces-28978-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8BBBC29ED
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 22:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B6CC3C5E42
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 20:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A3B23D7DA;
	Tue,  7 Oct 2025 20:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sMwxbj+0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D112222AA
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 20:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759868408; cv=none; b=dEt4UFv4LikNLvHQXmOWhfspW22K5OMWdd7kmphzVfLqulout2OawEd8Y+Sl0AjQvyuRgdpASJL2flYrMfw49VHv54sP/+M8ercT1RMYJUfYpTpeXWl4VENa36d8WuFWUDQp8iDUrjnpzlecVKuxpS30DbJhe3N7EsWdsJBA3q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759868408; c=relaxed/simple;
	bh=VOJGm4xHo9yLpjNqGa0Z0pDqyLUjWX3aXbAIUsOlMvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SO8sGKSa8rYEDQPMQGvvIyvDwTLaGZY+0XaRMUZDxezEKFRm/m/leaPw+pS5Bb66YrO3ZqucGKzRScfVse44bRN4bxbXfBLDpm8UOAI1UnwniFucTzRfyh8JWe2ksf+cWMWaa0bmxAIM2zODcRbhzEG/nye2LKWUU5f2WGhNrqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sMwxbj+0; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7af40016ab3so4817183a34.2
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759868405; x=1760473205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOJGm4xHo9yLpjNqGa0Z0pDqyLUjWX3aXbAIUsOlMvA=;
        b=sMwxbj+0yZEIWst+fxNSOKU16i7Hi2P1EAHSYTXd/hMaBD8hy/mKcLKjyDrjssPHRk
         g1xAssGwgV37uT+qwXZ5ursK5Q3KCnpkLrqZ94JAmlKQKge/Q0SdgWEEkCd8xklTSBwG
         YkwXFFITj9jR68nMy+Pv0ZkjvrzBmsJ0H49t6Hb+ZxVWbTp4SX8n5G6XFI1XADB5QLuO
         9mhktUWBZvmnDRpyJu32/tEamJ6meEdhBNVCErOmO8A2zeB1V/z0PrMCAy32K2H9KLES
         Nb/fljhmshuSnQN9JpzVaVCkewqm/2iAO9qXnuLoQLHn/frCehIb7UiIe5In0Zh57NOY
         9KyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759868405; x=1760473205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOJGm4xHo9yLpjNqGa0Z0pDqyLUjWX3aXbAIUsOlMvA=;
        b=EVvAZzCF+uNKPe8zqQ8KHKQlFF0E8eRHKEVfvBsjh7jziz1OizE7n/9ZVp7+2XGEXt
         GcDxorsM9naPrUMt2F92iNAv9GJiRv5xoqITHpCPhNGeXOzHhH1keyYfnagCn97DsNo3
         rdG2MEe8AcC18mxbvToJ5uGpUk0xT5JPtPY7LYSOdTo0g3buUPvqOFvU+K5lQ97+Xcem
         SB5sdqCt66UQJvUxcp6VjF02aHnK2Ddz2D/Ud+goWnC+PqA2vORAQFkitPa0iRCgf/7J
         q8mwTvbRed1n2SmXmSBnubtUKirUwuJWFiXrXkj9s7HngGrmPJsHar4IrMHOeWfxzhYC
         etqg==
X-Forwarded-Encrypted: i=1; AJvYcCVHr6Q/1t3RbkxpiU5rNGC6sNm+oYwIAN0RI4jtds0H9Roc+MHW4Ff0K0uos1UPjdKB7TA4CANrz10=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNuAjLt0DGupEKJpISpoFo5emOzu/FupKLn04Ls80HgVtqvFNC
	TJcaN9zjodLiNw42NC3gXHryxeUeevX84j0BUvaw5IMWv58GbCZwBgnG3xpiGL09hb6tEgCVqgh
	5pg7d7AGc6BXBTP+SQWMiTji7qomUybalU3HFUunHiQ==
X-Gm-Gg: ASbGncvn1kUwQrgv0eCKcERhBqCqTUHDR1fLdh6jh8zqRD9Mx6feH1JzRfKA2PgYpLf
	39cW4PA95yUCZm1hC9EwdQJa0qmp5XO+mB9/7BwENXFLtZhw/y3qtTrvkOfKTbMPBM16qU4ClNX
	HofusvGXDVFebOBsLAacN0DgMkvxFTnrzpXuwcz/S/1TbQhFBDofCkB0KahU9KZ8i/ciJa7FbgE
	IgZ/PsgQ3XLZYkeUMWWAp7/ToPvXBRrP+zcNLggX1xQtEAD
X-Google-Smtp-Source: AGHT+IEHI8U1dVlqnhrsS6fP0FmSa3idf/Em/3CBdgaLIh3/qrBErYExCYpSsQBQQgzXfSMxAukwo27BHqZsQjbeUds=
X-Received: by 2002:a05:6808:18a7:b0:43f:5b28:f0a6 with SMTP id
 5614622812f47-4417b2c48f6mr450890b6e.1.1759868405185; Tue, 07 Oct 2025
 13:20:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-v1-1-b63bacad2b42@linaro.org>
In-Reply-To: <20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-v1-1-b63bacad2b42@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 Oct 2025 21:19:54 +0100
X-Gm-Features: AS18NWB4avL22wQ3_NUeMTQbUpbAXczc7-BwaaCDEfZe2LaYa7fnIVbjvyZG6LA
Message-ID: <CADrjBPqeucFJw5kH7YKK=PEOOYFJkQbmZ_CORu62FoFwqySsTg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: samsung,exynos-dwc3: add power-domains
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Oct 2025 at 16:55, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> The DWC3 can be part of a power domain, so we need to allow the
> relevant property 'power-domains'.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

