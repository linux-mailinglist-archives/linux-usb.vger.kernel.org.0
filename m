Return-Path: <linux-usb+bounces-13591-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4776A9560BF
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 03:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78F9C1C21292
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 01:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B729717C77;
	Mon, 19 Aug 2024 01:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sNMNqZw9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F199B219E2
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 01:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724029778; cv=none; b=Iwd/NKAI6AbRQNSfNrEOgkRP1AG8t7H6MJuzNw9rTkPYp+rBqr+OQVXWnUi1u51g6OeuTcWMaGQpm0gj91EcrKKUY86bEq9z7r/VpVYlodDEIBLMIWH8xhFjKvK/cfd9sk1hiXvMeabrVN3H/heqPnPmKkXmhy9yaxfwbA3I6io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724029778; c=relaxed/simple;
	bh=229QKOgINXpB1DLfmiddXIoZk61vGMomF4TiY+ANp0g=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=tV1jTdeZY+gupvk3v0KIpRLuCYcV1Tt8Z/RYTCVl7Xncfglzla2wxvJxhLrDR0H8f/I9dzR8I4p7sKJfeYEdR2d/sxbFR07YQsQPSO0T7rgeBzIGhfgJR7VPdmv8Ug3CiWA2c4pwm2zMsBSNvShqW3aw2xGpMfLdtj7FvzCYg8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sNMNqZw9; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3db18102406so2284917b6e.1
        for <linux-usb@vger.kernel.org>; Sun, 18 Aug 2024 18:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724029775; x=1724634575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=229QKOgINXpB1DLfmiddXIoZk61vGMomF4TiY+ANp0g=;
        b=sNMNqZw9PNJ1W1fB0MAWQJ6AbzHMRbZgIiP3ltn2JgAhlBolgfztTUOcIOzS/rQKQH
         gj2Cr8+bgW+yT89MEp2w0paaKCp0US32L9W9Qf+ZOUp8f4OIiREkRmoWqBxlvlrNP373
         QXB9dVff+BXOpWU5QPKmvs8XfZamsIUGHEve4DCv+reb58RUOvi1GYhoa+VdApFGlrJq
         3fy4YH9mLZWcrfiqv8j/8vHn7C67QMKQ9Qhp8S823DhQRQkq5tioMsFYBXCisiKuOuFG
         Yavc3RCz9qsT93R4l6ON/YiRi+lwQDK5OQDOeoZI6QHX/2WQeK0QW9Qx7iKksZldo7mF
         QigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724029775; x=1724634575;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=229QKOgINXpB1DLfmiddXIoZk61vGMomF4TiY+ANp0g=;
        b=AYu5LMEM6FP7bbRo/CTeNtTGyAFzwqt/lNlJ00U5WcoRrhP+Pmzb3uKx4ugoneq8Ac
         XTwEi4/Wc65tXzXK1DIxW2MxwJosQ7KjdN0+CsvkCn9Aul6R+dWUEs2tO6QQNl+nJwNG
         VoT8H91IW2/YuSI/FcMqKHlb/lp/JSxQ78noP/mkRwieOv/+6+pHL+KorU0VfsweHXuZ
         C17wpPNeB1Uk8aJbt6KmUCQ60kG83tHXgibVrzksZ2s7HmxoHocRGQTkbOcj1xHX2e1q
         GWljRc5Rncp9r9Jo2dILpQmE612FnWniAKyZgeuAtrLD2QvbahEAG8yXXzQmV3fplkyq
         /w6w==
X-Forwarded-Encrypted: i=1; AJvYcCVpSWO9+KbDd6HZfjGkCTMLOV0mYAK8ztOgFCSDPVLiWfzKhWsRBKHKeye8X75qzuMZDRmYD0fpj0OpV/yFC+DH+LtqjxKj968j
X-Gm-Message-State: AOJu0YywNo8z9z3eJkVy6k+FqTgRfZFCDi08XdvlfSkZFUKGsG7Yjh6r
	6mQTeSMivV/Y67ylZrPyQvRpEHuNdGu4Zsb1FE3rBd4jf85AWVD51NbwWDXE/Gw=
X-Google-Smtp-Source: AGHT+IGTYL/ET2X9S9B3t6wtBeF8ZVsWQaJ9p+D3ws8liHGW+PjXQgghUYwyfXs1KZE2bOskDkTayg==
X-Received: by 2002:a05:6870:5254:b0:261:9c7:a0bb with SMTP id 586e51a60fabf-2701c590a08mr9856895fac.48.1724029774931;
        Sun, 18 Aug 2024 18:09:34 -0700 (PDT)
Received: from [127.0.0.1] (node-bmc.pool-118-172.dynamic.totinternet.net. [118.172.58.212])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127ae6c0bdsm5890191b3a.90.2024.08.18.18.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 18:09:34 -0700 (PDT)
Date: Mon, 19 Aug 2024 08:09:30 +0700
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
CC: Johan Hovold <johan+linaro@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Amit Pundir <amit.pundir@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_3/3=5D_soc=3A_qcom=3A_pmic=5Fglink=3A_A?=
 =?US-ASCII?Q?ctually_communicate_with_remote_goes_down?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20240818-pmic-glink-v6-11-races-v1-3-f87c577e0bc9@quicinc.com>
References: <20240818-pmic-glink-v6-11-races-v1-0-f87c577e0bc9@quicinc.com> <20240818-pmic-glink-v6-11-races-v1-3-f87c577e0bc9@quicinc.com>
Message-ID: <410989D2-7358-4285-8B1B-D6EA5403D313@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19 August 2024 06:17:39 GMT+07:00, Bjorn Andersson <quic_bjorande@quicin=
c=2Ecom> wrote:
>When the pmic_glink state is UP and we either receive a protection-
>domain (PD) notifcation indicating that the PD is going down, or that
>the whole remoteproc is going down, it's expected that the pmic_glink
>client instances are notified that their function has gone DOWN=2E
>
>This is not what the code does, which results in the client state either
>not updating, or being wrong in many cases=2E So let's fix the conditions=
=2E
>
>Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK dr=
iver")
>Cc: stable@vger=2Ekernel=2Eorg
>Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc=2Ecom>
>---
> drivers/soc/qcom/pmic_glink=2Ec | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>




