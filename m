Return-Path: <linux-usb+bounces-17807-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F329D6755
	for <lists+linux-usb@lfdr.de>; Sat, 23 Nov 2024 03:49:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B22616153E
	for <lists+linux-usb@lfdr.de>; Sat, 23 Nov 2024 02:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BC745008;
	Sat, 23 Nov 2024 02:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="VvixNpYJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2BA46BF
	for <linux-usb@vger.kernel.org>; Sat, 23 Nov 2024 02:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732330151; cv=none; b=Q0Gj5nOymDek6UxB+eXRJHcDnopcUBYZoNYExbKRJfl489IKtOC9690hprw558O4Iw8fe28mhnKRd9tUs+AihLWa1PRgQR1wTkdbVWOWW80UWUnh9wd1r8Fu9Cz/MI5nBkyaCAroalDXRkV7/jU2xi/Vxd8DgjeWtZY2Vl5ZhBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732330151; c=relaxed/simple;
	bh=EvM9q/9s62JhxKR+Um9cKVjUkgBtPUTtDA3OU2gQZG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0fmdMvTRRmnhTiSC5r2YJOdF/ex+tGGZPoSVzeI2qUGLqvjVpYKdj+AVUxqBzUfZv+AwMC7TrFepNjPM+CaumVZJQnZUBtZJ6gi8BOGfF1iPuXQ4SiZlEu+zfXTncP7PEq+VPtUS8Q58/8vCBrYMaimjGIdX3TTwLXghC/ZqYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=VvixNpYJ; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6d419832bf5so22571826d6.1
        for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2024 18:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1732330148; x=1732934948; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=abhTd5a2w9/ehx92sHtVDdZ5gpjrBHS3WBCQPos8PDM=;
        b=VvixNpYJtndnCsk0TNMHd8YWLvBkDbWo5UNvRB/OHi/GRDEhvRCiyTIb0jqSW8dq5L
         JdvyVaHvPe+v+k86A5lT9PMa/UsSPMOIUuuiJyclc7d2KLUo9immaxpkcKMxHj5DZTdW
         ABs8RB1GL4wzfTcMN7YSbHMA5tgrFx91nU6DruEBsbkKEvxzzALNL5w91OfHrl1ypLsp
         SFNZgmKUgaIbZQfD2m5Xb8hsqDWEC4FO3RWuNXVN4p0dyGSL8c4nlTLr4ebA3KnqZnch
         /8EzAqAzM6dgzVpCuMJQyHKtzEgt/iMOxvxgY8XGS0AH0TXv6p/CB4m5yzqav+7Svc9O
         0mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732330148; x=1732934948;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=abhTd5a2w9/ehx92sHtVDdZ5gpjrBHS3WBCQPos8PDM=;
        b=BZ0BWJ+Ifc0/s3kJwk1lczUMSnRZzjHwGIbI9jgvfaNJIIWRMehK1zZXAbseJEKerZ
         k3SIWpuo/7Nq45Sta+hr8ssK3VmjkklsJGELQPAEBtOTuS/gh3VGBbcAhnZQj84pWXdA
         tLZe5YPUKTgdmVvtdef7jDuVKrkEs7sowwWyO0LFLwrPFRGg1crT4I/nmVsixig+T5Vg
         9igEZnTYtG4qYMPO/x8DVzEsBbBB3RXmv+a58IX/LnFzICdHuNCrkl/FfEEa8orQY31r
         uVZcHp/+gpOQXj+RKl+SNH9pM2f9q/jjmqPtaGM2VqZQ3cbRt1gImNymhS9I/GU/dxgN
         sN0w==
X-Forwarded-Encrypted: i=1; AJvYcCWLHmUXaCpBrY82SHf4s04oNRGLZ1xJTjehrfnBrQGt7KsO2SqIbVm8CBh/oSiLbUf43I6HxzSfmMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfXNTbgGrbnghcVbNiTOIfiRmlsPvwHC5OzMjCk9pD/TFfgP+A
	ad33thp1itd9bgr+d3n34+Pww1SHnJwQHIivMVKUWhMQGLEBp8H+peGwUk+Tpw==
