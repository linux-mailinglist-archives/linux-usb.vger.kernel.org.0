Return-Path: <linux-usb+bounces-30241-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 938C4C44C3D
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 03:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 398E5188CA42
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 02:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A700225761;
	Mon, 10 Nov 2025 02:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="jJPHt+UR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8269321B9C0
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 02:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762741222; cv=none; b=BEtjJ/HiR/OmU8yjc1FidClC1vl2dz4H1aZNXdaFupyOz5JDBAR2h1Id+k2VKIVuZGHU3puWbo3tbJF/Ol3qkFO/+xkYeb70ENNo548rQdm5nVqrY7cmz5L/PRO6u7f8IS5SOSCRXUvJOxWnu25/mQ5BRI4I1eJxB9vQqiLHEoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762741222; c=relaxed/simple;
	bh=7Pja3650GiAPvVsUOYd4tHJmk2Ih7XhAG5SdtB1zeQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlZusAsuNMrdLga00JDz5HNwZhZ2BJEJWkqLw4bJfKIImxFN6ikcDNM5aWyLgRePIO/FsBEnciUzD6EI0Bq08wJGS7W/CBnVVW848QRg1ijfSZFirRTpoOtGz3vr5RGs88K5eGNrzJ3WpmXCGxSBqIR2PXrxjcg/qFgjIkf5Xgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=jJPHt+UR; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4edb6e678ddso9917911cf.2
        for <linux-usb@vger.kernel.org>; Sun, 09 Nov 2025 18:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762741219; x=1763346019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DMt06zAomplKqdeZIvWBTvQ6NVxA37OWYo/eottY/jI=;
        b=jJPHt+URh/OA2rOV1qaKccqrXFBfSUMcrufGFeLoLMWiGpy/ugh6MxWV/GYeSJqSMf
         PqF9rMpOuht2bg+aif/fEj49Uxe15Q+2w+n9QH7ZYxxhbseBcYaObOBi/N/Gt5P85hGX
         JXC7KWhZ8h76N4xv5rfEuy/HhjrM6q/gd8YUnMTISOZMCpI9L61mSh3PaxbSA5KmGuqt
         ed26xlJhlTAyt276APHdhBfJUc0+CcVN3/I6ZblqvcsTet88UxcuPHEC+/n1JjRTcz4g
         m8vd3bJWZIMh90vliLMVFn6gfrNZ3xVJOUBlr/IaHFBpc9XiKagJ3BNENdKsJ8cc3X0E
         ljdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762741219; x=1763346019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMt06zAomplKqdeZIvWBTvQ6NVxA37OWYo/eottY/jI=;
        b=iDT0ke16IXIVMJX50ywz1WxkeSIkM4+fjTONLatzAXW4Qyvwp4k2UrXV7tC6vFRNZo
         cDqVqikaF7qdt7It6dEJS351tJw4TbEkJjImqa0yzOL6hXYujfyrxBWZumdUddF+V802
         7YaoEsaEGzOZmqe2UVJqr4h7m74YFqabxElxhEcoBye811LqZ/czeYTX8msVvQe+S/SB
         Li7gHDRfs3bg6k3Ou6CgQ/kzs5KAHQ0UHxdJoHrspGSYLeyfzizWNMyA9IGB03X0avLK
         WBPpAOr1uXm3SXh2/uOMA7/hCUX+kZNUxeTac3cLvg9RqE0rwqy43XrXv6hl7vwAfUcj
         GTWA==
X-Forwarded-Encrypted: i=1; AJvYcCUFlJzTzdoiDkbndrm2pEZahwvUjDlvrVVQQMtcTP+4Fy8gali3J3qVQvYraA37QhCrR2LGmUaCpEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzslz0Qyrrd5icx5mkVnG0U+jeQIRYwSSdphqlOirzjWqKtI343
	+Q3oEKQaYGgwMFwN5axei+kVYjuUBCvX68xPUo4LdvjJ7R4M/m+nQb/HHGxnS/7r/A==
X-Gm-Gg: ASbGncu9NCS3lBiHJTzKakbjkwvL9i98punpz1+/fwMLcfHzkeIHiile1S0jYtg4Zk5
	ZAHUEjEd8SCERxTvVx39ruOMq65+8coGKME2kL/H122DNbXbSBXEmnhf1A82Of2mXDr0Wd1Vrvl
	idqpjSP7Jwxj7mwzjzNQpBW28a9txedEjcoP/FngCegaMGPSWkIl36GCHFuIK6HB5oPSLkiZAMn
	vMVaby8xyAwU8ywqSERC2WdHgr7E9asJWOyyBATznrpRjVoN3/JzX/qeDyq8USd9tFfrHwDvGZR
	0US61GEh3WM4tQZS3WOVVVOOyNWU3YjCOok5g7XYdraZjHksiMqGFMeaYoNTd++uLRV3Q9AIZ9G
	gGsw5/Qgao3XmS36O1rbKSJ9r3glvFVab1gV3HZPObY0t41Aohk5AFx3zSAB2WPuqnvknGCwJmb
	UK4p5yrCfz/s28Xbn7G0pcxxU=
X-Google-Smtp-Source: AGHT+IERUJ5jFsOoCQARyH376JfWdQ9MhJaP9u4eNYQzRoidsnyeEWkydlLvDYSob3XPrfK34N5a4Q==
X-Received: by 2002:a05:622a:1212:b0:4eb:9cf0:60a5 with SMTP id d75a77b69052e-4eda4ead572mr88572781cf.21.1762741219315;
        Sun, 09 Nov 2025 18:20:19 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::db9a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8823896a091sm44351606d6.19.2025.11.09.18.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 18:20:18 -0800 (PST)
Date: Sun, 9 Nov 2025 21:20:15 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: The-Luga <lugathe2@gmail.com>, Michal Pecio <michal.pecio@gmail.com>,
	Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
References: <CALvgqED=rBkNYGkFdOXjUi1g_vbLac5Z38Z9xCRfpF-Vmy4Mww@mail.gmail.com>
 <c5c863f0-1c68-4d49-ba9b-b55c0f71d30c@rowland.harvard.edu>
 <CALvgqEAo8-MhE3ievoDkq4AOxRZ2E52kcko+GxYyf+WZE2H0=g@mail.gmail.com>
 <20251109092450.693bcbe5.michal.pecio@gmail.com>
 <CALvgqEC1EpJy58LhppgLYkCyaZL+qv34b8PmvTvJV8DYfp=gzA@mail.gmail.com>
 <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
 <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>

On Sun, Nov 09, 2025 at 02:49:23PM -0800, Terry Junge wrote:
> 
> 
> On 11/9/2025 2:17 PM, The-Luga wrote:
> >> But never mind that.  Try using the usbhid-dump program instead of
> >> lsusb.  usbhid-dump does not require you to unbind anything or change
> >> bConfigurationValue, so it's easier to use anyway.
> > 
> >> sudo usbhid-dump -d 2d99:a101
> > 003:002:003:DESCRIPTOR         1762723663.045959
> > 06 13 FF 09 01 A1 01 15 00 26 FF 00 85 06 09 00
> > 75 08 95 3D 91 02 85 07 09 00 75 08 95 3D 81 02
> > C0 06 14 FF 09 01 A1 01 15 00 26 FF 00 85 2E 09
> > 00 75 08 95 3F 91 02 85 2F 09 00 75 08 95 3F 81
> > 02 C0
> 
> Second HID Interface (Interface 3)
> 
> 06 13 ff Vendor Page ff13
> 09 01    Usage 1
> a1 01    Application Collection
> 15 00    Logical Min 0
> 26 ff 00 Logical Max 255
> 85 06    Report ID 6
> 09 00    Usage 0
> 75 08    Report Size 8
> 95 3d    Report Count 61
> 91 02    Output
> 85 07    Report ID 7
> 09 00    Usage 0
> 75 08    Report Size 8
> 95 3d    Report Count 61
> 81 02    Input
> c0       End Collection
> 06 14 ff Vendor Page ff14
> 09 01    Usage 1
> a1 01    Application Collection
> 15 00    Logical Min 0
> 26 ff 00 Logical Max 255
> 85 2e    Report Id 2E
> 09 00    Usage 0
> 75 08    Report Size 8
> 95 3f    Report Count 63
> 91 02    Output
> 85 2f    Report Id 2F
> 09 00    Usage 0
> 75 08    Report Size 8
> 95 3f    Report Count 63
> 81 02    Input
> c0       End Collection
> 
> Two collections, both vendor unique.
> Basically HID 'pipes' to transport vendor unique data.
> We have only seen traces with input report ID 2F so far.
> If we could get traces of output report ID 2E from Windows running the 
> vendor's software (TempoHub) it might help.
> 
> I wonder if suspend/resume would be a problem. Maybe the device crashes 
> when it attempts to resume?
> Windows will not suspend this device because it has a Consumer Control
> application collection.
> 
> Is there a USB quirk to stop the kernel from suspending the device?

There is.  More simply, The-Luga can do:

	echo on >/sys/bus/usb/devices/3-2/power/control

to prevent the device from going into runtime suspend.

However, I doubt that suspend/resume is the problem because the 
disconnects occur whenever the brightness knob is moved, not at times 
when the system might decide to suspend the device.

Also, I suspect that the computer doesn't really have to do anything 
with the HID report data from interface 3, just accept it.  At least, 
that's what the packet capture from the Windows guest seemed to show.  
By contrast, the usbmon trace under Linux showed no traffic on that 
endpoint.  Without being able to send the data, the speaker's firmware 
could just overflow an internal buffer and crash, who knows?

It would be nice to get some suggestions from someone who is familiar 
with the input subsystem.  Dmitry, can you offer anything?  For example, 
is there a program the user can run to collect the report data that 
currently isn't being requested?

Alan Stern

