Return-Path: <linux-usb+bounces-1464-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2167C54FC
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 15:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F3711C20FBD
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 13:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A501F923;
	Wed, 11 Oct 2023 13:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDNMP1fz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A364C1F5E2;
	Wed, 11 Oct 2023 13:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D715C433CC;
	Wed, 11 Oct 2023 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697029829;
	bh=sIFPlEfgw5Tgf4SaAgi4BkayV92E8UWXht7jOG8M/TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDNMP1fzW+mkOxIiBZGym3lqDR2cgtvoaMKjRJvkI8WQ4cCGsqw33axMJVGoFr+aY
	 OnWmpIUSZPBmCpKpdZ2RFRATbXEe+jGwoeX94J3NfGYImgePxT6Wf6qg3vBB3+mYTs
	 eOAR8kV6FlnZBrgJzC2xIwJ3Q1FV9x2z847w8FtfM53XQkH/8R0gprgJjsftiKU4o5
	 JYbG8quTIfH8eWOEoiJmar6Fa2Lq89UmVwk1WVex4hSbmx3IUZa2UrcVbyFWBWD4iu
	 h/NjWizQ/dEjy42TU5iX91+E/OYXMgqyat7DV5L2v5R92CH5f7LsrHhlHVoFuMaN/1
	 rMcJ2ck3FIZ+A==
Received: (nullmailer pid 4114505 invoked by uid 1000);
	Wed, 11 Oct 2023 13:10:26 -0000
Date: Wed, 11 Oct 2023 08:10:26 -0500
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: konrad.dybcio@linaro.org, agross@kernel.org, devicetree@vger.kernel.org, bgoswami@quicinc.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com, gregkh@linuxfoundation.org, andersson@kernel.org, conor+dt@kernel.org, linux-usb@vger.kernel.org, mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com, Thinh.Nguyen@synopsys.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v8 14/34] dt-bindings: usb: dwc3: Limit
 num-hc-interrupters definition
Message-ID: <20231011131026.GA4103742-robh@kernel.org>
References: <20231011002146.1821-1-quic_wcheng@quicinc.com>
 <20231011002146.1821-15-quic_wcheng@quicinc.com>
 <169699146356.2560906.8654324582682669209.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169699146356.2560906.8654324582682669209.robh@kernel.org>

On Tue, Oct 10, 2023 at 09:31:04PM -0500, Rob Herring wrote:
> 
> On Tue, 10 Oct 2023 17:21:26 -0700, Wesley Cheng wrote:
> > Ensure that the number of XHCI secondary interrupters defined for a DWC3
> > based implementation is limited to 8.  XHCI in general can potentially
> > support up to 1024 interrupters.
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > ---
> >  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/snps,dwc3.yaml: num-hc-interrupters: missing type definition

Patch 15 should come first.

Rob

