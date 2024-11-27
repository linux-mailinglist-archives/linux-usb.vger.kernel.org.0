Return-Path: <linux-usb+bounces-17909-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD1B9DAAB4
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 16:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAA121679B3
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 15:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B781FF7DC;
	Wed, 27 Nov 2024 15:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rDV+Lzps"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47DC1FF7D8
	for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2024 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732720965; cv=none; b=d0SwiRx9qACyK2pSOTbGKXxgMbJNrqs0Sd+4meiM9PO42UIbQKehktRhlLoZT5AmOpzJW6MYbmwwVmvXqKtW3EF5NUmVg9WM2C5YfQSi/2+HmQebGHAC5Xh+RMb+3yLilYaxa40gMChQmVKe+UCWSnJnIi2Pc2g1clo7PP01UyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732720965; c=relaxed/simple;
	bh=mrAaqMYnYNbYClnVnh8NslHC+9xBQHMgf6rc0Dm7Vjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=peOATgVWfxbLzMAuzrJZ/hyhQmq5iIruOiQje8psajMCKIChLyqh9N0pFptbLn/WRQPduTvWzxkPB5k4MATYIlst7GELAGIuceiZA9gC1+1sQrUobaWmGyNJrUC/9TgWND80Q868x+GZE2AP7mouaEJ06ogy/aVVBfKPDDvkRnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rDV+Lzps; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4668d7d40f2so25125981cf.1
        for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2024 07:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1732720962; x=1733325762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BY/Ou50N+gSwJiNfdjq4bSUvfb5j+LmncEk49Aqd0ho=;
        b=rDV+LzpsGbpKs/tVPED90GM+7W98iYZwrojHZh99ibNp0Dp9G6SBnW9Q3jQ61SVlnL
         F7+fr+nxaKy3dtw6SHzm/uW5jOwL4mDv84OuWOsM8fTokiE+rIN/nHT6ZdZGN/XGHE8i
         BVvdLwA6xRvzrrbuMB4kiyQ4xt6Ah4ty0cc7+1SKzclXvm80I9Xiuy50VgNVYiB4kb5v
         B9QL31QtgrUJXvEuR5NxaBkA/YuRMUYDg/OxnHV2ciHOqZFpWtvGbvFre2/6A793PVuj
         8R1BXvcwLBCTPvvDW6y1TK72fEt8JAjRM7AIQy775egWmmnlRy7ftQZJOLxZkckARhpT
         xmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732720962; x=1733325762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BY/Ou50N+gSwJiNfdjq4bSUvfb5j+LmncEk49Aqd0ho=;
        b=T7co36+3Pgpz+IfuG6Ee1DNuk5ZMs4IX0LQo8lAo85JVgT38zhTLWtTGXaE6y606eO
         cl1BrZubaRF1i4+Qj6x6bLn3FmpZK7wNblcDrvGUnd/ogZM/pVJMP5IdBQFgrdSUjPMy
         Kye1jObF85lKX/U2ThRlq9E0KoRlW/DOvj/H878y8ZtAqqp6ktCQAntLAUZ5UTOLGyZg
         Z+BiR0kRpSdLqJfm0dLs/p9ZtAuf6SQuTcMHxIWcwVNsikwkafqc0d/uNEweifqNQzKS
         56KIs/l73qg9OJBNb+f4FMv1A51EHlBcWCU/r7ViByWcssXF/zYUj5POGA0KZH8zGdbZ
         nJlA==
X-Gm-Message-State: AOJu0YwKKmSFvi4/qOyklxLnNmmZFH7tDIrY3L5CsWUHi7WbvC8sbdkM
	MRpHqdkAOr7uLpLsyEDBI5werlZKbTWU3lH/5lM4LesPRgv6cfySULGiSqhWVgPS/yCcoQZ8sEE
	=
X-Gm-Gg: ASbGncu92t5gtOViSZE1iSQY1gndUl4mI6QAfmfOp1sThzQ8FBs77z0fZ2Bhxaow0MY
	ciHdYBOXwPpMuWDV4oR/724SwDjEBo1mFWD8o3UxYhEmAHvXhYje9xrLCwyGoBiSXtcdoFGDKm1
	qexp+EyzEoFVDULHrnZF9q1Sn/cnUyJ1xxt903aaU1uxhIEc8YbZE83Actr/pleiBobW9N6lye0
	/0LbIaE/6BSQorFJaCZRC6rOt6jVvO+vCVpuxc3FFBdidIUWhg=
X-Google-Smtp-Source: AGHT+IHIsrqcr1EJxYcbm3xub5ocUmIHzG3fzWBDFRBcDC3VtyBMKmcEvizkXOFubDT/1p0F7dxWUA==
X-Received: by 2002:a05:622a:14a:b0:463:1677:c05 with SMTP id d75a77b69052e-466b36b88edmr38889331cf.54.1732720962451;
        Wed, 27 Nov 2024 07:22:42 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::32b3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-466a43545besm23240751cf.83.2024.11.27.07.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 07:22:42 -0800 (PST)
Date: Wed, 27 Nov 2024 10:22:39 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: David Disseldorp <ddiss@suse.de>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: collapse USB_STORAGE Kconfig comment
Message-ID: <3844413c-7d43-4402-98d6-91011f74a09e@rowland.harvard.edu>
References: <20241127072644.3591-2-ddiss@suse.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127072644.3591-2-ddiss@suse.de>

On Wed, Nov 27, 2024 at 06:26:45PM +1100, David Disseldorp wrote:
> The two Kconfig "comment" calls render in /proc/config.gz as split
> sections:
> ---
>  #
>  # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
>  #
> 
>  #
>  # also be needed; see USB_STORAGE Help for more info
>  #
> ---

You'll need to rewrite this message; the "---" lines will confuse 
people's patch-handling tools.

> 
> "make menuconfig" renders the comments as:
> ---
>  *** NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may ***
>  *** also be needed; see USB_STORAGE Help for more info ***
> ---
> 
> Kconfig doesn't support splitting a comment cleanly over two lines, so
> just collapse it into a single oversize comment.
> 
> Given the content of the comment, it might make more sense to change it
> to a '#' Kconfig source file comment, or drop it altogether.

I think making it one long line is fine.  When you resubmit, you can 
add:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> Signed-off-by: David Disseldorp <ddiss@suse.de>
> ---
>  drivers/usb/storage/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/storage/Kconfig b/drivers/usb/storage/Kconfig
> index d17b60a644efb..4be1d617d63db 100644
> --- a/drivers/usb/storage/Kconfig
> +++ b/drivers/usb/storage/Kconfig
> @@ -3,8 +3,7 @@
>  # USB Storage driver configuration
>  #
>  
> -comment "NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may"
> -comment "also be needed; see USB_STORAGE Help for more info"
> +comment "NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may also be needed; see USB_STORAGE Help for more info"
>  
>  config USB_STORAGE
>  	tristate "USB Mass Storage support"
> -- 
> 2.43.0

Alan Stern

