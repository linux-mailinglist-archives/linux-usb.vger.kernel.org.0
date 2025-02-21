Return-Path: <linux-usb+bounces-20935-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D9CA40247
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 22:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55B6C17DA5C
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 21:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD61254B0A;
	Fri, 21 Feb 2025 21:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBaRt0Hf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14A717CA17;
	Fri, 21 Feb 2025 21:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740174544; cv=none; b=krk2iW6I8ewfuDk16703KGG4vSGR9RXBaNVjvxHXqS/0t/h9xbDd9vyAJbwccjMssWWlHVt1nEBXhI5q+cUgnzanCqPCTgn8ZoZNQVlvrPtAa3pFIW4EOd+M+A906WsCS6Zu3azDv742FOHB4JnZjLKHlfNeZrcE2IQS1dJSqso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740174544; c=relaxed/simple;
	bh=Zft0IVGvnv37d+3JlMQstIhyAg9GYo0BMaAAqeF4wf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RL9MAVleivNYkpSbj6+vFTl+iUlHdxIV2QWf/3OPb+BHti5e3HlGNsGV7/X9uNlPujKmnv+7dTc/80JYQE/zSXaL/BdP5+tyqPUmHDZ0f/FHm50Zq1wRKAbUAVcuU8/UoYKOTEPNspAbfNlhWLnhDwY7DeJ0RUZCzrVKDPoQShI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBaRt0Hf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05DE2C4CED6;
	Fri, 21 Feb 2025 21:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740174544;
	bh=Zft0IVGvnv37d+3JlMQstIhyAg9GYo0BMaAAqeF4wf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBaRt0HfVe2Rz/djSl56xM9l7uI8+P7ANkuGV8K41Jkb3z9t0B/EBtQZrqddkH3JD
	 NL1qeE8dcsBGBWGm0K2lhjdGjbM9mFp/o+xCAtxfAePka8uBA6zMJLC9Ks7AoldJgv
	 6S/8FJQel0Mw4XzeGx2lDYElAZKMr2lDBvuZNRhoBWseAl/TDEl79jOIU6vRoLADmU
	 qTQIf03jL9Z5R5YVuEw/MJ+4OcBQZAnP5JmhCIDX1XIPPo7VwVq4P+kLONeeknbp2N
	 OwFzRAs8yKY/cV6ZBhG4CV9I7Ku825fC0Z7e+JzftAMrFwuCLKi2jtHCwn6YsymeqW
	 TQHoVg4UBZjfg==
Date: Fri, 21 Feb 2025 15:49:02 -0600
From: Rob Herring <robh@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank Li <Frank.li@nxp.com>, gregkh@linuxfoundation.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	peter.chen@kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 2/6] dt-bindings: usb: usbmisc-imx: add compatible for
 i.MX95 platform
Message-ID: <20250221214902.GA128391-robh@kernel.org>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
 <20250219093104.2589449-3-xu.yang_2@nxp.com>
 <Z7Ycev436gWc/4Bn@lizhi-Precision-Tower-5810>
 <20250220103209.zm4bvkkjtgewd53y@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220103209.zm4bvkkjtgewd53y@hippo>

On Thu, Feb 20, 2025 at 06:32:09PM +0800, Xu Yang wrote:
> On Wed, Feb 19, 2025 at 01:01:30PM -0500, Frank Li wrote:
> > On Wed, Feb 19, 2025 at 05:31:00PM +0800, Xu Yang wrote:
> > > The i.MX95 USB2.0 controller is basically compatible with i.MX7D,
> > > except it needs use hsio block control for wakeup setting. This will
> > > add compatible for i.MX95 platform and restriciton on reg property.
> > 
> > Nit: Simple said
> > Add compatible ...
> > 
> > Better mention "fsl,imx95-usbmisc" at subject.
> > add compatible string "fsl,imx95-usbmisc" for ...

The patch does a bit more than just add a compatible. 'Add i.MX95 
support' is really enough. The diff is clear it is adding a compatible.

Rob

