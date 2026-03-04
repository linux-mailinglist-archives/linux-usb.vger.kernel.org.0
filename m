Return-Path: <linux-usb+bounces-33983-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMFaK9NPqGmvsgAAu9opvQ
	(envelope-from <linux-usb+bounces-33983-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 16:29:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E61B202AD1
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 16:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B26E030AF64A
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 15:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BCF33C53F;
	Wed,  4 Mar 2026 15:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="kChk93x+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6AA33A007
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772637855; cv=none; b=Wdm/wmBQseVaBlpSXl1/1n5R71BaNIb+3c6ltHHectovEuoRgKAm5EUXwt5HZ85uTyGp+Hqtzmj0sV1ugYaRiTpXYTyMlLNxH1/rcKe+W7rSD2Cj8gJWpl88AZuyijCIn/j93sMCOrkcVIWkn21IcGHcShBJortNTbuWV4QnW6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772637855; c=relaxed/simple;
	bh=dfE4q7Thd4sYvAKlXBLqeJG6yDSF0ZgLNXzgSZoQgtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S25lPOR9sIV1nxWlrE9gWEgRQlvTxAlNUPghCfzTZ6jiljrDznYKjUxZTQBnmcjDdIFldWKNsd+7nlFjQWipjgmw2IIDo+t7Vp84wkPsqiy4DjeFurEy+Qsff2eTdlp+h3IaR2iCxeUVI4PZ/OsoMFypATwUPvHJoKE5g6W05s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=kChk93x+; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c70b5594f4so720110885a.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 07:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772637853; x=1773242653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mldFBg2hMy87EWdNzYofBYb0Zx4ZHm48yGEZLUqC4O0=;
        b=kChk93x+zmKe+vjwaUIxQThDe1lTb6oRL8gLFVQztcGkD9Sdu7j/dsMo54CX1z/J/C
         VO1Vvd2l5jE3SozwoUnZxqCMHbtwtNhI5xRxZ1cBJftCidNXbkm3ru8F8M3obZvboFIU
         9swYgtOHrsgk7VYaBxIwN4iLzFPvGgRYazawlMwQaFSR+hBB0U1/03AAMwwIJ15PXxSR
         8PYI7JQ91APzqF1RKmfVT9/vEMPOXN9mQTR0Yiou+XMX4cn6AEBkSp90eb4h5agIvLab
         PDoLvC1qTMEtLKylgHQUtEx5Xsmjds338HWrsdW2plCDhCopMAQ9QnIuisvHwfVhXtsU
         O7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772637853; x=1773242653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mldFBg2hMy87EWdNzYofBYb0Zx4ZHm48yGEZLUqC4O0=;
        b=mkuX6RcbGu6oPZHZxg3eCw+Y0DFmkbZfDlQHjIBkomXvyQar9zFcPMBrn1c/ZjWSP6
         LMBH54giUsuPdAa0vGfiHgjT9lX63XTrsnFTafuZKgL0NRA1k2slBjhJMHRhnCAo/F6x
         6vR0hgdSpTnRsg/2GAFynarUdfe9Kk1iiZb8A2JfcJfkx7IMJDcaDzFapxdRw2MykiPF
         c4MNwQw3Eq09OO5FBmKRv0wDTMHrg273bkFDb0b6AmfNBehedujocZqTa82SJZURkjlR
         Ppiu4dR9uu/XLh6ccxhho25iBARxUg3dup3z44bbqOHBXSRaOixiXgdPvF9CfUE1Cpb8
         Kj1A==
X-Forwarded-Encrypted: i=1; AJvYcCU8eId3rYt5ugnzYtdJM+61Wi9cpw8Bd0Y1qIJeQcLcBhVhLWIT5AdN4ew4gsFTCMDcihINUHpgul0=@vger.kernel.org
X-Gm-Message-State: AOJu0YysvcJUt2uMH/OQD/7hSJXUNJceD+Efx63O3pjguRHtoUJF+WFl
	UhbuYvcKIL5AFbHjIaGYV8dXwSj5/dDIzkc7Hs3TiM7OkZcj6VUVCEo0Bieq6nYKCg==
X-Gm-Gg: ATEYQzw2Zo8BxX8+Y8fJ5b7586PdarKcmIErYgkh54d6P+bYsLMR7WAyIgBZ046QMxV
	+pGHgATQg0pG3CMgdFqBew1DQ6gVTpEE9TIZdz0K7DOAZF0OTQ9idZ3Bk2Gf87AG9OvqzbdfCZy
	JQO24nK5C90rNrhPiT9ESLnYZQuW8a4ja3cH9s8VmE7vuRZujP9pIYGUtlZ2Qe8k4Hlhi8v/WKj
	QzXw7GB9MD8MmubUMn9lf+7mUqfeKOHAzNkcyqeNOzI7ntLkr1jRO6lcZ/zZEOaLkI14nDjAg5J
	X5uXoNku833uPBR4B5cARqkNeZnzjZHKJRfeudv4Ky2T9+lw53TEMPp9t69ef1xB765psNE0sxm
	KTH/fd/off2JaXwZyMBv8yrywQ88nZb+pgNgp0WFVrG9sxWkUj2sg6Tie0yFiMxbXu2Nhe6mFbA
	5LScDnrUSCUl33eBPklf2NS90l8QnwXmQSogfSfegHCw==
X-Received: by 2002:a05:620a:4511:b0:8cb:50f9:20f6 with SMTP id af79cd13be357-8cd50bc3181mr725909685a.34.1772637852980;
        Wed, 04 Mar 2026 07:24:12 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6fb519sm1667252185a.29.2026.03.04.07.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 07:24:12 -0800 (PST)
Date: Wed, 4 Mar 2026 10:24:09 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: gregkh@linuxfoundation.org, tglx@kernel.org, mingo@kernel.org,
	claudiu.beznea.uj@bp.renesas.com, kees@kernel.org,
	bigeasy@linutronix.de, ulf.hansson@linaro.org,
	rafael.j.wysocki@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: hcd: queue wakeup_work to system_freezable_wq
 workqueue
Message-ID: <c35d4aae-038f-428c-9b69-09230043dd60@rowland.harvard.edu>
References: <20260304115729.857136-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304115729.857136-1-xu.yang_2@nxp.com>
X-Rspamd-Queue-Id: 0E61B202AD1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33983-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 07:57:29PM +0800, Xu Yang wrote:
> After commit 4fb352df14de ("PM: sleep: Do not flag runtime PM workqueue
> as freezable"), pm_wq workqueue will be unfreezable during system pm. This
> brings issue as below:

...

> The reason is if the host controller resume routine xhci_resume() call
> usb_hcd_resume_root_hub(), wakeup_work will be queued and run immediately.
> Then usb_autoresume_device() will be called and usb device will exit
> runtime suspended state (if it was suspended before). For a hub device,
> hub_resume()/hub_reset_resume() will be called accordingly.
> 
> After the host controller device system resume is finished, the root hub
> usb device "usb1" will do system resume too. Then hub_resume() will be
> called again.
> 
> Above sequence will cause hub->urb to be submitted twice. To avoid this
> issue, restore the previous behavior by queuing wakeup_work to
> system_freezable_wq workqueue.

I don't think this patch is an appropriate fix for the problem.  One 
indication of this is the fact that you have not considered the reasons 
for making the runtime PM workqueue freezable in the first place, as 
described in the 4fb352df14de commit.

A better question to ask would be: Why does xhci_resume() call 
usb_hcd_resume_root_hub()?  That does not seem like the right thing to 
do -- at least, not in this scenario.  The proper time to resume the 
root hub after a system sleep is when the PM core calls its resume 
routine.

Alan Stern

