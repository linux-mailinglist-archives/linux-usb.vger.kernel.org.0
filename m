Return-Path: <linux-usb+bounces-34313-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF/oNGrprmnIKAIAu9opvQ
	(envelope-from <linux-usb+bounces-34313-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 16:38:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB1223BD76
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 16:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B341305C09B
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 15:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014C63A9DA4;
	Mon,  9 Mar 2026 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lVJBvte4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843B9389455
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 15:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070274; cv=none; b=iD926HB/kyULG4vqLZ1K6ZJEnfcbTSdyPJWEorRfSwrZpMhivAdGzwYnRRtd4439AleTsC+sGVWosYpPbEDKg4/OGapqsVLmnY8Ro2Ns1dFNNyksd78wULl7ugiBcp3SlkFR5QwtJlQFNICtORob8k4dbGYFUWdJCYxZZJHMI3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070274; c=relaxed/simple;
	bh=hvwsUBHMs1gq67ClxJSTKo8g0/qoDpwYS1WOakOPpe8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mgowl97MJmpDxutdBcun4vw43BSgqIk5n/S07e4Bs5ZlI2sHsCwDV/rkkUFObyb7ZO1qb/rRcXuJ9k5mHnxDAMEjrOFqYRcsn3WeXZgb6kX2yzncdlneFq6JsKw03qzggpfuHmiuH0ARIDAY7VbjyjvGswulyT50Ne9W2UM0nYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lVJBvte4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F2D2C2BCB1
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 15:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773070274;
	bh=hvwsUBHMs1gq67ClxJSTKo8g0/qoDpwYS1WOakOPpe8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lVJBvte4qGgNaJH8g6yoKKQzgB9hJQdG9Vi4QIs4yPqVZD4AJQUmz39isVum6pDJx
	 dBj+XBpic5B3uSfAqvou4JQbWR9Ouot2KjLbvNBlJOpyLyZ58PX+UHc0tm6ciRPIhA
	 XI/Bb+JZpYwGLNk+/qMHStY8xUZYoCfT2N0smupX1/wNCgYSRJU3o5H4Wirnx1RyT/
	 8SH5jMD10JLloSoL1DtkWcb7J3ev/LGXwUbtJv8ZbD5ygXl+D633NK0FQUq8Bi3CQE
	 R5KCFXfRJfKwxotqjKerDz7Z0Khk00RICMGdTlZUM9RMJOH58VYmVr0oHsOpId9B0u
	 r69ftH5+JGbEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 08EFAC3279F; Mon,  9 Mar 2026 15:31:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Mon, 09 Mar 2026 15:31:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roxmail@list.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-XKWH70Ud6a@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 3DB1223BD76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34313-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #21 from Roman Elshin (roxmail@list.ru) ---
(In reply to Alan Stern from comment #20)
> Re comment #16: Consider what will happen when (token & QTD_STS_MMF) and
> QTD_PID(token) =3D=3D PID_CODE_IN and QTD_CERR(token) are all true.  In t=
his
> case we want status to be set to -EPROTO, not -EPIPE.

yes, but question was about is it right? (as it broke my mouse)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

