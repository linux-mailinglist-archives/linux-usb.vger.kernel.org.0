Return-Path: <linux-usb+bounces-32899-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH7VBx30emnDAAIAu9opvQ
	(envelope-from <linux-usb+bounces-32899-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 06:46:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AB4AC060
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 06:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8319F301A174
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 05:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47832F0661;
	Thu, 29 Jan 2026 05:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IliNbB64"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1708723E23C
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 05:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769665562; cv=none; b=DX9Hscf60SBLXlouZaz9XgA4K0CDXvoYBbHr0qANDisXTZ5s6OPUTf8Q1D7JmfoWqZeirtMSLEwOIhQ4zPvC1eJJSB0L3fw8OU8UaXInn9XQxsPQ6Cwt/5dTPEy5ceCX4gqscldrzWcSxvBAkI/jyW7d9PgFAEy8uzCtd9wy5sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769665562; c=relaxed/simple;
	bh=ahZ4+3lXTp9ovPIjlAbor/1CpZ8t+hMCoYg1Z0mPVp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmkyXZ8zPzA0vpZEJnr00fRJVilxrQjR/wiUwml3WoFFNba+XgkWVG+I4l0rnFvkIfFHsjOP1e4n4wBMIP3SS/nMkifDbzTJDlto+IfWZSx4kAzvCIn33pmQ2CtErzQLJY362g+dDO7X4i9B3RVvHx4HegZeNRqS/zPUBvHRruI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IliNbB64; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-435903c4040so382048f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 21:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769665558; x=1770270358; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1yR8SsWcInqczfEeaCasTva/BWk1U73Hf+JCzmtLtvU=;
        b=IliNbB64Z9xuk8jGEY5NnfuPfw8NATTMrDaoO0+ncmgpfwLJwbXbVJnXwtkn7Gws0Z
         TkZPtYruJc6cDHuE9vibuJPqhn1iSAZm9c8utWTxu0FXpLiT3n+f1vGC6dXWAamjaG7g
         vfghguP1870tetLLDt5jd28p19gDPJPPWTAELEsugwprZ74QXHV1/MINI02tgz8yJJxC
         rReUsrSdehon9kuvzYfZOjF42XihFPJmF1YAw4reXhoIl4mcl//M9z1KvGPl9mG0+gC6
         8aDjjKeSA72kqxNIaIVrwZic8vdMb3mu2GQceFLH05J/BpAbrqC1Hya7XsLAVCSAeaEJ
         pzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769665558; x=1770270358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yR8SsWcInqczfEeaCasTva/BWk1U73Hf+JCzmtLtvU=;
        b=WHLCL+0z9JA7XshKD+mpGTXnmGZPunGY7xNKAoGhWQaZd/GT5/59U3ZgmuV1sTNGfZ
         +jYvG93ET5ILba/eTXjQlhF4CIR4RLSumrZm2XUDWEihcDPlxL7ihz+CmcOowzv4qNkH
         JgdWo/C3t9GlhFUP7p/6kkOR3Y3b7D2RDiM+7fEwNxNBOzKvyVnFeI2Yfq/Qqr5XSoqQ
         RVMrqsqWT18+s5QLTw2L83hUftjcLayhz+a445oqzbhLSb4qiASjrxxNT1FBHSFcIPbj
         5OxN8KO8bFdTEg6uGqOwM5Q/4eUSiQAaSZamoPM9dk3fFrUsiGfidGUj+n4g5OPQwdWx
         FBCA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ98xlwR9Mcoc2harg9rfUkN26KkMhCeYQugulvXOulL0xmpBtoQDPpHRmBsenStFbh+gWOx8lva4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU2vNm8LmgANRB0LMpSnvufbTZRgMt1cSYxDDnm9PXbhyOZ2wR
	pUiqCI639bzfX55GHDzaG99izgoUA5PIxZcMNQX/Ww3ITaezpECcJPh3FGdcULNe
X-Gm-Gg: AZuq6aI1LHlM5IwAcQRVYu1otyUHYtTkuczNBdRMrU/r6Brq6onUMkzooETAlj1RqfP
	UP9dXB6V2Y3c06qHUqaUYrMDhjalmBLZnur1OrGwcQuKutwSM0SwazA+a8SDL4dL7I4gmiPfKUJ
	RbTL9lqr9A0pXgeYJXkX/iCAK7J3GWOvKR564LECsInWzDqwemBsVmwfEE7l3RT0rT2ywkA0MQb
	z1rWV2dvuy7C2dDL02no7MC5L8ptr9+6jEls/9jIE4MDq9KukmNwPyWUD/ilxHjtA/c1DzZ1KVn
	c224vsVr7W9Rcx5n+6MJhAO1KZ5Fnw3usDV0m0lQYu+bnMihG0UsuYRIyaib5W+HmuBTtcbKMMM
	cQATX7PIK4eaKPmwRiiBHoGW/qnQdVpmERvq9f4Z0xu/LLSZI6s9lBJOPJQfp1ec/mQj0sly3Cx
	p3tzDE
X-Received: by 2002:a05:6000:438a:b0:435:a8e7:62de with SMTP id ffacd0b85a97d-435dd1cdfc1mr11417105f8f.58.1769665558157;
        Wed, 28 Jan 2026 21:45:58 -0800 (PST)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce93sm11495753f8f.24.2026.01.28.21.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 21:45:57 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
Date: Thu, 29 Jan 2026 13:45:51 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <aXrZK-WigVeqxBTT@acelan-Precision-5480>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andreas Noever <andreas.noever@gmail.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Gil Fine <gil.fine@linux.intel.com>
References: <20260121060142.GJ2275908@black.igk.intel.com>
 <aXLM5vk0gDNjLPyY@acelan-Precision-5480>
 <20260123120112.GQ2275908@black.igk.intel.com>
 <aXbTfLUJ-lEfNzgX@acelan-Precision-5480>
 <20260126054231.GR2275908@black.igk.intel.com>
 <aXcWNw9Qfo5L9WVi@acelan-Precision-5480>
 <20260126115654.GS2275908@black.igk.intel.com>
 <aXg1eBudRAaCZpmR@acelan-Precision-5480>
 <20260127084513.GC2275908@black.igk.intel.com>
 <20260127101701.GI2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127101701.GI2275908@black.igk.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32899-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-usb@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,canonical.com:url]
