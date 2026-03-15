Return-Path: <linux-usb+bounces-34813-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gXd5IfRBtmm8/gAAu9opvQ
	(envelope-from <linux-usb+bounces-34813-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 06:21:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAB428FFDC
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 06:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1ABAC3010921
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 05:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF831DF742;
	Sun, 15 Mar 2026 05:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Tsn6wyHj"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325C235898
	for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 05:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773552105; cv=none; b=IOaFBBlJkO5XYy33M4GfYpGCgDxNWxAo8Fda9f8wztlVNRZUMYFlAh9PFOc1XP4OrJvjKlNiHu/UP4ToYEE9QVNYVFkeoFWr5A5pOc1iL99M5Orpfl/NMpW1d4OdZOeS5fIGWnYeuwxAaO7NSJEKokomWV9EsRvwHUGGN4UzVfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773552105; c=relaxed/simple;
	bh=R5jmMat2HWpxUGIj7j0lV9HKmGJyGaS9EivY6VSkl6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DVfWLCTwNkVOyQeryiJp7q+aN6NdXeQCvapDTGKMX1KgeOW63tIEJGeRnMPjAGRr0HOKfNu4TjOpzs6xa5rE91n1Pfvt1zczlrjK9ubLlbrV3sk9miNjzL63vbi2UdUkXgMeb2D8ytYrT3xEvCOwr+d0CRIKDT4UtPS5UYSN2pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Tsn6wyHj; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <10890524-cf83-4a71-b879-93e2b2cc1fcc@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773552100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VTukRrOhuGMF/c2GfZ9K6zim0wNjOzGcB+iaGYvNiYU=;
	b=Tsn6wyHjh1OBtU8JFJqufrYmtUcuFU1l6Wj865mjvn/stOxp99hDXGF2r9yBHmUauMm7An
	KaU811Tx/aLjeQ0NwpdjHj28Xa9+hsCxGifyKGhBo5ajJLBixv+Mx0cmdkXdhubXqIiOw1
	Ogs1l2+IM8hSlqlbqYrWheOB2dRbqIm60H1iUyV4nO5zIpeZYh8yG2QxT6T8Q2a9b4Biq+
	xb6t/V9p5N2i30a95HH3bAbiHB3GjNlXfuMk/4OkCHNrJm9O49Is+bantN8A6f/FPOsEjO
	JsKY483C2noPOxGftoCFqFAiRiJ5yQkMRHpnTPxFfF2p83rT77UpuxcNu+E5uA==
Date: Sun, 15 Mar 2026 02:21:30 -0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 7/7] usb: gadget: f_ncm: Fix net_device lifecycle with
 device_move
To: Kuen-Han Tsai <khtsai@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Heidelberg <david@ixit.cz>,
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
 Jon Hunter <jonathanh@nvidia.com>,
 LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@kernel.org
