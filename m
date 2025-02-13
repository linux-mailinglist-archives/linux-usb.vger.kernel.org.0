Return-Path: <linux-usb+bounces-20606-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9C1A33FF6
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2025 14:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07CAD1885AB6
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2025 13:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAE223F40D;
	Thu, 13 Feb 2025 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NOlZSPUz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B133123F400
	for <linux-usb@vger.kernel.org>; Thu, 13 Feb 2025 13:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739452254; cv=none; b=I/H4RMZSkHRcYFXVoe0xCciLEDGMoa50644wpY02bjtxrF4Lh+sSPQImFCluCr706N8dkbS671iB4FAXqWxwj/27hdKF1ToXyyYK9bqHgtE3QBurx58//W/GDPaoznbJTA3eiloqKUn9f1kPnpimfhOayUFsvLvMQgkChEzh97Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739452254; c=relaxed/simple;
	bh=qMMjTpyfYyNonkX2A1Aa7fVFvWhTsO0Ng8lzu7ZL8r4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=isftbU6ploz/uU8VxXBgC2ZsdYe85yagT0BfOpFrpT1qJ3+DywVov7LMsq3BJD/3w9Fcds8/1Vk0tQta5kvAl5LBcOVcFYvzcEwY/SKqRb2DSEQHJP9Ap2ckKheMErlFf+WSvujF7oc4NPENYE6fhQmFfjLyVbmAa89he8RJSrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NOlZSPUz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4395f81db4dso5128475e9.1
        for <linux-usb@vger.kernel.org>; Thu, 13 Feb 2025 05:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739452251; x=1740057051; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ClMOmTx9jS+uiaY2+KqmPclmIJuMGjlpVByF59oqFKE=;
        b=NOlZSPUzcZ51t8QUUAJTi7ieFpGPO0MFDfaNqnfPWo3TqXpSXQLPegDKSiDHIvewbp
         ab9dPCYFPWsp/mzmaeXYJt7E+l2acLZN0KbIgqce6LKlXPjLPsww9StCJxp2dOjOQtWH
         cGovNp1vvDyVzTFnGTozFG7M3fvfjjdIQvb2+88kdlCPUgNY1lyR/oNvrzAlRY3Gg8/q
         FXplAoo4ppgSJF6x/kTv9XxL3DbbsQkFF9SXK1ilpHnejDxM8sqvyG6JYRtjRs7b+UK/
         NLg8rgYHNycH2AhqnhbYFjDeLZa8+kPk5d5aFtSMVcDEI+aCItwJbg6UfBS+OrACYCEz
         z20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739452251; x=1740057051;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ClMOmTx9jS+uiaY2+KqmPclmIJuMGjlpVByF59oqFKE=;
        b=t9j0saV0qeX371FikeP3GSDioaqfoucYd3iWORLa3+hwG/jPb7VbD9fmpcKjMwS1m6
         TahCR3PafIfiN+vZTTERNF6c9kHOM8On9RRUyqRK4fdxrVtD9wiJHIa9v/f2n0VtWnBi
         dKq7vrohqX5hh3FWwcOj9i5mp9MLtW/3kvucEBeSdlB/YXdt2udezDPuo7eItSYs3Nco
         FsZ8hSnUzajjdNYpgxu7885+hmyI6x665nQgMOEEhy+1Jm3fX0zU92K2u287mE00hFkr
         QxLrLsFfRbhTOu+hqWjNrcAwEqMcPme4fV1oJF2Swaykht87MFFq95/O5plUK0gcvPEp
         O3UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiu75VhGPO66hv/1wqQpPUInJb5Iif0u8XO4wDb0rdJ4QCM0db74hK6cJ7OpuB0XFe0uxwYjJwhSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhkMT+eq9HSO2oxZLQ93Z2YYKh1FI9z3ZWM6S0tghzXNfFNEe3
	0AfJwWHnnJyThevBwGMvXvq9zDrUoRhaj4GEQT9qX0bbrOvF0qf8ozdm34FuZlo=
X-Gm-Gg: ASbGncvUH8WtFtjNOd4OBGkDxRkKJQl+aeff+ld4h0imtYm6zeUbBW6C1JB9OO3Pwx7
	f9ZdmT+EcvwHvN4xW2o6pCn9YhLsUWa2l5AT1/A4AJ8y9aHpH6yt7yosHc8MMzbcjaeI97ShrZz
	gmExuRauDpOFyx6jGXBCFiq52VUJAyelV+1O/KyArHT2+3792oPLMNf5TqE44dHM9i6W3pIrI6t
	QKuCOdxYyrGBAE+tH4zoE/trMzJ4SI5BXvslT3Cc9QH6v8jhD9VPq/NHljN8NcogO+wt5ZgQunr
	O9Jld6XFEDOJBLinIRs=
X-Google-Smtp-Source: AGHT+IHyBYF0/4Gdr3ZUYIjivzFP/lqbVMmvKn9sUMf9411Sd9hB+Kyd7Ye15ESQaYuZJjC4IcO6qw==
X-Received: by 2002:a05:600c:4812:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-43960cb35dbmr29034975e9.0.1739452250944;
        Thu, 13 Feb 2025 05:10:50 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b8471sm49019895e9.37.2025.02.13.05.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:10:50 -0800 (PST)
Message-ID: <e5855e6d868b60277c24df01b2f27d8736301932.camel@linaro.org>
Subject: Re: [PATCH] usb: typec: tcpm/tcpci_maxim: better interrupt name
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-usb@vger.kernel.org,  linux-kernel@vger.kernel.org
Date: Thu, 13 Feb 2025 13:10:49 +0000
In-Reply-To: <2025021323-opponent-strategic-a27f@gregkh>
References: <20250213-max33359-irq-name-v1-1-1900da7a1e79@linaro.org>
	 <2025021302-malformed-captivity-e862@gregkh>
	 <58af4b607adbe74725d4869f8f5a09cd5d3be2d3.camel@linaro.org>
	 <2025021323-opponent-strategic-a27f@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thanks Greg,

On Thu, 2025-02-13 at 12:56 +0100, Greg Kroah-Hartman wrote:
> At a quick glance, tcpci_register_port() is called earlier in the
> function, but when you error out here you did not call
> tcpci_unregister_port().=C2=A0 What else needs to also be unwound?

This driver manages everything using devres, including calling of
tcpci_unregister_port() via devres:

        ret =3D devm_add_action_or_reset(&client->dev,
				       max_tcpci_unregister_tcpci_port,
				       chip->tcpci);

is done just after tcpci_register_port(). As far as I can see nothing
needs to be unwound explicitly.

Cheers,
Andre'


