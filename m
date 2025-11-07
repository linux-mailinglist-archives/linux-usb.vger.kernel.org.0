Return-Path: <linux-usb+bounces-30208-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D80C40AA7
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 16:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 755473B788B
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 15:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA55832D0DF;
	Fri,  7 Nov 2025 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="hhxoEx3/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE7F322551
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 15:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762530560; cv=none; b=rdeWHsMCAzsIq9KpTH7DrvGwW0bWdW+fl0izDwrWSF6SGNmeZy7EdOIjULAARXi65/VmDR/7BdmJE8WCQAFmH2YJdMGhdQ+IhM/hRJ8HZ5twC8HQy5OFPukzmLrW4upcsCmlMfsAKuwr/ND/0TTqu1hszqvir9otNjDT4/rPQs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762530560; c=relaxed/simple;
	bh=/6Y4zC9sj6dMH09rggUUO+LoSiudUJWecVQ+hbH+ODM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxPFCsKBLi+AixrStpGu9nJ7GBe4rOPe+SxoBztznDpc1YrzMINe3RomRuzUY6by+A+P163iSh9QJrynURoMGZZu5cCOyG+3tRpx3FAfY9yvAbGPNdveAGLowfk1LlQi6Igr92gBhHQ3EQCBmaWBpa6lEXWeD44YCtjdTqOOllc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=hhxoEx3/; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4e8850b09eeso7093741cf.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Nov 2025 07:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762530557; x=1763135357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0v6eg6ng71W2ihQc/lk64rXLMci9QzB5Z5WSHkaUZyQ=;
        b=hhxoEx3/gwCynSDwkgkMCVN6+1lbh0AU/qJN4BVXpoZv9lIqp4Q0Sc/cxcqzET6m3g
         PHLP6ASfdIFcRhz/wkwh2rlh0rPWCSghciX3DOy+nC8FgM4jJNk60dz5DKo1n/rl85mJ
         fR9tSwasmX8lNC9ZplW+3FVxLGo6KuGg8/lk9C3irXE5LwXGk4/A2hc3XYzsRTICP/li
         UU8WBOP5yWRx/FeppIgNAtVRcP68MJWhsS8oGY4y3wLSLza7blL10t7q7J/XqpgSPUaL
         7LVagrhPNwW0bp344IQnDpqxb0w5/2X/SBWd85lPsKJ9KOdQ2Hs0MfE83/lPOgp73pfu
         yOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762530557; x=1763135357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0v6eg6ng71W2ihQc/lk64rXLMci9QzB5Z5WSHkaUZyQ=;
        b=q3CObrHtWDpKWgu652br5U1Y15UYOLHSNcMb8LtXAKOyT/F+/UWx2jk8HcAMn3ldnS
         3iXRWOVs1Q8ruoHs2qHyl0TvdoISLGfM+JsiuUgVkX0G3a4NHaLBi57lcmcB1D3iS9zJ
         2dbYxDh281HJTIIgSwNikskRZ0a02/vMnUxkY4EUniMQPvwC5moDR+iYlL2ZbSc8lwT2
         Sjewq/3mZFH8pNCGYB+fjgPH3YhOSr1dPgeSTKk7k0n3cyCWHJvpVsOad9ApkJyI/RId
         TOe3jBRQb8wHtTTUu9PLTqwyUcpIY2/aitYnXTR3mK6nO8hkXQhNbNOihVstFOtju7yg
         WLqw==
X-Forwarded-Encrypted: i=1; AJvYcCU69ADfA6Up5SL4m0CXU/wUE5rLKZbzRkYQfOhF2ZmRuXDWJ9RhKwOlG+PjJXMOIm/0m8g3kQNE63U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp71C+Bg/ZzAlzs3A2BEnQwPZELbyjjLSe6toGqo9YFCQjx2lM
	r/MJQf1pavbWR2k3bLVe76HqUOc2i+NftfO/PBl+HpqA8b3Wt6kaghiMWqHYGlmBRLTWIY+qAmw
	xYxY=
X-Gm-Gg: ASbGnctNhRC2SBpI1lhKo2w2CjF1auQqCxVKZoCmKylrmig1egOvAfXM5AfKCCVWA8u
	OH4cgCbCUvjLx/RZ3crEiYE2e3UWgM/6oRLabirLmDO2w87z3bVR80SAhSO3JvaYalgRkaeYAuE
	QtPnG8bu25zKwwSNk3EZotxF0QD5K5e5BfUKSnM50CSRMvoFVDbP91CB17Q6/xX77j93F785F+s
	A4WoJ4/T67jRVvnDO1Ltk/yftFcFnlrtI2od4N1UD/eIxBFLyNb1RuD3yMk5uE5Kn8/HJOgx1rJ
	vFhAj0hlg7gIqgBOqC+HZNa0sihyTe1+CyeEFRtSMfc5VRhjy7ZID1c3+mefdmcxzR8Su/kC5rn
	oUviIYPqIW0WprMuJQZDMTb6Jy0XvHf4GromDx0Iej1ZX/9PvLbdRXua6VmVWrwVVU8vgr2Ras/
	SZKhgNjpghe+aY
X-Google-Smtp-Source: AGHT+IGv4LvT9OxkoIkqXESdEl9EKbK/wl0vLym3A5YbB9ZFv23y4EMfP2ZZvGqODR86AGem03ZGxA==
X-Received: by 2002:ac8:5803:0:b0:4ed:66df:8023 with SMTP id d75a77b69052e-4ed949747c4mr43829531cf.30.1762530557379;
        Fri, 07 Nov 2025 07:49:17 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::db9a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-880829fa47bsm41535246d6.48.2025.11.07.07.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 07:49:16 -0800 (PST)
Date: Fri, 7 Nov 2025 10:49:13 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: ccc194101@163.com, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Alan Swanson <reiver@improbability.net>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	Chen Changcheng <chenchangcheng@kylinos.cn>
Subject: Re: [PATCH] usb: usb-storage: No additional quirks need to be added
 to the ECD819-SU3 optical drive.
Message-ID: <c7bf59b5-8078-4b47-b56a-7b5568272d07@rowland.harvard.edu>
References: <20251107061046.32339-1-ccc194101@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107061046.32339-1-ccc194101@163.com>

On Fri, Nov 07, 2025 at 02:10:46PM +0800, ccc194101@163.com wrote:
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
>  drivers/usb/storage/unusual_uas.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 1477e31d7763..6d32b787bff8 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -97,6 +97,12 @@ UNUSUAL_DEV(0x125f, 0xa94a, 0x0160, 0x0160,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_ATA_1X),
>  
> +UNUSUAL_DEV(0x13fd, 0x3940, 0x0310, 0x0310,
> +		"Initio Corporation",
> +		"external DVD burner ECD819-SU3",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		NULL),
> +
>  /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
>  UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
>  		"Initio Corporation",

It's unprecedented to have two quirks with the same VID and PID, where 
the second augments the first by virtue of its wider range of bcdDevice 
values.

As explained in commit 89f23d51defc ("uas: Add US_FL_IGNORE_RESIDUE for 
Initio Corporation INIC-3069"), the original Initio Corporation 
quirk in unusual_uas.h was added as a copy of the corresponding quirk in 
unusual_devs.h, which applies only to bcdDevice = 0x0209.  Should we 
simply limit the existing unusual_uas.h quirk in the same way?

Benjamin and Alan, you two appear to be the people who originally
reported the need for this uas quirk.  Do you have any objection to 
changing the bcdDevice range from 0x0000 - 0x9999 to 0x0209 - 0x0209?  
Or can you suggest a range that does not include 0x0310?

Alan Stern

