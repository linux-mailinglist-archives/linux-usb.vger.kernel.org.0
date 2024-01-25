Return-Path: <linux-usb+bounces-5493-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C9E83B5DE
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 01:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B7631C23245
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 00:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7720B38C;
	Thu, 25 Jan 2024 00:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oOBj3rWK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BDC6FA7
	for <linux-usb@vger.kernel.org>; Thu, 25 Jan 2024 00:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706141293; cv=none; b=ZrmiiqphBQa5/tvmxG/ruociIAaHrV9ZAtDd9fZEuabxawL8Sa9eTkLM1tJ07RVm+XP76mMYGAd+MD006P+Rc9gcND4b5QgzwR1tFWVMA5BSlfOyduUCfrc4yWNMLEgSHsvFvAicgqAAJOH91bgaUuodsqQJQTEQWWQ6GfXHpqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706141293; c=relaxed/simple;
	bh=sFb88MTt5iOoIb1ympSk+g+GZOjP6Q895N8Kxxce+Js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e3T3Ezp07hkxQAdwCcW2akSYsk+p988kWDA4g5ctYvS2rm/KFCkrfRa0dM9B6wgbj/jQey5g1Ec2cfwH8he1X6fqiAfctJkvgFphavMDCuKtVJfVBVQ5I9oytsyY2Rb6mP74ao0fdZkW8XmR6tl4ycb7Uu1atLDBcAQLjDtU3gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oOBj3rWK; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5ffdf06e009so38164837b3.3
        for <linux-usb@vger.kernel.org>; Wed, 24 Jan 2024 16:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706141290; x=1706746090; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a9zJESR6jJ2yZin+7bBkOo/7z2GEvxg+haubJzAIAaU=;
        b=oOBj3rWKXZw9LxauWR94xMecJ14XSzh31RfCLqWD5xmlQzJwnK3JNQEF9wH2bZBa0d
         cKtN/0L9D6jy1LKVThdIDcm5YjX8peJry3Ozap+gog4B9nV3ApzXilKX/qS9zD2MYbP7
         zTPX6jHjVZIfT879EyqHRefj5YycJir8KvzfyDbV/kQB2fQ/lcqG2UEmyT6NCqSF4ocy
         6n0exuCrifxZEwLgCvwOieWRQ/Sps43gQSYNbxXhOMVynA4mO3bWIiv8VCQIJt3oYqKM
         fFNI2ZE3lD5D9KAKqslaOdvyw6Z4Dv0B0f9ul5B1V1kw0tJbtMmCAz8iOyalunepbybh
         vUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706141290; x=1706746090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9zJESR6jJ2yZin+7bBkOo/7z2GEvxg+haubJzAIAaU=;
        b=LVZXNUAvkcJ2ojh0tgHhDvQ+RW7kIxMQeCH8rhKeTdVSiab5ARC5x22hFIDLKaeTy2
         zoHT7VSMgqVmo46eGiMMtGuXGml9Y+R5LXdwrn6zvmL0EK/l4GSFnFcifjc/WHyaKAxr
         kci7DvxnKBWxTcuEs1aPFG07cga2dJkwurbRQAHBmEeZD2j/ffJWDnpy35lHjK6IMHto
         eZJUTyTmiz+/PQ4HkuVdl2zyWYBHWfFgQwyERN3mfp/aYmZNX3FBR1MXnWqy2XxnXN60
         MaHREmtBoWnNZDah3s7VrPx27M5L5S9GAkFvSozuWm3XsWNoFPM3KF4Q7H/I1pXPEqVg
         Btuw==
X-Gm-Message-State: AOJu0Yxrz23LjTd2e7xYNXn+tc46yvxA2FDMGg7FPfUFSrGIQoTl3iL4
	mkOLIGZv2VQLvoxJLBk8pAp9xOvyjgvS269iP083NgeI+sFPvwRliDmkFttZv/WVGBrYj3tXhPi
	JnhL+X3zYhFkQSt7l71ghcsgDEC1L63z4lBJVbw==
X-Google-Smtp-Source: AGHT+IHyZkzZsMBMHXjFP5m3KVk6oKNR1/dMvHgS5VJzm0aLrkrbyapIDbkoVi7IoS1m2aLUZozj3hOStzfoHFNh/+8=
X-Received: by 2002:a81:840a:0:b0:5ff:4d76:e2e3 with SMTP id
 u10-20020a81840a000000b005ff4d76e2e3mr1259447ywf.63.1706141290473; Wed, 24
 Jan 2024 16:08:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-9-182d9aa0a5b3@linaro.org> <2e07f014-0884-49ca-babd-b89cc90a16b7@linaro.org>
 <CAA8EJpqPqV_nHxxbo2Vzwcp__hvREjF3bhduGhM=7UpuOgBxTQ@mail.gmail.com> <ZaaRZ/xi8vyIKD5d@kuha.fi.intel.com>
In-Reply-To: <ZaaRZ/xi8vyIKD5d@kuha.fi.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Jan 2024 02:07:59 +0200
Message-ID: <CAA8EJpq3LAzrdTXtnCskc0Md1e39Yo1+AQLHmOBVfgax4HEjKw@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] usb: typec: qcom-pmic-typec: add support for
 PMI632 PMIC
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jan 2024 at 16:23, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Tue, Jan 16, 2024 at 02:56:11PM +0200, Dmitry Baryshkov wrote:
> > On Tue, 16 Jan 2024 at 14:32, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > > On 1/13/24 21:55, Dmitry Baryshkov wrote:
> > > > The PMI632 PMIC support Type-C port handling, but lacks USB
> > > > PowerDelivery support. The TCPM requires all callbacks to be provided
> > > > by the implementation. Implement a special, 'stub' Qcom PD PHY
> > > > implementation to enable the PMI632 support.
> > > >
> > > > Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > >
> > > Still not a fan of stubby stubs :/
> >
> > Me too. If there are better suggestions, I'll be pleased to implement
> > them. Greg, Heikki?
>
> Guenter, do you have time to look at this?

Heikki, Guenter, just a gracious ping for your opinion.
Probably another option is to read pd_supported (or all caps) before
checking the callbacks and then instrument all calls to PD with
pd_supported checks.

-- 
With best wishes
Dmitry

