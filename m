Return-Path: <linux-usb+bounces-1358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE52C7BF9C6
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 13:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAB1C1C20C75
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 11:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0A018C28;
	Tue, 10 Oct 2023 11:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NosGlgOc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84956182AC
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 11:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64275C433C7;
	Tue, 10 Oct 2023 11:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696937563;
	bh=S6vg6B0owOxuhRIz3K54PdpODPyrrdelfDwVY2ETUUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NosGlgOc8JdgYELaYQbxmMTy+D2lQQPOa41A8u026daK3HOjZEMsj/rc7sAmonkVz
	 KcTarBHZkILB+2qy2d6bmEVr4Lg0uXpKHRjfZ6LMt18atbH3AKFpGDiKeelp8GcC3I
	 7Xg+oMgFspH0NxflM2SYiq5plSFnMrM79Ad1vaWI=
Date: Tue, 10 Oct 2023 13:32:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] usb: misc: onboard_usb_hub: extend gl3510 reset duration
Message-ID: <2023101033-spool-silver-cfa8@gregkh>
References: <20231006101028.1973730-1-jbrunet@baylibre.com>
 <2023101036-ambiance-precision-657c@gregkh>
 <1jv8bex4lq.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jv8bex4lq.fsf@starbuckisacylon.baylibre.com>

On Tue, Oct 10, 2023 at 10:27:32AM +0200, Jerome Brunet wrote:
> 
> On Tue 10 Oct 2023 at 08:56, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Fri, Oct 06, 2023 at 12:10:28PM +0200, Jerome Brunet wrote:
> >> Initial tests with the gl3510 has been done on libretech aml-a311d-cc.
> >> A 50us reset was fine as long as the hub node was under the usb phy node it
> >> DT. DT schema does not allow that. Moving the hub under the dwc3 controller
> >> caused issues, such as:
> >> 
> >> onboard-usb-hub 1-1: Failed to suspend device, error -32
> >> onboard-usb-hub 1-1: can't set config #1, error -71
> >> onboard-usb-hub 1-1: Failed to suspend device, error -32
> >> onboard-usb-hub 1-1: USB disconnect, device number 2
> >> 
> >> Extending the reset duration solves the problem.
> >> Since there is no documentation available for this hub, it is difficult to
> >> know the actual required reset duration. 200us seems to work fine so far.
> >> 
> >> Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> Fixes: 65009ccf7e8f ("usb: misc: onboard_usb_hub: add Genesys Logic gl3510 hub support")
> >
> > I can't find this git id, what tree is it in?
> 
> Silly mistake. I must have taken the git id I had before you merged it. Sorry.
> The correct tag with usb-next is
> 
> Fixes: b447e9efe50a ("usb: misc: onboard_usb_hub: add Genesys Logic gl3510 hub support")
> 
> Should I resend it ?

Please do.

