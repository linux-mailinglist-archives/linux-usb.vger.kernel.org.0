Return-Path: <linux-usb+bounces-26604-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 436DFB1DFFE
	for <lists+linux-usb@lfdr.de>; Fri,  8 Aug 2025 02:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CDCAD4E0615
	for <lists+linux-usb@lfdr.de>; Fri,  8 Aug 2025 00:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CF41F949;
	Fri,  8 Aug 2025 00:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q3QvhiQk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6266ACA52
	for <linux-usb@vger.kernel.org>; Fri,  8 Aug 2025 00:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754613901; cv=none; b=V+n3FARf20W1EAumuW1/Y40r8U2sY1db/EBi6y8x1WCamFo6uug2EHgXAPoxUqNV96JnXL1NdgyFGhoiU+rSWtE9Ef6b1rivnvPaYOjwoHCrS7iXNTAntqUCdcE+wGo0nGaN+s09PjhJCrtN4ZW9hGzVHBXAuYAMbi4tJWg+MWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754613901; c=relaxed/simple;
	bh=L/URCQnX/m7knHBLxzgAaMCU053TqL3zf7Kl0navhKQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CS8cNkcO2ocRC3R21o8D+2d2oAfzZHFgcMkLH6FDRDMvQUIhn8XmqcyBYSrkmYXPboFxSee2dcYDsANM9YMVTTEHwQAdVdh5U46BEWXG8ZskAI8KKJhpVTO3FeD7s3R0K9i2tufEp9tJvJa2N/flvGf6yCNpNs6Mx721p+NsYo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q3QvhiQk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F049FC4CEEB
	for <linux-usb@vger.kernel.org>; Fri,  8 Aug 2025 00:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754613901;
	bh=L/URCQnX/m7knHBLxzgAaMCU053TqL3zf7Kl0navhKQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=q3QvhiQk6jvdyRlZjSbHDKVTx8lsSDKzXdmGCS1KZR1Zx2RA+CIkxMNWE98S1G7ar
	 Hiydz2CLPltnpVrjMzRltr6OxDsbkEZEexKiZ1i0pabKGQcZmjJn1v+qaHpJLjWKjf
	 yCTt5+iaqfzWWE5+xdBfEhXi7SssbWf8M6OMi81hJMjmpqpIYyyTovuvpiXe3oL/40
	 nc0NvC4IX88kzuj/swEjxAqgVf/MUfnoz7riQ20v+kksI9Vg4e+AI3KJcZN6Hn+Qsc
	 wpD/k3jNy+XDlLOSVnvqqUOADTDE76oRwqq2KvTh3tM185se8UqweET8SFc9o/2VuH
	 Zf8czNBM5A3uw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DEE14C433E1; Fri,  8 Aug 2025 00:45:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220422] USB: Misdecoded serial number from Dymo Twin Turbo
 (0922:0018) breaks multi-device support in CUPS
Date: Fri, 08 Aug 2025 00:45:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: steve@groesz.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220422-208809-0US6OIbmpQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220422-208809@https.bugzilla.kernel.org/>
References: <bug-220422-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220422

--- Comment #4 from steve@groesz.org ---
the easiest (least code) fix would be to drop the first two bytes and decode
the remaining data as utf-16-be (big endian) for affected devices. This will
yield usable and unique values that can be safely used by upstream tools.

I don't mind writing a patch but I am struggling a bit to understand how qu=
irks
are written.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

