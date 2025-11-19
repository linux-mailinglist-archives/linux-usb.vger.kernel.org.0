Return-Path: <linux-usb+bounces-30730-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F88C6FBBC
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 16:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D7956351F93
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB122E7BD2;
	Wed, 19 Nov 2025 15:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="majxEx3H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7702D7817
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 15:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566586; cv=none; b=Qa62+HhS4T4pi/If/oSFtKn0mP1xcumwooU4yTsr+R1rlWM3lk3ld28z/KuU3GPBdnUlud6fpfSlaiuvDsJGQDagdPyQoqhJS6MMv4W5otzM2zSDhyflACAhBuOKNzl2IrhQja/526e8Q5U3SCklNA+EBCJ2pE1AEFDap1Kxai4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566586; c=relaxed/simple;
	bh=Bktrwsq5+7yCJFVDpveZivsZ+fXgrngE1TVR89p5UGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhmYY97uBIEX/+XxAF+6PXR40fzdX3ipdxl1wp5iMIcHdcBdHgb6FCBEOWnNNQxWlEFW3A9043SeEMM1rp1JOj4bop6ptSpkOoslDNLW/muxwBU+yUUd/N37q+odHmKYHc/sSo99ptb3XuNSP6sJzf8s4+TQJHiMqkCNNFMxqUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=majxEx3H; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ee14ba3d9cso38282941cf.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 07:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763566583; x=1764171383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IZX/aEko5V4LfrBu8HxDRWLbIYPckCIiKwT1n1JYaFI=;
        b=majxEx3HWUYYrs1Ck4jUFd8N95eEuGx1waYZb/PS8PtdPzPdsm8uHzsWGf2PEuzysh
         q6XVnxS+WvlsPz2+AHsA+m6Vcx7A5oKu90B3XXF0IhhYbPDIewAvdZ3BntNyOXggTgwX
         tzrGKZGAAH9uijuwxWSgcJl2v7CMkzq6eamvF8rJDLmS71ojzytRy/InvZi1jqp+218W
         MEJGd2WivKyo3oXSFiyv1CGJAUb7H+YNVaSuCd8Urin6pd5CezOZHMhQzdCx/C7IJh0+
         ZydffdWWrGf0MYej0/++h4ECo/CsXLWMYFY8LMrn39vkgTQuIaXh6v6CyD7XQsiO8ztg
         mUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566583; x=1764171383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZX/aEko5V4LfrBu8HxDRWLbIYPckCIiKwT1n1JYaFI=;
        b=Iw/GequJOzr5WNk7tF/D55W9vOl75hBCV1q1b1sajI7osGXn47tn1sqiOTlijRA5D7
         eZs1f6C0At/nSeHmRq8aba6liyJfW90Cl/q8S1R5ngRkRqTifObvimg/SymD0GZlgUU5
         tq5jzFGu2g9OPCLA+ZS8fILQGAJihcN4m3VTQerwmZ3BDCYKJtqcHU9brtORBPnQNbRR
         Vu/I/x7s6YhUsG+MBio5SVHWrumTbXq6rCEubSMedzZ1qwYWD9yaHAntb4dhKcV+TUvp
         kVDkReBZqFjgUfwTADU02vVaS5LfmzN41ABfGaeWbnnCTwLnUPObAIH3drfciwC1T9Bg
         mDwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX88Cun3O88CEemRvrqHP5h4nayj1xgfXp/JYSdlTr6YftiGAmm1sj70/szbfEUkMDWIpHQf6WaUxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC2M4r4HS35fXg8bWK6vIg3zn5DgCtH/eQRFumvLHBeiNVsuJs
	X/SaF9K11Dn9Zp1JMqNJRtBcQmunikA8UhQobxMF1nPBrLN3N135yRoj3+aKcA7nbA==
X-Gm-Gg: ASbGncsz2a6+JuoK8mVjnCD/Us5hYA0j3K3VNAdl7ynAvCaLpm55xKEpj6PdejzcbBQ
	N30Q5Wy9lSbJMxW55WOqKzjM/QVQBihMlgwFTGS+gYo9b0Tnz0sa7hYwqT9l2DmkaODxD0hwp5E
	H7O6brjOzpOs1xRAdt65rQmqwyfukncx2WFgOyvjFvk4eQxgq6XJUHcPNU3aiu0mT43q+410VpI
	5/+6IpeU3BMWI1e/a8Dav51aZgb88N5ndkZ0J310efZPsQlu8s6bs8yn/IMufcPtL/lWbGSRYU5
	C7g8wksCXMCdTv6Buw0dTb1M7r4dJjHXsu9TgkAaf4S+JgZWlP3OuXmVTkKYcMQlBEGz95QvaJc
	jcj5NXlQD9mEsEbU/ZFF1dmlYTV4lOkhsAnQhj5hoFmBbK1FcP1oDxEf73JLG4c/4kQtpkk1DkM
	ljkNf2iGwuWFJDfTzkjlrfMmNHnVyvXw==
X-Google-Smtp-Source: AGHT+IHVhVSU1qBDJkojbnSozu1+lqfGiIw0rFX+kgWlXx9u3BF4Debl3tEJRFOjOf55dzdBtqHWOQ==
X-Received: by 2002:ac8:584b:0:b0:4e8:92ff:753 with SMTP id d75a77b69052e-4edf2066cb2mr239692421cf.24.1763566582824;
        Wed, 19 Nov 2025 07:36:22 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee0f0d51bdsm84521401cf.15.2025.11.19.07.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:36:22 -0800 (PST)
Date: Wed, 19 Nov 2025 10:36:20 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Clint George <clintbgeorge@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	khalid@kernel.org
Subject: Re: [PATCH 4/8] usb: gadget: dummy_hcd: fix block comments, blank
 lines and function braces
Message-ID: <08e6f306-f105-45db-9846-a50ae7e3219f@rowland.harvard.edu>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251119130840.14309-5-clintbgeorge@gmail.com>
 <2025111922-improper-sensually-13b0@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025111922-improper-sensually-13b0@gregkh>

On Wed, Nov 19, 2025 at 04:29:13PM +0100, Greg KH wrote:
> On Wed, Nov 19, 2025 at 06:38:36PM +0530, Clint George wrote:
> > This patch updates dummy_hcd.c to follow the Linux kernel coding style:
> > - Align block comment asterisks properly.
> > - Add blank lines after variable declarations where needed.
> > - Remove unnecessary spaces before semicolons.
> > - Move opening braces of function definitions to the next line.
> > 
> > These changes improve readability, maintain consistency, and make the code
> > easier to maintain.
> 
> And are hard to review :(
> 
> Again, please break things up into "one logical change per patch", and
> that does not mean "fix all coding style issues" is a "logical change".
> 
> Also:
> 
> >  /*
> > -	EP_INFO("ep3in-iso",
> > -		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
> > -	EP_INFO("ep4out-iso",
> > -		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
> > -*/
> > + *	EP_INFO("ep3in-iso",
> > + *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
> > + *	EP_INFO("ep4out-iso",
> > + *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
> > + */
> 
> Why not just delete commented out code?

Or in this case, replace the code with a comment saying that if 
dummy-hcd supported isochronous transfers then endpoints 3 and 4 would 
be dedicated to isochronous IN and OUT (respectively).

Alan Stern

