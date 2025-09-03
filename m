Return-Path: <linux-usb+bounces-27498-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AA8B42721
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 18:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ACB424E2368
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 16:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D771304971;
	Wed,  3 Sep 2025 16:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVdZ5jCk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E635F2BCF6A
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 16:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756917783; cv=none; b=Qs2UQzeYzGA3WiGxx3v6VIxd2V0aXCi1v03CHYV+T1l7L5iax2nWcxh8eJosjmKiva015+mwqwBnSOHViyLcLT90T66d2YlgWrORwgq0ZkMhM4oJC7BQHKdao5BmnmmAU+sy6ajGiF2F7HltpIZOAFxOlxj9Cu675NkcCacXjAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756917783; c=relaxed/simple;
	bh=bmgAS9DL4yZxlpS65LJSjtY+T6+FOYoTfXZDwf7GPWY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dlm2hdHZ+N1r9ke+FhawkouhIzRlE0fGkAIibFj035u1HwFwQeGtd1Nf8Y9CwEFCcdzz2JR0822CF2+COZOJCee9sH+I15wnC+0cL5z+/sSna6D5FTnhmPd9PDErMkmIPKWpPJosCtdNE+MfzAbLJ4YzUqe6L7VcLu7SKCRxHRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVdZ5jCk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6568FC4CEF4
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 16:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756917782;
	bh=bmgAS9DL4yZxlpS65LJSjtY+T6+FOYoTfXZDwf7GPWY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RVdZ5jCkTl0GSdTuizK8LFRWXQ4bkm64RuKVeyDZhiT4vTeSCY9FJnIDi+P3fAYt5
	 9vuPX7ZWyuvFrl9zC3OZdcPmetAeUBhlJIH+ZnNovRMQEGg/cCBJH+fkNWbQolyDqt
	 /agIb0DV7pW8ENvZ1qhqn7aa7vPmCdAJHe3WxV3ULYQ8LO3riVfKIIUOymVEosXeOV
	 xmVWc8EfKSTOUNI4EcORaAqX5oOfz6Vd4sVbOaRp+7KuhJGA/e0Io9/e2aHq4l9BPm
	 oQnF2dF0lbBpXS6ASRST6gF8CxC9nMzI8HZpEjVn38r83SzHL6lFCw28lS2J/FsaGC
	 7O6Uka5JfCy7w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5A029C433E1; Wed,  3 Sep 2025 16:43:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 03 Sep 2025 16:43:02 +0000
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
Message-ID: <bug-220491-208809-dL03clLuox@https.bugzilla.kernel.org/>
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

--- Comment #27 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Also, if the delay snippet that I wrote of previously were to include a
provision for changing the delay via the sysctl mechanism, that would likely
also be helpful. I could of course research this on my own, but if a domain
expert would provide assistance it would save me some time.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

