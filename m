Return-Path: <linux-usb+bounces-35977-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MpndLeQy0WkQGgcAu9opvQ
	(envelope-from <linux-usb+bounces-35977-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 17:48:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 144C339BA85
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 17:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CD2D300B9BC
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 15:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB98430ACE3;
	Sat,  4 Apr 2026 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="UD1LPcZ0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6B4168BD
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 15:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775317726; cv=none; b=TH0Z3D/SrnP3JWzMjp8k1H336YXDNpOgSE82QWEaLYKNIKLevg1EkScY0Rqp56FrsC0FhzK0gZ8vfZY7eTKtIw9vzGbsFACKwce0nSz+fYF4XW8vw1PAKkyF2F45KgBzyFB3zhBbsBuOXNsAfUqIVfTiDygLO+a/S9jUhstcYxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775317726; c=relaxed/simple;
	bh=9sz3+e7hFS7e3D5u4gXCFEmetpYoIO5AhMXFUjOjC1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNolmdDfkbmL5hd3d2TAF3wBL/8mzPJZTKMGg/R5Ye5eIl0ZFFx5AXGCRwuhEoZr25PU9FzJ30g4r3rQFEhyQRebkdK2C7o6SjeiBYInbH/mYEZ4zF8LtimSFOmm6AjFSFULST6VtWQMPOdqeGC8Tw2ZTYbHjBNFbT5j/j/DH3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=UD1LPcZ0; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8a48deebe95so28548056d6.0
        for <linux-usb@vger.kernel.org>; Sat, 04 Apr 2026 08:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1775317724; x=1775922524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TbCDxLb/JRnwtCFojza32AVUTFHSLT3bO9q4M+IgyD0=;
        b=UD1LPcZ0YKJb6ZWV4CQSXYE0anFRxVjVSEMgZpFYdz0Bc/8F12zDsO+ojqDNmywMaZ
         upNC3YvFerFGyjNP3qcrUKbwzDVVqSBngHAaeUuYt3TaceEEMCIFd90khssJ+3ITscZM
         IcXCTJbJC+r+JguV710BPvD25xQj6ArahlF/bGWgDyOj7KXIrxdfRcft6cXBX0QAx6Pb
         1u+VAzDhZYU7g61VfalsaYubfRV8GmRAIf6NfAlIAcJDhnsUabLUgVL275eR2nh3eIBF
         MbQEyWibHmEnhW0eqZLxHy3bqqfdBj2u3E8tKzrIIIlCC11xua50k3mD+AHA7XUFzIT+
         0+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775317724; x=1775922524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbCDxLb/JRnwtCFojza32AVUTFHSLT3bO9q4M+IgyD0=;
        b=kEroS7NVvH158Si8yZ94kT7s8PbMRa3Yi7wLVwTTbnujrXn1RTRF1Z4ECZLXbAVc4d
         6ocp36phqorqh9EdtqN9DJikaPvB47Ey92BL0pIiEigiKbbOTjlIkdjs8D8+aLPMSV7Y
         qsiskns32zixpH03gHN1PJ0wilGG6shA8bzROpSdjwy5sptUZxBFg1QkAZhas8ek/WkQ
         8DFJ1wpKFMCG+DnZ6okwgvDz1jISJPaQ/6Jwr5TG8sVpvbbygqxwClmMJDihqlRLAh0h
         nW+xNXOoTbADnUlxzOXzfXt+EByjn9/tMqdEEFIbJ43VLLvnVB1KBJ/RfxzUUYr3hztg
         uh1A==
X-Gm-Message-State: AOJu0YzxVReXcb6+roBRFLSdByPsTMLG6AKTRFuK6oC8b3zKr2d9ePyW
	6vwVxSC7EN7xYqUGJLtn7gOHeSwIgh0QGiNtGtSq8oJfAFMZWoa2Tk7MvZOqRsbl9e6SelecFLh
	ojo0c8w==
X-Gm-Gg: AeBDieuJCn9ZMmtIkLjF/EqPcoHTo3zW+i0hIQ7en71ZAeOe7ShjgTKeZjyTIa0CPGF
	tuXSujpl2moh+MKpHoyf1fuKWHXM7uev+0b7cIktoCUY4VtlmYXEjJs6/4vclJAolQHiBhdFwXZ
	s4cL3ilG8tX2Ge+mVo7C8F/tMSPaL07+yvcNtDZYczakz1jDPpZAG7VlfFkMaRD/TYraj59rl+e
	vZRIkE0P0/RPZPCw+0JAhhwPXVenczJBjsLhgT5cnjqOgx0UYLqiYrSbbh3qFt+QAzzCSb0YGCL
	UdUtV4haqKdjYVdp+HzbjTDQ0Ij0OW/UBMONV8Qy/ldAYrcgCj0YipK4kihjCOc1MgTYl0Tl25E
	XufZFz0kX5EX8rqwlXsTVpPiv+7cmsfblukWTDXG2f7Y6DWGUv8VoZlKCdwjYVdywzuCDZ2rMka
	Dvfw21KD6hTxJpZPGHAWPEWqiF
X-Received: by 2002:ad4:5bee:0:b0:8a3:1a24:8e8f with SMTP id 6a1803df08f44-8a702c923b6mr115984836d6.26.1775317723626;
        Sat, 04 Apr 2026 08:48:43 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a596915986sm83673276d6.24.2026.04.04.08.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 08:48:43 -0700 (PDT)
Date: Sat, 4 Apr 2026 11:48:40 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Ajay Garg <ajaygargnsit@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Some queries on eHCI/xHCI/Thunderbolt and dwc2/dwc3
Message-ID: <ade1d49f-e3ad-48ea-a044-851e9d28c78e@rowland.harvard.edu>
References: <CAHP4M8XXQAsOzJFvCwXB=BPN4tdoh5wyn+ZFFmJZPZq5BorxOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHP4M8XXQAsOzJFvCwXB=BPN4tdoh5wyn+ZFFmJZPZq5BorxOQ@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35977-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 144C339BA85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 12:26:35PM +0530, Ajay Garg wrote:
> Hi everyone.
> 
> I have been gaining an architectural understanding on how host/gadget
> usb-drivers inter-operate with USB-2 / USB-3 / USB-4 (host-side) and
> synopsys-DWC controllers (gadget-side).
> 
> Following have been my understandings :
> 
> a)
> For host-side, eHCI does not require / use dwc2, but xHCI mandatorily
> needs dwc3.
> 
> Am I correct?

No.

EHCI (not "eHCI") is an architecture for a USB-2 host controller.  
Several companies make controllers that are compatible with the EHCI 
specification, but Synopsys's DesignWare dwc2 is not one of them.

Similarly, xHCI is an architecture for a USB-3 host controller.  The 
DesignWare dwc3 is such a controller, but there are others (such as 
Intel's).

> If yes, how is hardware-specific actions taken care by eHCI alone
> (since eHCI is hardware-agnostic)?

Part of the EHCI specification says how the host controller should 
interact with the PCI bus.  Most EHCI implementations use PCI, but not 
all.  For those that don't, the ehci-hcd driver has platform-specific 
submodules.

> Is it that USB-2 PHY-registers are already a part of eHCI
> MMIO-registers themselves (thus not requiring any hardware-specific
> actions on the PHY side)?

More or less.  The PHY functionality is part of EHCI, but its registers 
don't correspond very well to those of standalone PHYs.

> b)
> For host-side, does thunderbolt driver require any of dwc3 / upcoming-dwc4?

I don't know anything about thunderbolt, USB-4, or dwc4.

> c)
> For gadget-side, dwc2 and dwc3 are enough for USB-2 / USB-3.
> Am I correct?

Yes, as far as I know.  But of course there are alternatives.

Alan Stern

> d)
> For gadget-side, would USB-4 require an upcoming-dwc4? Or will dwc3 be
> modified? Or is there another plan in the pipeline?
> 
> 
> Will be grateful for light on the above from kernel/synopsys experts :)
> Many thanks in advance !
> 
> Thanks and Regards,
> Ajay

