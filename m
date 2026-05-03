Return-Path: <linux-usb+bounces-36861-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDTZJpSi92nXjwIAu9opvQ
	(envelope-from <linux-usb+bounces-36861-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 21:31:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E584B721D
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 21:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6480D300F9C9
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2026 19:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5EE3A6B63;
	Sun,  3 May 2026 19:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVKyevN9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D17426059D
	for <linux-usb@vger.kernel.org>; Sun,  3 May 2026 19:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777836679; cv=none; b=SBCvQR4yT5TyslZj2vpP0ICJLl34aoGt4Wq740o0WU/3wujeTBnxju38Qd70k7FwlavUe9Yf4AqKAAE7PfY846ic4aeD2bhwI/DmTtjMVD2yTrBwgmEALISNa/Oo+ut6XQ9jWPaU6QjcomPVSQEgDvYTPf28MH4aDM0Cc89rA/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777836679; c=relaxed/simple;
	bh=+jx8UdAo/Px/+Lfc+DgUdlcmWgo3ag3mFHpX05NWvxk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wn2cv5k3Lhv7Uk71tDLEsAPWG0vdTo4gyNTtwfgXINmiirrU17j0/117JKwgdX9yr7GGc+7mp+QMRme1TRZYy9MIm7LG6mnllaQH6jT2vEmzGoauTif/HYg14b1LU8NBlgeZOZp4MHnzdSjMY/b/hmmyTdWPul42DD3i2LgudMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sVKyevN9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso26998995e9.2
        for <linux-usb@vger.kernel.org>; Sun, 03 May 2026 12:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777836676; x=1778441476; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WbIE169240FAGRdj7Q9npPRMFvNn3V89B4m8K3AWMUc=;
        b=sVKyevN9imiJQmHTtcN7Y5mudFfHxCKSaSI1QklDrXj5mdBtOFU5nm6BJKj3e3PEcp
         u/fUW2/ykrCXkx/yQrcZ4/XV5z49hnbn56eLbp8gnKqSzEotwUR/i895xf9URkPcHe2g
         lzQY++GpAgaxXIkLuRCIO4ZAk+bQZSaEF7Df4f9bHt98ePzeDEORFXvRXGL7viUTZvSa
         JmZ3Rkxa9zFh4OeIoXYNPJDmEOTPE8rrHrQ/j1CP3YsfLiaNusO1wdq94UJKYUSnjJCW
         lZTBbFyL83U8rWlV3RPijLL33xCx5ea/WXcaO9kzbFe9o+DgL4R1tXf+Hpnges3HzJDm
         1ggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777836676; x=1778441476;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbIE169240FAGRdj7Q9npPRMFvNn3V89B4m8K3AWMUc=;
        b=Dmfv/C0sG7CPvuv258UabtudmIE94MqYSfT6lRdwccYC8va6glnsKzHRaJ+VaYkXye
         grKxK5LXCMpTagDEtCpRDwoTpPv4CDsgEwGkMrOPgHQ00DHpM0D8FFmcrHV2DXjvi2Er
         +KlSsv32yn8eEopqitXqKGPjgHOrFX6o+no6XshMNNRbb0N6YYVt/QYyTeYyfUhD4sOb
         T8KfjZqnJS4z2l2nHjHav7XwjfQEZfvkUHwr2Biv1//LYbKmuAi0juAgIKmhXEITl3tk
         GSvcNR+WhLp5BiuN+926+4toVZyCnrL/fOZGeDrlUicK1YmNV85uwsXOnXxrYK0Kgpgc
         QEmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lOCGJhefgSYLdRDAQvyBpTUhg4YDoz1d+YqGum3dbEa5dptA0yFs4iCDoVmocEhw0Zp/Yv6ya5W0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrslxPkyCVSL74SbnVhkhjJUDZm/0kq2ITCdv5FQ6V5eIErWpn
	3Com+mFezY9HXTSr8hYTvyavb5/aTp4IJDRbSGVj3mD0029sufroZHEW
X-Gm-Gg: AeBDieuRaNrQGQBTh8TXPFli/82mUf9KFsXsl9JqSLdudG6MzJbBVtxBt7gij9WKTLq
	tfxjrv/5wBuOcPIIrD9QlnhVpjdrZiHFciqD6YhGo/Rjamw9XjA8VOKv0/ve/ga9s3V9LyyrnmE
	hpbm+LFtrjlivV4QAI0fGV9VnwXDYerSRwrR4i+YWhFItH2dA90C7r9NK78WfC+fiow8Q4RSB77
	X4YqQyIH75uou+9SAQf7KQGA2v7BEXl+nDRXs69rTZSKwDTp5uoLqLPnYi3F60ohGj5OOK4TVIk
	82GADhGCUWFTkzoEUUL+/6SavDPolIpRAQQ03L03VmLMM6biRs3jOo6e867DBXUM2PXhI80kBOU
	DmhfFzuoVH/w+yODSLDrnVME5V7uKs0tEtPC8VTZmueAmZBXFMW8vVBGma7K8rboabsC7+Z6t1n
	ZCgPrZv1K2IHDjXHeKvaNmF67gQfrjuVfC/3ZVZvI3SmZVPw==
X-Received: by 2002:a05:600c:6211:b0:488:a723:ea53 with SMTP id 5b1f17b1804b1-48a9853a014mr125182365e9.7.1777836676453;
        Sun, 03 May 2026 12:31:16 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm260156445e9.5.2026.05.03.12.31.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 03 May 2026 12:31:16 -0700 (PDT)
Date: Sun, 3 May 2026 21:31:11 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Desnes Nunes <desnesn@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, mathias.nyman@intel.com, stable@vger.kernel.org
Subject: Re: [PATCH RFT RFC] usb: xhci: Kill hosts with HCE or HSE on
 command timeout
Message-ID: <20260503213111.117db3a1.michal.pecio@gmail.com>
In-Reply-To: <CACaw+ew8uV5g1G-6qZGtVBEYZ3k+fvFrOq3XMyq-Nuhbq5mdnA@mail.gmail.com>
References: <20260430014817.2006885-1-desnesn@redhat.com>
	<20260430104850.352bd946.michal.pecio@gmail.com>
	<CACaw+exdPSVSfdAob7+d-xH=JEjBbPpY_z1cPPU6rzXx4wUZpA@mail.gmail.com>
	<20260430235453.2288c973.michal.pecio@gmail.com>
	<CACaw+ewwM_5eqyGW5=+THwHsYPs7u3NT096AFQdt6x4E6HcWtA@mail.gmail.com>
	<20260502114644.76e6b5a3.michal.pecio@gmail.com>
	<CACaw+eyKh7buHDoDyTOe8O65FP5cSXYdzCcQvwqKw=1DwX26oA@mail.gmail.com>
	<20260502235517.089ba5bf.michal.pecio@gmail.com>
	<CACaw+ewOTVh49tnkz+cRr0SD_Z-LmYrMWhFUrsik6YF83mPBtA@mail.gmail.com>
	<20260503071749.6abda137.michal.pecio@gmail.com>
	<CACaw+ew8uV5g1G-6qZGtVBEYZ3k+fvFrOq3XMyq-Nuhbq5mdnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/RJPkfCvaUEZTz8gq3rnPbGG"
X-Rspamd-Queue-Id: E8E584B721D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36861-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

--MP_/RJPkfCvaUEZTz8gq3rnPbGG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sun, 3 May 2026 13:20:38 -0300, Desnes Nunes wrote:
> Yes, same patched binary on the main kernel and kdump kernel.

That's not a great news because it seems that the same HSE could
occur on any kexec, not just kdump. It's unclear why it happens,
it seems that after initial boot the HC works normally (does it?)
but then kexec-ing breaks it somehow.

I don't think this has anything to do with the Battlemage, because
in the particular case which you shared, GPU began initialization
*after* HSE had already been logged.

My first wild guess would be that HSE is caused by resetting IOMMU
while the xHC is unaware of kexec and continuing to DMA old buffers.
Attached patch checks for this and also tries to explicitly clear
HSE, although resetting ought to clear it too. But HW has bugs...

So it may not help, but maybe it will if we are lucky, or at least
it may offer some hint about when things go wrong.

> So, I confirm that this patch, which checks for HSE or HCE indeed
> fixes the bug, without having to rely to a
> wait_for_completion_timeout():
> 
> # grep -i HSE -A5 kexec-dmesg.log
> [Sun May  3 11:37:36 2026] xhci_hcd 0000:80:14.0: Command timeout,
> USBSTS: 0x00000015 HCHalted HSE PCD
> [Sun May  3 11:37:36 2026] xhci_hcd 0000:80:14.0: kill the damn thing
> [Sun May  3 11:37:36 2026] xhci_hcd 0000:80:14.0: xHCI host controller
> not responding, assume dead
> [Sun May  3 11:37:36 2026] xhci_hcd 0000:80:14.0: HC died; cleaning up
> [Sun May  3 11:37:36 2026] xhci_hcd 0000:80:14.0: Error while
> assigning device slot ID: Command Aborted

Thanks for testing, that's what the patch was intended to do.
There is no lockup, but of course the chip doesn't work afterwards.

Regards,
Michal

--MP_/RJPkfCvaUEZTz8gq3rnPbGG
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=xhci-clear-hse.patch

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 849a568d0e63..c0f3d04c6241 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5492,6 +5492,8 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	struct device		*dev = hcd->self.sysdev;
 	int			retval;
 	u32			hcs_params1;
+	u32			usbsts;
+	char			str[XHCI_MSG_MAX];
 
 	/* Accept arbitrarily long scatter-gather lists */
 	hcd->self.sg_tablesize = ~0;
@@ -5550,11 +5552,19 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 		xhci->quirks |= XHCI_LINK_TRB_QUIRK;
 	}
 
+	usbsts = readl(&xhci->op_regs->status);
+	xhci_info(xhci, "gen_setup old USBSTS %s\n", xhci_decode_usbsts(str, usbsts));
 	/* Make sure the HC is halted. */
 	retval = xhci_halt(xhci);
 	if (retval)
 		return retval;
 
+	usbsts = readl(&xhci->op_regs->status);
+	if (usbsts & STS_FATAL)
+		writel(STS_FATAL, &xhci->op_regs->status);
+	usbsts = readl(&xhci->op_regs->status);
+	xhci_info(xhci, "gen_setup new USBSTS %s\n", xhci_decode_usbsts(str, usbsts));
+
 	xhci_zero_64b_regs(xhci);
 
 	xhci_dbg(xhci, "Resetting HCD\n");

--MP_/RJPkfCvaUEZTz8gq3rnPbGG--

