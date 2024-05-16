Return-Path: <linux-usb+bounces-10295-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 079F18C7465
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2024 12:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06C381C22646
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2024 10:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750AD143882;
	Thu, 16 May 2024 10:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6jb/Zox"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C5A143886
	for <linux-usb@vger.kernel.org>; Thu, 16 May 2024 10:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715854174; cv=none; b=W50ycc+ZcVJxyVDyjptAhV4NzTFDpQ9kjlEg5CRWJR8pkGxSheRjzhg5TOOYeOwxa6V4kH8h8rDHVblNH6tBuyKCG9Oe05M8K0WmJkGQral0bG9JUSNf4PMSqOJHTj+UPEA9arU5NAEh3LwB/ntX9sba2fD6akUOt2SRIhOnkyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715854174; c=relaxed/simple;
	bh=KBQOWLxPWaj3HY5rrajwyuJHg+gjJAWb5fEFPwx8fgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=daX/razjtnWll29tJ/0PUEBp0E9nSYZlliUWBu+TNBwXKUAUz9UipEWw1k8787qrHCxS7qw2NgxU6ICIKxPNlkgrKnCyROSs0HAnNDAADu6DLBhKr/yTWK+1P0G+vku0BkpsOwDaofaS/7kFv0GdPhSlkH3jsAY2oCL+z4a62LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6jb/Zox; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2b6208c88dcso10512a91.3
        for <linux-usb@vger.kernel.org>; Thu, 16 May 2024 03:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715854172; x=1716458972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L30oNHDv0aHtYMSd2p8ob6qB1hn3gyPcLqtYgh7FP5M=;
        b=c6jb/ZoxT7fCJFt6sxOndBGlrQMFCrz2lPxj+puiF/q8bgKK5PlJBcB5SF0vK4oI9p
         W1H/Tr1P4OkkzuGo2O/0TS/ls4EhQa7t8WLtEEb05n3l2TfwhhMT7KOFKFQ4iWIZfMSM
         MvD+Eay2/rGtVnFzlSXVJ2S4qg9qJDleWey7RJD4ur/HUMXiYXI8BXWlijJOKPML3anz
         b5KmhF88Dwt/My/9Mboo5Kr2ym2ihvyUvVPn0X/thS2ExRjSU8NcdbQxeFz+eQclXJo2
         TdSG2FzSTEyJi2hdvPHAajwyb4Yj+Nc7Sz6QrtQBtZShx4O8mcHYKe6sOwLH9/ckERK3
         8iSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715854172; x=1716458972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L30oNHDv0aHtYMSd2p8ob6qB1hn3gyPcLqtYgh7FP5M=;
        b=KdvowWE9xVSrbmi12hvdRx3AWUZB3pgbQ4+2ios0Bq+Iw2qDS/F7bkdbcvmEKpHTSH
         MOoOZVsmbi+b+ewBj7bsiY8NiIbi8oNuAyE24Eq81KNsXQGGc35iJZHMcjNMaLkcR069
         +ybG19OBDrf5xCgIPuBpyRk1uMf86xrseAElBASh2VMpr3gje+9/u69dz1CpfNBe1LFl
         n3DLAqlEMsxnT8z3ufMbzZ+6SNwzm84DllCfzZwwF18HmoqyqZ787SZaBBi7JYJG9iSr
         8LJy7eQArZnHoKTMqdRziLEFI9mrZ++GsTfBzPQVqUJ87HeHszA4JzNQsLfJAhqdk8b1
         teFw==
X-Forwarded-Encrypted: i=1; AJvYcCXn13gKaLaI0DCXiSOcGL2+yfwBtvBPNQ8M88fQWkf41M0YnBTNnQj9iZlIOnhjYWS/yrM7N+SELZ0/1ZfCDb0k5WubJMLzx8vo
X-Gm-Message-State: AOJu0YxCKsELPNueM74PYJCzxvyCYnoKk6TI+WKLl82z9fSyFbURQfyC
	rduaoFg4D5aVhLfgyJjWXW9YekGqdOVnHdTobxUq8l7/Lzq51RPLdeICT7FBVnc=
