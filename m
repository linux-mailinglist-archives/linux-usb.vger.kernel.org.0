Return-Path: <linux-usb+bounces-2216-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A8B7D823D
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 14:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D0EEB2132C
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 12:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B1E2D7B2;
	Thu, 26 Oct 2023 12:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rsvy5vG0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DEB2D04E
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 12:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCB9C433C7;
	Thu, 26 Oct 2023 12:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698321978;
	bh=oc+8EGwJv3pFq0lsAUehXOOja+Aoub3w/XTW0b6Dd38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rsvy5vG0ErV1wrfzcjw6mAofeCRe+mbpXmA8qBiOCleMI2KKJ4cdG9omV3WBlIITV
	 Vvupg95Aa61o9AXHs+uqLxU46i0fJdYszKN21iql5ctj5LD/TwckfAgz3x8CJittkP
	 DpK2qfzN180fOYIbiUsSnk8h/0ZUqIaBAWKwaK8ibsASULkVstKMYLHV0DBMrY5+6h
	 7TVTx2CCxYQlfsC0SwJ59wepPCMZ88kGvzuRquRbqRajDf4GrfkU/3NDIII21HxQbQ
	 NPvCq1sRj141iq6fUUfmvlfoplgUaBe5TThXGAHw/B6+VtrSLUNA1+G1k179d2cQ9/
	 dahI1qHO4xC7w==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qvz8L-0003FY-0B;
	Thu, 26 Oct 2023 14:06:41 +0200
Date: Thu, 26 Oct 2023 14:06:41 +0200
From: Johan Hovold <johan@kernel.org>
To: "Puliang Lu(Puliang)" <puliang.lu@fibocom.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] USB: serial: option: add Fibocom to DELL custom modem
 FM101R-GL
Message-ID: <ZTpWUYCkaGGGlG5Z@hovoldconsulting.com>
References: <TYZPR02MB508866DABCF200C7687E184889DDA@TYZPR02MB5088.apcprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR02MB508866DABCF200C7687E184889DDA@TYZPR02MB5088.apcprd02.prod.outlook.com>

On Thu, Oct 26, 2023 at 11:44:37AM +0000, Puliang Lu(Puliang) wrote:
> On Tue, 24 Oct 2023 09:24:20 +0200, Johan Hovold wrote:
> 
> > No, this patch is already in Linus's tree so that's not possible. But
> > please do send a follow-up incremental fix.

> Thank you for your reply. 
> We have decided not to address this issue because it does not 
> affect the operation of modem. 

No, that's not the way things work.

Please do send an incremental fix so that this is corrected. Otherwise
I'll just revert your patch.

Johan

