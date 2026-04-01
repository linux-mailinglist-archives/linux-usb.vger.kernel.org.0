Return-Path: <linux-usb+bounces-35772-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKVZBJzvzGknYAYAu9opvQ
	(envelope-from <linux-usb+bounces-35772-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 12:12:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ECE37846C
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 12:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 098B6313884D
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 09:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2BC3112AD;
	Wed,  1 Apr 2026 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYpI0vhU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEEC28725A
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775037519; cv=none; b=rxWkWrMgZ6ZYpFv9Ukm6fiCBUMDr86qjMpAhtL1Quv8hvRuUMsU8sRQGMPls5Y0o3r5PEBAooeoqNmGYC3utRXocean0ji/HJ9IWfiNConDKEFbFqv9LLh+flG1IaIemEuK9hsPJeML1RQ9KAh4c9vRm27AqggtyXR51iWBJnYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775037519; c=relaxed/simple;
	bh=w1SbgoA9M11Xw1PVVe4JWaOKZfKSIDiGsZ08mEm/9kw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pML5ADhp8dF1WhS+1usHeYecxdGtM2TqS0ZH445DFT4Q+1ywbJwchmUHuCCn7eg2kH2unPraFMSR2MyKx69pYenM1at5Qw+eAOGHyC/XlCTutqRWM5OOa4W+EI1vyPGgPFzwG9jWn7Uzi1nt/j8q5it4gQe73OFqkhRDbPYpmc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYpI0vhU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so5902765e9.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 02:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775037517; x=1775642317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+DYBssoL1Xv6aCi6qfkdYqfelq+mNCA3bb5DNv1YUo=;
        b=sYpI0vhUsOBIm6JlAh8+iFuG+w9HbbEO8ZFUUlin7tncG5nZ3L4osG3YOKQoXDhCTI
         5WU5CESl9PmwSisRvzNcXfS/TTdFKOpR9rVoKWbRy/s4iUg+eVYuVd67nWePFOgaoIPH
         lXqsBbblSGAcfmB+IUVAmRclwh817B19ku7LGltkCqvCVubRcjwjP1J9m5bUmCmcyCq2
         ZSErRDbMmXAjNWhQXRVhpZ5sUOZ4LjvDpLvcaRsHJuLZyT6komCFqGPn9XLwrDVFlkoA
         PA6GisU73Pm6kwpWXJJyNB8fdfqiIqu8FO8kjAVDdfJRenFVmBy43vE3mTXCvAgjQZ4e
         3YgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775037517; x=1775642317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+DYBssoL1Xv6aCi6qfkdYqfelq+mNCA3bb5DNv1YUo=;
        b=hXz0iLzvIjE4BGrUQ72UDllkPmNXTA4grbQcMV2/OHFF02KknVGOCfnFboJpPntXEW
         mvsTm12ct5mHLCFTfu9UIgLtu8a9zQsJzfL5yIiZPxvqGA/AkGAoSy/yeNlJ7BDls5sH
         5isE7EhIEdTxojyPMqyEVIded2Kz0oRMmvtn77eS/A9qyOBBxJgaGhhgD5vABab8wzN/
         nxcYVaUbDsEbtTP707f/f5wC4TCj99GTWE9133RAESmYw7M10BfpNquTjDurx/QrUW56
         2k2zHZVZ+qI0BhxL0A5wxs7dvZtkcDF3kT7C7Rb2hC+Qdwzt7oNrn1NgzXaEl6GucirV
         0z1A==
X-Forwarded-Encrypted: i=1; AJvYcCWbpysCtwKIwwkI/J13tMPgWY8uTJVhXQfcpl+ciYhhxMppxpx7B9POcE/sCf5z4qBl1ofprNYUokY=@vger.kernel.org
X-Gm-Message-State: AOJu0YztzztWsxu22v7U3IfBj0rVAWe0KHq07583kJc0QjQUyLwwGx/O
	lqiGw5Dgs9zokug6dSCBCLaWBVi4y8C2rK5iPCjvxDbOtO0/UWokuts39qhWow==
X-Gm-Gg: ATEYQzxB+6J2jBH0M4uINcUB/mY5tCnBjwy5MCFrHVBDrX4jeHgzJjPNEiBLOlRNqpC
	4OqxhJQLBAZ/ZInlsT2+mMNXpP6+zqwf6I87qeqjC7+lroxgb1GN4D6oCU2ROCuhEpA3j1Yjqa2
	vYqmT7pFOjNlLghg6rXmyscBP2GHlwTnhDso119w/RqDAQ20ABEbv+aKYICyH6TkGYuCh0iOFUb
	ODntoWzn+/tlrXWElaoanp8a8Bxhf3RGWcgDUzpNLwKKZ4rOph2n2ZE9Y/WEep1bEm3qHXmtBr9
	QQFTd6kO8tLDT44SizjDBMYqNaq4DR/jlpEgoVgi9+7D5r1s+BY3RqIuQrK3b2yBIZZv4ydmMI1
	Xfs6oytCMfdR06C7Mri5pZaZgKqfTaVa099yS5vvIccZHdMdMzNj2eD18RtK4YSVJHXwQ4+NDYc
	stCYcz4F5xsGbgez9gOgp235/GWYhntrWV
X-Received: by 2002:a05:600c:4f12:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-488835a168fmr46365785e9.11.1775037516460;
        Wed, 01 Apr 2026 02:58:36 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48885553118sm15100915e9.14.2026.04.01.02.58.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 01 Apr 2026 02:58:36 -0700 (PDT)
Date: Wed, 1 Apr 2026 11:58:33 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com
Subject: Re: [PATCH 3/9] usb: xhci: factor out roothub bandwidth cleanup
Message-ID: <20260401115833.427f6f02.michal.pecio@gmail.com>
In-Reply-To: <108b65c0-349b-4854-b703-f6951b53bc33@linux.intel.com>
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
	<20260327123441.806564-4-niklas.neronin@linux.intel.com>
	<20260330102910.0059972c.michal.pecio@gmail.com>
	<108b65c0-349b-4854-b703-f6951b53bc33@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35772-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 95ECE37846C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 12:34:36 +0300, Neronin, Niklas wrote:
> > This loop used to run before xhci_free_virt_devices_depth_first(),
> > but now it will run after. It seems that the endpoints here are
> > virt_ep which also should be gone already, so this loop likely does
> > nothing (empty list) or writes to virtual devices after free
> > (somebody forgot to unlink some endpoints from the list).  
> 
> In my testing, when xhci_rh_bw_cleanup() is called after
> xhci_free_virt_devices_depth_first() in xhci_resume(), all related
> resources have already been freed.
> That said, I have chosen to keep the existing freeing in this patch
> set. Removing it would introduce an additional behavioral change and a
> potential regression point, which I prefer to avoid at this stage.

Well, reordering these loops is also a potential behavior change.

As vdevs and tt_infos are closely tied together, I think it would make
sense for one function to free all of that stuff.

A non-behavior-changing way of doing it would be to extract the three
existing loops to such a function, in the exact order they run today.

> Do we trust xhci_free_virt_devices_depth_first() to work correctly?
> If yes then it seems this whole function is unnecessary.  

I think it's correct now, in the sense that all vdevs are removed and
there is no UAF along the way. Although a few months ago an unrelated
patch did break it unexpectedly, including UAF in some edge cases.

In principle it should be possible to drop separate tt_info cleanup,
because removing vdevs achieves the same. And if it doesn't then things
would also be broken under normal operation, not only suspend, as the
same xhci_free_virt_device() is used in both situations.

Regards,
Michal

