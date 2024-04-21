Return-Path: <linux-usb+bounces-9525-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 082348ABEE9
	for <lists+linux-usb@lfdr.de>; Sun, 21 Apr 2024 12:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50924B20B65
	for <lists+linux-usb@lfdr.de>; Sun, 21 Apr 2024 10:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1680410965;
	Sun, 21 Apr 2024 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2WD8GIKK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7848FDDDA
	for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2024 10:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713694587; cv=none; b=AaK54m/VpHhOtpQ6lk4D+AXEWHfcj6Oyi4MBWR3wcZ7BcrlPzhhEO1//r8pccrfBw0w5Li7aH4HfslXnjoGu/Sq/FQCoyK2Ksxvetz06Y8bxLK40ZcxerBWYNdQABB7tNu/PHS5NBBsH7FPnhjJTxKh8u6X8ODLZr7cbfPged64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713694587; c=relaxed/simple;
	bh=PcwKV24o9ggbh7etAAFTRbIw6hHzxM0n8GXKiNZANxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkjbRuWCTvKiqk8zatJ8zkCE9k0Wn/hgxcdnjyXV0cY+GcPx5exzcDFoAUp9Wp1wLzKOAufe1ywzUOOR3wxtsKKyio+DuELTkWx81YoJ0kbBSYbofA2sPp2GNQL6FSvI6W0qunvhFhO5fDzsgvjt+OE9UJwUmcGiaITGp+B4lZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2WD8GIKK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EEDAC113CE;
	Sun, 21 Apr 2024 10:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713694585;
	bh=PcwKV24o9ggbh7etAAFTRbIw6hHzxM0n8GXKiNZANxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2WD8GIKKX04PLEvQzNS6gTUtglD/in38kcIjac8VrgBOOJetyjCVvw3kWO2xCtlFN
	 yzjgAsWYXDpM3t+DhU1xb0k85HnycswDRkDlFP9JMnSbt+UUHE8X1QobeklPLzk6G1
	 gE4ncsDNygF0dpyZFRmLbuzfh/Hs6nOKExpByu+E=
Date: Sun, 21 Apr 2024 12:16:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chris Wulff <Chris.Wulff@biamp.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_uac1: Expose all string descriptors
 through configfs.
Message-ID: <2024042131-bonded-flaring-c579@gregkh>
References: <CO1PR17MB54198F836C3ED1B4FA5F14A9E10D2@CO1PR17MB5419.namprd17.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR17MB54198F836C3ED1B4FA5F14A9E10D2@CO1PR17MB5419.namprd17.prod.outlook.com>

On Fri, Apr 19, 2024 at 08:23:21PM +0000, Chris Wulff wrote:
> 
> This makes all string descriptors configurable for the UAC1 gadget
> so the user can configure names of terminals/controls/alt modes.
> 
> Signed-off-by: Chris Wulff <chris.wulff@biamp.com>
> ---
>  drivers/usb/gadget/function/f_uac1.c | 66 +++++++++++++++++++++-------
>  drivers/usb/gadget/function/u_uac1.h | 14 +++++-
>  2 files changed, 63 insertions(+), 17 deletions(-)

Any specific reason you didn't cc: the maintainer here?  Or the
developers who touched the file last?  scripts/get_maintainer.pl is your
friend :)

> 
> diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
> index 7de74a3dd392..100169d6dca7 100644
> --- a/drivers/usb/gadget/function/f_uac1.c
> +++ b/drivers/usb/gadget/function/f_uac1.c
> @@ -377,24 +377,10 @@ enum {
>  	STR_AS_OUT_IF_ALT1,
>  	STR_AS_IN_IF_ALT0,
>  	STR_AS_IN_IF_ALT1,
> +	NUM_STR_DESCRIPTORS,

Does this require a change to the Documentation/ABI/ files as well?

thanks,

greg k-h

