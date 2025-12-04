Return-Path: <linux-usb+bounces-31181-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35728CA5A04
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 23:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 83C9D303412D
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 22:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210DF326D45;
	Thu,  4 Dec 2025 22:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="L3VbNHJf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6172F6917
	for <linux-usb@vger.kernel.org>; Thu,  4 Dec 2025 22:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764887198; cv=none; b=NSfTfonDPP+RVaJTEp0cWbkmOWT/1Kl04ncjnpXFc7MWyy+cofXaXcV3sTMv1gZdA8rHhkFoAbOa/VsZaFUaMU4uMGi7BTEzK9EepZrFoHjnneWxGYFdXajGNE+hs2iheUKS0t2ve9+ewBx92TPSaSUWsOt71y2dWhQeg+/4yMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764887198; c=relaxed/simple;
	bh=AI9FXsWXeza6cfPs+My8q0cLDuXpor4gTONfBHS+Xg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6mEZ2WifOwkmLDQDhvTmybvFpvaQ5ZeF7soEExcw9JZHDKjH38+LETNkaZjs6Pl52CAYpFwhI5g9oPjbFAf6vjsFYiXh4/3HamqUEOk8jkB9rq6D39kv08TUkQSdvnHwHVxqXksSTAkequLQtASYnIBVELyPSPzlE7iAGgqKEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=L3VbNHJf; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8823cde292eso14450036d6.2
        for <linux-usb@vger.kernel.org>; Thu, 04 Dec 2025 14:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1764887194; x=1765491994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9LDkmFcL/XBKF/J+3SJXRbTa45YB5vT9R9qA612DPI=;
        b=L3VbNHJfRpdgVqj8fqko50g/gzSX137f+tKb7kx4OkdSs5AZszpvt2qhR9eZyfksci
         hfBQIEIGIcpKddh0LhH+T7EAKjSNH2lwpBjwrlVclbZHcTxBsq24pOBDb1ZSuiWwMYwK
         zCCwdX3iDMb5Et00LL/kBf1pQuAwEQoDhrlxiWe1bCZvcn4Vj8/YlEMky9Zw9TQdCf20
         4nGICwTevPQznHlTSXwPdadQzw4tVT8lrerQHLmlEilof7dx8iWxD+ifjcghJZuA2qvZ
         LEPBxLQXKB+cZY38ygPPddq8NkDJUUV9c2pQ+Qbbib9ZkiG1STOx6o+fbnNRvwCNHrrz
         bjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764887194; x=1765491994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9LDkmFcL/XBKF/J+3SJXRbTa45YB5vT9R9qA612DPI=;
        b=g3p+0tQD0pKbKXoTFWdg/r8ayrQPqdss0RRYKzDmD+ZKgLFt8k7Q+oNhIkMWX89g6a
         jOKaOiAraJqfqriy0dDk8Foy+tzdbtm7003ujr111Pv48v1zGyWpomOqGYix3q3J1HYk
         LMawHQYdmmlUGvEUkZcDikMZOCBt6E+R1hDn0tqsDUGcdIXgmsq276Nekj6VWjh2mA/k
         TyH1Fkmo14VurB+lMu1ln3X6TtR+6DDMIT80zYXsRaRtn4ToKCsSVpkVXqyp6Uoyw0I5
         wN7mt4t3eKzbfSxkJ4V/2aX7DNoduuY+kd2DPUq/8KHzVIZSp8G+wbR+ZsTrUXXcwxmO
         h5kw==
X-Forwarded-Encrypted: i=1; AJvYcCU8LsviH85UXc+iDCx3HrjePUs0P+X/92UIgWsYMstMJzSuA2VEFUPmCwKOhLV7+s2lexWQV3IZiVk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9bxWYPJM+GHFddFai4QyrjfuohiFNMiLM1HWg4NpLv8KQHThS
	OMkszbLgboKtwwW4xG1CZY9w3xoBHuGOhLleP55SgwMHf18PX4sQqxIdIhjDE7r1ykehOPkZb/Z
	wC4F7fw==
X-Gm-Gg: ASbGnctn18DPDunX4LuGQ/GGGuhwizI31uhKI1euDGIcvXOD5/lGFqtcEBeWlN95/H6
	WywtvvkOXBYvGwXuOhm4t9S5A0hzd01qIGXRZ74Sh2aYuzoyxhwf4BN3XaNY71y3PW/swSkD/hN
	mw2aHNHkezYuvrmPXyMEF3nb3u6UyK5y5hYDf2HFYCZN5rROEZEDz2MfS7TKfrraLWHkXB0EUfo
	Z/dvjoOi6VsPPKLBIldWyxuz9XEhfF1SpbjWPJuAa21kVZv9HOcmU+9r2Ea2cYnMg2gPhnV0/+f
	6Wawmudvk68FVUpzqWFsuU5b09hAU6Bp1LriThqpU88/IVfFk0WnsyihnuzrC3g3me5GwhDtLKf
	oyAcgOIEDROgz+JLboLYLPetWy81cx+xrPCu+yOiI7nQW1iiXEB/V2hvdHG8xa5Sgqz/57NtlgR
	vvDhEoVr+RXioO
X-Google-Smtp-Source: AGHT+IEhwxwWYO9+97DTTQyb0mDzq1IjWNaehRfBeoF9FUxh9iwD0QemC/33Ff33YVzmRV//gHh+VQ==
X-Received: by 2002:a05:620a:4082:b0:8b2:eea5:331b with SMTP id af79cd13be357-8b5e535df8cmr1108208385a.19.1764887193793;
        Thu, 04 Dec 2025 14:26:33 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::eaae])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b62529f342sm233281985a.10.2025.12.04.14.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 14:26:33 -0800 (PST)
Date: Thu, 4 Dec 2025 17:26:31 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Angelo Dureghello <angelo@kernel-space.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: testusb: epipe errors on test 9 and 10
Message-ID: <06229e27-db5f-410c-8c80-39cd2a18aed7@rowland.harvard.edu>
References: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>
 <c17c0821-3dd8-47b3-b795-f42675fb0a75@rowland.harvard.edu>
 <d8aa2f1e-fc44-4bb9-8245-d6ac76047dc3@kernel-space.org>
 <9776c9fb-8fed-4e79-b312-0b1a872911b8@rowland.harvard.edu>
 <bcc4f76a-985b-4932-a455-b4fedcafcd97@rowland.harvard.edu>
 <20251201232911.s5diakt3w7ztzjv2@synopsys.com>
 <82bc662b-70c6-46f8-acc7-3a666965d13e@rowland.harvard.edu>
 <20251202042305.wl2uvxoe55ay5vxw@synopsys.com>
 <5daaa7f3-7c51-4f72-b6e9-cf4f015f758b@rowland.harvard.edu>
 <20251202232237.w624ilc24wad7chg@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202232237.w624ilc24wad7chg@synopsys.com>

On Tue, Dec 02, 2025 at 11:22:38PM +0000, Thinh Nguyen wrote:
> On Tue, Dec 02, 2025, Alan Stern wrote:
> > On Tue, Dec 02, 2025 at 04:23:13AM +0000, Thinh Nguyen wrote:
> > > On Mon, Dec 01, 2025, Alan Stern wrote:
> > > > Are we talking about the same thing?  Clear-Feature is different from 
> > > > Get-Interface-Status.
> > > > 
> > > 
> > > Ah... I just saw the subject line testusb -EPIPE and assumed that it's
> > > related to ClearFeature(halt_ep)..
> > > 
> > > The Get-Interface-Status should be hand-off and handled by gzero right?
> > > The gadget driver knows about the status of the interface, not UDC
> > > driver.
> > 
> > For USB-2 devices, Get-Interface-Status is always supposed to return two 
> > bytes of 0.  For USB-3 devices, it returns information about Function 
> > Remote Wakeup and Function Remote Wakeup Capable, which is handled 
> > already by the composite core.
> > 
> > So for SuperSpeed and above, the request should be delegated.  For high 
> > speed and below, it could be done either way.  (dummy-hcd makes the 
> > opposite mistake; it always returns zeros for Get-Interface-Status and 
> > never delegates.)
> > 
> > If you think it's best always to delegate the request then composite.c 
> > needs to be changed; it should handle the reply for non-SuperSpeed 
> > connections.  A simple change; I can do it.  What do you prefer?
> > 
> 
> Right this change is simple. I think it's probably easier to delegate
> and enforce this in the composite library instead of auditing all the
> UDC drivers.

Here's a patch to try.  Angelo, can you test this?

Alan Stern



Index: usb-devel/drivers/usb/gadget/composite.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/composite.c
+++ usb-devel/drivers/usb/gadget/composite.c
@@ -1966,25 +1966,27 @@ composite_setup(struct usb_gadget *gadge
 			break;
 		}
 
-		/*
-		 * USB 3.0 additions:
-		 * Function driver should handle get_status request. If such cb
-		 * wasn't supplied we respond with default value = 0
-		 * Note: function driver should supply such cb only for the
-		 * first interface of the function
-		 */
-		if (!gadget_is_superspeed(gadget))
-			goto unknown;
+		/* UDC driver should handle device and endpoint recipients */
 		if (ctrl->bRequestType != (USB_DIR_IN | USB_RECIP_INTERFACE))
 			goto unknown;
-		value = 2;	/* This is the length of the get_status reply */
-		put_unaligned_le16(0, req->buf);
 		if (!cdev->config || intf >= MAX_CONFIG_INTERFACES)
 			break;
 		f = cdev->config->interface[intf];
 		if (!f)
 			break;
 
+		value = 2;	/* This is the length of the get_status reply */
+		put_unaligned_le16(0, req->buf);
+		if (!gadget_is_superspeed(gadget))
+			break;	/* USB-2 always returns zeros */
+
+		/*
+		 * USB 3.0 additions:
+		 * Function driver should handle get_status request. If such cb
+		 * wasn't supplied we respond with default value = 0
+		 * Note: function driver should supply such cb only for the
+		 * first interface of the function
+		 */
 		if (f->get_status) {
 			status = f->get_status(f);
 


