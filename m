Return-Path: <linux-usb+bounces-11005-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC3C8FFB84
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 07:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E105B1F22381
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 05:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBF114F11C;
	Fri,  7 Jun 2024 05:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UgkDk2p+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572F729428
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 05:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717739920; cv=none; b=bjkc6yaSmPqmqOsIVrYtrBUjoawnPEUU8QCAHMsHa1SBMwysKvAZAR0wr+xVsMjtp/4E9ueL/ZkAPxWjY1/VT14aPts6ok5mXi3g5+oqoJ+27gAub0Uzrt66lPyImXjwo4Yk6S39clu+GJ2Uw5FVNIT7DFYFKsnBkXloP969+GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717739920; c=relaxed/simple;
	bh=IqUc/LKepa0q/uwKlIntaMoIeIcrlrSdWeXPPi4bO/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffb2YgNZ20izHarH40LC6ROPsVCztmwGQ7iqV4invqHsn/5G+Uo3kefCgW5Pt0Uk/48XatYi/OdepUAyrt7PcbKCwnUpwnuSUctgiqVQDQz7/LzCxdID9Hkd5/Q60i2rOhI8W4lwTdoGt//SR2yl/NESvRxhQ6sWB5AQfiKJ2OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UgkDk2p+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-35dc984b3d2so1231770f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Jun 2024 22:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717739917; x=1718344717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WtwmJY3XP5Iwlr2y2eradU6tEjlICOoXybcdo1JN+rE=;
        b=UgkDk2p+5mkfDGFA7ywJlprlvXITCeJO+gQg5fc13mE4iubtMUj5zaA2OBqltJS9+K
         PFS4pgsA0u8YTb6fiZ/HbT4EzixhQp3LunfBMe049tZH5U5uwEoDgmvHT9Nzf8TgGP0f
         azrkCzE9aQ3uVTZO3MTvylSN3PobtFQUqQ8aBiX/Z423flinzKd7XMNxhVhXAsj0yJ4R
         6meF75bFxa3q9qAxyJrSU6LcP4qnkFNDnbJCcc9r+NHmCAvSoywo+YVXHi9DzzEI7BN/
         PAGLU7Ir9lESiiY6UMhSMh5IVRld4wrihHf9nkcIOImXTjBU5ZnG1oDMvjnAQHiK112S
         KkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717739917; x=1718344717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WtwmJY3XP5Iwlr2y2eradU6tEjlICOoXybcdo1JN+rE=;
        b=WTnlxXRnD3zuaaR8MK4uiWHXt4LG7gOe98xzpb2myu0IxNhx42fdClKJDAO0eTtrFl
         nhBScu1hYNjL4KubFxh4fMvvRJQjgpnp3syahYAN3wJuk3FlmPxPlE9PAD235u3OwN2P
         2B2p8zLZ9jyzJz8wgE/oVc4raD9k72jAHEQMlHLUsvADJFxeifvaXjaPx5rju6pzx6U1
         xDzJmYVhQnUEGPmTrYsuwizyAnBliu/yEutF1WpPPbLZ7/z++TSMmhXAdM2o+9DDDgyO
         t1LaWd6jTbz6wO8n9lFYuH3Gv4UAbDHkFdwwxC8E8JudfcC1iT4+GAjFqqkt1HSaApyp
         2JDg==
X-Gm-Message-State: AOJu0YyApGjB0n97cPrCKpb2vVZsUO4GLqTmoVu00KtRNsHfuPMgf1CV
	DE0Us6BNqDA3f1KLWZoiMfCCW45t9WKA1C3nNRKhzRFmKqz84hvhBiccxL+ro40=
X-Google-Smtp-Source: AGHT+IHeYxyo/QN+0ENQh/rpaE6LyLSWsIFGkFDRX1cySRq3Xr8wqkHqhhNVXWIVIjFW1siP50TzmQ==
X-Received: by 2002:a05:6000:c89:b0:355:2db:a06 with SMTP id ffacd0b85a97d-35efed55840mr1279441f8f.32.1717739916727;
        Thu, 06 Jun 2024 22:58:36 -0700 (PDT)
Received: from ?IPV6:2001:a61:139b:bf01:c0fa:2aad:468a:2d84? ([2001:a61:139b:bf01:c0fa:2aad:468a:2d84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5e989besm3208792f8f.76.2024.06.06.22.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 22:58:36 -0700 (PDT)
Message-ID: <3359c8c9-4e33-4e9e-9ded-692ada3d4995@suse.com>
Date: Fri, 7 Jun 2024 07:58:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND][PATCH] usb: uas: set host status byte on data completion
 error
To: Shantanu Goel <sgoel01@yahoo.com>, Oliver Neukum <oneukum@suse.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
References: <87msnx4ec6.fsf.ref@yahoo.com> <87msnx4ec6.fsf@yahoo.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <87msnx4ec6.fsf@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.06.24 05:32, Shantanu Goel wrote:
> Set the host status byte when a data completion error is encountered
> otherwise the upper layer may end up using the invalid zero'ed data.
> The following output was observed from scsi/sd.c prior to this fix.
> 
> [   11.872824] sd 0:0:0:1: [sdf] tag#9 data cmplt err -75 uas-tag 1 inflight:
> [   11.872826] sd 0:0:0:1: [sdf] tag#9 CDB: Read capacity(16) 9e 10 00 00 00 00 00 00 00 00 00 00 00 20 00 00
> [   11.872830] sd 0:0:0:1: [sdf] Sector size 0 reported, assuming 512.
> 
> Signed-off-by: Shantanu Goel <sgoel01@yahoo.com>
Acked-by: Oliver Neukum <oneukum@suse.com>

