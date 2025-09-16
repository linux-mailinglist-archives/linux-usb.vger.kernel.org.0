Return-Path: <linux-usb+bounces-28146-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6A6B59247
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 11:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B96A83AADF0
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 09:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5564929993F;
	Tue, 16 Sep 2025 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArjDQTqV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EBA1FC0ED
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758015140; cv=none; b=VVCg/qBvTiBaOQfmP+9+xOR/wZgyGPOAOf2S6C9nWIwhlQQzGeYJnp/D9KO24Ihby69qaERR09je5QAL8BH28gB21yyCAXqG+WNgCqAaB6g7CKWjOhVLLSTiHmV5i8+NXw+zEqPuhZhxe41vfYeXsKmHoNjCK4wrRp53Z0wOtBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758015140; c=relaxed/simple;
	bh=zfQJRsA+LA4ITkQbu6+e87n6Bc49XsMQknHwjyqUv9c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GML809yXdp/CyUqk6M2k/MrBeq9f19Mf1wSNOZdaN8r+hhsIK+EZROldbItIr9Xu7tNBub+VYnn/4st8auCjYQNQnlLRDfE6qnWCCgM1dIwknPsiicHGJ/snNe29mp68Q9pjITq5jfLQg/xEqMZeDuO3WuRLHp1d1kQs3oaPoUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArjDQTqV; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5720df4acc5so2444376e87.3
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 02:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758015137; x=1758619937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+1XZ6YVjsZLHyKQJw2ypYa4eePmnhA8c1A2h14VXiA=;
        b=ArjDQTqV40gy7Wb9EvGpdD/jyfE00145K0+1GeDlR8pvw966UcAtg/A+P2w1rZ8QA2
         NbdEPJ3HMhEmQx3+1FlhJ3iCSy+i1WRoeBC4R7wig3NP7kFdPcH6JJcFT5vDq3vbbwQp
         HzQCrSKj+F+y4NIGH5evPnCp79QFGpf74/fmOiwmRD/ObBHtkjtzi1UmZPl7FkaS9/Zd
         2ozyzs2vdRMfBmJvDDG9LtgLdlPxOZEnAywZmWRaItpb+xhNO8TeO09K1Ok/O1t+EVFI
         kimwc9/6cl13TAPiT6x3R64DVycKeYQJfCyG9dyO8lEdKTHT4QcW8txAtuZrtjNSwsDU
         pCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758015137; x=1758619937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+1XZ6YVjsZLHyKQJw2ypYa4eePmnhA8c1A2h14VXiA=;
        b=k/Mne/7yK1Idxf/UL3TnRfP6PfLkmAMvmVdn2n1G3C+HqrUqgu9nQ5mEQfMfSMwyzt
         nG9HgzZxHCQ0QA5tMr0eL6LnRZtKYzmoOCdKkSz4m+KgKnCDNa8ohRF2lqI/M6Tvo1P4
         4lye0hwqD7zp9Mq4dNMCthi+4Bn/vxBPiiCIoofRNUF33MF4PZ12rHAagKXSsZ7Bu2zj
         awoRvrPuH+7HDLyHih7PnziB8746TTxekOO9QoaAck77G3rObqjlcBMxvsz6KpprweJ8
         pqG85BKnyPHyZhRn+F6HGyYfMhoSBUfQ7A6g5bWbehUo7dkU1w+o1nIW6htG/wcsXq18
         573Q==
X-Forwarded-Encrypted: i=1; AJvYcCWASN9hIAwOOXEDh04pTmTDpnRpcFhXCeMkly2+642qXSa0ZrCSgIMYnOxWxuxxiXEaZKz40jg3cwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZpIQp5U/uAmRpysfgMYIWzF5GXEVABR52wuOxi01c/AjoGaof
	oCV8K2MIJbfhBhX8YZWoy3Xj1c+TducqWYCUpoqZdQCV5lbMiUfv3u0yHQ8asg==
X-Gm-Gg: ASbGnctS6O8/03X0VaRvhzZ5bWwo1P99RTNM4ZNNJTBzCIFBWYZHsmayZzPahBjRzG9
	VxpdAlTTq8odXkIPZ6nffxubb7rg3YWdiCDtVqEn+aC5Hg2BQp9/6BzFuV1MO4GD7ZTmj3qMmwj
	t2nWXlGnFujFN0JH5X2aFVFj+Wfm8sFfw0xSHgw7cfonC0u8EQ2avoaOthJ9oN7AhdCa9Cg6UT+
	Ms7pMwSHW7FlLhid07iOua2NWTQscMQzWVkenF09fob03qTazj2uTkN3Tl4l6cmFb4dmu9npEkj
	ufRy9ghLNQSdWJq4bdKsTIHuhtbUbiCJllJUxyqUyLUxOwrBDdrbJgd595rqTo4iDqK+tqO4q5Q
	FKeGPDFk1s1C9LI4qGZHZsMYByZwZCaRJYOk=
X-Google-Smtp-Source: AGHT+IHTGje7YAVnYVn1mYkdcXcffNOIvl6l2TWXo/r7Ayse0x+tqM2Bppe/bVUPUdFsXFvRGWYOeg==
X-Received: by 2002:a05:6512:6085:b0:55f:6a72:5679 with SMTP id 2adb3069b0e04-5704f7a3670mr4345556e87.34.1758015136708;
        Tue, 16 Sep 2025 02:32:16 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e65564946sm4321175e87.127.2025.09.16.02.32.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 16 Sep 2025 02:32:16 -0700 (PDT)
