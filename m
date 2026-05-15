Return-Path: <linux-usb+bounces-37518-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOYPM+cwB2oQswIAu9opvQ
	(envelope-from <linux-usb+bounces-37518-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 16:42:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E66B5519D6
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 16:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5D28304C05F
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 14:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A7A3B5311;
	Fri, 15 May 2026 14:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="r5fzMnjx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B211A3B3C08
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 14:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855951; cv=none; b=TZ1KffCoH0ISTQxNecJ0mIqcHWF9mhFyjhDsEvdTrvQPkv1PnD1x5nQIOYk+ajwtC2w2qTDS51n4L691bdGusspjPfbt4GinGcqZfCp26hSwxqAh0+dG1i3Let9TMyK6QeOt9iZsjPix2CpVbTGkEwjnISeb4yVV1bIn0ddzKvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855951; c=relaxed/simple;
	bh=5ei7fh/Y69tCRQ3kK/dbGYFuojcIwy3an7mcbITipcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZL1BFqRkidBh7Quue3McenI8PSZKPYOq1zV5io2+Z7zr5hvuobIDv30Drluo1kEJ+O0TPNpMtx54Xo/s+Z69Coor8VZ0h+HEW8VSjtjtQ2ClZ5p2n/Q+MKlFpq3lfErMGTuulDJOC1LcmiLN+BjXC3bAO0Sp8rrBF3jCGD91qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=r5fzMnjx; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9568159ee07so5728188241.1
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1778855949; x=1779460749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BQxJjtW9NoHteCK0AjadT0ZiWp4xMo5S2G7yHBWhKm0=;
        b=r5fzMnjxo0qn47DQheu+8z2BqVawUayNL19uz+3HNCVkcfleHmePGSySdncjPWRlFL
         pyzYzWAhxGtYttSooQV6s0iEnztVj8Znl0pLey9ORkA+ry7diHDpSXXziTw4HzbpN+mL
         5igrMArIrATYGLp9FMEWMoWAwbQRiX7FBxA88r1H74RNRo0QkogWc0Pfy3h0uzfgy2Ow
         UOJpkHXJo1G9zABJeA/iUcFWpnGwA+3ztUcjxcxYS2KuQDWaMpKQrKJt6fpQyNp5Y1lw
         oMcuYZtMhxuN9N0/NLYbsqbptZruq8Iv+HICmnHUG1iWpANS/ZrpA6TwTCe6khEjfn+S
         hMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778855949; x=1779460749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQxJjtW9NoHteCK0AjadT0ZiWp4xMo5S2G7yHBWhKm0=;
        b=ie/Y/2EeuwXTxcOr4cTI/NbEggYEat+7Q3LFWVJ1pZUIl7jOmWt0NGdnjXxP7406Ou
         tPR3x5JiqUwVe3C9CzkcQBZQxpUdWi3wPmOr0hFuSI1bnWXPM7yCY6HBsuDG6vkTpk7U
         l5sbwDcXQ4Jnz6zxYnbs5eO0M+debBIwBumiF7bwhrLbCLZE9LZJulVA/xCeySzJOP71
         HTiJChQsGK5KXBerKrNISBphAqd+uUi0fx1iPs8AcR6kfri0fGObmwMpdOgKyBUmBOyz
         zJgx2FJ7ys0l+aLpYS5IyfHd/D09JEiJlxhbOX4qBj65PUJo9gb47CaJ1qMLY4rHl3VG
         RALA==
X-Forwarded-Encrypted: i=1; AFNElJ/yWKnzyXoY1+9NNEnItVqnvov5wxYvQr0js+7yT5XaDzu7sH/xXKkzCjPAn6qPNzDXyJ80U1NxGig=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEU0NPTXda3WSQ0b1nxENxkqnhif9fGmilVGpnVv2Yw65HEXmJ
	+rTNoUhnmJQE3+j5g8Z4D2LM1vuUwEvDAWCqxj+2uvvVOvF2XTj7Xl340HbNURhZqw==
X-Gm-Gg: Acq92OG9D+Ib4kGmknz/INDPNQ3I9MOCZI6uK+q4e1wFfvfyv86mkzYvVe7eruNAlXS
	uQs1wZi4LjlRDfAVvcMPe9dxu0S124eqETDzNq8h5JBuUCx2p1ip48J+AMddeZEQOr+xivmxz8Z
	/nTk0BbAmZ3GyjMeZYzFBmoiiJmj8ocoFVJkYMbz1cSZrjvBgUJxQfOyIE0oqG4AnTVwKkbH+wM
	kNZUEpMFzPfBgLDXzQtZ2oPCv0ONC9BVGQqt+Lo5Zbdx7YA1dKqtyeRRQHTsWdycL5wuuuncap4
	fGnTz47o2zsHmdmKECNRKDGEsGWLQAXjjpo7dWZUP6UJ3C6j8x6OLe6zXcapYWD5vNaq2W6AXkl
	BsG4upQFR7rPis55GAMdp2wkpuuydeZfTUVEUQVQNqVHzHcNJx+Oxuvo/mqlC4g6J5Y2fWhgapt
	YCF6mK2JsIlniioaFb0ewRVAbp/SlSPPZIY+7UM/PX6RE=
X-Received: by 2002:a05:6102:e14:b0:633:1fbe:79c8 with SMTP id ada2fe7eead31-63a3f597eb4mr2246407137.23.1778855948736;
        Fri, 15 May 2026 07:39:08 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90b3d0bdbsm51850896d6.24.2026.05.15.07.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:39:08 -0700 (PDT)
Date: Fri, 15 May 2026 10:39:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH RFC 05/12] usb: hub: Power on connected M.2 E-key
 connectors