X-Rspamd-Queue-Id: 94AB4AC060
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 11:17:01AM +0100, Mika Westerberg wrote:
> On Tue, Jan 27, 2026 at 09:45:13AM +0100, Mika Westerberg wrote:
> > On Tue, Jan 27, 2026 at 01:04:20PM +0800, Chia-Lin Kao (AceLan) wrote:
> > > On Mon, Jan 26, 2026 at 12:56:54PM +0100, Mika Westerberg wrote:
> > > > On Mon, Jan 26, 2026 at 03:48:48PM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > > On Mon, Jan 26, 2026 at 06:42:31AM +0100, Mika Westerberg wrote:
> > > > > > On Mon, Jan 26, 2026 at 11:30:47AM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > > > > Hi,
> > > > > > > On Fri, Jan 23, 2026 at 01:01:12PM +0100, Mika Westerberg wrote:
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > On Fri, Jan 23, 2026 at 10:04:11AM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > > > > > > > Can you comment out call to tb_switch_xhci_connect() and see if that
> > > > > > > > > > changes anything?
> > > > > > > > >
> > > > > > > > > Here is what I modified, and the problem becomes a little bit complicated.
> > > > > > > >
> > > > > > > > Okay I see it did not change anything (well this is kind of what I
> > > > > > > > expected). Thanks for trying.
> > > > > > > >
> > > > > > > > I see in your log that the PCIe tunnel is established just fine. It's just
> > > > > > > > that there is no PCIe hotplug happening or it is happening but the PCIe
> > > > > > > > Downstream Port is not waking up.
> > > > > > > >
> > > > > > > > I figured you have following USB4/TB topology, right?
> > > > > > > >
> > > > > > > >   AMD Host <-> GR Hub <-> TB3 Hub
> > > > > > > >                   ^
> > > > > > > >                   |
> > > > > > > >                 TB3 Hub
> > > > > > > Should be more like this
> > > > > > >   AMD Host <-> Dell TB4 Dock <-> OWC Envoy Express (1-502)
> > > > > > >                              \
> > > > > > >                               <-> OWC Envoy Express (1-702)
> > > > > > > or
> > > > > > >   AMD Host (1-0, domain1)
> > > > > > >       |
> > > > > > >       └─ Port 2 ──→ Dell Thunderbolt 4 Dock (1-2)
> > > > > > >                       ├─ Port 5 ──→ OWC Envoy Express (1-502)
> > > > > > >                       └─ Port 7 ──→ OWC Envoy Express (1-702)
> > > > > >
> > > > > > Okay so the same ;-)
> > > > > >
> > > > > > > > What if you run 'lspci' after the issue reproduces? Does that bring the
> > > > > > > > missing PCIe devices? I suspect that this is due to older TB3 devices that
> > > > > > > > they may need bit more time to get the PCIe link (going over the tunnel) up
> > > > > > > > and running.
> > > > > > > lspci doesn't bring back the missing tbt storage.
> > > > > >
> > > > > > Forgot to mention that let it (the whole topology) enter runtime suspend
> > > > > > before you run lspci.
> > > > >
> > > > > https://people.canonical.com/~acelan/bugs/tbt_storage/dmesg_lspci.log
> > > > >
> > > > > The behavior is strange, the following 3 devices keep entering D3cold and then comes back
> > > > > to D0 quickly. So, I'm not sure if the lspci do the actions you want.
> > > >
> > > > Yes. I should have mentioned so the lspci is there exactly to trigger
> > > > runtime resume of the topology. I was hoping the PCIe links get
> > > > re-established properly then.
> > > >
> > > > Can you do so that you:
> > > >
> > > > 1. Plug in the dock.
> > > > 2. Plug in the other storage to the dock.
> > > > 3. Block runtime PM from the PCIe Downstream Port that should lead to the
> > > >    second storage device PCIe Upstream Port
> > > >
> > > >  # echo on > /sys/bus/pci/devices/DEVICE/power/control
> > > >
> > > > 4. Connect the second storage device and enable PCIe tunnel.
> > > >
> > > > Does that make it work each time?
> > > Yes, follow the steps makes it work.
> > >
> > >    echo on | sudo tee /sys/bus/pci/devices/*/*/power/control
> > >
> > > Re-plug the dock, need to disable the runpm again.
> >
> > But can you just block it from the PCIe Downstream Port that leads to the
> > "non-working" storage before you enable PCIe tunnel? Not for all the
> > devices.
> >
> > (let me know if you want help locating the correct device).
> >
> > Does it still work?
Here's the full PCI device chain graph:

    0000:00:01.2 - AMD PCI Root Port
        |
        └─ 0000:61:00.0 - Intel Thunderbolt 4 Bridge [Goshen Ridge 2020]
               |
               └─ 0000:62:02.0 - Intel Thunderbolt 4 Bridge [Goshen Ridge 2020]
                      |
                      └─ 0000:83:00.0 - Intel TBT3 Bridge (Upstream Port) [Alpine Ridge LP]
                             |
                             └─ 0000:84:01.0 - Intel TBT3 Bridge (Downstream Port) [Alpine Ridge LP]
                                    |
                                    └─ 0000:85:00.0 - Sandisk PC SN740 NVMe SSD (nvme2)