Date: Tue, 16 Sep 2025 11:32:10 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
Message-ID: <20250916113210.11b77abd.michal.pecio@gmail.com>
In-Reply-To: <b5631366-e3a3-4bb8-b543-c9c0be12589c@linux.intel.com>
References: <20250909115949.610922a3.michal.pecio@gmail.com>
	<aMAPkH5-4rLdmx_9@smile.fi.intel.com>
	<20250909224416.691e47c9.michal.pecio@gmail.com>
	<20250910075630.0389536f.michal.pecio@gmail.com>
	<aMJ9PbOxn3CCuaYJ@smile.fi.intel.com>
	<20250911113451.1f5e5ca4.michal.pecio@gmail.com>
	<aMMtgsAa-dovMqdG@smile.fi.intel.com>
	<20250912114644.7b9bfe37.michal.pecio@gmail.com>
	<aMRgL4fus--v4QjP@smile.fi.intel.com>
	<20250913101246.515abfc4.michal.pecio@gmail.com>
	<aMe-QcrnE5hMHC5E@smile.fi.intel.com>
	<20250915122251.333b4db4.michal.pecio@gmail.com>
	<b5631366-e3a3-4bb8-b543-c9c0be12589c@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Sep 2025 15:32:32 +0300, Neronin, Niklas wrote:
> On 15/09/2025 13.22, Michal Pecio wrote:
> > 
> > The issue is how to print u64 and dma_addr_t, and the suggestion is
> > to stay with ("%08llx", (u64)addr) for both. What should go wrong?  
> 
> I agree that printing long 64-bit hex values is annoying. However,
> "%08llx" is not the common format for printing DMA addresses,

I'm not sure if there is anything special about DMA addresses which
makes them different from any other addresses. And if I run 'dmesg'
on x86-64, the only addresses (of any sort) that I see printed with
padding are the memory map table in early boot and GPU drivers.

Both are understandable, because the map has entries from a few KB to
a few GB and it is more readable when they are aligned, and GPUs have
lots of memory and addresses. 

Other drivers don't bother. The %pr 'struct resource' format used in
various places doesn't bother: [mem 0xcff80290-0xcff80383].

IOMMU drivers from Intel and AMD don't bother:
https://bugzilla.kernel.org/show_bug.cgi?id=220069#c63
https://bugzilla.kernel.org/show_bug.cgi?id=215906#c0

These are DMA addresses being stored as u64 and printed with %llx.
And they can be the same or related to addresses logged by xhci_hcd,
e.g. if transfer ring is accessed out of bounds (commit bb0ba4cb1065):

[ 1.041954] xhci_hcd: Miss service interval error for slot 1 ep 2 expected TD DMA ffa08fe0
[ 1.042120] xhci_hcd: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0005 address=0xffa09000 flags=0x0000]
[ 1.042146] xhci_hcd: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0005 address=0xffa09040 flags=0x0000]

> I would agree on another format if it is consistently used
> throughout the xHCI driver. I chose this format because it's the
> most common format.

I guess it will ultimately be for Mathias to decide.

My arguments for staying with %llx/%08llx are same as before:

1. We can control padding to suit practical needs, such as:
2. Same rendering of same numbers in u64 or dma_addr_t types.
3. Consistency with *real world* dmesg output.
4. Can be passed by value, no temp variables for each trb_virt_to_dma()
5. Can be type checked by compilers (see below).

Disadvantages:

1. Needs casting, IMO it's still better readability than problem 4.
2. In some cases (64 bit, no IOMMU or passthrough) address length will
   vary a little. IMO not a dealbreaker in logs, but obviously tables
   like debugfs/event-ring/trbs should stay padded and aligned.
3. Pedants will compplain that dma_addr_t should go with %pad

In my opinion it's a trap - %pad may look like "just the right format
for this type", but in reality dma_addr_t isn't a standard C type, but
a hack to use different types depending on CONFIG options.

To make this work, %pad defeats type checking by pretending to be just
a pointer. Tools assume that its value will be printed, but in  reality
it will be dereferenced. No type checking is done on the target type.

This compiles, works on x86, and is wrong:

	u64 addr;
	xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
                       "Set TR Deq ptr 0x%llx, cycle %u\n", &addr, new_cycle);

Existing %llx can be fixed by adding (u64), and the missing cast
could have been detected years ago with this trivial change:

--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1785,6 +1785,7 @@ static inline bool xhci_link_chain_quirk(struct xhci_hcd *xhci, enum xhci_ring_t
 /* xHCI debugging */
 char *xhci_get_slot_state(struct xhci_hcd *xhci,
                struct xhci_container_ctx *ctx);
+__printf(3, 4)
 void xhci_dbg_trace(struct xhci_hcd *xhci, void (*trace)(struct va_format *),
                        const char *fmt, ...);


On a more humorous note, I really became a hater of %pad after writing
a patch which logs [sw_dequeue/hw_dequeue/sw_enqueue] for each command:

25/0 (042/3) [fff47870/fff47871/fff47890] queue_set_tr_deq stream 0 addr 0x0x00000000fff47890
25/0 (041/3) [fff47870/fff47891/fff47890] handle_cmd_completion cmd_type 16 comp_code 1

You wouldn't want to see this with %pad. It's bad enough that there
is a %pad at the end of the first line, I'll need to fix it ;)

Regards,
Michal

