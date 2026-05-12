Return-Path: <linux-usb+bounces-37342-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFB6HClIA2pU2wEAu9opvQ
	(envelope-from <linux-usb+bounces-37342-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 17:32:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D5F523B22
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 17:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 703C930479FC
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 15:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784AD3BB66C;
	Tue, 12 May 2026 15:32:50 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838EE3B83F8;
	Tue, 12 May 2026 15:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599970; cv=none; b=GNR+9sCbniR2BoACqPzXsBHhxk+cmq2Q0CcyiM3pJHbZfG9KNLPelJO0GlnWCRyVO1qp2ecsD5VmkslQiT1gSmdcA5O2U1AL98DZNAo/sDFVgK9zzvCSKstkGezJAZ+dMJYuIj/Wte1hf+2e5of5a4Ami3p0xTmLUQ5EZ34YD8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599970; c=relaxed/simple;
	bh=7v2TmIRDuWRYsOgZL3p/N/zlHcebs9szZe7cC1QUaBs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CLvpXfHl+mMh/c0Qk8L/ygc9cx6CfSdzKus7aNLoshNqB5ikINnLc3UiGtAgwYKxGqSqqYTieg0kop7Ptu8gCykWlEg9ggtc9YNoJIKXKOI7XvBn4+8hOowAeeJqY3aLosQ6q7bGC/bYfAMiO5J0ToRFFc0Y6LVjqkB+qVgiCYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7401B4C2C37F08;
	Tue, 12 May 2026 17:32:10 +0200 (CEST)
Message-ID: <eff5ca07-26a9-40bd-8668-6e6ed69fe587@molgen.mpg.de>
Date: Tue, 12 May 2026 17:32:09 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: IBM Power S822LC: pci 0021:0d:00.0: xHCI HW did not halt within
 32000 usec status = 0x0
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
References: <fb68e15d-b8f2-42ac-aa65-0d9fedcfcdbd@molgen.mpg.de>
 <20260506193037.6de9e355.michal.pecio@gmail.com>
 <69fa1c3f-3ea9-42cb-a49a-7da39f72806e@molgen.mpg.de>
 <20260512012006.66aeb0c5.michal.pecio@gmail.com>
 <6106b5b9-17d2-48be-8215-3320f3d1d261@molgen.mpg.de>
 <20260512102233.290d3665.michal.pecio@gmail.com>
Content-Language: en-US
In-Reply-To: <20260512102233.290d3665.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 08D5F523B22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37342-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_NA(0.00)[mpg.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.927];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmenzel@molgen.mpg.de,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

[Cc: +Benjamin]

Dear Michal,


Thank you for your reply.

Am 12.05.26 um 10:22 schrieb Michal Pecio:
> On Tue, 12 May 2026 08:17:08 +0200, Paul Menzel wrote:>
>>> I honestly don't know what to do with this. I think I would start with
>>> looking whether xhci_shutdown() in the old kernel manages to halt it
>>> successfully or if it also fails, and what's the USBSTS there.
>>>
>>> It seems that you can get such information by enabling dynamic debug
>>>
>>>     echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
>>>
>>> and capturing old kernel's log up to kexec() through a serial cable.
>>
>> Unfortunately, nothing is logged over the serial console (BMC SOL) after
>> running `sudo kexec -e` or `sudo systemctl reboot`. I just see:
>>
>>       [69530.180531343,5] OPAL: Switch to big-endian OS
>>       [69538.407292205,5] OPAL: Switch to little-endian OS
>>
>> Which is the OPAL firmware, so it might be involved? No idea, if it
>> touches the xHCI controller.
> 
> So some FW involvement is potentially possible.
> 
> BTW, another method of doing kexec is to setup a crash kernel and
> then trigger panic with /proc/sysrq-trigger.
> 
> This probably won't run xhci_shutdown(). Not sure about OPAL FW.
> Is the outcome any different?
Is the motivation to try to not get the OPAL message to rule out any 
involvement.

I have to check, how to set the crash kernel up.

>> But strangely no xHCI messages are there –  also after booting with
>> Petitboot and initialized xHCI controller? No idea, if it points to,
>> that during kexec or shutdown nothing is power off?
>>
>> With `sudo systemctl reboot` only the line below are logged:
>>
>>       [  121.811384] libvirt-guests.sh[3366]: Running guests on default URI:
>>       [  121.811988] libvirt-guests.sh[3376]: no running guests.
>>       [ … (systemd service stop notifications)]
>>       [  136.254846] systemd-shutdown[1]: Waiting for process: watch_ldconfig
>>       [  218.549684] reboot: Restarting system
>>       [69760.484679183,5] OPAL: Reboot request...
>>         3.55778|Ignoring boot flags, incorrect version 0x0
>>         3.59881|ISTEP  6. 3
> 
> Only "reboot: Restarting system" looks like it's kernel. Maybe you need
> to tweak loglevel before rebooting or kexecing? Try to get more kernel
> messages showing over serial during operation, then kexec.

I actually did set the log level by adding `debug` to the Linux kernel 
command line, and with

     $ echo 9 | sudo tee /proc/sysrq-trigger
     9

and it was confirmed:

     sysrq: Changing Loglevel
     sysrq: Loglevel set to 9

Unfortunately, no more messages.

As a further data point, adding `ppc_pci_reset_phbs` to the command line 
also gets xhci_hcd to initialize the TI xHCI host controller:

     $ lspci -nn -s 0021:0d:00.0
     0021:0d:00.0 USB controller [0c03]: Texas Instruments TUSB73x0 
SuperSpeed USB 3.0 xHCI Host Controller [104c:8241] (rev 02)


     [   14.050249]   Issue PHB reset ...
     […]
     [   19.339822] ehci_hcd: block sizes: qh 144 qtd 96 itd 192 sitd 96
     [   19.339919] ohci_hcd: block sizes: ed 112 td 96
     [   19.340538] xhci_hcd 0021:0d:00.0: xHCI Host Controller

No log `xHCI HW did not halt within 32000 usec status = 0x0` (or 0x10 
with the other patch). In `arch/powerpc/platforms/powernv/pci-ioda.c`, 
reading the comment in `pnv_pci_init_ioda_phb()` suggests, that PHB 
should be reset also in the kexec case:

         /*
          * If we're running in kdump kernel, the previous kernel never
          * shutdown PCI devices correctly. We already got IODA table
          * cleaned out. So we have to issue PHB reset to stop all PCI
          * transactions from previous kernel. The ppc_pci_reset_phbs
          * kernel parameter will force this reset too. Additionally,
          * if the IODA reset above failed then use a bigger hammer.
          * This can happen if we get a PHB fatal error in very early
          * boot.
          */
         if (is_kdump_kernel() || pci_reset_phbs || rc) {
                 pr_info("  Issue PHB reset ...\n");
                 pnv_eeh_phb_reset(hose, EEH_RESET_FUNDAMENTAL);
                 pnv_eeh_phb_reset(hose, EEH_RESET_DEACTIVATE);
         }

At least, I’d assume that kdump and kexec are similar, that both do not 
shut down PCI devices? (Commit 361f2a2a1536 (powrpc/powernv: Reset PHB 
in kdump kernel) from 2024 adds (some) the code above.)


Kind regards,

Paul