X-Google-Smtp-Source: AGHT+IFI8/jLrlJ/L7/bNjmebm3dMTK9gRMrFPrVO9HHCMUgl7PIjx91eo2wLDRxxAyRK4lzgGGxOw==
X-Received: by 2002:a17:90a:cb83:b0:2af:2ca6:f14b with SMTP id 98e67ed59e1d1-2b6cb7c86fcmr16344128a91.0.1715854171890;
        Thu, 16 May 2024 03:09:31 -0700 (PDT)
Received: from [100.64.100.6] ([103.163.220.31])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2b67126ac16sm13386859a91.28.2024.05.16.03.09.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 May 2024 03:09:31 -0700 (PDT)
Message-ID: <3c09b040-e76a-40b4-bf86-47469a6107cb@gmail.com>
Date: Thu, 16 May 2024 17:09:26 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Assistance getting the Universal Audio Apollo Solo USB to work
 with Linux
To: Ethin Probst <ethindp@pm.me>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <DJiA8anOC3V1gHoj0H-8pmsXujLNu7IlZvNmvUEoDfnjC5VIzZ3YsoTgnUD-zVTsnhgln5BzEsy1n4YkoqkEd_pvTF9oZaukzUoyL-pDfRs=@pm.me>
 <ab4d0394-0d71-45a7-a79b-02e3c90f8ac8@rowland.harvard.edu>
 <N-wnVREkI4qROqLV1rCTIoLRiRzMGvywHt9QIdRD-e5AHby9wfaXcTn2V-Gd_UnmW-JomnWn6xGNhDhIeHIG3VHfHRFmnmPdZEPL8Qi5Gf4=@pm.me>
 <8d415ea6-fe5a-4ec0-8e95-45c03968e666@gmail.com>
 <5jZCAcuLt5YeqkzP4xk28ICJ2WQUxY1eht4CjJNdnGymv3q6AIk3WugtglGVjqvu6BPVO7zHNx7LJeMnS71JUcoNpVZAMmz4o7G4vVyu0GU=@pm.me>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <5jZCAcuLt5YeqkzP4xk28ICJ2WQUxY1eht4CjJNdnGymv3q6AIk3WugtglGVjqvu6BPVO7zHNx7LJeMnS71JUcoNpVZAMmz4o7G4vVyu0GU=@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-05-16 12:56, Ethin Probst wrote:
> On Thursday, May 16th, 2024 at 00:19, Lars Melin <larsm17@gmail.com> wrote:
> 
>> On 2024-05-16 05:12, Ethin Probst wrote:

>> I can also not find such a transition in your other two captures, all
>> descriptor readouts that includes USB Id are 2b5a:000c.
> 
> This is what puzzles me as well. If I'm missing something it's at a
> level that USB Pcap can't capture. When I begin the capture, plug in
> the device and power it on, the second packet is always the right
> descriptor (pid 000d). There is no indicator in the capture that
> commands are sent before that pid is received. As for the other
> problem, yeah, that confused me too; I would've thought that another
> get descriptor request would've been sent, but apparently not, because
> when I remove the device from the VM and reattach it to the host, the
> pid is correct.
> 

You can set up a USBPCap filter on id.Vendor and id.Product (2b5a:000c) 
so that the capture will not start until you connect your device.
It will stop capture (logging on screen will stop) when the device 
transition into 2b5a:000d so you can then close the pcap file.
The cmd making the transition should be near the end of your capture.  :-)

Your IDA-disassembly is probably on the wrong file, I'd guess that the 
.sys file in the driver directory corresponding to the .inf file for
the firmware loading Id is what handles firmware loading/checking.


best
Lars


