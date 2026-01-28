Return-Path: <linux-usb+bounces-32866-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHu+FYfOeWnezgEAu9opvQ
	(envelope-from <linux-usb+bounces-32866-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 09:53:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 855779E798
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 09:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 58A2B3001CF2
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 08:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AF733A9E5;
	Wed, 28 Jan 2026 08:53:18 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [207.226.244.123])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D011B33A010;
	Wed, 28 Jan 2026 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.226.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590398; cv=none; b=ddzwWCSWmquKOqkwny4SwNG1+Uf6ODG0NwaMnTeAOGlviKZfO20FZOlsOfVe3XEsyKBEIGdqbBAullxPW9zVGpha4HARUywgXU7xDHZJH7BHU/1KkNC1pQOdMU6v+2MB8ub6RH5ivxAUHC+XdPuxAnYuNuJJgr91kqC+jgD6Dak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590398; c=relaxed/simple;
	bh=nqya7HmjXRTW2Wa6RrtWPvRO5Pru8QQ4ujdihrZEZdQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdR1qocPvgpSt2ZuDFWkqvlv4ED94ZX3InKzwZ70GytW7KRMDI+MsdXMNVhO5DOIUbewr/A1CKTSfJ/q+7pbPYwoItoa668ThSpElhVgOzJkiQ6X+f2oPb2JJs4kehMl6VEWjuALWJSXxHrMlk6sNB6newekwW81wgp6tzxMi/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=207.226.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: smIM7s5rT5yx01wzP5E4QQ==
X-CSE-MsgGUID: cLFvDrq7TMqRf+6WTGRpsg==
X-IronPort-AV: E=Sophos;i="6.21,258,1763395200"; 
   d="scan'208";a="165548015"
Date: Wed, 28 Jan 2026 16:53:10 +0800
From: Dayu Jiang <jiangdayu@xiaomi.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Longfang Liu
	<liulongfang@huawei.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, yudongbin <yudongbin@xiaomi.com>, guhuinan
	<guhuinan@xiaomi.com>, chenyu45 <chenyu45@xiaomi.com>, mahongwei3
	<mahongwei3@xiaomi.com>, Dayu Jiang <jiangdayu@xiaomi.com>
Subject: Re: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
Message-ID: <aXnOdjEJWXwnfi0+@oa-jiangdayu.localdomain>
References: <20260127110422.306711-1-jiangdayu@xiaomi.com>
 <fbc1efce-8108-4e36-ad12-983be16c835e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbc1efce-8108-4e36-ad12-983be16c835e@linux.intel.com>
X-ClientProxiedBy: BJ-MBX02.mioffice.cn (10.237.8.122) To BJ-MBX03.mioffice.cn
 (10.237.8.123)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[xiaomi.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oa-jiangdayu.localdomain:mid];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jiangdayu@xiaomi.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-32866-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 855779E798
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 02:25:19PM +0200, Mathias Nyman wrote:
> Hi
> 
> On 1/27/26 13:04, jiangdayu wrote:
> > When the xHCI controller reports a Host Controller Error (HCE) status
> > in the interrupt handler, the driver currently only logs a warning and
> > continues execution. However, a Host Controller Error indicates a
> > critical hardware failure that requires the controller to be halted.
> > 
> 
> The host should cease all activity when it sets the HCE bit.
> 
> See xHCI spec 4.24.1 'Internal Errors':
> "When the HCE flag is set to ¡®1¡¯ the xHC shall cease all activity.
>  Software response to the assertion of HCE is to reset the
>  xHC (HCRST = ¡®1¡¯) and reinitialize it."
> 
> Same is true for "Host system error" HSE (STS_FATAL), not sure
> why we halt it manually in that case.
> 
> > Add xhci_halt(xhci) call after the HCE warning to properly halt the
> > controller when this error condition is detected. This ensures the
> > controller is in a consistent state and prevents further operations
> > on a failed hardware. Additionally, if there are still unhandled
> > interrupts at this point, it may cause interrupt storm.
> 
> Is this something that has been seen on real word hardware?
> If yes, and halting the host helped ,then this fix is ok by me.
> At least until a proper host reset solution is implemented.
Yes, the HCE issue (and subsequent interrupt storm) has been consistently 
observed on production Android devices during UASP device plug/unplug 
operations. Adding xhci_halt() effectively resolves the system-level interrupt 
storm issue caused by HCE.
> 
> Thanks
> Mathias
> 

