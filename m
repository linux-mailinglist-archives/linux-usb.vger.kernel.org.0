Return-Path: <linux-usb+bounces-37078-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBtXAoJt/GkQQAAAu9opvQ
	(envelope-from <linux-usb+bounces-37078-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 12:46:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FD04E6F9E
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 12:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 858BB3020D5A
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 10:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958FE3C7DEB;
	Thu,  7 May 2026 10:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buFLUTYs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8703264C2
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 10:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150773; cv=none; b=aRLyOZ5KLe1pPniRnZxNVfXZR7TXgYPMJaxkrhtfRCddjVDLTXKeDL/O+tfKDaGiEZhZQPwvRjRbF/9e+w5hpw4kW+Oq8actVbvVHroJ4IpyCjrNlobEt1z6T4HJXdCG3R+FsQbOvAo9KkGSHbkreGopAm8u53C6UYT/Hjc+82k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150773; c=relaxed/simple;
	bh=IpnQCAN2BL5UB6TQUTVwndlNHcb8l5UOE/u4Tph+Dnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkMN1y+oqfTDSkfQQanNoyGGjHDWSSMerVXmMScl4WsdQtDqc1e3Ip4BdqqM5bmtoQsd8yRqHSpGxTJXVk+++53w8vxudkNd2cUTbYRNCsOLszY1GkhVrokqyWhgWf41itP4YdzmoUkGgaBI3g4b4Er3rIRtLLoJMXCK+1KO2Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buFLUTYs; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso4804755e9.0
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 03:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778150770; x=1778755570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ox+ASz/ygCGbDPlwbrM1KbYJZn86PmGYPGqT1vetcCo=;
        b=buFLUTYsSGXZquFWkdfXLJH3Ad+OFLlJOdFaAAfFvPGtgieoiu2oeaZlUtB9L28OyI
         lS9SUKyFxbeekakNnXSm4tu+90UiDzfkLpOIOTf5WJdR08iuI4e0CiTtiPYlPLTIhg1i
         Fi9yI77KeeLb5rjeUjsamplSibHM2AT0HQ4BOJzSY7t+y1PmLRVMp3dFfAbw2uE0N2Ro
         HaUTWFtODJMtAmCiRWxrvZrAI0EAgitXmWBdVHdcn3aoXnBYiLngtxw2Hb9wAArtH9jC
         pv8hBbL+Irv+8zETvFrYIOiXj9UA8Q4JDU+QEM0Yf/TcT3nkc2lFposZL8ELPJn4UemQ
         Aj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778150770; x=1778755570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ox+ASz/ygCGbDPlwbrM1KbYJZn86PmGYPGqT1vetcCo=;
        b=FbkLAtfA05zmYpEhiYd0/tqV+jjQilGvxNh+eikAfdyQmoP06WFqAdNkurq2VP+L+x
         C2RgKL8PHQo32NijRYAGWlg5rBKOLuQjHUb6h2jq9LKHWs0vgmBCS2d0RApF4ItXjhNV
         OSAdvXvdYTaNIsXQFgziKYfX0u93gwxGBZpVdnPH9IAwZcP0KdLmk+vy5R8oe3X2X57+
         ynl77waxNreZd5qNac7IJ/aRk+o6W2+jOxN5//3k+qrAf35u8UBOEchbn9YitJLh4EeC
         b/I/Q2woBIfJqWLUnZskxppNRDzLY6N5cgVC9I/Z/jGMrxyAmTLe9geZPXNuStUljPVP
         jt4Q==
X-Forwarded-Encrypted: i=1; AFNElJ90ryZrHxGcTCnZBq96nIGYrOSLzgfRbgx5lgPF0yUQfvEK5iupH1WT23cN6ECkKrhvBX+ZCkBsYqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpNZKXeuNe2UBc2jz4a2MunuW5+0+9dl7zKX+2RCCtPUYRYqhf
	ILAMlQ7SOd8ovGDgaQr6sexkYsLwMny2IZgB033TRtXGmHtZpTk+GCJx
X-Gm-Gg: AeBDieuDZwt0HAzA9wFXnteesBJM6CcLAMMdz4rCaYjey12GUdpvHG8xLmTNtc0324a
	EoB7irYQpVtQi6a3uM0EaoxFno0ETriEPXjF80pAJFyueueKj9b2iARfV391C/Q4z59spaT0s4k
	VHObPQfEdv7opcYyVSTHQCZsIRjyO9bCtpMxXcoBeJPV+rLNKzk7ae6J/72WbLb5O2cVq2ed1QQ
	ohfq9rOlrJ2f6K8vza3WdzVXz49ayumrlJhwsGWhmoka3ZvrAhfF2hImU0upLpTndIFynXMy4ul
	n0aFwmr+oklIiMIuvHgckjxU0djS2pYgcWiq+yzaSsJoHU+f2PzaNNlsSCxLv8X8K+zoQHLOlFv
	yVCH4CiAISjv5O58svswW8byyh71c6vdxWzFyaJpS+LHawvIUm1Z3Bb/v4hxz5F+WHV47XFmNtf
	Xa/f5WZPZmq3dVEIQkQrof9TY3LlFeb2Qcs/+V7RNsSh4jyT6AVYMPRx7M0vJJr4oJ3swXpvy11
	A+0emknxX1QNo0NsemiNHwISlvjYzO+MM6oqPOR4HbIXT3hMGewyfVEGJgpYk6LM7RWO5V2L2Pn
	dEnADet8
X-Received: by 2002:a05:600c:8b04:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-48e51f183demr114547455e9.5.1778150769818;
        Thu, 07 May 2026 03:46:09 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538b6e9bsm197646665e9.10.2026.05.07.03.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:46:09 -0700 (PDT)
Date: Thu, 7 May 2026 12:46:08 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, jun.li@nxp.com, 
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v3 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Message-ID: <k2sxmwhrv3tivustfnpz54ehuufkcrcruu2uuukuyugqtqljzl@5roxndm5fn5u>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
 <20260108081433.2119328-3-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108081433.2119328-3-xu.yang_2@nxp.com>
X-Rspamd-Queue-Id: 63FD04E6F9E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37078-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[synopsys.com,linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,dolcini.it];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fraschnyder@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,synopsys.com:email,nxp.com:email]
X-Rspamd-Action: no action

