Return-Path: <linux-usb+bounces-38186-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHg8E/pMG2r1AgkAu9opvQ
	(envelope-from <linux-usb+bounces-38186-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 22:47:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E26296134FC
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 22:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A49963015843
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 20:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9618344DAB;
	Sat, 30 May 2026 20:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQpeXyQU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37E1221D89
	for <linux-usb@vger.kernel.org>; Sat, 30 May 2026 20:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780174069; cv=pass; b=ojUbTd27bjcpMuEWGqD373UcGCqnSwVhJtpwnnLC3KImB2uALEgexIXatL9PaCOBMTwzXRIN8y+ixwnRd6UM0IQTPBqhc1zPerxwQIeA2qHLrDqOGdS0OlvIPYtBNl9rs/7NCThM3/jzcwiQwrsx74PjYwCmp4WOE/fCDNbh2uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780174069; c=relaxed/simple;
	bh=+LzmWNuEL6Uq+iuUQ41kCvOPJ+aeiJWXTF2qs7QvuEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUL/2VZayQMLzmXaCCjx4q2uS1JvU6/dgvGsvY3cWC8HeBQd1L7Alhz/NlfSReAWF+DcU6BlnMXxaEL3vqPQPwxCXAePPe3nrv2X0TpHSVTXl+Z5IKsd8Y1Mapv1fZzQd3sLP/z49Op1dBYE/6t4f57VDw3J684Elc3+hXtG2Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQpeXyQU; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bebbc325000so46199066b.0
        for <linux-usb@vger.kernel.org>; Sat, 30 May 2026 13:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780174066; cv=none;
        d=google.com; s=arc-20240605;
        b=eHmBCQFz9q2J4HFm1krKSDmys78ky6MMnQpHevatvhSyLE43pBAhvEl1WF/T+cGTZV
         0s4uxXRrYmav9UdxdJIN6mXUVBEl4iUmwEJhlEHpqUHOurlx08k6iGNslqHdhHtNcz9g
         O53BPUdAAO3kMnG8Wrq+SWg/u8A+W8v/ulovtd3k/Wet7PqjptHXttiTEjL3MTZfJJ54
         FZHsTag3gcv/WBfY4WrJ3whed/nm2sU/+7DfyFP4NT5E2lalN/KHSm/bMVFEI3ub+kKz
         bALHspVG0R/cefKNx9bx81l22uGPaKUu4c6Px13eKU9w/YQVcHcTJHYJnw5saje5VEoV
         nw1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yABnK6iu9juwDzjlXKJp7J/Tt7fNdPmo82gntZXvv6I=;
        fh=ImnvTmhUCDzFDWuafngDjfFHiGXMCZD9NBo4B/fG3f4=;
        b=BlSeJ360txyLy/+dluvCsIimeGrPjEtbazYBCl0BOcU6D69jgoCGaeGfztMWrSwTUV
         0Ixr9wn+EI9a3CZ4u7GKV89dq24es2UemJ3clBISzMi4THnmdZH2I6cqPBSyknHzSNS1
         DXJ57O9FF+sW/fv8wmf+pmT1uvmiYlOcksepHVawK3DnsGgFGGL97v3NM2welKambG8r
         RopnH1XO73M1NXXHFn/fHBjgwDXALsFqRievo34kgnr0D26rU/4tRXre5ABfUoCS7dPE
         zOmc3eomroKYyg9cLLYDanI4Iz+LdlTQ5gemMcLaKsGRrj2I6ZKQiV07W6nUwx5wuQK7
         s11A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780174066; x=1780778866; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yABnK6iu9juwDzjlXKJp7J/Tt7fNdPmo82gntZXvv6I=;
        b=OQpeXyQUTyLuwLIIbb4be/+5/c93pXm9K4kLIbWQtFPzIf5pIZ1x2qGxSEci/m2YYL
         XcXmED/YCU6YZIIuV/cABJ9/1NbreH79VDuRLGr+TnGAojQy11kCwe/79k2NnlS7iyL3
         bkf/NoQQQSByIFtCWfenIcahstVyb0H7lXHXi5YjQpgyfXHL+D9v0Y7JcneF4TH1MHBT
         wSnjRY/hTVUHoGsh36I88cQ4tOQGZJDEeZT4fQiTl+eiOVwR/mY6sGEmo6dTdl4h7NTU
         wm8pdfGpewKgLYA8TbcF/g5JYOJgBC+oR+xlrMN6K4ET2wKdiZshMWCdxFUvq1Map7eX
         u9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780174066; x=1780778866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yABnK6iu9juwDzjlXKJp7J/Tt7fNdPmo82gntZXvv6I=;
        b=Ee4YKSWfKNyozTQzmZ13XwsJ7l7V4XKp18yD2WconKAq9TSUWRlCr7cv9qmubw1TMO
         Oc9KUpAovkpAVAOYBiZoHrwVC+ECTYUQ9FPicnxyzGafrI+bJ/G5EEPJ2wuBuc5dmRUx
         ao++yr6KxfipYsLP1/icdqN3pwYupWIH7wwk9gNVd+g+3JCIUhcBp+0NHNd9J59gkDCJ
         Hr4Us3m2vPN5e8yH9/zAO3w+ERPdKv593peRjbUf1dgbXIb0eqwSAhaVHpQflN2dO/UO
         akX47J6b4/SZe5c4mlkzntaApXEQDMW8ZQj+Qqmnd4wJ/PO9L/V5qZ7tgklPBudQbMdm
         fC5A==
X-Gm-Message-State: AOJu0YxLSOaa3yfthjbo3D041p07buogRd60jAG2228onNXbSg6Lf+2+
	OyyoV27GxqvfrZJremvzGmFks4cInVjabDwPCJ5ZLkxYaqmw/jQSi4j/h0AjJCIOtwrN99/n5l1
	gVHsMMbJPfQZx3M+HZe582yGQAqtskjE=
X-Gm-Gg: Acq92OEtPzORdrhpfP1p1Gt2+OnyiR0jxeNwxI5oLH/om+/wHj9RznLPCxX9hv1VlMO
	D+3Nb0mT4pbb5P3z/fR6D4d+jJmbUkZSdBseXwQU1wNxXG7RgMDEAZR6/jEX1ALU1U7Z8aBL/wH
	cyzQ9hHgkyLtP880zqRWczxRLNuPCMVQRnD44Ar+5tx/bS+M8pTyuLZl3WJSRmAcSP/6PPTWoJ2
	ZgI39rCkjojKUKYpvFxMmTwGDzpUlyMZWewKrjNYRGrXYPcDIWDMUabCU25gUNGr/SoSO+97UsP
	ahNEl/cYGrBXho84riFI4x1JyyxO
X-Received: by 2002:a17:907:6c0f:b0:be2:27e2:d7a2 with SMTP id
 a640c23a62f3a-beab4f1fc5emr246457666b.25.1780174065858; Sat, 30 May 2026
 13:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
 <351656ab-a188-444d-a09b-cf304796043b@rowland.harvard.edu>
 <CAFgddhKPYFKNDDESxvo4jwBCw=mnWWx7Jsmr9_LwawtUpkx8Fw@mail.gmail.com>
 <2a656f5a-bc8f-458a-a1bb-e66cc3a122b8@rowland.harvard.edu>
 <CAFgddh+6O+pnbrw1szM7_Q3Xkx8423qRptW=Yhf3UbBZNu0ZWg@mail.gmail.com> <242c4d8d-fec8-4693-9c17-91d763f68985@rowland.harvard.edu>
In-Reply-To: <242c4d8d-fec8-4693-9c17-91d763f68985@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Sun, 31 May 2026 02:17:32 +0530
X-Gm-Features: AVHnY4LtnfQYMfJV2VaBpfL3Xi9R4C4bOaBEUgeH0xCNkDDtrmVa02SNdz97xKY
Message-ID: <CAFgddh+3Ksi7aj=ZNdn0qum8zQ=d_HM=hVtoH224rEpfhamsXA@mail.gmail.com>
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	mathias.nyman@linux.intel.com, sakari.ailus@linux.intel.com, 
	katieeliu@tencent.com, johannes.bruederl@gmail.com, kees@kernel.org, 
	dengjie03@kylinos.cn, limiao@kylinos.cn, wse@tuxedocomputers.com, 
	dev@a1rm4x.com, vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn, 
	oneukum@suse.com, bence98@sch.bme.hu, eeodqql09@gmail.com
Content-Type: multipart/mixed; boundary="000000000000d5cf3a06530f1210"
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	MIME_UNKNOWN(0.10)[application/x-pcapng];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38186-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,linux.intel.com,tencent.com,gmail.com,kernel.org,kylinos.cn,tuxedocomputers.com,a1rm4x.com,tuxedo.de,suse.com,sch.bme.hu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikhilsolanke5@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,harvard.edu:email]
X-Rspamd-Queue-Id: E26296134FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--000000000000d5cf3a06530f1210
Content-Type: text/plain; charset="UTF-8"

