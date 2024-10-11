Return-Path: <linux-usb+bounces-16087-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B127E99A471
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 15:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 172AC1F22CF2
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 13:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06CB2185AB;
	Fri, 11 Oct 2024 13:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iZRO6BPx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241D3216A14
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728652045; cv=none; b=p/gLLrVa/7C9On/SPH9yF6Yloy4AFXie5h6Kz07VC28aWps16c15WG/CLa3+D2n4Q0uxvUFiMKOq9afgduIrfxy/EpK/akxrkiloMe6E9hOl5Mw7ZFSfj85RXtIckQnv8evIpyCnx7HmwK0O8AL5aHhURzLiw+Zz+lLPzCO5B1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728652045; c=relaxed/simple;
	bh=y3fww4BWYLXJVTA9YyShOWMRPXxoqpDDvENzVUv5TBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjJuvzI4vx3vJUPkCzoPnCy2/4Lqiz8As+HoT6MhoRfTwdxVOJDfWDtNE9LCpwpGa3chdwGxgPxWFae1/x6wIpTvX+cesa1//JLByvGEejLpsjXQyijjPIF/Cmhu5W0lNMDxP+tFeLpCHmkdKnTXBP9bsfh1u73BsROdjQmbpyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iZRO6BPx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21404C4CECC;
	Fri, 11 Oct 2024 13:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728652044;
	bh=y3fww4BWYLXJVTA9YyShOWMRPXxoqpDDvENzVUv5TBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZRO6BPxUMsNM93qoK2U9Tiva0bgnGptF+M1htUgKvCQM3AYyjHFG3ZcXBN93LBuF
	 VopOzkw7pj7B+fMjck/YkMJOr8U3APgcNbvsTc/tsJyCCudISD362MPbd6bOQO3Z6y
	 elO8Qv3weFDwzwYudXyrl+PEA16YE+soaeIA+Q3E=
Date: Fri, 11 Oct 2024 15:07:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 1/4] usb: typec: Add attribute file showing the
 supported USB modes of the port
Message-ID: <2024101155-goes-demote-f6f6@gregkh>
References: <20241011124402.3306994-1-heikki.krogerus@linux.intel.com>
 <20241011124402.3306994-2-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011124402.3306994-2-heikki.krogerus@linux.intel.com>

On Fri, Oct 11, 2024 at 03:43:59PM +0300, Heikki Krogerus wrote:
> +What:		/sys/class/typec/<port>/usb_capability
> +Date:		May 2024

It's a bit past May 2024 :)

> +static ssize_t
> +usb_capability_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	enum usb_mode mode = to_typec_port(dev)->usb_mode;
> +	u8 cap = to_typec_port(dev)->cap->usb_capability;
> +	int len = 0;
> +	int i;
> +
> +	for (i = USB_MODE_USB2; i < USB_MODE_USB4 + 1; i++) {
> +		if (!(BIT(i - 1) & cap))
> +			continue;
> +
> +		if (i == mode)
> +			len += sysfs_emit_at(buf, len, "[%s] ", usb_modes[i]);
> +		else
> +			len += sysfs_emit_at(buf, len, "%s ", usb_modes[i]);
> +	}
> +
> +	buf[len - 1] = '\n';

Nit, shouldn't this be another call to sysfs_emit_at()?

> @@ -240,6 +251,7 @@ struct typec_partner_desc {
>   * @port_type_set: Set port type
>   * @pd_get: Get available USB Power Delivery Capabilities.
>   * @pd_set: Set USB Power Delivery Capabilities.
> + * @default_usb_mode_set: USB Mode to be used by default with Enter_USB Message
>   */
>  struct typec_operations {
>  	int (*try_role)(struct typec_port *port, int role);
> @@ -250,6 +262,7 @@ struct typec_operations {
>  			     enum typec_port_type type);
>  	struct usb_power_delivery **(*pd_get)(struct typec_port *port);
>  	int (*pd_set)(struct typec_port *port, struct usb_power_delivery *pd);
> +	int (*default_usb_mode_set)(struct typec_port *port, enum usb_mode mode);

Naming is hard, but usually it's "noun_verb" so wouldn't this be just
"mode_set_default"?  We know it's usb :)

But why default, why not just "mode_set"?  or "set_mode" given you have
"try_role" here, but then you have "pd_set".  Ick, I don't know, it's
your code, so your call, nevermind...

thanks,

greg k-h

