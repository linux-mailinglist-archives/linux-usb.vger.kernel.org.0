Return-Path: <linux-usb+bounces-23842-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D5EAB27EA
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 13:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83CC818945C0
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 11:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3E81A315A;
	Sun, 11 May 2025 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LLBMORMJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BA0145348
	for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 11:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746962327; cv=none; b=Q8KtYuWjxacDL12OOnmIYkDXDy1LakejF+KgIOjwp+eUZQqmleQduu46bXNlXFIFy8FNMAPAcEMT72FZ2GmbMB4NoyOeeIW/wmx/BUPnI0fx+8mr0TmySwTOQ0FlEFOzLa+gLa4zq64BppqeVNd7jO4WqE21RB7tbkCeDUOYw8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746962327; c=relaxed/simple;
	bh=xd5asAtpyCQ25WfGIDmkMTDkQtDBAu8UnwEh9AirGZ8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WrqN2NWKWyWa7Sy5HP6rbPyL5HlF3twhK6U36ZnOh0VA0tDhsNH4i8XE1kvRS3JnWvJ4IPYwH9o5gV660c1lzeDIH160B28vI0lezkzNYg0WH7haKPRf/WEkvB8C04Cvg/6GjFWkobQ7ICINqzVSABDSIJ3+HPUSP3ZqlXd1kzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLBMORMJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 862E6C4CEE4
	for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 11:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746962326;
	bh=xd5asAtpyCQ25WfGIDmkMTDkQtDBAu8UnwEh9AirGZ8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LLBMORMJJUO0eK+A4nE8XpqxcurFK9lkqzk7oh58zlNX5OUmeX9e/1VGg4dCivaVH
	 9aUyKDVxCH69nxiSFCJTWe08jcAxyM/+plPwearvd4OF4ewKPNWAm/QuqeqTgXZojb
	 0S+zC+IXtiQvtV3LgnccpWO9kerDKdUsx0UQ4RWKgnUkl+l/TJskhOIyJFcPgegDIu
	 yiQXpVw+cZDNXtfj3Ab1xjq2kvMlBbxPy3ulMpVKP6EBkqhRuxDNzUjL30ZXWjPItg
	 n43REO7hybD+3QxDF+hyI0JBs12MOIwMPu7FuWxDojFfpgpttPdRmBHQb021xsAtqi
	 tzBnJGX7ndR3g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7A119C41614; Sun, 11 May 2025 11:18:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sun, 11 May 2025 11:18:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-zcuw9qPkwA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #47 from Claudio Wunder (cwunder@gnome.org) ---
Still nothing. When I put the Webcam back to the Hub, the issue persists. I
will keep a couple more hours the Webcam on a dedicated port to see if anyt=
hing
at all changes.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

