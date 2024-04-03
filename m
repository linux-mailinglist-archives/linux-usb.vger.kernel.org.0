Return-Path: <linux-usb+bounces-8881-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A4156897B91
	for <lists+linux-usb@lfdr.de>; Thu,  4 Apr 2024 00:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C0BCB2601A
	for <lists+linux-usb@lfdr.de>; Wed,  3 Apr 2024 22:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B55156997;
	Wed,  3 Apr 2024 22:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g8EQiJSK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6D215697C
	for <linux-usb@vger.kernel.org>; Wed,  3 Apr 2024 22:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712182945; cv=none; b=rbFoAfep+2Te6FbiLXyFZ+gTy8N1iSJ3rztbAuQvVkU9ej1JQZIUMPT/v5Yl5PeT5mijbiRYqs06sheMA/onDpGncl5LMGJqx+wFiQ3/K9y3FUJM9OaoI7y5STzgsqtRiLAD4u3m2D7VfIg4JvHzMYP7vjhXifdsxBUiP+6urDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712182945; c=relaxed/simple;
	bh=8t3naentFxM+AS3RtXGPq3dvrdYW71Xqe2UpBOIdI9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iaA6xF0R43YZ9zwbNoDnOpWNDh+eYUP9FClJPKOV0nXVx54wvz6JMTbbxo/9hZ8rw8tSjN/gzxd8hXlGwqVYqWXwIkJN/9q7BXcWIg8MRxG1IzSd5ppbYs81zLzsNomuC/NYBCjAFQnqey9Vq7ZJzPD67hp7JtZjRO+xxkoZtDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g8EQiJSK; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e782e955adso288907b3a.3
        for <linux-usb@vger.kernel.org>; Wed, 03 Apr 2024 15:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712182942; x=1712787742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8t3naentFxM+AS3RtXGPq3dvrdYW71Xqe2UpBOIdI9A=;
        b=g8EQiJSKflI5b/aIAvc3CcFauGsBLsxla5/1VzMbGKnSrKiSAR55HyZDlv6jDBPj2C
         0zSt3gN96BV986nCNpN5QXydXTeEp76OtZOo/hYxlFmE6eHfsbj1jAWtBA0rkpH65X/F
         eFE4zL9zMgcl75+H2U4XVa2JjNrqj+tlejsbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712182942; x=1712787742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8t3naentFxM+AS3RtXGPq3dvrdYW71Xqe2UpBOIdI9A=;
        b=K4pyKy10Z7Pt7dqZRowId5fFFsN6q7TGgraNRhRKGyzcfQUOMD0iRKf/TOYDSIzbyb
         qdwMqqrrFwoFU6ME66HgDzgj48fvacvYDu9rTv/pqgEp/rc1ZCKY8kA07V6iyUAo7AYx
         3p0n3BdnEZ5WDmX8DrYPZljp67VOQoPAQc6iMo4VZwU8PMHUefD8hR/JB/tuA6Nn6Syf
         OZMG3k/Me44v3tGjzfXpoIpK/WzhT3X3MIAG5UF2IJims7cX/UdYKLXEu5wisvM6GaFn
         fbF/LtDMilJ6yLy6z9696tDP5KQa8A/yDvwPYgTKYzXb5hu7T9gl1qnT3S1xZlRhS70O
         /A1g==
X-Forwarded-Encrypted: i=1; AJvYcCWJq8SDQuAxpzwtswMdjWJRbEzfvS/K07EnKK6PMKGhBTdLVESyrS3nZITTwrdtxip1uhBO/B4D3JU1JvbBgox5LfSSy7MfRxx/
X-Gm-Message-State: AOJu0YwWs4YBeSmyi/AljAcSxI6g1Kt86QlsaLBpTiIuBW0Aqp57ttTY
	vLaH8ERdIRmSwd88Gh+ZgHpGhqoT7s524K7hGpHfklCNP6gALSKcmryt96QcilDy8cPQeQD33KG
	nMG13atCj64MQCFKdQ9Bg1NIGMzL2/JgcRcq5
X-Google-Smtp-Source: AGHT+IF0pyNbDc5esUhGnGF5JxOyl9/zlljXfso5iU4MajLn0BUuueWKvVRUX69RacB2FaMm84NuPvyEPXR4Y01vDxE=
X-Received: by 2002:a05:6a20:7352:b0:1a7:1e1c:3031 with SMTP id
 v18-20020a056a20735200b001a71e1c3031mr1328275pzc.36.1712182942479; Wed, 03
 Apr 2024 15:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403-ucsi-reset-delay-v2-1-244c175825a4@chromium.org>
In-Reply-To: <20240403-ucsi-reset-delay-v2-1-244c175825a4@chromium.org>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 3 Apr 2024 15:22:09 -0700
Message-ID: <CACeCKafbnsnvk1pbghf_eRN+RV3_7Q46POm2hQxW+gSt8a5z5w@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: Wait 20ms before reading CCI after a reset
To: Pavan Holla <pholla@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pavan,

On Wed, Apr 3, 2024 at 10:57=E2=80=AFAM Pavan Holla <pholla@chromium.org> w=
rote:
>
> The PPM might take time to process a reset. Allow 20ms for the reset to
> be processed before reading the CCI.
>
> Signed-off-by: Pavan Holla <pholla@chromium.org>
> ---
> The PPM might take time to process a reset and set the CCI. Give the PPM
> 20ms to update it's CCI.
>
> Based on the discussion in v1, this should not slow down existing
> implementations because they would not set any bits in the CCI after a re=
set,
> and would take a 20ms delay to read the CCI anyway. This change just make=
s the
> delay explicit, and reduces a CCI read. Based on the spec, the PPM has
> 10ms to set busy, so, 20ms seems like a reasonable delay before we read
> the CCI.

The above information is helpful context, and should be included
in the commit message, otherwise it will get lost on patch application.

With that, feel free to add:
Reviewed-by: Prashant Malani <pmalani@chromium.org>

BR,

-Prashant

