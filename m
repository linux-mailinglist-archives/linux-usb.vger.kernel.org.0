Return-Path: <linux-usb+bounces-12188-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA76930337
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jul 2024 04:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDA771F21CF6
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jul 2024 02:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD25C125BA;
	Sat, 13 Jul 2024 02:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EzCF3223"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CEE33D1
	for <linux-usb@vger.kernel.org>; Sat, 13 Jul 2024 02:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720837090; cv=none; b=VYgaCpd9ZMZAqa2gVmbEflfpsksznLviDdt9agfEVT/DkRS9MmqVw6ufW3rssrbSGDJsn2sUwiIRvXC5HcOEQHR2ryR3mKgwJD0G49pov2gWsriNO7eqZwS2BKifupMgal18ip8D+Mo27p1DR089//wQZoeEz1csyYQx4h01Wf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720837090; c=relaxed/simple;
	bh=hIdtXzR2PQnsAKWeiPInLMv+lItza5ODBCFpLDMd+ls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kFR7Fu0FlkCsn+QmZQRjYw0oPnKrkUJmUD4meg9PQT1CEXhwlYRdMWq+FHcc69gIzDIPi1SwSH9DEZ1VfSkD3P9p74jPlWfMjrgQoUnboioow+XO7W3oTUlP6CxvQOyhDdmHuFSQkEBlTsT0mcGxqskyNopHfFjjHu7HTHWIVOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EzCF3223; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3d9400a1ad9so1501284b6e.1
        for <linux-usb@vger.kernel.org>; Fri, 12 Jul 2024 19:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1720837087; x=1721441887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4/vQGc924ZtBHUCsIbXJM+oSQ41bTSKdLtLmWvVwcc=;
        b=EzCF3223HqFuO7i+yPBS3pvcmSYUoaqQJbxzWKrJmofU0CYl+JM2NnylsZe9U8ne58
         eM6ZX0DcZ3t5Pl/RoV4uAVMSWCvRQiyD02fHlVBFYd/Wv5rZcBP1vXi4Q/7MCASalNab
         9khpIgGwMaoTGf5Zn7RoHgoaMRwP83lmaL9Ide7slQF/o9iCZIYzzZnDHkj4CzH1pXN8
         LBAB071aVpb8nju/uvmrZfVGHrywxVRwboSTJIaYPRIhpClzXzYarijLUV1EY7CcFGik
         4YIix7cPW2OLGJWK6D42if6s6OXki4TIEhM1X65x1eDL971z5LpvaPdor2Oel3MhJH+e
         g3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720837087; x=1721441887;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4/vQGc924ZtBHUCsIbXJM+oSQ41bTSKdLtLmWvVwcc=;
        b=dmjWV1AW2V0l+INa51I7es+Y5LLCaG8O2wqzXT+hqmIZjZ2T7mhFE3D1XuVPyJcj3U
         3Uq3IIN98qSdQwwyOAmxy5Y04Shmz2WETbZQ/WW1GitjaLfVVIu9sIgR/YnqBfB0coD8
         3ck9B3CCLEXaS6ktmrf6Ksp4+X5yp+P7helHOneOAsMpwR2RKuBelY9KO1jZxYuVL/RD
         3BIoOJTGlJa2s/O1ssMPK/TppTdlrUFDgIOd8ms03ujFcSOTuIwHEIa0pa0cbLoARu9Q
         PUrjEJKiryAbqXV8p9iCUwQV9BGW2rpLORDpmVJJgXim4VKgXkJNjrEJlWkxf4gAQfNv
         nZPQ==
X-Gm-Message-State: AOJu0YwabIJOCF0ACsj3KfGYpgNNqzdVEPzz0snnZQpEXg/0gEfj5mqy
	LwzhyTL4F5tEzCKIQMGjokhtxxDbmGzE80RAYYPjcUpGL6e+41V/hX8UTsdBNviGn8nw3c99KNc
	=
X-Google-Smtp-Source: AGHT+IG/L4q90OJeEDd2vgiTcymYpsKhCUx9J/rY6m5Z39M8RoDey0geD/D45vE0rEJ2zCP57l8Brg==
X-Received: by 2002:a05:6808:16ab:b0:3d6:32d2:2c10 with SMTP id 5614622812f47-3d93c03902dmr16933123b6e.31.1720837087123;
        Fri, 12 Jul 2024 19:18:07 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::cad7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a160ba4e00sm10843585a.2.2024.07.12.19.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 19:18:06 -0700 (PDT)
Date: Fri, 12 Jul 2024 22:18:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?B?6b6Z6YeN5L2Z?= <longchongyu22@mails.ucas.edu.cn>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: Consultation about max_sectors in Linux SCSI Drivers
Message-ID: <98ce660b-cd13-4ffa-851c-ec3cdca9bdcc@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 11, 2024 at 10:16 PM, 龙重余 wrote:
> Hello!
> 
> 
> I'm sorry to bother you. Here is the problem: My usb storage device
> has a 64kB (limited by hardware) buffer used to cache reads/writes
> which means it can only cache up to 128 blocks(512B) of memory.  The
> SCSI Write-10 and Read-10 command has a total-blocks field that can be
> up to 240 blocks (120kB) for USB2.0.  When originally testing the
> product on Windows 11 it never writes more than 128 blocks at a time
> but when tested on Linux it sometimes writes more than 128 blocks,
> which causes the usb storage device to crash.
> 
> 
> Is there a way to tell the host OS not to request more than 128 blocks?
> I have implemented block limit VPD page, and it works well on Windows
> 10/11.  I even set the block limit to be 64 blocks, it's OK too.
> Because before the data transfer, the windows host issue an SCSI
> inquiry order with the VPD PAGE CODE is 0xB0, so the device could
> transmit the block limits information to the host. And then the
> windows host could adjust the amount of data transferred.
> 
> However, on Linux or MacOS, the host does not appear to be running the
> block limits command.  So the host don't know what is the block
> limits. So the write/read blocks number beyond the buffer size.
> 
> 
> Could you please tell me what can I do to dissolve the problem?

(Note that this is really a SCSI question, not a USB question.)

You tell the Linux host the maximum number of sectors the device's 
hardware can transfer in a single command by writing to the 
max_hw_sectors_kb file in sysfs.  For example, if your device shows up 
as /dev/sdc then you could do:

	echo 64 >/sys/block/sdc/queue/max_hw_sectors_kb

You can even write a udev script to do this for you automatically 
whenever the storage device is detected.

I don't know why this doesn't happen automatically.  Maybe the SCSI 
layer doesn't try to read VPD page 0xb0 on USB mass-storage devices.  
You should be able to find out by asking on the 
linux-scsi@vger.kernel.org mailing list.

Alan Stern

