Return-Path: <linux-usb+bounces-25221-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E157AEC7F2
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 16:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63F3A3B04FB
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 14:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E887C253B40;
	Sat, 28 Jun 2025 14:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ya1SPDOV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FD3248F70
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751122319; cv=none; b=TXD18qKg8dB7QcjcQdP3HH2ylnzZxsf2D56wCsSZIThBoiKR+NYQaYUJr20uD3vVzr13yg7Jb/NGyKPdIGbluX1wwg9AO/7vBRQXySv2yaGVX/R7fBiullMGQzePuCESVLjBGoaPC3zcYY43fBnFoJOBU5Kqp1apbaswuNYO1sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751122319; c=relaxed/simple;
	bh=od+mXCuGgMrNRM65GntUWjWhsuBzKhrx4BnjLNti+iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/VN4CkJSqFEe0ew3K0DXibr63TgeyNwKKtsHSqo/s9TziqC+6YwfTvzSfk+f4knVHY7qLuOfgqF/uQ5dIEJnezgiMFZB28KE1IBv17qsnG3jV8oDPaydKXLCy1D5/oCLhNozYcBT8/yylq/MuOQ/zOxt5isdj2HW8w5mE0s2co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ya1SPDOV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C785C4CEF0;
	Sat, 28 Jun 2025 14:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751122318;
	bh=od+mXCuGgMrNRM65GntUWjWhsuBzKhrx4BnjLNti+iM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ya1SPDOVg1urQHTTYlrfCVuZmy+UbjDgVVYrih95Oe/Nv9AqUuyVpkJhPTHPzT5Ra
	 I6py/3T2nhHDGpUpnE/BGHd/FgUT3hr2cDoSjvVBurPBOHXL1aHuN848Y8AHdyIkgH
	 jDitz9U/kOljLl/FjdxJteomENKNnjXuIHo35RQg=
Date: Sat, 28 Jun 2025 16:51:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pooja Katiyar <pooja.katiyar@intel.com>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] usb: typec: ucsi: Add support for message out
 data structure
Message-ID: <2025062813-untying-hesitancy-088a@gregkh>
References: <cover.1751042810.git.pooja.katiyar@intel.com>
 <cc0b7701c4ea3d1001fefeb3df65caeb3e624722.1751042810.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc0b7701c4ea3d1001fefeb3df65caeb3e624722.1751042810.git.pooja.katiyar@intel.com>

On Fri, Jun 27, 2025 at 11:10:10AM -0700, Pooja Katiyar wrote:
> Add support for updating message out data structure for UCSI ACPI
> interface for UCSI 2.1 and UCSI 3.0 commands such as Set PDOs and
> LPM Firmware Update.
> 
> Additionally, update ucsi_send_command to accept message_out data
> and .sync_control function to pass message_out data to
> write_message_out function if the command is UCSI_SET_PDOS.

Normally when you say "additionally" that implies that the patch should
be split up into pieces.  Why not do that here?

And do you _really_ need to add a new parameter to all of these
functions?  It's now getting even worse, look at this:

>  		ret = ucsi_send_command(ucsi, val,
>  					&ucsi->debugfs->response,
> -					sizeof(ucsi->debugfs->response));
> +					sizeof(ucsi->debugfs->response), NULL);

You can kind of guess what the parameters mean before the NULL change,
but now you have to go look up "what is the last pointer for"
everywhere.

This feels very fragile and horrible to maintain over time, please
reconsider this type of api change.



>  		break;
>  	default:
>  		ret = -EOPNOTSUPP;
> diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
> index 8aae80b457d7..93912719d915 100644
> --- a/drivers/usb/typec/ucsi/displayport.c
> +++ b/drivers/usb/typec/ucsi/displayport.c
> @@ -67,7 +67,7 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
>  	}
>  
>  	command = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(dp->con->num);
> -	ret = ucsi_send_command(ucsi, command, &cur, sizeof(cur));
> +	ret = ucsi_send_command(ucsi, command, &cur, sizeof(cur), NULL);

See, why NULL?  What does it have to do with a command?  And why can't
whatever is in that pointer place be part of that command to start with?

>  int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
> -			     void *data, size_t size)
> +			     void *data, size_t size, void *message_out)

So what is the difference between command, cci, data, and message_out?

Again, I think you need to reconsider this...

greg k-h

