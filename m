Return-Path: <linux-usb+bounces-3164-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 239747F3FE7
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 09:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7B41280F94
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 08:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E002111B;
	Wed, 22 Nov 2023 08:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmPcxdgQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80871C28C
	for <linux-usb@vger.kernel.org>; Wed, 22 Nov 2023 08:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7E0C433C7;
	Wed, 22 Nov 2023 08:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700641054;
	bh=t/49KUB9MGEsCs1/F2RgCFFrkf6Q4Z0X9hderngc+dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmPcxdgQdYDZ8WmevM6jFWzkSDozri7uLw2yfDDYFOFUPxH1ucRTo9gh3YfWKH+pN
	 Dq2U/sYxIIathvFknmrM5Pe8hrWf/23nTlR9aeIYYwckMkxR2m61bmOX1xp22xPoeM
	 gI6Iv4C/Wf0T3vOaL230HNd3pF9CdyE+3GDIqVsumkoPvFiukM4JNk+xq4PiwXuz50
	 oeI/fPjS1pipQCEWZJo2azse4dDWzYDlyQdxUblA1iuPkVQ6NZ05+Ep3ndBKZrE8MJ
	 R7U3iz0vOw5v3JdTBR2L/cZhE0KZpe3Hw49F2kyfoot0YN2lRAhGpNqF92tv+Di3RF
	 6Bn7Gggjw4Hfg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r5iQe-0005tx-1M;
	Wed, 22 Nov 2023 09:17:48 +0100
Date: Wed, 22 Nov 2023 09:17:48 +0100
From: Johan Hovold <johan@kernel.org>
To: Victor Fragoso <victorffs@hotmail.com>, Lars Melin <larsm17@gmail.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] USB: serial: option: add Fibocom L7xx modules
Message-ID: <ZV25LMQmNjBeucH2@hovoldconsulting.com>
References: <39dd187fe27244f28fa729ce134d9d130147f2e1.camel@hotmail.com>
 <77b61923-b0df-4120-be19-4442e84fa118@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77b61923-b0df-4120-be19-4442e84fa118@gmail.com>

On Wed, Nov 22, 2023 at 09:48:43AM +0700, Lars Melin wrote:
> On 11/22/2023 4:05, Victor Fragoso wrote:
> > Add support for Fibocom L716-EU module series.

> > Changes since v1:
> >   - Removed non-essential VID/PID to work with L716-EU tested module.
> >   - Added device entry comment according to tested module/modes.
> >   - Added according to VID/PID order
> >   - Commit message improved with more information about module ports.

> thanks, looks much better now
> 
> Reviewed-by: Lars Melin <larsm17@gmail.com>

Thanks for the update and for the review. Now applied.

Johan

