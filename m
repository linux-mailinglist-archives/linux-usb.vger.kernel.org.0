Return-Path: <linux-usb+bounces-28602-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7ECB9A0EE
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 15:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BC253ADC32
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 13:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB98301494;
	Wed, 24 Sep 2025 13:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+9RCFeZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0263E1A0BD6
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 13:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758721065; cv=none; b=DrjswJ4HzfkicBEdfp8KpQmAtIoZE36Zjc6yO4uHQZ+TLhuPvb6lvrQ+dvAUH5Jw8rRpSH3l4iLrYWj8AiYJGa6mw2hADhuMCswU6sqG1BTSxnynTf0U8yu67BckXkd+i8tHelIHg6oAcbl888S48piv+F1MQzDA64auAuIJZ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758721065; c=relaxed/simple;
	bh=I2SfngTuCwsWuzdRoy1kIAW9/S54dQh7Pfd+B+lpMu0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l0odVE+ka0hphByFYHs16fBrhOKclbSpCPZdj5zCTQRjPY8y3a5IFrgURfc6UJjkePO+CI3otR8lw5At3uDGRnWv9wYPSfhnrOR16MsqdT1r3TWE6yyA7OfMnN92DICxRxePVheILCqBdl16pKARhCUpR7NjPVwJki/aKBNjEOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+9RCFeZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CE75C4CEF0
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 13:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758721064;
	bh=I2SfngTuCwsWuzdRoy1kIAW9/S54dQh7Pfd+B+lpMu0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=f+9RCFeZ50XZJMI5ngG9USLkfGyqocZHkeiZK28ZSbIHIC8K+TchJObgo3oIrj0wa
	 yrhSCteSpTRb7ho02I5Y1YRypUTtDFSZ2orA4vXUMe14WSkZ4kohDYAEAE4tBnU0he
	 7hfOg+O2RnMAimwN15LKTFmS1eFZPODHDPmQ826DLzMIq2U7bjMdVW0fjgF4JKZKsB
	 Yirux79Z6Q00AIHxCNC4W4il3JLGKdgTAg27KmxqKmlsZoSUExrQp3ZGMxoQsl78xU
	 8UsL664p0J26coQT+dQrObu0djjxGvU7zyxwilHQ/A0C+opikFr/Dq0JNhcluakEf+
	 M+necHj/1s9wQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 88155C53BC7; Wed, 24 Sep 2025 13:37:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Wed, 24 Sep 2025 13:37:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220181-208809-bLOFXix5CV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220181-208809@https.bugzilla.kernel.org/>
References: <bug-220181-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220181

--- Comment #20 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
The patch supporting PCI xHCI controllers with no USB3 ports is now in usb-=
next
branch, and should be part of 6.18-rc1 kernel.

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=3D=
usb-next&id=3D719de070f764e079cdcb4ddeeb5b19b3ddddf9c1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

