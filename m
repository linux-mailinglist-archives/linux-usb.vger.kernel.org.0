Return-Path: <linux-usb+bounces-12817-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0319445B3
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 09:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08B072846DD
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 07:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC54816D9B4;
	Thu,  1 Aug 2024 07:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXTOx/To"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4636713C8F6
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 07:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722498104; cv=none; b=rtTdCs/G4umt+yxeSScCxy24NR3x+svZwzVyOiiCHWg5R4sbaooojsjBzUlTjzNkkwDgJ+3vRjXKaQ8dqX1ND+EQm/aigk7i5cOaDWUIlLt177lJEe0xrIHef413d3Cq867sui5XYZ0BVY5mXvixbyZENWagWUhD7jxoZAKBskQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722498104; c=relaxed/simple;
	bh=YSrPguc/OUm3k5+jtTuGTYoF5dq2i/bAhC6ZKGyVDHw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nqM848xkpryOrP5VqcyGVZ/toDKnVrKJ+lbhuZJOoGjYi859PGRcT5QN+lNY3gjF/Io3jW4GLDw4esOacs9/mA+ue/uT0mHfAwtTbyjYNEUTnhyIfWmHv7I8B6fjeehSpf7JvNrd0cXTk2jYDvI1C8q5hcP5nIgLTHNTe6K4Ypk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXTOx/To; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5651C4AF0A
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 07:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722498103;
	bh=YSrPguc/OUm3k5+jtTuGTYoF5dq2i/bAhC6ZKGyVDHw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eXTOx/To6Hef2uBZXJWbWN4diSYp67QM9EgPAyCEJd/PgbGLaypobQJloGGYhheyS
	 uBZInS0ViV1fHz7ATU7WpPAjoYrhaKShZ5+X7wVUJyfEzekmwXk3fryMatnchWs+fA
	 6RIO4gHNERgdMvi+/gs3WvZl27H1cL6gFHOz+jTWSje2zBTbpPT9ZRXJ7wyTrtpTKl
	 grX8I6dCR3XLD6g3+ISewNR8DY2TkHGaiUD8ixtSL2nRfRc3wCr7iAYmg8hTqplGES
	 E6ZgxSBG8qVfDEtbqVi24c+P+yAN247E2Lz97cvoc4CkqDUWtkXL2aXStTM2Yz02YA
	 K4ap0Vyy4NMHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A04C5C53B73; Thu,  1 Aug 2024 07:41:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Thu, 01 Aug 2024 07:41:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-xVlppgzwWr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #15 from CH (com+bugzilla-kernel@c-henry.fr) ---
Hmm=E2=80=A6 The patch is not working but it doesn't mean anything. I think=
 I messed
something up while compiling the RPM. Can you confirm me that this patch wi=
ll
end up in the vmlinuz binary? Can I add a print statement somewhere that wi=
ll
show in journalctl or demsg that will confirm me that I am indeed running t=
he
patched kernel?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

