Return-Path: <linux-usb+bounces-3129-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C29307F3593
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 19:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62C77B20D26
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 18:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1532206E;
	Tue, 21 Nov 2023 18:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dCWz9bft"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D748322065
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 18:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F1AC433BA;
	Tue, 21 Nov 2023 18:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700589901;
	bh=PrYlDSh1KBKY9nagnX9e/CAxyEWyzd/7cpff2wOc4d0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dCWz9bft7GOg0xCs3XqYU93HlqP0iTjUumlFjUIAeORz4ELrJWXdZHIIAyiSUjec9
	 MIwykqkrj3utYxnPuOd9txndbD9zUY8q12wOCym2nxYPKCC8SE8cfxIYaXQlNwXQXl
	 FvFf841GDAQloRn78ZE7dvVzfo4lJqiD1Bp/LGAE=
Date: Tue, 21 Nov 2023 19:04:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sanath S <Sanath.S@amd.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	mika.westerberg@linux.intel.com, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	stable@vger.kernel.org
Subject: Re: [Patch] thunderbolt: Add quirk to reset downstream port
Message-ID: <2023112111-shelf-deeply-6a03@gregkh>
References: <20231121174701.3922587-1-Sanath.S@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121174701.3922587-1-Sanath.S@amd.com>

On Tue, Nov 21, 2023 at 11:17:01PM +0530, Sanath S wrote:
> Boot firmware on AMD's Yellow Carp and Pink Sardine allocates
> very minimal buses for PCIe downstream ports. This results in
> failure to extend the daisy chain.
> 
> Add quirk to reset the downstream port to help reset the topology
> created by boot firmware.
> 
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Sanath S <Sanath.S@amd.com>
> Cc: <stable@vger.kernel.org>

What commit id does this fix?

thanks,

greg k-h

