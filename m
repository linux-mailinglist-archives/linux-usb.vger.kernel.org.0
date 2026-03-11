Return-Path: <linux-usb+bounces-34547-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 92C0LXNcsWlHuQIAu9opvQ
	(envelope-from <linux-usb+bounces-34547-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 13:13:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27923263778
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 13:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA9E7301752E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 12:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5B03DB63C;
	Wed, 11 Mar 2026 12:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Md5j6CnK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EC63382C7;
	Wed, 11 Mar 2026 12:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773231211; cv=none; b=uP6s2ENcESUBSwoIlj7180MaJglfU0fD23VngjbK6W8Z10UlA13h3CHleASmLdYQsoTsDEKJ27QjJRRrlrBj7+/fkm67FCqI9sJbtsMqV/l07Upl5TrGEHSVNJi3OFT82HqAhg8UyAxbWJGTHsDT48eYdImkTOQOnySSLodUOAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773231211; c=relaxed/simple;
	bh=tkGffPq4yfL/PxYvhZFHb6cAf2UfSjFykL/0S3/mwBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1+XOjtFj5LhTyrHtWbVVFcmbXkpjCkLrMaP3SHskst7tExCONybNG6ZqJr+aLRfADiHoQY1FGvsdGmYWS5w2uGcbjVC02EnU6BluBwYGe1FiOUel2lv4ZqXCY1wWHksyZdBm598kr+B1wNvMlDyuMDwIhfgUn3b4OGyz50HNY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Md5j6CnK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFB1C4CEF7;
	Wed, 11 Mar 2026 12:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773231210;
	bh=tkGffPq4yfL/PxYvhZFHb6cAf2UfSjFykL/0S3/mwBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Md5j6CnKKlGhZo/PLoWLE1bECkC/fN+AlmqDGaK//W5Igk6vINMQ8sYkLK7gcUSSQ
	 woAdROYG2c/IWrpdmhkchwnlRNyMg9PGDoT9SQIcQSwjWU1HY2fZC/DBYjiWqshTMx
	 yS604v905UK0E3bUSgZCS/89wAVrvWGk0ba31MmM=
Date: Wed, 11 Mar 2026 13:13:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zongmin Zhou <min_halo@163.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] usbip: tools: Add usbip host driver availability check
Message-ID: <2026031146-battery-ripcord-02f6@gregkh>
References: <20260303081720.84868-1-min_halo@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303081720.84868-1-min_halo@163.com>
X-Rspamd-Queue-Id: 27923263778
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34547-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[163.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,zenithal.me,vger.kernel.org,kylinos.cn];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,kylinos.cn:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 04:17:20PM +0800, Zongmin Zhou wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> Currently, usbip_generic_driver_open() doesn't verify that the required
> kernel module (usbip-host or usbip-vudc) is actually loaded.
> The function returns success even when no driver is present,
> leading to usbipd daemon run success without driver loaded.
> 
> So add a check function to ensure usbip host driver has been loaded.
> 
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> ---
>  tools/usb/usbip/libsrc/usbip_device_driver.c |  2 ++
>  tools/usb/usbip/libsrc/usbip_host_common.c   | 31 ++++++++++++++++++++
>  tools/usb/usbip/libsrc/usbip_host_common.h   |  2 ++
>  tools/usb/usbip/libsrc/usbip_host_driver.c   |  2 ++
>  4 files changed, 37 insertions(+)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
> index 927a151fa9aa..6da000fab26d 100644
> --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
> +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
> @@ -147,6 +147,8 @@ static int usbip_device_driver_open(struct usbip_host_driver *hdriver)
>  struct usbip_host_driver device_driver = {
>  	.edev_list = LIST_HEAD_INIT(device_driver.edev_list),
>  	.udev_subsystem = "udc",
> +	.bus_type = "platform",

I think the "bus type" is changing in newer kernel versions, so be
careful about attempting to hard-code anything like this.  Devices can
move around between bus types just fine, that is not how they should
ever be referenced.

thanks,

greg k-h

