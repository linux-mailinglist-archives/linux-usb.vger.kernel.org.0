Return-Path: <linux-usb+bounces-32911-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIVFLvpve2mMEgIAu9opvQ
	(envelope-from <linux-usb+bounces-32911-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 15:34:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50025B103B
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 15:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51B243006135
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 14:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0678729A9E9;
	Thu, 29 Jan 2026 14:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gA/8R/Ec"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2372C2528FD
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 14:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769697271; cv=none; b=WEuLmvryx3StSBiJ0WPLc/WPaI8ttZwLjQ2YZT5zodT+8Gvg3HnAfYqMy7h6ff++R5BcMQpMoJxqJibDnDb29NYJwT1BVbFMH91G7dbUOs0Gq1V52GCeftEc99z7LGmMWJIvJ0+8cEV3LwLfc6GeTOn0d+yscG6tmbwtw2UjX+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769697271; c=relaxed/simple;
	bh=jH7+xDrElxwFqZqZ4Qz2PwSv6DL98FW+OAgH61RKoSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChJdku8tPYryAw4ebnVyj1QSzM3ERtToTAEb7C49R0q9yYH5odeWRe7Ox4uMTVrbcOQ9y+q2KhfVKzElLnx6KuQ1LOYf1AlE9utnucwTYVWqq6XiioUf4YWt76WVY3V1bFReaZB/YtG/R8ZSNGgDTt3J0TX9Cs+Ln3E1jpMRAoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gA/8R/Ec; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9EE041A2AF7
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 14:34:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6AF90606FD;
	Thu, 29 Jan 2026 14:34:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BE85119A868D;
	Thu, 29 Jan 2026 15:34:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769697265; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=d47mfWDfhwVOcY0sEOqFBeuehMSYc5UT+oKMWz/KtZk=;
	b=gA/8R/EcrIX++41cvrqp/HOTBjT97sS8ThTK0zE6yO46QKe9D9mjwcapsEAc1w9yvMAl2B
	C2uYG8LPXLVZjwMCHEft87k5BNPv3d++ziJXieQR+UsHaeU22YtmQ0VVAaAk8fo+o4R5Dq
	u2BhQIRnSIIjFsopSe7O9vs8ACZ8KxMAv+1XOEJvCviLlPXDvPZei88M1qOIH4nXoWEKIt
	Wedu41nhfGhpBy4Cfd7377shdp8vYT4c/Q5QOlOmoydIV1ITSwJCASogCENrbVaqYqQrUr
	jvSlhtEZ7fq3CGGV6uPQqTaDNFkVR3JQiszzOI0GTYgjQ8jtX3J4Y5YZhMucFg==
Message-ID: <8743fec1-301d-46e1-89bf-7952c73faa86@bootlin.com>
Date: Thu, 29 Jan 2026 15:34:18 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: cdns3: host: Add null check for host_device before
 accessing its members
To: Abhash Kumar Jha <a-kumar2@ti.com>, gregkh@linuxfoundation.org,
 pawell@cadence.com, peter.chen@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, rogerq@kernel.org, u-kumar1@ti.com,
 p-mantena@ti.com, theo.lebrun@bootlin.com,
 Gregory CLEMENT <gregory.clement@bootlin.com>
References: <20260119082242.1922599-1-a-kumar2@ti.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260119082242.1922599-1-a-kumar2@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sto.lore.kernel.org:server fail,bootlin.com:server fail];
	TAGGED_FROM(0.00)[bounces-32911-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.richard@bootlin.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 50025B103B
X-Rspamd-Action: no action

Hello,

On 1/19/26 9:22 AM, Abhash Kumar Jha wrote:
> In cases when the xhci device is not populated, we see a nullptr
> exception when resuming.
> 
> Add a nullptr check for the host_dev before accessing its private data.
> 

I was able to reproduce Abhash's issue on J784s4 and J7200 EVM board
with 6.19-rc7 kernel.

Unable to handle kernel NULL pointer dereference at virtual address
0000000000000208
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=00000008856e6000
[0000000000000208] pgd=0000000000000000, p4d=0000000000000000
Internal error: Oops: 0000000096000004 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 146 Comm: sh Not tainted
6.19.0-rc7-00013-g6e64f4aabfae-dirty #135 PREEMPT
Hardware name: Texas Instruments J7200 EVM (DT)
pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : usb_hcd_is_primary_hcd+0x0/0x1c
lr : cdns_host_resume+0x24/0x5c
sp : ffff800084fc39d0
x29: ffff800084fc39d0 x28: ffff8000840ac098 x27: ffff8000842e6ee0
x26: 0000000000000000 x25: ffff800084247958 x24: ffff80008427d000
x23: 000000048f2f5605 x22: ffff000801937218 x21: 0000000000000010
x20: 0000000000000001 x19: 0000000000000000 x18: 0000000000000006
x17: 0000000000000000 x16: 0000000000000000 x15: ffff800084fc3390
x14: 0000000000000000 x13: 383331203a74696e x12: 695f74736f685f73
x11: ffff800083c48828 x10: 0000000000000018 x9 : ffff800083c48828
x8 : 00000000000006aa x7 : ffff800083ca0828 x6 : 00000000fffff000
x5 : 0000000000017fe8 x4 : ffff000801935dc0 x3 : 0000000000000000
x2 : ffff800080e3b388 x1 : 0000000000000001 x0 : 0000000000000000
Call trace:
 usb_hcd_is_primary_hcd+0x0/0x1c (P)
 cdns_resume+0x6c/0xbc
 cdns3_controller_resume.isra.0+0xe8/0x17c
 cdns3_plat_resume+0x18/0x24
 platform_pm_resume+0x2c/0x68
 dpm_run_callback+0x90/0x248
 device_resume+0x100/0x24c
 dpm_resume+0x190/0x2ec
 dpm_resume_end+0x18/0x34
 suspend_devices_and_enter+0x2b0/0xa44
 pm_suspend+0x16c/0x5fc
 state_store+0x80/0xec
 kobj_attr_store+0x18/0x2c
 sysfs_kf_write+0x7c/0x94
 kernfs_fop_write_iter+0x130/0x1dc
 vfs_write+0x240/0x370
 ksys_write+0x70/0x108
 __arm64_sys_write+0x1c/0x28
 invoke_syscall+0x48/0x10c
 el0_svc_common.constprop.0+0x40/0xe0
 do_el0_svc+0x1c/0x28
 el0_svc+0x34/0x108
 el0t_64_sync_handler+0xa0/0xe4
 el0t_64_sync+0x198/0x19c
Code: 52800003 f9407ca5 d63f00a0 17ffffe4 (f9410401)
---[ end trace 0000000000000000 ]---

So I investigated and I identified two distinct issues.

1- First issue is hardware / board related issue, for an unknown reason
VBUS change after a suspend-to-ram or suspend-to-idle which triggers a
mode change of the controller (from idle to host). This issue shall be
fixed but it is not the right place for such a discussion.

2- Second issue is: switching from idle to host mode during resume
causes a NULL pointer dereference. I think it is a valid use case so it
should be fixed.

During resume cdns3 detects that the real role changed [1]. In this case
it switches to its new role [2]. Behind the scene, it runs the stop()
operation of the former role [3][4], and then run the start() operation
of the new role [5][6].

In host mode, the start() operation creates a xhci-hcd device [7]. But
as we are in the resume path, the probe() of this xhci-hcd device is not
run. Later in the resume sequence of cdns3 driver we call the resume()
operation [8] of the current role (which is host right now). But in the
host resume operation we assume the xhci-hcd device has been probed
which is not true in this case, so we try to use an uninitialized
pointer which causes a NULL pointer dereference.

I think we can skip the resume() operation in case the role changed
during resume as we already did the start() operation for the new role.
Then resume ends successfully, and xhci-hcd device is probed after.

I will send a patch.

[1]
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/usb/cdns3/core.c#L534
[2]
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/usb/cdns3/core.c#L536
[3]
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/usb/cdns3/core.c#L316
[4]
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/usb/cdns3/core.c#L66
[5]
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/usb/cdns3/core.c#L320
[6]
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/usb/cdns3/core.c#L47
[7]
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/usb/cdns3/host.c#L69
[8]
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/usb/cdns3/core.c#L555

Best Regards,
Thomas

