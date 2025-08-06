Return-Path: <linux-usb+bounces-26543-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B43B1C7F7
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 16:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C36F74E239E
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 14:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CAA259CA1;
	Wed,  6 Aug 2025 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="g+mLpn+p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F408D1DB13A
	for <linux-usb@vger.kernel.org>; Wed,  6 Aug 2025 14:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754491984; cv=none; b=qQBqCXi2jMBMW1mrqWK7+R7Q3EwPIlpwdMOgYSTV8SSVcTFHNo8k8JiGhkVwHpaLUHDAKZVpGfFcIXwTUhqO/aYRyNxEFctsCfqAjHcfcUTmIYlsSI5UZY6ZkHo/oH/SrHz71wPz1aYyCxa7cL2Oal3UjEem2/U41q9T7/nyNRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754491984; c=relaxed/simple;
	bh=FT9NAZayKdDI27pzthIX2Z1Z5soBuTXgGl2ftAlcFdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQpVdUHOemBxNB0/I8srNC9+VIqazgPk0Y+iFd7Z3lKsBf1HdluTUs92icHP9W+b4pvBT91PCqkD5hBLokzdaWGGGh+gX2NHTQK+cDARWEgn1VsIUY9yrkZ4CDchbAkHVV5stWveZMf5yDOBGGk2LexRUAUlRIoSbp0ZQe8UGcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=g+mLpn+p; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ab61ecc1e8so38097021cf.1
        for <linux-usb@vger.kernel.org>; Wed, 06 Aug 2025 07:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1754491982; x=1755096782; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y49um8k48nE0B08AM4u/UHZ2Qks552cSP9p7KiLp1/4=;
        b=g+mLpn+pmopqU9D0ATr/URwdJhP0xUo02xFMXkngIxSiXfEtOVKzeVzJcTzHCSeavt
         nqh7wR9dysrYi24Dd+qsBiEQpYOMEzGs4luez6RXa2clRGBrem5I7v9eQ+csS7n5blAY
         JdAex/vaC64D5r0h6lVN7/vQoWIguVVmb1DNolqGWOI/4RCCURO7lm0S0JVb/CFUfyed
         CmkEcx+2czTn55OGpNzeDHydTx01zvWZPdEQyPsBRMPBOpAZgxkKZvUt2fFL+2L5qjzb
         YAC50iPr1sE3sHENphhZlDFuPlpslMOnAZtOYN3W+0qSHXJzhpQXOE4xMi0hj4mcrKJk
         SFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754491982; x=1755096782;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y49um8k48nE0B08AM4u/UHZ2Qks552cSP9p7KiLp1/4=;
        b=wwbbwslWqXwdSgnblGfKsI16l4xYxC4Qduf/mbGveoK6DAySjL7i+6CxSLhm3zkp4n
         J/tev1TlExBdryl3Ez5HxvVSsX4+8FCcclxm49hJbNPRBSh/4TzHCJLg2TZ/9B+Zj1zE
         UNqlE9s79BRfscKxaXqhsj/nkd1LU0KMRfSiMwTxElNOyp8WVOLoP2uTDE5WyZ6O8zIz
         4Awo8Ap22WXj7WSy7OWPK8hb2ilTvv4Jmo08FHDH/7Y1LMKZ9uqrWdrsuCsxscU6rh2J
         Hw2f5IKQYk9LLbbK2T8qgwUeMb8urihjLGkTh8Tp5VuiKuKidvbgX5S0Y07aYl9MseqS
         0v4A==
X-Gm-Message-State: AOJu0Yx4G6wP4Cf+EG26X06sBI+n3FFkD5FjsP4QgUgdDfV8Q5JS5MTZ
	txdJz2xiKXd8+1uiFyxtkyG2iZzozefWy9OUnWfruRA1+mGtDOxrakwcBb0S3Xz5gA==
X-Gm-Gg: ASbGncuVKg8qad8rvPHDYgI7GHY5MiuSW5udsX2+0XYvk598t9tqGk8+WScM/7Fw1tB
	5wh/K3HPu0BUcMDhwlabl6ajviSDmNj8QDjwBx3sDc/qaXBcMhr1XzOV7gy6ZxnyK4BFmT2hQ76
	bctfPmPSlXj0HvWbJfW20i6LJykpjmgVWeLNBL3SBYWaoCkSsGevRK6e0YzAUqf9F6HisRLnnBK
	d6W0ckoifrmodv2gun8g4C/gzMbdyibo+5OBmLR9RGIdQwYJ3wFqGNHUcVWmPVl9sSkBEQ0/rAO
	ur2GZ76NpvF14r8uxR1UaixPLg/xljjMvmPIlUDUXSV/Pww5ak96OK4TdR7Ug+tIgzi7yC5vyOx
	ErqGh+Bm7td4k0fL1QAAbUScJhFS19l509kPmTM1d
X-Google-Smtp-Source: AGHT+IH1wqoI6decNxwgKRqP11WqL9KAB2bDN5/g7e8aK8peDiOJal2c2/0M5WjTN1Upv13s0s9prQ==
X-Received: by 2002:a05:622a:1191:b0:4ab:38c1:f9bd with SMTP id d75a77b69052e-4b0924dd3c2mr42118451cf.12.1754491981724;
        Wed, 06 Aug 2025 07:53:01 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0780a0316sm31471251cf.43.2025.08.06.07.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 07:53:00 -0700 (PDT)
Date: Wed, 6 Aug 2025 10:52:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mael GUERIN <mael.guerin@murena.io>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] usb-storage: Add unusual-devs entry for Novatek
 NTK96550-based camera
Message-ID: <63e45e57-c3c1-40e3-8ad5-af3834584a60@rowland.harvard.edu>
References: <20250806134722.32140-2-mael.guerin@murena.io>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250806134722.32140-2-mael.guerin@murena.io>

On Wed, Aug 06, 2025 at 03:47:21PM +0200, Mael GUERIN wrote:
> Signed-off-by: Mael GUERIN <mael.guerin@murena.io>
> ---

Patches must have a nonempty description.  You can simply take the text 
of your 0/1 message and put it directly in the 1/1 email as the 
description.  Then there won't be any need for a separate 0/1 message.

>  drivers/usb/storage/unusual_devs.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
> index 54f0b1c83..7bb5a1d75 100644
> --- a/drivers/usb/storage/unusual_devs.h
> +++ b/drivers/usb/storage/unusual_devs.h
> @@ -262,6 +262,13 @@ UNUSUAL_DEV(  0x0421, 0x06c2, 0x0000, 0x0406,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_MAX_SECTORS_64 ),
>  
> +/* Added by Maël GUERIN <mael.guerin@murena.io> */
> +UNUSUAL_DEV(  0x0603, 0x8611, 0x0000, 0xffff,
> +		"Novatek",
> +		"NTK96550-based camera",
> +		USB_SC_SCSI, USB_PR_BULK, NULL,
> +		US_FL_BULK_IGNORE_TAG ),

See the instructions at the start of this file.  Entries are supposed to 
be sorted by Vendor ID and then Product ID.

Alan Stern

> +
>  #ifdef NO_SDDR09
>  UNUSUAL_DEV(  0x0436, 0x0005, 0x0100, 0x0100,
>  		"Microtech",
> -- 
> 2.50.1
> 