X-Gm-Gg: ASbGncvvkwKT6xBb+ZQmxadkFuqZ3DWTs0kxKdG4dn30RnJYhWbLJmXhNMPJ9NnyuAG
	0mmvK1Od/7UJfa+UlmRwppNXyPyBODCNRxN6o6J398tbmonpLrOTnQqeHfOgwLWt+RS+XIHQ81X
	bM5EKIcI3PUmPCHeAaByB8zq/xcztT5Z0CiSZ5fBo6Z+FO7eU8N/ahw0pSEL/5hHdhYaILlpWR2
	Ly3IHedmO5U4CwKyD31pTl+/LHca6xpX5DK/6xottNpFjpQQl4=
X-Google-Smtp-Source: AGHT+IHdPLBrBjH2j9xNxvkBEk8sTJPFaZSH3fITF1XDR4oEd4y2HvWLCAiQpsCUn6HcwllWgicMUQ==
X-Received: by 2002:a05:6214:2508:b0:6d3:fa98:cf4a with SMTP id 6a1803df08f44-6d45138e0damr58629156d6.34.1732330148633;
        Fri, 22 Nov 2024 18:49:08 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::7cc6])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451ab576bsm17121256d6.59.2024.11.22.18.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 18:49:08 -0800 (PST)
Date: Fri, 22 Nov 2024 21:49:05 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>,
	"a1134123566@gmail.com" <a1134123566@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Inquiry about the f_tcm: Enhance UASP driver work
Message-ID: <e390b1b7-b79a-46c6-aadf-bf443b87f0f3@rowland.harvard.edu>
References: <20241122022146.ykwhz4byhy645njg@synopsys.com>
 <20241122085755.29cebea1@foxbook>
 <20241123000209.5qowmsx3dxianl64@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241123000209.5qowmsx3dxianl64@synopsys.com>

On Sat, Nov 23, 2024 at 12:02:10AM +0000, Thinh Nguyen wrote:
> On Fri, Nov 22, 2024, Michał Pecio wrote:
> > Hi,
> > 
> > > > I tried to use it on dwc3, though I fix some other problems, the host side xhci
> > > > (ubuntu client) using fio for stress testing, and I encountered the following
> > > > error on host:
> > > > [18836.092159] xhci_hcd 0000:00:0d.0: Transfer error for slot 3 ep 1 on
> > > > endpoint
> > > > [18836.092211] sd 0:0:0:0: [sda] tag#11 data cmplt err -71 uas-tag 1 inflight:
> > > > CMD
> > > > [18836.092213] sd 0:0:0:0: [sda] tag#11 CDB: Write(10) 2a 00 02 5e 31 00 00 01
> > > > 00 00
> > > > .....more and mores....
> > > > [18867.369118] scsi host0: uas_eh_device_reset_handler start [18867.453796] usb
> > > > 2-3.2: reset SuperSpeed USB device number 4 using xhci_hcd
> > > > and the gadget side is keep resetting configfs and printing wait_for_completion
> > > > timeout (since dwc3 have )
> > > > 
> > > > I am not sure whether this is due to the stream exception of dwc3 or some
> > > > logical in f_tcm and target.

Homura Akemi: You can try using usbmon to record the transfers between 
the host and the f_tcm target.  Seeing that data might help explain 
what's going on.

> > > 
> > > The error is -71. This is transaction error (could be a CRC error). It
> > > could be due to the host, device hardware, electrical interference, or
> > > even the cable. No logical issue from software.
> > 
> > A transaction error is a transaction error, but waiting 30 seconds for
> > UAS to reset the device afterwards looks wrong. I seem to recall seeing
> > sporadic transaction errors which triggered the reset instantly.
> 
> That's not what happening. I don't recall the storage class handles
> transaction error as such. It just waits for the scsi command timeout.

For what it's worth, usb-storage handles transaction errors right away, 
without waiting for the SCSI timeout.  It initiates a USB port reset, 
which of course clears out all the messed-up state on both the device 
and the controller.

I don't know about uas, though.

Alan Stern

