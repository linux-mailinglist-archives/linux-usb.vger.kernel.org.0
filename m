Return-Path: <linux-usb+bounces-17933-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 769439DB5FF
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 11:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D69A2811C3
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 10:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AEB193435;
	Thu, 28 Nov 2024 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EMkBem3L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A1E152E0C
	for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 10:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732790994; cv=none; b=TyfM99AwqpriGKwnz7+9LnLT9MCSG8q+0dLzuYF11qS+uG6rB2vMcCmaDdtLXANfHAhCREZo7jekkOUuga9QTWdb1700j0LqL4xYhd6dHzgiFVKLNRhH9JvxoFGtc5JXaLOZkYo8zx0w0DzkKXzjl9yfDYenVMKXSJJaImgvCF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732790994; c=relaxed/simple;
	bh=S+6oOaM0s6Tu6ZxZFSf1VxM7YfIeZpwsBu0bRCHSjm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SpeCLJi3Qpof3tQrJRq/W5FrqwwbklEVbVx++r8maYMSVCM5k4fqaqh6C+7/3DmjuwmsDwkEqj1VzwN8CyNT9JY3M0iX/674sfW28tbVdf5kEV9UDo4yZ1ZOVGN4ajdmIrYWCwbDHL+u1Sq+BA/chbguawvaRUslO8CP99HsCPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EMkBem3L; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-296539a58b4so439421fac.1
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 02:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790991; x=1733395791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+6oOaM0s6Tu6ZxZFSf1VxM7YfIeZpwsBu0bRCHSjm4=;
        b=EMkBem3L6R0fo+5kuXSurd2vWNU1w+wY/pQ3KTyRC0sZFTY76LPLkMOsNvpw+aUPXx
         4fwNg0Zg6vHfjXXluu9ChGYJKlt3nc7P/m+GaKthL3Qw25SyzQC26MHqYJZYq/6lFTs+
         rpYzqo6Yt25Yg6xYJ02qcxCO6ypxE78Ff34efkqpTwFZ+ildJcDMGh0HUp2S/aOdr5gb
         k10l+KhNiPjWTACWY14TpIvejNNZj1pxugwVxlIezhH8uwYA6XlmV64cSm9L2gz09WJ+
         B1ijILoIOPg3OKLrdvoGXpSKmsqlf0PFxkBT9J3RAiFwJ2teAcV37S/erZVp+AAzCzYv
         UOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790991; x=1733395791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+6oOaM0s6Tu6ZxZFSf1VxM7YfIeZpwsBu0bRCHSjm4=;
        b=LTXu0keAbf3ZiaqmZdkRrMkPqo8c9A+1888M0iuBRFZAyD96OkD+IUlcepi/ArLEBK
         SEz1KgTeoGiWgInrtYCX73QaxeIe+IAZOciUu71Z7RnZz2eJnUWGMqoEU3j8YKvOvyGe
         uZwfjim127pWfS9f85WJcwUlicSOit96dpZBGj8PziZ3YECo2TKBSZUil6JYrGfqV74I
         QlSBJvNwPI5UV8XNKUD3H6f2cqkQJw/4uJ5SDjMnydH57mMfjHaJPr8vTsgtu60tHMwF
         L07U3KVk1moHm2sdRnB6hq3uJWzPImembzF1XW5twnqTc5E29N7dK2PFI54SiQPLuVXL
         Nl/g==
X-Forwarded-Encrypted: i=1; AJvYcCU44RUG0U4jU+W56crlEx25HilymkxcWsbe4qanyZq9/EI+eF1B3BWDqCTwq7CZ0aDP9AhRSP2ANk4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Vrtt3R3p+/ixQeofxZeGTxwL2qsVnX/mnAGiLXubhTga8+jn
	RTsNM3QMLnu81TBUuG0W/foCFdoOs3hFbknnuPvW0GqTFQxqxDxe9PDGCFhhMH3yGD+FM+lsqAY
	v9dnBuSf8OB0X8aywZVpSt68d8sOpb+WFHHJepg==
X-Gm-Gg: ASbGnculsnlxIaYXhBUQbWt2B5s5ITKRyhof4ZbZEft/cITenDFIGg9w4xNGWp/rtU7
	4ra/uhytFNEX8EYWxreWpyCcRitFoxdkp
X-Google-Smtp-Source: AGHT+IHSW4AauQXzPQcYvXTGYQGOqaCzi/aJx5YRC8Z2JJs3/8I5KClVLNxBsZmq2QaZI74lTF4hFwtZQD27MqcFr60=
X-Received: by 2002:a05:6871:e7c4:b0:29d:c8fd:cccd with SMTP id
 586e51a60fabf-29dc8fdf378mr5912643fac.2.1732790990078; Thu, 28 Nov 2024
 02:49:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
 <20241127-gs101-phy-lanes-orientation-dts-v1-1-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-1-5222d8508b71@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 Nov 2024 10:49:38 +0000
Message-ID: <CADrjBPq3vJmHh9bnS0u=d_aTeaRH8Z00JqgBfkqjQQ_Fv14xxw@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: defconfig: enable Maxim TCPCI driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jagan Sridharan <badhri@google.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Wed, 27 Nov 2024 at 11:01, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Enable the Maxim max33359 as this is used by the gs101-oriole (Google
> Pixel 6) board.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter

