Return-Path: <linux-usb+bounces-36998-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOwgObnN+mmtSwMAu9opvQ
	(envelope-from <linux-usb+bounces-36998-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 07:12:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 643244D6400
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 07:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC694301B72A
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2026 05:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1852E4257;
	Wed,  6 May 2026 05:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="n/7uM2vV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E626B285050
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 05:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778044336; cv=none; b=fgYLS2k/5eNBLjAfpJ8hn+ZYrcY5FOCb4sOCmRzAhdw+XH9csTJRRiy81pwooL+aGm0WTM8TaskEWlNtfhvVEJO9XOZEBgMc3yCtuewsx65OxgtII4kya7gPuoV4gPgyDuzCoSyh8GVp8nfp0/W4Y/rxufdPsd/x9Pfu3AxXtGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778044336; c=relaxed/simple;
	bh=sz7mmyF8cxK8yw8HrttRmFCR+Zo7ogIfEOW/QtYWZBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qugivfg+bd/O98Sf6TGXlu/9e9RqdOtR2ochW5/hnXNKW6R4O2OIQ+pYL/REbKHsGf8nzPKxTTJxDepivJE4WozlcAsDILzBsNT3ZcX+3kLwGxJ/RiqTwAlI9GOKUYfS7vBkJWUs3L9M7nRJm+MNDerA85B4tThzytq9U8tHE7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=n/7uM2vV; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1778044302;
	bh=Gzq9nwqe4PUOjkpkrprVwc70uy48WTuNBDPCdfej+0Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=n/7uM2vVO6sr2pzn9u/o6dWIvK+J12/XwxPjTNcLZvbf/c5pEj58O6eW1p4IQ7oZ1
	 RJ+Tdv6wSeX82zBbYovGi3o12iJJyG+po0BHjrrgWkPm9a61zvMX2GWhnw438N8Wtd
	 ypNStBYYJS3eNRZd4bNISZakEm+ynAtVI2S2HslM=
X-QQ-mid: zesmtpip2t1778044288t6829576b
X-QQ-Originating-IP: Xurra64R4sqMZENxYQsXyR537zc3n4elCzbLAgwCjgg=
Received: from PEN202512010004 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 06 May 2026 13:11:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6674821436035384762
EX-QQ-RecipientCnt: 6
From: Xu Rao <raoxu@uniontech.com>
To: niklas.neronin@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com,
	raoxu@uniontech.com
Subject: [PATCH 3/4] usb: xhci-pci: use the interrupter entry as MSI dev_id
Date: Wed,  6 May 2026 13:11:26 +0800
Message-ID: <9F2336B40DA36C54+20260506051126.4058448-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <131c6e0f-59bc-4d41-9314-3539681f88e0@linux.intel.com>
References: <131c6e0f-59bc-4d41-9314-3539681f88e0@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MDGUoPnBmw7s7nCNkW3bBEgOhpJmhNqizkrX2KWfUftGUY21WzOXcnq7
	gH0g5M5N7pH+z3PnFsYavegGgLQJopuiS+CvnFjumsIMJlRBFvkn8Mfupd9Adnf1Rl/iPa3
	GDQbX276Oaic8Q4RYmcJa/sBFcITkY5vRToUq+4omf8mmqp0DWgiTsAgwr2Gzpe2JWbC4LN
	3UPMS+EwtVeFBGWOVXEhv7bxAzzGy6WSnmk4VV2uobko45ZQ37TXmK8A35GHrzkj9i7/CDl
	T+C4L0RkXk3ofWaYEKw44klTf18cJUCdJvKNthLm6mR+04Uvmp3wSCH5W7S6mUdpBudx1aB
	I0OQOmShoKY39ZikPeJ4mNoAM+PiktbsJQCgkjp1Ud2nEc/M2H+9VgLJfw/L0VW/71Nh+dC
	Ztzik48RLyEjrHGEkKYh1G4VFKKAOIMY+SXw1XbndDd1D6BVDYxY/zpggpfvRAL+KqwQiQF
	AJ+SObgcTvZNU9c6ozMqC5jm68bRDSEpsgK0/0cAbmhjGd1MTbqeUoNQTdo5CUOmaJa42sk
	jp5IGypHbqtRBlUW9sysUnR43ocwXU6kVWG8tiC03xbIhrSErUVAzYobvYgTHOPjw1cpcl5
	L6sBMY3KzS+XPu0zKev448f8GMt+0P+5jtxO/8zoBLkVGpfD02SOgL/tzL6E3Mu+zqoRm/N
	itHmelNwayXzyxTzQeHgmNqdQeN/c8AqrD5HIBKxMApfg57lRa32luzmYmBLOLCw2hvZ+Dy
	xeW4O1+P0yjCkJqlzB4NgpqbNKM2Xvww2adAfXstYHBh2omZFiLsI8N18q5sUB6NphPidl/
	DwNqXjlMCMqJL3sooK7NYLSqReOqd4kKJCt2pBekF6ccjO4RSeI/cWiPrqRsO49tIJZy3zm
	jdvyy1+6LboqobnKzywDGRAUicT9VQMdHdRVJPg/1awDGNfQfSm6xsJTasqNOzIfiDPAvni
	SAoeDB8VIhDg9VE5/nXdpGQdAJglAptoYVZA1UksQVhneFXblX2ULiq5NMlkfHbACPJc=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 643244D6400
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,linux.intel.com,gmail.com,uniontech.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36998-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,uniontech.com:dkim,uniontech.com:mid]

On 50/05/2026 17.54, Niklas wrote:

> > @@ -225,10 +225,10 @@ static void xhci_pci_stop(struct usb_hcd *hcd)
> >  {
> >  struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> >
> > - xhci_stop(hcd);
> > -
> >  if (usb_hcd_is_primary_hcd(hcd))
> >  xhci_cleanup_msix(xhci);
> > +
> > + xhci_stop(hcd);
>
> Won't this now free the MSI-X interrupt before it has been disabled?

Yes, the reason for moving xhci_cleanup_msix() ahead of
xhci_stop() is that free_irq() now uses
&xhci->interrupters[0] as the dev_id, while xhci_stop()
reaches xhci_mem_cleanup(), which clears the interrupter
entries and later frees the interrupter array.

Without that reordering, xhci_cleanup_msix() could use an
already cleared interrupter entry.

You are right that moving xhci_cleanup_msix() ahead of
xhci_stop() alone is not enough.

I think xhci_cleanup_msix() should also quiesce the primary
interrupter before free_irq(), so that the interrupt source
is disabled before the MSI vector is released.

Would this look correct to you?

@@ -134,7 +134,8 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
        if (hcd->irq > 0)
                return;

-       free_irq(pci_irq_vector(pdev, 0), xhci_to_hcd(xhci));
+       xhci_disable_interrupter(xhci, xhci->interrupters[0]);
+       free_irq(pci_irq_vector(pdev, 0), &xhci->interrupters[0]);
        pci_free_irq_vectors(pdev);
        hcd->msix_enabled = 0;
 }

thanks,

Xu Rao

