Return-Path: <linux-usb+bounces-31585-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EC7CCC7E6
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 16:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AD5A310C493
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 15:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3441A350A30;
	Thu, 18 Dec 2025 15:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHKqhq20"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3E834FF7E;
	Thu, 18 Dec 2025 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071207; cv=none; b=VL9iABi+lTpd7i7oX3n4nT6xSMbsVR4ORc9rJW7VJST1xVo/5OuWLJvj4UKyjtrU95ATrBeHQa13UiEAozG0vT29dwNkz2qjeS6yuo1zxFq60i643B5KvN+0mwRPEo3SnWbZorgZziF34vYvqpN5iPoWiCibvWfntzT8qq0GhSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071207; c=relaxed/simple;
	bh=Nm31gcc7G6Qru4zmAL3ZkJ0+6B1kuBK/5ZDvu6ec3RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtNwZfgEHVa1041/Q/kL+v0HmhH8IXzLAcohvleFe9Hyz0hcYqMjMYtcC0frn6rwJ0k1fiZL+OwD8QwzopMyj6f8AOtf0JQKDM/rXDvcEqMvnTgBCGS1KVVLtm6Se7N6BfwINn0Quaxzc/G7iIK0OKty5txbJj2LfWp3yGTrceM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHKqhq20; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CED7C4CEFB;
	Thu, 18 Dec 2025 15:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766071207;
	bh=Nm31gcc7G6Qru4zmAL3ZkJ0+6B1kuBK/5ZDvu6ec3RU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AHKqhq20Hwu9i1x3GmJ0CPOqJZIRc3CZqxDrxhUBMmjvnwiU6U43ArKd9g6h2vzoE
	 jIIfBGatg5lhW3oA0WsMtyU/zs/2lQ8nmWkGZDSNLd+mAyeY8NpV915TXDUPQuWUW1
	 96uk4Ed9iQPQ4oNtHoLFjlwxBDB8F00jLn/OXcKTkaDZ3wlpj23c10FcIYkoWl0Pry
	 Ms6anTwD47TwekC+9XdskJb6h5h97TZbbdc54949fLX3TBW0OMJmnOV1XExLVQvvRS
	 sSuBkLIaiKHwJZJWwvUSZ8nyRz5HfZUgnIx1I9ei/auLYt9z+p5mLNnPJ5OqoKhWz7
	 Bi9sjA6v38nFg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWFnR-000000002Xs-38mo;
	Thu, 18 Dec 2025 16:20:05 +0100
Date: Thu, 18 Dec 2025 16:20:05 +0100
From: Johan Hovold <johan@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Ma Ke <make24@iscas.ac.cn>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] usb: ohci-nxp: clean up probe error labels
Message-ID: <aUQbpVyfEF0yrWSX@hovoldconsulting.com>
References: <20251218141945.5884-1-johan@kernel.org>
 <20251218141945.5884-6-johan@kernel.org>
 <a23e4407-9017-449c-a514-6e9464ec0266@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a23e4407-9017-449c-a514-6e9464ec0266@rowland.harvard.edu>

On Thu, Dec 18, 2025 at 10:09:52AM -0500, Alan Stern wrote:
> On Thu, Dec 18, 2025 at 03:19:45PM +0100, Johan Hovold wrote:
> > Error labels should be named after what they do rather than after from
> > where they are jumped to.
> > 
> > Rename the probe error labels for consistency and to improve
> > readability.
> > 
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> 
> Johan, in the 3/5 patch you also changed a statement label, which was 
> not directly related to that patch's actual purpose, but it is directly 
> related to this one's.  Can you move that rename from that patch to this 
> one?

Sure. The label "fail_disable" didn't make any sense to me but looking
at the driver again now I see that it's named after the usb_disabled()
check and the rename could indeed be done as part of this patch.

I'll address this in a v2.

Johan