On Thu, Jan 08, 2026 at 04:14:33PM +0800, Xu Yang wrote:
> Do dwc3 core auto suspend enable for device and disable for host
> , this can make sure dwc3 core device auto suspend setting is
> correct all the time, the background of disable dwc3 core device
> auto suspend is to make its parent device suspend immediately
> (so wakeup enable can be enabled) after xhci-plat device suspended,
> for device mode, we keep the dwc3 core device auto suspend is to
> give some wait for gadget to be enumerated.
> 
> Note: It's a temporary solution until we switch to using the new
>       flatten model.
> 
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Hi Xu,

We have a kernel issue introduced by this patch on an iMX95, where we 
use the dwc3 usb as otg. This appears to be due to a race condition that
occurs during probe, when the parent attempts to access the driver data
from the dwc3 child. I saw your work on the new flattened model driver 
for the iMX SoCs and that it will soon be applied to the iMX95 as well. 
Does this mean that the issue shown below should no longer appear, as 
there will be no parent/child dependency?

Do you think there are any actions needed on this patch?

Here the warning with decoded trace:

[    6.905882] ------------[ cut here ]------------
[    6.910518] WARNING: drivers/base/core.c:1640 at device_del+0x2b4/0x384, CPU#4: 5/87
[    6.919309] Modules linked in: libaes(+) tcpci(+) ulpi tcpm phy_fsl_imx8mq_usb(+) gf128mul snd_soc_simple_card(+) ehci_hcd imx_pc4
[    6.964627] CPU: 4 UID: 0 PID: 87 Comm: kworker/u24:5 Not tainted 7.0.0-rc1+ #2 PREEMPT
[    6.972716] Hardware name: Aquila iMX95 on Aquila Development Board (DT)
[    6.979409] Workqueue: events_unbound deferred_probe_work_func
[    6.985247] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    6.992199] pc : device_del (drivers/base/core.c:1640 drivers/base/core.c:3882)
[    6.996028] lr : device_del (drivers/base/core.c:1634 drivers/base/core.c:3882)
[    6.999865] sp : ffff800080b339f0
[    7.003169] x29: ffff800080b339f0 x28: 0000000000000000 x27: 0000000000000000
[    7.010295] x26: ffff00008004ac28 x25: ffff0001ff067610 x24: ffff00008befdcc0
[    7.017427] x23: ffff000080ad8810 x22: 0000000004208060 x21: ffffa5bb53ea78f0
[    7.024560] x20: ffff00008befdc10 x19: ffff00008befdcb8 x18: 0000000000000000
[    7.031693] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[    7.038825] x14: 0000000000000004 x13: ffff000080129910 x12: 0000000000000000
[    7.045958] x11: ffff0000822ac0e8 x10: ffff0000822ac000 x9 : ffff000080129910
[    7.053090] x8 : ffff0000822ac028 x7 : 0000000000000000 x6 : ffff0000822af458
[    7.060223] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
[    7.067356] x2 : ffff00008253e580 x1 : 0000000000000003 x0 : ffff0000895d1400
[    7.074485] Call trace:
[    7.076923]  device_del (drivers/base/core.c:1640 drivers/base/core.c:3882) (P)
[    7.080754]  platform_device_del.part.0 (drivers/base/platform.c:794)
[    7.085458]  platform_device_unregister (drivers/base/platform.c:593 drivers/base/platform.c:835)
[    7.090164]  of_platform_device_destroy (drivers/of/platform.c:621 drivers/of/platform.c:607)
[    7.094950]  device_for_each_child_reverse (drivers/base/core.c:4048)
[    7.099922]  of_platform_depopulate (./include/linux/of.h:208 drivers/of/platform.c:644 drivers/of/platform.c:640)
[    7.104282] dwc3_imx8mp_probe (drivers/usb/dwc3/dwc3-imx8mp.c:291) dwc3_imx8mp
[    7.109588]  platform_probe (drivers/base/platform.c:1449)
[    7.113260]  really_probe (drivers/base/dd.c:583 drivers/base/dd.c:661)
[    7.116833]  __driver_probe_device (drivers/base/dd.c:803)
[    7.121199]  driver_probe_device (drivers/base/dd.c:833)
[    7.125385]  __device_attach_driver (drivers/base/dd.c:962)
[    7.129831]  bus_for_each_drv (drivers/base/bus.c:500)
[    7.133663]  __device_attach (drivers/base/dd.c:1035)
[    7.137494]  device_initial_probe (drivers/base/dd.c:1088)
[    7.141671]  bus_probe_device (drivers/base/bus.c:576)
[    7.145502]  deferred_probe_work_func (drivers/base/dd.c:125 (discriminator 14))
[    7.150035]  process_one_work (kernel/workqueue.c:3286)
[    7.154047]  worker_thread (kernel/workqueue.c:3352 kernel/workqueue.c:3439)
[    7.157791]  kthread (kernel/kthread.c:467)
[    7.161030]  ret_from_fork (arch/arm64/kernel/entry.S:861)
[    7.164610] ---[ end trace 0000000000000000 ]---

Best regards,

Franz

