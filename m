Return-Path: <linux-usb+bounces-567-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 701717ADB7A
	for <lists+linux-usb@lfdr.de>; Mon, 25 Sep 2023 17:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 3D4D52814F2
	for <lists+linux-usb@lfdr.de>; Mon, 25 Sep 2023 15:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060EE20B37;
	Mon, 25 Sep 2023 15:32:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2A11C283;
	Mon, 25 Sep 2023 15:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43080C433C7;
	Mon, 25 Sep 2023 15:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695655968;
	bh=9kY8d7fPm3V2FOg2yCYMYdIUQkKXq5qEPj5+mr6AxjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uzh3ktmgllWZnurSKje1C5WUioprloyGKlOqEw++66au/67Cim0L4bRmI4nWb2Vbh
	 EFrUVleWajSCkB2nDQy1VInmsTZDBXBiKRHuvb4lqKs9PEXMBx6jXaup+iqdgVKjyK
	 cMkMahfEzV2FmKGg8uAFMFM9ZirJIK6e9U7XaZ5kIuQY9UWYmeeCrXRbf+9BrhY+wt
	 NCVCrsqsdXvTMrSbavWzvYU0eypoBLOapO0OI94LrJ0WROpvKFQ/JauhhHJkAeWaGA
	 b/UOlojkMyOAhakNQE/AqzLI7eIwrpYMXMQM+raLmIujPWleo72qEMTbmZiOD2rbGd
	 YO73uWW9MjEjw==
Received: (nullmailer pid 1409816 invoked by uid 1000);
	Mon, 25 Sep 2023 15:32:45 -0000
Date: Mon, 25 Sep 2023 10:32:45 -0500
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: alsa-devel@alsa-project.org, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, bgoswami@quicinc.com, perex@perex.cz, gregkh@linuxfoundation.org, agross@kernel.org, andersson@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com, conor+dt@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, Thinh.Nguyen@synopsys.com, robh+dt@kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, mathias.nyman@intel.com, konrad.dybcio@linaro.org
Subject: Re: [PATCH v7 13/33] dt-bindings: usb: dwc3: Limit
 num-hc-interrupters definition
Message-ID: <169565596417.1409760.904452104136965315.robh@kernel.org>
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
 <20230921214843.18450-14-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921214843.18450-14-quic_wcheng@quicinc.com>


On Thu, 21 Sep 2023 14:48:23 -0700, Wesley Cheng wrote:
> Ensure that the number of XHCI secondary interrupters defined for a DWC3
> based implementation is limited to 8.  XHCI in general can potentially
> support up to 1024 interrupters.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


