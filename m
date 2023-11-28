Return-Path: <linux-usb+bounces-3430-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F737FC3E8
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 20:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D31D1F20F6F
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 19:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA094F1F5;
	Tue, 28 Nov 2023 19:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1+OMbSkF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AC82E3EF
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 19:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCC1C433C7;
	Tue, 28 Nov 2023 19:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701198070;
	bh=VKkpuFR72ZkZ7siURjXwuxonkiOvNT0lixSufQC1atU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1+OMbSkFz8t98hJg5Lt+DOSCYE4Mn22zIauqXDZMp0veBexAMXcfupxwT3FvUuEM+
	 jC6t6PQpMYiv/3i1TOQB7ID5gDu2sHUmbYVdzv+aDQtDcy0LSNGWpBhOpW3nMWgmUU
	 HvZakkbAS+sDhxWRWowk3VKAGLK30bFxNmw6Pzp4=
Date: Tue, 28 Nov 2023 19:01:08 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: stern@rowland.harvard.edu, badhri@google.com, quic_kriskura@quicinc.com,
	francesco.dolcini@toradex.com, quic_eserrao@quicinc.com,
	ivan.orlov0322@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB: gadget: core: adjust uevent timing on gadget
 unbind
Message-ID: <2023112835-sediment-subsidy-7e99@gregkh>
References: <20231127220047.2199234-1-royluo@google.com>
 <2023112827-repent-broadband-e557@gregkh>
 <CA+zupgxfxaB_bO51ZXW+5T3-FMF94=Tm+mqZ92LCYBZtwiQd3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+zupgxfxaB_bO51ZXW+5T3-FMF94=Tm+mqZ92LCYBZtwiQd3A@mail.gmail.com>

On Tue, Nov 28, 2023 at 10:52:49AM -0800, Roy Luo wrote:
> On Tue, Nov 28, 2023 at 12:00 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > - You have marked a patch with a "Fixes:" tag for a commit that is in an
> >   older released kernel, yet you do not have a cc: stable line in the
> >   signed-off-by area at all, which means that the patch will not be
> >   applied to any older kernel releases.  To properly fix this, please
> >   follow the documented rules in the
> >   Documentation/process/stable-kernel-rules.rst file for how to resolve
> >   this.
> 
> I don't see a need for this patch to go into stable kernels after
> reviewing Documentation/process/stable-kernel-rules.rst, please let me
> know if you think otherwise.

If you think this fixes a bug in the existing code, why wouldn't it be
needed?

Also, this implies that you will not be wanting it backported to any
chromeos or android kernels?

thanks,

greg k-h