> However, there should have been messages in the log saying
> something like "unable to read config index 1 descriptor start: -71" and
> "can't read configurations, error -71".

yep there is. I did mentioned in one of my replies. It does say:
unable to read config index 0 descriptor/start: -71

Attaching the packet trace with the USB_QUIRK_DEVICE_QUALIFIER quirk set.

Nikhil Solanke

On Sun, 31 May 2026 at 01:57, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Sat, May 30, 2026 at 10:18:58PM +0530, Nikhil Solanke wrote:
> > > Actually what happens is the device disconnects from the USB bus without
> > > responding at all.
> >
> > Just being curious here, but wouldn't i see a packet from the usb root
> > hub / usb host controller notifying of that?.
>
> Yes, you would.  And in fact the usbmon trace (unpatched Linux) contains
> just such packets:
>
> ffff8891748cb380 0.559834 C Ii:3:001:1 0:2048 1 = 02
>
> That is from the root hub saying that there was a status change on port 1.
>
> ffff88929fcaec00 0.628744 S Ci:3:001:0 s a3 00 0000 0001 0004 4 <
> ffff88929fcaec00 0.628769 C Ci:3:001:0 0 4 = 00011100
>
> Those are a request to the root hub asking for the port status on port 1
> and a response saying that there was a connect-status change as well as
> no current connection.
>
> >  or even a dmesg log
> > saying the device disconnected?
>
> Disconnect messages aren't logged until a device has been fully
> enumerated.  However, there should have been messages in the log saying
> something like "unable to read config index 1 descriptor start: -71" and
> "can't read configurations, error -71".
>
> > Because that doesn't happen at all as
> > the kernel tries the request 3 times before completely giving up. If
> > the device disconnected, only one configuration request would've been
> > sent and the enumeration would have started again from start, wouldn't
> > it?
>
> The code that gets the disconnect information from the root hub doesn't
> run until after the code that attempts three times to read the
> configuration descriptor.
>
> And besides, the enumeration did start again from the beginning; you
> said so yourself earlier.  But when it did, the device presented itself
> using its Android mode information.
>
> > > Again, you may be misinpreting the meaning of those values. But it doesn't matter.
> >
> > Yeah, I kind of figured that, but mentioned it nonetheless just in
> > case. Windows mentions the packet data length for the setup data size
> > it sends, and it checks out (i counted the bytes). However, the Linux
> > behavior confused me. Like I said earlier, the URB length is basically
> > the same as what we request as wLength in setup data. Nothing else in
> > the whole packet matches that size. So i was a bit confused and felt
> > to mention it.
>
> In the Linux usbmon trace, the URB length is the amount of data meant to
> be (when an URB is submitted) or actually (when an URB completes) sent
> to/from the device.  This does not include the information in a Setup
> packet but only the data bytes; it matches the wLength value, as you
> observed.  Windows may behave differently.
>
> > > You should try setting the USB_QUIRK_DEVICE_QUALIFIER flag for the
> > > device.  If that doesn't fix the problem, collect and post another
> > > usbmon trace showing what happens.  If it does fix the problem, you can
> > > submit a patch with this quirk flag instead of adding a new one.
> >
> > As I mentioned earlier, I tested it with that specific quirk too. I
>
> Can you post a usbmon trace showing what happens with that quirk?  I
> would like to compare it with the Windows trace you sent earlier.
>
> > also tested the delay init quirk and various others (even paired a few
> > of those together). They make no difference at all. The resulting
> > packet trace from the USB_QUIRK_DEVICE_QUALIFIER is the same as the
> > unpatched behaviour just with no device qualifier requests. Besides,
> > if you look at the patched behavior, the DEVICE QUALIFIER requests
> > were ignored by the device in that trace too, but it still
> > successfully enumerated in the Xbox/Xinput mode. And as per the USB
> > spec, if I got it right, full-speed devices should error when
> > requested a device qualifier. We can see that happening in the packet
> > trace too. The response packet has URB Status set to -ESTALL (-32),
> > which can be considered an error. So, it isn't a problem either way
> > whether the host requests it or not. The patched/workaround behavior
> > isn't affected by it too after all. Quoting the USB spec directly here
> > (Section 9.6.2):
> >
> > > "If a full-speed only device (with a device descriptor version number equal to 0200H) receives a
> > > GetDescriptor() request for a device_qualifier, it must respond with a request error. The host must not make
> > > a request for an other_speed_configuration descriptor unless it
> > > first successfully retrieves the
> > > device_qualifier descriptor."
> >
> > So, to conclude, the device qualifier request isn't the root cause of
> > the problem at all.
>
> That's right; the root cause seems to be a bug in the device's firmware.
> But perhaps that bug is triggered when the device receives a
> Get-Device-Qualifier request.  That's the only theory I was able to
> think of which could explain the behavior in the Windows trace.
>
> Alan Stern

--000000000000d5cf3a06530f1210
Content-Type: application/x-pcapng; 
	name="controller_linux_no_qualifier.pcapng"
Content-Disposition: attachment; 
	filename="controller_linux_no_qualifier.pcapng"
Content-Transfer-Encoding: base64
Content-ID: <f_mpstk9rl0>
X-Attachment-Id: f_mpstk9rl0

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
AAUACAAAAAAAAAAAAAAAAABsAAAA
--000000000000d5cf3a06530f1210--

