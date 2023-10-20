Return-Path: <linux-usb+bounces-1962-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9819C7D0AB2
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 10:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52889282480
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 08:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452A04668E;
	Fri, 20 Oct 2023 08:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvrFJbPn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9925B20EC;
	Fri, 20 Oct 2023 08:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE3AC433C8;
	Fri, 20 Oct 2023 08:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697791091;
	bh=9SQfZR/nn3xuO36PSNTBTydsMCVV2RapIyMT5BBaj2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KvrFJbPnL4+dhwzTK5G5E9IsJN1JtCCt+OgH9Rr7lkGYknzK+4DSJA0fUm8kKLBfc
	 B1u1k3OgZPf8tEgZkwceNMZLi3YOMQ/v3RfivjZTJGwN8MretAHy8nGlFlJ5yT/x+L
	 9+/YmSvDh065sjME4f76IW7iHaYv8+N9fs3jO/Pq9LeBVKAWcvrTwSWw/iwZVpFH/u
	 FbEg+Wh5uXLE0Vh+f4IKImMTeInPqVyNpESqrP02VfPs5sAfHhhned5RMEju7v5qSY
	 YsDffpBWbQC0IbzVLKmEllaOPQ+wxd/E43Bc+/Tmh8GiESgiIm2v15Sg5wfFI+RCOr
	 mN7m6YhnL1KHQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qtl1M-0001lO-0v;
	Fri, 20 Oct 2023 10:38:16 +0200
Date: Fri, 20 Oct 2023 10:38:16 +0200
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
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
Subject: Re: [PATCH v13 02/10] usb: dwc3: core: Skip setting event buffers
 for host only controllers
Message-ID: <ZTI8eFbVAYy3hxQy@hovoldconsulting.com>
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <20231007154806.605-3-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007154806.605-3-quic_kriskura@quicinc.com>

On Sat, Oct 07, 2023 at 09:17:58PM +0530, Krishna Kurapati wrote:
> On some SoC's like SA8295P where the tertiary controller is host-only
> capable, GEVTADDRHI/LO, GEVTSIZ, GEVTCOUNT registers are not accessible.
> Trying to access them leads to a crash.
> 
> For DRD/Peripheral supported controllers, event buffer setup is done
> again in gadget_pullup. Skip setup or cleanup of event buffers if
> controller is host-only capable.
> 
> Suggested-by: Johan Hovold <johan@kernel.org>
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

