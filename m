Return-Path: <linux-usb+bounces-28791-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6224BAA236
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 19:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 069DA3AA88F
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 17:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D1130DD17;
	Mon, 29 Sep 2025 17:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rXnHHlgT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF582D3A9E
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759166400; cv=none; b=C73pKy2y5rFi9XOqYQv0YvFRXcV9+pEfSJY7P8f8sC0EElxsg0tPNPM8v813B5CSFep9HsXcquvVOxT7yC8VPDMCeXpbzGTEDIpfXoslvUy6BepxANz8ezkUWs2oPn4QGonAhA+2TEaWnbnu4JuDdY9qwaAJbP8GZcDPkZgDLnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759166400; c=relaxed/simple;
	bh=KovFXSTof+puwsswsJKX8D8sJ9m/EqjjFXJIE97igsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFawvOV7uS/WEQMoSX96jGMyyhYV7+swsqzpUL6UmsLmWeiQquzL4+QUWk1ROYffdFswb5xzPsj+RN21qeeM8SXwkX1fplwrakHQlXb9+OsFrcaLMqdFn6qPgL6TuNpRFsvNxy+XOpsWS2BFr8uz2eRs59GtDeYnM+lpOy1d2Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rXnHHlgT; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-85630d17586so688565685a.1
        for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 10:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1759166398; x=1759771198; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jxjm477kIfJ9Uxa/CFTb6lvrauBmZROD0rbegQOBV+o=;
        b=rXnHHlgTGjls8uJm7LppCHeyPIIQyQNNHaud0yjWxXpfDsHv8vxIxs9vDHZ2QmttWF
         JUsVHPkkTGxl7g0XFP8deQmcy7S6Z/Ajio5Z3o0ggDZRpNPgn7TWkDLHUuOoiV21PRFH
         7Wae59uiD+bhdUiSzx1hyUh5qsZHoFzt2WwnH8jUoytwLMOBK5b2IXLgeERL7Yly8/0f
         zieMl1z8fXnkunW/U6pdk3b01wIcI9pBeRy9VPCDUQg9ZGPG4J6ur2Tn2f43sfZdH8Xc
         8jYCUMxANOvJNCdBwozdcfJiRebfWyjdAK6IjJ5PhzSFXFtHAAVC1OKVVGUTTwaNhn7V
         jd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759166398; x=1759771198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxjm477kIfJ9Uxa/CFTb6lvrauBmZROD0rbegQOBV+o=;
        b=unUHBjNkRUllU9p21aTKEKMhee7P8cPsGJV9g4N4+QLp8YGHMqBnPDIpSdklQe4pAH
         y/UdJy+K9TBKRhttDHvZorR6zPhMccwGU9bjV+mAeeFQdn2xNrtITODcsHIexLosdNwm
         vIsgcs/shdC0XQhi3gASvhJSEfQ/9Tg+iCzfq60HxLL2XZ0KrM6LIqswPUaX5y28OBa8
         aTVUEOgfpsL2ASspnhbXyXmq9u8Kezzv8iHCLNMBKb6sGYVVziA1h4HnNhzMoEGyu5IF
         SC6UnGioZrVNeL/y6K3nRMoOxgJzsEulQCE9FGGkfrdU254zkSydqM+1SdJIChHa4x7f
         f0Mg==
X-Gm-Message-State: AOJu0Yzi1BQFYr4yxIZD5zWm3G79tqGtOPv+Tu435oXPtWEaDF/QcPsq
	3eMUuosJlQQPHyeCMQIdGysdKd9pqIRREUsUXpWcNA0+zwm2LIEjWcakn6ZTuMxjYlDJdygMxZK
	Qw/Y=
