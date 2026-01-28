Return-Path: <linux-usb+bounces-32864-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBzWOMbOeWnezgEAu9opvQ
	(envelope-from <linux-usb+bounces-32864-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 09:54:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CE09E7C1
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 09:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25143307340C
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 08:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C2633A6F7;
	Wed, 28 Jan 2026 08:50:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [118.143.206.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C11A337BBB;
	Wed, 28 Jan 2026 08:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.143.206.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590218; cv=none; b=d7CbkUON+6SXtb6egoJA4g8UWY11zuANIKJQbJ5i4wvoSgLRGhqSaC93nUmo2V8xk7o5/dPlcUxQWMIPy+xM/vATCWqfAZ25RKFX0sonqShoHQl3mbRuDtP7kEqRe1AdQpZjgMlB+krgB/WO+R/eTWH5I+gTueUKtS+R9c1YyZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590218; c=relaxed/simple;
	bh=/mLSsHaATrYXpFqr6lqZG4zeOGqVm7/GyaO2nLSICuE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WjBcaKhyAzcUo0jcS+NoZdb9t/o6OoHKoCVje12oDlrgb1tOljvFgIXRDqtLvNKXPlfjc7F8xwAbewq/uvknXIn3xJzGbQYB60Un1R1QupYWYc5LqNDdqnYL7QOPVKWfJEstk4OOpKoXWV9TRqxpEFSNTo6CKqQ3/xlz3EDIKms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=118.143.206.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: u2LN01oKSROEb9kvQl+igg==
X-CSE-MsgGUID: gks814oVSg6uzIONpp8tsQ==
X-IronPort-AV: E=Sophos;i="6.21,258,1763395200"; 
   d="scan'208";a="139512834"
Date: Wed, 28 Jan 2026 16:48:49 +0800
From: Dayu Jiang <jiangdayu@xiaomi.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Mathias Nyman <mathias.nyman@intel.com>, Longfang Liu
	<liulongfang@huawei.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, yudongbin <yudongbin@xiaomi.com>, guhuinan
	<guhuinan@xiaomi.com>, chenyu45 <chenyu45@xiaomi.com>, mahongwei3
	<mahongwei3@xiaomi.com>
Subject: Re: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
Message-ID: <aXnNcQa5Ooq2wIX2@oa-jiangdayu.localdomain>
References: <20260127110422.306711-1-jiangdayu@xiaomi.com>
 <2026012708-liability-sincere-5ed4@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026012708-liability-sincere-5ed4@gregkh>
X-ClientProxiedBy: BJ-MBX07.mioffice.cn (10.237.8.127) To BJ-MBX03.mioffice.cn
 (10.237.8.123)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[xiaomi.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oa-jiangdayu.localdomain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,xiaomi.com:email];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiangdayu@xiaomi.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-32864-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 72CE09E7C1
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 12:22:40PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Jan 27, 2026 at 07:04:22PM +0800, jiangdayu wrote:
> > When the xHCI controller reports a Host Controller Error (HCE) status
> > in the interrupt handler, the driver currently only logs a warning and
> > continues execution. However, a Host Controller Error indicates a
> > critical hardware failure that requires the controller to be halted.
> > 
> > Add xhci_halt(xhci) call after the HCE warning to properly halt the
> > controller when this error condition is detected. This ensures the
> > controller is in a consistent state and prevents further operations
> > on a failed hardware. Additionally, if there are still unhandled
> > interrupts at this point, it may cause interrupt storm.
> > 
> > The change is made in xhci_irq() function where STS_HCE status is
> > checked, mirroring the existing error handling pattern used for
> > STS_FATAL errors.
> > 
> > Fixes: 2a25e66d676df ("xhci: print warning when HCE was set")
> > Signed-off-by: jiangdayu <jiangdayu@xiaomi.com>
> 
> We need a full name, not an email alias, sorry.
Sorry for the confusion, I will use my full legal name (instead of the 
email alias) in the Signed-off-by line in the revised patch.  
> 
> And this isn't really "fixing" that commit, there's nothing wrong with
> it as-is.  This is adding new functionality to the code.
I initially used the Fixes tag because the original commit only logged
a warning for HCE with no further action, this incomplete handling 
risks interrupt storms on the SoC (since the interrupt isn¡¯t cleared). 
That¡¯s a robustness gap I wanted to fix with this patch.
> 
> > ---
> >  drivers/usb/host/xhci-ring.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> > index 9315ba18310d..1cbefee3c4ca 100644
> > --- a/drivers/usb/host/xhci-ring.c
> > +++ b/drivers/usb/host/xhci-ring.c
> > @@ -3195,6 +3195,7 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
> >  
> >  	if (status & STS_HCE) {
> >  		xhci_warn(xhci, "WARNING: Host Controller Error\n");
> > +		xhci_halt(xhci);
> 
> What is going to start things back up again?  And as you are calling
> this function, why is the warning message needed anymore?  The
> tracepoint information will give you that message now, right?
When HCE is triggered, it indicates a critical hardware failure. 
Aligning with the handling of HSE (STS_FATAL) by adding 
xhci_halt() here is more reasonable: without xhci_halt(), the 
USB controller may fall into an unpredictable and unstable state, 
which could exacerbate system issues.  

Retaining the warning message is necessary because it is directly 
visible in dmesg, whereas tracepoint information requires explicitly 
enabling xHCI tracepoints. Additionally, if xhci_halt() is called in 
xhci_irq() without the warning log, it would be impossible to 
distinguish whether the halt was triggered by HCE or HSE.
> 
> And is this just papering over a hardware bug?  Should this really be
> happening for any normal system?
Yes, this issue has been reproducible on real-world hardware: HCE is 
triggered in UAS Storage Device plug/unplug scenarios on Android 
devices, which enters this error branch and causes an interrupt storm, 
leading to severe system-level faults.
> 
> thanks,
> 
> greg k-h

