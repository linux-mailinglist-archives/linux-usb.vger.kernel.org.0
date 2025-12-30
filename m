Return-Path: <linux-usb+bounces-31842-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9500CE9955
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 12:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99E82301C97D
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 11:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BED82E9EBB;
	Tue, 30 Dec 2025 11:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6HUWEhO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A5F1F3BA4
	for <linux-usb@vger.kernel.org>; Tue, 30 Dec 2025 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767095697; cv=none; b=KYhIOShkzrx4IsaeSiAmL/FLKCLtXBN5kz+Vq/ksRaUWNHL9sPRcXyXBYRJbbi0WcaakvK0IalEXrTUjVYXhXDp7vNqVrRgrTKvDwSISlTwnU8oyWvgV82i7sJ5hjmDa4y5ApOGqQFpbItuccnGVD3DJ2eFgsEKHGoxOYRfxM6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767095697; c=relaxed/simple;
	bh=SRcuPUu3svl0PB7Yp62kpOLtVntaRxux1aVOwLi9OwU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OBJ1aCPrYN+K9oa3mtLDjRKCqH63ufZkZBf2O30mMjEgRn6dSr5+IBF5oVaa43YoyzSUWzk5mpEHFGkbSP3nWgmuUEEburyTKbIE0hu6K1yoEbd96CQD8RLvLqfpcYIbuYHJLEc+h01KXTELRssqAx4zASu5L6xQcyakbpkw81M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6HUWEhO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99F2FC4CEFB
	for <linux-usb@vger.kernel.org>; Tue, 30 Dec 2025 11:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767095696;
	bh=SRcuPUu3svl0PB7Yp62kpOLtVntaRxux1aVOwLi9OwU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O6HUWEhOl0BJUYCOUoIzJWj+/ydBBK4RhFdq/x2uof3NivbfZJPNF5IoCiHNJnPJA
	 /wjBGNW9dCO5qZg3zt4kgSKZVdBsddu7Fuyj0355V7RBwL7ZBFVGJbh6cPSgMd+eyl
	 vwt2eJy4d/dFdcUzEWHFU6L1zoEVj7A84Tb2ncZAkxZq6MWZnDb1XaNDjrNko0PG2M
	 yi1Km6t4aHBvdAHkR2dT/pSz0yf/fxmlYC6vmsIqoqxrM+y0obJU8CEdqUz7YpuQ6e
	 MN3WHtvOGc9DoJyEQ33ZuEpcSAeyNStL6MZfn9qInE0mzyBP44RfgA/8LG6gsoS0JB
	 9LTFc3gSyBXFA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 927A6C41614; Tue, 30 Dec 2025 11:54:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220904] [BUG] ucsi_acpi: USB 3.0 SuperSpeed not negotiated on
 USB-C hot-plug
Date: Tue, 30 Dec 2025 11:54:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: heikki.krogerus@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220904-208809-IzT64v9VS0@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220904

Heikki Krogerus (heikki.krogerus@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mika.westerberg@linux.intel
                   |                            |.com

--- Comment #1 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
There are no logs here so I'm not completely sure what's going on, but the
symptoms sound very similar to a know issue with USB4/TBT where the PCI dev=
ices
fail to enumerate after resume.

This probable is not a Type-C issue, because this is UCSI system, and UCSI =
is
just a status interface. But you can always confirm that by disabling the u=
csi
drivers before reproducing the issues.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

