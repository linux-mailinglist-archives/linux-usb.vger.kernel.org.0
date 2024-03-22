Return-Path: <linux-usb+bounces-8140-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E5B886485
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 01:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D33A28339C
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 00:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B205F65C;
	Fri, 22 Mar 2024 00:57:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 82182376
	for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 00:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711069069; cv=none; b=L2xscIF+B0/3ZhylFuTbxkhST4NxNm2BPs7FMM/CI9+AIp9OfKUw1qdCJn2aistNDo33Q3W6J/CPRHsPF0Vxtw451+iuiqz7YTUrXKWKfUGD8MpcLWnrsU7CzhfiIDOm9Zl/l1kyrtCyuTHG9rZLXAafIVDJ/iwnXijE3Mr4BUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711069069; c=relaxed/simple;
	bh=Iiw6ykXxKdWbibIowY7DHjFuWFF0fye+9ZRLYCBjV+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfssTaAfVZcTxgCX65BDcJAiynPX5ZXYHEfXNY6oTTkJOm7dTMmuxE8lVwDsaEC+RVX/HfFp16gX+5VmoidkLR+FANK9g9SzSE2i+XO+il9xX8IuDfXPsMTsR+U6px6V5CEaEZYFe7gzzB3CBYwH2wNxiOp//bGk+g0t+Zx7oR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 741363 invoked by uid 1000); 21 Mar 2024 20:57:38 -0400
Date: Thu, 21 Mar 2024 20:57:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
  lvc-project@linuxtesting.org
Subject: Re: [PATCH] usb: storage: isd200: fix sloppy typing in
 isd200_scsi_to_ata()
Message-ID: <4e13319d-30a8-4274-bfa0-36d915b1e1ec@rowland.harvard.edu>
References: <e8c20e3c-3cbe-b5c1-f673-0a7f22566879@omp.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8c20e3c-3cbe-b5c1-f673-0a7f22566879@omp.ru>

On Thu, Mar 21, 2024 at 11:43:37PM +0300, Sergey Shtylyov wrote:
> When isd200_scsi_to_ata() emulates the SCSI READ CAPACITY command, the
> capacity local variable is needlessly typed as *unsigned long* -- which
> is 32-bit type on the 32-bit arches and 64-bit type on the 64-bit arches;
> this variable's value should always fit into 32 bits for both the ATA and
> the SCSI capacity data...
> 
> While at it, arrange the local variable declarations in the reverse Xmas
> tree order...
> 
> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
>  drivers/usb/storage/isd200.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: usb/drivers/usb/storage/isd200.c
> ===================================================================
> --- usb.orig/drivers/usb/storage/isd200.c
> +++ usb/drivers/usb/storage/isd200.c
> @@ -1283,8 +1283,8 @@ static int isd200_scsi_to_ata(struct scs
>  
>  	case READ_CAPACITY:
>  	{
> -		unsigned long capacity;
>  		struct read_capacity_data readCapacityData;
> +		u32 capacity;

This is a bit peculiar.  Why bother to change the type of the capacity 
variable without also changing the types of lba and blockCount at the 
start of the routine?

Alan Stern

