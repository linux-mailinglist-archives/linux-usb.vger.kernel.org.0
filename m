Return-Path: <linux-usb+bounces-17457-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 498969C5051
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 09:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2AC5B27C81
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 08:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED89A20A5E2;
	Tue, 12 Nov 2024 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hks7fjzW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5AF154456
	for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731398803; cv=none; b=Xpf8THRZXc913iBtNWx/gUn8QaDRZOFF1hAvcHBFcRMvTH6ETYbGN3NLaaORpyV9UoxrVcwCPsYoObfjfiMnqrmTOnYFWtVz83MOf4wwoCwKd3eV4XAOAwW7PQUgRgakzu6eva6k/Tf3j/GqafszWUL2JCJqQeTQMw/ekAI3TnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731398803; c=relaxed/simple;
	bh=B3Jqg8mUW2HnyQJzhLCXbjr/Haz5FUCXS+MHfvStOGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFGerwosrKyHO+VcjiDoXkpNg8DVvEMe1i/dQupplw5ayRMr0SLtTo0BpKQ0YdUXIc4CaOyxfZ1yxERySjA49hsX3XRyENqxHwJ0UZYQDllH5v6gQwHYEi4m0p3stwp6ilvuikGn7pzeyuN6j+COWOzujKm3SbBTIgR93yjGxNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hks7fjzW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAA6C4CECD;
	Tue, 12 Nov 2024 08:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1731398803;
	bh=B3Jqg8mUW2HnyQJzhLCXbjr/Haz5FUCXS+MHfvStOGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hks7fjzWAY09dTGs1AvpvlU9LUaUzv+5XBHHeX4pr0OITkqVOiOSQx6AIbxPDn8Ab
	 mHxPqHclnVv/6QZIlhKK2yx6e+ulk9UHr0vFuQ9rd98QHxfRKLbkuhOTAucjqZUOO9
	 t+hgxY4i3qKJBIaGVWqLW4Jq1RkdPQzXOihedI9A=
Date: Tue, 12 Nov 2024 09:06:39 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 3/3] usb: misc: ljca: add firmware version sysfs
 attribute
Message-ID: <2024111255-uselessly-shale-7662@gregkh>
References: <20241112075514.680712-1-stanislaw.gruszka@linux.intel.com>
 <20241112075514.680712-3-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112075514.680712-3-stanislaw.gruszka@linux.intel.com>

On Tue, Nov 12, 2024 at 08:55:14AM +0100, Stanislaw Gruszka wrote:
> For diagnostics purpose read firmware version during probe and add
> sysfs attribute to make that information available.
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
> v3->v4: use sysfs attribute to provide firmware version,
> 	drop tags from Hans since the code changed
> v2->v3: use dev_dbg() for printing the firmware version
> v1->v2: fix 80-chars line wrap
> 
>  .../ABI/testing/sysfs-bus-usb-devices-ljca    |  9 ++++
>  drivers/usb/misc/usb-ljca.c                   | 53 +++++++++++++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-usb-devices-ljca
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-usb-devices-ljca b/Documentation/ABI/testing/sysfs-bus-usb-devices-ljca
> new file mode 100644
> index 000000000000..f5eb38bf99a8
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-usb-devices-ljca
> @@ -0,0 +1,9 @@
> +What:		/sys/bus/usb/devices/.../ljca_version
> +Date:		November 2024
> +KernelVersion:	6.13
> +Contact:	Sakari Ailus <sakari.ailus@linux.intel.com>
> +Description:
> +		Provides the firmware version of LJCA device.
> +		The format is Major.Minor.Patch.Build, where
> +		Major, Minor, Patch, and Build are decimal numbers.
> +		For example: 1.0.0.256
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index d9c21f783055..4b5bd5b27b2a 100644
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
> @@ -152,8 +160,10 @@ struct ljca_adapter {
>  	struct mutex mutex;
>  
>  	struct list_head client_list;
> +	struct ljca_fw_version fw_version;
>  
>  	bool disconnect;
> +	bool fw_version_valid;
>  
>  	u32 reset_id;
>  };
> @@ -740,6 +750,24 @@ static int ljca_enumerate_clients(struct ljca_adapter *adap)
>  	return ret;
>  }
>  
> +static void ljca_read_fw_version(struct ljca_adapter *adap)
> +{
> +	struct ljca_fw_version version;
> +	int ret;
> +
> +	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_GET_VERSION, NULL, 0,
> +			(u8 *)&version, sizeof(version), true,
> +			LJCA_WRITE_ACK_TIMEOUT_MS);
> +
> +	if (ret != sizeof(version)) {
> +		dev_err(adap->dev, "Get version failed, ret: %d\n", ret);
> +		return;
> +	}
> +
> +	adap->fw_version = version;
> +	adap->fw_version_valid = true;
> +}
> +
>  static int ljca_probe(struct usb_interface *interface,
>  		      const struct usb_device_id *id)
>  {
> @@ -811,6 +839,8 @@ static int ljca_probe(struct usb_interface *interface,
>  	if (ret)
>  		goto err_free;
>  
> +	ljca_read_fw_version(adap);
> +
>  	/*
>  	 * This works around problems with ov2740 initialization on some
>  	 * Lenovo platforms. The autosuspend delay, has to be smaller than
> @@ -874,6 +904,28 @@ static int ljca_resume(struct usb_interface *interface)
>  	return usb_submit_urb(adap->rx_urb, GFP_KERNEL);
>  }
>  
> +static ssize_t ljca_version_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct usb_interface *intf = to_usb_interface(dev);
> +	struct ljca_adapter *adap = usb_get_intfdata(intf);
> +	struct ljca_fw_version ver = adap->fw_version;
> +
> +	if (!adap->fw_version_valid)
> +		return -ENODATA;

Why are you showing this sysfs attribute if there is no firmware
version?  Please only create the file if it is possible to read a valid
value from it.

thanks,

greg k-h

