Return-Path: <linux-usb+bounces-1204-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C857BBBE5
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 17:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EB08282462
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 15:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C238D2868A;
	Fri,  6 Oct 2023 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EkEDsXAQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1490327EF2;
	Fri,  6 Oct 2023 15:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBADC433C8;
	Fri,  6 Oct 2023 15:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696606838;
	bh=CQ3tpC/DASTgxY6DDz8rdDHkbS+6W3r8KCIgNsOPPFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EkEDsXAQ9Cmp5tr6OX02yztvXuEbocstBiOPRzphvHadTQWhWYleaSZbvu1wtGs01
	 6nOTIj6d39Wf9f2O3HU4RtDsg5ZmWVZ1pr95jki4nCbdvq12awFJOQrVBG5caz9bJv
	 XJEyH23/Gz6FBn5DgXZLUxjzVEYrMw04vNqmb9eg0rYxc15KWZXl5/9Jw47i3Vtyh+
	 KSbT25eci1dJbo4kHPGWNi49TRMNUugOMtRhj2iW607HMXC5U4mlWQyKrswjRm+zUP
	 /DLDKIkAf1PjodlsEqrnEG0fk/TgHo/Esmy70ObjBZxOryVStJX90YPdVdMHklQF/X
	 USLsmjTvRBvZQ==
Received: (nullmailer pid 3983540 invoked by uid 1000);
	Fri, 06 Oct 2023 15:40:35 -0000
Date: Fri, 6 Oct 2023 10:40:35 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: qcom: qcom,pmic-glink: add a
 gpio used to determine the Type-C port plug orientation
Message-ID: <20231006154035.GA3979654-robh@kernel.org>
References: <20231002-topic-sm8550-upstream-type-c-orientation-v2-0-125410d3ff95@linaro.org>
 <20231002-topic-sm8550-upstream-type-c-orientation-v2-1-125410d3ff95@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002-topic-sm8550-upstream-type-c-orientation-v2-1-125410d3ff95@linaro.org>

On Mon, Oct 02, 2023 at 12:20:21PM +0200, Neil Armstrong wrote:
> On SM8450 and SM8550 based platforms, the Type-C plug orientation is given on a
> GPIO line for each connector which are set by the PMIC(s).
> 
> Document this optional Type-C connector property, and take the
> assumption an active level represents an inverted/flipped orientation.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index bceb479f74c5..422921cf1f82 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -35,6 +35,12 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  orientation-gpios:
> +    description: Array of input gpios for the Type-C connector orientation indication.
> +      The GPIO indication is used to detect the orientation of the Type-C connector.
> +      The array should contain a gpio entry for each PMIC Glink connector, in reg order.
> +      It is defined that GPIO active level means "CC2" or Reversed/Flipped orientation.

Shouldn't this node then have 'orientation-switch'?

