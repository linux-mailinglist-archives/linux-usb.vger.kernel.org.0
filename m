Return-Path: <linux-usb+bounces-27315-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2F2B378D3
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 05:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3DB03632B3
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 03:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41752E7BDA;
	Wed, 27 Aug 2025 03:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nb4vBi/8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B71129A78
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 03:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756266550; cv=none; b=iw2o/aIwzhfz6VXhRNrLpV2T5QOdhIeZMXeto0m3MepoTr0TZL63A7yiki1GVy/GuaiCtMw+1LmkbBn+bkOEfaUUOAPOd925ukiRjfDx/rBwZ8RE/VBA0/inzRaQFvWZIpAAyP736CwBrNImJVWcJhtd384OBEkbJx2CjC0KrMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756266550; c=relaxed/simple;
	bh=gp3p0yVPlJTYJQrOqcbYMNdyjfKYNUlWvqGR6g76KyQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RAuGHrTaeqB2hrLIVO88McFtHLX7hLDnMo82KJgD+vOat6sYmOQW7250B4X/gYWRx88iNA7aOr5lcFbHqrqKcSD3RIl7WmFzk86bPawwtu2a2g//Kdnm7XNipdxAhs/q0qrVgsRkGBfF83Pauvt/XVhZ0hrzBTEkLe3pg/5cDL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nb4vBi/8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2C0EC113D0
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 03:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756266549;
	bh=gp3p0yVPlJTYJQrOqcbYMNdyjfKYNUlWvqGR6g76KyQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Nb4vBi/8jChKdFHSqJBUREHq2Ffm7vFZNEuuR+6TrdRfyhPlgAKBp+i+okgAY9Htd
	 6QXSPx1/PTRVilVmpjyQpdEuQdVIkEAPimkW4fWaNxXWVflQCdYlFIs5cYynJul60B
	 8B/G+LcsdCISRX8JH4d3q+VtOaimfzrcmqKX+vRp9n6R2wpS4P1DJnd7RVUeO+6mub
	 e/BVaSCFkXD/Ze7iZq9W29jqkA/vUzHb1qdSDQNbYKZA/Pgz8MOwFqv0ZNSmHfLudz
	 E8fG8Gqk9lkTrU2aLbg85fkS/lsCIk0AkU7bP8i153AOtv6F189+cdV7b1H58tEWyC
	 GwL+pEvq4B9FQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C061AC433E1; Wed, 27 Aug 2025 03:49:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 27 Aug 2025 03:49:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-i0HxKbzVIp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #7 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Alan, thank you for interpreting my usbmon trace. I tried your suggested qu=
irk
but it had no effect on the objectionable symptom, usb disconnect/reconnect=
 of
the usb_storage device. If it would be helpful, I can do some more work and
supply a new usbmon trace with the quirk in place.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

