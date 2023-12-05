Return-Path: <linux-usb+bounces-3741-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 895A380579A
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 15:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EBCA282405
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 14:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34415C8F1;
	Tue,  5 Dec 2023 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="P7p04kQ8"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D865D1A1
	for <linux-usb@vger.kernel.org>; Tue,  5 Dec 2023 06:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=41X7tFiHQfjscTD0MI4N3CZZAsABYRv0bngDHyE8hME=; b=P7p04kQ82QojiCtgmqiWyoIcC/
	WEoSASzIM7O2g4I0vId30TswcqPGl9PQ86DuOAAipo9XD2Wg1Scf3IbZcmY2ec90OCzmIU/7Z6kVS
	LWtFT4y/aRkqajQ/WoCy34hawM63WPr/ygd84nqhenUKoEPwUm6bF1i4L99yRYtACOAmBr2bujw+1
	rUnJyJsUpW7iRopqGMlQIUqajDgwq46jrO6t24TqErXEoqU6/BPfAqLrC6KVZb/3bIU+rFj1txfY+
	tbLRiY9YBT8w8YuKeh8g2pZVVK773PNQ1kRlvnC+5uXHd6DLfVb3TVcI/Txpe7awm52siIRtN4gDb
	P6iu/waQ==;
Received: from [179.232.147.2] (helo=[192.168.0.5])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rAWbR-00Acot-Ez; Tue, 05 Dec 2023 15:40:49 +0100
Message-ID: <9efaed91-d246-cf3c-efc0-e866f88a943d@igalia.com>
Date: Tue, 5 Dec 2023 11:40:42 -0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Content-Language: en-US
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "balbi@kernel.org" <balbi@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "johan@kernel.org" <johan@kernel.org>,
 "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Vivek Dasmohapatra <vivek@collabora.com>, piyush.mehta@amd.com,
 ray.huang@amd.com
References: <20231122165931.443845-1-gpiccoli@igalia.com>
 <2dfbf5c9-dd38-c919-c604-618ad08ce456@igalia.com>
 <20231205012336.mn7b7f4zypwcyv6w@synopsys.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20231205012336.mn7b7f4zypwcyv6w@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thinh, thanks for your response. I'll clarify inline below:

On 04/12/2023 22:23, Thinh Nguyen wrote:
> [...]
>>> It was noticed that on plugging a low-power USB source on Steam
>>> Deck USB-C port (handled by dwc3), if such port is on device role,
> 
> I'm not clear of the testing sequence here. Can you clarify further? Is
> this device operating as host mode but then it switches role to device
> mode when no device is connected?
> 

Exactly this. We have a driver that changes between host/device mode
according to ACPI notifications on port connect. But to make
tests/discussion easier and eliminate more variables, we just dropped
this driver and do it manually.

So the steps are:

(A) host mode test
1) Put the port on host mode using debugfs interface.
2) Wait 30 seconds, plug a cable connecting the Steam Deck to a laptop -
we call this connection a "low-power source", since it seems to charge
slowly the Deck.
3) Suspend the Deck after some seconds (S3/deep) - success

(B) device mode test

1) Put the port on device mode using debugfs interface.
2) Wait 30 seconds, plug a cable connecting the Steam Deck to a laptop.
3) Suspend the Deck after some seconds (S3/deep) - fails

3a) If pcie_pme is using MSIs, it fails showing that a wakeup interrupt
is pending, in this case the Steam Deck effectively doesn't enter suspend.

3b) if PCIe PME is not using MSIs, Deck suspends and right after (less
than a second), wakes up properly.


>>> the HW somehow keep asseting the PCIe PME line and triggering a
>>> wakeup event on S3/deep suspend (that manifests as a PME wakeup
>>> interrupt, failing the suspend path). That doesn't happen when the USB
>>> port is on host mode or if the USB device connected is not a low-power
>>> type (for example, a connected keyboard doesn't reproduce that).
> 
> Is the PME continuously generating non-stop? Did you test this in USB3
> speed? Does this happen for every low-power device or just this specific
> low-power device?

It seems PME is continuously being generated, yes. I tested by
connecting to my laptop as mentioned, I guess others tested different
scenarios, not always reproduces. An example: a keyboard or a disk
connected when the USB port is on device mode doesn't reproduce. Also, I
think I didn't test "in USB3 speed" - could you detail more, not sure if
I understood that properly.


> [...] 
> Even if you masked all the interrupts, and the events are still
> generating? Did you check if the driver handled wakeup from PME and
> properly restore the controller?
> 

Ok, let me clarify a bit. From the ACPI perspective, I was able to check
from kernel that some GPEs were generated on resume when the issue
happens (and potentially even when the issue doesn't happen, in host
mode for example). So, what I did was masking all these GPEs using the
kernel sysfs interface. After masking, the issue still reproduces but
the GPEs count doesn't increase.

Regarding the PME interrupt now: if MSI is used on PME, I can see an
increase of 1 in every suspend/resume attempt (checking
/proc/interrupts). Now if MSIs are not used, guess what? There was no
increase in the interrupt at all. I didn't mask the PME interrupt on
PCIe PME driver...but even with PME driver disabled, IIRC the problem
reproduces.

"Did you check if the driver handled wakeup from PME and properly
restore the controller?" <- I think I didn't - how do you suggest me to
check that?

What I've noticed is that either the system can't suspend, or if no MSIs
are used on PCIe PME, it suspends and resumes right after, with success.
In this latter case, dwc3 works normally again, resume is successful.
Let me know if you want me to check any other path or function called, etc.


> [...]
> 
> Some platforms may need a soft reset before a change to prtcapdir. This
> may break some setups. This seems to be a workaround and should not be
> treated as part of a normal flow.

OK, do you have any other idea of a register change that is softer than
changing "prtcapdir" and could prevent the issue? Also, would that
workaround makes sense as...a quirk?

We could guard it for Deck's HW exclusively, using DMI if you think it
does make sense...or the dwc3 quirks (already have some for AMD right?)

I'm CCing Piyush and Huang from AMD, since this is AMD HW. Any other
suggestions are much appreciated.
Thanks,


Guilherme