When the tbt storage is not recognized, we don't have 83:00.0 and its
downstream port 84:01.0.

$ ls /sys/bus/pci/devices
0000:00:00.0  0000:00:02.1  0000:00:08.1  0000:00:18.1  0000:00:18.7  0000:62:04.0  0000:c3:00.0  0000:c5:00.5  0000:c7:00.4
0000:00:00.2  0000:00:02.3  0000:00:08.2  0000:00:18.2  0000:61:00.0  0000:a2:00.0  0000:c4:00.0  0000:c5:00.7  0000:c7:00.5
0000:00:01.0  0000:00:02.4  0000:00:08.3  0000:00:18.3  0000:62:00.0  0000:a3:01.0  0000:c5:00.0  0000:c6:00.0  0000:c7:00.6
0000:00:01.1  0000:00:02.5  0000:00:14.0  0000:00:18.4  0000:62:01.0  0000:a4:00.0  0000:c5:00.1  0000:c6:00.1
0000:00:01.2  0000:00:03.0  0000:00:14.3  0000:00:18.5  0000:62:02.0  0000:c1:00.0  0000:c5:00.2  0000:c7:00.0
0000:00:02.0  0000:00:08.0  0000:00:18.0  0000:00:18.6  0000:62:03.0  0000:c2:00.0  0000:c5:00.4  0000:c7:00.3

