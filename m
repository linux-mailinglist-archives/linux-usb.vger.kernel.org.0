Return-Path: <linux-usb+bounces-26550-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B35B2B1CBD6
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 20:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A60351884287
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 18:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159502BD00C;
	Wed,  6 Aug 2025 18:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="IgtVxSl1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064B729E0F7
	for <linux-usb@vger.kernel.org>; Wed,  6 Aug 2025 18:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754504344; cv=none; b=Kl8WtV8zCl1j0hJEJ11PeeLeDHUrFAOrcIqqGw47jkwCgaCgJf0OrStFXVKSJqSar7oLUYkU07QMqloAkutuZiOUYYNA77ksikzDOTlNYIrRj8+vDZuCzvqwtVyeV4touCRBshMeDuPKKgae3Lq8MTEg17OpscaNiWp50Z4tNCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754504344; c=relaxed/simple;
	bh=scM60JWooxHIxyZxbf7sRO869NtZo3fJXh2jgi2YgZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7UKpnhdHspzStYz3m8jIEK68SlGh77tUY4W9UxEyAG2XT9Ao/F4bDcKyQkW2Sfql0QxIlTke/S2fCUgC0Ru72ZFi7qmLvmcYbGGY6NY5baCVivmXZ9k+XcWdZpu+h52BmfDSKtlnin4FhJ2LCtTlnqvBfqxezLGbs+jyP+28Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=IgtVxSl1; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4b0a13bb0b7so1102111cf.2
        for <linux-usb@vger.kernel.org>; Wed, 06 Aug 2025 11:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1754504342; x=1755109142; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Athr79gwm1aP+FwxIvbTHKxraTrSIJP2WIrwbPHH0Zk=;
        b=IgtVxSl1rQhV4wrAHzssWYBcLt3LXM1O713h3RrQGk2HuaPm84g11uPKCVHtZt4VUk
         cYgfTQNgmDX4z4RZz26RvrZ+6AqfyP7Y+8R+yjs7T80m2IaC9u198JwGg06goneQOUeb
         tj3XiXr1gaE8JtgXm/Zb9gA82NygLE/D97ZwSBv2BC8Dn6xZJuHEMo8TZ43wM1G29gVQ
         2EUlnjWn2jKp8xIJECzG8/5tWV5LrKC47Qo4drfJmVvKAoEm/REfXNPqtT7lPHViyHWK
         +QYYz90APimO0pGRhFBOGQcbUUq+Y6DPBdk8Z7tSdh5a4Gad8urLQr80ooltaLeaBsRf
         5JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754504342; x=1755109142;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Athr79gwm1aP+FwxIvbTHKxraTrSIJP2WIrwbPHH0Zk=;
        b=Nj0N7gSwarZhuhOSX7QTTm5zBR0dFEZbfST+gjETr8CcQBZihe79151t2qruOgC67z
         /zhChpyBRdMCArUv4rsCEkgU9aKSHirhysqDV3/4nNAkUcUySEH3mEAYc2/zHkqos8sJ
         lr6uUIgLpTiZBgeUHtuH95Hm7ecF7dRLF4U3wAiqPCuXqpUv/5iilTZwJrG5SJpt+JHn
         j1I6KjMhq3SHluqonu9nQa4ORrctuBVE1/+S6O99y3sTFJ1u4O0i9BpBobvlOutzXLjl
         Ut64+Dd8c8gxBR0XXedF4f1RQx2BHbRCrQTpb66jkJEaC6IwtKcFDuQ44fIp05wDdDZj
         U+rw==
X-Gm-Message-State: AOJu0Yw3KU+Thpnd/mRDSl9nHkp+17HOg61qemhEFmPmFZxUoZvvwkCV
	oi/dcb+yUIObmREE5kvKDGOGVEph1M1i8Ii7VdHi8USNTWrOGfH6LeEUKWlCuagO9w==
