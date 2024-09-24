Return-Path: <linux-usb+bounces-15367-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAA09849FC
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 18:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 516751F21CC1
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 16:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6276A1ABEB5;
	Tue, 24 Sep 2024 16:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOiyMw6W"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E091E1AAE24
	for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2024 16:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727196626; cv=none; b=PC/QSyf0QBcWrF8+f2uRdsIyReQ9Ky1CeiyLEE7NTZhUzysRt+rHLzyEw2wxiO1uN7xoG9pvO22qnBYgldp0F/hlOSXIo4WOVoLlVAuT/XW01iv35mehtY826NFrWz9qquSYUTVTkyya1DvUoNB16bBMtL9ZJqxiEera/OWwumI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727196626; c=relaxed/simple;
	bh=RZooAcoy1sP/EarVhXdJ3w3UjYU+CBmBKFMJLd3OmV8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qPX01TqIlrjTC8p1ngoBd3T+NvIJz5GPO1zdwzMiED3OgVjYjMIU09Y/g2sFFRLEZ5LdnnU674TalsytlUR4tHMHboM1JS4Ni257pk+tq1G5MF1HK0rTMEQWSa7wyIltHFXBacIgm9kTQCmUq9ySXP9FgJBC8W+F318o3cyeP7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOiyMw6W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7687C4CED2
	for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2024 16:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727196625;
	bh=RZooAcoy1sP/EarVhXdJ3w3UjYU+CBmBKFMJLd3OmV8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GOiyMw6W7OZ38GdLDQNqwN6Eo/Eifp5AQZ+IunodIzcMgYVGfjJ7sN6VXEOrxACBW
	 zlc6WObzxwSlA56K/crlomrhKy9RAWJ+UCzW0ciKg6vl5Vk8b3stcVrMONOMGC7Il9
	 P758YhEM2zozQo+k1avh5+ula9YfB4cChR+nD1JpAc4cNLvqQ4zHWErWocwfK9gN1C
	 oa2Z2Bx7EuqizLKGcetDSlYTItpooH97Dt6P7a2/CIpAqMTh12tX8ko0fiBTBS8ycE
	 tsoHyAYaBqpo4H2cD6BQobbenRjx5YGasZsHN5S81Qs9TI36XZyerQ7WaLNuynZRXU
	 cNH6xVzdGWmIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B19FCC53BC5; Tue, 24 Sep 2024 16:50:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Tue, 24 Sep 2024 16:50:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-5zr9HeYrQy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #39 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
@Alan, others, so what is the status of affairs? What's the conclusion? I s=
till
get the warning almost every time I boot my boards.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

