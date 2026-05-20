Return-Path: <linux-usb+bounces-37794-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMSLORmwDWpy1gUAu9opvQ
	(envelope-from <linux-usb+bounces-37794-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 14:59:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8280F58E5E6
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 14:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46B2930DE6C2
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 12:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19B53E1CF4;
	Wed, 20 May 2026 12:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="CPMiPABG"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE1333A032;
	Wed, 20 May 2026 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281697; cv=none; b=Pu0qxGupNF24BegZ9HLjdem5L4sfT9pcycq21cgbNyb853a0wj6l1GMaTHif5VmJbCk6sgUSg4QwW3MGm0v5Yr19SJbimD9utueQQrndRyHwLo+X0fOqtigjwcrVfo/4GvKzGc4TkcacYLzJyscn/1WWAYAa/Tg+yi6HDCxeLLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281697; c=relaxed/simple;
	bh=45ij5qVAtYd5ZZF0L2p1N4BhNc9P6McUYfmny33QDMw=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ups8GQ11h8s3k0EiTCb/hUtFJOacwKNZGguUutORH6A9TxYpRxfe7CWcRBnjilYnvWmVopo69MSBVD6xRAwUK9O1vpVyH37UWAnJW6ahCIsIbGpiANhWL8/Vb41rZqeuqnv5nT/BtaPd5uZl7ZUVS0fDEtsMCj1g3oCneOUYbTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=CPMiPABG; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Mk2e1oeJq8p0n04P90LtVXvOIUOONjx8hxrYg+0UT9o=; b=CPMiPABGOeuocLIec6CY1JXSHL
	2ARttKN1ljp1wGlapTf5JPmVNl/l4yiFbd3tyxUTpZMdEMDzTXiWwS78pazoFuBciWIqHNRpkbi+y
	QEX0vwvcNowFOO853NxOuW7KXzuvd2dsNxt6g9mbmp243Rw6E//htfdx1q6ZwxKV4TlS5Qqb4KaAF
	LhL2g6AZeb1Ek+ExSeEantc2jDDIViFGNZTOoAhq4DwqkhrAwXoN37EwHY6UZ6xB7WsX7eUR9ngDC
	T9Qt/TTeQidVwifbOv3iI/+xTaPX7IjYJRbfQ3Gm5Ehw0zB/faqcEyNWckstMhtNfeOMs2dCRf+vI
	nqD+Bu1Q==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wPgRi-003pQx-5A; Wed, 20 May 2026 14:54:46 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1wPgRf-007pOJ-Qi; Wed, 20 May 2026 14:54:46 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <uajain@igalia.com>)
	id 1wPgRf-00000002jWN-0ZI6;
	Wed, 20 May 2026 14:54:43 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 20 May 2026 12:54:43 +0000
From: Umang Jain <uajain@igalia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lucas De Marchi <demarchi@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH] usb: early: xhci-dbc: Ensure correct memory size for
 early_ioremap()
In-Reply-To: <2026052001-regally-dizziness-2271@gregkh>
References: <20260520094804.2981960-1-uajain@igalia.com>
 <2026052001-ruined-pesticide-9de7@gregkh>
 <81d706a4d1977ed39529336b2a8bc15f@igalia.com>
 <2026052001-regally-dizziness-2271@gregkh>
