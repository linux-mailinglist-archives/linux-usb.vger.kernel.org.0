Return-Path: <linux-usb+bounces-30810-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DBEC7BA9F
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 21:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D84F93529E3
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 20:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5A12FF644;
	Fri, 21 Nov 2025 20:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wwKnVAGH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96CB28C037
	for <linux-usb@vger.kernel.org>; Fri, 21 Nov 2025 20:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763757666; cv=none; b=VUIua/fhy3m2yEu2aec1eTMi6NFY0bUcnsI7hSrTBtplu5cDqgBjUAn8JVMRUnGiXunuW+QMAaQyjThdXLEzmkFwpuxtm323AUjlOKgIDTqRVAHTadiiUwAskxcogJ19lKrj7q5hZVP523U+VjVb4jMdTRMKNHvAXpJ21aa8Jm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763757666; c=relaxed/simple;
	bh=NMxkjxxfi/VmUAmOtjMhMHlNO0QESm6HFC+8QL03Oxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpmIT6xkXMTPaiCVeAHO0VAiZ0GFPuuThEvWKUMN825g9j6SPdZNNK2YCT00kL1JhcL5XqYD1Uv5OTzP6ruH6MJPESaK7ptqsKfgeBoQxgZKCDIany+8i/b7G7BicNz5tpweevO5T3rpANKx9p3+UaUT3DYFtFhP7L7B+0bVkE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wwKnVAGH; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4ede6b5cad7so10562921cf.2
        for <linux-usb@vger.kernel.org>; Fri, 21 Nov 2025 12:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763757661; x=1764362461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sVwtHwtuxFV7DD+azapBNard2M9XZQlJ7UfyMdl29ew=;
        b=wwKnVAGHzJs+SyUFWk/0iUwzrDs3dtlAxbaLhe2cXHiAHIy6idBSgydeME8zrccY3A
         dhY4QnNPFUikAwEa2ys+JP8BvGO6xklLWJwDYNFbBNbTabT4i47yvOwQLuIBT3pgttj1
         lZGgLC8Waiyon91aOabb5wtgenr9v4TgtJqvY4nokFJnYdwce2C87S8q8nBzn2pp6Y/C
         iyQJK2M2FyYJe6EpKlg7oM/15OPzPiyvEoQt2rcetnZAxVh004gSe503dNUq9Mmsm2qq
         K/FGY5X4hQcXYX9kKjvhradT9xxl4mv9+7YF+j9qNmOfaj3A4lI50CPCUdl8qfk4iu58
         navg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763757661; x=1764362461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVwtHwtuxFV7DD+azapBNard2M9XZQlJ7UfyMdl29ew=;
        b=EKx8iJnza+tTRQK2qgIE2WlgCkvkNAD6Ysk51M9ID9w3MiA0CfU4/ViUwDIrDDyZyp
         +bxhuGk2LFfrD2rV/b8Gen/YoBoKyrFewZX4qSVU+aLTTkr4oBYyZftgQpj13Q2krZiF
         OS0Zt4bficAcJPXITV+QEPZZVXB0zaAw7NLrBz9CpP1lvoy+pyQCG5fZTR/fuxLY6yAf
         m2V5EhnIAVJDAvMdJ4o4IVgMAfEZ1s6Uia0VaUfAJaByz2tNWnQ91efoLYSfKWvMvhe/
         mnFnW9bBWZpF45OtOd4pvR0baNNwGU/GJxnXkUxQVXnI56ClmvB3oBCXJaZh/xSJ/g0v
         b23Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfgeQnXLHMk0wJXrp/8VVYR4viFWylqiZ7Mq4uMBmRJCfLACgD2y5VxdblRP7FXrwqwciPIg39c/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXeeOH3SkZHq8ZK9uyqZoeP8duG2yIB4QScsbbBb8lSVs8R8cz
	nOvm02IPIdq0a3ayuP2kcWTBWLefjvl8CQSLQnxJG99AV98CXxUARIZrxteDeS4AhA==
X-Gm-Gg: ASbGncupUSLo08GimNiULsJmlj+Yn7dUREyTQCnNiBs/Tyo6nsUL7As/lkcLeksfrBB
	gzxRgBP1vNCFbt+c9W5Bj3kGs71cg2xBGJ4mdFpdzjwc877fRAFpZYsZOs0OjGiBn0Lo/yRsKMx
	l0kM8XrW0dj4Xz69o2B+3L2tBLvXMjCgOP9BWTm+hoCbdKJdn+0yEMov6MzmFNx20YzpnoHLjue
	ytEiJ30agTudsS6ixhIXuJnFhPYUYpGg3ZmkpcExuiPy8HFoOHhrdG2E/QFxInovb7rH+l0y0Wz
	hBLK7fjrc7tsNxk9VZXPi5PAhtkXMBA4/yjIBmtsmsOuGjdxXEUAHscRwFsJL8O60hy5g5+O1pb
	5Sp3XKDPoOzdLScRud08D7RrKoBx0n0R0s3OaqpX2SqhOytEDd2kAHwCXufFAHNxmRymVVYRzLU
	olGfB3soaHfOU8
