Return-Path: <linux-usb+bounces-24372-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1E8AC71C6
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 21:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AC011888C5B
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 19:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023B3220687;
	Wed, 28 May 2025 19:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tE00c5DN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EB121ABB7
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 19:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462229; cv=none; b=aJqww4tlOfzR3BGIvkBRK1P8ZVWCzfPrJYq6K2Nb++paveLM+yeMzX/bnqfaXZjLc//KAClk9ER0fQ0svrK24jgs0WjY+MFRZ+1qde7adcTUYimKp5FFzRkw5gM1A5sG9khqOmGWZZ5Vu5oNOogSX1eW2sT3Ndk75vMNoza47jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462229; c=relaxed/simple;
	bh=Xsz6XZ7exOnaDVgyk9FhTekrCZof58PjSId5OiV3byk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cKasLnckEnRFxYE5yWi+3bQ6qEWNSn7gGWIpoy+CE7QHZKuSjmqiXe7eSPxhAUmiXSS8oSQ4/imnNkXwZY4yqT7mZaVRmBDhs1SBd30LCqIACfRwsCJskHrfdzzyhimlV9yB9xdvwtWa4yEFvsJtSsIItR/rWzGVveWb0dNARC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tE00c5DN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0618746bso2089965e9.2
        for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 12:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462226; x=1749067026; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IsxIxIK6IO+/d1azvrpZkxNeZUasvn91vkyCez/ohhE=;
        b=tE00c5DNJnu0OZ7wUW1rEBAzPPAVW18Zhd8OhM7GEQ1k7cUxB8qgebRdkoL4XuMvCX
         iJ7j7yslIoI+Fzm6jDsns+lEDigG8HOiP5JvH0HsQSWQw0HfTzFVwcxi2HJMQdI16XJs
         Q4hg/s/PRNAuGEZfxdDEd2W3YGFe5UO2AP8Zp8+WAil/L+Ru/SLYrAD4xQpxos6TRckL
         pD/7xggoiSBedonw2I5vsR/48CeC1CVaZrb+BvGstfqOueNUoEhHS2ktIHN/8ghp7Y+H
         witMwDJgYSgvvtJaJpCzPN6mLXfQs6l3il6FJrpoALB7MJvS/sli4Q+CxZZpVt+lTc6b
         FJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462226; x=1749067026;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsxIxIK6IO+/d1azvrpZkxNeZUasvn91vkyCez/ohhE=;
        b=loIGCWlJTC0d61jR/p5tieZBBIEZJkBKpsve4WAGnM6TexDJ1CAUoJC+yX3CmeVB9c
         cT6LpIFtEXnnPqMD2uVkSHT5Fe3e8KshlaHsHscRGbL/r8YzM6N7tqPfrW4szxplx1k4
         tX0wrDnIab44Dv7b7iwue9eckuAC8tfp4Av4qi8Ah2wf4fqinstjuayhNl8zDsjvbEet
         wHI1WyRsvXjxw5bRi3Bu+mkzB79OY2BLNG0ooEjD3Pmx8N87umOQT+5wkBg+QTAGSuzr
         QX6+tJNQOZwNz5a9Fg1Fa7fiLEIWp2V5Z1JgwDIsEoQGOcWeJZWLw/70liUqDzDwXoH7
         Kr+g==
X-Forwarded-Encrypted: i=1; AJvYcCU72wrSEySnLx277e5+Kfb2e9TUVh1JfF0/mrg5G5n7cz2L6t/1JX+AhrODncLisDpnl4IVvXmKyoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSyhApyJ+9isg5RPGiMoL+kAgMQUi7/Zu/ME1wjmus8EYb/Vgc
	r8zwPgEQhbX9D/Iw6WJWCWR7RhCfhdZ3vlZZASt0DJOvY1V4voET0h77IuaTq+yBRQo=
X-Gm-Gg: ASbGnct+AKAEw5bisaqDsXr4pqQrEUAmiJtKJvGcXxy9HRcrTKH+hxf3D8oq0YsbTgU
	hlRaG923qwDe3xm1sleOsW2aBQNPHJ7wsIo+LHbsmTNnj+fCt1tnm+TNqHTB84PT2r77u4ExrSC
	XQqxNxa2oCRUVgh72lR1ZRLqWIW+KRUJYavPhwnwfDvjxwwIV+uiI0MvGV2wt/kRJzRXcDdBISm
	LSk9bEjqYTxZ2mjEEjY0PEQRBwP3xtURiGr1/YlAqwNd9a+SzwlKa7I3ErcAOeC80+ne/Q7SNKk
	H/1x0MuVYet2F1Fd9BAGgAwt/l4geiUone2OrE2BMEdPVSxqNQ4G+yw=
X-Google-Smtp-Source: AGHT+IHO8Svq/QgVTHmZClL5gffMevyHOz1Cco0x7cPWvVyVd9ZXnG4onhYM/UN/PlwWdqGJFqmo+g==
X-Received: by 2002:a05:600c:35d3:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-44c9301650cmr187985425e9.4.1748462226120;
        Wed, 28 May 2025 12:57:06 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450cfc04120sm638565e9.16.2025.05.28.12.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:57:05 -0700 (PDT)
Date: Wed, 28 May 2025 22:57:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: [PATCH 0/4] usb: chipidea: Add support for s32g2 and s32g3
Message-ID: <cover.1748453565.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset adds support for the s32g2 and s32g3 chips.

Dan Carpenter (4):
  dt-bindings: usb: Add compatible strings for s32g2/s32g3
  usb: chipidea: usbmisc: s32g: Re-apply init settings during resume
  usb: chipidea: s32g: Add usb support for s32g2
  usb: chipidea: s32g: Add usb support for s32g3

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  2 +
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  |  2 +
 drivers/usb/chipidea/ci_hdrc_imx.c            |  6 ++
 drivers/usb/chipidea/usbmisc_imx.c            | 91 +++++++++++++++++++
 4 files changed, 101 insertions(+)

-- 
2.47.2


