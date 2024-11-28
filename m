Return-Path: <linux-usb+bounces-17934-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 325A89DB609
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 11:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB2F0163567
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 10:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8869E19342B;
	Thu, 28 Nov 2024 10:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GuSwNG/f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A4D14D70F
	for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 10:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732791146; cv=none; b=gVY4UNLBmRFEO00ED2CLmREPX+GB4CbE4RW1XcKOB4zVoEkhG0MJJPWgS7mWGvKgvKfezDwBw7cWIpAwbLspVoe6wGmKTUsbJLF9RTXNV8XinzlrqBYzBIHOEid3hD4qxXdXmBP6JuzC4Zf+cYJG6LdGdTUbCZfjXZP9M9lhzv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732791146; c=relaxed/simple;
	bh=8TeU+tv7JrsndEEL0MAFURTZ0bIagtJxFoR3pCrar/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZVtOX3FErhOFzFFCwvoxu/0Lo48QbZQwMud9/9Lo0T658paxJnT6Um3p1VjCwacemBmDRVb2t31AC8LAxVlPkyWjh/vUjXJUARt4pQo9O6IHmnEtyf8xWvhkwz+d3CeKbrwBzcddnbpOEhT7r1cajXG6I1MMyURkprhIr+Aa+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GuSwNG/f; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-71d46995b34so358121a34.1
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 02:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732791144; x=1733395944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TeU+tv7JrsndEEL0MAFURTZ0bIagtJxFoR3pCrar/I=;
        b=GuSwNG/fjg77WtQNCYs7QNKypAHxDadLQ8uxjTsnE8GHWBpkH3E8w//UYmfbqIF9VC
         7tWo5UbRr1faHsp4pwN4MLln3KTIV2fzFoY4fAdxzuSXUDAMWjbbNqOsRo2peXYvgb5P
         KTmXak3xxjYZTKrBKlzq2cFJaOmsizt7E3Z8nYUwyTvNGrwuf5dm6pWT+6FNZ84rak3f
         bM6lNofylCSolLjRDd1G2vgccnuIEzE4RqfU8aefs1ygMAqL4mBBpDvb2CJpN1wkTO18
         zj67Uqg84j7V5iZPitNmn8hqifYCzbnZcE3WDGPaFdDNwU851FgRPpkfra1TDfVENc9d
         l26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732791144; x=1733395944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TeU+tv7JrsndEEL0MAFURTZ0bIagtJxFoR3pCrar/I=;
        b=F+O6P7thLF076auQW9Zd6p8EF3N/mbQhP4/LIvWYkr5iJ2RSdC/17oWC/VlzrBNZT8
         WmdZVx7uIG0saA1KebuRHbHSiPMvoVCLt2CX9ftzBUjkxNG9Lcm+laQV5SXG97l6pG+y
         NY21vZjUPhT4lhVvzlsln9WlsX8K3C3+um9NSjxn5yvDZ4S0HBj6eru7ba1eAPnBX1uG
         SS/sGQC+MZf0B68WWDzeO3KbJwPi7nBdgKL14i4cmMHukVEA5kWFYGl+EoCuWk5SLKqx
         zSubw9HI1Qlp+UKEsgJIU5RQEUmn7l1JUIiyK7K17j/PiHZ9LVrf/tJb8ldLeaFOLQ0z
         amCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmTGTkqyw/1ryNzSmzy6D5PcXrkj/+F5/K7Q9Xv5saBGhpr0gf7XDz10iOAzPuovCuONgeEVlerMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV4R6kEqNTgjHmQ3pHtXluUR4ARckXbyL8+cAk5QDS1eEqCUEd
	X6fyHb2f9qDuY+OyYGuzclxa7z/gk4IFhqDHUKAnsQikE2bvEy7d28SV62rIemhcN1Ak02mdS5U
	1xSg7cOuKDoouDhzfrNW1fWDjzPI8yKyiP0cR4g==
X-Gm-Gg: ASbGncu1nkoOjO/MX3V16n5fH7NVQ/EYk/JYzmWDEy6P6cMTK93EHXZnVq9eD4RflBM
	my3i0VidZ05SdL0CZwXZ0Ra8p7gRkssqA
X-Google-Smtp-Source: AGHT+IEe3DTn7WUrmyIboVCIgXQ/VYxi2uKjmWccnEGTGP4Hj1gIqkfk10m1pzmDQDSsO2Kqy7TSKyl4Kujutj7mbtI=
X-Received: by 2002:a05:6830:52:b0:71d:51a4:ed48 with SMTP id
 46e09a7af769-71d70c11a6dmr1359704a34.8.1732791143800; Thu, 28 Nov 2024
 02:52:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128-dtbinding-max77759-v1-1-733ce24c0802@linaro.org>
In-Reply-To: <20241128-dtbinding-max77759-v1-1-733ce24c0802@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 Nov 2024 10:52:13 +0000
Message-ID: <CADrjBPoa21ni02Gs_Lsv-r5GB-ufD19+Z09g=hun39w4oDYYeg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: max33359: add max77759 flavor
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jagan Sridharan <badhri@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Thu, 28 Nov 2024 at 08:51, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On the surface, Maxim's max77759 appears identical to max33359. It
> should still have a dedicated compatible, though, as it is a different
> IC. This will allow for handling differences in case they are
> discovered in the future.
>
> max77759 is used on Google Pixel 6 and Pixel 6 Pro.
>
> Add a dedicated compatible to allow for potential differences in the
> future.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Acked-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter

