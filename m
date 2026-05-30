Return-Path: <linux-usb+bounces-38182-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECdvLBMVG2pV/AgAu9opvQ
	(envelope-from <linux-usb+bounces-38182-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 18:49:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A337760E723
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 18:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93D9430055E1
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 16:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12CCE332EA7;
	Sat, 30 May 2026 16:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4URh5BR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1611C1E260C
	for <linux-usb@vger.kernel.org>; Sat, 30 May 2026 16:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780159754; cv=pass; b=lLdVCmdRNu0moL8Fb0LGZXTISl9n7GM7/xM3CVLvCCrI2cqxNYxumTRpW7A3vr4/sRdQjdp+CTo7UiIx71Ea7g9Q6synI9fgIasuotNcM3gb2XsvqoTV12dNqRWtsQLY0L+sgX9KUHRTIzadW9zDSaSbNYKxn0PXwLGbsjHtVAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780159754; c=relaxed/simple;
	bh=idd853kKritEA6/jjxHq9gTu5MWFv9lawLHfGhpogBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZryr06ll/tWVugXx3wJu5LlfDLvywJpiv7C7QFnWJDm0tYWr1l5vBD/vYzHo+IM5dMCo7I1pu6YNpPTprFl3MhcQatEcvSNBQ9bEcbap33K9xt22wl29ujPECPE52snMQ8aWQmzHis/ktdmED1A3hIfXEKVk/Ov2pGGxvMVGrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4URh5BR; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bd3d7c29b4dso2139505766b.2
        for <linux-usb@vger.kernel.org>; Sat, 30 May 2026 09:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780159751; cv=none;
        d=google.com; s=arc-20240605;
        b=fQu8twRfwTQvXRHiUOGE7bDpzM67qrgYWV7lp5Zekb8pSpCzLT8klvzHjb8keYWNZg
         gv7OEzpnAYos2TQVnXI8FWRC8cfHBll5gkoAXLp1DYLs469Zawh+uTsAlBHRYV6wHgOi
         w7dozxw2vRTXLoDAVn8sTlxWSP726plR/FISsTGs3+yM0iZDwuV5Kndnepj+Luj/yZH2
         tmyKiRT/v6X4S8MW6PhnTJy2ch+Z2yG+7OqXXRRu+15SW87LJd/l1Enm/2aKdkoyKqS9
         ZWOEBqWV7MwYtOAx45+VR75TzNouxOB1GIXZxx6qYkyIf5Go+ifHa2ClBbCOdClOTkoe
         6Zrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n6gBZfZYlB6EUHBSJEhkVAgXP/wAy7wNcm1u/i7bNT8=;
        fh=ImnvTmhUCDzFDWuafngDjfFHiGXMCZD9NBo4B/fG3f4=;
        b=T4gQUBjS8JvA7YzdIetzqLDicVRJ6NZHrHD9DPq4idttaY4N1H1IS/bN3Xj0ayPTzh
         X1pveqrGChbOMVomXjQRxhg3ikWTDfKS5VNoVF43+6qa3yyJyrYqmP1EjL3e09w5pc7f
         5WGHQFX9KM1lk2b73e3/n1lf4cFY35Sl7HLogwfkCLx9QGL91SSg1sPSax0FAj5WvFx3
         ZWmkGYeoIyNxOgeDznAMFGsq8DBZLKB2kgcssUTguStX2zewku7194ZmY+3ypQa6gCFD
         nFlIfEuGZl6YRf26xlYyMjeQPDxcRm4nsTPx2gIDvbqvwp1BiIvtfYqVLkqxzhceWKYX
         JPug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780159751; x=1780764551; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n6gBZfZYlB6EUHBSJEhkVAgXP/wAy7wNcm1u/i7bNT8=;
        b=P4URh5BR/tdU52usvx7aEbA9AeOCxu5bsz5688R4TXLE+RKolZtsSkTX1QEGYPVkXb
         oNgdtM+KQLbYL7R8EzJ6CR4OZyELcfP+kWAyTxiUznyFHc9IgH4qbmGXYUw+yCVc85Vi
         OnaM7cVXcQA2TeBDJ1DrlAsb5aHqUNmSVYdvcCanP1Omy2XCR8ke67ekS6mA3erqKC9U
         DCZNH15cb1vNN47hw4BLo8pYeYjHOxgwNe6K0gZMq1pWTwOKNdK1nXjt6RCqUj2hcr0e
         Rn6z62YNK6DM2U8RjnNDR3U9CuJLgzlw3nZkwAI35j7ClcdfltFv6dclDnYDJ4Ev2J9M
         3bhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780159751; x=1780764551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6gBZfZYlB6EUHBSJEhkVAgXP/wAy7wNcm1u/i7bNT8=;
        b=VDU2S7iE1DuVWdAMwGpuK0YC1u/rw6/fj3La8bj6+vJDwGTVsfGahr8LSXdEcydGak
         qS1AcomPQXsGhTJsFvL43C0G/6r6scyTHuX7J4OBjob1MZ/pF6JJfHe+s0t3j93jP08d
         ZtZ198E921Cs4kxkU3J4aZ9tupXIuwHeLiU+OwfeyuSUNHxtTaFhzEBNEiM8Ahl7WZi5
         fm6S01+Ie7Ts0GWQXm+u24HQ+NQUzfPbY8+/Zghqqz29BNX08km0pAIOId0hP8uRFIN9
         yHRpGfF1fQBGW53cfw3laF16XgYuhyALEiKyq8bL1+T/XzgfTxi6BOUOPdN70yAJ/9an
         S16w==
X-Gm-Message-State: AOJu0YyyWtK/8rhpRXPje7g7cxbeJ6MSCVGtVxEk/LLOmrEpVwtEDuar
	Bqv7V3L6qoWifjTMY5AMIXypwM2GnJYx7PiMDEIAscLbuUHhPiHSNUSfjRrbWd3fbg9iGeY4DFd
	Z8GwxEVpHr5p3yv0lfFO+wFQk55vHLZ8=
X-Gm-Gg: Acq92OH69u+04VkBMKm+S9Hn7NKR89qat+GGohZcMFlrZRz5q+FpTKIigigKaqVpon5
	1SMQon0UKBhKina6GwqxTyVc/XX56EkM6qvtDCizIVuvyI+l7QfRuS+S9vsQe1xljipqvA3RVp4
	Lr4c8Kc+/D873ggVyu8M9+P4854VAPJNaNjSQ495T+yrFDgjn1JXps32rN/BkuGWLd3fSq4oqd1
	YnbGTjoNvOAgvEQvQ0LaMbWY73YPm0Bg0I/1JqPOaFNpS84sf+dxNBu4qTz+79uZ4mpsrFBzA70
	fj8Sm6PZFo7kfvenfw==
X-Received: by 2002:a17:906:4fd0:b0:bdd:f2e9:37d2 with SMTP id
 a640c23a62f3a-beab71af430mr243353966b.33.1780159751071; Sat, 30 May 2026
 09:49:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
 <351656ab-a188-444d-a09b-cf304796043b@rowland.harvard.edu>
 <CAFgddhKPYFKNDDESxvo4jwBCw=mnWWx7Jsmr9_LwawtUpkx8Fw@mail.gmail.com> <2a656f5a-bc8f-458a-a1bb-e66cc3a122b8@rowland.harvard.edu>
In-Reply-To: <2a656f5a-bc8f-458a-a1bb-e66cc3a122b8@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Sat, 30 May 2026 22:18:58 +0530
X-Gm-Features: AVHnY4Jbj375puF9AGCMm4z6I__1I8irJk1d7qkRkdNRV_z67_fynvCqruxCUMU
Message-ID: <CAFgddh+6O+pnbrw1szM7_Q3Xkx8423qRptW=Yhf3UbBZNu0ZWg@mail.gmail.com>
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	mathias.nyman@linux.intel.com, sakari.ailus@linux.intel.com, 
	katieeliu@tencent.com, johannes.bruederl@gmail.com, kees@kernel.org, 
	dengjie03@kylinos.cn, limiao@kylinos.cn, wse@tuxedocomputers.com, 
	dev@a1rm4x.com, vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn, 
	oneukum@suse.com, bence98@sch.bme.hu, eeodqql09@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38182-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,linux.intel.com,tencent.com,gmail.com,kernel.org,kylinos.cn,tuxedocomputers.com,a1rm4x.com,tuxedo.de,suse.com,sch.bme.hu];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikhilsolanke5@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A337760E723
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Actually what happens is the device disconnects from the USB bus without
> responding at all.

