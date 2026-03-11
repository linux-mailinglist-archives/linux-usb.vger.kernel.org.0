Return-Path: <linux-usb+bounces-34600-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPBZCPKXsWnkDAAAu9opvQ
	(envelope-from <linux-usb+bounces-34600-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 17:27:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C56A1267556
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 17:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FDA53021D11
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE9D363096;
	Wed, 11 Mar 2026 16:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkQXkh67"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0503037106D
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 16:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246445; cv=none; b=ud9p+x1m7nG4bkB0RjYgOypPrkeiQcyp69xmujZe5tBcHNZdZVlIoHAq0AJj6Yw9OnV/HOdh2toTO1iIKkTMc56gTZdSPpdMuvX19d0zm/hOQwftAOcREj/oKe9rggjJXn6znxNhIj30cfippxUE0v1/jqD0+lbBaZ0Ucq+RMlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246445; c=relaxed/simple;
	bh=EnU7CaNkIwUFhTfWBEiVDCVcCFLfPHjoZFzkqbjaQgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQ2FHtUHmasu/aQ06hq+j5JXQN+pqwuuHjkIjsRIbgp1nju054YDiV1VkUQd70bpbXDjd55HwZ8zHI33t5cZbqTOydpsV/zrr8AGdu18ZGJ+7CfEVg1UGJWJ+hy7AfwGwpSv92mfAbwVYrdkQCiIpn6+dSAqgajvanCXXsnqlRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkQXkh67; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4853fd7b59aso179815e9.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 09:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773246442; x=1773851242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ykuNTX9WARes7OQ8thK8bu9wdsPTSrhLs2vPDVOR02Q=;
        b=nkQXkh67YrKaW6y+dW/cdoDXLpXXxM8oUREPguMfQKe0dbt1pT9BxS+D3sJ9MCLeNW
         2qeCH4q1ppPBBQOR1WK3SM95pFtSHeoA5niF6bGtsOKBsfeF8gk47wrXqaSDlJre6Zq7
         3aNux/ermBSy0RgPRD72xEMlAsxlczI6byj7BxgqR6guywADOKfwb4UiTu7fVq19NMIR
         RTtSdS2+oJ2Q6i3zU+BG4qoG4sNvdpipc5z0THcodVGOlpjK4QzZKEcc7aOWIwEJtP31
         d82nzSa7QvS4OHDM4DeDlBcVJYBvJQZPTPthXYO46YgwbzpvgIJMNYbCidfwrU68YZR/
         jSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773246442; x=1773851242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykuNTX9WARes7OQ8thK8bu9wdsPTSrhLs2vPDVOR02Q=;
        b=LkHmy6zzusgSRuhuTM/1Q+NzHtpcC+4or0YO6Oda9++keVKW7UrfXQb3BHSSbLFqru
         dnqNZ4pr0P9+eDs0wSvOpTvdwomfiUKAh56iou2kQvU1IDwKGpZ//Bu21CmF26C3W5P7
         r+ogKqeRiNtxzT5udXhgEPJnWCcnE53JkEwaOQHsGp9BegeQVI1SWAYD0i/denu1O/7A
         s4Sqo62DaSIZOKylTWxbHpwB6+VsE4z+8gUKQkinkNO0UueTXPo/DBIElh1S3BmEXG6s
         THHkRiFyP9rhg+4nj6Ye4hNdvsjfBsiUl6xMBgEtBgi0/7j58DznDMZcTv95CsUQO3YC
         mo6g==
X-Forwarded-Encrypted: i=1; AJvYcCVWej/BEYKMrB4K2DTnk/o6wr7lNIATHcn1gKRzo99S2HRoska3Rht26+w9NG8zPvFyQRvry45mfBY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2bHc6nE6vV5ouS1S5pHY9trQ5V7uxvmhc5HFGw7OxAeLDuqyA
	nRGYrSj6tbqCt7pYDVdYt50eAvkPtHAbNoB7ZQRFGyQrkbDF4jLDL03B
X-Gm-Gg: ATEYQzy1kXutJ7JXxfVF3PXt/fgzmf5e8zcS2/HqVaHDKLH63pN/b6NwjMsyD4ew6Q9
	+lPrX9aHch2VAnLgV13xlre5jx6C719UUxER9U+aSdDUFiq//+S87FfDjP8e7tcQN1qz5agSau4
	cFo0SRWDYN1Xu4gvbRrZP6JoY1RT9lBML+3lNNGz38RSZVTCepy/3SplkdVP8T/N09GHPwQ+MKB
	zJx+BFefxpKPgCkO0jQjJTyyJYfzP5Qips3hjIySugzUii6zafDlQDUD9icFahBX5bAL6EywBY0
	S+ottvVjbPSyNrs+kvGI+JznmSUfKwUZI7BF9MHjVJXKWbFZw0NFQUVS12JzpOuRbgJi1ksJO2g
	uteKhWINIc0aKbv1NfsZccR/SdaqqtTjNOR18ZwoWBlUh+4JJlPVWqjJ6piOGr9a0J08J5V4KMy
	hLc5Q/0qoRHcOnusGRlODC4rNLydBx81E/ekA/qrI=
X-Received: by 2002:a05:600c:1f10:b0:485:419c:4eba with SMTP id 5b1f17b1804b1-4854b0a5471mr60344935e9.1.1773246442177;
        Wed, 11 Mar 2026 09:27:22 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0fe6cfsm21409105e9.31.2026.03.11.09.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:27:21 -0700 (PDT)
Date: Wed, 11 Mar 2026 17:27:20 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] gpib: lpvo_usb: fix unintended binding of FTDI
 8U232AM devices
