Return-Path: <linux-usb+bounces-29490-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2497BF7234
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 16:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9603C188403F
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 14:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F265533B952;
	Tue, 21 Oct 2025 14:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vpt7OrVs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6487175A5
	for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 14:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761057869; cv=none; b=nYkFtsuveyOLxiVelkUogY6agiFziQHr7gjQvLNUaOuhpE2g5oAYtGuH9EkDGFpD5qqmhNDuCf126ZRXy7uUYi+xwXwitE5xAUtTyduRzqI1gorsBhWyQi0sG+RijllQT8W3lP6auyK1onCYA3IfUbdSyjlolMYWL1LA3fpmi0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761057869; c=relaxed/simple;
	bh=uA3v6fbTcl2vnSgX8aQxR6PGhK67A3Rwls4WuGDGw2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QzFJ1W7hea6nxRrdT+jkQNo2n5pxn7JiDdrSBNBA6OnMWWCzH4h6ZB13kMKgu2vVCD2m1iQ/9r3Iv7j0MtCHeElD/SZMoWDsTwMk+QUxwP0Gj/AAs55yoIuO6EthsOqhKx/nFcO4nyKl0XGIvNyFEFVRRtQSUiOu+833b1AsELU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vpt7OrVs; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b4aed12cea3so956820766b.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 07:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761057866; x=1761662666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s3x4NP8j9wuhvu37kTv/hkiZ3miVb8JM8RQAtNtgDX0=;
        b=Vpt7OrVsg+ngsZVo6D7BjTSv3tuozD+o+yo90HwdgFfWjsmtpPisMIsPXdxScP2Mno
         mta3jjrt2uOUUob4g7IFjplW3mwJzxXrjk28z+ckXwGnwAu6dSgqPPXlIh//pyDYpBQj
         5kTgtBx8PrdgsfUU4eM5SY5JKah2Kxbjv6sw1NxfxtxjACMJnoAjgb0Dqp98tccGUOeD
         re+aKzoqbUvM/XMPK4A6NdDubl4Qvt40LUhbLalsx3+SEC18/YoF+9eUF6ATjNPMLxXU
         Ee4ejuPbt2MyLY4higAZLBfpG4PnDkwmDDtOrqnGJNIogiCTdUoQ44uZIPwzpoTE1/ax
         YRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761057866; x=1761662666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s3x4NP8j9wuhvu37kTv/hkiZ3miVb8JM8RQAtNtgDX0=;
        b=sdkviBDRFSCvDf5RXiOmEQkwK88gMxk7fOGDFdQbMvZuQdlA/gYs/F+emAa1X03EsY
         PX3HoEpMaU2gGh2H71mLNUt/o3cuPgS2D2C4Phjy3ElcEsdbFHIM3mxzrau0PKe7/RfO
         eLL9Cz7ko7l58UTDMgrZr94dOHUi5T+AAQxJnEFv69bl/esOJBAws/R/aBlGdye5FMeH
         4lQI+8wRpJXu5JSlyS1CQ98xiKLvBVr1c4N3CuRYAq8l69u6MG/K2aPeEYg36ASSPqcH
         Y4wjk6AjOlNoyEtNxZxpIiDU7xAEztPwB+aqTN55O04F+J+T0oFuvD4M21Kn08qBTEmf
         CZsA==
X-Gm-Message-State: AOJu0YxHnNSr+oyouvnFFCcRbEypNZxSodrGbHxkZOoz6PUjmlk7PWB3
	oNLZJw1JP/11BQj59YFJ7/k8RqI+XQ3RrgJIhvyaltj7OZMTV0ob83cQLRcAZw==
X-Gm-Gg: ASbGncuSv1uL5i8g4yOVP8YYpta7tFquOp2oAqS7mHmwqPLbnIcOP9ebq6Q0ct0ys+b
	h56BpLJQCl6GlQ5yjfprQ4e5zzIPqeU0PNLW6Et0iVgwV8EbyznouzzN6MJXe/wqar1zqwdsPnT
	arUBClZag714KzUhWxZ8dEd1DpipEUMBtXcGcuujeCcpXPmg8/c2vUrFUPDC1Xu67f1xj1S3ZO3
	uQfCZeCbsccdiagVEYU7aRxhFVFFNWTLOlXz4t99ecXmbl050juVBYTB2w8lVAJVm3ZxrJgWAZE
	4Orydmq4pyUe79l8yKUN6jbqQHmsEd2+u5K1gTvUlbAXJp0zI0k51Pa3nPjFR80MYeeSTo4IZzb
	CTxJXfH6BodGGld5bOsStlxVyRh8F8aLcgstPSUn4zOdAQxvsz6oe+rL1YJfDnj0r4QIdRbHlwD
	JyL7eY0ttG+cTAvpsOh7BC553t3w8BODnzhz1SphRRl7c9NxD783hPaJhGCSO6ZM1D8WVlSrA=
X-Google-Smtp-Source: AGHT+IEq+6KS54s0qHoMIpaoivLozqHJl+7xPU1K1pAz09gDLKITZt2b4ByStkPlA8kAnZE/u0Z/vA==
X-Received: by 2002:a17:906:7312:b0:b42:f7df:a2ec with SMTP id a640c23a62f3a-b6472d5bc00mr1995112366b.9.1761057865709;
        Tue, 21 Oct 2025 07:44:25 -0700 (PDT)
