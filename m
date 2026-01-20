Return-Path: <linux-usb+bounces-32552-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ClAF1fpb2m+UQAAu9opvQ
	(envelope-from <linux-usb+bounces-32552-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 21:45:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABE34BB30
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 21:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0918E5EE6E4
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 18:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2894657FC;
	Tue, 20 Jan 2026 18:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YnsHrFZ2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C584611C0
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 18:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768935379; cv=none; b=VIux89LHBWSG3VIOkVSbGS3g71v1rJbO6w2OWeXPJB3MOjEKobwyhsdGIiq3jO9OVbWtIbWubd04mdws5SKtXbYBtw9KMEzRLqe7LP6MhbfnbwI8DlK3dReHdBZgJDGlPn6O8MlMaQJiGdmSivvSrTkKBbcAlECTCRmB02X0D1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768935379; c=relaxed/simple;
	bh=YzsvPZOV2Bc8vFFgj1+Muy852M5XiqqtHZ7CenS2No0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RqCcrolAV6EcsU/tQXoxFOyk7J8mFgyK7MauNnAFiwmked085U+fnmxDAW4SZkYX00OfrK6HAwHNsyIbywRclxZk63Y9/CftDtA9T/5e674mlZAh1G62JITbf2Pslzy1TNo33HleWOfm3QJXiUfSytKOl7REd5+bmk1cnuNwxyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YnsHrFZ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29513C19422
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 18:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768935379;
	bh=YzsvPZOV2Bc8vFFgj1+Muy852M5XiqqtHZ7CenS2No0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YnsHrFZ2Bg+QZMCDdje+ewLiLIyElzECCUroSCBdDwf7fourlfZu6SVzBWkRbKRpz
	 /c3tpcE6bto0YVXr3jRuEG9ATeHUIH7WKQuw0kGQvi8JMkD0fiKc/XUwKIWbc8WQYb
	 B+5njnCYl6vHKfgQaOxCFS/1O3pfW7fi0UOGzIhIaaNEeA/iDhYl/U3budSx+OU44j
	 W/Qzq+fxJultfVfULDB3oFsYDNP5xXB79/bHovy7gsBn+Yht6jVg5TND+5PfoKKHY+
	 34LknbPewzbmqInQ0J1kUt+U0PmeVUIrQc27z/JVLYuwrhkX29nWNtVALw3t6wXmam
	 UaIW2NdK99MOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 21464C41612; Tue, 20 Jan 2026 18:56:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220904] [BUG] ucsi_acpi: USB 3.0 SuperSpeed not negotiated on
 USB-C hot-plug
Date: Tue, 20 Jan 2026 18:56:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thomas@jetzinger.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220904-208809-S7i6ZhOzhv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220904-208809@https.bugzilla.kernel.org/>
References: <bug-220904-208809@https.bugzilla.kernel.org/>
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
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32552-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,jetzinger.com:email]
X-Rspamd-Queue-Id: 2ABE34BB30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D220904

--- Comment #12 from Thomas Jetzinger (thomas@jetzinger.com) ---
Thanks for the analysis. Happy to test any patches you have.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

