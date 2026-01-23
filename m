Return-Path: <linux-usb+bounces-32640-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKlOOzLXcmlhpwAAu9opvQ
	(envelope-from <linux-usb+bounces-32640-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 03:04:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 682A26F6EE
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 03:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F24F30086D6
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 02:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9E9346E75;
	Fri, 23 Jan 2026 02:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLufnBos"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD223346E56
	for <linux-usb@vger.kernel.org>; Fri, 23 Jan 2026 02:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769133867; cv=none; b=AmAIPVrovYmzFrn93Q2F0YjWww7zah2KKsyPgc63yPg0AIC9kGv8swO+4Q5+yz7vv0+q/wa5482+RhqxseNV92FR9cdu8lcB9d8hdt5LW4hgTzLkpH7sYVSvS/TXVHvfnuhW/nPyJfw9I/9VvL3OzNdewgw2iSdWPpq1E3eVe2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769133867; c=relaxed/simple;
	bh=4M6vU7yGIghImyo7XIcl4YGBOdNNEvQRe7+qak6vEbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSHu6NCRzcZfK8e+by0qLOJSWttPS807pBOTJessx1XyPCvhcPLmnZProVWXb0SwNGTEy0YIfWPTtyx/HIAda4JBuMEmBxMmESfM27BepKtt2Aaw/HgyYdHjaJSYExIZfSMb2MihdIQ2AOzq8D4nlfh0DKFIOCAJFe4JCL5CzU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLufnBos; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so13352405e9.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 18:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769133860; x=1769738660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aPyvn4zidjCY33YDEVVo6RlRxk+3FjdxBJwdf65ZzFs=;
        b=hLufnBos5f0E/bufjNQ1nyLL3Xbzim9kvGQ7Bsy5Cj/giRKHhgx4SyyjtHGg6gZvCu
         BuLTPts7w/4IPEi+KvfNYqHWTgDUphUem0O8sLYVofVwUUXBiwUZdIT/6uptI0ZB9jO6
         7OI5+W7sHh6bxuCev0lCR0i8vskA9tyL4teH63bpVGf6+hxqffViDWmStz68n07his6w
         EbGT8gkPovbDxDRncU8mdiut3MM8W1nIeGLA7wmMwJnQ6Ax6uAmdNx5PZuraYGQMERhN
         MSHgc6zCLJ/fV2CskoPBFAtHZMK+57fg/F/zABXdQtu1x4i5awzBYxPvn6M/jFEkAUfG
         65ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769133860; x=1769738660;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPyvn4zidjCY33YDEVVo6RlRxk+3FjdxBJwdf65ZzFs=;
        b=Va8reWeuOf7Hjzeq9SGabBDcm7vqYhKCf6hOpjF5WMs4sBNRH+zLLbUVJmOk4ygFsv
         i5cWC55ER9f43ms9nCDm1nLZWK3Ci3VvYbikZz1Ncnsw4571vyLDG/8k8MhhyIjguhz7
         GTaTmd7kaCbY6eaAeGq8qVKESCjC3WqutFA2u63b16h7sHqwkqRrWpWGHC/LhZRBCa1I
         ioUbDcHMJ5LLeOSfCFrU26Hw44X+vOg3WamUv2+jFt+TTdR/0gysznff1t+PhhetGZdf
         JmO0eRT4Q0xzoqTz/DzzUv5IJyjk/qKx0lg13AWSFK+aolayKlKy2bHuQui0z4v4gdZx
         wksQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjc9PzThkBgEhT3t8WAdwq/6IXh19H/K8luwnqSKO4yCCo3julhrt3cboxebambzGG9wOZmBlc5ik=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnzRrjtk6DxwceY/l3F7IDAd2pdDy1rQiARfkWGeYNji6h6oOq
	Zskg6Mfw/cPcQhE2+ARP/ZqdqbD71mn8MlPJS5Z+rQMl2UKcBGELSdSe
X-Gm-Gg: AZuq6aKfR7LILpT7o7dLSDt5VQ2Q8sCp4wi1Pm57Ch66Of7Z7NQN10yWeKqGxeU/wbs
	mdr7Yh+V4xHs70HG1XDeJ4Y2emXW8Woxb+VffX+88HqPuVpivcw/wn8zwECcuIZTd4DueEHC5a4
	Kwd/ESHFq/XzN8z+WXitoLk1ddfHzeaYmIVTyOboMGwcp6bQXxP0cmo5gsJAjlohfyVXDPI1g68
	KP5bsCpWXRQCpP6LSVKBPR4WuNSm+vlY+6EZ91DIIQ1ZCXZdy/qFgORqhMKkgXCK2qjtwB5KcCl
	UaotBukJZMFnlJ4K6DR7bSCz09nuww+xb24Kek1txVclPIAdrAQe2egnHwLJEdidh7zyu1DM6tV
	a7B/L5SSUcOBuuA5XO+sAwiFiWG3Dshuvu/Y5peYVm0Yqvq3TqhgXYEQU3NFj8LLGWyWN1K6mt+
	8S34t+
X-Received: by 2002:a05:600c:3e05:b0:47e:e20e:bbbf with SMTP id 5b1f17b1804b1-4804c9af18cmr26202045e9.24.1769133859669;
        Thu, 22 Jan 2026 18:04:19 -0800 (PST)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm3034233f8f.10.2026.01.22.18.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 18:04:17 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
Date: Fri, 23 Jan 2026 10:04:11 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <aXLM5vk0gDNjLPyY@acelan-Precision-5480>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andreas Noever <andreas.noever@gmail.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260121052744.233517-1-acelan.kao@canonical.com>
 <20260121060142.GJ2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121060142.GJ2275908@black.igk.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32640-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 682A26F6EE
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 07:01:42AM +0100, Mika Westerberg wrote:
> Hi,
>
> On Wed, Jan 21, 2026 at 01:27:44PM +0800, Chia-Lin Kao (AceLan) wrote:
> > PCIe devices behind Thunderbolt tunnels may fail to enumerate when
> > spurious hotplug events prevent pciehp from detecting link-up.
> >
> > Root cause:
> >
> > Spurious unplug events occur immediately after tunnel activation:
> >
> >   [  932.438] thunderbolt: acking hot unplug event on 702:2
> >   [  932.852] thunderbolt: PCIe Up path activation complete
> >   [  932.855] thunderbolt: hotplug event for upstream port 702:2
> >             (unplug: 0)
> >   [  932.855] thunderbolt: hotplug event for upstream port 702:2
> >             (unplug: 1)
> >
> > These events disrupt pciehp timing, causing device enumeration to fail
> > ~70% of the time on affected hardware. Manual PCI rescan succeeds,
> > proving devices are present and functional on the bus.
>
> Thanks for the report!
>
> They are likely TB3 xHCI "plug" events or so but they should not affect
> anything really.
>
> It may be that there is something in the TB3 compatibility side that we are
> not doing which needs to be investigated.
>
> From your merged.out.bad:
>
> CM does xHCI connect here:
>
> [  152.905840] [182] thunderbolt 0000:c7:00.6: 702: xHCI connect request
> [  152.906865] [182] thunderbolt 0000:c7:00.6: hotplug event for upstream port 702:2 (unplug: 0)
> [  152.906869] [182] thunderbolt 0000:c7:00.6: 2:8: got plug event for connected port, ignoring
> [  152.906872] [182] thunderbolt 0000:c7:00.6: hotplug event for upstream port 702:2 (unplug: 1)
> [  152.906875] [182] thunderbolt 0000:c7:00.6: 2:8: got unplug event for disconnected port, ignoring
>
> [  192.931373] [49] thunderbolt 0000:c7:00.6: acking hot unplug event on 2:7
>
> Can you comment out call to tb_switch_xhci_connect() and see if that
> changes anything?
Here is what I modified, and the problem becomes a little bit complicated.

I did the following steps(1~5) and captured the tbtrace log at step 5.
https://people.canonical.com/~acelan/bugs/tbt_storage/merged.out.remove_tb_switch_xhci_connect.out
1. Plugged one tbt storage on the Dock and connected the dock to the
machine
2. Boot the machine up, and it recognizes the tbt storage
3. Plugged the second tbt storage on the dock, and it also can be
recognized(it was always failed in this step)
4. Unplugged the first and second tbt storage from the dock, and then
re-plugged the first tbt storage on the dock, and it can be recognized
5. Re-plugged the second tbt storage on the dock, and it fails.

(continue doing the following tests)
a. When the issue happens, re-plugging the second tbt storage doesn't
work.
b. Plugged both tbt storages on the dock, and then re-plugged the dock to
the machine, both tbt storages can be recognized.
	b.1 In this case, it works when re-plugging the first or the
	    second tbt storage on the dock(there is always one tbt storage
	    still connected to the dock)
	b.2 Removed both tbt storages from the dock, and then
	    re-plugged them one by one, and the second tbt storage can't be
	    recognized.
c. Plugged one tbt storage on the dock, and then re-connected the dock to
	the machine, the tbt storage can be recognized.
	c.1 Plugged the second tbt storage on the dock, and the second tbt
	    storage can be recognized.
	c.2 Re-plugged the first or the second tbt storage on the
	    dock, both tbt storages can be recognized.
	c.3 Removed both tbt storages from the dock, and then
	    re-plugged them one by one, and the second tbt storage can't be
	    recognized.(same as b.2)

The issue could be reproduced when connecting the second tbt storage
to the dock.
1. Connect the dock to the machine with any tbt storage
2. Or remove all tbt storages from the dock if the dock is connected
3. And then plugged tbt storages one by one, and the second one won't be
   recognized.

rescan finds the missing tbt storage, but it works only one time. Need
to rescan again when re-plugging the first or the second tbt storage.
   echo 1 | sudo tee /sys/bus/pci/rescan

BTW, when the second tbt storage can't be recognized, unplug the first tbt
storage from the dock and the second tbt storage can be recognized.
And then re-plugged the first tbt storage on the dock, it can't be
recognized. The behavior just looks like it's the second tbt storage.

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 4f5f1dfc0fbf..be7ff82a3846 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2503,8 +2503,8 @@ static void tb_handle_hotplug(struct work_struct *work)
        } else if (port->remote) {
                tb_port_dbg(port, "got plug event for connected port, ignoring\n");
        } else if (!port->port && sw->authorized) {
-               tb_sw_dbg(sw, "xHCI connect request\n");
-               tb_switch_xhci_connect(sw);
+               tb_sw_dbg(sw, "DEBUG: Comment out xHCI connect request\n");
+               //tb_switch_xhci_connect(sw);
        } else {
                if (tb_port_is_null(port)) {
                        tb_port_dbg(port, "hotplug: scanning\n");

>
> > Solution:
> >
> > Schedule delayed work (300ms) after tunnel activation to:
> > 1. Check if pciehp successfully enumerated devices (device count increased)
> > 2. If not, trigger pci_rescan_bus() to discover devices manually
> > 3. Log results for observability
> >
> > The delayed work approach is non-blocking and only rescans when actually
> > needed, avoiding overhead on systems where pciehp works correctly.
>
> There is no way we are going to call PCI functions from the tb.c.

