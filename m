Return-Path: <linux-usb+bounces-2202-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A98797D7A78
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 03:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45A6F1F2311A
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 01:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BFA7481;
	Thu, 26 Oct 2023 01:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVC63HLI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625CDA50
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 01:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC20C433C8;
	Thu, 26 Oct 2023 01:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698285030;
	bh=ai96/RiTaKCJnWhue29McKV3xTzXFBhmH0+o2CsH4Io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qVC63HLI7G9VZt/ONftTpoPf5QaFBoC0f8ud9OHi4c857yXk/aZ7c6nAIbbA6k+Nf
	 WyYbj93LT14uWYrq/rnV8inw+lnPR02fzSN7j0DyNUjwgq5wmZkj3eSWQArG9v07sO
	 kYXrvtVWfSslQjClVYtGR09R4v1hjMlqQz+RaX1v/srB78B+einke9R/X7F+tVyfsT
	 sWJUN9vYWwIvfDDqFVXSOZAZa0gY8u8o4YEhPXNlaCOM+y3PZxqs95r04qa+Ry7pDD
	 OKTaGM7uY/nlZAmhMgAUyazeutDQ9VoGg8WmucniDVh0DJi3BP+fXAAXitwiL8RE+9
	 QeffXn+7Xrmvg==
Date: Wed, 25 Oct 2023 18:54:47 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 5/6] soc: qcom: pmic-glink: switch to
 DRM_AUX_HPD_BRIDGE
Message-ID: <owpnaizakfjqyzcxcmdfoi3kdjopzsq2iwufzudi3lqi66psru@zhr3m5i4t3b6>
References: <20231025223027.943563-1-dmitry.baryshkov@linaro.org>
 <20231025223027.943563-6-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025223027.943563-6-dmitry.baryshkov@linaro.org>

On Thu, Oct 26, 2023 at 01:28:06AM +0300, Dmitry Baryshkov wrote:
> Use the freshly defined DRM_AUX_HPD_BRIDGE instead of open-coding the
> same functionality for the DRM bridge chain termination.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

