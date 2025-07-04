Return-Path: <linux-usb+bounces-25462-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42265AF8524
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jul 2025 03:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F276D484216
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jul 2025 01:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB15126F0A;
	Fri,  4 Jul 2025 01:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TPLIGQUi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B825FEE6
	for <linux-usb@vger.kernel.org>; Fri,  4 Jul 2025 01:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751592019; cv=none; b=e5mS4oF8Ro5UQNEDg3HW6pfrdf1avRFkKI+WKvA6Ng/6XX3uOY+98eqFzx6lD7vj580szRvJIOW9Ik6Eu9YGlv+/0ChrEOxBbeCI+Jwa/KqyAOTZkjDZjcBLOuCz4GPMlDeOrcd3KO4h1Awh2+3/SIQmI+sfiWZNJRPJlGrK5cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751592019; c=relaxed/simple;
	bh=sn3kEcEnJGdq+CGH93mNVsRhQPGquWnTXTjgFVpFIlc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SeEgRAZi4eY9JRx5Dr7dpVSp0qA5awJdh4TSGcO+KYvxnY2ZEHXqmUJDWhN3ppbSqI3o5oq3uJnURfo8OdBmQsQGlUXenV/2NDK6t2y8g+p3pXz77OQI5SZ31NwBKwl4lrxSF0UUDZTP7+9UF4seCIO2lEgIojScmaj+W+wz26k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TPLIGQUi; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-610d86b3da9so154337eaf.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Jul 2025 18:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751592016; x=1752196816; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DC/cBZO4f5h7yIL6Ec05XXIZpY7LlAOQumaUsmGIiWc=;
        b=TPLIGQUi0mYxmcbN2hVndzuw/wULfXQtebU6/CJYNGL1+Pv2+DKwBKeguiPgkdDo38
         o8aseif5IprBLUrxLcijxl7Qv6uCvH6w0QJi8KLbcXw6WBfyBwxbeYMfKSdIcmHCZ6Pt
         5A3RRkIgHBd+6CYwHUhy+iIYKO5xJtht3l5lycgrCA15vDfZiyrdOMvXITH27U3c4SFm
         kB/kw06scTNhmx0bacep+NhiaBpK92cpMYk6vaEt7e0iojLmFkmhLghw/3B82Ppx9Kcc
         PFRR0BEkzEUuBy6R9Q5PSW1K46s4FjZ6jF5ALFjhI83OHd8fSS/ctExZAVIC7d5lGaxK
         0Wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592016; x=1752196816;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DC/cBZO4f5h7yIL6Ec05XXIZpY7LlAOQumaUsmGIiWc=;
        b=ACU7VwuRWA6B2VU4OxYcDwz6F0zs8SSZD6U73C69015W3NI1uMYOM/6brkFxm5es3V
         0umUEjHXpb0aqW01XgG/XaiTqbbkbcGe/X9PGMRmOZ6JN04CNlN8jR+2789Z8lrTHeXl
         bXoToK5ACvseWiaevBUxcquGnCvn6aW0qCIOM3FUkoHdxxUNoLOXRUeidrC4n9S9COEO
         N4i9owZ9owSKlOkkasKuZE/HtFPaJ8fEG7dIDlZA9cZ1LwGfMyhV6rqJo3cAJJdkRw9U
         lwqm0/gp37lbjWgj/z/k2R22ZZsI1i7ovac/N1+afYCZT5pOx5Sn+BYs1oteUfBVeiQn
         qeFA==
X-Forwarded-Encrypted: i=1; AJvYcCVott5JFg7M/oRHU6MjDRbRigPeRZT3scTMt+Nu9ZxXMzwNZahkpHTUnRBmI1oIuSHxde9eCdSX2P8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg5i1iF6mcn+rF9+xt23otfOthk67MAZ6GcfcEtEQSB2Dkz7/8
	WPDJTSzjgnAZt+Pq6w88XQGbteP5GbcEAY+0sot25hhLbLYTTgzOwwHyVdfhRZNsHwA=
X-Gm-Gg: ASbGncvSv+S4SCf8Kst73pYgod+SkXGoYTLZstLblcQiZj6oziSQo1EZAxqEsKnTOGK
	OBWJ+i3y45ohzVEjlYMqzGf1K10JKbtwoj1r4E6CEKLyZ5GCLrzLz+2gl3sb5PYvXiwieEQsuS/
	1PNxJqGLjRMGUT58NqHmlwd89tmMxflNvta8qTJml2IY3r7OlL61QKH517xs9flJC+1VaIta01/
	1uda69k5+x7oNH5MBlfe/Rh7RUyyAONJC2MGAiJHNTDeauz9biRZYC2QMyyIMTGEtxpey7gFZoa
	JEojqddh8EAeoSLcMjDPnbARkhx0+waipCvqEHqtfgP1c3M+Nv3juodLDtyoa7ELHFVWRQ==
X-Google-Smtp-Source: AGHT+IE2gfIyrgT2GmZQ15R5wrbiEzA2Rw3RJESsngVF1fw51ISYnu4DuG+UdMI6ohqlrXf2k5q/SA==
X-Received: by 2002:a05:6820:2901:b0:610:fc12:cbb4 with SMTP id 006d021491bc7-6138ffbca71mr549586eaf.1.1751592015623;
        Thu, 03 Jul 2025 18:20:15 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1ed4:f8f7:2a8d:77d5])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-6138e4be31csm164217eaf.9.2025.07.03.18.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:20:14 -0700 (PDT)
Date: Thu, 3 Jul 2025 20:20:11 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
	NXP S32 Linux Team <s32@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v3 0/4] usb: chipidea: Add support for s32g2 and s32g3
Message-ID: <5c3e57db-0642-4e8a-a194-f204da5fd2e0@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset adds support for the s32g2 and s32g3 chips.

Changes since v2:
* Add the dts changes (patch 4)
* Fix Signed-off-by lines
* Fix the device tree spec
* Provide the complete errata information in the commit message
  and a link.

Changes since v1:
* Put the device tree lines in alphabetical order.
* Add imx@lists.linux.dev to the CC list.
* Use power_lost_check() instead of creating a new REINIT_DURING_RESUME
  flag.
* Change the Copyright date.
* Leave the .compatible = "nxp,s32g3-usb" out of the ci_hdrc_imx.c
  driver because people can just specify both in the devicetree
  since they are compatible.

Dan Carpenter (1):
  arm64: dts: s32g: Add USB device tree information for s32g2/s32g3

Ghennadi Procopciuc (3):
  dt-bindings: usb: Add compatible strings for s32g2/s32g3
  usb: chipidea: s32g: Add usb support for s32g2
  usb: chipidea: s32g: Add usb support for s32g3

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  5 ++
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  |  2 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 23 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 23 +++++
 drivers/usb/chipidea/ci_hdrc_imx.c            |  6 ++
 drivers/usb/chipidea/usbmisc_imx.c            | 88 +++++++++++++++++++
 6 files changed, 147 insertions(+)

-- 
2.47.2


