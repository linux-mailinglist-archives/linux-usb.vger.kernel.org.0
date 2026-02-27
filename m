Return-Path: <linux-usb+bounces-33773-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCk+Kq5HoWkirwQAu9opvQ
	(envelope-from <linux-usb+bounces-33773-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 08:28:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBAC1B3E45
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 08:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB90F309C295
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 07:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BA43659ED;
	Fri, 27 Feb 2026 07:26:54 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [118.143.206.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3EA9332625;
	Fri, 27 Feb 2026 07:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.143.206.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772177214; cv=none; b=rH6ft8V61JT2J61cG+BUJ/9VyeyNE9i/Q68473Ii83YoSSWw3+nWyhIwypOiALnbN5XNLtrmreJI6ARoEkLRe+q12gNwRowzF8fVapMj9vKtNFxO8svFTRmn37sXyx7TfWePXNPbZclnKaZxH4Fmc+zVmczU3Bi9o8q4xfLdUh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772177214; c=relaxed/simple;
	bh=5lxufAU+G2h62p6iJ2qyJ+Q3MFRY3kSVgg52IOmmseU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbxmRmBeY9K2TGMCfCmC3hV0xzrwxYI7WC2vdJHwPFnW9+SoFXSURFL6e9WdLt8vQbYNDdJVQRDXMlx/U5FRA4GRIFaajHcGbZycoX56pYs3ehYkoI49/bzf7wggwWqr/+UoYW5kMClzDP2QEGw38HioCmC9bZC0j5N75aV2X7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=118.143.206.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: vKDk1byZSmKQu0C6CZcdFQ==
X-CSE-MsgGUID: ONsn7UMSQdKd1qjQsci8eQ==
X-IronPort-AV: E=Sophos;i="6.21,313,1763395200"; 
   d="scan'208";a="142026054"
Date: Fri, 27 Feb 2026 15:26:32 +0800
From: Dayu Jiang <jiangdayu@xiaomi.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: Mathias Nyman <mathias.nyman@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>,
	Longfang Liu <liulongfang@huawei.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, yudongbin <yudongbin@xiaomi.com>, guhuinan
	<guhuinan@xiaomi.com>, chenyu45 <chenyu45@xiaomi.com>, mahongwei3
	<mahongwei3@xiaomi.com>, Dayu Jiang <jiangdayu@xiaomi.com>
Subject: Re: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
Message-ID: <aaFHKC2XyqjTwbF0@oa-jiangdayu.localdomain>
References: <20260127110422.306711-1-jiangdayu@xiaomi.com>
 <2026012708-liability-sincere-5ed4@gregkh>
 <aXnNcQa5Ooq2wIX2@oa-jiangdayu.localdomain>
 <2026012857-deprive-putdown-0ee8@gregkh>
 <aaAR5VOtnMhvoCem@oa-jiangdayu.localdomain>
 <871991ab-6c8f-47d4-a5b4-b65751750e71@linux.intel.com>
 <20260226181715.ofgjiq3iq7d7dx6y@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260226181715.ofgjiq3iq7d7dx6y@synopsys.com>
X-ClientProxiedBy: bj-mbx11.mioffice.cn (10.237.8.131) To BJ-MBX03.mioffice.cn
 (10.237.8.123)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[xiaomi.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-33773-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiangdayu@xiaomi.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-usb];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,urldefense.com:url]
X-Rspamd-Queue-Id: 3BBAC1B3E45
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 06:17:23PM +0000, Thinh Nguyen wrote:
> On Thu, Feb 26, 2026, Mathias Nyman wrote:
> > On 2/26/26 11:27, Dayu Jiang wrote:
> > > Hi Greg,
> > > 
> > > I have updated the changelog text as requested and resubmitted the patch.
> > > https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/20260128100746.561626-1-jiangdayu@xiaomi.com/__;!!A4F2R9G_pg!ZSJNDKyOinm26qngopLW-axiQtwDAMely4bDqtqYDGv1ErWCtS6kZ6ZamdiKoZKuCyCk0IxMQK5g625GEIxYWFzKpAEiCUq7$
> > > Please kindly review it and let me know if it is acceptable now.
> > 
> > I'll send it forward, but changed the commit message.
> > Does this modified version still describe the case accurately:
> > 
> > usb: xhci: Prevent interrupt storm on host controller error (HCE)
> > 
> > The xHCI controller reports a Host Controller Error (HCE) in UAS Storage
> > Device plug/unplug scenarios on Android devices, which is checked in
> > xhci_irq() function and causes an interrupt storm (since the interrupt
> > isn¡¯t cleared), leading to severe system-level faults.
> > 
> > When the xHC controller reports HCE in the interrupt handler, the driver
> > only logs a warning and assumes xHC activity will stop. The interrupt storm
> > does however continue until driver manually disables xHC interrupt and
> > stops the controller by calling xhci_halt().
> > 
> > The change is made in xhci_irq() function where STS_HCE status is
> > checked, mirroring the existing error handling pattern used for
> > STS_FATAL errors.
> > 
> > This only fixes the interrupt storm. Proper HCE recovery requires resetting
> > and re-initializing the xHC.
> > 
> 
> The controller is halted if there's an error like HCE. It's odd to try
> to "halt" it again. Not sure how this will impact for other controllers.
> Even if we don't have the full HCE recovery implemented, did we try to
> just do HCRST, which is the first step of the recovery?
A full recovery will not be implemented here. Performing only HCRST without 
a proper recovery procedure may introduce unpredictable risks.
In the xHCI driver flow, the standard handling for exceptions is mainly 
done via xhci_died() or xhci_halt() (please refer to the existing handling 
flow for HSE as a reference).
When an HCE occurs, the controller is already halted, but the interrupts 
have not been cleared. It has been confirmed that calling xhci_halt() at this 
point can properly resolve the interrupt storm issue.
> BR,
> Thinh

