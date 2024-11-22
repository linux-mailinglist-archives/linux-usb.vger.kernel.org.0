Return-Path: <linux-usb+bounces-17794-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AA69D5A80
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2024 08:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE538B22DE1
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2024 07:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D7717AE00;
	Fri, 22 Nov 2024 07:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSKD1AA3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027FC166F26
	for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2024 07:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732262285; cv=none; b=e48PDCd678XV2tVQUhUgSWl4v2syFnMJvtjLsrm/rSjJw6CxHlCjZJvvitfp9VfjYqSGS5Mcc2ibc7zcOkhmx9qUXRfABP/peLe8sOFp9W+xQ5xGHjZtpCisP/u5+3iy5XqoEL8fGS2Bqz+rxcj82n1sj8cGNE/ud4+hLu3DGqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732262285; c=relaxed/simple;
	bh=bpet2YbHRvLb0ICn/xOhBQ3+juxoHm5UDUsS6ymr7yo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=WHQgm8Ibp9PwOpTbnxMt2VLHy7B1cQHWC7EhC5uCNk88SVhlr6+vyxdlwE14+V/ZMKYWOaw+NHf2OoYrZdlg+9uO5beXrpjsWCKrylUpfWJL81M+IojE+ZQQY69Aoek3e/8FqRtAJ+8CYlhM4Q9XiEkRd8B9uVbLc9Jv/x9j6kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSKD1AA3; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53d9ff8ef3aso2178262e87.1
        for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 23:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732262282; x=1732867082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3mDMJmx+QqpkzA6H2Mx2UH+VIsG7XLgw6igOE5hW6b4=;
        b=ZSKD1AA3+TMpmg4fNxHBDr3XMlkyhbp66AEyxq3HouabLUcxm+pgCaY3ShK9QtMfwh
         wsUstMTU0BVMmv0OdM8Cjl8qRONaPg1oVNCskCmZOAmjP3rYpa1S0SOubLqdLUe7yL2s
         ZSUHsJ7Hn7YifDVqstmJl1PZy3YsZ5PFWsCDzfuET6WbhypkR5IV2H4ewnDT6K+1urmV
         No9YReAFGSSdkNd9wk5hmdqPHpZjsTsqRZDbFSFSfN6i4pa6Y0gGdRcco8/vKJNVWaAj
         DFAIcBmIZTLym+mVBwKHXvHNTtMpfVLb45G0idQy8/Kj3ZIkWwFICgvl4QF22zqGUcYM
         I9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732262282; x=1732867082;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mDMJmx+QqpkzA6H2Mx2UH+VIsG7XLgw6igOE5hW6b4=;
        b=I5oRzIoxew6P+s7qmp3Y4DBpWVyM3L9ra9Vnyp5+Dx0UdiNw0OmBVUlSj00q75Wmzi
         cnYRzpmMv8z/qgG4hNz0izym/q8oiDoUCBS1AVpg7ZuU4RBuRC6KFNkdZqcuz24PLLcV
         IyvsvD0bHZ/WsiI8zZe/PSzQEu6DxOQouxyYBpzS5hb12hCt4lAbMXenbSy32gP5SKsB
         hPnGfwhP5lXQpddmiK2x7ynjkQfaxX7K/9uuCj5BCUHhuR7MckURX4158swipSfk948g
         s/3CKgJBin5GIOAtRAYYsjyaZzWqJNaBmAHF/8/qPRQspFt1ILkDYTVuzlKrX59UEDGc
         qR8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnRtI0Pjzh6zBfjn65x6OHNjVxPE3XdHFuPigNma26x+wzjrxs5GlMiaHZJDYVl4xBroO6gy+x6LI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGrrf7Yc7i35TnGAq3ujHoPFqLdINA3+RAeoL+wowo4mpIAaHp
	uNWn/6jDtB/fwfGn1NlEOe4EN+BY2HCRpA0lrZcilQFZw94SR2WUL0ZmsA==
