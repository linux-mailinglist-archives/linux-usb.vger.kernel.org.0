Return-Path: <linux-usb+bounces-23232-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 332FDA93C27
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 19:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3C3A188393B
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 17:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB5F219EAD;
	Fri, 18 Apr 2025 17:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8QU72HC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D5813B590
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 17:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997940; cv=none; b=T83e4X9yBJI5lhGjpKxxia04NXhlZ61JI5cnY5KS5ub6PX7ISVAbZjnNbFgpY4f8Yv2KmysKAJeB3FZVZOmgpjZR6gNd5PoSffUeRnrz2oLZoxp/Tp9tKHcioYtMSuhJiUM0GKoT39PN7k117/fjrI71cpTs/umPhq5EaU7nUX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997940; c=relaxed/simple;
	bh=wIOwc0OaakBvDMkwqBomKlCxN6tqvqa+wacVwWUHNC0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VE1kPDoOpFRzdgXIpRRhzAOlsRbGRRc7YVKpFRu2uWRFKouh6xnTcIvlRM44rLq37WHRoqgZWBlRGeKCpjtxtITzI8liz6WmQ+kjrHOxwMRCrrLP4R3Bh2IigFMFbKEf3narXu/f6KIYfdmCfMyIwOizw0OiGeZIHR1/kXjdUQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8QU72HC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E72A7C4CEEA
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 17:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744997939;
	bh=wIOwc0OaakBvDMkwqBomKlCxN6tqvqa+wacVwWUHNC0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=W8QU72HCTwUh7Fx8Ci+yo02Vokm6Cs49B4ch6RJOoQYCHpW8Z1GjR4XZXRTrDliZl
	 pyQT+N/YiDiyExzqW8eqNqkxIUDt3fOTARuYrn5HWq23s/cU0brzm+Xq7X59lkE/ZG
	 h1pj8NzjdNXErERDKzgsYqdBIYjPghfW1tmxc/8q55WqyD1qRrL0BJKjWq5cEc+yMx
	 JYVl8VQp2bySk5+yJMDNi4ECDXqJudvS8+2+wBMM7TdBq1TgM3GSfzh0UrCkey1tUW
	 XVvTVcti5cxU8F63Ejd6mfW31EAJlrEsJH3+5lfo2aeqQjcTiGhu65g15IcLJXbfd7
	 OWnneEzXE+MjA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DF99FC53BC7; Fri, 18 Apr 2025 17:38:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Fri, 18 Apr 2025 17:38:59 +0000
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
Message-ID: <bug-220016-208809-x1cmSjYrUY@https.bugzilla.kernel.org/>
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

--- Comment #14 from Steven A. Falco (stevenfalco@gmail.com) ---
Created attachment 307988
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307988&action=3Dedit
6.14.2 with realloc=3Don, no keyboard

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

