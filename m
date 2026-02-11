Return-Path: <linux-usb+bounces-33292-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPaCGIyajGlkrgAAu9opvQ
	(envelope-from <linux-usb+bounces-33292-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 16:04:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E3B125696
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 16:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B63E03017F80
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 15:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2B32877D5;
	Wed, 11 Feb 2026 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qJlnJbUy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEDD1DF980
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 15:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770822279; cv=none; b=q1u4qW+/PjW5cOECNzPX6qisaUayR1zMRi+UsouAGSj2V4kd7ASxMkqEKmfNfodIFVJSADDpHbUCykD9b/SliaUuQTA/TQ6s6nZxNAkfEFIqfWb+nqrXVOHWS63ZMxec5Tbpyl5B8idVFnjjKN1xR5+WpXptNyyg9zZpKqflxVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770822279; c=relaxed/simple;
	bh=AmZMzOclZ8x0kbRdv+6orlxHCTBrmpBGJ67CosDnpSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/3F2KGp93QktqWvFqsssLFXkBT/ikjmPTA0U/3dpe+pUexz2fw3ff8bmGKJcALKexdKzMYDI82t5I9nJ6/tFH0CSZQRtNwwJ/N4VJdh563JCYtK7kw4VKQeGclmvA43wntfhafdUGD97384nO1MwbqPq1VrPaA9l9lF9UWEiPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qJlnJbUy; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5014600ad12so49377671cf.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 07:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770822277; x=1771427077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YQ2XuMNlJ0VrBoxBJpOB6BdQH/fRgWhyXV6P5UB4GYc=;
        b=qJlnJbUyvrqXQTgBoH7KfqLTu4Gb+hiq97dWzAGDLTWt8qorWJM+8EJpNjLFODT6OQ
         BwJkc518Sz8gxt37JfTydTGpQJWF+j2bNI/lBPPuYurkEJHh9BXY9Xe3cK+E+p1VM/TH
         w8OwFu/m5H1mIvERQD+YiDikbBRuE12RUFZ9YupP5mkUpARWSR61SeUrvFWJR4pw4im5
         wCB0ImLfAInG5S6i2oFjzmo2Hw/PDv0qX7l5TNWZO+57WzDszl5BFfT6YLtkUX0ft9lY
         MyfPOwlEe6xwewC08OkeUiLspVUqKE1d80MgTDmSVREMWfq2+dSWeppQ+0u2sKbONeJe
         w5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770822277; x=1771427077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ2XuMNlJ0VrBoxBJpOB6BdQH/fRgWhyXV6P5UB4GYc=;
        b=CLcrOtNgmIMNG4/1nEdEKiE/6CgH+A7vWO80QsupDMxayva5KkvaH6zzry39xX5hGo
         pGXyLY+mFJzVQG/RNnF5lyan9hpNFY+cSr3V1vEwWe1ObT41+OGlH3wB3LUkB/sxLFcr
         mTMpHl0/4CjnCZHKwIH5CVxDLGKv7fBWFKzspXi76HuBBclpcTErILp9oP8TY8exyFyd
         lnHzX+mhyvgtJp8wTJubdqsKE7oc5R49z6VcGGClW513NqAhQ5ebsonZpWcHW9pI8MIV
         mo1q/NC0Tm/WBjoVK94IaaxowzHMXlKfLFQf/FwnBpPtl8vfDhJ3dOlRd/sTnyhe6wQK
         oMng==
X-Forwarded-Encrypted: i=1; AJvYcCUZ+7VYTUSFpMwUZ/qYC/QOhOXefTWf53KOj9u49oNp4pcXiSAAeeWsk8EUypjPBSB20ofe5RBLyfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+84lC+8dho8Cp3jFKSbGhUnOn3R2e37veXAmdOs1aO7PT45FT
	Z4x6SOoCg/sDlesTLZFF/VTPXQg/QLlzAMAbzETJpcynjeruBDOXNTIPn+SEwIDjLQ==
X-Gm-Gg: AZuq6aKAPgAzZ4wDA3LXBGFuYez+iThubARIR9+AjMp92Pud1jS6SR2i//6hC8Coo0D
	1zFpEnXprc8bDydPja1tUsRW1yftsl8Nh/2Bv5GlwdUpCgZbgOOYkb41tA5mOz1GGUgnmvZqkCR
	zSXZNxVesKMQcVO7gWVgdJ2PELtsS7z/U/V8UOUZ2bvFxckTZukpzh83jyhq3kMpsBKabWmYqh5
	UgLYgJjG9a25uF7NDvYmTafyc7O/k+KOwb3fKCf6+uBdsiHyyl++ZVrit/g+iM861/61tHL3/P+
	hFLN2qVnqhZEnNudjw/T5E/ZWBacuqVzJ0xoe954NT1Av/p00baDY6+Tzn0V3Xm17uxKgJv7nGQ
	s181pxx8w59i1NXBWvbYNEvo98bOg/n5NvDF5ozNXSPUOvF9GGfdMgPWd0zbM7rTWBh0hNnmU5Y
	KJZWgzK/zR7NOwYBS37ZXI2r2sda5QNxan+wWqGYE/CA==
X-Received: by 2002:a05:622a:11cf:b0:4ee:2984:7d93 with SMTP id d75a77b69052e-50673cf1ec0mr71711981cf.17.1770822275252;
        Wed, 11 Feb 2026 07:04:35 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cda750dsm18472026d6.35.2026.02.11.07.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 07:04:34 -0800 (PST)
Date: Wed, 11 Feb 2026 10:04:32 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, m.grzeschik@pengutronix.de,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: port: add delay after usb_hub_set_port_power()
Message-ID: <1be3ca8a-032d-487e-92f4-67b2070be213@rowland.harvard.edu>
References: <20260211103628.3265850-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211103628.3265850-1-xu.yang_2@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33292-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: C3E3B125696
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 06:36:28PM +0800, Xu Yang wrote:
> When disable the root hub port, somehow the device is disconnected and
> re-connected again. This happens because usb_clear_port_feature() does not
> clear a truly happened port change. That says, in fact, port change event
> may happen after usb_clear_port_feature() is called. Then the subsequent
> port change event will have impact on usb device suspend routine.

This is not a very good description of the problem.  Here's a better 
one:

When a port is disabled, an attached device will be disconnected.  This 
causes a port-status-change event, which will race with hub autosuspend 
(if the disabled port was the only connected port on its hub), causing 
an immediate resume and a second autosuspend.  Both of these can be 
avoided by adding a short delay after the call to 
usb_hub_set_port_power().

Alan Stern

> Below log shows what is happening:
> 
> $ echo 1 > usb1-port1/disable
> [   37.958239] usb 1-1: USB disconnect, device number 2
> [   37.964101] usb 1-1: unregistering device
> [   37.970070] hub 1-0:1.0: hub_suspend
> [   37.971305] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0002
> [   37.974412] usb usb1: bus auto-suspend, wakeup 1
> [   37.988175] usb usb1: suspend raced with wakeup event         <---
> [   37.993947] usb usb1: usb auto-resume
> [   37.998401] hub 1-0:1.0: hub_resume
> [   38.105688] usb usb1-port1: status 0000, change 0000, 12 Mb/s
> [   38.112399] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
> [   38.118645] hub 1-0:1.0: hub_suspend
> [   38.122963] usb usb1: bus auto-suspend, wakeup 1
> [   38.200368] usb usb1: usb wakeup-resume
> [   38.204982] usb usb1: usb auto-resume
> [   38.209376] hub 1-0:1.0: hub_resume
> [   38.213676] usb usb1-port1: status 0101 change 0001
> [   38.321552] hub 1-0:1.0: state 7 ports 1 chg 0002 evt 0000
> [   38.327978] usb usb1-port1: status 0101, change 0000, 12 Mb/s
> [   38.457429] usb 1-1: new high-speed USB device number 3 using ci_hdrc
> 
> To fix the issue, add delay after usb_hub_set_port_power(). So port change
> bit will be fixed to the final state and usb_clear_port_feature() can
> correctly clear it after this period. This will also avoid usb runtime
> suspend routine to run because usb_autopm_put_interface() not run yet.
> 
> Fixes: f061f43d7418 ("usb: hub: port: add sysfs entry to switch port power")
> Cc: stable@kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/core/port.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index f54198171b6a..a47df5d32f7c 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -141,6 +141,7 @@ static ssize_t disable_store(struct device *dev, struct device_attribute *attr,
>  		usb_disconnect(&port_dev->child);
>  
>  	rc = usb_hub_set_port_power(hdev, hub, port1, !disabled);
> +	msleep(2 * hub_power_on_good_delay(hub));
>  
>  	if (disabled) {
>  		usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_CONNECTION);
> -- 
> 2.34.1
> 

