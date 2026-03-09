Return-Path: <linux-usb+bounces-34327-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eG47ODoYr2nHNgIAu9opvQ
	(envelope-from <linux-usb+bounces-34327-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 19:58:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6026A23F03B
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 19:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C83EE306222F
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 18:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBD93ED5A7;
	Mon,  9 Mar 2026 18:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITkoIDsx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921DB2D592F
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 18:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773082603; cv=none; b=ZYOnDGjg33RrM0JwP+wr4y1LWMH0T1RXY0nNR+LX/phObk8C/BmC2EYrqKWcHQboVJH9PhVJMxX7s4eZ/D9aIwCqwxzqIxW7NzcyR5Edu9PMw4TFvmC4mHimdrrBYnp+utoUeKcPkGNfQRuJPpXjh+SGTznZd2IWGdcmNiGLzqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773082603; c=relaxed/simple;
	bh=/X7tVA1DNQc38BJMBj8urWlnIkKauQPd6LDCrlfEuf8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mudFC9T7YwuV7iFle+qM89EzeoX3Zjj53WFHKmCaXeV7Nv2cuumrVm/JB/wEdVlB8canUBUcRsj5/Cp5UZs7LxEEmzARCryPtEojAFUqApLmlZSofZtx7taa97MKXtkXlMI2BAxSNpQdCD9gc2Yk5NZjqd0kt7lMXYLjT1ZoEzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITkoIDsx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FE55C2BC9E
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 18:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773082603;
	bh=/X7tVA1DNQc38BJMBj8urWlnIkKauQPd6LDCrlfEuf8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ITkoIDsxpl+oiz0scIGnYbx2b/TEVeqro+bAth3Be/Bx/+bIDjWRnt/P0OO1pBdBo
	 dnoLCAWtFFS2/UWMLwtDCIJT6GxXc6Fu8ULm7ImXHXqo3rw8k9CsSjUQ6YMMnCYyAV
	 cQbQeXF6Sz3ptqaqdgpQHgHkqm9/FtplGpJ+fjxNh7Pz3uMZvtr44/0bdMmiAkxnuc
	 HA8Ipu2FpsIysLzLCe2Jwj150WQLxGACIo3pP8wUMFO1OYnuwsnJ5W3IKMqa5j8Z1f
	 erBoPupdvrL3yUeUawBIRmfN8DOzPxSnB/CYWS3nYeUUeU7v6CZR0iKcmPQHWgkpzT
	 G019wSyMbMrWw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2029EC3279F; Mon,  9 Mar 2026 18:56:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Mon, 09 Mar 2026 18:56:42 +0000
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
Message-ID: <bug-221184-208809-xwkX7358ey@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 6026A23F03B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34327-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #27 from Roman Elshin (roxmail@list.ru) ---
> Thanks it seems to work!

It definitely work! - i retest patch after git reset --hard; git clean -dxf;
git pull (and "can't resubmit intr," errors are here)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

