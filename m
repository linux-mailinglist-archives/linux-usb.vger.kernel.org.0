Return-Path: <linux-usb+bounces-9400-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 540778A6F73
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 17:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11A6B284151
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 15:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6842D130A64;
	Tue, 16 Apr 2024 15:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sqG7xAiB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF25130A48
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 15:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713280558; cv=none; b=oZMKxAVawaW2mU10MvQNxnzmFKg2wsKy7zVxd8lMj6fqlaJZFbwiiCojQGwblt9F8LlkOBkGmi0h3pvffv2wpZOkizEySqli8CrCL5DcSMunowOp/pWW2RPrNvK9AFpxNxSn578fCUJYgtkXtqYhaHEOCUVIRwE4B74c+6yXmyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713280558; c=relaxed/simple;
	bh=zaoja2SjlH3NFx4QONthXCor2x9mlk5CiLQ+K1scUz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBXoYdi4u2fuH3uEH/lyXfpWm98fWfBBfI9E9nlt4AePO29qnhfoSsjpZ9hoSqRHGnLpK20Fi+utiGEFL79dBXJ5VxHwQrm4QRvK/JpX5yhfY+WKGr6Oqo7Be9U6Q14N27wsZb8EhpolXsuZKqqkn94dzVfFl99yp2N9rH/gPL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sqG7xAiB; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dd02fb9a31cso3889760276.3
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 08:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713280555; x=1713885355; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CACAUQHiKa/5rbKG2xHcEHJiwEEsgJJj1Ty5DFU18AY=;
        b=sqG7xAiBufKO9MSy4CNtb4R/dnuQBj/WQQd1ZDhHW5RFNsf270Y8LvKmVQSV2j181E
         5jlMU9yAKn4phbf8PJMcCQIqCXlW9iE7fzwQ+A/SF7WhydIMAKNrXOwkApaj+IMMVz5R
         ukOxWZ3e+6dFhWd+sfLafrqgbPgm1vSuS8O3Y9iG+AS1b8TX3YMsU1vEtsfAeJnt3zsY
         tXZ1ZVYg+s6Wr//6lswKwwm+k0cDr13Xxr+9Rz5v+xNuY/LJ/lmYOvDzOTF68kpuf4qw
         jfFVahHqvATudVf4QnmvhZPnF4J/PCbFh1RvgpzCdtgSeI3TSVI3ZaEvLVtxvXzzPy5Q
         dO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713280555; x=1713885355;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CACAUQHiKa/5rbKG2xHcEHJiwEEsgJJj1Ty5DFU18AY=;
        b=jzZxdX68xqRjAS4tpLcpsk1/5a7C+fo6k0imGfkLvL0pjAOzDZAQq7VQI5A7r+KTC3
         FswTp+bpSgkexJ2NOlkjZsN0nQX8Bi1y65L5nnD7OYXaHOmR6H6dIubhDIsOFyOPYoIl
         ZJG4N5rBjzmB0/Cdhv1DVR9FTxULzoAMw370YFXiGYrwiBsv1rld5qgHc3dpZkwa4/E8
         FLxMenb2y0eZaCjnx7iJ4Nfmp7PfpqrsexrBiR5oyhzE8Q3xvhbBCciP8tf5jUtHob6i
         tWa32idGYJCyV5W5fgXApZ07qbI+WcDpTbsXnR687wBVlMKeys9TXidffe2zEgkyEMSe
         78sw==
X-Forwarded-Encrypted: i=1; AJvYcCWTpBWMMB/WK6S32PVRDIl0i0GXdN/q7BZKgvNOA5x7+RGOR8PA0qgjd0yNparmHxjCL/zKsBZSOJ2EWwDh6h63V4KALVRzpxib
X-Gm-Message-State: AOJu0YwEsByzcaRJ+4CLZv4A4pG1d7aypFSGVVmvbCUbTUUq8oKeP061
	XdnMh65rKwgOCdEK+n8gM3ZE+OefuZa3ivhaZgYtEtHnKbqpkjRwfNQeqNixI9+PGLSUlAf6b+U
	N8XvUnFX+M6V8eMf/lpybDASyHlItxtvihk98bg==
X-Google-Smtp-Source: AGHT+IEn11qmsJXHPQo91cfYzFclr0ETZWeU2a6Li6Yzx9L65+/Jp5/Hvk01iKl8IIf8RphLlcqzTm9/ENY56Uymys8=
X-Received: by 2002:a5b:40d:0:b0:dc6:bcb3:5d8e with SMTP id
 m13-20020a5b040d000000b00dc6bcb35d8emr12080662ybp.20.1713280555495; Tue, 16
 Apr 2024 08:15:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-5-890db00877ac@linaro.org> <80a8b7d4-2dd6-42a9-8305-81a93ba5e6bc@linaro.org>
In-Reply-To: <80a8b7d4-2dd6-42a9-8305-81a93ba5e6bc@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 18:15:44 +0300
Message-ID: <CAA8EJpqVWEWkc+MtJWCtiz0CVnpgPT4RRjab50AwO-NZWi2vYQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] usb: typec: ucsi: glink: simplify notification handling
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Apr 2024 at 17:36, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 4/16/24 04:20, Dmitry Baryshkov wrote:
> > All platforms except Qualcomm SC8180X pass CCI in the notification
> > message. Use it instead of going back and forth over RPMSG
> > interface to read CCI.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Are we sure it's reeeeallly just 8180?

More or less so. Previous platforms used either qcom-pmic-typec
(sm8150, sm8250) or laptop-specific EC (sdm850 / c630, sc7180 /
aspire1, CrOS). Next platforms (sc8280xp and sm8350, qcm6490) used
pmic-glink and the new way of sending events. I think sc8180x was
really the unfortunate one to use mixed events.

-- 
With best wishes
Dmitry

