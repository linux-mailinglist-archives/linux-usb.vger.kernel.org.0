Return-Path: <linux-usb+bounces-2064-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7A37D2D08
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 10:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F6881C2097B
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 08:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5527A10968;
	Mon, 23 Oct 2023 08:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9CvIn0J"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB64E23C5;
	Mon, 23 Oct 2023 08:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB4DC433C7;
	Mon, 23 Oct 2023 08:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698050641;
	bh=u7NlD1Q+yOeYznnIX1NVopvkTd5tWg++cwHdsd8xV9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F9CvIn0J0RMwF/S119USSKPzO0larT1HgWg65t/5hmyR0VWd8BN4NDchR3gyJi5rk
	 WkEfkSIkJom9+ATFcmZjEkHDBklwwLnEWV9neWYBrs6SWKZWZ/OOh3rz65uvwbUlCe
	 b556SNpPjp1XIuDZrp3JhLl4gpinZq0inwcycAE0rXZJavjhegx6usGIs9GR93x2jo
	 ZhJc4z0VaXilVdDdraN+P+Y9FOgkOsVB+1dwWKQDp7awVIPzN9y6SE9RKamRtI9Dpw
	 vXOf84SUl7z2EcB+32pA3W4sR2R7sDjaO1TvJ6dIxfclxU71S8IzEw+cSlWe56GilE
	 X3HQZAqr9hFDA==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1quqXm-0007eU-2X;
	Mon, 23 Oct 2023 10:44:14 +0200
Date: Mon, 23 Oct 2023 10:44:14 +0200
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
Subject: Re: [PATCH v13 01/10] usb: dwc3: core: Access XHCI address space
 temporarily to read port info
Message-ID: <ZTYyXhyZN3jBXEfm@hovoldconsulting.com>
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <20231007154806.605-2-quic_kriskura@quicinc.com>
 <ZTI7AtCJWgAnACSh@hovoldconsulting.com>
 <279a54f2-7260-4270-83c7-d6f5c5ba0873@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <279a54f2-7260-4270-83c7-d6f5c5ba0873@quicinc.com>

On Fri, Oct 20, 2023 at 03:12:44PM +0530, Krishna Kurapati PSSNV wrote:
> On 10/20/2023 2:02 PM, Johan Hovold wrote:
> > On Sat, Oct 07, 2023 at 09:17:57PM +0530, Krishna Kurapati wrote:
> >> Currently host-only capable DWC3 controllers support Multiport.
> > 
> > You use the word "currently" in a few places like this (e.g. in comments
> > in the code). What exactly do you mean? That all current multiport
> > controllers are host-only, or that this is all that the driver supports
> > after your changes?
> > 
> This means that, today the capable multiport controllers are host-only 
> capable, not that the driver is designed that way.

Ok.

> > Please rephrase accordingly throughout so that this becomes clear.

Johan

