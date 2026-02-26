Return-Path: <linux-usb+bounces-33727-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBV1DQ8UoGlAfgQAu9opvQ
	(envelope-from <linux-usb+bounces-33727-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 10:36:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9131A3839
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 10:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AF3C3130209
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 09:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF133A0EBC;
	Thu, 26 Feb 2026 09:28:26 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [118.143.206.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE71F399036;
	Thu, 26 Feb 2026 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.143.206.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098106; cv=none; b=pDM/J047t/6PRhh5H+VRGXxtm/xaQtIxVYlaoC+V+fM7inuYUM4Hm75rm+0LDiSvfutGrMpNRfYqmsmWQDUR3jPfc76BD7Qkx+N0wgvK5tQmykOHGQ0poKfHBLMCjs5KY0dz+o7OXjNQ2fqE7jY1P4NM+XBtbYcg/woZq8wzZio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098106; c=relaxed/simple;
	bh=8gETV4BrYJMCYq16lBMm+D36kDpEAoQEeE8bWymmCWI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvFTEyydXG3m1Feu8Q2ddqoYYuZtUToR9CFviDXPuE/88LenhScK7MRJIP2m1N2HUZVgbCrYvlKJYenIh8Dm7ACnljTDodq6cHnHqmFjt/5bUmPEwmdTliWTQTf1eUmRDVdZIaxPp/oxs83Rz0WXNULpD5f1CqLOk65ZrPlm6yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=118.143.206.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: QropyfqKQWCBvs6mkB8INg==
X-CSE-MsgGUID: m18cEuWIQdy4OrK/F56LLw==
X-IronPort-AV: E=Sophos;i="6.21,312,1763395200"; 
   d="scan'208";a="141931651"
Date: Thu, 26 Feb 2026 17:27:01 +0800
From: Dayu Jiang <jiangdayu@xiaomi.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Mathias Nyman <mathias.nyman@intel.com>, Longfang Liu
	<liulongfang@huawei.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, yudongbin <yudongbin@xiaomi.com>, guhuinan
	<guhuinan@xiaomi.com>, chenyu45 <chenyu45@xiaomi.com>, mahongwei3
	<mahongwei3@xiaomi.com>, Dayu Jiang <jiangdayu@xiaomi.com>
Subject: Re: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
Message-ID: <aaAR5VOtnMhvoCem@oa-jiangdayu.localdomain>
References: <20260127110422.306711-1-jiangdayu@xiaomi.com>
 <2026012708-liability-sincere-5ed4@gregkh>
 <aXnNcQa5Ooq2wIX2@oa-jiangdayu.localdomain>
 <2026012857-deprive-putdown-0ee8@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2026012857-deprive-putdown-0ee8@gregkh>
X-ClientProxiedBy: BJ-MBX02.mioffice.cn (10.237.8.122) To BJ-MBX03.mioffice.cn
 (10.237.8.123)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[xiaomi.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oa-jiangdayu.localdomain:mid];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[jiangdayu@xiaomi.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33727-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: BA9131A3839
X-Rspamd-Action: no action

Hi Greg,

I have updated the changelog text as requested and resubmitted the patch.
https://lore.kernel.org/linux-usb/20260128100746.561626-1-jiangdayu@xiaomi.com/
Please kindly review it and let me know if it is acceptable now.

Thanks,
Dayu Jiang

On Wed, Jan 28, 2026 at 09:56:18AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Jan 28, 2026 at 04:48:49PM +0800, Dayu Jiang wrote:
> > On Tue, Jan 27, 2026 at 12:22:40PM +0100, Greg Kroah-Hartman wrote:
> > > >  	if (status & STS_HCE) {
> > > >  		xhci_warn(xhci, "WARNING: Host Controller Error\n");
> > > > +		xhci_halt(xhci);
> > > 
> > > What is going to start things back up again?  And as you are calling
> > > this function, why is the warning message needed anymore?  The
> > > tracepoint information will give you that message now, right?
> > When HCE is triggered, it indicates a critical hardware failure. 
> > Aligning with the handling of HSE (STS_FATAL) by adding 
> > xhci_halt() here is more reasonable: without xhci_halt(), the 
> > USB controller may fall into an unpredictable and unstable state, 
> > which could exacerbate system issues.  
> > 
> > Retaining the warning message is necessary because it is directly 
> > visible in dmesg, whereas tracepoint information requires explicitly 
> > enabling xHCI tracepoints. Additionally, if xhci_halt() is called in 
> > xhci_irq() without the warning log, it would be impossible to 
> > distinguish whether the halt was triggered by HCE or HSE.
> > > 
> > > And is this just papering over a hardware bug?  Should this really be
> > > happening for any normal system?
> > Yes, this issue has been reproducible on real-world hardware: HCE is 
> > triggered in UAS Storage Device plug/unplug scenarios on Android 
> > devices, which enters this error branch and causes an interrupt storm, 
> > leading to severe system-level faults.
> 
> Great, please provide this information in the changelog text when you
> resubmit this, thanks!
> 
> greg k-h

