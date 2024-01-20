Return-Path: <linux-usb+bounces-5312-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D27AB83361A
	for <lists+linux-usb@lfdr.de>; Sat, 20 Jan 2024 21:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89C3F282C46
	for <lists+linux-usb@lfdr.de>; Sat, 20 Jan 2024 20:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49E312E69;
	Sat, 20 Jan 2024 20:58:32 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 70A7F10A38
	for <linux-usb@vger.kernel.org>; Sat, 20 Jan 2024 20:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705784312; cv=none; b=gjk42hRiWrQjiksopLPIIMDU7E6k53Vu4ct73CUSwVn9a8Wt+JXXhAdzzLkJmRA1C2Je84mQhtLEt+jR90fp3wIqUsRCeAXg+QDdGj/BDuqhZEIe+1S7rzU/lqz+KnfrzTNbquPQIR3XmK3SZnCf1vQvDltQHenB61KtondvCtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705784312; c=relaxed/simple;
	bh=kcF1iQw+idIZ4LpRYRCEgdD/9u6nZtOUC23OpzZKOhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ey2JWlQei5RDEKua+98e4IQRWWAtjHVSo1zx5Ka9St3iu5QOuw1pwH2N9E3ZLpDJpNr7yIDix83mRqTIdUfGjLYVdnX3C7p0ltwSWxl/sFk+awm7Sb6WWvYBAfUt99MLar6dpSdXKPX7kZT6f+lTHs3bB4fzimTyue8kSXtGjLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 83438 invoked by uid 1000); 20 Jan 2024 15:58:21 -0500
Date: Sat, 20 Jan 2024 15:58:21 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
  Karina Yankevich <k.yankevich@omp.ru>, lvc-project@linuxtesting.org
Subject: Re: [PATCH v3] usb: storage: sddr55: fix sloppy typing in
 sddr55_{read|write}_data()
Message-ID: <acfb07e5-949f-4be5-b109-03875cb61f8d@rowland.harvard.edu>
References: <0c219fd9-6b11-9c20-3dec-7dc5beaff379@omp.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c219fd9-6b11-9c20-3dec-7dc5beaff379@omp.ru>

On Sat, Jan 20, 2024 at 11:15:11PM +0300, Sergey Shtylyov wrote:
> In sddr55_{read|write}_data(), the address variables are needlessly typed
> as *unsigned long* -- which is 32-bit type on the 32-bit arches and 64-bit
> type on the 64-bit arches; those variables' value should fit into just 3
> command bytes and consists of 10-bit block # (or at least the max block #
> seems to be 1023) and 4-/5-bit page # within a block, so 32-bit *unsigned*
> *int* type should be more than enough...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Signed-off-by: Karina Yankevich <k.yankevich@omp.ru>
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

> This patch is against the 'usb-next' branch of Greg KH's usb.git repo...
> 
> Changes in version 3:
> - rewrote the patch subject and description.
> 
> Changes in version 2:
> - compeltely redid the patch.
> 
>  drivers/usb/storage/sddr55.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Index: usb/drivers/usb/storage/sddr55.c
> ===================================================================
> --- usb.orig/drivers/usb/storage/sddr55.c
> +++ usb/drivers/usb/storage/sddr55.c
> @@ -196,7 +196,7 @@ static int sddr55_read_data(struct us_da
>  	unsigned char *buffer;
>  
>  	unsigned int pba;
> -	unsigned long address;
> +	unsigned int address;
>  
>  	unsigned short pages;
>  	unsigned int len, offset;
> @@ -316,7 +316,7 @@ static int sddr55_write_data(struct us_d
>  
>  	unsigned int pba;
>  	unsigned int new_pba;
> -	unsigned long address;
> +	unsigned int address;
>  
>  	unsigned short pages;
>  	int i;
> 

