Return-Path: <linux-usb+bounces-14247-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D053962F50
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 20:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38601282F62
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 18:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0581A76DA;
	Wed, 28 Aug 2024 18:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDJk4RIa"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AC21A7067
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 18:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724868310; cv=none; b=GBneDkrIbdc1qvB0vkQ5wM9+JFHFZ0p2XhtgNFr0gVb4KvecFtvwJE3YBgrVRlSpk/fipWGOUGzcfvkxwdaYSRBLytJsww/3EQRxWA9qZAye7c686orgdrsdcqAV3VazprjlnJFTWAUQnO02SDhhW8aPmzfdcDvwNeba/g6doBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724868310; c=relaxed/simple;
	bh=jAn6TK1XUphkPHaWyO9sX4TeYZ1bT7XxEO9etJx+Maw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IS1VTY28Nor7xvHKECHEqQFRG3WTdi51DoxWh0KzB3VHtPdx2jmfqqBHDmHTdBkSqI1y9HEkudrB3C8xT6eVL8V7XYPmwB5T5kv5J8w3l1KIDT+25vcktSQdDrLhxGznFNuC7lLtHNn7Kzz+1aNiSIQH8DNS9qqliEqCW38TyaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDJk4RIa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02A40C4CEC1
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 18:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724868310;
	bh=jAn6TK1XUphkPHaWyO9sX4TeYZ1bT7XxEO9etJx+Maw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oDJk4RIaOO374I06UF94PbcITJafQaLWmf6bVS/d5jT+aeiaMFDLwzhsniL4e6Ozh
	 UXYOeWZ6WIFXhVokRyGzjzWfsHq/Xeol3lb1reRix+i1RuHJyb6gTo+xtRQA6M4Kb1
	 89Lj3GEdE1FJnmpWAZxMNMwqZKwVMp+qZFC5KV9+6gOyTZqTk8Bo56qWEgmgVSf40W
	 Lu9nqXRsEKZKGHV5rgM0Nmi5xwSJVVlc/Tonnrs6G8istSeeUeNhjpCI3WMI4y6+Y2
	 T9rxIOiC8TKVd6doqKrSh72Spbz/eVAjIr8QA+2PqNNQNB1v7wzOmUowvyOFpVfj0W
	 z4Txx+r+JLNzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EA4A5C53BC4; Wed, 28 Aug 2024 18:05:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Wed, 28 Aug 2024 18:05:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maggu2810@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219198-208809-hTMm8iMOOG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219198-208809@https.bugzilla.kernel.org/>
References: <bug-219198-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

--- Comment #21 from Markus Rathgeb (maggu2810@gmail.com) ---
Created attachment 306786
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306786&action=3Dedit
kernel-6.10.0.f90584f4beb8+.txt

Here the log of plug-in the dock, unplug it and plug it again for commit
f90584f4beb84211c4d21b319cc13f391fe9f3c2

It is the commit that git bisect told me as the problematic one.

Reading the git log, I wonder why git bisect did not try
2b989ab9bc89b29dd4b5509408b8fa42337eda56

For me it seems it is between the good and bad one and not tested.
But the same author, so I assume he can judge better.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

