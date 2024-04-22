Return-Path: <linux-usb+bounces-9556-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6934C8AC565
	for <lists+linux-usb@lfdr.de>; Mon, 22 Apr 2024 09:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F85B1C21CF7
	for <lists+linux-usb@lfdr.de>; Mon, 22 Apr 2024 07:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25BB53E31;
	Mon, 22 Apr 2024 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HylXidWE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3E953E1E;
	Mon, 22 Apr 2024 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713770455; cv=none; b=bGOF3R/Fl1FQN+8RchTypBzDS/vo9Z1nJYceUfI0E3CmWuva+mIWKhxJh/77R8ZIo9xKZwFJpBwRY2kXk4ppLhElCpctQWUHeiUM7eeLf0Btxs38F5rK6R+9UJQn87LSPw/SBGPwigISx4Qu1hx3Zl3JNwB/i/xmMGeFsbVHyi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713770455; c=relaxed/simple;
	bh=5Wx60GfPJ2sh9dE/ENFkvlwGmudJCkp4Kppj2modhDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRnXeUWNYeLMSMFXXcyzUpCuXkdQtNpF0lY2z+l/p2e9eCboB/yNs1RnzAQoWvZ64Behq23ibRIDJgQuJGWZeOoVXeYgwmGNw0jIZoIi1rvjbObp7AdhSBh4lD7hMtBgi1s7jzquCvuU8P7yTrjrAQW1f04IY1zXhIYNO1FFPXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HylXidWE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1662EC113CC;
	Mon, 22 Apr 2024 07:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713770455;
	bh=5Wx60GfPJ2sh9dE/ENFkvlwGmudJCkp4Kppj2modhDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HylXidWEoeflBSPEM0fgVOufBAesuYmc30QjXO7+AtyTlwC5J8Cef6CUUBOJDT9rS
	 /i9SqbSczTH7NY7Vg3iiFdnZiQ47j43SvtNHa6eLdiifWP0m9vo9igmls75I1hQrXJ
	 i59fnBfcay7Y18XjtQrATCPpmH2rUtSnhQ/JZt27tlyOzG/k5JQPERHNy86lqg51wh
	 5SqzR4KpX6qL8P8pcfelmW6xRoNIlQmC63Zbbr8IAYXVOTRNZH7GWZZb95aWww+c2i
	 ituAChk3DOvf2R2NPAX88fNPqv0RYkcHtSxh6dVIjie3U94C1VvRlkL37WukqM4m8f
	 aEDDWJeDFNxLQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rynyr-000000002h6-2Z5w;
	Mon, 22 Apr 2024 09:20:49 +0200
Date: Mon, 22 Apr 2024 09:20:49 +0200
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_ppratap@quicinc.com,
	quic_jackp@quicinc.com, Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v21 7/9] usb: dwc3: qcom: Refactor IRQ handling in glue
 driver
Message-ID: <ZiYP0Zc0pHlIO3o4@hovoldconsulting.com>
References: <20240420044901.884098-1-quic_kriskura@quicinc.com>
 <20240420044901.884098-8-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240420044901.884098-8-quic_kriskura@quicinc.com>

On Sat, Apr 20, 2024 at 10:18:59AM +0530, Krishna Kurapati wrote:
> On multiport supported controllers, each port has its own DP/DM and
> SuperSpeed (if super speed capable) interrupts. As per the bindings,
> their interrupt names differ from single-port ones by having a "_x"
> added as suffix (x being the port number). Identify from the interrupt
> names whether the controller is a multiport controller or not.
> Refactor dwc3_qcom_setup_irq() call to parse multiportinterrupts along
> with non-multiport ones accordingly.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

