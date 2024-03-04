Return-Path: <linux-usb+bounces-7444-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB5386F7F2
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 01:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA50F1F21206
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 00:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAE664A;
	Mon,  4 Mar 2024 00:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mlhNUmq/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FF119A
	for <linux-usb@vger.kernel.org>; Mon,  4 Mar 2024 00:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709510913; cv=none; b=PyOjL7n6eopzcEACu3EpSMfibzgcn3V1rlGzpLNo6vPXpktNDIuFD1BruFVqNWAKQjbFg3bOuYG+yixPbcOvZ1AfR89UqGDt8w/fPjLS1jvH33txSHiVZIWVHZTm0N+eZuYMJhKMd8TjaOk+qu/k4dk0olhgNwqoePmz3GirfGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709510913; c=relaxed/simple;
	bh=rawqDoe/Zc8urdGoPhWWMHRmf31BkuUV6Xqj11OWaBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNCir8/cyrCEU3UODglCr3xt4ZqgHCqf4To4GJivZdZybP3O1WWhZbJ5f+UZpNlkcuvocAZgw7KfRLygwUuemQMF0bG19Tu6xq1NxSfjcj4pPuSsU6X8XbhDK13gjsOMDCvVfpwpiBMroqukWCRNAuN44oX00sxUTDAUQd+nQm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mlhNUmq/; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6098a20ab22so17719437b3.2
        for <linux-usb@vger.kernel.org>; Sun, 03 Mar 2024 16:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709510911; x=1710115711; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zscouhjzoZJflbI2y1vMzZO0ByOgZWZyvByc5tIWOdQ=;
        b=mlhNUmq/hfFOelS6eWAULk0UnUUHxNX1otuvhOKo56qpeqQUENRW3h/CEV6eLTnBVX
         XfTWPObm0xaBZSlZfOMC/jb52oaHaQIU1hLYk55+L4tIOCcYS4wTNsotFNCBw8EzUYah
         1NABLke2J7KrOPYRI+uYkCy+arnkJJYatC3rESwDl4JuIB1AIfiICx4lKzXv6v6QZOg4
         vdYBgBjFkf9djUBOq35krC57318UICG9IxyZDGBlj/RId1Dm+p3L5j17vTbwqeZFRiDf
         eNZAYZ3CHTGHMahz9jQmFXmn3gRTSDiA4AyiKii8spxj6XFKqmZ54Y0cyI+1jwD+L4uS
         phZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709510911; x=1710115711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zscouhjzoZJflbI2y1vMzZO0ByOgZWZyvByc5tIWOdQ=;
        b=YQJVzjDTByt62sjKkqhxgMWPpo4o5QusPAaCqAAK0cBovCxNTEoKk6TeX4+XFnz7IN
         i8VE+PQK77QTYsx+l2ZpxpXoWI3RkKbL5ONBAw3JDmjKvouCluNBZ2vaZU8qK42DY5n2
         ShFvCVxDtNS/I0Xtt8+L806yQwwF04LUeN0IlFZU8E5NY7vdiP5aH+WinkCrXxzP7DIw
         ND7M+Yd4tNbCPMjWPGLIDw2SnOe3PSpbZVlgwL3+/DXwrNxRGxf/KynQItOB8RIlQUsj
         2WO48Vh2M5lNI3oatepYQF2y13++qrRNgGdH/CC4+8UFOa3eDENGugCWvZVlGbLOw671
         QdIg==
X-Forwarded-Encrypted: i=1; AJvYcCVIq0fT0sJrqNezZYT0Ci5Kv3uQDaTQmTAj8RF4nAQy7xPUqef5jigbFOLhKrzCBAOiTFrf/AxP1PPHmI/4GJOtjpshPt8sVicD
X-Gm-Message-State: AOJu0Yzm6isOkFAPQW/mIkyoqcvI3UuCI7VbVRXCc62xp9Reqw5Li3Pt
	0qtPgy+mIgMekq2Ze8FK5LGbYsqhj4ftCj1ptud7/vqZA1vNPq4s+EGwvcJiIu6Bqib+nyLSkTK
	Hyn4ENtKxgUtvSvX3+jKMXnysOwxKxUOFcj5RCA==
X-Google-Smtp-Source: AGHT+IFUAS/cUvCXc4GIKxWXH59+ywTnirWoY7ZW+DW/gx26LtydgU6IAVpn23iYbVKnXLkhh+r3R525o2gCAKbcgUo=
X-Received: by 2002:a81:e945:0:b0:604:a9c2:2a17 with SMTP id
 e5-20020a81e945000000b00604a9c22a17mr7954801ywm.45.1709510910896; Sun, 03 Mar
 2024 16:08:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-pm4125-typec-v3-0-fdd0ee0465b8@linaro.org>
 <20240221-pm4125-typec-v3-2-fdd0ee0465b8@linaro.org> <CAA8EJpps9EPCgwBF8d8DbVzSZQ5tbEnj3RyGcJ=ua0eigDWQzQ@mail.gmail.com>
In-Reply-To: <CAA8EJpps9EPCgwBF8d8DbVzSZQ5tbEnj3RyGcJ=ua0eigDWQzQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Mar 2024 02:08:19 +0200
Message-ID: <CAA8EJpq=Js3vtRQrUDWi1mOgL3C1iEsaAQs+dwHg=hLyE0U-rw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: usb: qcom,pmic-typec: add support for
 the PM4125 block
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Feb 2024 at 02:00, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 21 Feb 2024 at 01:58, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > The PM4125 PMIC has the same Type-C register block as the PMI632.
> > Likewise it doesn't support USB Power Delivery. Define the compatible
> > for the TypeC block found on PM4125, using PMI632 as a compatible.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Making a fool of me, for v2 there was:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Greg, as Mark has picked up the vbus regulator patch, is there a
chance of you picking up this patch?

>
> > ---
> >  Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> > index 6c0c6b337693..5527a4bc9388 100644
> > --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> > +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> > @@ -14,9 +14,15 @@ description:
> >
> >  properties:
> >    compatible:
> > -    enum:
> > -      - qcom,pmi632-typec
> > -      - qcom,pm8150b-typec
> > +    oneOf:
> > +      - enum:
> > +          - qcom,pmi632-typec
> > +          - qcom,pm8150b-typec
> > +      - items:
> > +          - enum:
> > +              - qcom,pm4125-typec
> > +          - const: qcom,pmi632-typec
> > +
> >
> >    connector:
> >      type: object
> >
> > --
> > 2.39.2
> >
>
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry

