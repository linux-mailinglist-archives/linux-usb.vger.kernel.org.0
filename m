Return-Path: <linux-usb+bounces-30227-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C65DEC437E1
	for <lists+linux-usb@lfdr.de>; Sun, 09 Nov 2025 04:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECE4B3B2C24
	for <lists+linux-usb@lfdr.de>; Sun,  9 Nov 2025 03:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BBA420013A;
	Sun,  9 Nov 2025 03:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Qtsnr0Fg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC88199939
	for <linux-usb@vger.kernel.org>; Sun,  9 Nov 2025 03:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762658552; cv=none; b=NIrrLzNisekdBxAZ0sWsn3DlyedVrxe+JPUc89Us8tXSprxV7ydqNssvW2VpeoCsMwG49YTWM63HrB5MD72eDaNd9ZlCmYOhaPvS7V5q64L9AtlEeM6sgT4m7s1R6em7qjbYiWLvPIMtlsGQYLegdHc0PzX8Unn34a3tsvM9SFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762658552; c=relaxed/simple;
	bh=3EmPAJIBkghi884jANYlC0hB0hcjLSSglw3VMgChI3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBYBDZs74l1odwKy/m66MMp7HWDZahjXdEjQrMWyhACpt8Ilg8UCAQu4uVyaHkXODjaHEzN32zMkg1UQGzRYkpN6fevwQosF6QwpCG4+jaTVSl1uCSGvEMQPEtDBkfu57eKwVxZv9YffzFi9vmnhJib7KMrZnVIbMtEXIDQh0Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Qtsnr0Fg; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b1b8264c86so200152585a.1
        for <linux-usb@vger.kernel.org>; Sat, 08 Nov 2025 19:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762658549; x=1763263349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8cLuHhaL3JL1JYJOqeWR2ULSMS5K0VBLMyJHCPLGsTk=;
        b=Qtsnr0Fg7pauw61be2foa5s+/Ae9hA6vJ7dXpnnnLRani8n3SAoRR4eiLLSLO98iPk
         s/P07nxUZo/PRY9Hj5iylVhlsaZC6SBweomx+3aiwcu8X0SJce2rAI6pPWMXAmNHOxEh
         oUOnuAdM+5jfuDc14DkDKVcLgbttUxnEXyx/7Iey9ka8lov/zZLKvqkuLrLjLHcowlyG
         eZbfqPuZFG8ssZZC9kJau27MAfOh0KVc8r9jebG+l3D2KGFd8cSPzZWCAQwf4UeAnZMh
         XaNsaaJ4fH2zT0GsJzkMPny1sUk9YT4nvoWOw4M1W6SK7iwvxgds0WUjnm4CbFruW4xe
         uIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762658549; x=1763263349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cLuHhaL3JL1JYJOqeWR2ULSMS5K0VBLMyJHCPLGsTk=;
        b=b81AybpGZ8oRif86bm6LhCiYTEn4K39HsYRLvaIdO6JJ0dwVL8Qd99p6GOCBw5hRt8
         ZAMIIZD/6ZyLsaISeT1ATLorkX8szD4Nz+nAIUdD4qM0mH9GtMPSapHlBUUcLbcEUxtu
         ROGF2L5XCwtWQuT4BNR85/Co9Rxh1NW62zg/xuvP8HN8vqrhoPq1L919I60dMF+CVykr
         aa8Y+cPIObHHbrZSOWvrdHZ0aDjf3nmYPsoxEbbHpEuo5AIMlB8D+dNMte//3bodx5il
         DExWZOh+AnTEPgI9BOlaKb1PwS+zwa4f574lnQdi8hGSGiVbpUhySauSu+q+jN/oH+tq
         SuOA==
X-Forwarded-Encrypted: i=1; AJvYcCV9wAvs5oiWUbTJZ6pEtWECmcGYzqOBOurZWt4FHitxuiB4owNGg9C7zgSLt5Ic4QUnNXhIN/1iXsA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/73/bafZ5vybGmH1GHNgtWOeR/kds1p1tuhILhmh6Y/JmWqsE
	5sUPX/IofMIRc+CLQXWA2uSkBSEAbgXcT0asj+YeN/u9E+zvOSvZBmjhT2tAbsx9Xg==
