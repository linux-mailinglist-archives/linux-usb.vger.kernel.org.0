Return-Path: <linux-usb+bounces-18671-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5560B9F7493
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 07:17:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ED77188E111
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 06:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BAD21661C;
	Thu, 19 Dec 2024 06:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Mk5h2nrt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6A578F4C
	for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2024 06:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734589008; cv=none; b=CY1gVvDvter3jPfTWlN8a5stgwE2QkKxl7f4fQVMBZGqFxZlK4SyXu2fjxNDtQl/c4H9NFPItBwkq/QjIV9Wv7ZqPXwvpQylQgZUmnZrYnUcJ/hD/GwEXkQLeZbLkJn/YofEecT5vubgG4Fx9H4gF09NnCKNUg421Mso6CvsRng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734589008; c=relaxed/simple;
	bh=1r9qA6Y+Uc3b+9bvxZK3AJ0573ehVux5jHDhydVpSNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKTF4LoS4rXd8IOtMTzy2sla4zf68mCCraPEkj9sW4daoKjC2ic5mkzBEnaF9DCHebpzujLVPn8ocQmXBneQykTSTeAjr10emNQ2bbAQ5sNsRjLTEsOBBNz7OvZmlb+xI4UokfElAIG2CQipn4FmHlPcOIKYXrir1qsFMJzou4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Mk5h2nrt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E59C4CECE;
	Thu, 19 Dec 2024 06:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734589008;
	bh=1r9qA6Y+Uc3b+9bvxZK3AJ0573ehVux5jHDhydVpSNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mk5h2nrtjZYNeLR6hvAHK2TQsI+/fQXVuX11pXo/BZ01cjx6XyNmrcaUgFBRfzfbs
	 3idwqD+fSH+g+DNLLsyeAsJHz9/h2N17jqh3gwv0e6YuN8l9zA5DimQa7AMGXDSbwH
	 f8TKdjkFkPSQlsYFD0Y5Ycd7vCi5sZRelfZKxX/w=
Date: Thu, 19 Dec 2024 07:16:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Raf D <raf@noduck.org>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: Re: USB storage, page fault on sustained write
Message-ID: <2024121927-grudging-generic-1edc@gregkh>
References: <66dec9cd-ca3d-4b70-aed4-1cebc6e1157f@noduck.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66dec9cd-ca3d-4b70-aed4-1cebc6e1157f@noduck.org>

On Wed, Dec 18, 2024 at 11:01:24PM -0500, Raf D wrote:
> Hi,
> 
> I think I ran into a bug in usb-storage (or related) on 6.13-rc3, that does not seem to happen on 6.12. Please see oops report below.
> 
> I am able to trigger this while trying to create a persistent usb drive (mkusb/dus). I was also sometimes able to trigger it with a simple dd write to the whole drive.

Sorry, known bug, fix is in my tree, I'll send it to Linus later today.

greg k-h