Received: from ?IPV6:2a01:41e3:2249:d800:8b72:36d6:b950:659e? ([2a01:41e3:2249:d800:8b72:36d6:b950:659e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e896f904sm1113976566b.35.2025.10.21.07.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 07:44:25 -0700 (PDT)
Message-ID: <967e7681-c9ff-4421-ba89-d83bb40f1af3@gmail.com>
Date: Tue, 21 Oct 2025 16:44:24 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB A 3.0 port on Asus Zenbook not recognising the TipToi pen
To: Alan Stern <stern@rowland.harvard.edu>
Cc: USB list <linux-usb@vger.kernel.org>
References: <1393a6c5-3430-49cb-95e6-b18c0f5328b0@gmail.com>
 <cfc6d2ba-a820-4bd3-990e-7800bce171e2@rowland.harvard.edu>
Content-Language: en-US
From: Julian Sikorski <belegdol@gmail.com>
In-Reply-To: <cfc6d2ba-a820-4bd3-990e-7800bce171e2@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 19.10.25 um 17:43 schrieb Alan Stern:
> On Sun, Oct 19, 2025 at 08:34:27AM +0200, Julian Sikorski wrote:
>> Hello,
>>
>> disclaimer: this is not linux-specific as Windows 11 also fails to recognise
>> the devices, but maybe someone has ideas regarding the causes here.
>> I have two TipToi Pens by Ravensburger. These are recognised as
>>
>> 04d6:e101 Mentor Graphics usbdisk
>>
>> when plugged into USB C port via USB C to micro B cable. When plugged into
>> the USB A port, the following messages are reported into the journal:
>>
>> Okt 19 08:19:08 kernel: usb usb3-port2: Cannot enable. Maybe the USB cable
>> is bad?
>> Okt 19 08:19:09 kernel: usb usb3-port2: Cannot enable. Maybe the USB cable
>> is bad?
>> Okt 19 08:19:09 kernel: usb usb3-port2: attempt power cycle
>> Okt 19 08:19:10 kernel: usb usb3-port2: Cannot enable. Maybe the USB cable
>> is bad?
>> Okt 19 08:19:11 kernel: usb usb3-port2: Cannot enable. Maybe the USB cable
>> is bad?
>> Okt 19 08:19:11 kernel: usb usb3-port2: unable to enumerate USB device
>>
>> I have two pens. I tried two cables delivered with them, as well as a
>> different USB A to micro B cable I had. All exhibit the same issue.
>> Does anyone have any ideas what could be the problem? My first guess is that
>> both the laptop and the pen are slightly off-spec in some strange way, which
>> causes them not to work together. The USB A slot on the laptop works fine
>> with other devices, and the pen works with the laptop if connected to USB C.
> 
> Have you tried using the pens on a different computer?
> 
> Alan Stern

Hi,

I did, I just tried again to be sure - with the allegedly broken cable. 
This is on my ASRock Fatal1ty B450 Gaming-ITX/ac front panel USB:

Okt 21 16:42:00 kernel: usb 1-3: new high-speed USB device number 4 
using xhci_hcd
Okt 21 16:42:00 kernel: usb 1-3: New USB device found, idVendor=04d6, 
idProduct=e101, bcdDevice= 1.00
Okt 21 16:42:00 kernel: usb 1-3: New USB device strings: Mfr=1, 
Product=2, SerialNumber=3
Okt 21 16:42:00 kernel: usb 1-3: Product: usbdisk
Okt 21 16:42:00 kernel: usb 1-3: Manufacturer: anyka
Okt 21 16:42:00 kernel: usb 1-3: SerialNumber: xxxxxxxx
Okt 21 16:42:00 kernel: usb-storage 1-3:1.0: USB Mass Storage device 
detected
Okt 21 16:42:00 kernel: scsi host8: usb-storage 1-3:1.0
Okt 21 16:42:00 kernel: usbcore: registered new interface driver usb-storage
Okt 21 16:42:00 kernel: usbcore: registered new interface driver uas
Okt 21 16:42:01 kernel: scsi 8:0:0:0: Direct-Access     Tiptoi   ZC3203L 
          1.00 PQ: 0 ANSI: 2
Okt 21 16:42:01 kernel: sd 8:0:0:0: Attached scsi generic sg2 type 0
Okt 21 16:42:01 kernel: sd 8:0:0:0: [sdc] 7013632 512-byte logical 
blocks: (3.59 GB/3.34 GiB)
Okt 21 16:42:01 kernel: sd 8:0:0:0: [sdc] Write Protect is off
Okt 21 16:42:01 kernel: sd 8:0:0:0: [sdc] Mode Sense: 03 00 00 00
Okt 21 16:42:01 kernel: sd 8:0:0:0: [sdc] No Caching mode page found
Okt 21 16:42:01 kernel: sd 8:0:0:0: [sdc] Assuming drive cache: write 
through
Okt 21 16:42:01 kernel:  sdc:
Okt 21 16:42:01 kernel: sd 8:0:0:0: [sdc] Attached SCSI removable disk

Best regards,
Julian

