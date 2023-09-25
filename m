Return-Path: <linux-usb+bounces-568-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 906007ADB8E
	for <lists+linux-usb@lfdr.de>; Mon, 25 Sep 2023 17:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 0C2DFB20A12
	for <lists+linux-usb@lfdr.de>; Mon, 25 Sep 2023 15:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6AA021343;
	Mon, 25 Sep 2023 15:34:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2371C283;
	Mon, 25 Sep 2023 15:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15AC0C433CA;
	Mon, 25 Sep 2023 15:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695656078;
	bh=Y7OQBC5AEP9R354Curchhk5OGpVdy/FisMGeX/iJKjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VVKIbioIyREl1zwTbB6F43J4ZOV5DT9Pn80/aejaOgNdQ6Zb+VS0AtCmNkcRcqHYf
	 nvp/AVewxpfGI+h5XlODkJUrEYsOEJBW9DLuBFM3W+KNtn7/HvA0ImYwwcMC/5U4hp
	 V4j6FbRLp3BybvJWNmlXvrexp+xuEGgNaCw9Z68+foaliwVubAED7hBuGctMwWZkDf
	 LE7A+UOHni0N2S+opZlZr/JN+Fczw1m7xEmSwc9mZIlvCukwuFjxI2taLhC8wgnCVJ
	 rbLePRTwyXFgDXJ6dSqlJURKzF7BifJka8AHzlc/8U9CRuUQJYVj0liY9v/S3eFgDw
	 tqMQkEUcya4mw==
Received: (nullmailer pid 1412130 invoked by uid 1000);
	Mon, 25 Sep 2023 15:34:34 -0000
Date: Mon, 25 Sep 2023 10:34:34 -0500
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: mathias.nyman@intel.com, bgoswami@quicinc.com, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, konrad.dybcio@linaro.org, Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org, broonie@kernel.org, devicetree@vger.kernel.org, andersson@kernel.org, tiwai@suse.com, srinivas.kandagatla@linaro.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, agross@kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v7 23/33] ASoC: dt-bindings: Add Q6USB backend
Message-ID: <169565607344.1412068.10654540784578345179.robh@kernel.org>
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
 <20230921214843.18450-24-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921214843.18450-24-quic_wcheng@quicinc.com>


On Thu, 21 Sep 2023 14:48:33 -0700, Wesley Cheng wrote:
> Add a dt-binding to describe the definition of enabling the Q6 USB backend
> device for audio offloading.  The node carries information, which is passed
> along to the QC USB SND class driver counterpart.  These parameters will be
> utilized during QMI stream enable requests.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../devicetree/bindings/sound/qcom,q6usb.yaml | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6usb.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


