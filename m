Return-Path: <linux-usb+bounces-23661-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AAEAA8095
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 14:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12445462EDE
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 12:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB9C1F180E;
	Sat,  3 May 2025 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpP6JmHP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542D61F0987
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 12:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746274232; cv=none; b=mav47bqmcRQFg5Uk0Fgw6+TTalb5JZgebalFJcuONaQ55Gv7op9A1NZpSPQNhKC0/A/9EG/Y5VuAn5Sz7u2WNjMATL7BsDXxk4Em/HEH3sLOdtOw9fiWp7bND82nsQnNzZsUfQJwaVB6poACFONeuhBI3Wr9vCbEAon/IPpNd/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746274232; c=relaxed/simple;
	bh=X/6gUlajDo+0DA2ITNTI8+G1oivPCdWHpTQngtqh3Xs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DQHYFErpw9jH804T9UtOKAXF5d5oPlEqKxr7/56MGMo8U/mnEK18Mwcsdj8RvSfFvq9bAEjJnPoZD8PcR/rQfHkPdhmBNkvITEAfuNfI97oJiLiOrx00kUqwcBPdPDQbpiCQyOuQYZOVsODdlLAHNC6psqPdeCYHUAoErtnHDGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpP6JmHP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3AEBC4CEE7
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 12:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746274231;
	bh=X/6gUlajDo+0DA2ITNTI8+G1oivPCdWHpTQngtqh3Xs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jpP6JmHPQMx3bbWBBLiu5jQhgy6PnYQjODNYyORifcWodWsSiChkkaDf7vJpYkVsh
	 TIzT2KHSVcx51AQp+uIQXiH8kEYjLHj60TV6tulYlD01+1YwKbMIsqQ3StlnrMsWqd
	 xNcMs4Ul3+9ljwu5NGr3JtwkKyuQofzbVQY4RsoEf1RERkH8JNHW6+o8ELPIyz6pX/
	 a1efg9wE245ctB8QttmSTdD/5Zn5uA0hFC2+R1VkJF7s5iwTFdhmBURFIiQ0rzkxzv
	 NDkB4cuuN3n+p99cpo6lYPeep5CAmHwm/7I9QbA157gE9IGhQtpvKF5xfdwbIu+KZo
	 G6uKBaX6f8Wcw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AC58FC41614; Sat,  3 May 2025 12:10:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sat, 03 May 2025 12:10:31 +0000
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
Message-ID: <bug-220069-208809-eyORnaHGf1@https.bugzilla.kernel.org/>
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

--- Comment #26 from Claudio Wunder (cwunder@gnome.org) ---
> But it was already fubared at this point, so something went wrong with th=
ose
> resets or it was the slot 6 ep 5 churn which broke it. That looks like
> repeatedly canceling a pending transfer before it completes and then
> resubmitting a similar transfer, and IME such pattern can break "ass medi=
a"
> HCs if they repeat fast enough... (no timestapms here, unfortunately).

Is there anything extra I could provide?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

