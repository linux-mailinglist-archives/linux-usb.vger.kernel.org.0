Return-Path: <linux-usb+bounces-36929-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIzPL0PB+WngDAMAu9opvQ
	(envelope-from <linux-usb+bounces-36929-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 12:06:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 431624CA8EC
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 12:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8778B30471ED
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 09:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C2D32548B;
	Tue,  5 May 2026 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdAUtHoE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8222C21FF
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 09:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975196; cv=none; b=jKnu2z8UCJKoZwKYvfOrqFfpChuyU3FmbEoFLcMGK+zyVmd2ON9C113TfYHIDwzs7Frm9Hxa/dbvodZR51cYn4hDjWcyCkKj1RoV7t+BtI1aggf9W6BB5VyVjvfdVMki+ykRpUMe+c/2fA4+EWLQS1ZjZ1G+uc5AUXMzLTUdQK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975196; c=relaxed/simple;
	bh=WHMTyQ94AR3bCZIoJ33hjUrTiaGnhzNpF/OWv1Mvb1w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GlN+VKnkji3Zp5m47NVuMz/uuL+7v9Kj/ZYC+mJ5Ag2HzQVrTfx8Mj0uuJg82dEHQxtSU1kkTUZ9fp8O/v/bYJBbrKFwtAd7/K4rEJ6L5pLXn9sDNVbmEJJt7TDglGeGlLMjqqJnaQ6owGJ8zQ1rgqgMja1WagNShpy9cmuNH+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdAUtHoE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60EC5C2BCC9
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 09:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777975196;
	bh=WHMTyQ94AR3bCZIoJ33hjUrTiaGnhzNpF/OWv1Mvb1w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bdAUtHoEkEVkwv9wvMwMUPE2xTfWuZz2LlF/Fv/n9SPiHljMNhtM06dCMsRL3F8uv
	 NEKkIGSHVGzM8R+cZ3kf+kjBE3z3Ar/FxEx3o33/A2rWLvwq5poK3I19GED5KiWI7e
	 xVJZraFLdh0gRw9MviRSBD0GDqBdLZI1fQPjXXeqXq/lGmJBzXLYabrnJKvkXkagST
	 VaG2he96e7hnUfJxPofX1AdKzAibTT1EgeiRiB3RUl9QlsSeCIvCXXToByzF7zQz/x
	 WbaiEKJRittSg1g6h8d9XV6FyCkF54xFafgtQHrDiiyVSS4ZIeYJU4F9ui/DWTxcYc
	 xViuppZOUp71w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5ACF1C41612; Tue,  5 May 2026 09:59:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Tue, 05 May 2026 09:59:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-lAJJBzltMC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 431624CA8EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36929-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #21 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Thanks for taking the time to explain.

(In reply to dylan_robinson from comment #20)
> The issue, as it relates to the MOTU devices mentioned here, is that after
> enabling a non-zero alternate setting with usb_set_interface(), once a
> transfer is sent in a service interval (zero-length or otherwise), there
> must be a transfer in every subsequent service interval. If, for any reas=
on,
> a service interval is missed, the alternate setting must be toggled back =
to
> zero and then re-enabled, and the stream restarted.
That would be something for snd-usb-audio to do.
Does the same apply to missed service on IN endpoints?
Or IN endpoints with lost/corrupted packets?

And for the record, are you saying there is no hope to predict what the HW
expects to send and receive in the next interval and handle it right? Users=
 say
that streams go out of sync but the HW continues to function in some manner.

> MOTU's drivers on Windows and macOS take advantage of the ability on those
> platforms to schedule the start frame of isochronous streams sufficiently
> far into the future to ensure that enough URBs can be submitted before the
> first URB completes.
>=20
> On Linux, I have found that with snd-usb-audio, it is fairly typical for
> streams to "stutter start." Because of the ASAP/SIA behavior discussed
> above, when the first URB is submitted, it can sometimes complete before
> subsequent URBs are enqueued. This creates a gap in the stream and causes
> the device buffers to fall out of sync.
I remember noticing this tendency to restart streams (unlink and resubmit U=
RBs)
during startup with short buffers/low latency, presumably without going thr=
ough
altsetting 0. So I can see how this can be a problem. IIRC it was at least
partly due xhci-hcd scheduling too far into the future. I will try to find =
some
time to look into it again.

> At one point, I investigated monitoring the start_frame in the completion
> handler, but on non-CFC controllers it was not reliable (there were many
> duplicated frame numbers or gaps that did not reflect reality).
These fields are filled by xhci-hcd so they may be bogus due to bugs.

For reliable information it's better to log "Frame ID" written to Isoch TDs=
 and
MFINDEX register in process_isoc_td() (sensitive only to IRQ latency).

IIRC, on non-CFC even if things are initially right, they may fall out of s=
ync
due to missed service, with the MSE event being the only sign of trouble.

> Although more recent MOTU devices have improved buffer management and won=
't
> fall out of sync due to missed intervals, the ability to specify a start
> frame is still important for reasoning about the timing relationship betw=
een
> IN and OUT streams, which helps guarantee consistent round-trip latency.
The "Linux way" appears to be guaranteeing two things to drivers:
- start_frame in completed URBs accurately reflects the time of execution
- streams are always continuous - even if an interval is missed, the next U=
RB
frame reliably completes (or is missed) in the next interval

For continuity, class driver only needs to ensure that the URB is resubmitt=
ed
from its completion handler. If that happens several ms later, the URB is
expected to immediately "complete in the past" with EXDEV.

AFAIK that's how ehci-hcd does it, but xhci-hcd doesn't and maybe should.

Wouldn't this be enough to make IN/OUT synchronization work?
What's people's experience using MOTU HW and audio in general on ehci-hcd?

> > I wonder if this could be the reason for some weird snd-usb-audio behav=
ior
> > reported in the past (repeatedly unlinking and retrying URBs for unclear
> > reason when running full-duplex with very low latency). But it's just a
> wild
> > guess.
>=20
> This sounds like an issue I just started investigating. I am exploring the
> possibility that when an isochronous endpoint is restarted quickly on a C=
FC
> host (all URBs are killed and immediately then resubmitted), if the new U=
RBs
> are submitted before all TRBs have been dequeued, their start_frame values
> may be set as if they were contiguous with the canceled TRBs. This might =
be
> causing the entire batch to fail with missed service intervals. This then
> happens over and over again.
IIRC the repeated unlink/resubmit cycles during startup were due to
snd-usb-audio getting some "xrun" callback from ALSA core for some reason. =
Then
it would unlink everything and try again. I didn't know why it happens.

New URBs may be contiguous with past ones if you don't wait for them to
complete
after usb_unlink_urb(). OTOH, usb_kill_urb() is synchronous. Once all URBs =
are
killed synchronously or completed (including due to unlink) and the queue is
empty, then submitting a new URB should schedule it far enough into the fut=
ure
to ensure no missed service. That's the theory.

See usb_submit_urb() and usb_unlink_urb() comments in drivers/usb/core/urb.c

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

