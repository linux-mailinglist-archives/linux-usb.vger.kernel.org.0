Return-Path: <linux-usb+bounces-37149-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAqQFFkb/mnpmwAAu9opvQ
	(envelope-from <linux-usb+bounces-37149-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 19:20:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B7F4F9DF1
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 19:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85E7A303AB78
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 17:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD9731352A;
	Fri,  8 May 2026 17:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="gwjuBVNF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F5B148850
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 17:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778260820; cv=pass; b=kPYDFazWpu9zreWJJfs1RZiM9aFbQY1UolydcUVIPisLy7m0XvdZlDey2thrNHzH5n2283QdCY+0Bbd8i9oCS7a7x/PQGtWUIAuh0DylP2Xp52EX3bzl3xdIhrFYgqVookrKpXcBCHe+iINLOBzvFcjOo5tFaI8X3laCgOV0buw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778260820; c=relaxed/simple;
	bh=jq0vvRUsXzcPKR55De6dQplu7cMxfgQ4MEgN0ngopWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqjGFL6tuLKMDd1g+WDIgwN78E+WoPpp3tf7XuU5UgC83WOEU5qCcMgkechD3DfXyyd4RP/GlCijnCWPirEC2R0dxyVTHeXZnZLrQ4kGkWyG2H9xlF8oaopjGBwDSwczSyPhBqKIGZ3dfSTCMo+0+RFKOh/zn+OE7Q0i9t3X6qI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=gwjuBVNF; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67b8d9c26bbso3901242a12.2
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 10:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778260817; cv=none;
        d=google.com; s=arc-20240605;
        b=fz/lSrA9VoTcCTY3umjTlsiS0CEJR/lrjIFVpryLzpBz86+rJD3LVS4ufdK6bdwTeZ
         5/j0mGQJYdlvH6sSRtncWrcBs9JtwmKbuvfODmq3YmPPA1ax+sTPYEFrnrxQD0+gtOdU
         R27NEdIk8IAnnkPwkAfUggwuDdqskY5jtC1C5xOFHqlZ1NLrMh7x2Td0HN4IWWFV2KcK
         ntDsxV6ITYmSAYmiDyriuH57r+Nf6EHQuGOnBUdgOozuJiJRIwbOPIt/Lh0e0uo5DMGk
         cZrXL24Tz9Xh4oHHanYDxb6oJ3Vqr4XKC1jZ5Gl5gIrB5rFSRzIkKihkewvQE52CZ+rj
         QT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LvwqvU+9JXhLsDNTGwbDvjiLqDnOETDX6x8YKp/5ggg=;
        fh=IwtSbyP7ybH5gNb4Jqk0PuWQKJHgDCfCsLL/kZKlpUI=;
        b=GprmYGsJLh0Q888W842+E4IbsgzbmcHI9IHylnQQhXuFxm+EEkq5gQ9RRE2tr9Rjot
         mDoHOIgsccF/4GxJeF/8DRa9XfTTfxccQvFEKgAmKmuXfC4BzoG7HmsjoGsPvn5h+jjH
         dYdoGotfAhRJLueoWFisBrQZYROywlLEDn+pbhXP3T5TLqvOvGGAx8m8nkLjiQbSPltH
         IVmOAvmxjwYifZPZ4CDqfhNKbpCMSDVP3QjT/raM7/5wCGzASwp3j/nu7yZaB22SAz4D
         3mRU+xP7BDk323Cnn50xy2pE9gEsQMcP5anCnuuXzxJ3q/ThIoE4HI1s0EzFdfpbo60w
         DRJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1778260817; x=1778865617; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvwqvU+9JXhLsDNTGwbDvjiLqDnOETDX6x8YKp/5ggg=;
        b=gwjuBVNFlH/eU/vVR1awUpNmfcWWJUjPpBznpZ5iti+dXsDT1OEKTVVo4vCczggMix
         /Uk1M+qCr/gdcWCQboJUHT/AkQ0VqRwkgR60ZstxyOYP2EuGHAnDdk/bpGr+LhKmD+c/
         wjjNdoT2uc3RDJr30v0HARlQvqXcrsgIWHMrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778260817; x=1778865617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LvwqvU+9JXhLsDNTGwbDvjiLqDnOETDX6x8YKp/5ggg=;
        b=eJjtbWZFBVRcdTTJ8yW+AaYZ63ow7RGHY4GdvmJYwB8+qGvTGfdFJkdMW0mTqrVnde
         SJrD1NWUwEPvyfoKo/lsJaYfMaR07kdlemx96VT1BkvaWpHAHkRNJNzSZe0T8IkswnWF
         GR1kuuIJV+zuA9WkO9aEpVEKxHBA2xSsrwa8l7vxnuVecCDCETSyNTc4c+ynPMhU5oAa
         lqcuZQ8We5UXInbGGbTWwpGIEfMCqnaKtuSAfupVozfaHZWdVx4SoHwOyJIGTjFl+cPD
         k+sfVHBKN8nnTbNW36pTNvK0+zg/D83xjzppvOxRHoHgj2AYv5lPPyfMUQj7goQ9YuGy
         le4g==
X-Gm-Message-State: AOJu0YyeRFXPdbywLsrFlKmoWXf83JmgTvMRXwbidX3ko2T9kvps/u5q
	tkyw+7TSKCh7AmR+BM4G8uajuZ5pM5nystPFe9fc+QNJ1dU6Gi8hQgUk8nSG7eyqot/x5p6TcB2
	1KY1lXM4KY3ynYPbS7lwkN9mI1DcJEk0e/IJEnFqgpg==
X-Gm-Gg: Acq92OE6vzkKxF9kDttZqFs4ui93N6DwkIMbq2EcMgDjM3k+dv8w+xwnomppxm3bhO/
	NRonG1WtVIbck7n2O1mFa4faFrIZmdt6XpedcSq+HKrIKABgU8IMxLHkzv4nMfRg0UBoNIf7bA4
	qhd1OQhhmFuqnBcA1RuSV2vA99Q3DUFAp7H5gh9SIpCqtiEM4bilRDNXUVaeKZH2kuBX07AC5K+
	LpgFEG3i4r1SkFOj8O0RjAkftRvEzMcTqKhpEVJJpZW1buKU4kPoiRnfI3pDpBKPhVVqfyOpjy0
	ixjF6DE8
X-Received: by 2002:a05:6402:5407:b0:673:b696:8830 with SMTP id
 4fb4d7f45d1cf-67d642b243amr6642454a12.16.1778260817016; Fri, 08 May 2026
 10:20:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bug-220748-208809@https.bugzilla.kernel.org/> <bug-220748-208809-eL7PrzeMxr@https.bugzilla.kernel.org/>
 <fe08eabc-4f92-43fd-89d7-5e9d0e35c979@rowland.harvard.edu>
 <CA+Df+jdtQrYye85d7uZyT3jirsztKhf7qQes3LvOAPa+9qxSOw@mail.gmail.com>
 <87d93b07-be3e-4c36-a6cb-97190560f648@rowland.harvard.edu>
 <CA+Df+jfP-idvQqNrGo7Tc7+03ruh6kBa=MOSXE1mwXL2VqLNrw@mail.gmail.com> <a756038c-270b-455e-9f53-51b1ad6a31d0@rowland.harvard.edu>
In-Reply-To: <a756038c-270b-455e-9f53-51b1ad6a31d0@rowland.harvard.edu>
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Fri, 8 May 2026 13:20:04 -0400
X-Gm-Features: AVHnY4KhtlEmo0jVTMP4-7ja7yWClb68OW2i4LSq_gGb44Y06vM2qUurs6AWiqU
Message-ID: <CA+Df+jf=UaVubKM1Pfu7sgREUMYv=6QMi94mbhhefjhXq8-6uw@mail.gmail.com>
Subject: Re: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame
 and always assumes URB_ISO_ASAP is set
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C6B7F4F9DF1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[motu.com,none];
	R_DKIM_ALLOW(-0.20)[motu.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37149-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[motu.com:+];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dylan_robinson@motu.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,motu.com:dkim]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 11:02=E2=80=AFPM Alan Stern wrote:
> There certainly is!
>
> Different HCDs handle periodic transfer scheduling in different ways.
> In some cases the bandwidth (and corresponding (u)frames) may be
> reserved when an alternate setting is installed; in others it doesn't
> happen until the first URB of the new stream is submitted (in which
> case the interval may be taken from the URB instead of from the
> endpoint descriptor).
>
> Either way, the HCD has to decide how to schedule the isochronous stream
> based on the constraints of how much bandwidth is already dedicated to
> other devices and endpoints, and what (u)frames are already in use.  Of
> course drivers have no way to know this, or to handle it if they did.
>
> In addition, when the scheduling decision has been made, the HCD knows
> not only the interval that has been allocated to the stream but also its
> phase.  That is, which (u)frames it will use, in cases where the
> interval is larger than one (u)frame.  This phase information is not
> provided to the class driver other than implicitly through the
> start_frame values of completed URBs.
>
> In fact, IIRC the USB spec doesn't require isochronous transfers to
> occur at uniformly spaced times.  It only requires that there be one
> transfer somewhere within each interval.

Understood.

Our High Speed and SuperSpeed devices always use a bInterval of 1, so
they expect transfers in every microframe. I'm less familiar with the
behavior and expectations of endpoints that use larger polling
intervals.

Perhaps, rather than treating this as a "specified start frame", it
would be better to think of it as a "specified start service
interval".

If a driver requests a start frame that is not specifically available
within the periodic schedule, it seems reasonable for the HCD to place
the transfer at another valid position within that same service
interval. The actual start frame used could then still be reported
back through the completed URB, which can be inspected by the driver
if it needs to know the precise scheduling decision.

For endpoints with larger polling intervals, this "nearest valid start
frame" approach seems appropriate, since the device cannot expect
timing granularity finer than its polling interval anyway.

> > FWIW, this is what our drivers for Windows and macOS do and they do
> > not require any such API. They just read the current frame and
> > schedule streams to start on a desirable future frame.
>
> Let's say the interval is 8 frames, and the driver requests to start in
> frame 71.  If that isn't one of the frames in the allocated schedule,
> presumably the URB submission will fail.  What does the driver do then?
> Try again with 72, then 73, 74, and so on, until it finds a value that
> works?  Make random choices?

See above.

> What if the HCD only supports scheduling up to 256 ms in the future, but
> the driver asks for a start frame that is 400 ms in the future?

On macOS and Windows the submission would fail with an error. That
seems appropriate.

For example, macOS has the following return status:
 - kIOReturnIsoTooNew (Too far in the future)
 - kIOReturnIsoTooOld (Too far in the past)

On Windows, the status of the URB is set to USBD_STATUS_BAD_START_FRAME.

Our drivers on those platforms request start frames that are about
20ms in the future. We haven't encountered controllers that reject
this.

> What if the periodic schedule is already full and there is no bandwidth
> remaining to schedule the new stream?  How will the driver find out?  By
> getting a different error code from the URB submission?

The driver needs to know if the stream cannot start. What happens currently=
?

> > > If you take that approach, submitting a few milliseconds worth of
> > > innocuous data at the start (or ignoring it in the case of an input
> > > stream), you should be able then to synchronize the data for your new
> > > stream with the data in another one with little trouble.  You won't b=
e
> > > able to change how they are scheduled, but you will know exactly how =
the
> > > two streams' schedules are related.
> >
> > I have tried this. It can work if the frame information returned after
> > submission is accurate. That said, considering endpoint feedback and
> > synchronization realities, an innocuous data transmission may not
> > always be available.
>
> All right.  Something else will be needed for such situations.  Right
> now I don't know what the requirements are.

The goal of our drivers is to provide low-latency, highly reliable
audio streaming. In general, the more visibility and control the
driver has over scheduling, the better the latency and reliability can
be.

The practical requirement is for the driver to be able to start a
stream at a predictable point in the future and to understand how that
stream is related to other active streams.

As long as the stream can be started reliably (without gaps), and the
resulting scheduling decision is observable to the driver, it is
generally possible to make the system work. However, reducing the
driver's visibility into or influence over scheduling typically means
trading away some combination of latency, synchronization accuracy, or
speed of recovery.

> > If a host controller cannot accommodate a requested start_frame, we
> > would consider that host controller incompatible with our device. If
> > we wanted to try working anyway, we could always fall back to
> > non-specified scheduling.
>
> In view of my remarks above, doesn't this amount to saying that you
> consider all host controllers incompatible with your device?

Our drivers already operate with "specified start_frame" behavior
across a variety of host controllers on both macOS and Windows, where
we consistently observe the requested start frame being honored in
practice.

That leads me to believe that our devices are compatible with the vast
majority of host controllers they are likely to encounter.

> Then what will you do if your device lies behind a host controller that
> doesn't support it?  Fall back to unspecified scheduling?  If that is
> acceptable for such situations, why can't you use the same strategy with
> xhci-hcd?

We can ultimately only provide functionality within the limits of what
the host platform and HCD are capable of supporting.

In general, the more precise and predictable the scheduling behavior
is, the lower latency and better overall performance the driver can
achieve. Falling back to unspecified scheduling may allow basic
functionality to work, but at the cost of increased buffering, reduced
synchronization accuracy and longer startup delay.

> > What ultimately matters is the continuity of the stream on the wire.
> > Submitting an URB before the completion of a previous one does not
> > guarantee it was submitted in time to prevent a discontinuity on the
> > wire, which we have observed.
>
> In fact, _nothing_ guarantees that URBs will be submitted in time to
> prevent a gap in the schedule (except perhaps on some RT systems).  The
> CPU can get overcommitted at any time, and drivers have to be prepared
> to handle unpredictable delays.

Understood. We are well acquainted with that reality, and a
significant amount of our driver work goes into mitigating and
recovering from exactly those kinds of disruptions.

Ultimately, I am trying to understand how to achieve a similar level
of reliability on Linux to what we are currently able to achieve on
macOS and Windows platforms.

In the case of an unavoidable scheduling gap, what matters most is
that the driver has some way to detect that the discontinuity
occurred, so it can respond appropriately.

> Aren't they almost always intended to be continuous?  Particularly if
> the new URB is submitted by an old URB's completion handler?  About the
> only unambiguous exception I can think of is the first URB submitted
> after a Set-Interface request, where there's nothing for it to be
> continuous with.

Generally, yes. For audio streaming we always want the stream to be continu=
ous.

That said, we do have some MIDI devices that intentionally use
discontinuous isochronous transfers in order to allow the driver to
schedule MIDI output with more precise timing.

> It's always possible to observe these errors after the fact (assuming
> the start_frame values are reliable).  I'm not sure what value there is
> in observing them when the URB is submitted, however.  What would the
> driver do differently in these two cases?

I agree the two cases are quite similar in terms of observability.

The main practical benefit of detecting this at submission time might
be the potential to reduce recovery latency. If the driver can
determine immediately that scheduling has failed, it may be able to
restart or resynchronize the stream sooner, which for an audio
interface, could translate to a smaller audible glitch.

Dylan

