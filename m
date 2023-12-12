Return-Path: <linux-usb+bounces-4038-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EB280EABE
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 12:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ACA128204F
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 11:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCEF5DF08;
	Tue, 12 Dec 2023 11:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y3aY10B2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D351F5D4A5
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 11:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF18C433C8;
	Tue, 12 Dec 2023 11:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702381522;
	bh=W+wu89yS6ISCTJNOIGobljSOiLONbTsNZcOU+gHhOC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3aY10B2veYLe39QbwiYhKctBqWU8+cZIFtuv8UrnHy7ioljgw+VVW/xAlNjlKfN2
	 B2WnPBwXc/oNFPrFR2vlf6kGBIrDUmXXWXG+4P3vtUSvEp5aa4zPgdvg2FvtTcrLJH
	 5ncaF+llV88ZZGQLVK7doz79ajaV9ARwFxKCa/o0=
Date: Tue, 12 Dec 2023 12:45:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: shitao <shitao@kylinos.cn>
Cc: alcooperx@gmail.com, chunfeng.yun@mediatek.com,
	justin.chen@broadcom.com, kernel-bot@kylinos.cn,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: mtu3: fix comment typo
Message-ID: <2023121208-tattoo-grief-a78b@gregkh>
References: <2023121216-shabby-hastily-f094@gregkh>
 <20231212110959.3115422-1-shitao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212110959.3115422-1-shitao@kylinos.cn>

On Tue, Dec 12, 2023 at 07:09:59PM +0800, shitao wrote:
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: shitao <shitao@kylinos.cn>
> ---
> Hi,
> according to your suggestion, I have split it into two patches and added some simple instructions.
> This is about fixing the misspelling of "empty" in the mtu3_qmu.c file. 
> thanks.
>  drivers/usb/mtu3/mtu3_qmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_qmu.c b/drivers/usb/mtu3/mtu3_qmu.c
> index 3d77408e3133..03f26589b056 100644
> --- a/drivers/usb/mtu3/mtu3_qmu.c
> +++ b/drivers/usb/mtu3/mtu3_qmu.c
> @@ -221,7 +221,7 @@ static struct qmu_gpd *advance_deq_gpd(struct mtu3_gpd_ring *ring)
>  	return ring->dequeue;
>  }
>  
> -/* check if a ring is emtpy */
> +/* check if a ring is empty */
>  static bool gpd_ring_empty(struct mtu3_gpd_ring *ring)
>  {
>  	struct qmu_gpd *enq = ring->enqueue;
> -- 
> 2.34.1
> 

I would strongly suggest that you practice kernel patches in the
drivers/staging/ portion of the kernel, as that is where people learn
how to do this properly, and not bother other subsystems or developers.

Please start there and learn the basics, and then you can move to other
portions of the kernel as you will not be making simple mistakes like
you are here (hint, you forgot to version your patch, AND you forgot a
changelog...)

thanks,

greg k-h

