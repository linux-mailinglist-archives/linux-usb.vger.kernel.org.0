Return-Path: <linux-usb+bounces-33085-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJmTF0EOg2k+hAMAu9opvQ
	(envelope-from <linux-usb+bounces-33085-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 10:15:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D961E3AE2
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 10:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6DB9530095D0
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 09:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355533A1E67;
	Wed,  4 Feb 2026 09:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KAVLrAoc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6033A1E69
	for <linux-usb@vger.kernel.org>; Wed,  4 Feb 2026 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770196517; cv=pass; b=k2xP0ciuvKnlBBgxa62P7nIiBRELjnLxRMJD7QoJJaWakTqUeX5S2o+v1ZqVXarsMensAk3dCWmzb4xlFopaqnYBEwEnxVSDd80TFlx7E1fyUT3vhXE7PnZyka07T+ZQGwn6Y9y8b9CRFNwRkts3wJwlp62dRkQA/lB/Ahd8azk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770196517; c=relaxed/simple;
	bh=wC2eOCM21PbEmwR8LFQmI9j4ZWCB3ZE8jYVykbZL3Gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uGIRw6dRg5Ayh4amLXVVy+/j8+kM7hBZf9+SDqIBtwBb5mkWdP4oIBzR+pVCSEYwcLZN3V2q/31+8ok7HR6Lb4HofP1BRN9gWmlXsYl7PLsnPNZyHQnopE9mfTJm+naH2g4WlUXgEAERkwipEsu1MNzuGqxCha1Lhcp4Mneg+Vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KAVLrAoc; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-505d3baf1a7so306141cf.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Feb 2026 01:15:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770196516; cv=none;
        d=google.com; s=arc-20240605;
        b=QSp1VuCQ0LgnzP460kACBEzxXdPv96/XdyffJ7/BN+o/f0oXFWrZYTBUb0fNgtN6GO
         hC+281gguQ+q1tuFcNyWGVpABKTg4m5TVlVeDYuD163GH6xtxWjwhcPYS0SufklEzQIX
         aYOE54dUcfk1zZ9y7M5kG2lHKxVognRJQfhtxzNDwQFrX724XKgMR2gSkog4CBzTNKzT
         w/Z1MFkuIVQGpxMs6ReIMbB1Spqtrqd0jIrSrGvzZXNeek1YVBKcqQo+OitUfRDfE15c
         TTpzE0Ym0m10rTqMaJVJBkSELw+uaE03C7pBgeLRHDH3/D3zh64gBZ+hZCjR81EOtznY
         6e4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qtr/Rq5XW6imebDaN6PuW6KteYh03XamAZ/tTwSjOec=;
        fh=2tDk+xHMVrCY+YYUUCrTlAtU2VVV8+1JItSi6IAOTKw=;
        b=kQYX4fh1qbvMLtk/2661CrGoZ0FhA9ZDXJLpMvP634n3YlirECCsiDNhmqLqr0SF5G
         INDseLNC9va0L0RWu/8kJ4SI3MXjhIRjbKfvEyuxvtEa3p1BnJPrUwSjraSq5Jw4zoAp
         VBywge8pdAJTxngMbssyf4rH1KC7FvHCq8iinHlZBwMcPxA7lvm9ZbscQO6WMVvttGk0
         iXrxJGG+8jSwNKZfuQR2H/ZpGP29PtP4Pz3mrL6kPLKhxdqFZm/4TnuU4jYv1SAPyh3D
         iKlsd3c46EI38OJJUo6Jm1YWEP5mgp401nyp0PIXNNODVxcWaxCTpdc6YFmJV9EwF1eq
         PAqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770196516; x=1770801316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qtr/Rq5XW6imebDaN6PuW6KteYh03XamAZ/tTwSjOec=;
        b=KAVLrAoc05FMKbXBLJlE4wgGhclqHSeP+nX5t+vggfjy1Jo8jRD1i53NDU5P29hDgQ
         gIzJY/4Zp+a/pXDSGbL2rHzriI6tE1l3QMVvYG7JSfncpKL+9nuFVQmcaut1fux7/Gbc
         XM8qvEPHtbfsBqJ/6IoeiC6VJqcle72oLvxG2l1QiJIB9b0Bs894f/KK7WmEeLNDSxRL
         m+tFZi7uvBQML9ZHOfpeB5/PkwB0TIp0waxy2GMmRU0zulVI7y2Y1uas4aWK6nVVqzEh
         uH2An8Uk4aVloPH9PSDeJQSUubStT4BCo7Sy8jFih3I6UX9wx9LSbV1WrFceJAzyBA1J
         xaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770196516; x=1770801316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qtr/Rq5XW6imebDaN6PuW6KteYh03XamAZ/tTwSjOec=;
        b=fdvcvuZlmvwtVI8ds8AuRdV39QLuowamd6khxdMXgkXa4NIZPOdHrxbItZ7CfpCVTU
         /NsCsg9DGwM9UsGQMGk6sV3wkK0yibvqwrM0VyLmapnkkjq7cwGnZ91jrOyaXs4zi5B1
         XRigJvhoNhwsXhr84hxABW3xNSxmxdbU2/JtWjmqR/f40t4MH/mwH9iHcxpvI11BTwP3
         urV28aJrUD03vSf6XVjc5TuoPw1uPBtgnZJk5BJQzyLhunQRbdTpbyv1t/+3dKITgtSp
         Vadg2IHeJn+PONCt1Os5Epz1Xg/36euYa/0SIKFkQuVVi93vamKyIoBICOAyObeJpVd1
         xwpw==
X-Forwarded-Encrypted: i=1; AJvYcCWc5nclyIDlDHT2ypIg4SAMfdqyQCu2QKvV6Bu613EbwO6qcxL4us9qeLQ6emHK8lvFZ2sXEhBMkk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfH6OdMUEdk5KXxgPj+eobaSP2M+CgT8Pts/qiwvJYMCEm1bhj
	hX/IJATI2rCPv4+M7gkUADIzCEmVKwEnJO6YoPlYOYSV/Bb9p/74WooaXI0IL8lUYU7128+eVWF
	p/pBy/A4JGBQXUWYmXVEkbUzOnr4HBEc3uoa7OAMv
X-Gm-Gg: AZuq6aK9ToKT+4s0tJUHoZZbSqeh0uInvZIWQi+G9kPkkkcFZ6Zn4cgZaW8aC3ZO7j0
	826LoUMBc2fQppyyBTLk2pG/gFDucsPb05XoFFVuzjYM98e3lGEUOt6CTh5h14RoVv/alvttB5M
	oi2ntW0RdtR4KZYfVDC917lGODHmici3A3AIyMI0X8JBgKUqcCsFLQOKF1r/2vJ/fqPdDUjmsod
	H2Na0QCrFgILf64lDdMgLv8YxMP8pmxLW8S74lWqVaGr+kmz1BpUqi6R4rQr6C2FhPXdFL1+8Aq
	4ZjCfTrPmAGfyH+Jr5CR0/+IIT6gIXcj
X-Received: by 2002:a05:622a:1a8a:b0:501:19b9:42e9 with SMTP id
 d75a77b69052e-5061c3c660amr9915021cf.4.1770196516081; Wed, 04 Feb 2026
 01:15:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130074746.287750-1-guanyulin@google.com> <2026013133-tamale-massager-3c76@gregkh>
 <CAOuDEK0o2jqqOUZVUdi9JDcyXRQHEuL9GCBrU0VQhWAfDtJnUg@mail.gmail.com> <6acaaae2-4e93-46f5-8170-277bc369f922@linux.intel.com>
In-Reply-To: <6acaaae2-4e93-46f5-8170-277bc369f922@linux.intel.com>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 4 Feb 2026 17:15:00 +0800
X-Gm-Features: AZwV_QiZlT8utJE1tq9fy_MBQe3Qe0segFCNT9KB1NvH357aF9kf-41nbzR-ltU
Message-ID: <CAOuDEK3xzpY7Cr8JgactH=Sy=h7aTEgdTqUiuX8xh6gvUNR5uw@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: host: xhci-sideband: fix deadlock in unregister path
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, wesley.cheng@oss.qualcomm.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33085-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guanyulin@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 7D961E3AE2
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 10:14=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 2/2/26 12:03, Guan-Yu Lin wrote:
> > On Sat, Jan 31, 2026 at 8:15=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> >>
> >> On Fri, Jan 30, 2026 at 07:47:46AM +0000, Guan-Yu Lin wrote:
> >>> When a USB device is disconnected or a driver is unbound, the USB cor=
e
> >>> invokes the driver's disconnect callback while holding the udev devic=
e
> >>> lock. If the driver calls xhci_sideband_unregister(), it eventually
> >>> reaches usb_offload_put(), which attempts to acquire the same udev
> >>> lock, resulting in a self-deadlock.
> >>>
> >>> Introduce lockless variants __usb_offload_get() and __usb_offload_put=
()
> >>> to allow modifying the offload usage count when the device lock is
> >>> already held. These helpers use device_lock_assert() to ensure caller=
s
> >>> meet the locking requirements.
> >>
> >> Ugh.  Didn't I warn about this when the original functions were added?
> >>
> >> Adding functions with __ is a mess, please make these names, if you
> >> _REALLY_ need them, obvious that this is a no lock function.
> >>
> >> And now that you added the lockless functions, are there any in-kernel
> >> users of the locked versions?  At a quick glance I didn't see them, di=
d
> >> I miss it somewhere?
> >>
> >> thanks,
> >>
> >> greg k-h
> >
> > Hi Greg,
> >
> > You are right; xhci-sideband.c is the only in-kernel user of the
> > locked versions. I will rename the __ functions to usb_offload_* and
> > remove the locked variants in the next version to clean up the API.
> >
> > Regarding the deadlock fix itself, we have analyzed two potential
> > solutions. The core issue is that xhci_sideband_unregister() (and
> > xhci_sideband_remove_interrupter()) needs to decrement the offload
> > usage count (which requires the USB device lock), but it is called
> > from the disconnect path where that lock is already held.
> >
> > Option A: Fix the Callers of xhci_sideband functions
> > In this approach, we keep the usb_offload calls inside the
> > xhci_sideband functions but replace the internal usb_lock_device()
> > with device_lock_assert(). We then update callers in
> > qc_audio_offload.c to explicitly acquire the lock.
> > This ensures the offload count remains tightly coupled with the
> > interrupter's lifecycle, though it effectively changes the API
> > contract: calling xHCI sideband functions now requires holding the USB
> > device lock.
> >
> > Option B: Decouple usb_offload functions from xhci_sideband functions
> > In this approach, we strip the usb_offload calls out of xhci_sideband
> > functions entirely. The client driver (qc_audio_offload) becomes
> > responsible for the full transaction: acquiring the lock, managing
> > usb_offload_get/put(), and creating/removing the interrupter. This
> > restores clean encapsulation (xHCI functions only handle hardware),
> > but it places the burden on the client driver to correctly balance the
> > usb_offload calls.
> >
> > I lean towards Option A to ensure the offload count implies an active
> > interrupter by design, but please let me know if you prefer the
> > cleaner separation of Option B.
>
> I would prefer option B
> Decouple the offload from sideband.
>
> The secondary interrupter in sideband was specifically createad for
> qc_audio_offload.
>
> Vendors using the xHCI hardware Audio sideband Capability (xHCI 7.9)
> won't use a secondary interrupter, but might sill want to prevent suspend=
ing
> the device. So it shuold be better to make this decision in the class dri=
ver.
>
> The offload count shoudn't be that complicated. Isn't it binary at the mo=
ment?
> We don't allow more than one sideband per device, and it can only have on=
e
> interrupter.
>
> I unfortunately couldn't participate in the review and development of
> drivers/usb/core/offload.c, but my original idea before it was implemente=
d
> was to keep usb core out of sideband as much as possible as its not reall=
y
> a part of usb specification.
>
> This is also why I added the sideband pointer to struct xhci_virt_device.
> It allows us to figure out if a device is dedicated for sideband use.
>
> so xhci_sideband_check() could be something like
>
> bool xhci_sideband_check(struct xhci_hcd *xhci)
> {
>         guard(spinlock_irqsave)(&xhci->lock);
>
>         for (int i =3D 1; i < HC_MAX_SLOTS; i++) {
>         if (xhci->devs[i] && xhci->devs[i]->sideband)
>                 return true;
>         }
>         return false;
> }
>
> Thanks
> Mathias

Hi Mathias,

Thanks for the feedback.
I will proceed with Option B as you suggested. Decoupling the offload
logic from the sideband mechanism seems cleaner and places the
responsibility correctly on the class driver (qc_audio_offload) to
manage the offload state.

I will implement the following changes in v2:
1. API Cleanup: As Greg requested, I will rename __usb_offload_* to
usb_offload_* and remove the locked variants. These functions will use
device_lock_assert() to ensure the caller holds the lock.
2. Class Driver Logic: qc_audio_offload will handle locking udev and
calling usb_offload_get/put() directly.

Regarding xhci_sideband_check():
I have a concern regarding power management with the proposed check:

if (xhci->devs[i] && xhci->devs[i]->sideband)
        return true;

vdev->sideband is assigned during xhci_sideband_register(), which
happens when the class driver probes (device connection), and it
persists until disconnect. If we use this check, the xHCI controller
will be prevented from PM suspending (system suspend) as long as the
device is connected, even if it is idle (not playing audio).
For mobile power optimization, we need to allow the controller to
suspend when the sideband is registered but idle.

Since we are proceeding with Option B, the class driver will be
maintaining the udev->offload_usage count via usb_offload_get/put(). I
propose we still rely on usb_offload_check() (or check offload_usage)
within the xHCI sideband check. This ensures we only block or adjust
the PM suspend flow only when there is active data transfer.

Regards,
Guan-Yu

