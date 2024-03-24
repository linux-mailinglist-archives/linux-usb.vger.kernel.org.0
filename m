Return-Path: <linux-usb+bounces-8199-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85810887B4D
	for <lists+linux-usb@lfdr.de>; Sun, 24 Mar 2024 02:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6FD51C20CAB
	for <lists+linux-usb@lfdr.de>; Sun, 24 Mar 2024 01:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20AAAEC4;
	Sun, 24 Mar 2024 01:16:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id E23E8A50
	for <linux-usb@vger.kernel.org>; Sun, 24 Mar 2024 01:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711242966; cv=none; b=nyjreY8G5OhDijTLEtl7+QNwI5PiTM7GHekAsHGpLAxQJX4f412ViEYEznRYdCz3CBupX+fRk7qah1uPaQNQkg8qTAX/8eQud0et1C3RVIPXEZcwtZrbkHkIbjHPj6IL9lz746gFBQIJbF07Qaw2sX/AeRI4O5bsmzVZ2rd2wpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711242966; c=relaxed/simple;
	bh=mzHVKCiZ56ALFBV7ryVhtBdGHCMKgNnQ+S46dJqSans=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aizgGYa0KKdrS9ckyu77kRgHrOYsrgzMIL3kLJIY6uaBc4IvhsJko/iWbkizW8M4Qy1nMJl4pJjiQpRCNqayMYOCxdmFUb04jTGAblVBPQxXxLlfOyDV7Sw46lJ9GET+JJtkuvcNdHPtnV/JNGjYKrgt8KMif9Ut44w6SjXYpks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 803520 invoked by uid 1000); 23 Mar 2024 21:16:02 -0400
Date: Sat, 23 Mar 2024 21:16:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
  lvc-project@linuxtesting.org
Subject: Re: [PATCH v2] usb: storage: isd200: fix sloppy typing in
 isd200_scsi_to_ata()
Message-ID: <9c0fd456-078a-4bc1-9a07-1a6605a5b85e@rowland.harvard.edu>
References: <8d6beef7-5995-c831-a7b6-ff98d3887231@omp.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d6beef7-5995-c831-a7b6-ff98d3887231@omp.ru>

On Sat, Mar 23, 2024 at 10:55:51PM +0300, Sergey Shtylyov wrote:
> When isd200_scsi_to_ata() emulates the SCSI READ/WRITE (10) commands,
> the LBA is a 32-bit CDB field and the transfer length is a 16-bit CDB
> field, so using *unsigned long* (which is 32-bit type on the 32-bit
> arches and 64-bit type on the 64-bit arches) to declare the lba and
> blockCount variables doesn't make much sense.  Also, when it emulates
> the READ CAPACITY command, the returned LBA is a 32-bit parameter data
> field and the ATA device CHS mode capacity fits into 32 bits as well,
> so using *unsigned long* to declare the capacity variable doesn't make
> much sense as well. Let's use the u16/u32 types for those variables...
> 
> Found by Linux Verification Center (linuxtesting.org) with the SVACE
> static analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

> ---
> This patch is against the 'usb-next' branch of Greg KH's usb.git repo...
> 
> Changes in version 2:
> - fixed up the lba and blockCount variable declarations;
> - removed the typecasts from the blockCount variable calculation;
> - undid the reordering of the capacity variable declaration;
> - completely rewrote the patch description.
> 
>  drivers/usb/storage/isd200.c |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> Index: usb/drivers/usb/storage/isd200.c
> ===================================================================
> --- usb.orig/drivers/usb/storage/isd200.c
> +++ usb/drivers/usb/storage/isd200.c
> @@ -1232,8 +1232,8 @@ static int isd200_scsi_to_ata(struct scs
>  	int sendToTransport = 1;
>  	unsigned char sectnum, head;
>  	unsigned short cylinder;
> -	unsigned long lba;
> -	unsigned long blockCount;
> +	u32 lba;
> +	u16 blockCount;
>  	unsigned char senseData[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
>  
>  	memset(ataCdb, 0, sizeof(union ata_cdb));
> @@ -1291,7 +1291,7 @@ static int isd200_scsi_to_ata(struct scs
>  
>  	case READ_CAPACITY:
>  	{
> -		unsigned long capacity;
> +		u32 capacity;
>  		struct read_capacity_data readCapacityData;
>  
>  		usb_stor_dbg(us, "   ATA OUT - SCSIOP_READ_CAPACITY\n");
> @@ -1316,7 +1316,7 @@ static int isd200_scsi_to_ata(struct scs
>  		usb_stor_dbg(us, "   ATA OUT - SCSIOP_READ\n");
>  
>  		lba = be32_to_cpu(*(__be32 *)&srb->cmnd[2]);
> -		blockCount = (unsigned long)srb->cmnd[7]<<8 | (unsigned long)srb->cmnd[8];
> +		blockCount = srb->cmnd[7] << 8 | srb->cmnd[8];
>  
>  		if (ata_id_has_lba(id)) {
>  			sectnum = (unsigned char)(lba);
> @@ -1348,7 +1348,7 @@ static int isd200_scsi_to_ata(struct scs
>  		usb_stor_dbg(us, "   ATA OUT - SCSIOP_WRITE\n");
>  
>  		lba = be32_to_cpu(*(__be32 *)&srb->cmnd[2]);
> -		blockCount = (unsigned long)srb->cmnd[7]<<8 | (unsigned long)srb->cmnd[8];
> +		blockCount = srb->cmnd[7] << 8 | srb->cmnd[8];
>  
>  		if (ata_id_has_lba(id)) {
>  			sectnum = (unsigned char)(lba);

