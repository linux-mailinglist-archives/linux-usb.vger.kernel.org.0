Return-Path: <linux-usb+bounces-29522-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B709BFC573
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 16:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68B841A03BA1
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 14:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9FA348469;
	Wed, 22 Oct 2025 13:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Cl26XXqs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25C0347BC5
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761141593; cv=none; b=ndwEaMgP8zcrDOTwwWd//j3HmdwW2BwFOsUS9o/lWI31uLSuJ9mlDpyCFkAnN+MjvURlbheFd3MV/FFpTcGoWlIr8QafV0FQlxWboZuX71BYOivg4PFlEW5NSS7WtcoNlty97t9T45qXd0FQ7LvT/5wyJUI5yhQtVCoughZYWtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761141593; c=relaxed/simple;
	bh=zzktPlYhYagaxoz0hc3MgV9wfejhiMJLco3/yrvQ6ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWWU3nG39oR4ZxBc467Ouhr5WmMr4iMQCO+wmdqFbycCkd0lqk2ty/s0wMV5wJK7VUGH1ffWl5i3NrtHGBlwAmJ4LTTIFPJs5m7fzT/vqSUrsSeV+qut3MIkRCJaD1fvSOAkv//XRAjXA4sQoTYktU3FFIKQc8hZX14jcwATR+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Cl26XXqs; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-88f86727622so972604285a.1
        for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 06:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1761141589; x=1761746389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KzsjM2gmlns0D8yQzG61LRrBgMRGPnafVaxgaB/j/kM=;
        b=Cl26XXqsSfmVxr6FLLlYDPciC5wtKQPeBHA2+ia4SglHZSM1fJkfEla0nx1Bp84P2B
         7vY+tSozfKJ8EeIhRqYihoaijC85k6aY1QCUyMDY4v40aJwIEEzOriMyGVgP0fs2i8M4
         /B0xn7mPie4XjkqPqy0L0YD1n1bU3O3eArgSUmET4c03EN9t5IqclzoFfW/LhUP7ATfg
         NFHfqPaprsk8LCxTk/YKVaMdfLko1+anpFZ3vColMDdlOvprZt0MZjljwp1F71L7qed6
         gvExLSpmUf/AfNB6pHUkqGzG+WLSCRBUMyTKIfM5WIsxVbssGVIimjScEeTevCTNSBxd
         QQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761141589; x=1761746389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzsjM2gmlns0D8yQzG61LRrBgMRGPnafVaxgaB/j/kM=;
        b=F70y1HszpzvS+F6ba7KT9YGT/Yzhbh/3uk3MKYZLogQmt5Ja2+yRkJaZam8sXIEBRL
         j+iQqEXZnzoOc5JrPDfN0kjwDRRV+lQ+vXxAPIAOmeElG0FC+b+zC8Dy34Q3XGneFRBu
         0t0EO7yl2TTy3koGoPC0Uykj1f+bCHoNoCHhPJc1lYt04X1OnQJBXS8HUz81BmUiFULk
         IwFHVs6Tv70dToH3FdrqKVJtl2D/O1ymudLxX9jK2VTktyjj2lDlLsRhTxIxzjo2tyLY
         OiAhhijaLhj/rceKuOVJ3LLD86DkKK9vFjbMAZCfNhVx0BPEkAoW37HH2D0HA/Tug7Lz
         sPIQ==
X-Gm-Message-State: AOJu0Yxa7vqrQkrWRsMT92heupAJrqPLhzjrvY/raQnOWb2SHL3c4stD
	Ck2kRtgnXFvICR3XUFSrT9uMcpxAP5oNbhAX36+pH+290amyOawVgehLflJF/lBP9g==
X-Gm-Gg: ASbGncu80yut7kfgDMGcIIf1x5rTdhiLqzoQSYnSZAMo5E6jThSBB+6U/u6Uinw1Sz2
	0JccbNY0aOVgbDtiaG1un2RUuU2W1CckztMN3oDFj8xaqDhDrEWHIziJuPlBilYVEVgHsV7KR1W
	H9tMSOJ/6U4EtWrd0RNchw5BgEndwY3vL+rbRi9GMkE23jrolfTldfQsOSOY5m5lZTL18bQxqku
	IVCl4HTkiTDpYGf6ki4KvCwNbRommrROoxygVddkhe1dNNSNSliFXegTWDelJAHDFOVfZoBJztg
	qsADoecpHybe9mJEysSAQUSeEaeIv22+6MI/gYRaXw2y8MPrj3dC80VMRAaorRJugZLrFiL206D
	QffffbLtrTegHNsAr78CBQVe+/oRqEUfBOicrFwv9FQBI13yOiVgeLBQZRwFODG3WD1y/ODU6pB
	ALCdweNI47qlCBIkFLp3QXW/krmMsAdA==