X-Gm-Gg: ASbGncuXt8jtFv5sny+cX6jlSjsDtV/WzCp4ifp8aY8blUYZ3AmD0ztuZgd1iz13E1H
	arPT/OoEjdnFtjJe4lcsgd7bXS5o/ZewjKwApMrV7fTTHQWrX63mbK9f1otO08chfNP6myAr5wB
	UsAJfoa81hH8bRAwVeTNeKNWgWZt848BG8PRsC1TaQnqJvSJgpH4yCGCjPz2qf86GovGyCL0Lkv
	v/AjG4kLRqnRjEgA4V8Q/7f0ZWmAhI/JXaXTJCNGyn+JqKrqFBcNPqDsH/0DllPjg+YXJ3Vczzs
	4Yw0fADGXuEQJrRvGCkYP1IDltENSTi3SuCVFk8mTr5UuIzrCqAJ2hznZQ0RoHdfc321l1lDeSY
	4vzapTwTM/Oq6Dq0G2xJDsY3osGU7K+ijq4Svz1dkAqDWtZXAvdAn6CPlP1hRYR4vVoLWc70T4O
	hwmA==
X-Google-Smtp-Source: AGHT+IESs62WjYcVuQErurtuWMXrzAAH5ZJ5bpp8mg4PvP8T39E7vELINu/vugLftIyiCFp5DvXkTA==
X-Received: by 2002:a05:620a:4404:b0:8a4:107a:6770 with SMTP id af79cd13be357-8b257f6a9dfmr513959585a.69.1762658549357;
        Sat, 08 Nov 2025 19:22:29 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::db9a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b23561a6d3sm741109585a.26.2025.11.08.19.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 19:22:28 -0800 (PST)
Date: Sat, 8 Nov 2025 22:22:24 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: The-Luga <lugathe2@gmail.com>
Cc: Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <c5c863f0-1c68-4d49-ba9b-b55c0f71d30c@rowland.harvard.edu>
References: <CALvgqEAq8ZWgG4Dyg_oL7_+nUDy+LUoTXi+-6aceO-AKtBS3Mg@mail.gmail.com>
 <3eb2564d-5008-434e-9698-99b0cbe4d1cc@cosmicgizmosystems.com>
 <CALvgqECkMdntW2He8C7EcvOtCL-PpiXM9xNXWHzGtgimDxezHA@mail.gmail.com>
 <d7e888a6-6a65-40c1-84af-058b97ca0178@rowland.harvard.edu>
 <CALvgqED=rBkNYGkFdOXjUi1g_vbLac5Z38Z9xCRfpF-Vmy4Mww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvgqED=rBkNYGkFdOXjUi1g_vbLac5Z38Z9xCRfpF-Vmy4Mww@mail.gmail.com>

On Sat, Nov 08, 2025 at 09:15:07PM -0300, The-Luga wrote:
> Here are the steps I followed to gather this data:
> 
> 1. I ran my VM, with the speaker on the host.
> 2. I ran USBPcap on the guest.
> 3. I ran usbmon on the host.
> 4. I passed the speaker through to the guest.
> 5. I increased the brightness by 3 levels.
> 6. I decreased the brightness by 3 levels.
> 7. The speaker did not reboot.
> 8. I stopped the USBPcap and usbmon logs.
> 
> Next, with the QR30 already connected to the guest, I ran USBPcap
> again and adjusted the brightness up 3 times and down 3 times.

While I see a bunch of interrupt transfers sending HID data from the 
speaker to the computer, I don't see anything in any of the three 
capture files indicating that the computer is telling the speaker to 
change its brightness.

> I hope this helps.

I'm not sure that it does.  What would really help would be to have logs 
containing absolutely nothing but the computer telling the speaker to 
change its brightness (and the resulting disconnection and reconnection 
of the speaker, if they occur).

For example, to see what happens when you try to change the brightness
under Linux, do this:

	Plug the speaker into the computer.

	Try to make sure, as far as you can, that no program
	is sending audio output to the speaker.

	Start usbmon.

	Change the brightness, just one level, and wait for the
	speaker to disconnect & reconnect.  (If this requires running
	a program to control the speaker, start it up _before_ starting
	usbmon.)

	Stop usbmon.

For a similar experiment using the Windows driver, do this:

	Plug the speaker into the computer.

	Start up the guest OS and pass the speaker through to it.

	Try to make sure, as far as you can, that no program on either
	the host or the guest is sending audio output to the speaker.

	Start USBPcap on the guest (and usbmon on the host, if you 
	want).

	Change the brightness, just one level.  (Again, if this requires
	a program to control the speaker, start the program before 
	starting the packet capture.)

	Stop USBPcap (and usbmon).

Alan Stern

