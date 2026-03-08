Return-Path: <linux-usb+bounces-34225-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG3mMm5lrWlp2QEAu9opvQ
	(envelope-from <linux-usb+bounces-34225-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 13:02:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE09230195
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 13:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 543E930E03A4
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 11:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CECB1289E17;
	Sun,  8 Mar 2026 11:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m3IVNvXO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1FD27F749
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 11:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772970463; cv=none; b=Q7X8zSUHhnR4leD5tL+RuYPAiW2IqaUygqKpbGFhAsLmxkGYEysN75RWYU30OyDVizQPYPf4kY1us9OF7jHACh97rARwdk3c3V/sjpRxGQ9mZOGmVCWCUlkf7PF+AjjGwsZO90N8wxcEFUpx/iBslpACPhrrTWXzaT769WJdiSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772970463; c=relaxed/simple;
	bh=8YK8p5kfmHmveYxQYTvTXtMT2hlEO3bGFLReMqW+v9s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mmmqs5l0T2MYUljC1yyji+89Ca5sy/6A87oCULSNfmDBr5MWuLMslnyIK4SL4+tklcHsdE4j3GTTPVUNVCi+U31jRbfiWFND4oNzPCys6RV4wZxdptlF0o9jyy/Xw9Ke6M0vE4qw0nf2LrXmOo/z/a5lalqmvgMIUiA+b3Yuo/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m3IVNvXO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2D3CC2BCAF
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 11:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772970463;
	bh=8YK8p5kfmHmveYxQYTvTXtMT2hlEO3bGFLReMqW+v9s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=m3IVNvXOqAycH7NNpMbfKOPqYJxGIACQSH44uhFBoZ9u4uVCgXOlqV1uiaeppNpxr
	 SdlMlbZiPfID3F3XztMdSR2f3A0WpI7uyN6VXVjWG0G6yRnVpcpVruy6IwE4N+7QXi
	 HGVnQHuSJHq2q8EQQCL3XCTm9qPbVqMZyx7g7pVu/j3ADWYWB+djV26uFwVDtJvZG1
	 l3bbG2aXdt6t/OscLLIJQY6TTVlDq4o6TVP+LkT56iSTQVoBvDjr9gPPAnTX7Cdmp5
	 PHlepXiN+S1W27LIFKRKTFAOQaXo1G4Fna4e0qYQnBvQAvHtPzUW6rDhtDHRN3R/Ow
	 anQfUaTuOBecw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E7190C41612; Sun,  8 Mar 2026 11:47:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Sun, 08 Mar 2026 11:47:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mitchell.liam@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221184-208809-HkmQ9nCqpF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221184-208809@https.bugzilla.kernel.org/>
References: <bug-221184-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 4BE09230195
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
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-34225-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

Liam Mitchell (mitchell.liam@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mitchell.liam@gmail.com

--- Comment #10 from Liam Mitchell (mitchell.liam@gmail.com) ---
Thanks for trying it out!

I prompted a script to analyze your logs, producing the following:

USB ACTUAL OBSERVED DATA (Total log duration: 117.8s)
Times are in milliseconds, formatted as min/max/average
Interface  | Errors | Resets | Submit-Error | Error-Resubmit | Reset-Submit=
 |
Total Wait
-----------+--------+--------+--------------+----------------+-------------=
-+-----------
Ii:4:003:1 | 36     | 12     | 16/5678/814  | 16/458/67      | 93/221/144  =
 |
2430ms=20=20=20
Ii:4:003:2 | 33     | 12     | 18/4098/859  | 16/457/70      | 93/221/144  =
 |
2321ms=20=20=20
Ii:4:004:1 | 32     | 8      | 38/2973/855  | 17/291/70      | 93/99/96    =
 |
2245ms=20=20=20
Ii:4:004:2 | 30     | 8      | 2/2139/354   | 16/277/38      | 93/99/96    =
 |
1142ms=20=20=20

Legend: 4:003 =3D Novatek Microelectronics Corp., 4:004 =3D Logitech, Inc.

It shows 20 resets and about 2s of device downtime in the 2 minute period.

I then prompted for a script to use the actual submit-error times to estima=
te
the resets and total wait time for 3 models:
- baseline: current error handling, 13/26/52/104/104ms backoff retry, reset=
 on
error at 1-1.5s
- 500ms tolerance, the above with my patch ignoring one proto error every
500ms, resubmitting immediately
- 200ms tolerance, the above with shorter window

USBHID ERROR HANDLING MODELS (Predicted Resets / Total wait time)
Interface  | Baseline   | 500ms tolerance | 200ms tolerance
-----------+------------+-----------------+----------------
Ii:4:003:1 | 5 / 2280ms | 0 / 507ms       | 0 / 117ms
Ii:4:003:2 | 5 / 1994ms | 0 / 507ms       | 0 / 117ms
Ii:4:004:1 | 8 / 2007ms | 1 / 512ms       | 0 / 195ms
Ii:4:004:2 | 8 / 1903ms | 1 / 382ms       | 0 / 143ms

The baseline numbers don't exactly match the actual but it looks close enou=
gh
to me for comparison.

It predicts what you reported, has positive impact but doesn't fully solve =
the
issue.

Try modifying the 500ms to 200 or other and see if there is a noticeable
difference.

The window shouldn't go lower than 100 or so to prevent the system being
locked.

Somewhere there is a number that balances making unreliable devices useful =
with
protecting the system from locking and resetting devices that need it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

