Return-Path: <linux-usb+bounces-38185-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBmiDB5IG2rHAgkAu9opvQ
	(envelope-from <linux-usb+bounces-38185-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 22:27:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9967D61338A
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 22:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02D913027DBD
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 20:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8146E32B120;
	Sat, 30 May 2026 20:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="srshcneM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE170329C6D
	for <linux-usb@vger.kernel.org>; Sat, 30 May 2026 20:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780172827; cv=none; b=TmPV49wlg3DVLSEmybtJqmPQ+e2huSzz+kDqfP2UOhfu/iS5cgi712NAo96UaCmawikkO1yssjI6TjLsR97+wys1vWh0XYQJQWmwQR+atUz2TcQhZCEg3RW3Py/3EPDcITcn+HguVnbVYiFvze6qaYbxObWFrJvMQdxK6J2dQSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780172827; c=relaxed/simple;
	bh=MQ84YnJfJUL1Iw9P1iZUf3xSr53j57KmRKt4WBuA0eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DG0kS8yimofv1UMH4iEcwx7R5ve3610xVzEmmuv4PjhV8ECpJDEVu9LE1LBsALNAuw5OmxaRuASI+kjx3h+Sq6joL/e+iOvr6IfHGxjaSCSGWMSVU4GEX51bsfv/NvkQCAq4b2gfuW7LV3Z/rZOR6Qiv5ImiytXl2vONGdq/3xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=srshcneM; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5174a133bc2so1745011cf.1
        for <linux-usb@vger.kernel.org>; Sat, 30 May 2026 13:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780172825; x=1780777625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gbrpFFkg8XDOuxUTe0OUduOZl7pVpeg+pFVO03blDF8=;
        b=srshcneMwaq5w1hNHyMHfdOavAUAOeVQoAt7mhmbV0VdVxQ3cwRFvr332J6lUN9DhL
         mo9WHte2K7kwzeqIiiuiPVMy252QSkivC23W6rvDOb3AQXDVhmSY8AyrhNMojPcXYGH5
         ntMbwcHbqhLc+rc8rePIVVrsU08DGapo1Z9PXio1jYLBn+UunQ73YZw+9H22T/1u0XzQ
         9XeM7jmMNdPBo5rmADBbbu4UhBM4HYneW6F1NDgGMNDCgKp3CC3Im56I84wwvRJoYYuO
         Nqi+BptQgCRbYCmnsWHQA52A4lVzRSGZ/EtYOybJo73s98iuj+Kmq6YPcKJSvCh/BfJG
         JrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780172825; x=1780777625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbrpFFkg8XDOuxUTe0OUduOZl7pVpeg+pFVO03blDF8=;
        b=D1afK9DTnXLD0i20/GGENA1h+rR4zs+HKAtrX/v0DoOJEVL0A0GWQHqI4f+ppHSWVi
         BLamm0ZAsD+mCROfCeTWVNmzrtvJLsVUkvAwCZ1eu2m1Brqs4ygCK+lgFr82y5wN1rj7
         zEMnIvykrTYO6797+o7pNV8MMZbr2C3GW/C/d0czuoADLzBYpc5QbfULxGhFq1eZgHTm
         MNzGFuey3bemq6yD8+UfsvNIrx/07EkE5wm97CGujPf15o/y7yvulUNagpdqNvQrgfvX
         TtF9uyfK7xXR2gbSrMnujDoMvyGNvL46UHn6KI4o/f+vDQ9ZH2Er9z/mef8oPDaZ6RZD
         ZFBg==
X-Gm-Message-State: AOJu0Yx2LL1puEx7/FKHSt0l6AupnfzGCbf6Wl/dB2Ba/nMQr76C36Or
	RZEY3Tge0pfuEk1kFg7s/4DLOnUQHTtefnqAk9N2DY+aM6HmsqRGjEx5mC3R+DWYKATefIJUfSB
	ySU4=
X-Gm-Gg: Acq92OGdo0IPpty0gWDGDC8TNL0/vFkIkOOYV+GWLKW9PRC5xtV0bpSDjcQB5VeoEGD
	BGCBrLcr7zyZOFQOzaguXQ532B5Yo9/pYMip6DlRGDpoq1t0KlF4C/4TjcG0t+8SB4ODlXKT3hD
	+n2LxhhuBTLsKyfNmxJCJruBVceArtgENWT0HAOjHzOqjdWaU2WO7fWumQY5VApxTRSHYEzqT+h
	rUwUmhiXfGUYQqBtgLXGXC8PfAvFsmqiE/XGKsfPibAWRcoe9zlizN/JxgLBq2BAKxyfw5GJgW0
	SNJc6ZWiPPZxW97TLUhmi1t1QxpP0yOvIcT9Bot0z+eMeSxTgG8ostBLIpYSIFZ4/yRuuwORbyo
	VxtjuTB+Teo+A+SeRuX+gyU7Rs0chIHEibLz6K/71elMZj+0TErxLf1d3kh6eBfmvECCGLIQF58
	jkGPjhohPYzn1U+XWk7TUwOzPARTogqCTKPr1U30DTHvbdFmTeynBB9w==
X-Received: by 2002:a05:620a:4487:b0:911:de69:ee21 with SMTP id af79cd13be357-9153d9c23a9mr748203685a.11.1780172824709;
        Sat, 30 May 2026 13:27:04 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915326296fesm556564185a.38.2026.05.30.13.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 13:27:03 -0700 (PDT)
Date: Sat, 30 May 2026 16:26:55 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	mathias.nyman@linux.intel.com, sakari.ailus@linux.intel.com,
	katieeliu@tencent.com, johannes.bruederl@gmail.com, kees@kernel.org,
	dengjie03@kylinos.cn, limiao@kylinos.cn, wse@tuxedocomputers.com,
	dev@a1rm4x.com, vahnenko2003@gmail.com, cs@tuxedo.de,
	lijiayi@kylinos.cn, oneukum@suse.com, bence98@sch.bme.hu,
	eeodqql09@gmail.com
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
Message-ID: <242c4d8d-fec8-4693-9c17-91d763f68985@rowland.harvard.edu>
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
 <351656ab-a188-444d-a09b-cf304796043b@rowland.harvard.edu>
 <CAFgddhKPYFKNDDESxvo4jwBCw=mnWWx7Jsmr9_LwawtUpkx8Fw@mail.gmail.com>
 <2a656f5a-bc8f-458a-a1bb-e66cc3a122b8@rowland.harvard.edu>
 <CAFgddh+6O+pnbrw1szM7_Q3Xkx8423qRptW=Yhf3UbBZNu0ZWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgddh+6O+pnbrw1szM7_Q3Xkx8423qRptW=Yhf3UbBZNu0ZWg@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,linux.intel.com,tencent.com,gmail.com,kernel.org,kylinos.cn,tuxedocomputers.com,a1rm4x.com,tuxedo.de,suse.com,sch.bme.hu];
	TAGGED_FROM(0.00)[bounces-38185-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9967D61338A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 10:18:58PM +0530, Nikhil Solanke wrote:
> > Actually what happens is the device disconnects from the USB bus without
> > responding at all.
> 
> Just being curious here, but wouldn't i see a packet from the usb root
> hub / usb host controller notifying of that?.

Yes, you would.  And in fact the usbmon trace (unpatched Linux) contains 
just such packets:

ffff8891748cb380 0.559834 C Ii:3:001:1 0:2048 1 = 02

That is from the root hub saying that there was a status change on port 1.

ffff88929fcaec00 0.628744 S Ci:3:001:0 s a3 00 0000 0001 0004 4 <
ffff88929fcaec00 0.628769 C Ci:3:001:0 0 4 = 00011100

Those are a request to the root hub asking for the port status on port 1 
and a response saying that there was a connect-status change as well as 
no current connection.

>  or even a dmesg log
> saying the device disconnected?

Disconnect messages aren't logged until a device has been fully 
enumerated.  However, there should have been messages in the log saying 
something like "unable to read config index 1 descriptor start: -71" and 
"can't read configurations, error -71".

> Because that doesn't happen at all as
> the kernel tries the request 3 times before completely giving up. If
> the device disconnected, only one configuration request would've been
> sent and the enumeration would have started again from start, wouldn't
> it?

The code that gets the disconnect information from the root hub doesn't 
run until after the code that attempts three times to read the 
configuration descriptor.

And besides, the enumeration did start again from the beginning; you 
said so yourself earlier.  But when it did, the device presented itself 
using its Android mode information.

> > Again, you may be misinpreting the meaning of those values. But it doesn't matter.
> 
> Yeah, I kind of figured that, but mentioned it nonetheless just in
> case. Windows mentions the packet data length for the setup data size
> it sends, and it checks out (i counted the bytes). However, the Linux
> behavior confused me. Like I said earlier, the URB length is basically
> the same as what we request as wLength in setup data. Nothing else in
> the whole packet matches that size. So i was a bit confused and felt
> to mention it.

In the Linux usbmon trace, the URB length is the amount of data meant to 
be (when an URB is submitted) or actually (when an URB completes) sent 
to/from the device.  This does not include the information in a Setup 
packet but only the data bytes; it matches the wLength value, as you 
observed.  Windows may behave differently.

> > You should try setting the USB_QUIRK_DEVICE_QUALIFIER flag for the
> > device.  If that doesn't fix the problem, collect and post another
> > usbmon trace showing what happens.  If it does fix the problem, you can
> > submit a patch with this quirk flag instead of adding a new one.
> 
> As I mentioned earlier, I tested it with that specific quirk too. I

Can you post a usbmon trace showing what happens with that quirk?  I 
would like to compare it with the Windows trace you sent earlier.

> also tested the delay init quirk and various others (even paired a few
> of those together). They make no difference at all. The resulting
> packet trace from the USB_QUIRK_DEVICE_QUALIFIER is the same as the
> unpatched behaviour just with no device qualifier requests. Besides,
> if you look at the patched behavior, the DEVICE QUALIFIER requests
> were ignored by the device in that trace too, but it still
> successfully enumerated in the Xbox/Xinput mode. And as per the USB
> spec, if I got it right, full-speed devices should error when
> requested a device qualifier. We can see that happening in the packet
> trace too. The response packet has URB Status set to -ESTALL (-32),
> which can be considered an error. So, it isn't a problem either way
> whether the host requests it or not. The patched/workaround behavior
> isn't affected by it too after all. Quoting the USB spec directly here
> (Section 9.6.2):
> 
> > "If a full-speed only device (with a device descriptor version number equal to 0200H) receives a
> > GetDescriptor() request for a device_qualifier, it must respond with a request error. The host must not make
> > a request for an other_speed_configuration descriptor unless it 
> > first successfully retrieves the
> > device_qualifier descriptor."
> 
> So, to conclude, the device qualifier request isn't the root cause of
> the problem at all.

That's right; the root cause seems to be a bug in the device's firmware.  
But perhaps that bug is triggered when the device receives a 
Get-Device-Qualifier request.  That's the only theory I was able to 
think of which could explain the behavior in the Windows trace.

Alan Stern

