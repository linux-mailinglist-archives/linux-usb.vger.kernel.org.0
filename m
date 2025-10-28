Return-Path: <linux-usb+bounces-29770-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8293C14059
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 11:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 223FF19C70EF
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 10:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E682C3769;
	Tue, 28 Oct 2025 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAyWQPZV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF951397
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 10:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761646410; cv=none; b=tK2TIrBceayvt96w4t/ZX/Z7Uq5iEKx/sDW/hhNWBVq2sqw4ql3QqnZ9wNz1TuGv1b5EwuWLvLGqvB1FGNarmX+dpJtKEnT/NZE+Bt3CPINqS6BNAeBWQWY8Iwa3oLQ8YWgQIZyh0ITqWClrrgQXfufdjbcUhpUaez42ZgSSD0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761646410; c=relaxed/simple;
	bh=eb7NieRXPw5rfNHtQpicDjiLwHjMcFF4lBFKQTS/C/o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RCH/g5VTXi8SZOvQ5QeXQbj2uzy9zygv6CdwGsqiD0Rh5s96oh9INgo69MfIiATPc30IocnIzaC+GU7dYX96TmbRtuy6Uclh94PePT7JdkucdF5xXmxGT+jzU6Jlmw/GhpKqtS9eTlbuL/yMuzwrvCLDJ8gEw6QBHT41oNZVPJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAyWQPZV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761646409; x=1793182409;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=eb7NieRXPw5rfNHtQpicDjiLwHjMcFF4lBFKQTS/C/o=;
  b=HAyWQPZVfHf7IwjrKaqU3RKTjdSh43iXkp+kuq/6kUCWCvOAYUk0FpPJ
   zPfQ2pD5h7gapjGoORkw/M+T3mPVp15m08dfQAa0/Fk7lAvBNj16NNSnF
   azBKuMs7sCMxrfyIz47euDqK5Ni7B/GQv9KPH07R4je9jFQI42mXQaI/t
   MdpvgQiMGE0AI6DXYCYqLasuYMPlMBvztWZ+iqLWQaKRIU45Ngs5rc2MF
   1QJEEg1Nf+tL1P/74QGrMjSWLRE5stzqPzG/Sov+IF5njp/eIQQCDOa+G
   48VueAnTXd7bKmo1BMvTL44lplkF9oAD4+pqVPADJnXcpA1MFS1i0l/o+
   A==;
X-CSE-ConnectionGUID: iK93yO89T5C3FiipyRa2Pg==
X-CSE-MsgGUID: ZHa3tPo1QTi9YpZwVYx2Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81372829"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="81372829"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 03:13:29 -0700
X-CSE-ConnectionGUID: Cv1b8LSTQsy7zPjujGcV1w==
X-CSE-MsgGUID: YIQss2McS4q3PEvbHNkLQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="189664212"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.148]) ([10.245.244.148])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 03:13:28 -0700
Message-ID: <ba3692e7-6818-41af-8748-71a91cb13db5@linux.intel.com>
Date: Tue, 28 Oct 2025 12:13:25 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: USB DBC hang during earlyprintk initialization
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: Milan Oravec <migo.oravec@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <CAAcb1K_MJKWz+BYJmx0FDgrBOzzXm71-M7sgHDUOmBRppXWNzA@mail.gmail.com>
 <CAAcb1K_bezseTM8DrOrzVUi_W+nZoE2N0CO4k3AQWPw7=7pyjw@mail.gmail.com>
 <2025101544-galore-sculpture-b243@gregkh>
 <CAAcb1K85GK6m_bVUeSfX1GP4=mxzwfmHtaRX0EYD_jgGfQRk9Q@mail.gmail.com>
 <4e6d9b62-b9d0-4a05-99a9-143899547664@linux.intel.com>
 <CAAcb1K_a2dkj5wv__1BW-fu_Zg=z00OmQzJmekQ-GH4svYQ-GQ@mail.gmail.com>
 <f0d0f71c-bc47-4348-85a6-d728a67c982a@linux.intel.com>
 <CAAcb1K-o7DY3Kvqdr+=MN8OsgRZr+g43-zC6YSLG0hbNxEQUeg@mail.gmail.com>
 <8fe27842-8155-44db-b262-a148b5ce5436@linux.intel.com>
 <CAAcb1K9MDvqJgVbV29ax8tQhXoepJr5ABuh1NHoNpmFdnGxVHw@mail.gmail.com>
 <65b65e02-e51e-4e7e-ae9e-78d755eb8566@linux.intel.com>
