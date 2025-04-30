Return-Path: <linux-usb+bounces-23585-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8840BAA4EF4
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 16:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0F511765E3
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 14:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F7713E02D;
	Wed, 30 Apr 2025 14:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzRqe9By"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C33C136327
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746024387; cv=none; b=IUyg6UxtFuwAKJHV4ubnhYMnNHRVUlQD4R4su1GtAVvMMKsngtJLexTz9FLYiKuvA6Xqx9vcMocdwFlMnbBxhUOFFjSME+B393CWzi6IvRQetvWhwd0xQOol1pxA+wcCGqQv1QNQ+yrfYp1eGyid5ouWFLORj9Fi12M5W4qNrIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746024387; c=relaxed/simple;
	bh=ETPiXZodnkQZQ9hG6EfJCi78TAtdICp0dCyka0S5hwM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=igvDgjRJHGk7QwtzO36O2gbr2gaDW1td5lI3SHu1aNgx4XSneh3HlDWl2Y7vC00RINDyLFZbTSHvwqKepzIj811kCJ0E3u0paJHhotau642lC92wK1LjbQxIW9u3q48fVIZctGE0tt22SNqizuOMvDOQnPvhmmhB2gikM5WJSws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzRqe9By; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA590C4CEF0
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746024387;
	bh=ETPiXZodnkQZQ9hG6EfJCi78TAtdICp0dCyka0S5hwM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fzRqe9Byc9vYlc5eSwYPVKruYaK0fx7H1YOCeZ//1Kw8BcDlKrXp+75Z1e+lJ9967
	 Rg8LyINj0AUCYpQuY8uOVVODqYHnKmqB8nuZ4JNwDZ/VrOWQwx4Yn+kf1mDZnQt4aE
	 3sDgX/XK1ZvHWLIg9LzRj3WaJ83iHiSxzM22By2llyNI5TENmz8263vYwEUnAKAbie
	 IjB0i3Zu5KC4jzhItDvrgN8G8HUoIGAx3JqeGCZacyQjDaqDVTNlHDjsd+Hr577LTz
	 c9eUS26AbLIuBkZW6w9DHChlaPlDBSmnV2NHHtfqJPQpb1IqZ/NBv8EYdFtu05COAZ
	 oQYPC3YLIx3Dg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E16E3C4160E; Wed, 30 Apr 2025 14:46:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Wed, 30 Apr 2025 14:46:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stevenfalco@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220016-208809-xuMUVa3fNZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

--- Comment #31 from Steven A. Falco (stevenfalco@gmail.com) ---
Created attachment 308061
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308061&action=3Dedit
Test with 6.15 rc plus two patches

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

