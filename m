Return-Path: <linux-usb+bounces-28783-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D46BA9826
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 16:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1313C7A06B5
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 14:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BA63064BB;
	Mon, 29 Sep 2025 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cYZ/n27e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D33772617
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 14:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759155220; cv=none; b=N8LsGcYqxQfu4JLuj+81QGs8P8lbNsT5Jf1hdA0KpSQunFeknXNkWG0oZ0CjkqJlcUkL0JCSiMZHVCR7pWvIqEpqOTrM79IjFJqPrIohQn3Eav5HZy2Kr8LiAG8jzjWBG8jnluco4t/ar6JQhMtLv7EryfvCJkjcUJearb26DEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759155220; c=relaxed/simple;
	bh=ikU4y6IfQaBPnzb0QbjlpTlUMl/75MiANr+2RnkQvHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFPHumcRtXqM6f7YDIfCm+Cet/3JYGxTKw0+BfOQZxItGMKkrAjeNuj59FTwxjBSZExvC8CPRpLoDm+Wyr5OZSPqfHFtcTS/otmt9mpFITVMFHIN21RjpqhSzi24whhRODFkygQeEmg1YjiKflVOSU+0tiyj7MwibGVTNkgh+SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cYZ/n27e; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-856328df6e1so465641185a.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1759155218; x=1759760018; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QIX14KFofoWNgRW8W21KXmFyF1ppXZt83YftOVIbIW4=;
        b=cYZ/n27eeBD4uW7ESt9zc+gKh6MYr5K11sh4Y7I7z+wadWBV7LHCJBMon5FTZc9OLd
         XodJKOR5VlrGxPsyL0av1rYoo6JsoDqu2jm1uiNzBm4NNSp3NEbQpgSpIzwFwloup7uk
         RQrNWk3PDWbu4LaiekVHEbIgCFgqGCzqilsE6vvaY0p4kQ+JcM1JVdLbd6hfsJGgDivA
         aV89DosuWMGM3RqZlC+jiXRApQJPLyELoEDBpc+lZSr0Lkp5xpSJVPraMf0/AphNmuwQ
         svR4/NRwHISOmOVomFLaZJtHST2stsmLdAcpiAB/Wqvza193XEhTzVHRvfvC36PqijAu
         6R8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759155218; x=1759760018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QIX14KFofoWNgRW8W21KXmFyF1ppXZt83YftOVIbIW4=;
        b=rLwckO1IYQtHdkte5q+FxbQUf+F9NT0MMG3lD8cyizkA50KWs/lJIBZk8AS2HVBiuV
         gTQsIyS9o9KIXRSfXj2boOUWUQdDc+r97wyAowEm4P8v2HjPEgF6m7ZBVetYeS/+G57n
         EwNoNdHkW4ToEGiWha6bwZQ1BQJwPal9xkLJn1gI50hzNOXLBh91hrjd++wp6gsEGMSk
         6xzr3cYVbxkpeF9GIb2YJfz153UpvgWeags8ps9Ms0lhK6UsuJfIGDU6p1EHWf5LEEGu
         kCzLw4W7ogZilzc1Nq3xm82RhNko9SEvhbipz8DiJ99SLtvrd/gFAMYeP91+P3AW9tVP
         YcyQ==
X-Gm-Message-State: AOJu0YzGevH0mgL862ntUoSilf7R47Rm6zC7I3DSzNj7jBPzdDV8qNwN
	SeKKxhqtBhvayfFRzVHSEEAx+/C46jjOmGzB6WjrruRRYyUDmU9ziEO4i6/rX9k7gceinOMbXk7
	D5zM=