Just being curious here, but wouldn't i see a packet from the usb root
hub / usb host controller notifying of that?. or even a dmesg log
saying the device disconnected? Because that doesn't happen at all as
the kernel tries the request 3 times before completely giving up. If
the device disconnected, only one configuration request would've been
sent and the enumeration would have started again from start, wouldn't
it?

> Again, you may be misinpreting the meaning of those values. But it doesn't matter.

Yeah, I kind of figured that, but mentioned it nonetheless just in
case. Windows mentions the packet data length for the setup data size
it sends, and it checks out (i counted the bytes). However, the Linux
behavior confused me. Like I said earlier, the URB length is basically
the same as what we request as wLength in setup data. Nothing else in
the whole packet matches that size. So i was a bit confused and felt
to mention it.

> You should try setting the USB_QUIRK_DEVICE_QUALIFIER flag for the
> device.  If that doesn't fix the problem, collect and post another
> usbmon trace showing what happens.  If it does fix the problem, you can
> submit a patch with this quirk flag instead of adding a new one.

As I mentioned earlier, I tested it with that specific quirk too. I
also tested the delay init quirk and various others (even paired a few
of those together). They make no difference at all. The resulting
packet trace from the USB_QUIRK_DEVICE_QUALIFIER is the same as the
unpatched behaviour just with no device qualifier requests. Besides,
if you look at the patched behavior, the DEVICE QUALIFIER requests
were ignored by the device in that trace too, but it still
successfully enumerated in the Xbox/Xinput mode. And as per the USB
spec, if I got it right, full-speed devices should error when
requested a device qualifier. We can see that happening in the packet
trace too. The response packet has URB Status set to -ESTALL (-32),
which can be considered an error. So, it isn't a problem either way
whether the host requests it or not. The patched/workaround behavior
isn't affected by it too after all. Quoting the USB spec directly here
(Section 9.6.2):

