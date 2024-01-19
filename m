Return-Path: <linux-usb+bounces-5278-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D115832A24
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 14:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7D501F21B40
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 13:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7ACA524C8;
	Fri, 19 Jan 2024 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ppm1Z6EE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A15524B7
	for <linux-usb@vger.kernel.org>; Fri, 19 Jan 2024 13:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705669993; cv=none; b=Cd2XO9PBqbD5dWnaUKZ11ggS4uckjMOoKdgUNFAMgTnhEkvhIZmhcN9Bq32Xcbe1BXaRGAmPS/ru30kLazSFW4jup5jLn54SHLsvajJWxZ32q4ngFwa6kcZ8JsY+ssUD3lpltrb73fiwJCDmbtOlsa0cj83KzWJxfuV/xIH6ys0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705669993; c=relaxed/simple;
	bh=7yYw3HdVIVKI+DaJfJQbGJ7vrjbPdqrzwB/L6EsGIkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IkEMJhIXt+XHn7sHo+A+O+5HFITpAEFNLGJfGvssWTlf0ZC1vqB9N9KRx5SlbB3MZvgdGxbGgYSpiraxsT65qm3iH5GjOmp4sBT+K/j97EZ346qd6Fc3hQ14bHZY4y4OtZ2sKuLvrq7pJyi3QLpszB/yR/MlrPNyzxS4sE6sRNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ppm1Z6EE; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5f8cf76ef5bso8852567b3.0
        for <linux-usb@vger.kernel.org>; Fri, 19 Jan 2024 05:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705669991; x=1706274791; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xHnVbdVJT4h/CWS4BWjRC7l/yCMSQb2yUYxDH3FTp80=;
        b=Ppm1Z6EELQ1HdOOhyKx2e6EXK5S/XQvbrA7BaM1qdl5X3z4ltkVx74bYiQeb5fGhr5
         f6yhfvDq9XJrZxies0+mmbMT7aS3GTIVS7Ex8CbFSahr3yfNmYfJmkpT3BFUdST9spod
         EkVMppeUIEeMD+OEGkSOTnqVHfHFTIArz1aTsMUZS37nNGv4SqGWnRZbNQxa+3mRC10Y
         sQwwekRNfOxmo7EGVjguwADeaktuWVblPcy/IH0MtsnmZiqNVbkWQsfY9JYmk3M8qXFV
         7Iao/Jqec8o9NJghuFKcDdDvwyA6zjtSAhZ0Bf2U6uO/3dWN5uP/8pkEGy2h946Vo4dQ
         22Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705669991; x=1706274791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHnVbdVJT4h/CWS4BWjRC7l/yCMSQb2yUYxDH3FTp80=;
        b=p55FrDM1Bz2i3oAcghvgX9E6ku93rNOoRgTjH2qXwSA4YRk+L165sA/RW5ObK9W6q7
         6GGYQ3cDeTq4Rb11uxEODN6UaxnQQF4cVQykP38QkUvr4ufan3NQoEBJVGcecMLz0fml
         BGhr68DkCAf/geBdljEurTMSFRa6cTZuMz7TtlvugkWDhqwRkHl2v7QlcO2+o6+buvtv
         iQms8YbjD+OnANb6G2uYF8D4+SWenhggflBBNvPsqnyOvhF4n+lr0n0pquauZJ03+r/y
         bLgJvKi8F9h8GjCGMrihPi5FzA3HSvnF6aQnBayuu5GHu0vv0PHwf2yp8lCl26oUemwU
         q7lg==
X-Gm-Message-State: AOJu0YzjSMg/3mBJE8qnRuM7fVaPCtJRO1JcpJe8E+bazLZFovcT0wc4
	xJY7rA5vvUSXcPsEej2fGqRqNu8H6IWZ5AV8yVN+sMfji+oN4DnXYnGZGqrz+Bhf+3YEuzyQX2x
	p8hqblpgjRwNYzuErqYZQuO1J9fMMN8lry5kujw==
X-Google-Smtp-Source: AGHT+IHfqnIizJU7bNVjSP0/AXHYr1nDGF7BowSr7g+dg3LcGz2IfpYeTEym8tB3K+krwyb0bUD/3CD8ALbza0lV2Kc=
X-Received: by 2002:a81:8047:0:b0:5d7:2c6b:623 with SMTP id
 q68-20020a818047000000b005d72c6b0623mr2678702ywf.39.1705669990951; Fri, 19
 Jan 2024 05:13:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240119125812.239197-1-angelogioacchino.delregno@collabora.com> <20240119125812.239197-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240119125812.239197-3-angelogioacchino.delregno@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Jan 2024 15:12:59 +0200
Message-ID: <CAA8EJprHsBPOAA-M6Wk=maTCnJqORo+mLcW_0N8_+QRHYwLQwQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] usb: typec: mux: Add ITE IT5205 Alternate Mode
 Passive MUX driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	heikki.krogerus@linux.intel.com, matthias.bgg@gmail.com, 
	neil.armstrong@linaro.org, andersson@kernel.org, nathan@kernel.org, 
	luca.weiss@fairphone.com, tianping.fang@mediatek.com, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jan 2024 at 14:58, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The ITE IT5202 is a USB Type-C Alternate Mode Passive MUX, used for
> muxing the SBU lines of a Type-C port with DisplayPort altmode and
> also providing an orientation switch.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/usb/typec/mux/Kconfig  |  10 ++
>  drivers/usb/typec/mux/Makefile |   1 +
>  drivers/usb/typec/mux/it5205.c | 294 +++++++++++++++++++++++++++++++++
>  3 files changed, 305 insertions(+)
>  create mode 100644 drivers/usb/typec/mux/it5205.c

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

