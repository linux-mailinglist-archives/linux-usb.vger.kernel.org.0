Return-Path: <linux-usb+bounces-25894-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0287B0809F
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 00:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC6303B4B9C
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jul 2025 22:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCD82EE612;
	Wed, 16 Jul 2025 22:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U1lJ6bFD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7646D28BA8B
	for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 22:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752705983; cv=none; b=mTiIFLSHPCECedJe7aW+Q1bB1kiypxoSD3+vjvBoAT7NPOsJgHvE/fwAMw7QBNpRDvIG8LAPvUUje+ZmaI6ooxqNi+efYjkquuDiy2w0SY12euNteoPlNh+kbPaNyc5gXYRGwRIK9AJRmWmAQyoRyEIm2YgB9DD3TBfQKGf6z8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752705983; c=relaxed/simple;
	bh=egIk+/LQ4iaDf+RLDIDJAcGByEdkupEuWlBMyV1IjQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uoxFLpTAe33h35tbFOxc+wew1bhPvj48/Z/a+u19PewcWOpapS3mJd1VXUxeCylCmVkLG8y0NG/Zg91gNl1538gwY0pxx9cqIqvCtD02UcbQi5nKc/p80XEdW1Aptl84TgOSCaOXnvIVcpUqkihFiDEqp7noFVP6UGyhxYNiFGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U1lJ6bFD; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2e95ab2704fso272718fac.3
        for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 15:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752705980; x=1753310780; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgJcNNaIcB7VF2rGgBtMbF7MjrWDu7+HbpybgI/inbs=;
        b=U1lJ6bFDIKcQf23veWIV9+bvDsFMOsD2ySRdq+QdwVQnsuoRz1zQxTwPRqlrsHLVtS
         WfNdYvnqrIn+3/eag9jeuw1lo5kLKqrdSgHuHPhoAH7OxtQ/KWR1mxSvHGxvlWcrmfY0
         FVGmBLFf2xCVn56Jb+dMVP6rxf+EmvAHi2MNVRaoXBvXG6tvgtG+JCVK/8JnIWI/z8NG
         wHIsu0kfyJ7WM5ehTTxKpl8WxCJ3i1U3yhci7+g7K3QjmWnpjjzIM2q2ovVG2Ms2shY0
         MqfXMzaletrEnui2/ebUdfHDZo/BUjtBj+5oGYz9f6tUCUGG14xt3cdo+qxN5iaq20WU
         B9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752705980; x=1753310780;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pgJcNNaIcB7VF2rGgBtMbF7MjrWDu7+HbpybgI/inbs=;
        b=ETGYthpUZwSCMASI6Sp5cskByhNz2Nyow8rjQ6KLdoh9LEcfJZ85YkrThx6ecERZRW
         aE6f4yI5Fj6iTxtKeB/Jz44kcwy16LQq/TFfecVVxCDiJ8xzX6gbSdgkn0q0cBb0FDjO
         7HG2+JZfrucgbhNY8tnJDz3E83HRQi1nQgyM7W7dX0EW5uphoy6LvJflkYz0wQK6PCkr
         EXs1ru+veiF1qHFvINMjhEg73LidIVtIUlN4IZ7QVvqEBd2w/bK9XuQpUmT+9p1CY5l2
         srGn8amjQmQKourWD/Q3rG0qoBvxF/B5/LjK7p8oW4q/M0ByVCxJiutFime3ZJK1ESI0
         +M9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWn9lgq76K+md12/ZDeAQSAgxfrDaDCRCdqNGhuNh5xfLfywoTgy9QOr6edgZMDUsfFzOMubwOLgwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlicBGBAEWIvKiOMB9PtIZOuNDySP9rLRznl9j38cFOdeBi2T/
	6rslOFproVd/IRugQVP3Aq2jsdTYcv/XiuJnfIpTYkH9YN/4kMg0fd29UJgSpuWICDo=
X-Gm-Gg: ASbGncv/Utpp7OfSG/VThmNUrYmtgBo7GXIfsh6XTCJ0ay2d6z3v4+Nk7KhB/BcvUO1
	zA2vcT/YgfdrBoIvJXugHx4J1DOmrRFfAVSwh55af37ONELgUCaHwfCZALbnkk+iix0RbmTQW4K
	LYb822dkEs1gh946dVPaJBvdq3LEcSg6TkfIyJ5IZACLdQ0uMBMDrC7/Wb+LFDSYhVMFa4StQkB
	yBBIjteg2DHxtZfmNMsp4iq7VIwFPHn0W9olTamyoqoBqufrwz/tI9CRaNtf9aEc68IXeNDmBRu
	b3P8s47V9kQALE6Y3Z6WEXuHOVwvW1jySp5HAN6xPZhcptrFax9uhaYHNIOcSWiBWKfCPGuL4d7
	EoSgOIOBQqCoMnz+ON3sU5JkNj7cUHQ==
X-Google-Smtp-Source: AGHT+IHhOFmUmhBidSkZlxAn7V6wq2jgbTir2wDMQeNvWS4TRSC8XLkdd89dV6UDIvXMlv0ZdC5Okw==
X-Received: by 2002:a05:6870:5b9e:b0:2e9:9e9:d94b with SMTP id 586e51a60fabf-2ffb257d356mr3201213fac.39.1752705980494;
        Wed, 16 Jul 2025 15:46:20 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3f28:4161:2162:7ea2])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff116dd664sm3898775fac.42.2025.07.16.15.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 15:46:19 -0700 (PDT)
Date: Wed, 16 Jul 2025 17:46:17 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 0/3] usb: chipidea: imx: Fix style issues
Message-ID: <a5f4c53e-98a2-4eb0-9f30-55313be27f86@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Xu Yang pointed these style issues.  Sorry for the delay on this.  I was
out of office last week.

Dan Carpenter (3):
  usb: chipidea: imx: Add a missing blank line
  arm64: dts: s32g3: Fix whitespace issue in device tree
  arm64: dts: s32g2: Re-order usbmisc device tree section

 arch/arm64/boot/dts/freescale/s32g2.dtsi |  2 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 32 ++++++++++++------------
 drivers/usb/chipidea/usbmisc_imx.c       |  1 +
 3 files changed, 18 insertions(+), 17 deletions(-)

-- 
2.47.2


