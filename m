Return-Path: <linux-usb+bounces-34139-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJewNw96qmkqSQEAu9opvQ
	(envelope-from <linux-usb+bounces-34139-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 07:54:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E9021C31B
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 07:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E311A30138E6
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 06:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57396371CFD;
	Fri,  6 Mar 2026 06:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="UJxP9mLO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427D2366DA6
	for <linux-usb@vger.kernel.org>; Fri,  6 Mar 2026 06:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780039; cv=none; b=Cbb1OPqqLtrwiEtuTZ6jyK04MiUAiJFH3aiy08NkIAftE77zCnGKmklbTH8aoGOdH09AtL19n7QucZvdRuXX5ZFTed+YjRYU403+UdV2eazUUkoNC4ciGQBQmENhEpoww029btcZftxknskWU01moz0OXRcZuT5KIJR7MO81Els=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780039; c=relaxed/simple;
	bh=UmqeSGwzEBCBRaxrskLUBJMTxFfxdFkJyYujzmYcXvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VaVCdr1ItwaXgKVMoxFZcWPOzvtqZppfa0tf1YP5KZYeULOf1JhHe3H24DJU3MPu/23KZc3CvyUReDcwKBbfnzVg421xPEQ11k83ltV062/DbRFMBrejR3f2DsAlos62IGUfHoDEhAWqqNEeka1dyKKMSZdI8Cux0g99jnWypso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=UJxP9mLO; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1772780025;
	bh=aCiMpveZMUVZNoMAY2uEkm3tMRJFVR9XCxYReV81L2c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=UJxP9mLO0KaycIEoc4wXYYX4//YdJzNj/54+bi8xfELWTxtfU36DVXGj3xYx5GLPT
	 q73fiBT//65x/7ZC/ilnuUeYU/mGHXlYrOuMAy6gCYU98zkIF185f9j1bCaVpo48UG
	 HUvjGTE4iN5yCgZTi0RQ66LrH9wz/WvvrSRAidp0=
X-QQ-mid: zesmtpip3t1772780010t3f7ca002
X-QQ-Originating-IP: 3pFm0L2kT9W0NJ7gZAABlKnKk7Fo6qe5DCp+2onnwHU=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Mar 2026 14:53:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4585382715701238331
EX-QQ-RecipientCnt: 5
From: raoxu <raoxu@uniontech.com>
To: niklas.neronin@linux.intel.com
Cc: Thinh.Nguyen@synopsys.com,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	raoxu@uniontech.com
Subject: Re: [RFC PATCH 12/12] usb: xhci: prepare IRQ handler for multiple interrupters
Date: Fri,  6 Mar 2026 14:53:28 +0800
Message-ID: <F00CC1FC21F2B9DC+20260306065328.2394460-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260305144824.3264408-13-niklas.neronin@linux.intel.com>
References: <20260305144824.3264408-13-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NDEWz+EAQ5h+llAX+yr+cW9V6Dl6JaS4q96PVwPylFjuqRFJt/6ZJTdV
	kXJu/Z0AEXjDM6l9FC9N6vz57hb3mvJ3TfRviNquJjPgdbRy3ETKsAiRvbnXUmJVNRqUnQj
	EePilCYeV/aVL2Lr7+ao1SqvaTk/j+rffKuwJRndSzZUUTIlY9wR8OifhM71Bizeq6ytulg
	Dlo5Q6eVWqzEUYuAFHEWECoutbY6nxIG4lV7EUvdfgTolNEgBmemMQIBFN8ghDIBl9+9W1x
	AfB/Ag/l8BRl1yPDHfRwT0c4BuRYNX6fg7/J0Owuxl5RdxON7wEhDtSTjNlrzsQFpZO1LPr
	av9epXNvd5+KtmVNzDlsOD98GKMjWSQ9ZcMeDuYM7o65l7vxhoVjESDIU+oRR36Cyuw2MpP
	JPghsVcxaG65X2SPkfYZKwm1DI9cd6bBg/a0TbG2Q4xkxnzLoTrqECbDHAh1875PDl7ZMeP
	ysQzXFfxY+IFZspGfzG65yno0HXWAR0qcX/Mgf/q5SRNBPks+xQhwoqQT+8zl4xdsEYvnlQ
	8acSIfpZMFoY2YItad80+acQEFMOKIkJk7MFVZ6x6Y8+sH8ujnWRFaHmypZZQriOdh9z/wU
	zywhaBWNJrXP9xPpTp1QehJilOsYtO09KPhgic3qLz1yz/T7JrmwUvrfOO58KocBYaptAlX
	EX2Jw6u/MfFb82Lrl34znBM42RoF8xYOz0q5IJlKqVv/MCWhjn2r11dhBmFFP2MeakeuS5X
	YJ7yZkPbPu4jKVM3aaxh/hvF3CJ3GXpGSu52R/fML9gmdbg7dQQ56Gi2HVKRijy4+Kz0V8z
	yvT05yL2kt/TRuVet7eSLArsP0bTvfgNitdSeRLfabHX8KTj78+ucAMx5m1DpNu4/6GOlYA
	J3zQmgof2Vn8QM6BUuA2sh7w30mH+jOn8EHzyuaSBySu7/d72+5nOdaOQdzd4I1eRjInSfR
	L6rSirlN3FEGvWmgAHcp53U+SPRRWu4N4nE1NBGEoPf7k36dcE2l+2eBbOkxrXtxn5p6OoF
	yiIULDlK1eNFFBxx1wmKLDwfdBrb3PuujtD4cOaw==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: E1E9021C31B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34139-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:dkim,uniontech.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu,  5 Mar 2026 15:48:19 +0100, Niklas Neronin wrote:

> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index a6fde127c569..30eb0a79ef20 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -2331,6 +2331,7 @@ void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num)
>  	u32 erst_size;
>
>  	ir = xhci->interrupters[intr_num];
> +	ir->xhci = xhci;
>  	ir->intr_num = intr_num;
>  	ir->ir_set = &xhci->run_regs->ir_set[intr_num];
>
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index ea43b0153430..c1b8062c5467 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -175,7 +175,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
>  	}
>
>  	ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd",
> -			  xhci_to_hcd(xhci));
> +			  &xhci->interrupters[0]);

It looks like the IRQ free path should be updated to
use the same dev_id as request_irq(). If request_irq()
uses &xhci->interrupters[0], then free_irq() should be
changed accordingly as well.

> -irqreturn_t xhci_msi_irq(int irq, void *hcd)
> +irqreturn_t xhci_irq(struct usb_hcd *hcd)
>  {
> -	return xhci_irq(hcd);
> +	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> +
> +	return xhci_irq_handler(xhci->interrupters[0]);
> +}
> +
> +irqreturn_t xhci_msi_irq(int irq, void *data)
> +{
> +	struct xhci_interrupter *ir = *(struct xhci_interrupter **)data;
> +
> +	return xhci_irq_handler(ir);
>  }
>  EXPORT_SYMBOL_GPL(xhci_msi_irq);

This approach does make the code simpler, and together
with patch v9 it seems to work. However, it also feels
somewhat fragile to me, since it now relies on the
interrupters array remaining stable across the relevant
resume/reinit paths. That may make future runtime
reinitialization or rebuilding of interrupters harder
and reduce flexibility.

Thanks,

Xu Rao

