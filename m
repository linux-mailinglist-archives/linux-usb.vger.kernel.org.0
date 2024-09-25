Return-Path: <linux-usb+bounces-15435-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C4098602B
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 16:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE86628AE4C
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 14:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321CC189B88;
	Wed, 25 Sep 2024 12:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMoD1iqA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82C7126BFE;
	Wed, 25 Sep 2024 12:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268128; cv=none; b=aJCxTE+bdNvlwkooLV4JSEcHMNhPUag/UJQHnVQc2lICIkIDVjaVR7KjJY1FmARub8Js4ozqeqe0Qq13OqJ6n58tTiD2fOrawDVYVkNtKv3iCUXvgcZts3yt5adm9U7q4wfQF/KGuW/UStscsDHEehNhhCBgcznudz6BIxizruU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268128; c=relaxed/simple;
	bh=RviQ7XP/byZMEWzCJLNTnKE/tSzDwAtKmV5Ks0aUShY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4bBylSrZuxXr8r1Dan8CXsyllRdvZCYu+ZouURURDdySmQ3i3POLP5re3qzTXpAbThHYm55f8BnO7RcbTKG8xuzPRY5qdwUwijOame7kosT0nrQBWKtsFvpUAnFVh+HbspYmYuHsOexNfPNHsSVD1nvhe0THLyCNtYRuwKkZI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMoD1iqA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E47C4CEC3;
	Wed, 25 Sep 2024 12:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727268128;
	bh=RviQ7XP/byZMEWzCJLNTnKE/tSzDwAtKmV5Ks0aUShY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMoD1iqAcLB52fN9SJajFfiXClsEMUP4agdph+FmFU4B5d+Ibo81kbKCGzm+Xa+mk
	 eLjK7Rz2r0GrOciMAUx5eJLrf0BJC4DMb0d06HIwFZm1gtv/5xQuOcMJEUPJNwISZA
	 OOXFNLrMw5siIZlqYKq0/wVy7rX1tOjHhjHJQFCyDTDZFp7GbKBXYbMGiTn5YvEQq/
	 dR0VQfiLDtCtrFG/4bIBYVnhgObmVfkkCQnJ/bEKaJf3HVfe7Dgn43xysp2uZSD+lD
	 qCYwrNxxI4C+tTKPUtzWdprk2ZCMuU5ABPixXX85Uuf8xRikxGLccZRIDORm7b1UwW
	 COuI5oIdFfeuQ==
Date: Wed, 25 Sep 2024 20:42:00 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: chipidea: udc: handle USB Error Interrupt if
 IOC not set
Message-ID: <20240925124200.GA417263@nchen-desktop>
References: <20240920094056.2680590-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920094056.2680590-1-xu.yang_2@nxp.com>

On 24-09-20 17:40:54, Xu Yang wrote:
> As per USBSTS register description about UEI:
> 
>   When completion of a USB transaction results in an error condition, this
>   bit is set by the Host/Device Controller. This bit is set along with the
>   USBINT bit, if the TD on which the error interrupt occurred also had its
>   interrupt on complete (IOC) bit set.
> 
> UI is set only when IOC set. Add checking UEI to fix miss call
> isr_tr_complete_handler() when IOC have not set and transfer error happen.
> 
> Fixes: 26c696c678c4 ("USB: Chipidea: rename struct ci13xxx variables from udc to ci")
> Cc: stable@vger.kernel.org
> Acked-by: Peter Chen <peter.chen@kernel.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Since this driver has used more than ten years for many vendors, I am
not sure if will affect others or not. Please do not CC stable tree, or
send it to stable tree when this patch at master more than half an year
without no one report issue.

Peter
> 
> ---
> Changes in v2:
>  - modify part commit message
>  - add Ack-by tag
>  - add fix tag and cc stable
> ---
>  drivers/usb/chipidea/udc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 95b697f08a76..e0092c735a75 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -2215,7 +2215,7 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
>  			}
>  		}
>  
> -		if (USBi_UI  & intr)
> +		if ((USBi_UI | USBi_UEI) & intr)
>  			isr_tr_complete_handler(ci);
>  
>  		if ((USBi_SLI & intr) && !(ci->suspended)) {
> -- 
> 2.34.1
> 

