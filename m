Return-Path: <linux-usb+bounces-19678-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1C8A1A6E9
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 16:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 522E13AB1E2
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 15:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48163212B0E;
	Thu, 23 Jan 2025 15:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgimfFyt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26E821147C;
	Thu, 23 Jan 2025 15:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737645653; cv=none; b=XNVf/Ax0Xg91lshHjLRL8bnKqtWnAyXnGjuFTccR92x/1hUFsgjU0OIwPfA4W93or2LgnPCsq7R4wSqgEgh+01hUo4dIYVcHLiApWxCOawq1ACITBWj/ix5RlMafexNtQcOqyw9LJZneDURnnOnFwpYWhApjSSUXbGlFxapzaZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737645653; c=relaxed/simple;
	bh=Y6U5gjXNgMYqM9FZVayD4htK8zE33+H9NQOTbLfgEpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLRfhjN4dkAQ1bmFegz6GcB9aF3gEM8Kx7IztXBpRjw76odrBmKFTLdLDdNfeXf3wkhX87jNWQ4JwnwmkSUUa6ZRIIIoB/Tt+K02NZf2cYsKXXeQELo1/56GUiueOeY/60Jil7Skio27NSGRFVAhqHTRX+gDOKcwmjPWPrY+70M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgimfFyt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23661C4CED3;
	Thu, 23 Jan 2025 15:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737645653;
	bh=Y6U5gjXNgMYqM9FZVayD4htK8zE33+H9NQOTbLfgEpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PgimfFyt1TQQb8qDZsiGNsO7AOq2zKar4pJfHCvG3KgX478dMZZkm7nPH1lIgbSkh
	 ffRBFXrIqVXzbNSeR+SJLXryLEozyCA74t2al7hTLow4I58vVdQQEMlAOrWemuE4Me
	 Nziy2VoaCzcQyXyCB9hAGgfkX2ZYCPIEAl+20arNnMB5ZxZI+vhmLV/JiYGbUzRDyN
	 82p+wCesNsLbVDTy1D3QxZY5kure3tpZRUnIyH27vWug0Ytr/9Oz/Vh08LKWzLlwMb
	 MRdNwgorbGA1r2sugrVO0stpICJ4VHyUf6W19Eo0PSzVFMegUYDyx9cs32rvymvC0V
	 MQfd+JLaq745w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1taz0t-000000006W9-3LqL;
	Thu, 23 Jan 2025 16:20:59 +0100
Date: Thu, 23 Jan 2025 16:20:59 +0100
From: Johan Hovold <johan@kernel.org>
To: POPESCU Catalin <catalin.popescu@leica-geosystems.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH] usb: core: support interface node for simple USB devices
Message-ID: <Z5JeW6kprsLgJJ_m@hovoldconsulting.com>
References: <20250122134732.2318554-1-catalin.popescu@leica-geosystems.com>
 <Z5Ik2GoseMbZRe8i@hovoldconsulting.com>
 <ce5fe24e-e2b5-4e41-9dd3-164d688afe04@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce5fe24e-e2b5-4e41-9dd3-164d688afe04@leica-geosystems.com>

On Thu, Jan 23, 2025 at 02:01:00PM +0000, POPESCU Catalin wrote:
> On 23/01/2025 12:15, Johan Hovold wrote:
> >
> > On Wed, Jan 22, 2025 at 02:47:32PM +0100, Catalin Popescu wrote:
> >> A simple usb device has a single configuration and a single interface
> >> and is considered as a "combined node" when defined in the devicetree.
> >> If available, its interface node is simply ignored which is a problem
> >> whenever the interface node has subnodes. To prevent that from happening
> >> first check for any subnode and ignore the interface node only if no
> >> subnode was found.
> >>
> >> Example: FTDI chip FT234XD that has only one UART interface which is
> >> being used as a serdev by other driver.
> >>
> >> device@1 {
> >>        compatible = "usb403,6015";
> >>        reg = <1>;
> >>
> >>        #address-cells = <2>;
> >>        #size-cells = <0>;
> >>
> >>        interface@0 {
> >>                compatible = "usbif403,6015.config1.0";
> > Your example makes no sense since if this is the only interface then the
> > interface node should not be here.
> 
> That's the problem my patch is trying to address ...
> Why is it OK to describe multiple interfaces and it is not OK to 
> describe the interface of a simple USB device ?

It's part of the spec. See commit 1a7e3948cb9f ("USB: add device-tree
support for interfaces") and its reference to "Open Firmware Recommended
Practice: Universal Serial Bus Version 1".

Johan

