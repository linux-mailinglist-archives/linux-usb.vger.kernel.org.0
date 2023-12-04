Return-Path: <linux-usb+bounces-3690-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A77D80362F
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 15:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECF1828105C
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 14:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA2C286BF;
	Mon,  4 Dec 2023 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ozr8o/Mk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F9A83
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 06:16:37 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c9f57d9952so21777181fa.3
        for <linux-usb@vger.kernel.org>; Mon, 04 Dec 2023 06:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701699396; x=1702304196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnNKn8nu723Lg0zpF/kv/3F1mKY2Dj8RO/b7j9k36Wk=;
        b=ozr8o/Mk7ftEK1xYc/WYENZVKqtnPQxU6slAQnt2QoTKsWMj8KqDQaSCA/YkmTUL8v
         XBytNQ6H0MdJpqsG/rMxW2kNNJ4NrAOhkhks6Uo5R22xMypCnNBP0JiWAzO20fwdXJiE
         5I+bCsMtG4U4iA1bOkrf1TtMDDUzOofKfV/D1HD0zgOuzpZ9bLLTMaaS3OuvLzWacUVh
         tDrilnnTA8OyowSwj1yZFgQsWG4OerO4fcc4E91rB7mE+G0J4UA+QiDghc0jzxfBrqbH
         CM8skPpG4KDgjVUklIDAahCPzlE7xgYnnZuXxC2vBngBOJYsmvv4cJKsI93eifce7sgu
         dN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701699396; x=1702304196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnNKn8nu723Lg0zpF/kv/3F1mKY2Dj8RO/b7j9k36Wk=;
        b=f+TvHFqF1e0a1f0diO/kmU8iovcQ8/d0WGjE8R3ILwxJywQhPM2xbboxpyMpnZueZ3
         t05jMu/iROPRXly2N84fXtRFMinAYVjVdVsVPt37j0kuwmgAr6BqAJX8XoZH+P1wpJN0
         QyDFWPliBGlgbzDEBDGInjVmnsgbdkLapQJC8AtlBUCx+BC7EbNjxJnLdQ6b5UCT/r0i
         /n510rm2hUWIIF+YC5Z7QEG32IZGkDP5wT6pJ6wgHbt5mS+7nrwfroyAs7WmAyPNwZiA
         9YqvxDOR6P4IS9Esy1bIHt2GpVtqm5JOlT/mBua46lMs94iFeJU19hBkGLCHpXMjzAyO
         EZ8Q==
X-Gm-Message-State: AOJu0Yw3fCRxAVledMjRmdzr17XuLNp4BK6aVIGOCA7QNDJxYQ5JXbki
	5TwhD2VlniyjVCbCJVIMtspIZxDt8EzeODLMOXTokw4H
X-Google-Smtp-Source: AGHT+IHddUgNiM5+JeDrcniHCScJhE7jly22t2q9+rXWr3RDXN6X9hcnxXrPXIv6LuNWyNWoqwMFJg==
X-Received: by 2002:a2e:8041:0:b0:2c9:d863:2c1c with SMTP id p1-20020a2e8041000000b002c9d8632c1cmr3034669ljg.69.1701699396066;
        Mon, 04 Dec 2023 06:16:36 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id v3-20020a2e9243000000b002c9fda71acesm487033ljg.127.2023.12.04.06.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 06:16:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Janne Grunau <j@jannau.net>,
	Simon Ser <contact@emersion.fr>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND 0/6] drm: simplify support for transparent DRM bridges
Date: Mon,  4 Dec 2023 16:16:30 +0200
Message-ID: <170169936705.76859.13553998311101543980.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>
References: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 03 Dec 2023 14:43:27 +0300, Dmitry Baryshkov wrote:
> Greg, could you please ack the last patch to be merged through the
> drm-misc tree? You have acked patch 3, but since that time I've added
> patches 4-6.
> 
> Supporting DP/USB-C can result in a chain of several transparent
> bridges (PHY, redrivers, mux, etc). All attempts to implement DP support
> in a different way resulted either in series of hacks or in device tree
> not reflecting the actual hardware design. This results in drivers
> having similar boilerplate code for such bridges.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/6] drm/bridge: add transparent bridge helper
      commit: 2a04739139b2b2761571e18937e2400e71eff664
[2/6] phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
      commit: 35921910bbd0b6ab595cead16d0c8faadbf2fd94
[3/6] usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
      commit: c5d296bad640b190c52ef7508114d70e971a4bba
[4/6] drm/bridge: implement generic DP HPD bridge
      commit: e560518a6c2e60f1566473c146fddcff3281f617
[5/6] soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
      commit: 2bcca96abfbf89d26fc10fc92e40532bb2ae8891
[6/6] usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE
      commit: 7d9f1b72b29698e3030c2b163522cf4aa91b47e9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