X-Google-Smtp-Source: AGHT+IGGwGAASK4m5NTbNFxuZhbzWb6WwZq/JsJn/d7o9TGnbhyKNwOl0MpVIMHM/sPYTfskzBYfjw==
X-Received: by 2002:ac8:7f09:0:b0:4ee:49b8:fb4b with SMTP id d75a77b69052e-4ee58935f89mr55375691cf.66.1763757660682;
        Fri, 21 Nov 2025 12:41:00 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7632])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48d3a041sm40646461cf.1.2025.11.21.12.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 12:40:59 -0800 (PST)
Date: Fri, 21 Nov 2025 15:40:57 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen Changcheng <chenchangcheng@kylinos.cn>,
	Alan Swanson <reiver@improbability.net>
Cc: benjamin.tissoires@redhat.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: usb-storage: No additional quirks need to be
 added to the EL-R12 optical drive.
Message-ID: <ee3c4e38-6b79-4b3c-bf0b-abb9cb1feb5f@rowland.harvard.edu>
References: <20251121064020.29332-1-chenchangcheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121064020.29332-1-chenchangcheng@kylinos.cn>

On Fri, Nov 21, 2025 at 02:40:20PM +0800, Chen Changcheng wrote:
> The optical drive of EL-R12 has the same vid and pid as INIC-3069,
> as follows:
> T:  Bus=02 Lev=02 Prnt=02 Port=01 Cnt=01 Dev#=  3 Spd=5000 MxCh= 0
> D:  Ver= 3.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
> P:  Vendor=13fd ProdID=3940 Rev= 3.10
> S:  Manufacturer=HL-DT-ST
> S:  Product= DVD+-RW GT80N
> S:  SerialNumber=423349524E4E38303338323439202020
> C:* #Ifs= 1 Cfg#= 1 Atr=80 MxPwr=144mA
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=02 Prot=50 Driver=usb-storage
> E:  Ad=83(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=0a(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> 
> This will result in the optical drive device also adding
> the quirks of US_FL_NO_ATA_1X. When performing an erase operation,
> it will fail, and the reason for the failure is as follows:
> [  388.967742] sr 5:0:0:0: [sr0] tag#0 Send: scmd 0x00000000d20c33a7
> [  388.967742] sr 5:0:0:0: [sr0] tag#0 CDB: ATA command pass through(12)/Blank a1 11 00 00 00 00 00 00 00 00 00 00
> [  388.967773] sr 5:0:0:0: [sr0] tag#0 Done: SUCCESS Result: hostbyte=DID_TARGET_FAILURE driverbyte=DRIVER_OK cmd_age=0s
> [  388.967773] sr 5:0:0:0: [sr0] tag#0 CDB: ATA command pass through(12)/Blank a1 11 00 00 00 00 00 00 00 00 00 00
> [  388.967803] sr 5:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current]
> [  388.967803] sr 5:0:0:0: [sr0] tag#0 Add. Sense: Invalid field in cdb
> [  388.967803] sr 5:0:0:0: [sr0] tag#0 scsi host busy 1 failed 0
> [  388.967803] sr 5:0:0:0: Notifying upper driver of completion (result 8100002)
> [  388.967834] sr 5:0:0:0: [sr0] tag#0 0 sectors total, 0 bytes done.
> 
> For the EL-R12 standard optical drive, all operational commands
> and usage scenarios were tested without adding the IGNORE_RESIDUE quirks,
> and no issues were encountered. It can be reasonably concluded
> that removing the IGNORE_RESIDUE quirks has no impact.
> 
> Signed-off-by: Chen Changcheng <chenchangcheng@kylinos.cn>
> ---
> 
>  drivers/usb/storage/unusual_uas.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 1477e31d7763..b695f5ba9a40 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -98,7 +98,7 @@ UNUSUAL_DEV(0x125f, 0xa94a, 0x0160, 0x0160,
>  		US_FL_NO_ATA_1X),
>  
>  /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
> -UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
> +UNUSUAL_DEV(0x13fd, 0x3940, 0x0309, 0x0309,

You know, to keep the changes to a minimum I think the bcdDevice range 
should be 0x0000 - 0x0309.  We can't be sure which models need the 
NO_ATA_1X quirk, since there doesn't seem to be any record in the 
mailing list archives of the discussion leading up to the original 
unusual_uas.h entry.

Alan Stern

>  		"Initio Corporation",
>  		"INIC-3069",
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> 
> base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
> -- 
> 2.25.1
> 

