Return-Path: <linux-usb+bounces-11735-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 155DA91A891
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 16:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45F2F1C2214A
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 14:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529BA1957EE;
	Thu, 27 Jun 2024 14:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiEDHYli"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D112A187321
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 14:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719496981; cv=none; b=RUKyf25QuJh4qn7rSSJFhL17ptfFIxKhIITJLQYzYJq+HPQb1AvCatdeJNwzD/3JsEp2k6V6eVvc5NaTZJZC8W/fOECSD259zTSqOxhUMT/00k3QD2nmWHfJDjjeTqlSvadUqfovjHoL6letYT47HaXI/RsgAxPizqLzccCqGDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719496981; c=relaxed/simple;
	bh=6GcTGPKGHc2k/U2SSdGi5GaLjaHLH9HD2GhxQSi1tyE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RGgos67Mukm1doLbHofA0d+FEY3HrGUkC1iGCaQAJiBmU0mJ/L1RmXFrSUSDJ6Cemnyd/r3OvomWS35xpPgvJOTx6CSX1GSGilAa1Z2uehClUkt4tgYv8DCDm51I1dx2W8RXCmMwt/znkIYNbSZYzx4to6MQkXqVuL84RREHpwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiEDHYli; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 608ABC4AF0B
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 14:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719496981;
	bh=6GcTGPKGHc2k/U2SSdGi5GaLjaHLH9HD2GhxQSi1tyE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jiEDHYliErE4KY+rK9pZ7vVBdD0bYCjfz5F2Mp5Gw5joZkzrjJRxIlRuUrOTZYgN9
	 KAGiJ0c3PyWFKCOjt9PJaYTC9KUuD91E99MQEIz5kWkgSAzgXJDxedz218bkwN++p6
	 UpUXlPdTXtfiYZWCwfgRtZCa4UEYi+Z4Xez4rBmyawrdm9m+Lkw2OuEtOw5g3acEhl
	 sTwk/EziAq1WMII51sWvzYg5h9eE7JoQcu/pahp8ZZQPSFO6rY3gJNEFOlK+76WEjj
	 QlPrq6WEhhdngFWbWIRREttdqdwZUQGETVrzObjqBtgWlKwj/7G47CzuyjFEeL55Vo
	 vqba5bZu558Ig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4AE59C433E5; Thu, 27 Jun 2024 14:03:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218987] USB devices are not detected after Save/Restore error
 on Intel xHC
Date: Thu, 27 Jun 2024 14:03:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: repk@triplefau.lt
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218987-208809-GqCwWeJRJG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218987-208809@https.bugzilla.kernel.org/>
References: <bug-218987-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218987

--- Comment #7 from Remi Pommarel (repk@triplefau.lt) ---
Yes this works thanks.
Just a typo in the commit message s/Restore Errer/Restore Error/.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