Disable runpm on 62:02.0, then we have 83:00.0 and its downstream port
84:01.0 and 85:00.0, and then the tbt storage is recognized.

$ echo on | sudo tee /sys/bus/pci/devices/0000:62:02.0/power/control
on

$ ls /sys/bus/pci/devices
0000:00:00.0  0000:00:02.1  0000:00:08.1  0000:00:18.1  0000:00:18.7  0000:62:04.0  0000:a4:00.0  0000:c5:00.1  0000:c6:00.1
0000:00:00.2  0000:00:02.3  0000:00:08.2  0000:00:18.2  0000:61:00.0  0000:83:00.0  0000:c1:00.0  0000:c5:00.2  0000:c7:00.0
0000:00:01.0  0000:00:02.4  0000:00:08.3  0000:00:18.3  0000:62:00.0  0000:84:01.0  0000:c2:00.0  0000:c5:00.4  0000:c7:00.3
0000:00:01.1  0000:00:02.5  0000:00:14.0  0000:00:18.4  0000:62:01.0  0000:85:00.0  0000:c3:00.0  0000:c5:00.5  0000:c7:00.4
0000:00:01.2  0000:00:03.0  0000:00:14.3  0000:00:18.5  0000:62:02.0  0000:a2:00.0  0000:c4:00.0  0000:c5:00.7  0000:c7:00.5
0000:00:02.0  0000:00:08.0  0000:00:18.0  0000:00:18.6  0000:62:03.0  0000:a3:01.0  0000:c5:00.0  0000:c6:00.0  0000:c7:00.6

BTW, rescan also workaround the issue

$ echo 1 | sudo tee /sys/bus/pci/devices/0000:62:02.0/rescan
>
> (+Gil)
>
> There is also one patch that fixes the driver to follow more closely the CM
> guide and that's related to the PCIe tunneling and may actually explain the
> issue you see:
>
>   https://lore.kernel.org/linux-usb/20260127094953.GF2275908@black.igk.intel.com/
>
> Note it only does that for USB4 routers so you may need to tune that so
> that it skips that check but there is complication because IIRC LTTSM bits
> do not match the USB4 ones. One thing to try is to just check the USB4 PCIe
> adapter side that it is in detect.
I applied this series directly on top of 6.19-rc6, and the issue
persists.

Here is the modification I tried, but it doesn't work.

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 51fd05b3e341..0672d3e3c24e 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -302,14 +302,38 @@ static int tb_pci_pre_activate(struct tb_tunnel *tunnel)
        struct tb_port *up = tunnel->dst_port;
        int ret;

-       if (!tb_switch_is_usb4(down->sw) || !tb_switch_is_usb4(up->sw))
-               return 0;
+       /*
+        * Try checking LTSSM state for both USB4 and TBT3 devices.
+        * Check at least the USB4 side if only one side is USB4.
+        */
+       tb_port_dbg(down, "PCIe downstream port: USB4=%d\n", tb_switch_is_usb4(down->sw));
+       tb_port_dbg(up, "PCIe upstream port: USB4=%d\n", tb_switch_is_usb4(up->sw));

-       ret = usb4_pci_port_check_ltssm_state(down, TB_PCIE_LTSSM_DETECT);
-       if (ret)
-               return ret;
+       if (tb_switch_is_usb4(down->sw)) {
+               tb_port_dbg(down, "Checking PCIe downstream LTSSM state\n");
+               ret = usb4_pci_port_check_ltssm_state(down, TB_PCIE_LTSSM_DETECT);
+               if (ret) {
+                       tb_port_warn(down, "PCIe adapter not in detect state: %d\n", ret);
+                       return ret;
+               }
+               tb_port_dbg(down, "PCIe downstream adapter in detect state\n");
+       } else {
+               tb_port_dbg(down, "Skipping LTSSM check (not USB4)\n");
+       }
+
+       if (tb_switch_is_usb4(up->sw)) {
+               tb_port_dbg(up, "Checking PCIe upstream LTSSM state\n");
+               ret = usb4_pci_port_check_ltssm_state(up, TB_PCIE_LTSSM_DETECT);
+               if (ret) {
+                       tb_port_warn(up, "PCIe adapter not in detect state: %d\n", ret);
+                       return ret;
+               }
+               tb_port_dbg(up, "PCIe upstream adapter in detect state\n");
+       } else {
+               tb_port_dbg(up, "Skipping LTSSM check (not USB4)\n");
+       }

