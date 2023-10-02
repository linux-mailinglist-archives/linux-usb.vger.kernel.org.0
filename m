Return-Path: <linux-usb+bounces-931-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E37B7B5560
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 16:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 68BCE1C209C7
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 14:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF56F1A704;
	Mon,  2 Oct 2023 14:42:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10E61A271
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 14:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC76BC433CC;
	Mon,  2 Oct 2023 14:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696257726;
	bh=ZPe4pSy+Dt4W9BX0d9+pzF4Ly6fqblPVquBnBAbO524=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xHhYOolhqLdXf0jtTHPQXEYzzhmnRPr7W+48/8qX13OobehhBwF+AlEjuZOeS4A5w
	 cZIQ8ngKIbTrMQcsAi3R1xOkwp9ycYiuoSeNcGBh7vW+XAbil3ICr4LfE6xRSlV4Tp
	 M300cT2+RItXN3YzP/ymZrpEp7jM84D7cgNEidAs=
Date: Mon, 2 Oct 2023 16:42:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] usb: fix kernel-doc warning
Message-ID: <2023100253-aide-authentic-5aa1@gregkh>
References: <20230918193505.7046-1-swarupkotikalapudi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918193505.7046-1-swarupkotikalapudi@gmail.com>

On Tue, Sep 19, 2023 at 01:05:05AM +0530, Swarup Laxman Kotiaklapudi wrote:
> Fix kernel-doc warnings discovered in usb driver.
> Fixes this warning:
> warning: Function parameter or member 'gfladj_refclk_lpm_sel'
>          not described in 'dwc3'
> 
> Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
> ---
>  drivers/usb/dwc3/core.h | 2 ++
>  1 file changed, 2 insertions(+)

What commit id does this fix?

thanks,

greg k-h

