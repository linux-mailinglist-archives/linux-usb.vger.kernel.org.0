Return-Path: <linux-usb+bounces-25173-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C23C3AEB9DD
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 16:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3EF21891F09
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 14:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637772E3AEC;
	Fri, 27 Jun 2025 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="fSZhaWoE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE722E1C79
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 14:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034537; cv=none; b=Xh8ZXP5ZDC6fi5btWIo+YXUw255nb+nvPgwYDzIvF2X6R43MgXVb3BwWQ5NCMQuJqFq8piyx74CmNFKJ6aju8K68xtuiLyT/ZI4O9lFVYdRvsBiB0E9UxYllr3WvS0cfahSitIxyLN52f9GQYoo7JDCRjV42mU/NAXf8Oq+ngks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034537; c=relaxed/simple;
	bh=KpatdQizjtFhLtep6XDpgDVmkA3+kxWZBf7goof4Im8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PeCyIv8eIrg/fzVwlEF1XAiZSFUjexah2wgFJUzuse0XS3loGLGmc1zlhhzNC/J87XU0zmZR67dKmfcHFs1b4LazlCVYNYkVVWw9Q4TEaYH3/HOo4Xdx/8KtuzbMoJXeio2hRazsdi9LKQA07daQboJca+JttFm9u2UY0n6DPC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=fSZhaWoE; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fac7147cb8so37006506d6.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 07:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751034535; x=1751639335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C770HeWnbg8TH5iYglRt3200XdihOLprXIOYlhNWMgc=;
        b=fSZhaWoEhxxSWvb5PyaGEii20wD3PKAjnerxWPIkgg800uLUoTmzV9fZIKug+VJcUv
         LIgdwFA0mVMlCHV007x6crCvdgMAC+15MQRmCxjdXG+isC1z+rX3SEl08If5y9XRxeVG
         uer0nqpW7ibpu09U2/7GyYOYH7wvzfbfxIP3e1ipyeL0d48qFeJmA2tOkurxfLyY0Z3L
         5gYmK+Z0SHnqWihIGcycIkDupWUKKs/dZ3rEysdl3Mf2qJjnZWDpHrusYgWyt8rJsw5W
         xoWt/T3E1b2D0yUqRcGbWCPMf/V7wx5xv+MwunyHXpoPBp+m7F2gIhtUgdJkDkotMF8X
         6OPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034535; x=1751639335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C770HeWnbg8TH5iYglRt3200XdihOLprXIOYlhNWMgc=;
        b=rZObRiCfYUJcrJ3jpyxgsyhIG0hKP1blLPw66X7thjxUNtvPnvUyJ4DLkGufJ16/86
         Tq+MAQueggWhlzIpzvbpUCGN3Ttg6+yKJqcDVYJtoqTvXQjV0higjHGVObCO3pAjxcef
         BHC6yYJ01t/nrvTlaMVL5iJnrSWtmfXviZLg+yTpM/5nfzRZZho3dWQL7NmrmP/JJvOK
         45TN4iH9Jl0sw82sLGCVLOpVhF3WtVPofcCvP7v0FTLukJDOCbWbqZ5Rp/nZxCAJP/JT
         2cgqq3990o1K90SRkGqdQoHjRICstkzcATKPNWoHQiTwJjfm1TYY9q8GOmgE6XhhGQAQ
         039g==
X-Forwarded-Encrypted: i=1; AJvYcCVfNZCvbDuO/zoBXy93DRHOWOnLkeEb3xZDDWmuZX1tgitchxn2VOub72JIdUzoGMk9a84d0qsnG4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkMxOV/QZPZgATjE/LORn9d0HgC5CF8KLzBGoyhpSfBf5upIy7
	XnEoW4wjdru7CnSv6jdpkhfCMiZdBYp100MAqCz0vfguhFT1JWvF6VY0/jrv/yiVmA==
X-Gm-Gg: ASbGncv9V4cTMVq+15UCoH7CtZ1h3yMx2S4bd5WL42CFz06am/gzD2V7k+ssWucQwon
	mw9dNyeG8605EJM+/HsncruN7PNyB45mOCXvxRxe+kZilbC4v57apZM6Zl1HJHnFU+bygkR3CLo
	3LDaxiFylzla+s/ijj1phjogF6XmjTLzHHJ992Qn0sQio7mUDDu8aHk0xUeHg9DankldCB0f9UR
	mSyZC6OW+NfNPH36Dy84OlqsQSxopMUcN/kiX8nHSzTgtPk8P3gGUIndSoIS0g4J5Mq5KufRqGM
	REbXXquJazRsKdy7qZ0InZfMcamkU8QG2sFMNseRtyPR88qJ7HUFoj1vS6aWWR54SAiCXoIGSNq
	L2gNU
X-Google-Smtp-Source: AGHT+IEEz4pxaZd2p26Wd0rHmX3QxRvSCJOIV13uXvr66DRvtIABRuX0xyFBcsiRJ4IyA8rPeXFOdw==
X-Received: by 2002:a05:6214:5784:b0:6fa:cc39:95 with SMTP id 6a1803df08f44-6fffdcfe051mr54002316d6.11.1751034535284;
        Fri, 27 Jun 2025 07:28:55 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ac96sm21006076d6.105.2025.06.27.07.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:28:54 -0700 (PDT)
Date: Fri, 27 Jun 2025 10:28:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: mon_text: find valid buffer offset for iso transfer
Message-ID: <8a251c8b-5ec6-4238-bdcd-8d8001fd06df@rowland.harvard.edu>
References: <20250627105651.3653231-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627105651.3653231-1-xu.yang_2@nxp.com>

On Fri, Jun 27, 2025 at 06:56:51PM +0800, Xu Yang wrote:
> The valid data doesn't always begin at the buffer head in case
> iso_frame_desc is larger than 1. Otherwise, the output info will be
> meaningless.

Not so.  usbmon intentionally copies the entire isochronous transfer 
buffer, even if only part of it was used for the actual transfer.

> This will find the valid iso transfer frame and return correct start
> address offset of buffer.

Even if this were the right thing to do, how come you didn't make a 
similar modification to mon_bin.c?

> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/mon/mon_text.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/mon/mon_text.c b/drivers/usb/mon/mon_text.c
> index 68b9b2b41189..4929c7f5abd0 100644
> --- a/drivers/usb/mon/mon_text.c
> +++ b/drivers/usb/mon/mon_text.c
> @@ -145,6 +145,8 @@ static inline char mon_text_get_setup(struct mon_event_text *ep,
>  static inline char mon_text_get_data(struct mon_event_text *ep, struct urb *urb,
>      int len, char ev_type, struct mon_bus *mbus)
>  {
> +	struct usb_iso_packet_descriptor *isoc_desc;
> +	int i, offset = 0;
>  	void *src;
>  
>  	if (len <= 0)
> @@ -160,8 +162,16 @@ static inline char mon_text_get_data(struct mon_event_text *ep, struct urb *urb,
>  			return '>';
>  	}
>  
> +	if (usb_pipeisoc(urb->pipe)) {
> +		isoc_desc = urb->iso_frame_desc;
> +		for (i = 0; i < urb->number_of_packets &&
> +		     !isoc_desc[i].actual_length; i++)
> +			continue;
> +		offset = isoc_desc[i].offset;
> +	}
> +
>  	if (urb->num_sgs == 0) {
> -		src = urb->transfer_buffer;
> +		src = urb->transfer_buffer + offset;
>  		if (src == NULL)
>  			return 'Z';	/* '0' would be not as pretty. */
>  	} else {

And how come you didn't modify this branch of the "if"?

Alan Stern