X-Gm-Gg: ASbGncss1nStIwKxE6kZUMvj0jrQnoLGZHUgCCrvXsYDQfv/EligT7DgQA8vS3HneFU
	+vSzGOIksxGP2E6kUq5CHg6AXMMndC/zhG2umAO/hDw+2RDCjfl3eOz0eUdcO6CG2KghWjJNNgr
	MSCNShGfjtYH5xg0NQeETga3q01qqReyjmvU/mS4erB8fyh0mof5yE30kMTnxyaYNds/8c/BwD0
	uMls/2QjVnICKaE4GcadjxrilZ0otL6HwqsRGAzYIo3BVq5/ytkeZxEY6ojkf0DoIZ+piZScOyz
	ciC28XwAt5yf4mCB2OnoPnxtD0QrYyTFbFeX4qeMmrcZt5sdVYWteFreP6AutARnrapG1Tx/usl
	zxuoqlF2JDrN4AXeuCVDxLNj/2SAOt2BLmvg7xMSR1Bvxzc6fxkGCiOR4oFQtrWu2LZ1D2BkRXt
	Co8K7aBbk5r9Nxof48FKpF
X-Google-Smtp-Source: AGHT+IHngoEuQS9Fj4rE9G+8HIKKfSzpGGYhmIV/AJRoEZ0v/ma2eZlhdEM3s+rRKh+YQ4JHm3qoIA==
X-Received: by 2002:a05:620a:26a7:b0:85c:b613:633f with SMTP id af79cd13be357-85cb6136a5bmr2032638785a.44.1759166397237;
        Mon, 29 Sep 2025 10:19:57 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-58.harvard-secure.wrls.harvard.edu. [65.112.8.58])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c334c2978sm840048385a.56.2025.09.29.10.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 10:19:56 -0700 (PDT)
Date: Mon, 29 Sep 2025 13:19:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Han Boetes <han@boetes.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: As per request
Message-ID: <59cd5e01-c5c1-439f-a09e-c3d9657b35dd@rowland.harvard.edu>
References: <7c7d0b10-9969-45e8-9440-563960645c36@boetes.org>
 <e31f129f-1119-4a22-a71b-d0d559ac2a07@rowland.harvard.edu>
 <6e5d2ec5-f747-4905-89ef-45796104421d@boetes.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e5d2ec5-f747-4905-89ef-45796104421d@boetes.org>

On Mon, Sep 29, 2025 at 06:40:07PM +0200, Han Boetes wrote:
> Most certainly.
> 
> %  sudo lsusb -v -d0603:8611
> 
> Bus 001 Device 006: ID 0603:8611 Novatek Microelectronics Corp.
> NTK96550-based camera (mass storage mode)
> Negotiated speed: High Speed (480Mbps)
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass            0 [unknown]
>   bDeviceSubClass         0 [unknown]
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   idVendor           0x0603 Novatek Microelectronics Corp.
>   idProduct          0x8611 NTK96550-based camera (mass storage mode)
>   bcdDevice            1.00
>   iManufacturer           1 Cycliq
>   iProduct                2 Fly12 Sport
>   iSerial                 3 966110000000100
>   bNumConfigurations      1
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0020
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              500mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass         8 Mass Storage
>       bInterfaceSubClass      6 SCSI
>       bInterfaceProtocol     80 Bulk-Only
>       iInterface              0

Thanks.  If you can build your own kernel, you can test the patch below. 
It ought to eliminate the log messages.  I should have noticed this when 
the unusual_devs entry was submitted last month...  Oh well.

Alan Stern


Index: usb-devel/drivers/usb/storage/unusual_devs.h
===================================================================
--- usb-devel.orig/drivers/usb/storage/unusual_devs.h
+++ usb-devel/drivers/usb/storage/unusual_devs.h
@@ -938,7 +938,7 @@ UNUSUAL_DEV(  0x05e3, 0x0723, 0x9451, 0x
 UNUSUAL_DEV(  0x0603, 0x8611, 0x0000, 0xffff,
 		"Novatek",
 		"NTK96550-based camera",
-		USB_SC_SCSI, USB_PR_BULK, NULL,
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_BULK_IGNORE_TAG ),
 
 /*


