Return-Path: <linux-usb+bounces-17220-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6322F9BEEF5
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 14:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF53BB22812
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 13:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2A41DF97A;
	Wed,  6 Nov 2024 13:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YXmSHrul"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD091DE4E6
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 13:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730899467; cv=none; b=G3zqN0QYiQvzmA9ygzqQaQfJPGvv811aqpLBjKigRX0jqvxoeWzLOuS5ZH3u3dWoHI7MLMsrRjkbshsF6YVAGSXg9JuYIVoVDt1wPzJq0exDDuakapKDJcZPcL8rInlhdkFc6fEmIZHw6BT8EfYSgge0QlbNttSnceENi//f5o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730899467; c=relaxed/simple;
	bh=uPJcKKopbjprTvGRcJLkv9e7Siw+5dQq9aElOZKir2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0IalAJ+jBPWPsceJRR7ggKk2SEZB4rKBcdzMxsQjbRhLsnBgO+z/nu1bp+ZmpsBReGpDVz3UcShmtWH3kGV/sGa1SMwGiW7wMajpISODy+L2XPkew1NQg/NLar4WX2Y6jXzIx8DY2HUOsqRzP/XqRLE6vsfav47pX0f2D8TOtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YXmSHrul; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C689C4CECD;
	Wed,  6 Nov 2024 13:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730899467;
	bh=uPJcKKopbjprTvGRcJLkv9e7Siw+5dQq9aElOZKir2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YXmSHrul1g6Ylwrsh/aRqNIFK2rimdSzzWxtuoz1ry0z2bc/TvVRd2x9lqFUaQoQI
	 WlMsDoW/+00i0RUWhL3duqAzFAlNwBvqs15A7YV3p/EKD0F/ohl+oyYzkSI1e0yLuJ
	 PW8s2gMkKNqM3YWP6Jxsd6hDWCCnAW5768n6lpy4=
Date: Wed, 6 Nov 2024 13:42:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 3/3] usb: misc: ljca: print firmware version
Message-ID: <2024110620-dating-roman-f820@gregkh>
References: <20241106123438.337117-1-stanislaw.gruszka@linux.intel.com>
 <20241106123438.337117-3-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106123438.337117-3-stanislaw.gruszka@linux.intel.com>

On Wed, Nov 06, 2024 at 01:34:38PM +0100, Stanislaw Gruszka wrote:
> For diagnostics purposes read firmware version from device
> and print it to dmesg during initialization.

No, sorry, when drivers work properly, they are quiet.  Think about what
your kernel log would look like if you did this for every single driver
in the tree.

> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/usb/misc/usb-ljca.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index d9c21f783055..e698a1075a40 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -43,6 +43,7 @@ enum ljca_client_type {
>  
>  /* MNG client commands */
>  enum ljca_mng_cmd {
> +	LJCA_MNG_GET_VERSION = 1,
>  	LJCA_MNG_RESET = 2,
>  	LJCA_MNG_ENUM_GPIO = 4,
>  	LJCA_MNG_ENUM_I2C = 5,
> @@ -68,6 +69,13 @@ struct ljca_msg {
>  	u8 data[] __counted_by(len);
>  } __packed;
>  
> +struct ljca_fw_version {
> +	u8 major;
> +	u8 minor;
> +	__le16 patch;
> +	__le16 build;
> +} __packed;
> +
>  struct ljca_i2c_ctr_info {
>  	u8 id;
>  	u8 capacity;
> @@ -695,6 +703,25 @@ static int ljca_reset_handshake(struct ljca_adapter *adap)
>  	return 0;
>  }
>  
> +static void ljca_print_fw_version(struct ljca_adapter *adap)
> +{
> +	struct ljca_fw_version version = {};
> +	int ret;
> +
> +	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_GET_VERSION, NULL, 0,
> +			(u8 *)&version, sizeof(version), true,
> +			LJCA_WRITE_ACK_TIMEOUT_MS);
> +
> +	if (ret != sizeof(version)) {
> +		dev_err(adap->dev, "Get version failed, ret: %d\n", ret);
> +		return;

Why not return the error?

> +	}
> +
> +	dev_info(adap->dev, "Firmware version: %d.%d.%d.%d\n",
> +		 version.major, version.minor,
> +		 le16_to_cpu(version.patch), le16_to_cpu(version.build));

Again, sorry, but no.  Feel free to dump this in a sysfs file if you
really want to get access to it, but not in the kernel log.

thanks,

greg k-h