Message-ID: <41260a6d-46fa-4a45-9906-e1bc5e5dd83a@rowland.harvard.edu>
References: <20260515090149.3169406-1-wenst@chromium.org>
 <20260515090149.3169406-6-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515090149.3169406-6-wenst@chromium.org>
X-Rspamd-Queue-Id: 2E66B5519D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-37518-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim,intel.com:email]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 05:01:41PM +0800, Chen-Yu Tsai wrote:
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 90ea597d42ae..4165f71e212b 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -31,7 +31,9 @@
>  #include <linux/minmax.h>
>  #include <linux/mutex.h>
>  #include <linux/random.h>
> +#include <linux/of_graph.h>
>  #include <linux/pm_qos.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/kobject.h>
>  
>  #include <linux/bitfield.h>
> @@ -888,13 +890,25 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
>  {
>  	int ret;
>  
> +	if (set)
> +		ret = pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
> +	else
> +		ret = pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
> +	if (ret)
> +		return ret;
> +
>  	if (set)
>  		ret = set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
>  	else
>  		ret = usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
>  
> -	if (ret)
> +	if (ret) {
> +		if (set)
> +			pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
> +		else
> +			pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
>  		return ret;
> +	}
>  
>  	if (set)
>  		set_bit(port1, hub->power_bits);
> @@ -1867,6 +1881,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  	struct usb_host_interface *desc;
>  	struct usb_device *hdev;
>  	struct usb_hub *hub;
> +	int ret;
>  
>  	desc = intf->cur_altsetting;
>  	hdev = interface_to_usbdev(intf);

This change is totally useless.  Didn't you get a warning from the 
compiler when you built it?

> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index 9ebc5ef54a32..6039e5f5dcd7 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h
> @@ -85,6 +85,7 @@ struct usb_hub {
>   * @port_owner: port's owner
>   * @peer: related usb2 and usb3 ports (share the same connector)
>   * @connector: USB Type-C connector
> + * @pwrseq: power sequencing descriptor for the port
>   * @req: default pm qos request for hubs without port power control
>   * @connect_type: port's connect type
>   * @state: device state of the usb device attached to the port
> @@ -104,6 +105,7 @@ struct usb_port {
>  	struct usb_dev_state *port_owner;
>  	struct usb_port *peer;
>  	struct typec_connector *connector;
> +	struct pwrseq_desc *pwrseq;
>  	struct dev_pm_qos_request *req;
>  	enum usb_port_connect_type connect_type;
>  	enum usb_device_state state;

The fact that hub.h uses struct pwrseq_desc indicates that it ought to 
#include <linux/pwrseq/consumer.h>, instead of making the .c files do 
so themselves.  Then you wouldn't have to add the #include lines to 
hub.c and port.c.

> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b1364f0c384c..2d09037fee93 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -7,11 +7,14 @@
>   * Author: Lan Tianyu <tianyu.lan@intel.com>
>   */
>  
> +#include <linux/cleanup.h>

Why is this needed?

>  #include <linux/kstrtox.h>
>  #include <linux/slab.h>
>  #include <linux/string_choices.h>
>  #include <linux/sysfs.h>
> +#include <linux/of_graph.h>
>  #include <linux/pm_qos.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/component.h>
>  #include <linux/usb/of.h>
>  

Alan Stern

