Return-Path: <linux-usb+bounces-38158-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAmGMv5wGWqNwggAu9opvQ
	(envelope-from <linux-usb+bounces-38158-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 12:57:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D32601304
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 12:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 092BC3067210
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 10:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080AE3C4141;
	Fri, 29 May 2026 10:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnvIs9yi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A53A368D42
	for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780052004; cv=none; b=hcD2GRb2FyZX7vY5rCETKX7OrJCm2CCFhwTDG33UIaVsRguIEPvqgj4P2eMdBt9DR2aQS6K4QtF3tlGOMXTu42zs2GbyHyrfLFEQiIJ7t2nFhMjizY6mU3+QuTSyI1Tx6lqC9fGxiovSIBQZNVhcROqcta9iO9B6A5sZO4jYS4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780052004; c=relaxed/simple;
	bh=6qDO5NeYuPjhhaVOaAQhzpOMue+EBBSXHrkLxRCXuDU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LbmqZb5jcYxTM0sSMYcYKzGCXyY9ttOZCRfX+VQooWHsJRS6bdUFJNL00eDMCC/RGCaZ4nBGh2AXQg/WNL5orlMPz3f+eJSycn+VniKVWHVRYWROeBUeqU4HxS8435cjr2VkXRZZilEhw0TNxpadeGS9flbZHtViUYWhUvfONM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnvIs9yi; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49039a8851fso81788135e9.2
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 03:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780052002; x=1780656802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sE8OKGeWzsCFxSp/KVg1O2OG0DZJS50PRPXMOSdqBk4=;
        b=AnvIs9yioGNktwkg+UZKROLYTc+YpP9jxIscd3AjOOAYa22BR7j7v4CThhl1QgpA8G
         PLo0Q871b8G2blXsdYJdGTtsTZGNw6RbqJwecH7UqveE0dZhQghHTodtAvWXR6ukF1wq
         l9Q/M0IvGKw6k1y3puwZdvk7mndbpT08bnLkXqBZ3D35zMhOgPJPZvbNyMYjJO3r/RLv
         9jDQbo7oXFctlT2LGh2L4YOab4hk1C2qZ5U8+01ZrrQ6XVuKhOA01bZRjWfcgDqbk9XZ
         mBCfeJmkiyfUXho/4oVWccgeq2k/jbPDAOdbCOLw6mwmEW8hJNUuPWmdm3I/62IUhlbC
         +Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780052002; x=1780656802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sE8OKGeWzsCFxSp/KVg1O2OG0DZJS50PRPXMOSdqBk4=;
        b=CmdZDTz5zo6mqJHaz505lfrX9+aJRbNfx29yXaQfnd6yEC40CTiwwaV1kluYpBTDr5
         5iJQ8My/q0+fHG1Aa1CdfniB3gxnUh6bFbdqvh8s3c9EVBTdCOH5u8UZpjB+0tlO/Ikh
         FabqSXeJVi9wGPSG+xWys2sHLxdaZTcxDVm6UlCLovQpuq2xVxq9pSa69gXnd6NiR3bW
         2ySdCP1AJwzdWyUfUk8ss7UZE6+PElObBfMRHjNxubNSD377UtxBDV7dYUvS2ygV7Ua+
         OFNsxyhyVTwsUWhBZcbbZqQ5b7j6ueMzkCXxuzRWR1xmVxi/2gSIkYhqS7vBayGu7SBm
         vtIg==
X-Forwarded-Encrypted: i=1; AFNElJ8qye0DzZ+46V0fV/3apdQM34TqeTBjavm6dSw6gEPckAWNR+xj9ohGo878r0Jxz/QxeiVcCxg5a8A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1GcaYtTRLDqdr+0TLg2CB+z66lvscjXIQhhv35dYGj99sBBGr
	3PKApvNVQFO04vecVmOvdcOmz/xLcIXIrjsE35sUcS38cWvNsxspCAPF
X-Gm-Gg: Acq92OFu3uRyw0ELCIZJKhn/2+8v8bo+ZqHVbbzfYo9fscui/epv4pq6pim6hPV58S9
	92GZWsvktwyckapMltukHOWv93uMIGrX/Mlis1Cc87bUFJIsXRoudRvs1pY9y2iPfQKEi7yG7qC
	lgnHkUjob5IZOO/jk/Eukme5re6sINDaZ3chRkSrhT6gSke9/AY4Qwissl5MyttrwSTwoS3JHWx
	6opJeKCCpc36pfErgh+PtZ0iizAEFEDhir7HA3wq+Ytdn4y9rnjqmurdXTQon2MwhT9wWnYkkZO
	esB6cN/2lEeVKwkGo9lhrH+YV2KN+HtBkkG0Cr+0f8tymV2zRrD2MjN03FlcrAZ2yGHMMZj6JB1
	bO40VsUoWZ6Bd+vU0qUdDrVtlopa65M5xIiLMIWmR/n+5Dzk8LAZypOxTAKOV6A+45ak90fBMtw
	/tUWuaJZTpcOeqRJc3NJ6TojLuYXSBk8NzAIhqdModEjAPDQ==
X-Received: by 2002:a05:600c:e489:10b0:488:aa33:dcbd with SMTP id 5b1f17b1804b1-4909c0b9626mr31644775e9.26.1780052001869;
        Fri, 29 May 2026 03:53:21 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb3adsm31211055e9.11.2026.05.29.03.53.21
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 29 May 2026 03:53:21 -0700 (PDT)
Date: Fri, 29 May 2026 12:53:18 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: xhci: Simplify moving HW Dequeue Pointer
 past cancelled TDs
Message-ID: <20260529125318.611b2625.michal.pecio@gmail.com>
In-Reply-To: <b82f9543-2730-48af-81e8-1612b0d30ed9@linux.intel.com>
References: <20250225125750.1b345e2c@foxbook>
	<20250225125939.7a248e38@foxbook>
	<b82f9543-2730-48af-81e8-1612b0d30ed9@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38158-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D1D32601304
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 25 Feb 2025 16:55:49 +0200, Mathias Nyman wrote:
> On 25.2.2025 13.59, Michal Pecio wrote:
> > xhci_move_dequeue_past_td() uses a relatively complex and inefficient
> > procedure to find new dequeue position after the cancelled TD.
> > 
> > Replace it with a simpler function which moves dequeue immediately to
> > the first pending TD, or to enqueue if the ring is empty.
> > 
> > The outcome should be basically equivalent, because we only clear xHC
> > cache if it stopped or halted on some cancelled TD and moving past the
> > TD effectively means moving to the first remaining TD, if any.  
> 
> This new way relies on td_list being in sync and up to date.
> i.e. hardware dequeue can't be ahead of first TD in list.
> 
> One bad scenario could be something like:
> 
> class driver queues TD1
> class driver queues TD2
> Class driver cancels TD2, queue stop endpoint command
> (Class driver cancels TD1) (optional)
> 
> xHC hardware just completed TD1 and stop endpoint command at the same time,
> xHC hw may have advanced the hw dequeue to TD2, write event for stop endpoint command, and
> then write transfer event for TD1 completion. (xHC hardware may do things in odd order)

Hi,

I noticed that your xhci repository now contains a very similar patch.
The same problem seems to still apply.

I would say that the HW writing TD1 completion event after TD2 stopped
event would be a blatant spec violation and I don't recall seeing it
happen, but there is also a possibility that TD1 generates no event at
all or the event is missed due to a bug (no IOC, broken HW, whatever).

Then we could make things works by rewinding back to TD1.

A safer approach could be to retain the 'td' argument and use td->next
instead of list_first_entry(td_list).

Today we also have the dma_in_range() technology, so an efficient check
can be performed whether hw_dequeue lies between td->next and enqueue.
In such case something is clearly wrong and Set Deq seems unnecessary.

And one more problem: unconditionally advancing enqueue past a link TRB
creates risk that enqueue will enter deq_seg if the queued command
fails, which breaks ring expansion later. If we care...

Regards,
Michal