Content-Language: en-US
In-Reply-To: <65b65e02-e51e-4e7e-ae9e-78d755eb8566@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/25 11:34, Mathias Nyman wrote:
> On 10/24/25 21:48, Milan Oravec wrote:
>> Thank you, should try this patch against stable 6.17.5 or 6.18 branch?
>> It fails with 6.17.5
>>
> 
> It was on top of 6.18-rc1, but should apply fine on 6.17.5
> Tried myself, saved the email as patch.eml and applied with patch:
> 

List was accidentally dropped.
Milan got patch running, DbC tried ioremapping smaller and smaller size until it was successful.
DbC capability was within successfully mapped size, but DbC failed to start properly.

Log:
[    0.000000] Linux version 6.17.5-dirty (migo@migoG17) (gcc (GCC)
...
[    0.000000] xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 1
[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at mm/early_ioremap.c:139
__early_ioremap+0xae/0x190
[    0.000000] Modules linked in:
[    0.000000] RIP: __early_ioremap+0xae/0x190
...
[    0.000000] xhci_dbc:xdbc_map_pci_mmio: Failed to ioremap xhci-dbc with size 0x100000
[    0.000000] xhci_dbc:xdbc_map_pci_mmio: Retry xhci-dbc ioremap with reduced size 0x80000
[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at mm/early_ioremap.c:139
__early_ioremap+0xae/0x190
[    0.000000] Modules linked in:
[    0.000000] Tainted: [W]=WARN
[    0.000000] RIP: __early_ioremap+0xae/0x190
...
[    0.000000] xhci_dbc:xdbc_map_pci_mmio: Failed to ioremap xhci-dbc with size 0x80000
[    0.000000] xhci_dbc:xdbc_map_pci_mmio: Retry xhci-dbc ioremap with reduced size 0x40000
[    0.000000] xhci_dbc:early_xdbc_parse_parameter: Looking for DbC capability at offset 0x480
[    0.000000] xhci_dbc:early_xdbc_parse_parameter: Looking for DbC capability at offset 0x490
[    0.000000] xhci_dbc:early_xdbc_parse_parameter: Looking for DbC capability at offset 0x4a0
[    0.000000] xhci_dbc:early_xdbc_parse_parameter: Looking for DbC capability at offset 0x4c0
[    0.000000] xhci_dbc:early_xdbc_parse_parameter: Looking for DbC capability at offset 0x4e0
[    0.000000] xhci_dbc:early_xdbc_parse_parameter: DbC capability found at offset 0x4e0
...
[    5.018291] xhci_dbc:early_xdbc_setup_hardware: failed to setup the connection to host

Milan, can you add more debugging into early dbc, showing in detail where it fails.
On top op previous patch:

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 9a7f3f12f18f..dc372f028dc3 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -29,11 +29,7 @@
  static struct xdbc_state xdbc;
  static bool early_console_keep;
  
-#ifdef XDBC_TRACE
-#define	xdbc_trace	trace_printk
-#else
-static inline void xdbc_trace(const char *fmt, ...) { }
-#endif /* XDBC_TRACE */
+#define	xdbc_trace	pr_err
  
  static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
  {
@@ -568,35 +564,42 @@ static int __init xdbc_early_setup(void)
  	ret = handshake(&xdbc.xdbc_reg->control, CTRL_DBC_ENABLE, 0, 100000, 100);
  	if (ret)
  		return ret;
+	pr_notice("DCE successfully cleared");
  
  	/* Allocate the table page: */
  	xdbc.table_base = xdbc_get_page(&xdbc.table_dma);
  	if (!xdbc.table_base)
  		return -ENOMEM;
+	pr_notice("Successfully got xdbc table_dma page");
  
  	/* Get and store the transfer buffer: */
  	xdbc.out_buf = xdbc_get_page(&xdbc.out_dma);
  	if (!xdbc.out_buf)
  		return -ENOMEM;
+	pr_notice("Successfully got xdbc out_dma page");
  
  	/* Allocate the event ring: */
  	ret = xdbc_alloc_ring(&xdbc.evt_seg, &xdbc.evt_ring);
  	if (ret < 0)
  		return ret;
+	pr_notice("Successfully allocated event ring");
  
  	/* Allocate IN/OUT endpoint transfer rings: */
  	ret = xdbc_alloc_ring(&xdbc.in_seg, &xdbc.in_ring);
  	if (ret < 0)
  		return ret;
+	pr_notice("Successfully allocated in ring");
  
  	ret = xdbc_alloc_ring(&xdbc.out_seg, &xdbc.out_ring);
  	if (ret < 0)
  		return ret;
+	pr_notice("Successfully allocated out ring");
  
  	xdbc_mem_init();
  
  	ret = xdbc_start();
  	if (ret < 0) {
+		pr_notice("Failed to start xdbc ret: %d", ret);
  		writel(0, &xdbc.xdbc_reg->control);
  		return ret;
  	}


