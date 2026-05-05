Return-Path: <linux-usb+bounces-36911-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O66L35E+WmX7QIAu9opvQ
	(envelope-from <linux-usb+bounces-36911-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 03:14:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EA94C5B4B
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 03:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB993301FCBA
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 01:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D7435A38C;
	Tue,  5 May 2026 01:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLYNFMNu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565FA78C9C
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 01:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943654; cv=none; b=C4TVZpIGE5OAE5eQTJ+LZbqLA1GhsZiXoYaxjaTcXh7ABA1Noipcn5dxLRlkTXb9vXzi+ECnmwfvSPObWYPI62Yi1LY+qJ3jYvshdOFPj2TGm3EbALxoNBp4vwYN4nd8RDA8VP1dzfW2izonOPHrYJEd7zl5y9b9Mw2pJAI37no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943654; c=relaxed/simple;
	bh=m9aY/GKziQKHpNNrC60lCTHfYLTyJbRmsAHN/TdUAd8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WZUCZo8uRmNraEo/kINJiTXPUDJJJJCFywvmhufyGosvfWaq7f8+Gvc0IIs2VV8fPhWaXMDYvY/wQmWUeu5OJZ96wh8RC7gAbNkZ9MgaEpLM0G1VgqiV0Idl9ChIqmjKGob57vz1wsgZJ9pnmghM0Q6aZ+sFCJu33ADZi/Gop6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLYNFMNu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEBD1C2BCC4
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 01:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943654;
	bh=m9aY/GKziQKHpNNrC60lCTHfYLTyJbRmsAHN/TdUAd8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gLYNFMNunDtLxjfv+OG72qAzIXWq44SzrhfNoP8yUvkho8OBvY6TITfaGGq3ySoOV
	 0og/OTEsO7nfFI9l6YMW02Uw2tpLmUET0n4tgAiNreTm90KNJrHvGDFezn64bU4Wr8
	 XP7zeo/MK7qXICQ0CkfqTXIlbCAfJVWTFMflh22CzhOw7wnWSiGUb1L7ngvtojrBPG
	 ykgvoH3MIHaVUcCF219Es4ZsHHkl6vKR2mHsx98cja1Tot5s2LS7nWMUHRzT5kL079
	 VPbrYK8j+UTgJ6Sql6aZpukGqJmO2TVyHXK7HPjB6WArB77fKHVA3Nq2yYX2RxuwJO
	 4NLhEuYVKNl+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E7491C53BC5; Tue,  5 May 2026 01:14:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Tue, 05 May 2026 01:14:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dylan_robinson@motu.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220748-208809-z2OSCj8dhp@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 58EA94C5B4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-36911-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

dylan_robinson@motu.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dylan_robinson@motu.com

--- Comment #20 from dylan_robinson@motu.com ---
The issue, as it relates to the MOTU devices mentioned here, is that after
enabling a non-zero alternate setting with usb_set_interface(), once a tran=
sfer
is sent in a service interval (zero-length or otherwise), there must be a
transfer in every subsequent service interval. If, for any reason, a service
interval is missed, the alternate setting must be toggled back to zero and =
then
re-enabled, and the stream restarted.

MOTU's drivers on Windows and macOS take advantage of the ability on those
platforms to schedule the start frame of isochronous streams sufficiently f=
ar
into the future to ensure that enough URBs can be submitted before the first
URB completes.

On Linux, I have found that with snd-usb-audio, it is fairly typical for
streams to "stutter start." Because of the ASAP/SIA behavior discussed abov=
e,
when the first URB is submitted, it can sometimes complete before subsequent
URBs are enqueued. This creates a gap in the stream and causes the device
buffers to fall out of sync.

At one point, I investigated monitoring the start_frame in the completion
handler, but on non-CFC controllers it was not reliable (there were many
duplicated frame numbers or gaps that did not reflect reality).

Although more recent MOTU devices have improved buffer management and won't
fall out of sync due to missed intervals, the ability to specify a start fr=
ame
is still important for reasoning about the timing relationship between IN a=
nd
OUT streams, which helps guarantee consistent round-trip latency.

On non-Linux platforms, we have found that as long as a sufficient number of
transfers are enqueued before the first transfer starts, a missed service
interval, even on hosts that don't support CFC is quite rare.=20

> If drivers want to insert a gap to resynchronize after detected lost pack=
ets,
> I'm afraid that's not supported in the current model.

That would not be necessary for MOTU devices.

> I wonder if this could be the reason for some weird snd-usb-audio behavior
> reported in the past (repeatedly unlinking and retrying URBs for unclear
> reason when running full-duplex with very low latency). But it's just a w=
ild
> guess.

This sounds like an issue I just started investigating. I am exploring the
possibility that when an isochronous endpoint is restarted quickly on a CFC
host (all URBs are killed and immediately then resubmitted), if the new URBs
are submitted before all TRBs have been dequeued, their start_frame values =
may
be set as if they were contiguous with the canceled TRBs. This might be cau=
sing
the entire batch to fail with missed service intervals. This then happens o=
ver
and over again.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