-       return usb4_pci_port_check_ltssm_state(up, TB_PCIE_LTSSM_DETECT);
+       return 0;
 }

 static int tb_pci_set_ext_encapsulation(struct tb_tunnel *tunnel, bool enable)

$ sudo dmesg | egrep "PCIe|USB4"

Plug the first tbt storage,

[  460.465644] [1668] thunderbolt 0000:c7:00.6:  Port 4: 8086:15c0 (Revision: 1, TB Version: 1, Type: PCIe (0x100102))
[  460.891208] [3953] thunderbolt 0000:c7:00.6: 2:12: PCIe downstream port: USB4=1
[  460.891210] [3953] thunderbolt 0000:c7:00.6: 702:4: PCIe upstream port: USB4=0
[  460.891212] [3953] thunderbolt 0000:c7:00.6: 2:12: Checking PCIe downstream LTSSM state
[  460.891327] [3953] thunderbolt 0000:c7:00.6: 2:12: PCIe downstream adapter in detect state
[  460.891328] [3953] thunderbolt 0000:c7:00.6: 702:4: Skipping LTSSM check (not USB4)
[  460.891329] [3953] thunderbolt 0000:c7:00.6: activating PCIe Down path from 2:12 to 702:4
[  460.891849] [3953] thunderbolt 0000:c7:00.6: PCIe Down path activation complete
[  460.891850] [3953] thunderbolt 0000:c7:00.6: activating PCIe Up path from 702:4 to 2:12
[  460.892375] [3953] thunderbolt 0000:c7:00.6: PCIe Up path activation complete
[  461.018893] pci 0000:a2:00.0: [8086:15c0] type 01 class 0x060400 PCIe Switch Upstream Port
[  461.019746] pci 0000:a2:00.0: 2.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x1 link at 0000:00:01.2 (capable of 8.000 Gb/s with 2.5 GT/s PCIe x4 link)
[  461.020620] pci 0000:a3:01.0: [8086:15c0] type 01 class 0x060400 PCIe Switch Downstream Port
[  461.021846] pci 0000:a4:00.0: [144d:a809] type 00 class 0x010802 PCIe Endpoint
[  461.022555] pci 0000:a4:00.0: 2.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x1 link at 0000:00:01.2 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)

And then the second tbt storage,

[  472.025559] [1668] thunderbolt 0000:c7:00.6:  Port 4: 8086:15c0 (Revision: 1, TB Version: 1, Type: PCIe (0x100102))
[  472.451726] [3953] thunderbolt 0000:c7:00.6: 2:11: PCIe downstream port: USB4=1
[  472.451728] [3953] thunderbolt 0000:c7:00.6: 502:4: PCIe upstream port: USB4=0
[  472.451729] [3953] thunderbolt 0000:c7:00.6: 2:11: Checking PCIe downstream LTSSM state
[  472.451851] [3953] thunderbolt 0000:c7:00.6: 2:11: PCIe downstream adapter in detect state
[  472.451852] [3953] thunderbolt 0000:c7:00.6: 502:4: Skipping LTSSM check (not USB4)
[  472.451853] [3953] thunderbolt 0000:c7:00.6: activating PCIe Down path from 2:11 to 502:4
[  472.452373] [3953] thunderbolt 0000:c7:00.6: PCIe Down path activation complete
[  472.452374] [3953] thunderbolt 0000:c7:00.6: activating PCIe Up path from 502:4 to 2:11
[  472.452893] [3953] thunderbolt 0000:c7:00.6: PCIe Up path activation complete

My issue should be happening after the PCIe tunnel is activated.

>
> Second thing to try is to disable PCIe ASPM L1. We can do that from CM side
> like we do already in tb_switch_pcie_l1_enable(). If possible you can try
> so that you disable it from the BIOS (but don't use the pcie_aspm=  command
> lne parameter).
I can't disable PCIe ASPM L1 from the driver, and there is no option in
the BIOS to switch it off.

