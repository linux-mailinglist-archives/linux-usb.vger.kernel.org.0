Return-Path: <linux-usb+bounces-30435-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C7FC4FB70
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 21:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EA6B3B6DCC
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 20:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CE633D6C7;
	Tue, 11 Nov 2025 20:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rQG1zSPp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2965B35BDAB
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 20:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762893147; cv=none; b=rMjPlpgE9F2jLA7rQCypg2HDHINsoDWyaD/vRNGrzosHr6amxfsnCfLa7ClJt+bdx+9fGntYoFuBiZp3HGHLZp8KQJaWVNvtA678wpGyrYXIuwrU86sSau/AeooYpUswNi1M1NSr4Eg0AvlQi+t9d2lgWTog+pKTux2qCpfQMtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762893147; c=relaxed/simple;
	bh=wBRUMwhEZSV4TAk2qivEoV2m32QEQZM0LstkExvKX/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxNo34c8WW8QXCjrN9Rj8Eu4PwEDoJUzpyRfN1/tbr+upV2RiK5YxnyAcJ/WnWSA0ZZ0OhcqKf1ThcloIWNQx7s0I/saDkrTPRKN7aZ0xceZ3FawPC46Lbhd7vPq1asLKoHOYScmNBaNl+gT4YAgfnmIPtvj/g1FJLZqZEK3q4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rQG1zSPp; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-85a4ceb4c3dso14295585a.3
        for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 12:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762893143; x=1763497943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dYUm7OJZV3XyKHmf7ftlFF/uvzw7zcdGh4/K0Cu0MuQ=;
        b=rQG1zSPpJy5JmJWeD5WdbGWN0NclQ9xB7Ezo2WgJZnQB5NUjPCBEVjaW8SXIreaeOm
         VmZeoSu4IUlgL346GGSWGID8VV6Sv5ckRdONhL7RDnHP/BEnAXRWzCiznU/tiZ1L2+NF
         nRTo+uAoeuc2JnptHVN+CrJlWzPLYTo32tPRvOT/WZdLN4gRaExaXCAIv4B3E7wy674y
         RjKTrths1xQNXIu5QJIdw/KXHuaTw4Qqcwf26r4Tz56p3SU/h1i3wL24PK8yqQTr6knM
         DuIWnvkFi4bVIFjl98EKNKLd4KZk+1m//7moVednEmrNIS8q6qvWY7yAUl+lfhSyX7FM
         MHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762893143; x=1763497943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYUm7OJZV3XyKHmf7ftlFF/uvzw7zcdGh4/K0Cu0MuQ=;
        b=iw6ws14R7tsOHXIbzo3Nxxjv00JVD+QZf+GpccHhvqjseBL3WD9Kexd8BiE204NVM2
         K+aHtIrmmBXDr4Rsc7bW1WEYm5BQL4pGYcPcZ7ciuXHhbQxwpLATrh7zI+qNgFEQumQk
         Cvl46Qak7qrYTAnZiXsQAU+Zbg35Ku06ocrJlKzhtOa2MUqXzZrim6wJ3Hx6dpt3Ne4h
         a67uLZjUS/jVZVU+2qB6DGf7qW+a4kj4rxzvj9ljUgEW1a5pk4xlNS7d09j5utSV2ziw
         mqJLy00pd5w7QxcWE4R3/38wenu5UxtNYCvt1BqMmnR+bsjtc3kBIObP3ITxQw2RoBQ2
         bF6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBKTfobFARFSmpM0EjA9pds7WLPaBcecA8PiRqR7uhXoxIXd3UPgcwQX5ThF92BC+TnjL2RL88GLA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk4CSG6HUKXom43iSXG4JWaTFwkVdSTKNaGy+BSZvEunz90xg8
	rR6U++BY03SWz8tl4lOw0yU5HAn4D73DZrhOg6Pd5YgdgIHcxQBZlE42zUe0tQ1bWg==
X-Gm-Gg: ASbGncv5masEbucM2aJnwlFFS29qEUnwI+YsUkWcmhhKocVZJ4DnxSOltXorNsmaIEJ
	JbpDw72Iwd/iDmBeJCTce+yPga/xbscsMIyeq0EdNY1EG9RjrAKR+WF9kf+Ay0ikeVkVz9yj/Qi
	Gj8C9vWbU/CnOS4tMfY6Ir6PV5JX5HsbipvjbpckEIkqBbvbMEZK7jOZt70c+5HJjX8CYQS4NgH
	v6HCPQnM1WudkvRwlW/a0y9QxEKMxYFXbgAMrJqA0+WmIU5/pDnrp2LkC+OGabyp4bNVLxuqwag
	8CyEbtK33E2ZcUcH3ts9C6BTbltX94AfIKlExiYoaaf1trfW/XNRhdiIFmn8mv2GTOoyEVZEhj9
	kAqVEwxOhfN2CX9do8zuvRvQCWtsCG2s7Po2yiQDobNHGufZr/9mONXL090rlQfiBdQtxeXE7ja
	jhWLEc+9rMIVFF
X-Google-Smtp-Source: AGHT+IEkv77qmXfGZnpkhl9iguMrS7tP7L4ASotsDsRR0LhAB5TtV3JsEyFLTrRKLeeoWueAIs48qA==
X-Received: by 2002:a05:620a:4710:b0:8b2:3411:83ee with SMTP id af79cd13be357-8b29b78f9bbmr75718385a.40.1762893143109;
        Tue, 11 Nov 2025 12:32:23 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::ba76])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b29a84c6b3sm53008285a.10.2025.11.11.12.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 12:32:22 -0800 (PST)
Date: Tue, 11 Nov 2025 15:32:19 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: ccc194101@163.com
Cc: Alan Swanson <reiver@improbability.net>, benjamin.tissoires@redhat.com,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	Chen Changcheng <chenchangcheng@kylinos.cn>
Subject: Re: [PATCH v2] usb: usb-storage: No additional quirks need to be
 added to the ECD819-SU3 optical drive.
Message-ID: <c334a466-ebdc-434b-8a6d-73b177ce25ad@rowland.harvard.edu>
References: <20251111012737.13662-1-ccc194101@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111012737.13662-1-ccc194101@163.com>

On Tue, Nov 11, 2025 at 09:27:37AM +0800, ccc194101@163.com wrote:
> From: Chen Changcheng <chenchangcheng@kylinos.cn>
> 
> The optical drive of ECD819-SU3 has the same vid and pid as INIC-3069,
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
> Signed-off-by: Chen Changcheng <chenchangcheng@kylinos.cn>
> ---
>  drivers/usb/storage/unusual_uas.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 1477e31d7763..352e9d7324a4 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -98,7 +98,7 @@ UNUSUAL_DEV(0x125f, 0xa94a, 0x0160, 0x0160,
>  		US_FL_NO_ATA_1X),
>  
>  /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
> -UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
> +UNUSUAL_DEV(0x13fd, 0x3940, 0x0209, 0x0209,
>  		"Initio Corporation",
>  		"INIC-3069",
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,

A couple of things...

First, the 0x0209 suggestion I made earlier was a mistake; it should 
have been 0x0309, as reported by Alan Swanson.

Second, are you sure that your device doesn't need the IGNORE_RESIDUE 
flag, like his bluray drive?

Alan Stern

