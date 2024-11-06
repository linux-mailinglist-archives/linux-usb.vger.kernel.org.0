Return-Path: <linux-usb+bounces-17210-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF54F9BE443
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A24AF283CBF
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861CC1DDC3A;
	Wed,  6 Nov 2024 10:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQLcU5Yd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A83F1DDC0F
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888964; cv=none; b=doIEIl/WKZ8u3+jlWP62fQOvVA6rTTYiZdoortinaGy4rkWJpXaf5SnKMW+kZ4ay5k+CA1mK6NkjKOr40jZm+/G7bFGqNFf/KfgY0de4Vt7fB57L1RYBbYjKe4vD4CqW22Q+z3FNeGrehaygn3yA0x88xh9JF4c9/IjVClYpuEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888964; c=relaxed/simple;
	bh=kMffz4j9lOIyK3AO5oYIrDCOcuYXmzl+Hw6yByC3I80=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i8DkvRbHP9kwooixUfKJlSk+hamdb5i3yvzaFlNW9t+i8cMNVo30oXocLgmeNgkcxQudZa/IJaymzm208ENIK2+WuqRyE8mRSnU8idLXy1d7ADt3ooH2ISc45aSv0uqtYQhRUj7RMgSgZVxaPxK9iCrvbo/39w5NF9X+X60M+54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQLcU5Yd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 963ADC4CED4
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730888963;
	bh=kMffz4j9lOIyK3AO5oYIrDCOcuYXmzl+Hw6yByC3I80=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HQLcU5Yd4iBgJTrP5lFflHSA97uvmwIq4RPzCVTfEnYwDxU/dw9SngkzR5BUue3+C
	 8TA7HlJjUm2YpOHaNm6HX4uObtBg571yLg7Mq322glm5fE2VDgNIZxrkYHZHrZE6yB
	 +Iu3hRgYDoUaHjSS3rEpOkZ2XwUBnWqT3ZfbU58i+dNCmSRsZl1jLTy8yae7f5t5nH
	 CJ2yYn07QY57faopSEAfpIfw2e/M6ETgaMdydm3Rzgo8DJfgOPOyUUOZZfXeatsi2W
	 u7UXdSTb/jUpUQrpyB+6+stZ6+EWlTA4T5QUvyoh5fvIbbfGdfmp0HnlXyyZKhn6fV
	 nXmwCc79vDKGQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8EDB4C53BC4; Wed,  6 Nov 2024 10:29:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218795] USB4 / Thunderbolt + AMD: unstable and slow link (many
 uncorrectable errors)
Date: Wed, 06 Nov 2024 10:29:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: glite60@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218795-208809-zdEfTKYCMw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218795-208809@https.bugzilla.kernel.org/>
References: <bug-218795-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218795

--- Comment #3 from Eduard Kachur (glite60@gmail.com) ---
I guess person here is in the same boat:
https://askubuntu.com/questions/1531087/pcie-bus-error-thunderbolt-4-bridge

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

