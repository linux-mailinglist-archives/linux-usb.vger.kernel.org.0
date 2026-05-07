Return-Path: <linux-usb+bounces-37046-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF1IGU7l+2kxHgAAu9opvQ
	(envelope-from <linux-usb+bounces-37046-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 03:05:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D30D54E1CE8
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 03:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F34313022571
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 01:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6183621D3E4;
	Thu,  7 May 2026 01:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rrz6HQrg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02381A3172;
	Thu,  7 May 2026 01:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778115908; cv=none; b=PKjI6i8UiITchcJnrXGVowKVQFaHXuBT5aOi7sxExvzFWT8fGLpWpx4Pbwv4aKf+5rty8CWxCMLDz4FkgxVq28tpL0pnDN56GbWNKevY0m+r+9W+FiK7hXGUAGx5Mj3KcyR4c+SwAXKin0k+g0MxGHQTa8GN9ry/qb6RRwMjwRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778115908; c=relaxed/simple;
	bh=PJbNGrdBKjT819EcGFwgq2f2GXrpGtfZvL5YkIaupN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpmzX2ImP2Rw9KbXPNB7QPVzjXVDMQj/imQDQ7QCNHc0qhBgKKZPGbCy++jod15Lt0i5QeZfmdqAQCeniYzZ/AHhYcWKPGqf95dYH+9l5q8ZUfm5C8ebLyPJGbq5CgadzxpQthglsr60dYsAElcM4ZIe4LouNInrPNZBvDXzRTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rrz6HQrg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33234C2BCB0;
	Thu,  7 May 2026 01:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778115907;
	bh=PJbNGrdBKjT819EcGFwgq2f2GXrpGtfZvL5YkIaupN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rrz6HQrgkaGmf6XKxEtPpwWUZf8PwaBg88gmZfGcFYA/eSmfppDUv4s9FMjFSXtZg
	 JncdVBj1uKrtdUmIDxIW03g2Pdv07BKYUfH900McPQwPSOIWacqH+Vh2FzQjaOI9hp
	 NaCR4Q0IaWbj4LqMrJ3clJDqYV1Qse6AVKYSZ8giehyVDbBF6+L01APOYR2Ks4KylU
	 sD2x5Aojsi3/qhU6XLFko74mU4Q/Vtj7q1HkrVjBA32zGFyUZRI3ZsDtAI29riVWNX
	 N9tdvIRdTfCZSn4CHkqp0pPAoWL9XfgtM4iOkNU+U6gcvkBGMVS2ssco+kmUYShAN5
	 LubU/H8gY5lOA==
Date: Thu, 7 May 2026 09:05:03 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Pawel Laszczak <pawell@cadence.com>
Cc: Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v2] usb: cdnsp: Add support for device-only configuration
Message-ID: <afvlPzS6tRDcIVAf@nchen-desktop>
References: <20260505-device_only_branch_v2-v2-1-98cc19fbd02a@cadence.com>
 <afqpLr/BMMuN0pTg@nchen-desktop>
 <PH7PR07MB95380DF4D3F0AB37E28C05CCDD3F2@PH7PR07MB9538.namprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PH7PR07MB95380DF4D3F0AB37E28C05CCDD3F2@PH7PR07MB9538.namprd07.prod.outlook.com>
X-Rspamd-Queue-Id: D30D54E1CE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37046-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

On 26-05-06 10:31:48, Pawel Laszczak wrote:
> >I still concern this, CIX SoC has host-only configuration, and it needs to use
> >cdns3 driver for low power purpose, eg set D3 mode for controller.
> 
> If dr_mode is set to 'host' or 'peripheral' and the OTG IRQ is not configured
> in the DTS, the driver will detect this as no_drd. This may be inconsistent
> with the actual hardware state, as the DRD component might still exist.
> It might be safer to revert to the version where no_drd is not detected
> based on the otg_irq, and instead add a no_drd property in cdnsp_pci.c.
> If necessary, this can also be added to the DTS.
> This should fully ensure the correct operation of existing platforms.
> 
> With this approach, for the sake of completeness, we could set
> USB_DR_MODE_HOST or USB_DR_MODE_PERIPHERAL in the condition
> above based on dr_mode. 

I agree with you that introduce one property for no OTG hardware
block, and make judgment in driver.

Peter
> 
> >
> >>  	regs = devm_ioremap_resource(cdns->dev, &cdns->otg_res);
> >>  	if (IS_ERR(regs))
> >>  		return PTR_ERR(regs);
> >> @@ -500,6 +515,9 @@ int cdns_drd_exit(struct cdns *cdns)
> >>  /* Indicate the cdns3 core was power lost before */  bool
> >> cdns_power_is_lost(struct cdns *cdns)  {
> >> +	if (cdns->no_drd)
> >> +		return false;
> >> +
> >
> >You may not just return false, would you please find one host and one device
> >register to compare, we need this feature.
> 
> Also this condition will be correct for existing platforms.
> 
> Does this look correct to you?
> 
> Pawel
> >
> >Peter
> >
> >>  	if (cdns->version == CDNS3_CONTROLLER_V0) {
> >>  		if (!(readl(&cdns->otg_v0_regs->simulate) & BIT(0)))
> >>  			return true;
> >> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h index
> >> 24cb42f66e4b..a6b9b6f6d8cc 100644
> >> --- a/include/linux/pci_ids.h
> >> +++ b/include/linux/pci_ids.h
> >> @@ -2424,6 +2424,7 @@
> >>  #define PCI_DEVICE_ID_CDNS_USBSS	0x0100
> >>  #define PCI_DEVICE_ID_CDNS_USB		0x0120
> >>  #define PCI_DEVICE_ID_CDNS_USBSSP	0x0200
> >> +#define PCI_DEVICE_ID_CDNS_UDC_USBSSP	0x0400
> >>
> >>  #define PCI_VENDOR_ID_ARECA		0x17d3
> >>  #define PCI_DEVICE_ID_ARECA_1110	0x1110
> >>
> >> ---
> >> base-commit: 9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
> >> change-id: 20260505-device_only_branch_v2-53692f329752
> >>
> >> Best regards,
> >> --
> >> Pawel Laszczak <pawell@cadence.com>
> >>
> >>
> >
> >--
> >
> >Best regards,
> >Peter

-- 

Best regards,
Peter

