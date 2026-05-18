Return-Path: <linux-usb+bounces-37634-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMZ0JQd3C2o+IAUAu9opvQ
	(envelope-from <linux-usb+bounces-37634-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 22:31:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8085857368E
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 22:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D7093008C07
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 20:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12435393DDA;
	Mon, 18 May 2026 20:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxZfAP/4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA933932C6
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 20:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779136253; cv=none; b=Eo7f6nuZOx2rZ04pF8F5Hsz3MthKA3Yz1C6c9gEjc81NbJ91v8F9VdTIEVtSajjV5W9nldea7bOmmIyc0tEHympqRCEy2mwBKXWk8ioHN+7uQnvvJYfu3Rq4PqtHdEOBMqdK1wnnb71hApnf+bO5fQaIq7JncMdlMy7EKWuGBag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779136253; c=relaxed/simple;
	bh=+AXWZ7VWZu++/J9Ox1DjhblJnRVzqBe9blE5RidmFX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7Kzz54tF5Jfb3vgRpXrPiZvx2RdSHCSV3LxNdJcOXzHsGBBYoeDs3kvhFARLkMpWF7wBlvXuDnFHAWEKgIG5U1HGSPOgvhbkVoQYWP5SrUCUl86urLPTtBKQTRCDHENtQrLXP/KtgLX9HQdnB+Y7M/k0OwaU8Z/D2rrKBi2I9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxZfAP/4; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bd266f6fc0so13146845ad.2
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 13:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779136252; x=1779741052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DlBfJe+9ZxBm7v8GCX+TON5gbGwp1e0878LuEL7rsgM=;
        b=JxZfAP/4U5fDo6s60PKFQHaFHBl+YMl8Uninfca6pyHv78ysYZBWfH+or94oSdEgZX
         GZGCn5UyLeefVm2gTHCSvCplLNp1lDG/0dydv9OjH4GOSzYk6xY9vTgPRTIrZLGNlqQB
         U8xdxdefwUbwh9MAe6PiFVc+0KZitzA4ZyDhFYbFd43cuNCMWFwFn/xUGGoTDd3uCHzQ
         iqtNJVMWRL5PLHypnsnfdR8EFoKLgodcTRDvRuGLBPxCOkSIGAdF2G7EIvcIpWL8DlxT
         nc8qgZcW5XQd47jwnb8CQI2W9pfW5ehvCRiVOnGXh0wp583XSswrNEZHH0jUjwnY89JW
         gAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779136252; x=1779741052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DlBfJe+9ZxBm7v8GCX+TON5gbGwp1e0878LuEL7rsgM=;
        b=eX286czIj3TXSJ4cOGHE3K08Zr8oNvFxY/AdWus6Vd9NP+15fa5jJbawuipaIDxRTN
         EcFyj1Xf41gs7/OGUcQifcOA6JiCWG2046fO8eZH9zJPH2gCb0ztd1mi6p0ygoc0OxpS
         NsimYqGmVHVJqN2i/YgqLt7V/p6pGXO8nK/+7eR0mcwjLtdJTFmuvZlpDIoBchfubKq5
         v7QcF9t6iBHDLy0R4IXkNfVlnZj17nEJtBlnbLVWWHoPlYWlBIppKhy+VuBPrg+lPheI
         BdgDgNlbuJ682kw/I3/qoujhV/Mta0+0jB+Ski7/y68d5BfK3qAX10A179C6GGEA9btZ
         wjAw==
X-Forwarded-Encrypted: i=1; AFNElJ8PwCtBZ8VWTYASJjpfdYFFOMMdoEJXkfW3nYXup913f7AoM0kVa3j2ItOAfN8WL9+ejlAdVlSjXRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTsvEU6LQy73OMmH0BoZ0eZZhmLhBksm9IABpeTEDngG+7vIp2
	RBXdMRKD4dIF/b4Ra8SfHDGQN5nrPqcMohUxCa5D8SePcjtChudUhFFW
X-Gm-Gg: Acq92OEp/n5IMM5xotUS+0tzXG06fD8g17SVO8BIkoSlueen+GhS1FjvFrxNLMktVWH
	Psf2LprHtSw+UzNviETAKMGjtwLfJUmlKy/qrEWfZsIkzKQ6sM29lJJ9i9dmo6Nk46LW7Plqa0P
	mY1nz8zxrTIipammFz00lsXNjEZc+WIXvbfg3Edi4cHABRHWqDGLnYGaOTROGqWSkit3NWffQDo
	0enqE64lojR80AbiCI1PkrvXwb7WLiUJbbktnymjEEOkWeJ2cnmGnt8uAudGII/PztUqu7F3i8Z
	KVLMefsgZ8UhsNhN1AR/xhieYiQBmlkocL3+Q2ZbDIhtJnMHec5tbvuW5a1fB/5xXL3ZFP5FGMj
	akNvCCb8KEg63aii72RuupNTFXwwCS1UaXYuEesibOhC/oduiHN0ge1mJNaVJzNnZ8lAoXOWwIk
	nLaZ8GM8Wz+b5/Ohl3x6HnQUdB1MhmFWo=
X-Received: by 2002:a17:902:d511:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2bd7e8cb160mr173923295ad.18.1779136251551;
        Mon, 18 May 2026 13:30:51 -0700 (PDT)
Received: from [192.168.89.2] ([119.214.48.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd60275sm150934905ad.7.2026.05.18.13.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 13:30:51 -0700 (PDT)
Message-ID: <144ec61c-4cc1-4986-a16c-7c1b99f3a72e@gmail.com>
Date: Tue, 19 May 2026 05:30:47 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Yaroslav Isakov <yaroslav.isakov@gmail.com>
References: <20260517130407.795157-1-hurryman2212@gmail.com>
 <20260517130407.795157-2-hurryman2212@gmail.com>
 <20260517232147.34931718.michal.pecio@gmail.com>
Content-Language: en-US
From: Jihong Min <hurryman2212@gmail.com>
In-Reply-To: <20260517232147.34931718.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37634-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[linuxfoundation.org,intel.com,roeck-us.net,lwn.net,amd.com,vger.kernel.org,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hurryman2212@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8085857368E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/26 06:21, Michal Pecio wrote:
 > Instead of the X86 heuristic, would it be possible to build glue
 > code if and only if SENSORS_PROM21_XHCI is enabled?
 >
 > This seems to work:
 >
 >   config SENSORS_PROM21_XHCI
 >          tristate "AMD Promontory 21 xHCI temperature sensor"
 > -       depends on USB_XHCI_PCI_PROM21
 > +       depends on USB_XHCI_PCI
 >
 >   config USB_XHCI_PCI_PROM21
 >          tristate
 > -       depends on X86
 >          depends on USB_XHCI_PCI
 > -       default USB_XHCI_PCI
 > +       default USB_XHCI_PCI if SENSORS_PROM21_XHCI != 'n'
 >          select AUXILIARY_BUS
 >
 > I don't know if it's the best way, perhaps it would be preferable for
 > the hwmon driver to select the glue, but then I'm not sure how to force
 > glue to become 'y' when xhci-pci is 'y'.

I think I should keep the current hidden glue option for now.

The PROM21 PCI glue is part of the PCI binding path for the xHCI controller
when enabled, while SENSORS_PROM21_XHCI is only the optional user-visible
hwmon driver. Tying the glue to the hwmon option would make the sensor 
option
affect which driver binds the USB controller. As Guenter pointed out, that
would be too strong; the USB controller should not depend on whether the
optional hwmon driver is enabled.

So I would prefer to keep USB_XHCI_PCI_PROM21 as hidden plumbing that 
follows
USB_XHCI_PCI, and keep SENSORS_PROM21_XHCI as the user-visible sensor 
option.

 > +static int prom21_xhci_create_auxdev(struct pci_dev *pdev)
 > +{
 > +	struct prom21_xhci_auxdev *prom21_auxdev;
 > +	struct usb_hcd *hcd = pci_get_drvdata(pdev);
 > +
 > +	if (!hcd)
 > +		return -ENODEV;
 >
 > Shouldn't be necessary after successful xhci_pci_common_probe().

Agreed. I removed the unnecessary NULL check from
prom21_xhci_create_auxdev() locally for v7.

 > +	prom21_auxdev->id = ida_alloc(&prom21_xhci_auxdev_ida, GFP_KERNEL);
 > +	if (prom21_auxdev->id < 0) {
 > +		int ret = prom21_auxdev->id;
 > +
 > +		devres_free(prom21_auxdev);
 > +		return ret;
 > +	}
 > +
 > +	prom21_auxdev->auxdev = auxiliary_device_create(&pdev->dev,
 > +							KBUILD_MODNAME, "hwmon",
 > +							&prom21_auxdev->pdata,
 > +							prom21_auxdev->id);
 > +	if (!prom21_auxdev->auxdev) {
 > +		ida_free(&prom21_xhci_auxdev_ida, prom21_auxdev->id);
 > +		devres_free(prom21_auxdev);
 > +		return -ENOMEM;
 >
 > The usual "goto error" pattern could be used instead of increasingly
 > long sequences of xxx_free() calls.

Agreed. I changed prom21_xhci_create_auxdev() to use a goto-based 
cleanup path
locally for v7.

 > It seems that these three functions above are everything that you truly
 > want to add; the rest is boilerplate required by this two-module scheme
 > to work, plus ID tables which must be duplicated and kept in sync.
 >
 > I wonder if a separate module is really justified, as opposed to simply
 > linking this file into xhci_pci.ko when directed by Kconfig.
 >
 > The downside would be slightly higher memory usage on systems where the
 > hwmon driver is enabled but not needed. OTOH, same systems would likely
 > see reduced disk waste.

I understand the concern. Linking the PROM21 auxiliary-device publisher
into xhci_pci.ko would reduce some boilerplate and avoid the extra PCI
driver, while still keeping the hwmon driver itself separate.

The reason I kept the current split is that the earlier review direction
was to keep the hwmon functionality out of xhci-pci and bind a
drivers/hwmon driver through an auxiliary device. The current PROM21 PCI
glue keeps the PROM21-specific auxiliary-device lifetime handling outside
the common xhci-pci driver and leaves xhci-pci.c with only the PCI ID
handoff, similar in spirit to the Renesas handoff path.

That said, I agree this is a tradeoff. If Mathias or the USB maintainers
prefer the PROM21 auxiliary-device publisher to be linked into xhci_pci.ko
instead of being a separate PCI glue driver, I can rework it in that
direction while still keeping the hwmon driver under drivers/hwmon and
bound through the auxiliary bus.


Sincerely,
Jihong Min