> "If a full-speed only device (with a device descriptor version number equal to 0200H) receives a
> GetDescriptor() request for a device_qualifier, it must respond with a request error. The host must not make
> a request for an other_speed_configuration descriptor unless it first successfully retrieves the
> device_qualifier descriptor."

So, to conclude, the device qualifier request isn't the root cause of
the problem at all.

Thanks,
Nikhil Solanke

On Sat, 30 May 2026 at 20:18, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Sat, May 30, 2026 at 12:27:13PM +0530, Nikhil Solanke wrote:
> > Thanks for the follow up.
> >
> > > It would be nice to know _how_ the 9-byte request fails.  That is, what is the status code when the request completes?  This information is in the usbmon trace.
> >
> > The device reports failure by responding with a GET DESCRIPTOR
> > Response (not a GET DESCRIPTOR Response CONFIGURATION) that has no
> > descriptor response data and sets URB Status with EPROTO (-71) which
> > the kernel reports as is in dmesg (unable to read config index 0
> > descriptor/start: -71).
>
> Actually what happens is the device disconnects from the USB bus without
> responding at all.  (Probably it does this as part of reinitializing
> with the fallback-mode firmware.)  That's what leads to the -71 errors.
>
> > > Also, what happens under Windows?  Isn't a 9-byte Get-Config-Descriptor request standard in Windows as well as Linux?
> >
> > Yes it is the standard on both platforms and that is what bugged me
> > too. I'll be attaching the packet traces here, but here's a quick
> > observation regarding that:
> > On windows, the usbpcap captures shows that windows sets Packet Data
> > Length in the URB data as 8 but requests wLength of 9 in Setup Data.
>
> The Packet Data Length probably refers to the length of the request, not
> the length of the response.
>
> The difference between the two operating systems is that Linux issues a
> Get-Device-Qualifier-Descriptor request three times (each time the
> device responds with a Halt) before issuing the length-9
> Get-Configuration-Descriptor request.  But Windows does not ask for the
> Device Qualifier descriptor; it just sends the length-9 request for the
> Configuration descriptor directly and the device responds properly.
>
> > Linux on the other hand has URB Length equal to the wLength and Data
> > Length as 0.
>
> Again, you may be misinpreting the meaning of those values.  But it
> doesn't matter.
>
> > Furthermore, the device enumerates perfectly fine in the
> > fallback mode (Android mode) with the 9-byte descriptor request.
> > Further testing also revealed that the xinput mode would fail with
> > broken pipe error if I use an external USB hub. However, all these
> > issues are magically resolved with just a slightly bigger request.
> >
> > I also had tested the device with various other existing quirks as
> > well but none worked. I also tested using the
> > usbcore.old_scheme_first=1 kernel cmdline, which failed as well.
> >
> > > I doubt that anything needs to be instrumented.  If the device doesn't respond properly to a standard request, it's the device's fault.
> >
> > That seems most likely to be the case. However, this behavior is found
> > with other third-party Xbox-compatible controllers as well (i
> > personally tried 2 other controllers that failed the same way). They
> > all fail the enumeration stage in the same way. Wouldn't it be
> > appropriate to introduce a proper fix as a "quirk" in the main line
> > kernel?
>
> You should try setting the USB_QUIRK_DEVICE_QUALIFIER flag for the
> device.  If that doesn't fix the problem, collect and post another
> usbmon trace showing what happens.  If it does fix the problem, you can
> submit a patch with this quirk flag instead of adding a new one.
>
> > Note: i have attached the packet traces, but they are truncated to
> > only show the device communications with the host and any intermediate
> > packets. There were other packets sent and received that communicated
> > with the USB root hub before the device started its enumeration.
> > Should I include those as well?
>
> No, what you did is fine.
>
> Alan Stern