X-Gm-Gg: ASbGncuf1eKFaSxlDITf3cbm2ZMF7M5AcQ1D8sEaynjCd6ve05QKaWznEM8oW1CZujw
	AjSlgA6SBAVO6XePbnCaga+eYqw8za7zTrWgpvQS0siCfekNjqR/iGWpFhsSol9IdjugxgB7d2j
	oIak7Un3bAOgdQ+CkLd+bUyaJwsAQVdWr+Zsa/+pHtOOU48UeRX8KqWsleGLUZN/wPm5aGhl1b5
	uggDfHCbroIp8rjVEHadctn/z7cKemhDdquQIYonFjbQykAJBp2BFWuHw==
X-Google-Smtp-Source: AGHT+IGViCsDO1aPR9ZvH4b515ULMIZW8IhnTmINXbhDKqUQh1goOclnT1tkUEywa3irR2pDoqmqVw==
X-Received: by 2002:a05:6512:1113:b0:53d:d60b:8380 with SMTP id 2adb3069b0e04-53dd60b83a9mr271865e87.22.1732262281826;
        Thu, 21 Nov 2024 23:58:01 -0800 (PST)
Received: from foxbook (bfd3.neoplus.adsl.tpnet.pl. [83.28.41.3])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2497e60sm273748e87.256.2024.11.21.23.57.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 21 Nov 2024 23:58:00 -0800 (PST)
Date: Fri, 22 Nov 2024 08:57:55 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: thinh.nguyen@synopsys.com
Cc: a1134123566@gmail.com, linux-usb@vger.kernel.org
Subject: Re: Inquiry about the f_tcm: Enhance UASP driver work
Message-ID: <20241122085755.29cebea1@foxbook>
In-Reply-To: <20241122022146.ykwhz4byhy645njg@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

> > I tried to use it on dwc3, though I fix some other problems, the host side xhci
> > (ubuntu client) using fio for stress testing, and I encountered the following
> > error on host:
> > [18836.092159] xhci_hcd 0000:00:0d.0: Transfer error for slot 3 ep 1 on
> > endpoint
> > [18836.092211] sd 0:0:0:0: [sda] tag#11 data cmplt err -71 uas-tag 1 inflight:
> > CMD
> > [18836.092213] sd 0:0:0:0: [sda] tag#11 CDB: Write(10) 2a 00 02 5e 31 00 00 01
> > 00 00
> > .....more and mores....
> > [18867.369118] scsi host0: uas_eh_device_reset_handler start [18867.453796] usb
> > 2-3.2: reset SuperSpeed USB device number 4 using xhci_hcd
> > and the gadget side is keep resetting configfs and printing wait_for_completion
> > timeout (since dwc3 have )
> > 
> > I am not sure whether this is due to the stream exception of dwc3 or some
> > logical in f_tcm and target.
> 
> The error is -71. This is transaction error (could be a CRC error). It
> could be due to the host, device hardware, electrical interference, or
> even the cable. No logical issue from software.

A transaction error is a transaction error, but waiting 30 seconds for
UAS to reset the device afterwards looks wrong. I seem to recall seeing
sporadic transaction errors which triggered the reset instantly.

Long delays I have seen mainly on some unfortunate pairings of HC and
device (HW bugs?) which trigger unusual error conditions poorly handled
by xhci_hcd. Try with dynamic debug on handle_transferless_tx_event(),
if your kernel is recent enough for that to be a separate function.

In those cases, UAS seems to wait for other streams to complete before
resetting, but the whole endpoint is stopped and nothing moves forward.
At least that's the impression I got, I was looking at other things.

If you aren't running into this case, I would say something may be wrong
with UAS implementation on one or the other side.

It looks like the transaction error was delivered to UAS by means of
-EPROTO status so xhci_hcd has done its job at least for this one URB.
No idea what happened later and why the device wasn't reset promptly.

Regards,
Michal

