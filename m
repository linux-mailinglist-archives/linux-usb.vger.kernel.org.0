Return-Path: <linux-usb+bounces-37635-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCWoMM93C2o+IAUAu9opvQ
	(envelope-from <linux-usb+bounces-37635-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 22:34:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8788E573719
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 22:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CEBF30221CF
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 20:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BAF392803;
	Mon, 18 May 2026 20:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drMkUY+c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4A2405C20
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 20:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779136453; cv=none; b=BX0cnuYI1gKy/FlXFiLCK0dwUo3KTHaw+wQB7TgJ1vaLvhCAQOdQH9F3674zN3IM98qvp+rgac1ZOAkcfrgLQXZDcfSshWWvK8xLGwOWe1DErah/RpBKvMUpru+xtuGq/gzV/RdFuOPDzTeQwYHucQydBOFZuF17IZp5Xo8Lcik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779136453; c=relaxed/simple;
	bh=6I+QElhAtc/8WabSKYbV0PXAFvgWpATjbvBd61/xDHI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XKmKB/aJCzrpkGnYxdmqPp16XNZhQGBDhgNiDKGJgIu5r/5Oi3QmgIwaGcKO4TPIunULR7cLgtWd3Kua6Mx3CXhuc0lyLPHqbBvaO3Vo/YAu4Cml3ULoHgmh2LcToo2ppwf9ycudJa+X0URGyNitS6VDNvaW2+EAE6JCoD2N8rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drMkUY+c; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so2513949f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 13:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779136450; x=1779741250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTgYcEc55BDnl6ROBsBVO2eyQ8MbIi/0Xe4r8X6dKhw=;
        b=drMkUY+ciugqawq3ukBhLpwunBhAUQuwYrkglE29OG13pigY/pc31FwwbTyX/UZQXe
         keRKJUNZE0nRVsHt5XnQumz+hBjSdwSeURsAkBI2KFQjFT7tMtvVZbPkLtbfh5NzX39a
         xa/WHepdwHjbmnJLqiHhLIveq7BtmV4usTMl9r92d1oLK8zj0ryJcS70kPlVc4e9grtp
         sU0yfVkkEIb71vFGBsVluQJVF7qCYX+UGd11pPUAZAAVN0dtOMBawuirOSg18uqHz4yN
         +VDc3Q36ODvlFvsKV1sAWcO+fQHCTKznwNAvm7qKXeWUwk4jCZHBn6KQj0V8KD3eAdpO
         9RNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779136450; x=1779741250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sTgYcEc55BDnl6ROBsBVO2eyQ8MbIi/0Xe4r8X6dKhw=;
        b=Ld1RJsxYCUFEStodB2C4oNn4vcwWr0xxYyp9F16eTANVLQhnEpmEXlsDJQQz5ldRyI
         L6etpMMR5MWByta626vP023PEeO3Ln3/j98hNSDdfdmzHnGarIgrmpIvKSX/Yq9j2Pqh
         Yx68p/+HCimzkO0Fp6eEy+A2nZQ/zonMg3DU0LwcId1LE6yawX2GB5/2v86DCnY2FNAH
         kfkR6NT31dXAC+CCDw7hj5yvNK6dwIfy+k0dHtKjmZd4/C8BmHQu5mAF9q/TqRcVQfYG
         vN2UqrgDKrGbfnE9iEh+QOUVcyS5UQJyD7x7OjVc7ZJ1qZoR2w/p201KbtnrNfdxVVey
         vwOg==
X-Forwarded-Encrypted: i=1; AFNElJ/izmZWOvF7/rKPWUJFSGM3JtqlVTgJeMJimsPFOp34O48X6Z1TEJEVXu5KzpupCMbx736zKV57K/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMSWQ0SbmfN3EDY4NWoAifIeIEdf7yyOD7h72E9F70zLqjjtnM
	0UtNhtPcou12kNuk48WpEPwYhOQwCqNULhmQFiY4SHkZ1KGP+ajv9QnX
X-Gm-Gg: Acq92OGKleMZHXbLxVznohxGXJQwv8ZG5WHQMppKW++zBIxOITFfqA1wBDUJR9hBbAa
	5hbW+Qqwe0nHgq0y/aR/SL6UIRizPwiA1rtaWZEnU8xyMO/uEoFOsiPGdunNqfVdFHt/9vSd/CG
	ngsAPXkwcxzcoJYZhL+Dv1YzPji9pFQXDHsyWdq+BGxykhdFRkpmwStGBneA8JpqVU4YPn0yx3U
	mQ6YlBP7N3f2wuSaKyAgOLSOtjT187GwzPJ+fD8VZQ1uVJksvF5swYKgrqW+a1262+6JZXELcqQ
	clToU+n0ySNkUMj4rgIrXz4UT6Hn9A37LRhyqmLD2hhO2tyur/6awfD9C6mPn1re4WabEIOTkUr
	qCD1lFwJkgXmYXlLqeMSQAlmN06YEQOAM41iDI3eoYXv5mqN6vWiqQXKKNOHisCLAzJ9DHBYgz3
	TPrsjTAltv2OIJNIKwb4V6CyA3aL6mBwUglLJvfPdD3M0=
X-Received: by 2002:a05:6000:402c:b0:453:9897:76aa with SMTP id ffacd0b85a97d-45d93eccfbfmr34057576f8f.21.1779136450085;
        Mon, 18 May 2026 13:34:10 -0700 (PDT)
Received: from foxbook (bfk48.neoplus.adsl.tpnet.pl. [83.28.48.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm36967631f8f.11.2026.05.18.13.34.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 18 May 2026 13:34:09 -0700 (PDT)
Date: Mon, 18 May 2026 22:34:05 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jihong Min <hurryman2212@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Basavaraj Natikar
 <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, "Mario Limonciello
 (AMD)" <superm1@kernel.org>, Yaroslav Isakov <yaroslav.isakov@gmail.com>
Subject: Re: [PATCH v6 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
Message-ID: <20260518223405.06cd8fbd.michal.pecio@gmail.com>
In-Reply-To: <f05e075d-a87e-49b5-95f8-5858d21acf64@roeck-us.net>
References: <20260517130407.795157-1-hurryman2212@gmail.com>
	<20260517130407.795157-2-hurryman2212@gmail.com>
	<20260517232147.34931718.michal.pecio@gmail.com>
	<f05e075d-a87e-49b5-95f8-5858d21acf64@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37635-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,intel.com,lwn.net,amd.com,vger.kernel.org,kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8788E573719
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 18 May 2026 03:55:52 -0700, Guenter Roeck wrote:
> On 5/17/26 14:21, Michal Pecio wrote:
> > Instead of the X86 heuristic, would it be possible to build glue
> > code if and only if SENSORS_PROM21_XHCI is enabled?
> > 
> > This seems to work:
> > 
> >   config SENSORS_PROM21_XHCI
> >          tristate "AMD Promontory 21 xHCI temperature sensor"
> > -       depends on USB_XHCI_PCI_PROM21
> > +       depends on USB_XHCI_PCI
> > 
> >   config USB_XHCI_PCI_PROM21
> >          tristate
> > -       depends on X86
> >          depends on USB_XHCI_PCI
> > -       default USB_XHCI_PCI
> > +       default USB_XHCI_PCI if SENSORS_PROM21_XHCI != 'n'
> >          select AUXILIARY_BUS
> > 
> > I don't know if it's the best way, perhaps it would be preferable for
> > the hwmon driver to select the glue, but then I'm not sure how to force
> > glue to become 'y' when xhci-pci is 'y'.
> >   
> 
> Unless I am missing something, that would disable the entire controller
> if the hwmon device is not enabled. That seems a bit draconian to me.

I haven't tested (I don't have this chipset), but it should work like
the similar xhci-pci-renesas module, which I'm familiar with.

When the special unicorn module is disabled by Kconfig, xhci-pci no
longer rejects its devices and works with them normally, like it always
did before the unicorn module even existed.

It should be the same with xhci-pci-prom21. You don't need to enable
this module to use USB, only for the special functions. So if hwmon
is disabled then you can disable it too.

I always found this dual-driver solution (for Renesas) rather ugly and
confusing, but so far it's the least bad option tried. Hmm, maybe the
next iteration should be an aux bus interface for FW loaders...

Regards,
Michal