Message-ID: <329c3970d932c21ca0ead6a84e573bd2@igalia.com>
X-Sender: uajain@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-4.7, Tests=ALL_TRUSTED=-3,AWL=-2.550,BAYES_50=0.8,URIBL_DBL_BLOCKED_OPENDNS=0.001,URIBL_ZEN_BLOCKED_OPENDNS=0.001
X-Spam-Score: -46
X-Spam-Bar: ----
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37794-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[uajain@igalia.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,steamdeck:email]
X-Rspamd-Queue-Id: 8280F58E5E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-20 12:42, Greg Kroah-Hartman wrote:
> On Wed, May 20, 2026 at 12:27:39PM +0000, Umang Jain wrote:
>> Hi Greg,
>> 
>> On 2026-05-20 11:22, Greg Kroah-Hartman wrote:
>> > On Wed, May 20, 2026 at 03:18:04PM +0530, Umang Jain wrote:
>> >> early_ioremap() checks and fail, if the memory size exceeds the fixed
>> >> boot-time mappings (dictated by NR_FIX_BTMAPS macro). We should ensure
>> >> the correct maximum memory size is passed to early_ioremap() in the
>> >> driver.
>> >> 
>> >> Without this check and page size being 4K(4096), enabling xhci-dbc
>> >> on steamdeck seems to issue the warning:
>> >> 
>> >> steamdeck kernel: xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 0
>> >> steamdeck kernel: ------------[ cut here ]------------
>> >> ay 19 13:42:57 steamdeck kernel: WARNING: CPU: 0 PID: 0 at mm/early_ioremap.c:139 __early_ioremap+0xae/0x180
>> >> steamdeck kernel: Modules linked in:
>> >> steamdeck kernel: CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.18.25-valve1-gcab630e7af50 #13 PREEMPT(undef)  4b70872d9de6788b7f2d10dce46ada89e6cd177b
>> >> steamdeck kernel: RIP: 0010:__early_ioremap+0xae/0x180
>> >> steamdeck kernel: Code: 60 ba 3f a0 4c 89 ca 48 81 e3 00 f0 ff ff 48 81 e2 00 f0 ff ff 48 29 d3 48 89 14 24 48 89 da 48 c1 ea 0c 89 d5 83 fa 40 76 04 <0f> 0b eb a2 6b c0 c0 4d 89 ce 41 81 e6 ff 0f 00 00 44 8d b8 ff 05
>> >> steamdeck kernel: RSP: 0000:ffffffff9fa03cb8 EFLAGS: 00010006 ORIG_RAX: 0000000000000000
>> >> steamdeck kernel: RAX: 0000000000000000 RBX: 0000000000100000 RCX: 0000000000100000
>> >> steamdeck kernel: RDX: 0000000000000100 RSI: 0000000000100000 RDI: 0000000080200000
>> >> steamdeck kernel: RBP: 0000000000000100 R08: 0000000000000000 R09: 0000000080200000
>> >> steamdeck kernel: R10: 0000000000000004 R11: ffffffff9fa03ad0 R12: 8000000000000163
>> >> steamdeck kernel: R13: 0000000000000000 R14: 0000000080200000 R15: 0000000000000000
>> >> steamdeck kernel: FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
>> >> steamdeck kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> >> steamdeck kernel: CR2: ffff888000000413 CR3: 000000020ed02000 CR4: 00000000000000b0
>> >> steamdeck kernel: Call Trace:
>> >> steamdeck kernel:  <TASK>
>> >> steamdeck kernel:  ? early_xdbc_parse_parameter+0x32c/0x360
>> >> steamdeck kernel:  ? setup_early_printk+0x4f5/0x520
>> >> steamdeck kernel:  ? do_early_param+0x44/0x70
>> >> steamdeck kernel:  ? parse_args+0x233/0x420
>> >> steamdeck kernel:  ? __pfx_do_early_param+0x10/0x10
>> >> steamdeck kernel:  ? parse_early_options+0x29/0x30
>> >> steamdeck kernel:  ? __pfx_do_early_param+0x10/0x10
>> >> steamdeck kernel:  ? parse_early_param+0x64/0xc0
>> >> steamdeck kernel:  ? setup_arch+0x542/0xbc0
>> >> steamdeck kernel:  ? _printk+0x6b/0x90
>> >> steamdeck kernel:  ? start_kernel+0x66/0x9a0
>> >> steamdeck kernel:  ? x86_64_start_reservations+0x24/0x30
>> >> steamdeck kernel:  ? x86_64_start_kernel+0xcc/0xd0
>> >> steamdeck kernel:  ? common_startup_64+0x13e/0x141
>> >> steamdeck kernel:  </TASK>
>> >> steamdeck kernel: ---[ end trace 0000000000000000 ]---
>> >> 
>> >> Signed-off-by: Umang Jain <uajain@igalia.com>
>> >> ---
>> >>  drivers/usb/early/xhci-dbc.c | 8 ++++++++
>> >>  1 file changed, 8 insertions(+)
>> >> 
>> >> diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
>> >> index 41118bba9197..699a9ac6d6c3 100644
>> >> --- a/drivers/usb/early/xhci-dbc.c
>> >> +++ b/drivers/usb/early/xhci-dbc.c
>> >> @@ -76,6 +76,14 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
>> >>  
>> >>  	sz64 = 1ULL << __ffs64(sz64);
>> >>  
>> >> +	/*
>> >> +	 * Check that size does not exceed fixed boot-time mappings
>> >> +	 * dictated by NR_FIX_BTMAPS. early_ioremap() will WARN_ON()
>> >> +	 * and not map memory in those cases.
>> >> +	 */
>> >> +	if (sz64 > (NR_FIX_BTMAPS << PAGE_SHIFT))
>> >> +		sz64 = NR_FIX_BTMAPS << PAGE_SHIFT;
>> > 
>> > You are bounding the size here, but does this mean that the hardware
>> > itself is just broken and should be fixed up to properly report the
>> > correct size?  Does this hardware actually have a debug controller?
>> 
>> Hmm, to answer your first question as far as I have read, the size is
>> inferred from PCI config with base address. My understanding here is
>> that
>> for early xhci debugging - the page mappings are fixed, so we need to
>> bound the size for early_ioremap().
> 
> So the device is providing the wrong size here?  Why is this an issue
> only for this hardware and not other hardware?
> 
>> The second answer is, yes the hardware has debug controller. We can
>> configure it after boot
>> and it works with USB3.1 Superspeed cable with host:
>> 
>> (on target)
>> (A+)(root@steamdeck ~)# echo enable  >
>> /sys/devices/pci0000:00/0000:00:08.1/0000:04:00.3/dbc
>> (A+)(root@steamdeck ~)# dmesg | grep DbC
>> [  366.276124] xhci_hcd 0000:04:00.3: DbC connected
>> [  366.637223] xhci_hcd 0000:04:00.3: DbC configured
>> 
>> (on host)
>> [114288.650481] usb 4-2: new SuperSpeed USB device number 55 using
>> xhci_hcd
>> [114288.662907] usb 4-2: New USB device found, idVendor=1d6b,
>> idProduct=0010, bcdDevice= 0.10
>> [114288.662935] usb 4-2: New USB device strings: Mfr=1, Product=2,
>> SerialNumber=3
>> [114288.662945] usb 4-2: Product: Linux USB Debug Target
>> [114288.662953] usb 4-2: Manufacturer: Linux Foundation
>> [114288.662960] usb 4-2: SerialNumber: 0001
>> [114288.666320] usb_debug 4-2:1.0: xhci_dbc converter detected
>> [114288.666474] usb 4-2: xhci_dbc converter now attached to ttyUSB0
>>  
>> 
>> > 
>> > And what changed to cause this to start complaining?  Does it fix a
>> > specific commit?  This hardware has been around for a long time, did we
>> > mess something up in the kernel for it recently?
>> 
>> This fix/patch is only for early xdbc. As mentioned above, it can be
>> used/configured after boot.
>> So yes, the hardware has been around but I don't think that early xdbc
>> capability was investigated at any point in time. I don't see recents
>> commits early xhci as well so maybe it was hidden all this time.
> 
> Ok, but it is good to figure out what is "wrong" here that this hardware
> is causing this warning to happen, yet other hardware does not.  Either
> the kernel has always been wrong (totally a possibility), or this
> hardware is reporting invalid ranges.  Figuring out which is true would
> be good to figure out here.

Oh yes definitely.

I, although don't have any order hardware so I will look around. I
haven't investigated the ranges yet, so I will investigate that too. My
logic initially was that it's the "early boot" that is forcing a
pages/size capping so we need to fit there. 
From __early_ioremap() in mm/early_ioremap.c

...
	/*
	 * Mappings have to fit in the FIX_BTMAP area.
	 */
	nrpages = size >> PAGE_SHIFT;
	if (WARN_ON(nrpages > NR_FIX_BTMAPS))
		return NULL;

...


> 
> thanks,
> 
> greg k-h

