Return-Path: <linux-usb+bounces-11390-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A190CBB2
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 14:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40275B221FA
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 12:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2EF823B8;
	Tue, 18 Jun 2024 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CUs1L9s/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585217347C
	for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2024 12:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718713206; cv=none; b=R2Bgkc3g0Kdn6MDHeRj5tyq6D62LJIR3RFZaAXpGAzUzJlbdk9WnV42pFkTgdolSur6lPJkpJx+6zVLwlkioP8SzInDaAXalm0rOmDGt1LqSzzp32NRdmZHC/i0rAicRc7sjuqRG/Sx/UyTqpzev4xYgI/au32GsB8H0kcUFaSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718713206; c=relaxed/simple;
	bh=CKFsjyIb1IC8uyEJ9Hnrb250Sl9YYzrsSK8OTSm6JR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCBxSwCFqt9ka9tS7J/ODx8nd9K155I4VZ7FszlYkWQjPBssm1ElMi0G4olK+awxLz4LiTeGXV3EVv34DMrE5SbHFjsabgjLsJ1BUClzpq9dgWibLSgM2ts4gHvIGM2GifpeiX2DBVCX0qb7F+K3dT9xSHOuRMW7s2YCpP3BGos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CUs1L9s/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70088C3277B;
	Tue, 18 Jun 2024 12:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718713205;
	bh=CKFsjyIb1IC8uyEJ9Hnrb250Sl9YYzrsSK8OTSm6JR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CUs1L9s/vrsKtfwx2knOv1KefjeHE1pbbgbAiM9wqllezjlkCL7nQJb02CF9v+FX/
	 8epo92M+/5NRfIv/8B6j5LMErlES7i1ZqgOzxDTQXeRy018SaE4X1iheX+0unralph
	 X9QP2YxbCErkz/8JWpzCAipEAFaHu5o7pV91piW0=
Date: Tue, 18 Jun 2024 14:20:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Changing the driver data type to void
Message-ID: <2024061858-boring-wrecker-3871@gregkh>
References: <20240618120024.3384047-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618120024.3384047-1-heikki.krogerus@linux.intel.com>

On Tue, Jun 18, 2024 at 03:00:24PM +0300, Heikki Krogerus wrote:
> Let's use the same data type as struct device.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 97eda8cd63df..1280cac314fe 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -395,7 +395,7 @@ struct ucsi_debugfs_entry {
>  struct ucsi {
>  	u16 version;
>  	struct device *dev;
> -	struct driver_data *driver_data;
> +	void *driver_data;

Nice, but why?

And how was this building?  I don't see a "struct driver_data" defined
anywhere here.

thanks,

greg k-h

