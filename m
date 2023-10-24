Return-Path: <linux-usb+bounces-2113-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B0D7D4857
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 09:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B7DAB20FBF
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 07:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405E41427A;
	Tue, 24 Oct 2023 07:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7bVa0LL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C71113AC8;
	Tue, 24 Oct 2023 07:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 027F5C433C7;
	Tue, 24 Oct 2023 07:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698132006;
	bh=60uKQEnj+93gHj83QGt3xD3fa/pnl7xAR/0kIcMK5Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l7bVa0LLh1mM6loLdouR/d1wOr/VFp+xdHbHGUmM1PZIyK6TmAQvUKAOo+okCrANL
	 xDuvbDhSsKgfAS7NodEIXCmt8W3GhHj5whbbBktaOI2ocYfyGbTlsE4pgenKjKJt9V
	 ujbSfC5+46qmFgJNO9OREmyVm79QVdnq8G0ymY6mnMwFj/SJ/OhLMflhyf2iVKpDjY
	 KEdiRjWK1OZdosQdOmzFppLRP3X3CpcFMLpdh7vRzhCzQWdA8M1kdxHzPL70aXwo0s
	 E2iDQPBwF0FiNt6igJvdXHXYV6tEqDgBjkfLdR6PTMHoPIVxBpe51okiuAfmPW6QLc
	 qiS1+MhFcBPrg==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qvBi9-0003gD-34;
	Tue, 24 Oct 2023 09:20:22 +0200
Date: Tue, 24 Oct 2023 09:20:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_pkondeti@quicinc.com,
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com,
	ahalaney@redhat.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH v13 09/10] arm64: dts: qcom: sa8295p: Enable tertiary
 controller and its 4 USB ports
Message-ID: <ZTdwNSvi1FJ5TNg3@hovoldconsulting.com>
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <20231007154806.605-10-quic_kriskura@quicinc.com>
 <ZTad-_toGkumYx6O@hovoldconsulting.com>
 <faa647ed-9692-4233-b421-b9e6271f8934@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <faa647ed-9692-4233-b421-b9e6271f8934@quicinc.com>

On Mon, Oct 23, 2023 at 11:12:40PM +0530, Krishna Kurapati PSSNV wrote:
> On 10/23/2023 9:53 PM, Johan Hovold wrote:
> > On Sat, Oct 07, 2023 at 09:18:05PM +0530, Krishna Kurapati wrote:

> >> +	usb2_en_state: usb2-en-state {
> > 
> > No need to include '_state' in the labels.
> > 
> Any specific reason ? I have no problem if removing the suffix but just 
> wanted to know the reason.

For consistency with the rest of the sc8280xp devicetree sources
(including this file) where we've used that pattern (e.g. as reproducing
"state" in the label is mostly redundant). For example:

	pcie2a_default: pcie2a-default-state {}

and

	nvme_reg_en: nvme-reg-en-state {}

Johan

