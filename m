Return-Path: <linux-usb+bounces-30108-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BA8C374C9
	for <lists+linux-usb@lfdr.de>; Wed, 05 Nov 2025 19:28:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DD7E934EF5A
	for <lists+linux-usb@lfdr.de>; Wed,  5 Nov 2025 18:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CD9272E4E;
	Wed,  5 Nov 2025 18:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtXAB1wE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3FE27FD51
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 18:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762367295; cv=none; b=cKHS7/CI1Abhw4leJyudoFerMLRmyDDAXo0Kz36aE8YVRR9ljzR7WoNxIckbMjC5OO6rjAeCi3isl9b6YF9KlR6HI5Q2xE8zcQu49K0rS5yTWEdsCO2QiBQzLG1oNnuP+q3z6lVCw5dLDji3PARS4I3Y4bShqX6pgS8qv5fCGTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762367295; c=relaxed/simple;
	bh=US9R8JjB2OzotXpjwg0XljYFMfwl9HQqSsRRgt5088k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cFKcypSVI4aqy2yhlLBwubSMrRSM/WRZ0IN05h72PQEX9oNfi/TBKLCxvljSOLmrwN1cNxnVTLSm2/2gVT9Koi1LMYJrQEv5RW4zdHiv3EWQQsQuo8IBce4wc0Q8iXlS2PF/9XN971HJTwbiKjcKql18+eatI1vyJQabSgnRq2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtXAB1wE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 516AAC19424
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 18:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762367295;
	bh=US9R8JjB2OzotXpjwg0XljYFMfwl9HQqSsRRgt5088k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XtXAB1wE9lKfg+f55KIErKC46EiZPwi1OoXz3DhTkryjt/P6FZbhlmRPRICIQQhBz
	 dtEf0Ts72V4p2Xd3UgJ8E7LyWwzZ9mjDwwhMYp7HhHpaq/u0IxAT5vrizt+jVNNTJh
	 AHz05yLGgzu2faF4gyXrDrXr8iQVnOyiPth88JanMWd83yASd9DtkbM/q1AFzujEwV
	 4wnpIa2LsFbd0V6Zq7wKBZvDz6lOIup2NsuRGrOW6+vESOP5RnZl3qHcq/ittm51Nu
	 Bs0YSmpTpA9Kg++tt+oy6el10CqigjMDl2w+Dm+pDskRi83PxT9bMGnlVxrSnawvBG
	 ME31Nq9hqCS6g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 49A25C41613; Wed,  5 Nov 2025 18:28:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Wed, 05 Nov 2025 18:28:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nick83ola@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-x7JuQkyGsg@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #6 from Nicola Lunghi (nick83ola@gmail.com) ---
(In reply to Alan Stern from comment #5)
> For anyone who wants to know more about how isochronous scheduling is
> intended to work in the Linux USB stack, see the description in the
> kerneldoc for usb_submit_urb() in drivers/usb/core/urb.c.
>=20
> In short, the start_frame field in struct urb is output-only.  The host
> controller driver doesn't pay any attention to it when an URB is submitte=
d,
> but the frame assigned to the URB's first isochronous packet gets stored =
in
> start_frame before the URB completes.  Furthermore, the URB_ISO_ASAP flag
> only affects what happens to an URB that was submitted too late to keep t=
he
> endpoint's queue going (say, because interrupts were blocked for too long=
).=20
> If the queue is just starting up, or the URB isn't already too late,
> URB_ISO_ASAP is ignored.
>=20
> Also, host controller drivers are not likely to pay attention to the
> interval field.  They will use the interval specified in the endpoint's
> descriptor.

Sorry Alan I don't understand your considerations. are you saying that this=
 is
not valid? the documentation you pointed out states that

 With few exceptions, USB device drivers should never access URB fields
 * provided by usbcore or the HCD until its complete() is called.
 * The exceptions relate to periodic transfer scheduling.  For both
 * interrupt and isochronous urbs, as part of successful URB submission
 * urb->interval is modified to reflect the actual transfer period used
 * (normally some power of two units).  And for isochronous urbs,
 * urb->start_frame is modified to reflect when the URB's transfers were
 * scheduled to start.

I also found this documentation from intel
https://www.intel.com/content/dam/www/public/us/en/documents/technical-spec=
ifications/extensible-host-controler-interface-usb-xhci.pdf

pag 219 4.11.2.5 describes the start frame field.

I don't have time today I'll try to play with this during the we.

Can someone tell me if my considerations at the beginning are valid and the
behaviour that we have is missing the start_frame handling, or there's
something I don't see and the driver is actually doing the right thing?

Thanks,
Nicola

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

