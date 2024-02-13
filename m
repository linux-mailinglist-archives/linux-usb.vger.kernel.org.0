Return-Path: <linux-usb+bounces-6367-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C8C8538DF
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 18:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2024028344E
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 17:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511395FF0D;
	Tue, 13 Feb 2024 17:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFl9KXol"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD325FDD6
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707846387; cv=none; b=OJhzXjS9suzhdA3fYoE4LaObmAHQw2mdVPwGJZK+1CRizW3FFX7gxPILIrco2pkQZMX1Yg9gtIfnpvK26fbeyJ/qfxdvOOsD+Dz7jWFLAINBU9Jdbous45lFhnBzss+1bosWGZaqeeM3xGskp8TXAOGfYPJEf8l5X+b0HFcT+sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707846387; c=relaxed/simple;
	bh=uy7+zHVmw9IFTKfIZ2R7/UbDsDsC0hi+4zuuINF1ojM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lSqrPoSuKdN9/7IQKJvA8kc27faTsiMxUhizRdZhF2bWX46TVDGTYWELTaO/Ki3sLAf8rFqYF0/Kv24Kr6xwVveJ+reaOXx1xKOBiXuWT5lOVvLFQVRLhFhzn0EePekzZ0gcS4YDhSLcZLgD19B8ST/mxhW2ZCDSHeRVlfGOAgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFl9KXol; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B5E7C43390
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707846387;
	bh=uy7+zHVmw9IFTKfIZ2R7/UbDsDsC0hi+4zuuINF1ojM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lFl9KXolJUGDe6IFXY/vMJMqpzQKnLvm+jI+C7KYNblgDOr3SaetAvTjy6JGvuKvh
	 VjMuh+pzq0OtvE8m06ydFfYyelSl3tkQZuPwdoGe9q6/2eFUFycOznnl4l4pP5Y6SI
	 aBdjDCrPXTyCS6AyxCyO4nDCsnd2chCcb9pxYgkHNhwzKkpHe5lkFi+MXcwU5lomp6
	 FRGyeH3gsQs7Km5UkDSjqKKW5MNrhzeysBb+5MEGtoJpsIPHtTj29g4sQqkOipLA0u
	 c3Le8DETSfNKBsFw3Q+IZD7IL8tp24grkf94Fqz2QyU6qwlGY4/Nk+CSvuHGZ+78Xt
	 Rq217eSU9+sxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3BFCFC53BD0; Tue, 13 Feb 2024 17:46:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218487] Linux warning `usb: port power management may be
 unreliable` on Dell OptiPlex 5055
Date: Tue, 13 Feb 2024 17:46:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218487-208809-8Arso7gqev@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218487-208809@https.bugzilla.kernel.org/>
References: <bug-218487-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218487

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DUPLICATE

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---


*** This bug has been marked as a duplicate of bug 218490 ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