Message-ID: <abGX6OAfNpu_o-8E@egonzo>
References: <20260305151729.10501-1-johan@kernel.org>
 <20260305151729.10501-2-johan@kernel.org>
 <2026031131-abdominal-surgery-9b98@gregkh>
 <abGKMhiPRS3wDLqn@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abGKMhiPRS3wDLqn@hovoldconsulting.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34600-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpenkler@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C56A1267556
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 04:28:50PM +0100, Johan Hovold wrote:
> On Wed, Mar 11, 2026 at 03:21:52PM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Mar 05, 2026 at 04:17:28PM +0100, Johan Hovold wrote:
> > > The LPVO USB GPIB adapter apparently uses an FTDI 8U232AM with the
> > > default PID, but this device id is already handled by the ftdi_sio
> > > serial driver.
> > > 
> > > Stop binding to the default PID to avoid breaking existing setups with
> > > FTDI 8U232AM.
> > > 
> > > Anyone using this driver should blacklist the ftdi_sio driver and add
> > > the device id manually through sysfs (e.g. using udev rules).
> 
> > > @@ -38,8 +38,10 @@ MODULE_DESCRIPTION("GPIB driver for LPVO usb devices");
> > >  /*
> > >   * Table of devices that work with this driver.
> > >   *
> > > - * Currently, only one device is known to be used in the
> > > - * lpvo_usb_gpib adapter (FTDI 0403:6001).
> > > + * Currently, only one device is known to be used in the lpvo_usb_gpib
> > > + * adapter (FTDI 0403:6001) but as this device id is already handled by the
> > > + * ftdi_sio USB serial driver the LPVO driver must not bind to it by default.
> > > + *
> > >   * If your adapter uses a different chip, insert a line
> > >   * in the following table with proper <Vendor-id>, <Product-id>.
> > >   *
> > > @@ -50,7 +52,6 @@ MODULE_DESCRIPTION("GPIB driver for LPVO usb devices");
> > >   */
> > >  
> > >  static const struct usb_device_id skel_table[] = {
> > > -	{ USB_DEVICE(0x0403, 0x6001) },
> > 
> > With this change, the driver now "does nothing".  Should we just mark it
> > as CONFIG_BROKEN as well?
> 
> That would prevent people with this device from using the driver by
> manually adding the device id through sysfs.
> 
> Some FTDI devices can be programmed with product specific PIDs, but not
> sure about 8U232AM. Or if whoever built this is still around to care
> enough.

We are testing udev rules to bind the driver in sysfs for the lpvo_usb_gpib
driver for inclusion in the user space package. Removing the binding for this
driver is the right thing to do. Belatedly:

Acked-by: Dave Penkler <dpenkler@gmail.com>

> 
> When I saw the skeleton driver included verbatim, including the
> example minor number (which has been reserved for something else, but I
> guess that's less of an issue these days), and that it was binding to
> the default FTDI PID, my initial thought was just to drop the driver (or
> move it back to staging, but then we'd still need to drop the device
> id).
> 
> Johan

