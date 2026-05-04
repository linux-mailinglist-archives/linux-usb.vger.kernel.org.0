Return-Path: <linux-usb+bounces-36907-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB70FXox+WkG6gIAu9opvQ
	(envelope-from <linux-usb+bounces-36907-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 01:53:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2574C4FC2
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 01:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 805D53011371
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 23:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663E33FBEA8;
	Mon,  4 May 2026 23:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHG9PL7+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AA53FB079
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 23:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777938795; cv=none; b=Rsu5Bf2naUBEpqyY/ifNCMBE4idtdXECLenhcrHVoA6weMgc/LhI/epZsNyLWswIOwMIXpUSYGJNCRdzNzdpw53kpgMFmx0BhYMtuvdyKyWSlWVIDwOl/F+ya9vp5cVCN45kouQQzSom+z1mVkFKoZ5FlZz8pgkN2iLUteLGijI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777938795; c=relaxed/simple;
	bh=aECft6KFv+WZ1W3opPxMAbokLJEOv7t/N46KrTV5aqw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S+BO6QRnxKkffvhQEi3w6ENahl1/BCzAXayyiPQwCcRQJHoOwRQIlNKp9X1EC3uURRE1dKtUjKZkmyfYgq+ojFQPmBZpDIAEbd/YcB4KHb6r7I7Lg1NskhUZA0IUxv1TtnmqVyBeE8IyQzN8Z8oc8qptDsHgba+86HGjHlyQyic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHG9PL7+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B0FEC2BCF6
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 23:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777938794;
	bh=aECft6KFv+WZ1W3opPxMAbokLJEOv7t/N46KrTV5aqw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PHG9PL7+YzFNtItXPnnp/Bf6Qbgr5VpDG/RAhu3qJWH85L40hxFLKHnFL5wLRWXPh
	 RNx62asPOlS6GyEVc8doSLAO+WfEFxYV506szWDYpGIswexTS6zJOtgLxko1Acjh/i
	 TH9ohuE2RxPDaRKHPaDINFEjA7WxEywYdS6uHMrSnpr8isixzY/tQgM6pznAizpvFT
	 ouSRlC2hybdGbaZoqke6fKRBYtXOAxbX2iv0RNefihLI7rfeEY55wj0ET+U5/XfrnH
	 x+o2GKqPl/+Ac1AGO/1kvG6LULU896VYmBi8SE0rqLVc8j4593sUthFs6+qYocckhF
	 GVin4dQcYplLA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 810B7C53BC7; Mon,  4 May 2026 23:53:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Mon, 04 May 2026 23:53:14 +0000
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
Message-ID: <bug-220748-208809-BP5uidtqo0@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: DF2574C4FC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36907-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #18 from Nicola Lunghi (nick83ola@gmail.com) ---
hi thanks for all the suggestions!
I've finally found the time to work on this and I submitted some patches on=
 the
linux usb kernel mailing list to address the issues on the usb audio stream.

https://lkml.org/lkml/2026/5/5/59

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