X-Gm-Gg: ASbGnctWn0Yaw6gqFBFqG86AZkmDBSMgcqad95hUaiv6VruLsFLoyB0vkHdcYrnQc0T
	Q6c9XJ3n5i2AyuObfQrSXdZMlDAUbEGNm4vlOT2sjVQeJD+CMeGCNByPTZGk0f5h988dYU285oY
	hZF5AeMWmCCt4MFa7qMs+Yh4ofl9CGEb3rjy+0CJZZxSJW+wE1jxE7xIkXgwi9zbcD9wuzs4+eT
	ZCwhrhvoF6P+ZGavGGqn97uk9BNu3S33D5v+p5Gxe4c64Ktf0kqWp6FuYCeEOAiKpzi1/hIn+jn
	g2gnuit9gcYVEybKG2cBBtURBH8Hdvi/+yfnqPg98cdj9Tyr12ViujzHIStnZ7R1WqSlTxU3YtP
	hpj/K8DnuK0dA2cXfHZv6DcXBdGT7CH9T6CYligavYfy3k2LPR6E9DcpRVNowV5YTAw==
X-Google-Smtp-Source: AGHT+IEDVGW624rgb330dRrSe4xhRfBT1YoStwCBUlnpqA8nmtR8t/kEuU5e5BddGqZSoOepsdZNoA==
X-Received: by 2002:a05:622a:2b49:b0:4b0:82d9:7cb5 with SMTP id d75a77b69052e-4b09145abbdmr57925671cf.26.1754504340318;
        Wed, 06 Aug 2025 11:19:00 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:349c:f507:d5eb:5d9e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e80b2f7a07sm287772785a.6.2025.08.06.11.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 11:18:59 -0700 (PDT)
Date: Wed, 6 Aug 2025 14:18:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mael GUERIN <mael.guerin@murena.io>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/1] usb-storage: Add unusual-devs entry for Novatek
 NTK96550-based camera
Message-ID: <28080ef2-a767-4444-b487-9a12fe0ba41c@rowland.harvard.edu>
References: <20250806134722.32140-2-mael.guerin@murena.io>
 <20250806164406.43450-1-mael.guerin@murena.io>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250806164406.43450-1-mael.guerin@murena.io>

The Subject line really ought to say "USB: storage: Add ..." but that's 
a very minor matter; Greg can adjust it if he wants when the patch is 
applied.

Apart from that...

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

On Wed, Aug 06, 2025 at 06:44:03PM +0200, 'Mael GUERIN' via USB Mass Storage on Linux wrote:
> Add the US_FL_BULK_IGNORE_TAG quirk for Novatek NTK96550-based camera
> to fix USB resets after sending SCSI vendor commands due to CBW and
> CSW tags difference, leading to undesired slowness while communicating
> with the device.
> 
> Please find below the copy of /sys/kernel/debug/usb/devices with my
> device plugged in (listed as TechSys USB mass storage here, the
> underlying chipset being the Novatek NTK96550-based camera):
> 
> T:  Bus=03 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  3 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=0603 ProdID=8611 Rev= 0.01
> S:  Manufacturer=TechSys
> S:  Product=USB Mass Storage
> S:  SerialNumber=966110000000100
> C:* #Ifs= 1 Cfg#= 1 Atr=c0 MxPwr=100mA
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=06 Prot=50 Driver=usb-storage
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Mael GUERIN <mael.guerin@murena.io>
> ---
> Thanks for your review and your advice. Here's the updated version of the
> patch with a correct description as well as the unusual_devs.h file sorted
> correctly.
> 
>  drivers/usb/storage/unusual_devs.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
> index 54f0b1c83..bee9f1e80 100644
> --- a/drivers/usb/storage/unusual_devs.h
> +++ b/drivers/usb/storage/unusual_devs.h
> @@ -934,6 +934,13 @@ UNUSUAL_DEV(  0x05e3, 0x0723, 0x9451, 0x9451,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_SANE_SENSE ),
>  
> +/* Added by Maël GUERIN <mael.guerin@murena.io> */
> +UNUSUAL_DEV(  0x0603, 0x8611, 0x0000, 0xffff,
> +		"Novatek",
> +		"NTK96550-based camera",
> +		USB_SC_SCSI, USB_PR_BULK, NULL,
> +		US_FL_BULK_IGNORE_TAG ),
> +
>  /*
>   * Reported by Hanno Boeck <hanno@gmx.de>
>   * Taken from the Lycoris Kernel
> -- 
> 2.50.1

