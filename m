Return-Path: <linux-usb+bounces-21642-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB67DA5C369
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 15:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 440B93A4E5F
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 14:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2324425BAC5;
	Tue, 11 Mar 2025 14:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wQfCsdhL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189F3253F13
	for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 14:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741702360; cv=none; b=Pr8iZ1wmsraJeuXzq8OgCpVMOObWHGAe7yEq1KxeC4m4C0o1LxTBtQ8ZAXCKU9fpHqOkZa+TDKnWUk6bLkV6nOhHxMjGP6JNiamjQ3lqe9WnxATmsmlmGyxyw/Cu+BZPNbyk1ztZERrOgJuhe8gierwgoaZti/wOiaFvqDuh+PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741702360; c=relaxed/simple;
	bh=aSiRFGz9D35mrAPWQkuBnfHc989qYrNXBTYMoWctP7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTgOoFcrrjw1PVJHWTQoeLFPVgDzJOsIeR7lZSgvxMKT4s2sL5ODdO5fDqI2cAioHPNf3L0VWvYrfvW8yBaadutdQSodv8tYRbVnAI0ht3VoW4j0/CI09P6UFBk5vbFYXssqOzzi6Fa+Jmg/tLzPpUE1QnC5WPd/n2iihSijOjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wQfCsdhL; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e1b11859a7so22365996d6.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 07:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1741702358; x=1742307158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kqS90eFGJ7/q/06uqKRGMnqOqUkTAtZXlVsfnwLorTA=;
        b=wQfCsdhLiwERXFdv6X6BsxDRjN7B6y6gxFpkIbbfNEGZOn5ivp5LJ4GquzHbL3y0kg
         jZ2aACKE+SJts4+SV8yQbCbJFaqXrM8wMeAsXBQwl0CrYH1ULC9tUUBJGh5Dl+coQ1uT
         hl1KLrUZPnaT1PV7aX/2qqpkmeJxr7//Y/yyLsdYk0WsXQRphb45T9A4htaBOKCidDrK
         jE6RX/eTn49A8PpDf5np0hQwG6Yk0CdgSA/Iv3nsxTAff7G4ejg3e19F+0txXKH5XO+3
         BzZ/ZJJI+gZONWbKgyGwiKs6tReZb4DHwkAMDDJH81nRGZSXmq6jilOZHXHux1hTWFN2
         c4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741702358; x=1742307158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqS90eFGJ7/q/06uqKRGMnqOqUkTAtZXlVsfnwLorTA=;
        b=dTeC3y1hUlAOnW0zXMH7ipB2s3yEueKljbUZO4Yhj3aGlFlGdP6eL7Bh0okCpOCXKB
         x++nAo/BxrFod8hdFpuzDSfea7kUlPEFOD0uK+F1ItFHMjFrkG6z11BGcDu3Mx8qqwbX
         msu5kwc6kUGal5T+eXcTDl21F6Whgv3EH64FFuoJ8VmU59/ac9D/H/mue7yoQLRVsmb2
         BypxyytwenE48gz4yvnT5s0OqDQ5CZI5JDwkeCYCiOsuCRjzeaPAJY7XHHFSaWPKnscZ
         uc5UIV69EWlQDQmtscA5/wip8CDqedhdOB4yz/2Z87ALzwowj6jN808Rfb7GH928dWMm
         E3Mg==
X-Gm-Message-State: AOJu0YwwPF2Hu+2S1StTw3/wOyK1qIjw0QwAnrXO3egxL8RGryfsrDUT
	/Q6RS8WRDgxWPbZf8is8NiF+4dZl0RgURBoXjydGYtna7GTcy0OOgwdCcEXQi1ZJQzTjNFqiXJs
	=
X-Gm-Gg: ASbGncshLgOhsI6SHa8teR0bPbQG974bSBnWtZ8K52XsiQHGw7fXxJtvrUn2aqwG2mm
	GtL8LMyjZCf1XvGknLA0+Ie9kSxCF6KoCKbmhayU1iS0BKnFARpNjZzd5ji351rXkxKTlTMxkUX
	/DF6xoqrft8dgMq1t6fB9m2i2YeHJ7cLTKeeg9YlOOvT2Qs7C1PX99zRQ2kplMfZVJ1x3lx0n5q
	KQRpsxBqpfsf0GCJnUjoXuuA436hE9qq9HQgERZqPmLClnMPt12/R9q/ql5MWcVK0NTWuUacqKo
	S8GpCDDBuP7N7YRFdsR6xOonE5XW9iH+IBybUr1m/RPP+40LRKjsa7gUSUV54VI=
X-Google-Smtp-Source: AGHT+IG9OcRAVr85+6mryYW0AABpehp6sfpdYUxay7oilkgQGXomiBnCuZqNDdPtDuWmRcmZHyKWsw==
X-Received: by 2002:a05:6214:4113:b0:6e8:f60b:9bf8 with SMTP id 6a1803df08f44-6e9006c8774mr209755866d6.33.1741702357937;
        Tue, 11 Mar 2025 07:12:37 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8f707bf47sm73501706d6.25.2025.03.11.07.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 07:12:37 -0700 (PDT)
Date: Tue, 11 Mar 2025 10:12:35 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xin Dai <daixin_tkzc@163.com>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: Fix `us->iobuf` size for BOT transmission
 to prevent memory overflow
Message-ID: <6a266eb7-0150-43e9-a712-b9e6fe8c71ea@rowland.harvard.edu>
References: <20250311084111.322351-1-daixin_tkzc@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311084111.322351-1-daixin_tkzc@163.com>

On Tue, Mar 11, 2025 at 04:41:11PM +0800, Xin Dai wrote:
> When the DWC2 controller detects a packet Babble Error, where a device
> transmits more data over USB than the host controller anticipates for a
> transaction. It follows this process:
> 
> 1. The interrupt handler marks the transfer result of the URB as
>    `OVERFLOW` and returns it to the USB storage driver.
> 2. The USB storage driver interprets the data phase transfer result of
>    the BOT (Bulk-Only Transport) as `USB_STOR_XFER_LONG`.
> 3. The USB storage driver initiates the CSW (Command Status Wrapper)
>    phase of the BOT, requests an IN transaction, and retrieves the
>    execution status of the corresponding CBW (Command Block Wrapper)
>    command.
> 4. The USB storage driver evaluates the CSW and finds it does not meet
>    expectations. It marks the entire BOT transfer result as
>    `USB_STOR_XFER_ERROR` and notifies the SCSI layer that a `DID_ERROR`
>    has occurred during the transfer.
> 5. The USB storage driver requests the DWC2 controller to initiate a
>    port reset, notifying the device of an issue with the previous
>    transmission.
> 6. The SCSI layer implements a retransmission mechanism.
> 
> In step 3, the device remains unaware of the Babble Error until the
> connected port is reset. We observed that the device continues to send
> 512 bytes of data to the host (according to the BBB Transport protocol,
> it should send only 13 bytes). However, the USB storage driver
> pre-allocates a default buffer size of 64 bytes for CBW/CSW, posing a
> risk of memory overflow. To mitigate this risk, we have adjusted the
> buffer size to 512 bytes to prevent potential errors.

There is no risk of memory overflow.  The length of the transfer for the 
CSW is limited to US_BULK_CS_WRAP_LEN, which is 13.  And the length of a 
CBW transfer is limited to US_BULK_CB_WRAP_LEN, which is 31 (or to 32 
if the US_FL_BULK32 quirk flag is set).  Therefore a 64-byte buffer is 
more than enough.

Alan Stern

