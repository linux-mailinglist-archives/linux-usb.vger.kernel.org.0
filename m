Return-Path: <linux-usb+bounces-17134-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A01109BD32E
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 18:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 563F31F234F0
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 17:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB4516DEA9;
	Tue,  5 Nov 2024 17:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUjzk/Nq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A5314A09A
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 17:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730827044; cv=none; b=hgSCRBkY+cJaXvLRVbXafR3Ktj40yebL2jDvaezTQEzZLVnlPcuznjigb4Wsxn540Kb1eJ0Cj0J9pA7wn29/KXHtEkVQMIXEhBl81wFZhvNv9S0cfby3DbxrqZqjYNh0A1ROddG61w71Wt7UZlI0OZB++SOZ5CP15xZdyvfym+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730827044; c=relaxed/simple;
	bh=k8tyG3q36L78g/INTXINq3obMQk8R7yeqHCQz90nUKk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZNWCQNnWZCBnrOfiV44/jaIKujGLez9AhUqBoeHDPPI/+oWOP6JUu1T6xnKUn4tjMexdZ+OPCbfH75okNiUcGU09oK3QdQMktQC4o0Co+hPn+WyO7PCk09h0kUA3fD/FKZVmCcWw1cEAmaJk6Vr+VxpgJg1LbhTLffq8JASUKd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUjzk/Nq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6ED5EC4CED2
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 17:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730827044;
	bh=k8tyG3q36L78g/INTXINq3obMQk8R7yeqHCQz90nUKk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OUjzk/NqUnLgMKzkkM3OiYzwhwZvZw9aTPc6HcV3NTjLLUb2ncegXD3G7dRnDlH9z
	 qRrX/SM75MlN4h/28DsC39S7Belghr+qItfpElKMu6f5ie3/VmOs/endMiUEa36DRk
	 qY2IecNF6c4u51orRydY91BU6kCk5t7P2eMHBr99Vh/CywiHiYkng0NkeU7q0yRwch
	 ROPBXLWvqxmRFV5Q4P4fbAEea5vJAFJgJTZi/9AKPpk+O55fLLhczM9zNJUXU8Qit1
	 bbh1E6nJ4cGDnYJVOyRNV2/iAStKUN/A9cS2oMWrE9vott6omR2X44FrXphw9cAQaZ
	 V5JVy06HG7e7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5E3AFC53BBF; Tue,  5 Nov 2024 17:17:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218795] USB4 / Thunderbolt + AMD: unstable and slow link (many
 uncorrectable errors)
Date: Tue, 05 Nov 2024 17:17:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: glite60@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-218795-208809-5PUcbheEbh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218795-208809@https.bugzilla.kernel.org/>
References: <bug-218795-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218795

Eduard Kachur (glite60@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |glite60@gmail.com

--- Comment #1 from Eduard Kachur (glite60@gmail.com) ---
Created attachment 307144
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307144&action=3Dedit
tbtrace dump during connection and crash

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

