Return-Path: <linux-usb+bounces-1356-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 122957BF98E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 13:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42B811C20D48
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 11:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162E618C17;
	Tue, 10 Oct 2023 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lILMascz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58508182AC;
	Tue, 10 Oct 2023 11:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309C1C433C7;
	Tue, 10 Oct 2023 11:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696936905;
	bh=mf4hrEAKdYA8Nksyobd+OEdeGNe+2vf/Db/OEH+EnIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lILMasczVih2HWAvVG5erexx8W3MqqGkZkb+Bs2ca1rHfO/n/K4bgAhuirSrK9oo8
	 Xc0fL4sm0sQEIVL7++JmbyLdJ6Vx69TmIm5204Jd2lPoWeZ8xF+uzrrQ9iSkJnHr6j
	 DlUHj4g+7pZ3I940NKlJb7EeU05l9gaaiC2U/WZc=
Date: Tue, 10 Oct 2023 13:21:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abdel Alkuor <alkuor@gmail.com>
Cc: heikki.krogerus@linux.intel.com, krzysztof.kozlowski+dt@linaro.org,
	bryan.odonoghue@linaro.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, ryan.eleceng@gmail.com,
	robh+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	Abdel Alkuor <abdelalkuor@geotab.com>
Subject: Re: [PATCH v10 00/14] Add TPS25750 USB type-C PD controller support
Message-ID: <2023101025-murmuring-dorsal-781f@gregkh>
References: <20231003155842.57313-1-alkuor@gmail.com>
 <2023101017-custard-scale-470f@gregkh>
 <ZSUw4kDgzAIR/F3m@primary>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSUw4kDgzAIR/F3m@primary>

On Tue, Oct 10, 2023 at 07:09:22AM -0400, Abdel Alkuor wrote:
> On Tue, Oct 10, 2023 at 09:02:55AM +0200, Greg KH wrote:
> > On Tue, Oct 03, 2023 at 11:58:33AM -0400, Abdel Alkuor wrote:
> > > From: Abdel Alkuor <abdelalkuor@geotab.com>
> >
> Hi Greg,
> > Note, your subject line says 00/14 yet your patches had 00/09.  I hope
> > you didn't dropp patches somewhere?
> >
> Sorry, it is just a copy/paste error from v9 as v9 has 14 patches.
> > I applied what is here now, but are some missing?
> >
> No, they are 9 patches in v10 as many patches from v9 got merged into
> one patch. Should I upload another cover letter to fix the subject line?

No, that would just confuse me more, all is good now, thanks.

greg k-h

