Return-Path: <linux-usb+bounces-30882-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38960C83414
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 04:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 065E84E0737
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 03:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F592737FC;
	Tue, 25 Nov 2025 03:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="nN11d/hP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E7126F295
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 03:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764042164; cv=none; b=N8YQodzm+YTU/zy7d2sKckc1qI4fTScr0IzS+2AjfSjHQIozrQbCkOcpbpEaIgpSAaQTAYM5jPWpq4K4hY7kJZg9pTAhqlayGXTveBVr3xcXSV8zZfg0gJ5BITtpa/HGvG3D3tgUtfrJqexyeQJ9xm5H41zfP2dxkel/qsBAXf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764042164; c=relaxed/simple;
	bh=5LuOJBpmHzi6TvtAusEct2SZ9WSz+WfbD6xbpJrSTp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j12ja85nhPdtdG2ZgutZedB/TSPG8TCF8QmAJBivmban3/Zcbz2AjXI48Hb64yt/v5jBqJn9CITe0dcYLR30elGM9EPsJRdjRhAljIkEo+5fQ/OodHXXoMePU+AO+stMgxxxXWsYXizjjwuNCDgUdJHYoPzhI/ejIsbm91xiLFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=nN11d/hP; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b2dcdde698so751595285a.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 19:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1764042162; x=1764646962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+TFoTNMzp/k6u+QRFIfJqVSLs8SJQbQMQ/Tiai46+L4=;
        b=nN11d/hPTnHuUunOm7a/MBPxPzYI95ymc8DNvP9RDNlI1utm8MjV1d2ymdRBcbcNRG
         k59ugaC6hEcEce6YytP5EOKYJtAiFMA5BOh7IVM0f5v85gPQi9KwuzNq1kkuol02GbEw
         YcLsjoPyEIEKNmvVb42vHz6VPVg5Tk8hbPxwGjX6NfVqZeATCAsiKhibNLCc1AyxnbER
         5Mj2tOCIveLG3ouF1SkXmZ2qicNX7qeguFMviWXY7qmoendKJBm379yr/CTOStYYlA94
         Aegnu7vdILTObtMuywfUv5S89hyNxZo6gWujmaYw1UbUH+bFg5jIlwAiceJIg3mgds3+
         xMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764042162; x=1764646962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TFoTNMzp/k6u+QRFIfJqVSLs8SJQbQMQ/Tiai46+L4=;
        b=paQugRtxFIdSDQSIhpe0NkLYn8BZwV4i47GkEKM8FWx/k50Bc5m02RC3npLhNKC4f2
         3LI000PwOjh9bfjl/BJ52hFxRpTi8zEGRRgaXHEHng94ZWnkrEeJus4VscYH5tQPfkQX
         aSqmRGLpiIPBbvNxJUKwmiMtLDqIByD8ZE8BIna7lim6b8+8c8VcS0GT4RX7kfykKZtH
         nKtszh4a2cjYL3KDf9Y4lBbqMVuRvEsLwEY28g2EE8cYGOYGWhEKQel71BwJGuty5pVl
         kVxjWKedI7x5hTqtklCXNWz6et6wq0nVEvNxZvHBp2lU4XYZz0whk+qx8YA9db6w0EYB
         kopw==
X-Forwarded-Encrypted: i=1; AJvYcCWI23I4SaozAmkJ7RZfjj9fH6apoihDkpG55Fmynw+ut3Cxo9uNqShNdz40xs+hSFMTDQiKenRwuXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8EU8cNMgvbPbu8eA58x8M+S8LZ30SNN2o2i5ZjDtGXgsoNNSA
	yipgloOxjBzE4zhbV+qLrFSjqzUkDeJulwZ1qz6Dv9iwArPLB0dW15vGflsQ4cuiAg==
X-Gm-Gg: ASbGnctt306rqU39aqOCqUy0D78JGrB8MJtLDwA0SPFQ1m5TrtzD0rqchkG8irL7Tt4
	jSqFGDvVV9zvk3QKMSa50NS3ErvO8pw6x0ju1rpRqm1NF6+KSuYbG+V4jT7idMR+ye3LLGgwqG4
	KFrFHjSmtbIePI8Tt06CGOsTo+TlzzpeYLLtZkB3mHTN4GtU8Z2OalAiqErpfEuiAxw1mSL88LU
	v2o3zW+Wxng99ZtfPR1Sbw20FuZWy+cUr/KQSqacDyysAkvSUmkbuxnaF0RImyE/nK2e9hW3vkF
	6LvK4chfQLlGHZDgePgPITKKpkiA4AhPjbVTcy8QyLLWqMB9EWAykpPxHk3xIlqfe7Gm1FxT/Bv
	GcjYjho7w1gfSWsyYjIc8Q/nsZWD0CinP2RFu+DRYydMQmf/4/62zt9hxt3/TsTqMT9vS+S/sW6
	yMCEetZEb3UdZs
X-Google-Smtp-Source: AGHT+IHBlaorh+O0/rHp3FoHbU05OdQDxZqSK+2SFcOcEL2BfUChF69Rx4E7BsjTpOy//qe8agcblQ==
X-Received: by 2002:a05:620a:294f:b0:89f:5057:974d with SMTP id af79cd13be357-8b33d1cfa6dmr1957627785a.10.1764042161565;
        Mon, 24 Nov 2025 19:42:41 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::eaae])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295c17c7sm1091938385a.32.2025.11.24.19.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 19:42:40 -0800 (PST)
Date: Mon, 24 Nov 2025 22:42:38 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen Changcheng <chenchangcheng@kylinos.cn>
Cc: benjamin.tissoires@redhat.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: usb-storage: No additional quirks need to be
 added to the EL-R12 optical drive.
Message-ID: <2c631069-cd12-40b5-88a2-c5b83a9a9043@rowland.harvard.edu>
References: <20251125014422.12721-1-chenchangcheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125014422.12721-1-chenchangcheng@kylinos.cn>

Isn't this actually v4?

On Tue, Nov 25, 2025 at 09:44:22AM +0800, Chen Changcheng wrote:
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
>  drivers/usb/storage/unusual_uas.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Where's the changelog with respect to the previous version?

Alan Stern

> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 1477e31d7763..939a98c2d3f7 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -98,7 +98,7 @@ UNUSUAL_DEV(0x125f, 0xa94a, 0x0160, 0x0160,
>  		US_FL_NO_ATA_1X),
>  
>  /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
> -UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
> +UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x0309,
>  		"Initio Corporation",
>  		"INIC-3069",
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> 
> base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
> -- 
> 2.25.1

