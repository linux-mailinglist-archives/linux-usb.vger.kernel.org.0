Return-Path: <linux-usb+bounces-1661-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A97727CA1D7
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 10:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19268281629
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 08:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D534B19461;
	Mon, 16 Oct 2023 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7DJs/CT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422971A5A1
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 08:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA246C433B8;
	Mon, 16 Oct 2023 08:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697445611;
	bh=xmJQUG3HEnAnIKRC1iULeYdniMDR7Vj4BsO/YcpW+eQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7DJs/CT47ob+20Kqz7K/8gADwJoIo5v9bpEEZBVh8VVy7sYoo9RHNi608MvRPng4
	 G+zuxWHI7x43So4LrOGtc79/rJ4/3QpoQKcmSNk/EIJyTlcbLiJIpebHCtWaFntZp7
	 EtugbrKTG2m5WqU85OBlLI3K6HmMKrq+3hd4JR7ESnPLTgVBrpDtTdHUmho5Qt1kOb
	 4qIEGCyeXMfPYpiiYiVdrT8cidNRlidVZq5eRXUobVqT2PJXDqPzG4lqllnJoVrilu
	 dAxxZHB3zkYTrV5SseHpdcQ8YtoWWZJOg+oLp5scGc0MfmLvd3dH7hkfM+0+Bgp+N3
	 ufJ19CPr9Wz+A==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qsJ8v-0003Ku-1s;
	Mon, 16 Oct 2023 10:40:06 +0200
Date: Mon, 16 Oct 2023 10:40:05 +0200
From: Johan Hovold <johan@kernel.org>
To: "Puliang Lu(Puliang)" <puliang.lu@fibocom.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] USB: serial: option: add Fibocom to DELL custom modem
 FM101R-GL
Message-ID: <ZSz25Tm6pG1bgMTD@hovoldconsulting.com>
References: <TYZPR02MB5088B70C88A3751EC69819E289D7A@TYZPR02MB5088.apcprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR02MB5088B70C88A3751EC69819E289D7A@TYZPR02MB5088.apcprd02.prod.outlook.com>

On Mon, Oct 16, 2023 at 08:36:30AM +0000, Puliang Lu(Puliang) wrote:

> > You did however not answer my question whether there could ever be more
> > vendor class interfaces (e.g. for adb) so that you should be using a
> > more specific match for the entries (i.e. USB_DEVICE_AND_INTERFACE_INFO())?
> 
> 0x8213 and 0x8215 have only one mbim and one tty, Thanks.

Ok, thanks for confirming.

I've now applied the patch.

Johan

