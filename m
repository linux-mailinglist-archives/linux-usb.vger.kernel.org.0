Return-Path: <linux-usb+bounces-5170-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2880D83050C
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 13:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC0D01F25A5D
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 12:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47D31DFDE;
	Wed, 17 Jan 2024 12:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ndoVtZu2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B848D1EA6E
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 12:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705493874; cv=none; b=InHiNHtj+y1n1P0jXqS1IX7i+gZxssFstGPLdd0oagdK3DLAbx9MOG9y6xfMbapgZX8q5I7A2qjxPkHq7FwkEP6z4p7mrtSCTzZEvOwDguwQ0JRO751VXYoO7wFudRr3f5H5M1ETYZZxZM8x0N0dcWMl1zyvUXHfhWVl4P/SPqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705493874; c=relaxed/simple;
	bh=OFihm6yOSdyrIX3TVPPEgVNi0cjH0fyFN/STG0Fxcuo=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=XWmblS5JyHmckbH8ifsFR2WjCD32Z5WDG7TtqEoCuGhHdtMVhAD1f+m98dCJYIsuiimtzCG4IyBRoW9UVIS8xGNuByzBoQIfS8DsgaCBiC/r/AIHZf6R+mNkr4CydeDQBEf997hEDT+D9npOXPTi1N+jeBCuqCYq0JME4DAYJ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ndoVtZu2; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5f2d4aaa2fdso111658117b3.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 04:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705493872; x=1706098672; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tqn31a8Q43TcX43OmGCB3MQCcwEGW2dYHZPltYe4F0o=;
        b=ndoVtZu2kFu0MEO1J/zCXgpPJ6zKpbg5yHfQF+FM0aTdLs4Y1r5W4enpH6RzYR/dWw
         LpyA/b8ryl/qPxAshlv7LgYALNCg5sBzAaA8sM5Y3/dd1XX7X26jhf0xnnMKlxdSWYxM
         uad68sFf/xkB+o+LnncFagHMVW5NU/LAsuQS33RO90uIxeweKKil5lY/dY+LAFlsYebm
         nOw97WJ7v+W28SlxRsrZEGkS0Y0unz6bmUl27SmMrr9gCMrtU1ZftGqu50fzwNR9qasf
         3Z1NVG8XYMCF7pVd2+Z1BISmqztOFg3ZFWqrF8huinxQJrE/XbOVCIohh42o3g8IEfsu
         Muyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705493872; x=1706098672;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tqn31a8Q43TcX43OmGCB3MQCcwEGW2dYHZPltYe4F0o=;
        b=ik5jMhx1v/rA6UHa9ECjojxNrAlHGH6cyBAtPTxQRHv0yAWXlcshKNJW7+inVuCVHC
         3uoyth8XAIYcpbGXqj5c8k/qjUG6AWmv+JXPJByqj9ptFaO2lJNRR9obE7PAk5tzqgGh
         ZZb3uL5/ftNUQ5nh2UotRqQ3Uvr8TXhIEB7eE7aOjP+UzNLfTCocPjlelYn9l3M+ZwEL
         LBB/xEdvV1WnpTf2qc53q+64ARJyvgrRqGOkR+XeNVyuUM+FcXtgGZu/XlrkfkeEGJ5n
         IwmqzavOxeiHe5AqHOpm9dbl9ahBbTzsPUmMf1iZhkRRx9gLE8l5/nOB6/r5j0uyxCls
         js0g==
X-Gm-Message-State: AOJu0YxE55ptRLb8XOVrXjfhhM0lf1sB6jyMYko//7tb8lpZPMq1N+yz
	BIMXz/vCFYg91GjmwZdEWCjoxBDFI5KDgux+FJURy/HsaQUONw==
X-Google-Smtp-Source: AGHT+IGw/fXZv725zSW8uXVwy6JkTDYuc3XQeWu50ewepPBAUHHJ59De9Mw105ifwTwf0eNnDx1V1J/0oNjB1rT41eg=
X-Received: by 2002:a81:b656:0:b0:5ff:64d6:ee49 with SMTP id
 h22-20020a81b656000000b005ff64d6ee49mr833182ywk.64.1705493871659; Wed, 17 Jan
 2024 04:17:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116194225.250921-1-sashal@kernel.org> <20240116194225.250921-44-sashal@kernel.org>
 <ZaeJ8Sh4JLo5GAQw@hovoldconsulting.com>
In-Reply-To: <ZaeJ8Sh4JLo5GAQw@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jan 2024 14:17:40 +0200
Message-ID: <CAA8EJpoQZc0f2HusJOMa_45bh8Eh=sVg-aOUbNR3S0+oQQQ+MQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.7 044/108] usb: typec: ucsi: fix UCSI on buggy
 Qualcomm devices
To: Johan Hovold <johan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, fabrice.gasnier@foss.st.com, 
	quic_jackp@quicinc.com, saranya.gopal@intel.com, quic_linyyuan@quicinc.com, 
	andriy.shevchenko@linux.intel.com, minhuadotchen@gmail.com, 
	johan+linaro@kernel.org, robh@kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jan 2024 at 10:03, Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Jan 16, 2024 at 02:39:10PM -0500, Sasha Levin wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > [ Upstream commit 1d103d6af241dbfc7e11eb9a46dff65db257a37f ]
> >
> > On sevral Qualcomm platforms (SC8180X, SM8350, SC8280XP) a call to
> > UCSI_GET_PDOS for non-PD partners will cause a firmware crash with no
> > easy way to recover from it. Since we have no easy way to determine
> > whether the partner really has PD support, shortcut UCSI_GET_PDOS on
> > such platforms. This allows us to enable UCSI support on such devices.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Link: https://lore.kernel.org/r/20231025115620.905538-2-dmitry.baryshkov@linaro.org
> > Signed-off-by: Bjorn Andersson <andersson@kernel.org>
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
>
> Correct me if I'm wrong Dmitry, but while the commit message makes this
> sound like a fix, it is not needed unless you backport follow-on patches
> that enable UCSI on these platforms.
>
> So this one can be dropped from all stable queues (unless you're
> backporting patches that enable new features and that depend on this
> one).

Exactly. It didn't have the Fixes: tag. So I'm completely unsure why
it ended up in the autosel queue at all.

-- 
With best wishes
Dmitry

