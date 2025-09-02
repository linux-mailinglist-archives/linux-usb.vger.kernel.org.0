Return-Path: <linux-usb+bounces-27442-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99286B3F9A2
	for <lists+linux-usb@lfdr.de>; Tue,  2 Sep 2025 11:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0B1E1A857E8
	for <lists+linux-usb@lfdr.de>; Tue,  2 Sep 2025 09:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50ED2EAB6F;
	Tue,  2 Sep 2025 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WAIlur60"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D3D2EA47C
	for <linux-usb@vger.kernel.org>; Tue,  2 Sep 2025 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756803857; cv=none; b=QXHiwoHm+VDQ1uAttoXZvPX8VIbIZuP2YQrfoYv35bH0KmlZvkhHGHTmWA+cIIEeiXkdXn63mOGqgtoUH3R98Lfz/cts8dz/VSl6aLb8yxok5GHx/1iSJUq6wJVpubeYR7saU+jQ1eqP1fjcnQzStPDjz1KVDylwU89fgMhTBTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756803857; c=relaxed/simple;
	bh=+vjpnYU8WRebZqjQvKI+n01Qogr8+nbmYXoq//pyEyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOzp5XIJVoH91tPLWVpHITktAEtnXT8szTZJDlCO2GAW3engYVewjsu1dmCVPVXeehkd2VfTfLh8rbCW1YWU35MnG9+ztGM2nLgbSeWRV/Uy0JAJ4UaQASrphJ5S3yZLpTiP/vp4qIxLSDDLWjkSdVFwz9tQJ3ZSXllRRWZNcOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WAIlur60; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9C6C4CEED;
	Tue,  2 Sep 2025 09:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756803854;
	bh=+vjpnYU8WRebZqjQvKI+n01Qogr8+nbmYXoq//pyEyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WAIlur60PK05TZYRW4hkDbTYatPAVD/usAvvGD5Zvka2MqB0WFkcCT4SRbpZoDTS0
	 v8Dv6xUdrrFbg0hW+7yhKlMu+owCyaTEHnOs1ljOX8QpokzAtljPF4zz3NOndOjtlW
	 q+dhGww0p1qBUxXVyfZvEnfNLYDSwHA5CTSYs41Y=
Date: Tue, 2 Sep 2025 11:04:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Maxime Vincent <maxime@veemax.be>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC] usb: gadget: proposal for Microsoft OS 2.0 descriptor
 support
Message-ID: <2025090225-tarnish-recliner-4b21@gregkh>
References: <5aTfWPS8pWa0ctuEBVvtEEYLuw5fUBixSRpZG3klXdOHcLrPebGG3tZy4H6Y9tR895qh_pdPITpbH1R4Vws1QaWL26dRHmZUvqxBExpHEO4=@veemax.be>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5aTfWPS8pWa0ctuEBVvtEEYLuw5fUBixSRpZG3klXdOHcLrPebGG3tZy4H6Y9tR895qh_pdPITpbH1R4Vws1QaWL26dRHmZUvqxBExpHEO4=@veemax.be>

On Tue, Sep 02, 2025 at 07:33:21AM +0000, Maxime Vincent wrote:
> Hi all,
> 
> This is a request for comments, not a patchset.
> 
> The Linux USB gadget framework already supports Microsoft OS 1.0
> descriptors in usb_composite, which makes it possible for Windows
> hosts to bind WinUSB or other class drivers without requiring a custom
> .inf file. This has been very useful for devices that want to provide
> driverless support on Windows.
> 
> Recent versions of Windows (8.1 and later) extend this mechanism with
> the "Microsoft OS 2.0 descriptor set." This supersedes OS 1.0 and
> provides:
> 
>   - A more structured way to declare WinUSB interface bindings
>   - Registry property descriptors (string values, device properties)
>   - Support across multiple configurations and interfaces
>   - Forward compatibility for future extensions
> 
> At the moment, Linux gadget drivers cannot expose these descriptors
> generically. Developers either hardcode them in out-of-tree patches or
> skip MS OS 2.0 support entirely, limiting interoperability with modern
> Windows hosts.
> 
> I would like to propose adding *generic* MS OS 2.0 descriptor support
> to the gadget framework, in a way analogous to the existing OS 1.0
> support - and similar to how WebUSB support has been implemented:
> 
>   - New configfs attributes to define the OS 2.0 descriptor set
>   - Helpers in usb_composite for handling the vendor-specific requests
>   - Backward compatibility with existing OS 1.0 support
> 
> Before submitting any code, I wanted to ask maintainers:
> 
>   - Is this considered broadly useful enough to merge upstream?
>   - Is it okay to support this fully through configfs?
> 
> I currently have a PoC running, but it's nowhere near ready to submit.
> Feedback would be greatly appreciated before starting work on an
> proper implementation. 

We would like to see a real solution first to prove that it is something
that can actually be done, before we can really provide any sort of
review comments.

That's just how kernel development works,

thanks,

greg k-h

