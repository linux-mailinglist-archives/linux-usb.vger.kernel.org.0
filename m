Return-Path: <linux-usb+bounces-36379-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JzOGYIy52k65QEAu9opvQ
	(envelope-from <linux-usb+bounces-36379-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 10:17:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8459438013
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 10:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 204A63015709
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 08:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7AB369224;
	Tue, 21 Apr 2026 08:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQSZFRHC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C9A1C84A2
	for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 08:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776759421; cv=none; b=WwFeSXdzVbJoQYrdMniQdobeSXkYNJH/qovQsUcVVmNZ1w4kLBgEdQ+xVA4HJkJ+zMO5MwtNqjdmLFH//IWxDwAKlmWILpgW8bE32cJbwgiSNy+4N0qcj+t02QJJ46PjUgRisyYdLjnuiRjrKd76OtI2Tl5Scm2TWLT0zr0arfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776759421; c=relaxed/simple;
	bh=mOlbrcYrF2EnRyKpV6mgKXkQT4URK1oilMMIHrTsUCY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MJfzSpQRHXuHOr08bCth7RCP8VLW9odTPToWm/T0EoKGXM4722PJeBhyGMpNutxtRbM6L7OvGJmnfsGS2FXurRy5flFd7Djlx42p+YDjzsZb1A5q8zE6IRZfRXNtqJstnqBHCyok3KB2TFzu949P5hooHkTTV4Viqzw+af6aDjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQSZFRHC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CB3EC2BCB0
	for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 08:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776759421;
	bh=mOlbrcYrF2EnRyKpV6mgKXkQT4URK1oilMMIHrTsUCY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QQSZFRHCiCpgBuP6RLiBMdQOaByZWLlazPjIXBuWY+xcyON4VHOG4TiwguoyA0SDD
	 9RnL0kSAnMzgBIUOyFtyrgqVtrcZs8L3hJVfi2DWkAXQ8AjiYPEb17y5YQ6wAAf/Wm
	 SojlZ2T6e06cO9wQzbxh6G6kSts7YzR3SDAR0V5/IqtR2fALxhj5x26qlQ0XqckAdh
	 f00mDsOt06xZwFYts6TytnUOT9/I8l7IKBzE76hwpmGecBQTkXcQAPuT0LSgkkLNUz
	 5vYH68uCtW1+4815CBD052Un/FSOtobZ/ghy6lsyUCRjtMyvONcUeooqLbBsYWf9fV
	 snkN6VSkNxjvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 32229C41613; Tue, 21 Apr 2026 08:17:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Tue, 21 Apr 2026 08:17:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oliver@neukum.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221340-208809-DmVNoFDVX4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221340-208809@https.bugzilla.kernel.org/>
References: <bug-221340-208809@https.bugzilla.kernel.org/>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36379-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,neukum.org:email]
X-Rspamd-Queue-Id: E8459438013
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

--- Comment #14 from Oliver Neukum (oliver@neukum.org) ---
OK, it looks like there is a race condition in your device's firmware you d=
on't
see under other operating systems because they use a dirty trick for command
abort.

Would you be willing to test some highly experimental kernel patches?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