References: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
 <20260309-f-ncm-revert-v2-7-ea2afbc7d9b2@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260309-f-ncm-revert-v2-7-ea2afbc7d9b2@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34813-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[packett.cool:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6FAB428FFDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 3/9/26 9:04 AM, Kuen-Han Tsai wrote:
> The network device outlived its parent gadget device during
> disconnection, resulting in dangling sysfs links and null pointer
> dereference problems.
>
> A prior attempt to solve this by removing SET_NETDEV_DEV entirely [1]
> was reverted due to power management ordering concerns and a NO-CARRIER
> regression.
>
> A subsequent attempt to defer net_device allocation to bind [2] broke
> 1:1 mapping between function instance and network device, making it
> impossible for configfs to report the resolved interface name. This
> results in a regression where the DHCP server fails on pmOS.
>
> [..]

I just saw that this was the last commit touching u_ether while 
debugging… the DHCP server failing on pmOS. (In the initrd, even).

Specifically, udev calling ethtool_get_drvinfo and eth_get_drvinfo 
dereferencing an unset dev->gadget:


[    7.528277] [pmOS-rd]:   Setting up USB gadget through configfs
[    7.539437] configfs-gadget.g1 gadget.0: HOST MAC 2a:a6:63:b7:92:23
[    7.545914] configfs-gadget.g1 gadget.0: MAC 76:1d:2b:16:aa:25
[    7.577888] [pmOS-rd]: Trying to start server with parameters: Server 
IP addr: 172.16.42.1:67, client IP addr: 172.16.42.2, interface: usb0
[    7.591522] [pmOS-rd]: Entering debug shell
[    7.597590] Unable to handle kernel NULL pointer dereference at 
virtual address 0000000000000080
[    7.606670] Mem abort info:
[    7.609571]   ESR = 0x0000000096000004
[    7.613462]   EC = 0x25: DABT (current EL), IL = 32 bits
[    7.618942]   SET = 0, FnV = 0
[    7.622105]   EA = 0, S1PTW = 0
[    7.625354]   FSC = 0x04: level 0 translation fault
[    7.630395] Data abort info:
[    7.630398]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    7.630401]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    7.630404]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    7.630407] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000107b18000
[    7.630411] [0000000000000080] pgd=0000000000000000, p4d=0000000000000000
[    7.630420] Internal error: Oops: 0000000096000004 [#1]  SMP
[    7.630425] Modules linked in: typec msm ubwc_config mdt_loader ocmem 
rtc_pm8xxx drm_gpuvm drm_exec i2c_qcom_geni llcc_qcom gpi gpu_sched 
drm_client_lib phy_qcom_snps_femto_v2 drm_display_helper cec 
drm_dp_aux_bus icc_bwmon drm_kms_helper drm backlight ufs_qcom 
phy_qcom_qmp_ufs icc_osm_l3 pmic_glink pdr_interface qcom_pdr_msg 
qmi_helpers
[    7.630486] CPU: 1 UID: 0 PID: 175 Comm: (udev-worker) Tainted: G    
     W  7.0.0-rc3-next-20260313-00118-gf4f287b6004a-dirty #59 PREEMPT(full)
[    7.630493] Tainted: [W]=WARN
[    7.630495] Hardware name: Motorola edge 30 (DT)
[    7.630499] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[    7.630503] pc : eth_get_drvinfo+0x50/0x90 <..snip..>
[    7.630595] Call trace:
[    7.630598]  eth_get_drvinfo+0x50/0x90 (P)
[    7.630608]  ethtool_get_drvinfo+0x5c/0x1f0
[    7.630617]  __dev_ethtool+0xaec/0x1fe0
[    7.630622]  dev_ethtool+0x134/0x2e0
[    7.630627]  dev_ioctl+0x338/0x560
[    7.630633]  sock_do_ioctl+0xe0/0x128
[    7.630642]  sock_ioctl+0x2cc/0x3e0
[    7.630647]  __arm64_sys_ioctl+0xac/0x108
[    7.630656]  invoke_syscall.constprop.0+0x48/0x100
[    7.630664]  el0_svc_common.constprop.0+0x40/0xe8
[    7.630670]  do_el0_svc+0x24/0x38
[    7.630676]  el0_svc+0x34/0x180
[    7.642931] [pmOS-rd]: /usr/bin/buffyboard
[    7.644473]  el0t_64_sync_handler+0xa0/0xe8
[    7.644482]  el0t_64_sync+0x17c/0x180
[    7.644491] Code: 91094021 94134bd9 f9457680 d2800402 (f9404001)
[    7.644495] ---[ end trace 0000000000000000 ]---

As a "workaround", this works:


--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -113,8 +113,14 @@

      strscpy(p->driver, "g_ether", sizeof(p->driver));
      strscpy(p->version, UETH__VERSION, sizeof(p->version));
-    strscpy(p->fw_version, dev->gadget->name, sizeof(p->fw_version));
-    strscpy(p->bus_info, dev_name(&dev->gadget->dev), sizeof(p->bus_info));
+    if (dev->gadget) {
+        strscpy(p->fw_version, dev->gadget->name, sizeof(p->fw_version));
+        strscpy(p->bus_info, dev_name(&dev->gadget->dev), 
sizeof(p->bus_info));
+    } else {
+        pr_warn("%s: called with no gadget set\n", __func__);
+        strscpy(p->fw_version, "N/A", sizeof(p->fw_version));
+        strscpy(p->bus_info, "platform", sizeof(p->bus_info));
+    }
  }

  /* REVISIT can also support:

..or would that not be a workaround? The lifecycle of gadget being set 
seems kinda decoupled from the lifecycle of the registration (??) And as 
long as it's registered, the dev info can be queried (?)


Thanks,
~val


