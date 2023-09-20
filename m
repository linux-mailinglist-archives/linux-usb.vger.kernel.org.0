Return-Path: <linux-usb+bounces-408-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F017A7418
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 09:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D25D61C20A77
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 07:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5268C09;
	Wed, 20 Sep 2023 07:29:32 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5F97497
	for <linux-usb@vger.kernel.org>; Wed, 20 Sep 2023 07:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE9EC433C8;
	Wed, 20 Sep 2023 07:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695194971;
	bh=R/LetqBjqdPDGe4IllLhQOI0/OP/i4mhWyG/NZ4Z9g8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iGnvJcAQnGhOcewj3jr5C0mSBG+QwMhY1aK9vGtHCjuNXJOBTTnVzs8RiOApQYI/k
	 jjPSR98kIPhA7GHRGroW1KDL18ea8aagmHincHE4EdiA5wLDFgaXjz1WTvFlKTHbmX
	 9GOXVmKKBvkNoKYNdR8+0t1itFV5SOTxjcrYoo5gP9zr3q+DdHMrdd6AmArWL5pO8d
	 vnWJVUvdujgNebAUwwpK7VsqLP77ZQM0mpSMf3SzWk4G9ad2G25QUGYyI55AuNvPQt
	 RUkQpnZz7pPXBgVpGBVTxWYL+4D5ugxt9mRtxNv6dA7QR++EpaV7aLnQpa9anv2Rd3
	 awaCjJoINy2cg==
Message-ID: <65ddacbc-7094-5038-bc13-16bf209fc954@kernel.org>
Date: Wed, 20 Sep 2023 10:29:27 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] usb: cdns3: Modify the return value of cdns_set_active ()
 to void when CONFIG_PM_SLEEP is disabled
Content-Language: en-US
To: Xiaolei Wang <xiaolei.wang@windriver.com>, peter.chen@kernel.org,
 pawell@cadence.com, gregkh@linuxfoundation.org, pavel@denx.de
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230912064946.1405848-1-xiaolei.wang@windriver.com>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20230912064946.1405848-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Xiaolei,

On 12/09/2023 09:49, Xiaolei Wang wrote:
> The return type of cdns_set_active () is inconsistent
> depending on whether CONFIG_PM_SLEEP is enabled, so the
> return value is modified to void type.
> 
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://lore.kernel.org/all/ZP7lIKUzD68XA91j@duo.ucw.cz/
> Fixes: 2319b9c87fe2 ("usb: cdns3: Put the cdns set active part outside the spin lock")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>

Should this be CC to stable as the original patch which this patch is
fixing has made it into the stable trees.

> ---
>  drivers/usb/cdns3/core.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
> index 4a4dbc2c1561..81a9c9d6be08 100644
> --- a/drivers/usb/cdns3/core.h
> +++ b/drivers/usb/cdns3/core.h
> @@ -131,8 +131,7 @@ void cdns_set_active(struct cdns *cdns, u8 set_active);
>  #else /* CONFIG_PM_SLEEP */
>  static inline int cdns_resume(struct cdns *cdns)
>  { return 0; }
> -static inline int cdns_set_active(struct cdns *cdns, u8 set_active)
> -{ return 0; }
> +static inline void cdns_set_active(struct cdns *cdns, u8 set_active) { }
>  static inline int cdns_suspend(struct cdns *cdns)
>  { return 0; }
>  #endif /* CONFIG_PM_SLEEP */

-- 
cheers,
-roger

