Return-Path: <linux-usb+bounces-4157-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 918EC812F97
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 13:01:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22CDB281D54
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 12:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E5C4121F;
	Thu, 14 Dec 2023 12:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nxn94L0e"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E063C471
	for <linux-usb@vger.kernel.org>; Thu, 14 Dec 2023 12:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3627CC433C7;
	Thu, 14 Dec 2023 12:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702555271;
	bh=wmm5VJo/mf86B2edEvK+x/I76cDLt+Rwo3WycGSRNeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nxn94L0eTM+dosoYMAZwO5Nhsfsj+mHXd6gDdnie5TUaqtXT5sh8koDS6+ptBGzrU
	 JwMLf7DrDmjG9U2CKgyN7eNweDtYDYKbVpjDN5vV8MwvHMIrdfMumuqzWMs2+Lh5US
	 diwi/ElJKUuUrTjLg/o8gQ3VgENbiJ8hp2/s0UE0=
Date: Thu, 14 Dec 2023 13:01:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: peter.chen@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, luca.ceresoli@bootlin.com,
	jun.li@nxp.com, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] usb: chipidea: ci_hdrc_imx: add wakeup clock and
 keep it always on
Message-ID: <2023121447-consent-decent-7c69@gregkh>
References: <20231214112622.2412321-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214112622.2412321-1-xu.yang_2@nxp.com>

On Thu, Dec 14, 2023 at 07:26:20PM +0800, Xu Yang wrote:
> Some platform using ChipIdea IP  may keep 32KHz wakeup clock always
> on without usb driver intervention. And some may need driver to handle
> this clock. This patch will get wakeup clock and keep it always on to
> make controller work correctlly.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 

Why do I have 2 different copies of this series?  Please fix up and send
a v2 and describe what changed...

thanks,

greg k-h