X-Gm-Gg: ASbGnct3Qa4VStpfnM0FEKZiwva1+G0xdNeEmIWYohdgthVgrKMPGD3zgqti3yUdJWz
	ZVrofaCAb77QR4RwC0cuCVNfEZ3QH2xsP3jgPWeJnf0TA/7KEpSYNRpDjiQwikNoUMhNWBgqp7U
	KHWVnzvtA9JJ/A7eEYqWLFUiIoCZv5xnttjfk2h1roKxxR2AuBC04CDK6eSdwH/kY43DDzo4WIV
	WHC2WPNt9FjBl8LrmGhmXqlPs0nNpDJzscRuIKrY4vmtKz71T0VQJ6zNOjjV5ub0rgYiIEJb5Mu
	UB7yweZltBeFYvXWjg1wnKY6NOpGEyG/wd/ufDQHWGFyzdpb0wZ+5YQxTRzOh8br+55RodjGjFZ
	01lEJvTs1DLm+tYehPylaVCwDZ9zbj7HaELa5nPAlQEobjw==
X-Google-Smtp-Source: AGHT+IFh7TV/iMT1girpIpTh4fWF6qq1jBe7kpdXzTMoOFwCOB/h59AhgcbB0k5V2nGucBoA29Olxw==
X-Received: by 2002:a05:620a:29c5:b0:864:4cb1:506e with SMTP id af79cd13be357-8644cb1512bmr1077508885a.35.1759155217794;
        Mon, 29 Sep 2025 07:13:37 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c2737848csm840480185a.3.2025.09.29.07.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 07:13:37 -0700 (PDT)
Date: Mon, 29 Sep 2025 10:13:35 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Han Boetes <han@boetes.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: As per request
Message-ID: <e31f129f-1119-4a22-a71b-d0d559ac2a07@rowland.harvard.edu>
References: <7c7d0b10-9969-45e8-9440-563960645c36@boetes.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c7d0b10-9969-45e8-9440-563960645c36@boetes.org>

On Sun, Sep 28, 2025 at 06:22:54PM +0200, Han Boetes wrote:
> [Sep29 00:57] [Mon Sep 29 00:57:28 2025] usb 1-2: new high-speed USB device
> number 5 using xhci_hcd
> [  +0.127881] [Mon Sep 29 00:57:28 2025] usb 1-2: New USB device found,
> idVendor=0603, idProduct=8611, bcdDevice= 1.00
> [  +0.000018] [Mon Sep 29 00:57:28 2025] usb 1-2: New USB device strings:
> Mfr=1, Product=2, SerialNumber=3
> [  +0.000005] [Mon Sep 29 00:57:28 2025] usb 1-2: Product: Fly12 Sport
> [  +0.000004] [Mon Sep 29 00:57:28 2025] usb 1-2: Manufacturer: Cycliq
> [  +0.000004] [Mon Sep 29 00:57:28 2025] usb 1-2: SerialNumber:
> 966110000000100
> [  +0.645032] [Mon Sep 29 00:57:29 2025] usb-storage 1-2:1.0: USB Mass
> Storage device detected
> [  +0.000406] [Mon Sep 29 00:57:29 2025] usb-storage 1-2:1.0: Quirks match
> for vid 0603 pid 8611: 4000
> [  +0.000007] [Mon Sep 29 00:57:29 2025] usb-storage 1-2:1.0: This device
> (0603,8611,0100 S 06 P 50) has unneeded SubClass and Protocol entries in
> unusual_devs.h (kernel 6.17.0-0.rc7.56.fc43.x86_64)
>                               Please send a copy of this message to
> <linux-usb@vger.kernel.org> and <usb-storage@lists.one-eyed-alien.net>
> [  +0.000129] [Mon Sep 29 00:57:29 2025] scsi host0: usb-storage 1-2:1.0
> [  +0.000310] [Mon Sep 29 00:57:29 2025] usbcore: registered new interface
> driver usb-storage
> [  +0.007605] [Mon Sep 29 00:57:29 2025] usbcore: registered new interface
> driver uas

Thank you for sending this information.  Just for the sake of thoroughness, 
could you please also send the output from "lsusb -v -d0603:8611"?

Alan Stern

