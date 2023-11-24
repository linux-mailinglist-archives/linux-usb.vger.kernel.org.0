Return-Path: <linux-usb+bounces-3283-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5324F7F72FC
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 12:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBC47B213F5
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 11:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FBF1EB4A;
	Fri, 24 Nov 2023 11:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sl/UcsyD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192641CABB;
	Fri, 24 Nov 2023 11:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D84C433C8;
	Fri, 24 Nov 2023 11:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700826213;
	bh=ERXxNMCtFjFijTwZokBWufbjcoRPAH0FiOFtD+UxMl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sl/UcsyDG/GK+O/G6AYY3Qi4SlkkBzn7IBchA97Y0mfHNE151dozPr53KJdqzNfd2
	 QnAxu+OUZ4FdMSCnelgIViNADY+rpAGYT535cbI+y9UI3oqlFjrzga9OOAYU6iGalc
	 mLMC9HmkkjKvIpt/NKYbJAjM2Wyq8ZspkfB5ZO+Q=
Date: Fri, 24 Nov 2023 11:43:32 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	stable@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Petr Tesarik <petr@tesarici.cz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [REGRESSION] USB ports do not work after suspend/resume cycle
 with v6.6.2
Message-ID: <2023112421-brisket-starless-c20d@gregkh>
References: <5993222.lOV4Wx5bFT@natalenko.name>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5993222.lOV4Wx5bFT@natalenko.name>

On Thu, Nov 23, 2023 at 07:20:46PM +0100, Oleksandr Natalenko wrote:
> Hello.
> 
> Since v6.6.2 kernel release I'm experiencing a regression with regard to USB ports behaviour after a suspend/resume cycle.
> 
> If a USB port is empty before suspending, after resuming the machine the port doesn't work. After a device insertion there's no reaction in the kernel log whatsoever, although I do see that the device gets powered up physically. If the machine is suspended with a device inserted into the USB port, the port works fine after resume.
> 
> This is an AMD-based machine with hci version 0x110 reported. As per the changelog between v6.6.1 and v6.6.2, 603 commits were backported into v6.6.2, and one of the commits was as follows:
> 
> $ git log --oneline v6.6.1..v6.6.2 -- drivers/usb/host/xhci-pci.c
> 14a51fa544225 xhci: Loosen RPM as default policy to cover for AMD xHC 1.1
> 
> It seems that this commit explicitly enables runtime PM specifically for my platform. As per dmesg:
> 
> v6.6.1: quirks 0x0000000000000410
> v6.6.2: quirks 0x0000000200000410
> 
> Here, bit 33 gets set, which, as expected, corresponds to:
> 
> drivers/usb/host/xhci.h
> 1895:#define XHCI_DEFAULT_PM_RUNTIME_ALLOW      BIT_ULL(33)
> 
> This commit is backported from the upstream commit 4baf12181509, which is one of 16 commits of the following series named "xhci features":
> 
> https://lore.kernel.org/all/20231019102924.2797346-1-mathias.nyman@linux.intel.com/
> 
> It appears that there was another commit in this series, also from Basavaraj (in Cc), a5d6264b638e, which was not picked for v6.6.2, but which stated the following:
> 
> 	Use the low-power states of the underlying platform to enable runtime PM.
> 	If the platform doesn't support runtime D3, then enabling default RPM will
> 	result in the controller malfunctioning, as in the case of hotplug devices
> 	not being detected because of a failed interrupt generation.
> 
> It felt like this was exactly my case. So, I've conducted two tests:
> 
> 1. Reverted 14a51fa544225 from v6.6.2. With this revert the USB ports started to work fine, just as they did in v6.6.1.
> 2. Left 14a51fa544225 in place, but also applied upstream a5d6264b638e on top of v6.6.2. With this patch added the USB ports also work after a suspend/resume cycle.
> 
> This runtime PM enablement did also impact my AX200 Bluetooth device, resulting in long delays before headphones/speaker can connect, but I've solved this with btusb.enable_autosuspend=N. I think this has nothing to do with the original issue, and I'm OK with this workaround unless someone has got a different idea.
> 
> With that, please consider either reverting 14a51fa544225 from the stable kernel, or applying a5d6264b638e in addition to it. Given the mainline kernel has got both of them, I'm in favour of applying additional commit to the stable kernel.

I've applied this other commit as well to all of the affected branches,
thanks for letting us know.

> I'm also Cc'ing all the people from our Mastodon discussion where I initially complained about the issue as well as about stable kernel branch stability:
> 
> https://activitypub.natalenko.name/@oleksandr/statuses/01HFRXBYWMXF9G4KYPE3XHH0S8
> 
> I'm not going to expand more on that in this email, especially given Greg indicated he read the conversation, but I'm open to continuing this discussion as I still think that current workflow brings visible issues to ordinary users, and hence some adjustments should be made.

What type of adjustments exactly?  Testing on wide ranges of systems is
pretty hard, and this patch explicitly was set to be backported when it
hit Linus's tree, it just looks like someone forgot to mark the
follow-up patch that you found also to be properly backported.

We will always make mistakes, we are only human.  The best thing to do
is if we get notified quickly of issues, like you did here, and work to
resolve them, as we have done here.  So again, thanks for letting us
know about the problem, and be sure to let us know of any future issues
you might find as well.

Remember, hardware is messy, and the kernel's job is to fix hardware
issues and quirks in it.  Sometimes we get it wrong as we are trying to
fix up inconsistencies and they cause other problems, so in the end, we
can only grumble at the hardware companies for stuff like this, be
patient with those of us who have to deal with this mess :)

thanks,

greg k-h

