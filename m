Return-Path: <linux-usb+bounces-4216-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CA5814ECC
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 18:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D70221C24398
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 17:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547BB4777B;
	Fri, 15 Dec 2023 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yYraeHE2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54E649F66
	for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 17:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52A7C433C7;
	Fri, 15 Dec 2023 17:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702661247;
	bh=2qsbeaNvDjmqvgjVYMaTsiky4UfWiyFtKFxuhQZHj6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yYraeHE2qIJp/UglbK3fFa6x7HaKK+THvEJ7fyKJXPBKUfLJRmldL4VWgjicJG/19
	 E+Bo/f1QmHaz90R0H9bYu0RasZG4iLg2qkNpsxFtehrJZP8KotQwQTWFvmGk0kFPFy
	 r3rMjyUzOJ24eGjzFZPsH4M3VW45R/ojd/WHV3TU=
Date: Fri, 15 Dec 2023 18:27:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Wendy Wang <wendy.wang@intel.com>
Subject: Re: [PATCH 1/1] xhci: Fix null pointer dereference during S4 resume
 when resetting ep0
Message-ID: <2023121515-paper-annuity-a0e3@gregkh>
References: <20231215125707.1732989-1-mathias.nyman@linux.intel.com>
 <20231215125707.1732989-2-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215125707.1732989-2-mathias.nyman@linux.intel.com>

On Fri, Dec 15, 2023 at 02:57:07PM +0200, Mathias Nyman wrote:
> During device enumeration usb core resets endpoint 0 if the max packet
> size value differs from the one read from the device descriptor.
> 
> usb core will additionally reset endpoint 0 during S4 resume, before
> re-enumerating the device, if the device has a reset-resume flag set.
> 
> In this case the xhci device representation vdev may be lost due to
> xHC restore error and re-initialization during S4 resume.
> 
> Make sure slot_id and vdev are valid before trying to re-configure max
> packet size during endpoint 0 reset.
> max packet size will be re-configured later during re-enumeration.
> 
> This fixes commit e34900f46cd6 ("xhci: Reconfigure endpoint 0 max packet
> size only during endpoint reset") which is currently in usb-next,
> on its way to 6.7

You mean "6.8" here, right?

thanks,

greg k-h

