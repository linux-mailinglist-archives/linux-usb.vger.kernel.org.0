Return-Path: <linux-usb+bounces-30074-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F7DC34832
	for <lists+linux-usb@lfdr.de>; Wed, 05 Nov 2025 09:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8064F465A11
	for <lists+linux-usb@lfdr.de>; Wed,  5 Nov 2025 08:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEACC2D0602;
	Wed,  5 Nov 2025 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sDwlARi0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDB7288510
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332010; cv=none; b=mnDF4+TyVG57u+Ye09hI8qrTCero1GVtHN4VXbXcV1gCoa03/z8tkrnirvcun36Ufbq02bfFAUtMu5aYwooeI9+DbwAmdJ355yJtCSPqB3UX7i4EF9x5JGXqmtW5RwjkXiAlP1OdUWiOY7OkgJ3jUgQry9MS/htR4TMdvw1TYqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332010; c=relaxed/simple;
	bh=Yc7l39U8VPA9CxOeTrmXsGQvRl35jenNC0+996YlJJE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uaMakRGO0YMjyH7W0/qT2VTXYq1j5xP9GoUQS0Mt8Mt9ajKLECokGZeEmTuSRffsiNQqcxEGxkZsfWsmLii4XCmTLu0x3t17x+vY0q5TuogydpX3m7Fnk8ULeZgVo6MRAkY0Xa2guDPJw/VgPSr4c4HyZBmJqnjEE/+MNTR58vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sDwlARi0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19BA7C19424
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 08:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762332010;
	bh=Yc7l39U8VPA9CxOeTrmXsGQvRl35jenNC0+996YlJJE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sDwlARi0uHirli0FFYRuQFWyyAY4IQSfPLMH/MQLNgfDfseMt7I2qXDzgyf0dQ8cx
	 Rg6OOs1/HnxBWODzrdRGxbACy7uXpCpg0j1dbRr+Avg2gCec9HAk0P3j/kPXbL1pah
	 myord13jCYyPL96LxlZOkKVGpnxWtuE27jNV1sA3q/0eRQXasWr4kjXhtkJjiH6Laj
	 QfjihY1y08801DxZBv4W7ufErqguyoLsZ9zef71fS6R/ttRpsN4T2U0lBnzBubNlQ4
	 g/P2xJUAjSPlQ6EdJ99ZNCvvtCbTEyvepdc4Ox6p02n+9CZXQuAi3zMYBannwRtgNA
	 gVC1GAGn0+Lfg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 15FEDC53BC5; Wed,  5 Nov 2025 08:40:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Wed, 05 Nov 2025 08:40:09 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220748-208809-tlGlo9sbcq@https.bugzilla.kernel.org/>
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

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #1 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Looks like you are right. I guess it means that synchronizing multiple
soundcards or playback/capture streams isn't working either? (If class driv=
ers
implement that in the first place.)

I wonder if this could be the reason for some weird snd-usb-audio behavior
reported in the past (repeatedly unlinking and retrying URBs for unclear re=
ason
when running full-duplex with very low latency). But it's just a wild guess.

Did you try the obvious?

+       if (!(urb->transfer_flags & URB_ISO_ASAP))
+               goto skip_start_over;
        /* Calculate the start frame and put it in urb->start_frame. */

> instead for example in drivers/usb/host/xhci-ring.c, function
> xhci_queue_isoc_tx_prepare() the URB_ISO_ASAP flag is correctly used

Actually, this function looks OK but it isn't called correctly because this
shouldn't be limited to CFC *if* we are scheduling the first TD in a new "d=
ata
flow" (xHCI 4.11.2.5). But on modern HW it seems to be correct, and if you =
skip
the earlier urb->start_frame overwrite, chances are things may work for you.

> This causes issues with devices that require a specific frame interval (l=
ike
> professional audio interfaces, for example the Motu AVB line)

Does it mean there is hardware which breaks when polled at the rate specifi=
ed
in its own endpoint descriptor? Would it still break if you insert zero-len=
gth
frames in the "forbidden" periods?

Using start_frame like that seems complicated and it's not feasible on Gen-1
controllers (no CFC). Per Documentation/driver-api/usb/URB drivers may spec=
ify
any service interval on per-URB basis, but this of course can't work with x=
HCI
and results in a warning. However, as suggested in check_interval() comment=
s,
there could be a way of setting different polling interval at endpoint
creation. I see no reason for xHCI HW not to accept that, even Gen-1.

> https://linuxmusicians.com/viewtopic.php?p=3D179979#p179979

Hmm, using the sideband API to bypass kernel bugs seems even more extreme :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

