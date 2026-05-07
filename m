Return-Path: <linux-usb+bounces-37107-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAL6Bp0B/Wk+WgAAu9opvQ
	(envelope-from <linux-usb+bounces-37107-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 23:18:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E59A4EF2E2
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 23:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0741303132D
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 21:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3366C314A86;
	Thu,  7 May 2026 21:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="RjsftbBN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38441280A56
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 21:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778188606; cv=pass; b=C4LxZ+8HSEGBBCdSpG+rdzKc3F2z8zpNSidYyc7Hw7XosXAUP2eCBIBkW/8cDLPPirCqNNcJNs2Ju/X6wAuBN+COdZ66mSqoded2VGOuNYaYc7/WlYmAAMId3aUbnL1VfUC/NZ0VKxExvvdG9N3G/FnzUi3nktQIRWEayyCL0ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778188606; c=relaxed/simple;
	bh=BTSUVNzA5DAZu8xgALok8L3JUX4u/1IXHtYRCqw0F+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5cXxbuTS7v/s4RMWnS3Hxn88k86vWp/VaOP2TIVoD5mfnr4Yny1cj45QWV2OVJpdQNmPxTAQF8THCPaTJJLMRNCGXg/bGQmlfVDNDHwIz8cBi4Ys06rdyyUR60njIiYsn3YdMrPFXO00GUnKUEBOMGBu8GYxnYmEGjWMYyzVb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=RjsftbBN; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67da63ae541so2219811a12.0
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 14:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778188604; cv=none;
        d=google.com; s=arc-20240605;
        b=NG5Ix97XtiUDA9+GRGhcSXEGngAo1uBsMGfij6zH3nUwpPSZgXP+FhwiRQe//M6ftw
         aVyC9aDBkkaFQSm2eUYLzYNdWZcnbDklcEQls5jKv9w5q9MVCUrbVZEXvMZGEGgvxNET
         RPqbJ4Xmvvl2bRwWqY5q0WKUYIEstsjZolXYNa5bmYQyuFVW/erCrSzSdMj+169KTjFw
         BbvVYtKy2Nda5WXjNSKgscNDlyXr78o4liMnDor3379aeFI1R7E/kDSNRl+9Mf8nwzMs
         XMGXwYyavbbR4hkA+zWiLx66eY4XqtPpjwiXsZVr5nb5+tmCU4DU+HNeGP7CE9+gvS8H
         VrYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=geLxPWaT+kA4bOZyxYtJ1TgekKd3T20XfdyTAVXn33U=;
        fh=IwtSbyP7ybH5gNb4Jqk0PuWQKJHgDCfCsLL/kZKlpUI=;
        b=Pke8B1LBzlO4qaZmP6Komh1lDSKt0SmXyNqcvqV+MRLnmEs+M4xXHwJIXOV7NQOVgn
         CAOLZUWxHr2gEviXijmoVt74sNxz4OP5/VIsoqGl2wGVh8pRrIChDgyuRbzh2hJc5X4P
         LJHV1Emx4buwKvoKWaivbYdfhOpXnn2dEs8jfpR9SVv2m6dEa/dm3Zs9MBhUc7a4NbfO
         lA3bBF/gSGdTKZTVUaXcicSOeNPLX/UqE8snTwEe5xol42ZShvH74b3V7fordwZCm0p7
         RQzGBg6iRhFiATCz/3WeTtzsAKDG7Bwh/g+nXUl8SNVh3O0r45IyDnr7nf/db7bOFSpb
         MKDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1778188604; x=1778793404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=geLxPWaT+kA4bOZyxYtJ1TgekKd3T20XfdyTAVXn33U=;
        b=RjsftbBNsd51qUXOjsrWKW6ouR4tCWopYRiaSCZAFkiI2dXpuUZJfepBb684a/wIWC
         SizRkkbrn7gCKB/cQWxEBEnSzwuE3z5vIMpm1v+8WrHTn+XEtnPrm8d8/jfPxSNElcnF
         YOXxx+1G/zAnZrma2eygJpLjur7iLAm5Y3Y7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778188604; x=1778793404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=geLxPWaT+kA4bOZyxYtJ1TgekKd3T20XfdyTAVXn33U=;
        b=e8t4Al9PiXU1vz8axSAdQ8yjMPi/B0x457KVSht58GlwZ6rHPn9WOGcJ/mKtHfsL2P
         gLerZEQiORf6bSdgxLxMCiemNUAcgcN3mxM9nT4v92GJKbvJOeq7+pQpZ+trHTdNwrS9
         BLieSSsL5aNF8OCXgQbRmLrb/M/k5/7qqLRNz7/rUv36Vgt92JAcw/i1I8M/g/fjCt78
         0H6ao6PVa5GAA1rQfdtLat8ml4SApEBCfRQS4VUJURJqcbF0gEUnAyIt+xZNQeLKBb0i
         9PssDQtg6ys9m44dHRCcVrCG9IfALO84V7azAqwC3TnAnoBXiEgXJ284MsDxFHbOvb0h
         kJaw==
X-Gm-Message-State: AOJu0Yx0sKyr/5QRvIJogvyvlD4QbRjoVk01KGP7l31/AplcCq+NnNOP
	3KY4ILodTAQYGkh4CelnioGelRiYaKWHGBBjKAFEDEcPumb+xMjFsR2c6UECXRvhGauPDjYSScl
	+0jdpXc7xt/ztl1B6L/68ofIm2opx/XrEPNj9Up/c0Q==
X-Gm-Gg: AeBDieuGyp43Xy587DmLUfBVl5Eor4jj8c+pGAbYfUwKDOhAM1KyNRu7JI0iUYHBBHX
	q6TUuUIAdW6mXw1bKTZDWnpIt7tsUu7UJeP8mQp2A4LfsICIfpYudt9oGTaH78Hr4ro50XJjEhQ
	/3ju2XacW+qoDgPjEoYSwsoEI/3CnJ0t0Bu5KKE2iBZJRCkqmjjGYcm6wqpbZc1KXs3Qgfq+yBX
	CvaHp6xKI+JIAWLkPx0pSQTgB7wF9aQTkmwJoGZErEPP47UXvQyUPQ8tAehW3rFNxDs0HUuG50s
	bN9rc+xg4ng2CViNigg=
X-Received: by 2002:a05:6402:46cb:b0:679:25b4:7a03 with SMTP id
 4fb4d7f45d1cf-67d638b4d73mr4045145a12.4.1778188603512; Thu, 07 May 2026
 14:16:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bug-220748-208809@https.bugzilla.kernel.org/> <bug-220748-208809-eL7PrzeMxr@https.bugzilla.kernel.org/>
 <fe08eabc-4f92-43fd-89d7-5e9d0e35c979@rowland.harvard.edu>
 <CA+Df+jdtQrYye85d7uZyT3jirsztKhf7qQes3LvOAPa+9qxSOw@mail.gmail.com> <87d93b07-be3e-4c36-a6cb-97190560f648@rowland.harvard.edu>
In-Reply-To: <87d93b07-be3e-4c36-a6cb-97190560f648@rowland.harvard.edu>
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Thu, 7 May 2026 17:16:31 -0400
X-Gm-Features: AVHnY4LOxgiozXoGN3L-YgjvnP0_ISskOnbuxdzI-TAjmc3CKojTK3cTlEbV0SU
Message-ID: <CA+Df+jfP-idvQqNrGo7Tc7+03ruh6kBa=MOSXE1mwXL2VqLNrw@mail.gmail.com>
Subject: Re: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame
 and always assumes URB_ISO_ASAP is set
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8E59A4EF2E2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[motu.com,none];
	R_DKIM_ALLOW(-0.20)[motu.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37107-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[motu.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dylan_robinson@motu.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,motu.com:dkim]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 1:24=E2=80=AFPM Alan Stern wrote:
> On Thu, May 07, 2026 at 12:17:00PM -0400, Dylan Robinson wrote:
> > However, it looks like URB_ISO_ASAP actually means something
> > different: that the URB can be delayed. Is that correct?
>
> Sort of; a more accurate description would be that the URB is scheduled
> for the next available unexpired time slot (as opposed to the next time
> slot, regardless of whether it has expired or not).

Thanks for the clarification.

> Also, there is no "specified start_frame" behavior.  The start_frame
> field is output only.  Some of the documentation is out of date.  The
> most up-to-date information about isochronous scheduling is in the
> kerneldoc comments for usb_submit_urb() and usb_unlink_urb() in
> drivers/usb/core/urb.c.
>
> > > For another, what's the point?
> >
> > The point would be to allow the driver to start a stream on a
> > particular frame relative to another stream, ensuring deterministic
> > latency between the two.
>
> I don't believe that's going to be possible.  Or at least, not possible
> until someone adds an API for getting an isochronous stream's current
> schedule information.  Until/unless that happens, the only way to know
> what frames or microframes the stream will use is to submit an URB and
> look at the start_frame and interval fields after it completes.

Adding "specified start_frame" behavior is exactly what I am
proposing. If it existed, the same driver submitting URBs for both
endpoints could track scheduling information internally, no additional
API needed. The device's endpoint descriptor determines the interval.
Is there additional scheduling information the HCD has that the driver
cannot observe?

FWIW, this is what our drivers for Windows and macOS do and they do
not require any such API. They just read the current frame and
schedule streams to start on a desirable future frame.

> If you take that approach, submitting a few milliseconds worth of
> innocuous data at the start (or ignoring it in the case of an input
> stream), you should be able then to synchronize the data for your new
> stream with the data in another one with little trouble.  You won't be
> able to change how they are scheduled, but you will know exactly how the
> two streams' schedules are related.

I have tried this. It can work if the frame information returned after
submission is accurate. That said, considering endpoint feedback and
synchronization realities, an innocuous data transmission may not
always be available.

> > > In an ongoing stream, all this would
> > > allow the driver to do would be to break the continuity of the stream=
.
> >
> > For an ongoing stream I would expect that submitting a start_frame
> > that is discontinuous and in the past would result in either a
> > submission failure or immediate completion with an error status. Such
> > an error would provide useful feedback to the driver because its
> > occurrence would mean the stream is no longer synchronized as the
> > driver expects.
> >
> > > At the start of a fresh stream, the driver could easily end up
> > > requesting the HCD to put the first transaction in a (micro)frame tha=
t
> > > the endpoint isn't scheduled to use or is beyond the end of the HCD's
> > > scheduling window.
> >
> > If the driver requests a specific start frame, it should be the
> > driver's responsibility to ensure it is a valid frame within the valid
> > scheduling window.
>
> Not possible, because the driver doesn't know the scheduling window
> or other parameters supported by the host controller driver.

If a host controller cannot accommodate a requested start_frame, we
would consider that host controller incompatible with our device. If
we wanted to try working anyway, we could always fall back to
non-specified scheduling.

> >  If the requested start frame is invalid or outside
> > the host controller driver's valid scheduling window, the request
> > should fail. This would be more helpful than silently fixing it upon
> > submission.
>
> Not if the driver doesn't know what the window is.

I don't think it matters if the driver knows what the window is,
because ultimately, the host controller can either support the
requested start_frame or not. All the driver needs to know is whether
its submission worked.

> > > >  In looking into porting our
> > > > drivers to Linux, we've found the current behavior challenging to a=
ccommodate.
> > > In what way?  What is it you want to do that you find challenging?
> >
> > In order to offer predictable round trip latency though the host, we
> > have to be able to correlate the frame time of transfers on the IN
> > pipe to transfers on the OUT pipe. Therefore, our drivers need to
> > determine the frame in which a transfer occurs.
> >
> > Currently, with non-CFC host controllers, there is no way to determine
> > which frame a transfer occurs in. This is because without CFC, the
> > start_frame returned in the URB is only approximate.
>
> Is this a deficiency of xhci-hcd, or of some types of xHCI hardware?
> Other kinds of host controllers don't have these problems.

I believe this is an xhci-hcd deficiency. The xhci-hcd computes a
start frame close to the IST, but only uses it if the controller
supports CFC and URB_ISO_ASAP is not set, otherwise it uses SIA. All
xHCI revisions support specifying a start_frame in the first TD, but
controllers without CFC require SIA =3D '1' for subsequent TDs.

> > > And thereby forcing every URB to contain an integral number of frames=
'
> > > worth of transactions, at the risk of breaking the stream's continuit=
y?
> >
> > AFAIK, xHCI doesn't allow scheduling transfers on arbitrary microframe
> > indexes, only on frame boundaries. URBs could still contain a
> > non-integral number of frames by putting the same start_frame in
> > multiple URBs (just like the TDs used by the hardware). Alternatively,
> > the initial frame-aligned URB could have a specific start_frame and
> > the subsequent ones could be submitted as start immediately after.
>
> xhci-hcd is not the only host controller driver in the Linux USB stack.
> What you're talking about would require changes to all of them (not to
> mention the changes needed in the class drivers).

I understand this would touch more than xhci-hcd, and I'm not
proposing every HCD implement it. The minimal change would be for each
HCD to advertise whether it supports "specified start_frame," allowing
drivers to query that capability.

> > Ultimately, we care about the ability to start a stream on a
> > particular frame and maintain its continuity after starting.
> >
> > Currently, there is no straightforward way to inform the xhci driver
> > whether a URB represents a stream start or continuation. This makes it
> > difficult to detect missed service intervals or other scheduling
> > discontinuities.
>
> Informing xhci-hcd about this shouldn't be necessary; it should already
> know.  ehci-hcd does, for example.  In short, if the submission occurs
> before the last scheduled URB in a stream has completed, it is a
> continuation.  Otherwise it's a start.

What ultimately matters is the continuity of the stream on the wire.
Submitting an URB before the completion of a previous one does not
guarantee it was submitted in time to prevent a discontinuity on the
wire, which we have observed.

> What might be more difficult is distinguishing between a start and a
> continuation after a gap.  The boundary between those two is pretty
> subjective.  We deal with this by ignoring the possibility; it's always
> treated as a new start.

Are you saying it's difficult to distinguish if the gap was intentional?

I was talking about having a way for a driver submitting URBs to tell
the host controller driver whether they are intended to be continuous,
so that an error can be observed if the submitter's indication
disagrees with the stream's current state.

Dylan

