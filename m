Return-Path: <linux-usb+bounces-30235-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1503AC446CC
	for <lists+linux-usb@lfdr.de>; Sun, 09 Nov 2025 21:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C182A3AE07E
	for <lists+linux-usb@lfdr.de>; Sun,  9 Nov 2025 20:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD4019C556;
	Sun,  9 Nov 2025 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="j5rEQe4G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563F71BCA1C
	for <linux-usb@vger.kernel.org>; Sun,  9 Nov 2025 20:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762720252; cv=none; b=llP8SvouL97m41b2Of6GpdonGn02a3bNO67eJqTiYw8V3wJgdcjIsmGg+/uO2r5hyBicAnZ48QR20Yc0PNz6c5RlImOWO/HwRFm/vPGN/1J2SJKi6asNnD2bGrhHBhxDJ/jhQRLHo1voRpJtNPCGDmY6shjK/4plc+hmBsLP1fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762720252; c=relaxed/simple;
	bh=Fon7bVBHqCWs7RZgnZ1+1vai0j+ZDPjfvC0UsNzMFyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsZpjHqbVYIZQ0srv/a1nrVUnhkV9zkd8ym/xH8yIxMzw9wWtt74xxm6JWHG0ZUtwNXv2c2evcGAKbDHe1ruKayJpVGpbW7EK1UBzMSbbxNIZWyRmYcDfH5AJIYMqbVZk9Dj/6etBIu3uMygpiBPFKwmIXGvo2AV+jq2ud8QV+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=j5rEQe4G; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8824ce98111so4879536d6.0
        for <linux-usb@vger.kernel.org>; Sun, 09 Nov 2025 12:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762720250; x=1763325050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T+zoPi7ReVo4yKaMu58q1KOxz/re+Q4m5E7lC8bmcxI=;
        b=j5rEQe4GcgXHW2Z+Ys9MM3TW3sOCHRDF+7byq+HVppjYW3WKJoGL8yFDvhO8N1d8KE
         eI0tzspCNFt5NXJOH/dqQwqi5ZYu+SUPgoaMUmXc+YvSga/mrV8x3nw/vqJs+Zibt+XG
         WXF9aJf7MSLPAn46IaYHxERA0Z5JvfLXaJoDSJtzIyDg521cJaqqr+FjaYBzhrWKRDJG
         vly81TlwvRmxsrCRtCXJSGAlhYHQOP+KqkcdFxsGnnOrjby/TdHTxxSeYtG0Um9VJLOX
         xtZpbKqvGgOZ42IB2LIZIYxw0jf6rWHom/+zXxv7Nl5Mp7/fmPmSKqu5e7rmtHsex7hW
         nWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762720250; x=1763325050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+zoPi7ReVo4yKaMu58q1KOxz/re+Q4m5E7lC8bmcxI=;
        b=DcLHcm835IFhfYpc4CU18MWmbarzkdeP+T1bwQU+OATuxkC/urXm2ISNS8V1ygfpPW
         dYwFMU+Bx01sFdbtQG3r9eTDIokFnul1L1lalyRa37PUw8rg/YK0MAWW1/xA9HIw5/Lo
         W737+sUVxnOpLJUKjJz9HiyHRrHixspeeFj094zPXOinJwdwveI0wYSFWNZsR7Ly6aYX
         9ob9ObBB58tXWEki9Nv01xFftS5uFb47fOcrLC1v4IzgFz7wSg1/MsgJV4ccjATHYtWw
         j3o1XSgP7CghJPtkKhXvW9mrOJ4yIT2zhMmmvVDcIHc2uLoLKKPyHo+sZJdJq3n/s3UE
         RC2w==
X-Forwarded-Encrypted: i=1; AJvYcCWuGRh0X/mGSnFxjCCrU6QGzZOHJtPXZyLS1BMBm8JanQkCS5bdsrSH3Z6jA1DraYnkltv37fXRf4M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz60fMWhWz+1MlnHX4DiK7gbQw1TdooQJk442/Rbr1z3lR/Vkn
	OFlxB7U5llEMiUjsB6ucYmFAs4J+Rx04fX1+cq8HHEsWu1oUHuiOOwDmqel95MU63A==
