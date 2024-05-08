Return-Path: <linux-usb+bounces-10139-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 719CC8BFFD5
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 16:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23E551F227F9
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 14:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B4F85279;
	Wed,  8 May 2024 14:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="PkI/TWu9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626D854FA3
	for <linux-usb@vger.kernel.org>; Wed,  8 May 2024 14:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715178188; cv=none; b=RCEBMpcZ2CuH7xb330VzTJD0kJYG8X/vQEo+20fxX0fLuoQfiugqCzn7ZYqPO4TIikpObv9C++/CyRyWLk53y4grZe05HMoCnX69AQbpqLmfqLTIZqz42JNPLZFY6FH9eRlFsT7On7KTOsRIGmwulwPs2AW40bOPsSfS70FD9WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715178188; c=relaxed/simple;
	bh=iTOxWz5qyCtsY9EypXDnRK/yJwfu4rXlJYiN8rURcxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKXxclC+1OLB/4jBR+wTaDjBw38bytDs/ZTMQReN/uVyTVx+CsFzkT8RmqxHtmJDYFJNNIQMYqt7xq27JI7uwwYtpZT5QckrakhkHMCJ8lFiI40lNf9j9uaRoLKAjQbgyjuJZBEgp7y5qfWgwIwH2N0Vdp/jDxm588F0uWq2uAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=PkI/TWu9; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 900E56002411;
	Wed,  8 May 2024 15:22:55 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id olKpX-JP1FdT; Wed,  8 May 2024 15:22:53 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 4D399600300E;
	Wed,  8 May 2024 15:22:53 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1715178173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MylGb547aB2dhZyKrPvf/LOcOUbNwyHwPa2ACK4jJJg=;
	b=PkI/TWu9+c829Rbz2lzBIYbkQzU9yHkEj9pNbZ6uprlmCCDO3BURONs9qxHXFPG7UGcyOs
	PDZDDJtTdqPiUfVAYNwZLIfAXcJQNVPrdaFzT7Og8zMMsZDhzP9MvBPQyUGwGvWCRHZNNe
	WHO+/phsdaKKmRfQIqHnBQ+Nrp04kv4=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:4589:2164:1bc5:2670])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id DEDE2360071;
	Wed,  8 May 2024 15:22:52 +0100 (WEST)
Date: Wed, 8 May 2024 15:22:49 +0100
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com, 
	diogo.ivo@tecnico.ulisboa.pt
Subject: Re: [bug report] usb: typec: ucsi: Only enable supported
 notifications
Message-ID: <eo56goqwajv2p3wwfrma2wowv7t5fc6fhfapkb75ixs5rvl63a@4joxxdo7bq37>
References: <dd955f16-bbb9-4d51-98ea-31cad358ab69@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd955f16-bbb9-4d51-98ea-31cad358ab69@moroto.mountain>

Hello Dan,

On Wed, May 08, 2024 at 10:53:05AM GMT, Dan Carpenter wrote:
> Hello Diogo Ivo,
> 
> Commit 27ffe4ff0b33 ("usb: typec: ucsi: Only enable supported
> notifications") from Mar 27, 2024 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/usb/typec/ucsi/ucsi.c:1671 ucsi_get_supported_notifications()
> 	warn: was expecting a 64 bit value instead of '((((1))) << (24))'
> 
> drivers/usb/typec/ucsi/ucsi.c
>     1665 static u64 ucsi_get_supported_notifications(struct ucsi *ucsi)
>     1666 {
>     1667         u8 features = ucsi->cap.features;
>     1668         u64 ntfy = UCSI_ENABLE_NTFY_ALL;
>     1669 
>     1670         if (!(features & UCSI_CAP_ALT_MODE_DETAILS))
> --> 1671                 ntfy &= ~UCSI_ENABLE_NTFY_CAM_CHANGE;
> 
> ntfy is a u64 but UCSI_ENABLE_NTFY_CAM_CHANGE is unsigned long.  So on
> a 32 bit system this will clear the high 32 bits.  So far as I can see
> ntfy should just be a u32.  Either way, the types should match.
> BIT_ULL() is the way to do that if it really needs to be a u64.

In my view this variable really should be a u64 and the definitions of
the UCSI_ENABLE_NTFY_* need to be changed to BIT_ULL(). This is due to
UCSI versions 2.0 and up definining a new notification on bit 33, crossing
the u32 barrier. My suggestion for addressing this is sending two
patches, one for changing BIT() -> BIT_ULL() and adding the missing
define for the notification of bit 33 and a separate patch to handle
this new notification bit in ucsi_get_supported_notifications()/ucsi_init().

Thank you for the report and please let me know if this sounds
reasonable, or if it would be better to split the changes in another
way.

Best regards,
Diogo

