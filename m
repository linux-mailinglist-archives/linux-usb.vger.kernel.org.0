Return-Path: <linux-usb+bounces-654-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CF17B0920
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 17:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id E6982B20A6C
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 15:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDC748E9D;
	Wed, 27 Sep 2023 15:46:13 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF1F1171A;
	Wed, 27 Sep 2023 15:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0BF3C4339A;
	Wed, 27 Sep 2023 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695829572;
	bh=3FrmzdhTjw5LrzQOkp7joeY5gnZ08aQFmDto0Xk2RDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jdg7Mxy7D4jA3i/D43lRGIJqPBosdIidu+hvsXP+OFbf9RJUra9kj9VAaMLtfVDvi
	 TuqLRrSNTNOxsuIqgQEGQ5UTKdkx+hQ1wfba6lvehEnem1vjSaVZWhwhxCct6RgvZT
	 Q+mAjxijzvfVYio8cGhCNgDjKCPl6uDErTNJjvxE=
Date: Wed, 27 Sep 2023 17:46:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, Thinh.Nguyen@synopsys.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 00/33] Introduce QC USB SND audio offloading support
Message-ID: <2023092752-hardcover-surviving-b9d1@gregkh>
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
 <ZRREZl6XLzyY4K95@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRREZl6XLzyY4K95@finisterre.sirena.org.uk>

On Wed, Sep 27, 2023 at 05:04:06PM +0200, Mark Brown wrote:
> On Thu, Sep 21, 2023 at 02:48:10PM -0700, Wesley Cheng wrote:
> > Several Qualcomm based chipsets can support USB audio offloading to a
> > dedicated audio DSP, which can take over issuing transfers to the USB
> > host controller.  The intention is to reduce the load on the main
> > processors in the SoC, and allow them to be placed into lower power modes.
> 
> I had a few small comments in reply to some of the patches but overall
> the ASoC sides of this look fine to me.  I didn't really look at the USB
> side at all, I'm not sure I understand it enough to have any useful
> thoughts anyway.

Thanks for reviewing those portions, I'll look at the USB bits next week
when I get back from traveling.

greg k-h