X-Gm-Gg: ASbGncvqXaUxxFxfIdWXF0HqXrMKvPIG88yJlRJmS+Errwkq81ATX4ioGrLQ9Il8xJ8
	SDY5ESFJYBAWOLjT8mS3YqGFbb5Nt695rIy/UgAwqFCUYqOGW7jWDpfoMFhJk27bwGyn7K/likt
	WvlYFx2uGmkbNB6mH/GBIpA0I02afnv8pKgS6roxcqDS6eYztE0QOggE/UUW4WiQeoppDmj+jx0
	imdwk2ULnl6koImY0DSYwFIHat1P113n8LZ3M+UIq2cNX2dZ832dvVANvB0OFDkuPXndPW0E9vm
	ZVE1lfrDJeD+WFKAa3vsRuLDrkn5AtBMJgpFA2+PaGE1sfXcfYkus0DOtF2WUSoLWBMa7j41iib
	3iG2jCS9E6niAmuBQ0RvZaeiAz7T6eooQbX0YFSL67xzQQ060y8TRS635HN+mMvc/cPuERjP13D
	NGjQ==
X-Google-Smtp-Source: AGHT+IHHifTVv9Ze79r9HQWDPss+Dk+gNK4gj+p2SjnA94jCI+5ReaBS6mbIyqbtvcOiDvcGREn9xw==
X-Received: by 2002:ad4:5761:0:b0:880:46a7:b1c3 with SMTP id 6a1803df08f44-88238622d96mr90879136d6.28.1762720250249;
        Sun, 09 Nov 2025 12:30:50 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::db9a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8823892b84bsm38367086d6.10.2025.11.09.12.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 12:30:49 -0800 (PST)
Date: Sun, 9 Nov 2025 15:30:46 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: The-Luga <lugathe2@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
References: <3eb2564d-5008-434e-9698-99b0cbe4d1cc@cosmicgizmosystems.com>
 <CALvgqECkMdntW2He8C7EcvOtCL-PpiXM9xNXWHzGtgimDxezHA@mail.gmail.com>
 <d7e888a6-6a65-40c1-84af-058b97ca0178@rowland.harvard.edu>
 <CALvgqED=rBkNYGkFdOXjUi1g_vbLac5Z38Z9xCRfpF-Vmy4Mww@mail.gmail.com>
 <c5c863f0-1c68-4d49-ba9b-b55c0f71d30c@rowland.harvard.edu>
 <CALvgqEAo8-MhE3ievoDkq4AOxRZ2E52kcko+GxYyf+WZE2H0=g@mail.gmail.com>
 <20251109092450.693bcbe5.michal.pecio@gmail.com>
 <CALvgqEC1EpJy58LhppgLYkCyaZL+qv34b8PmvTvJV8DYfp=gzA@mail.gmail.com>
 <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>

On Sun, Nov 09, 2025 at 01:44:31PM -0300, The-Luga wrote:
> Sure!

> >echo 0 | sudo tee /sys/bus/usb/devices/3-2/bConfigurationValue
> 0
> ```
> Here the device is disconnected (unconfigured but still physically on
> the usb port).
> 
> >cat /sys/bus/usb/devices/3-2/bConfigurationValue
> 
> has no output.

As it should.

> ```
> >sudo lsusb -v -d 2d99:a101
...
> >     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        3
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass         3 Human Interface Device
>       bInterfaceSubClass      0 [unknown]
>       bInterfaceProtocol      0
>       iInterface              0
>         HID Device Descriptor:
>           bLength                 9
>           bDescriptorType        33
>           bcdHID               2.01
>           bCountryCode            0 Not supported
>           bNumDescriptors         1
>           bDescriptorType        34 Report
>           wDescriptorLength      66
>           Report Descriptors:
>             ** UNAVAILABLE **
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x84  EP 4 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x04  EP 4 OUT
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               1
> Device Status:     0x0000
>   (Bus Powered)
> ```
> It seems that the output of lsusb has not changed.

My mistake.  Unconfiguring the device prevents lsusb from accessing the 
report descriptor.  What you really need to do is unbind the interface 
first.

But never mind that.  Try using the usbhid-dump program instead of 
lsusb.  usbhid-dump does not require you to unbind anything or change 
bConfigurationValue, so it's easier to use anyway.

Alan Stern