X-Google-Smtp-Source: AGHT+IEZjFMQoRzVtIIBo99sgqY1oYK2wnBx+nYH7LlJL4Fvj3aIgG+NQdE+ODIKiwszS3M2KdoU/Q==
X-Received: by 2002:a05:620a:470b:b0:891:c122:4296 with SMTP id af79cd13be357-891c122448cmr1944725485a.41.1761141589357;
        Wed, 22 Oct 2025 06:59:49 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cc8d5d8bsm979539585a.8.2025.10.22.06.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:59:48 -0700 (PDT)
Date: Wed, 22 Oct 2025 09:59:46 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Julian Sikorski <belegdol@gmail.com>
Cc: USB list <linux-usb@vger.kernel.org>
Subject: Re: USB A 3.0 port on Asus Zenbook not recognising the TipToi pen
Message-ID: <38586fb0-a60b-44c6-a04c-70f19ec36c61@rowland.harvard.edu>
References: <1393a6c5-3430-49cb-95e6-b18c0f5328b0@gmail.com>
 <cfc6d2ba-a820-4bd3-990e-7800bce171e2@rowland.harvard.edu>
 <967e7681-c9ff-4421-ba89-d83bb40f1af3@gmail.com>
 <4c6bbcd1-0ed2-496d-82c4-3fc9a1c2660e@rowland.harvard.edu>
 <1a960051-b1e8-49a5-bdea-1ddd719cd0ec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a960051-b1e8-49a5-bdea-1ddd719cd0ec@gmail.com>

On Wed, Oct 22, 2025 at 03:25:59PM +0200, Julian Sikorski wrote:
> 
> 
> Am 21.10.25 um 18:01 schrieb Alan Stern:
> > > > Have you tried using the pens on a different computer?
> > > > 
> > > > Alan Stern
> > > 
> > > Hi,
> > > 
> > > I did, I just tried again to be sure - with the allegedly broken cable. This
> > > is on my ASRock Fatal1ty B450 Gaming-ITX/ac front panel USB:
> > > 
> > > Okt 21 16:42:00 kernel: usb 1-3: new high-speed USB device number 4 using
> > > xhci_hcd
> > > Okt 21 16:42:00 kernel: usb 1-3: New USB device found, idVendor=04d6,
> > > idProduct=e101, bcdDevice= 1.00
> > ...
> > 
> > That certainly indicates part of the problem is in the laptop.  What
> > happens if you try connecting one of the pens to the laptop through a
> > USB hub?
> > 
> > Alan Stern
> 
> Through a hub (Dell Monitor) the pen works as well:
> 
> Okt 22 15:19:57 kernel: usb 3-2.4.2: new high-speed USB device number 10
> using xhci_hcd
> Okt 22 15:19:57 kernel: usb 3-2.4.2: New USB device found, idVendor=04d6,
> idProduct=e101, bcdDevice= 1.00
> Okt 22 15:19:57 kernel: usb 3-2.4.2: New USB device strings: Mfr=1,
> Product=2, SerialNumber=3
> Okt 22 15:19:57 kernel: usb 3-2.4.2: Product: usbdisk
> Okt 22 15:19:57 kernel: usb 3-2.4.2: Manufacturer: anyka
> Okt 22 15:19:57 kernel: usb 3-2.4.2: SerialNumber: xxxx
> Okt 22 15:19:57 kernel: usb-storage 3-2.4.2:1.0: USB Mass Storage device
> detected
> Okt 22 15:19:57 kernel: scsi host2: usb-storage 3-2.4.2:1.0
> Okt 22 15:19:58 kernel: scsi 2:0:0:0: Direct-Access     Tiptoi   ZC3203L
> 1.00 PQ: 0 ANSI: 2
> Okt 22 15:19:58 kernel: sd 2:0:0:0: Attached scsi generic sg0 type 0
> Okt 22 15:19:58 kernel: sd 2:0:0:0: [sda] 7013632 512-byte logical blocks:
> (3.59 GB/3.34 GiB)
> Okt 22 15:19:58 kernel: sd 2:0:0:0: [sda] Write Protect is off
> Okt 22 15:19:58 kernel: sd 2:0:0:0: [sda] Mode Sense: 03 00 00 00
> Okt 22 15:19:58 kernel: sd 2:0:0:0: [sda] No Caching mode page found
> Okt 22 15:19:58 kernel: sd 2:0:0:0: [sda] Assuming drive cache: write
> through
> Okt 22 15:19:59 kernel:  sda:
> Okt 22 15:19:59 kernel: sd 2:0:0:0: [sda] Attached SCSI removable disk

Then I guess you have your answer.  Something's slightly off in the 
laptop's USB controller or connector.

If you still think it's a software issue rather than hardware, you can 
try posting a usbmon trace showing what happens when the device is 
plugged in.  I suspect it won't reveal much, but you never know.

Alan Stern

Alan Stern

