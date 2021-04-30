Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C20C36F497
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 05:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhD3Dom (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Apr 2021 23:44:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:51810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229577AbhD3Dol (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Apr 2021 23:44:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7DDB613B3;
        Fri, 30 Apr 2021 03:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619754234;
        bh=Uwgal+RO9pvP/cAo8FmR3b0ptCw4A1MX347Fnc8A2Hg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iWHYUbk4SnSX8iCUOLwarP/XVOqC6td8w3DEao+7rrhwXE5w3MbRaaG/IeZrOPtLL
         lPnQWiPeyTmEl9P1DxIktYL7MvzcY5vGzLGB0R2g1qCVP5ZSuI3BGcViCuEuhOuxpD
         CYSWg8o84h5k00VBgAEOjFtiQWdba8drsP1Xa0Vbqdo7FHO8HHTX0E85Ys1njjKMW2
         ByXChrntHsVTWhEtecPcYh6wSkdSbCPK7kRsdSUPA5AFTxLFIcLfkvxODf3RUEc0GO
         kiq3fL2g9+QS4JCvLLgwKQEPtgAf/wiDLhGgPkMz3O5v6DQ3PEDVoD6kBDNloh5tXa
         M0/I7LA4sNiow==
Date:   Fri, 30 Apr 2021 11:43:49 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Pawel Laszczak <pawell@cadence.com>
Cc:     gregkh@linuxfoundation.org, dan.carpenter@oracle.com,
        linux-usb@vger.kernel.org, kurahul@cadence.com
Subject: Re: [PATCH] usb: cdnsp: Useless condition has been removed
Message-ID: <20210430034349.GB3842@nchen>
References: <20210429084914.12003-1-pawell@gli-login.cadence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429084914.12003-1-pawell@gli-login.cadence.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-04-29 10:49:14, Pawel Laszczak wrote:
> From: Pawel Laszczak <pawell@cadence.com>
> 
> Patch removes the warning "variable dereferenced before
> check 'pdev->dcbaa'" from cdnsp_mem_cleanup.

You may describe the real problem you fix, but not the warning
message from some auto build system.

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> ---
>  drivers/usb/cdns3/cdnsp-mem.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
> index 5d4c4bfe15b7..a47948a1623f 100644
> --- a/drivers/usb/cdns3/cdnsp-mem.c
> +++ b/drivers/usb/cdns3/cdnsp-mem.c
> @@ -1082,9 +1082,8 @@ void cdnsp_mem_cleanup(struct cdnsp_device *pdev)
>  	dma_pool_destroy(pdev->device_pool);
>  	pdev->device_pool = NULL;
>  
> -	if (pdev->dcbaa)
> -		dma_free_coherent(dev, sizeof(*pdev->dcbaa),
> -				  pdev->dcbaa, pdev->dcbaa->dma);
> +	dma_free_coherent(dev, sizeof(*pdev->dcbaa),
> +			  pdev->dcbaa, pdev->dcbaa->dma);
>  
>  	pdev->dcbaa = NULL;
>  
> -- 
> 2.25.1
> 

-- 

Thanks,
Peter Chen

