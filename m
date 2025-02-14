Return-Path: <linux-usb+bounces-20657-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B78B9A3666C
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 20:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D37C170DCD
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 19:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D371C8608;
	Fri, 14 Feb 2025 19:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCXOkqZ6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C170D1C84B6
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 19:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739562395; cv=none; b=iar5Ox/fbNyDThMTnNq4G+DAn1RJzfOsaJpm8y+eyFYclsu3ynLr95l3tEH1PQj2FMAzOlQW7ssmzT9ae8C1CXAOalwF+xhq4bB/r2HMYC7wLycLHWOFim8Lb63tfLtsdG/E1Uizk707w8flsSrHb8VDWhT8R0Dyf6OveGYte8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739562395; c=relaxed/simple;
	bh=NiI6CJE3CLGT3WbF0+akvlh+Opq6iAafyE7pdPLOtB0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y6zxxlcql/qi/JvpeVmDN3S4g1+F6NrxjRAfHxrffMlAuDlN2YMLuUBjuEmtyp/4OvPrUNXAesuSJ+mouSYSjoeyrRPbb63C0uAbThrpC99jthovZoayBLaVFCvYD3Lc2Dq8x5ttuHzSk5Hx70ZkWqG39wkerLTiYW+zwbDh+Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCXOkqZ6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4270BC4CEE2
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 19:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739562395;
	bh=NiI6CJE3CLGT3WbF0+akvlh+Opq6iAafyE7pdPLOtB0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FCXOkqZ6fjW24BC0rWB3nYuhWUtIScYgpE6Src7e0PVstUxV3tnfqIktJoDglcLXu
	 GCztAKE7fJLwZ2pMzAbAiHU6tIZCqDaFT4ekLfWYxijh1xnTRFoNdaN4wk1Slh+19C
	 35fGHdzprWbR59CEeEb+wdr8rP/JC6xuqQhlihP4tQZIi/SGkIISEd92tAw/rlIrsQ
	 Ahle4enfTy+5eUIIhRCP3Ho6/gUxT1Q5onJiHDK1IhioYDpsjbtagV8SJpzBYAHlSD
	 eSLfFNjQeGQ1DcQzP3JsGg3mJRxhYG9g/ojhjFO6EHLIMmrdROWIbpshAHuuJa+6et
	 Cf8I9oDlAox9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 37986C41614; Fri, 14 Feb 2025 19:46:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Fri, 14 Feb 2025 19:46:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lyz27@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219748-208809-itI3PoilRi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #9 from Thomas (lyz27@yahoo.com) ---
Created attachment 307659
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307659&action=3Dedit
tbtrace with skip retimer patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

