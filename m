Return-Path: <linux-usb+bounces-33704-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF4QAT0Un2nWYwQAu9opvQ
	(envelope-from <linux-usb+bounces-33704-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 16:24:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9449B1998E4
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 16:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 91A8E3080BA3
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 15:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9908D3AE703;
	Wed, 25 Feb 2026 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="QjQnBsJW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0948296BCB
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 15:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032669; cv=none; b=SrlCdccAylKHxJNfBI2QjzZRxuLjWhv4aKWZDcOtAzbWNMDbQIQeZqtCk5MnTB4hVWFv1moOQFSSRGbHyk7C5ss+r+A/qUMqaCCUkZoyFkbH/Ka5a6yIayMmOjMhUOO3B3hPcefu4p9xfvVAuPiyftgFDii2e0AXhgZd4hE3MYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032669; c=relaxed/simple;
	bh=fa5Nh4Bii5T8OWE8qdfpKY5+a5tl95xEVLmEJQIMRXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5WS7PP1ckO+evP2AqRzfad0f8RpFUOAJAzG5AIgyR9cPXNQHXj7I+IpUzW2aMqiikBuI9v6dpWoNHkje/ucE3bc+hYD3Z9TYR/R14/k7iuvgGqNsHsKMzn1XK6S0Qitr63lF3Fcqp29I5TTIX5Rco7lYQ4AMvVsYfqo7wbO/vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=QjQnBsJW; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-897002b7576so91710836d6.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 07:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772032667; x=1772637467; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V7HWUIXt1rQNBWR5hmOyyD7RPaY3LCxJr4Clt2GgSzc=;
        b=QjQnBsJW0paPqUBgZnJhYmbnSO6GFENc0B239AvHrgr/I2MCQHTo+sZA+9RUjbP9WV
         EgCH1Xkfzmv2el9z3ZF8VMLTJmrQpKvb1v+OrinmvJrXdvfoVMIqBTiYO/1gNXITDz39
         41oCnxoQhKUikSEKXW0z1wORc73Bt+LtIHpu04AWEmvxwpshBLTcpyeOnLAC8EoiO1IH
         McpOHxQhALwu0a7bOyoX8/qy0qw0P8kFeB1T09CxHAWzTpzFbGHjWLXq9gL4FcxDQbup
         NdVnFwfI0HG8G60C5ZEG6qA/0vOOvSZw/MXiAlQ+N2qDGrCIgmHrIO02gAn890sHsqpU
         8AKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032667; x=1772637467;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7HWUIXt1rQNBWR5hmOyyD7RPaY3LCxJr4Clt2GgSzc=;
        b=Vo42q84dPmnKS10iwJi25P08rws7O74zwP+Y/iw3zEhWevw+/i3QWoA/BWDcM9WEBy
         iiR1QSPq2ciHmlqEZprFGztYuj4isPKuug5IzNYv5DjhIBzRXxl6Y0A/PWPJaSZ7m0wB
         UPXgz1nnslZKjkWWUarIDE9whFrxDbbySSYGOXXCYn7+jzx2PYTkk06+0R7GU6a/ATy1
         GIqQw7TOIQg2L5k+GQn6RCUqO1r/Zs3mGBMNayfAv8UuVyanK3OPldJQJE3pHOs+3ILb
         t8oSVEaJrH7KRYUkQgym1JdRBTwiEPJpV8O7q9siFWcqm+b01nv0hSgk1k56xLFxU4Cu
         A5Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWgmAIPfnun0a2d6w2XAPbkA3JkUvC1ndBoutc6WOQmtZeYy/fiXpbHhJVmxMOqMJYv3Fy1x/cbx9o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw04g0t9LTAU9rY58ztggiR99Q7fWDy6HSAtlBqQt6yuckA4i02
	mxy9cLG6uesmUidlESlESv5QHfqyWnRKdJUXUbOUlIkrH1KrDgbRmDGEltTi/Om8Lw==
X-Gm-Gg: ATEYQzy4Hm/+u9RqlyN0Y9gSCMweHXDn+5d+VowtfCH6IBLXx/KMyzm9HK8zZVQoiAK
	B/glsOdVZqi+cLh3FwFBkpxIGMqCTxQX2S6GpWrACARBJtb2mdr+pga4frg9M7R0HU6VniQFyDr
	8VBznDXkBKWrR93vtIRIo8jxNgON9IbHWoJxBwMXrGFVo4lZgQApQzsHqvLAG5OzZO5pnmOY5rL
	OB4NWY5alxPz+rb396oKC+eB8jS91GrNhj3yBKBOeT10b7/pmrQulLisElzAVI1Pttipbg1KHw4
	RSuW4OgvKiiwNAePOdYPG0oNPkWilt1EnvCiulYbdSyQ5DWDMnNktGaRZ8ydZcm4YNAOhhcNZPG
	9kWx1Ax9nhjTtvhXOm87dwvsozsHBV8JneopGHYqpCxRLWRY7Zfp7uscZpegbIhdkMtT1wj/AtH
	XmUPl+1LrdiM5mGdRyryP7BtZslAhGwlf8AGvErFxkeg==
X-Received: by 2002:a05:6214:1251:b0:896:f910:c906 with SMTP id 6a1803df08f44-89979dad256mr225993136d6.66.1772032666317;
        Wed, 25 Feb 2026 07:17:46 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997c691243sm121256936d6.3.2026.02.25.07.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:17:45 -0800 (PST)
Date: Wed, 25 Feb 2026 10:17:43 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>, gregkh@linuxfoundation.org,
	m.grzeschik@pengutronix.de, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: port: add delay after usb_hub_set_port_power()
Message-ID: <d59d063d-4116-4a5c-a29e-6527aa4eadd2@rowland.harvard.edu>
References: <20260224031909.3546487-1-xu.yang_2@nxp.com>
 <CAOMZO5Br6uEJ5ffq4JCary5p3Di+bF4MDmUtOEdDqpU6xs6VJA@mail.gmail.com>
 <2r3pvujs6vdl5si5rnplgnezw4nllyunshipetvztowkngkv3h@glsewrhncjvl>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2r3pvujs6vdl5si5rnplgnezw4nllyunshipetvztowkngkv3h@glsewrhncjvl>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,pengutronix.de,vger.kernel.org,lists.linux.dev,nxp.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33704-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 9449B1998E4
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 03:40:15PM +0800, Xu Yang wrote:
> Hi Fabio,
> 
> On Tue, Feb 24, 2026 at 09:19:51AM -0300, Fabio Estevam wrote:
> > Hi Xu Yang,
> > 
> > On Tue, Feb 24, 2026 at 12:17 AM Xu Yang <xu.yang_2@nxp.com> wrote:
> > >
> > > When a port is disabled, an attached device will be disconnected.  This
> > > causes a port-status-change event, which will race with hub autosuspend
> > > (if the disabled port was the only connected port on its hub), causing
> > > an immediate resume and a second autosuspend.  Both of these can be
> > > avoided by adding a short delay after the call to
> > > usb_hub_set_port_power().
> > >
> > > Below log shows what is happening:
> > >
> > > $ echo 1 > usb1-port1/disable
> > > [   37.958239] usb 1-1: USB disconnect, device number 2
> > > [   37.964101] usb 1-1: unregistering device
> > > [   37.970070] hub 1-0:1.0: hub_suspend
> > > [   37.971305] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0002
> > > [   37.974412] usb usb1: bus auto-suspend, wakeup 1
> > > [   37.988175] usb usb1: suspend raced with wakeup event         <---
> > > [   37.993947] usb usb1: usb auto-resume
> > > [   37.998401] hub 1-0:1.0: hub_resume
> > > [   38.105688] usb usb1-port1: status 0000, change 0000, 12 Mb/s
> > > [   38.112399] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
> > > [   38.118645] hub 1-0:1.0: hub_suspend
> > > [   38.122963] usb usb1: bus auto-suspend, wakeup 1
> > > [   38.200368] usb usb1: usb wakeup-resume
> > > [   38.204982] usb usb1: usb auto-resume
> > > [   38.209376] hub 1-0:1.0: hub_resume
> > > [   38.213676] usb usb1-port1: status 0101 change 0001
> > > [   38.321552] hub 1-0:1.0: state 7 ports 1 chg 0002 evt 0000
> > > [   38.327978] usb usb1-port1: status 0101, change 0000, 12 Mb/s
> > > [   38.457429] usb 1-1: new high-speed USB device number 3 using ci_hdrc
> > >
> > > Then, port change bit will be fixed to the final state and
> > > usb_clear_port_feature() can correctly clear it after this period. This
> > > will also avoid usb runtime suspend routine to run because
> > > usb_autopm_put_interface() not run yet.
> > >
> > > Fixes: f061f43d7418 ("usb: hub: port: add sysfs entry to switch port power")
> > > Cc: stable@kernel.org
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > On an imx6x-sdb board, I still get the inconsistency below even after
> > applying your patch:
> > 
> > # echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
> > [   20.656414] usb 1-1: USB disconnect, device number 2
> > 
> > # echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
> > [   28.263516] usb 1-1: new high-speed USB device number 3 using ci_hdrc
> > [   28.466813] usb 1-1: New USB device found, idVendor=0457,
> > idProduct=0151, bcdDevice= 1.00
> > [   28.466949] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> > [   28.467039] usb 1-1: Product: USB Mass Storage Device
> > [   28.467086] usb 1-1: Manufacturer: USBest Technology
> > [   28.467126] usb 1-1: SerialNumber: 000000000003FF
> > [   28.501826] usb-storage 1-1:1.0: USB Mass Storage device detected
> > [   28.510452] usb-storage 1-1:1.0: Quirks match for vid 0457 pid 0151: 80
> > [   28.517597] scsi host0: usb-storage 1-1:1.0
> > [   28.524066] usb 1-1: USB disconnect, device number 3
> 
> It's another different problem.
> 
> For ports which VBUS are not controlled by PORTSC.PP (always on VBUS
> regulator or Type-C controlled VBUS), they are still powered on after
> you disable the ports. This will cause PORTSC.CCS still be set after it.

That is arguably a hardware bug.  According to section 11.5.1.2 of the 
USB-2 spec, when a port is in the powered-off state its transmitters and 
receivers are disabled.  This implies that it is unable to tell whether 
a device is connected, so PORTSC.CCS should be clear.

> When usb_autopm_get_interface() gets called, hub_resume will check CCS
> bit and check new connection again. So you see new device is reported.
> 
> Below patch will be a workaround for the issue when you disable the port
> many times:
> https://lore.kernel.org/linux-usb/20260223-v6-16-topic-usb-onboard-dev-v5-1-28d3018a8026@pengutronix.de/
> 
> However, it will still report new device when you "cat usb1-port1/disable".
> To fix the issue completely, I guess the usb core needs some sync with the
> port disabled state. 

Another patch on top of the one you mentioned should be straigtforward.  
Feel like writing one?  All it has to do is make the hub driver skip 
handling connect-status changes for disabled ports.

Alan Stern

