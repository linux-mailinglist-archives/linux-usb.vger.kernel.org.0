Return-Path: <linux-usb+bounces-15874-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7B0995452
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 18:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B0BB1F264C6
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 16:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6771DF964;
	Tue,  8 Oct 2024 16:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brLCQN1/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681991D31A0
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 16:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728404660; cv=none; b=Nr3qY2lrdrlUimCC4J9jhmpiDkSfVxn2sDtYXKaubGf0qEMCDTGKsD4ItSWrzj0y2G4ap2FMeyrHq+uWtIk7Mw5LMmxQ8kl3B9Wm12/ZiaRuAN1YvXXjSIPMMTDXP9DIAvtJskRDSxTCQD6rE0/gz32NFqJWMhRnVSpX9y24JN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728404660; c=relaxed/simple;
	bh=Ksmqf9+zmqbRHU1LmSQYEn1QNoJz78b2OBAGqukz3rw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b26djlLTjkFF7NHrcON/dChU7rpskhdgBaWqwUpiu8A2YQhTN7SRuzlRg6PCcVdyBYDs0BISecP1MS+vIlnaba0iH5gw3MUB1gzHixBewIHtnQAF2L0noIwee3ORK4TiwG+CAp/8V9GnqpBw8FnEGXUYQ5z2JXzFtgv2+RsMeog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brLCQN1/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F9F4C4CEC7
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 16:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728404660;
	bh=Ksmqf9+zmqbRHU1LmSQYEn1QNoJz78b2OBAGqukz3rw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=brLCQN1/hEdSlIMTclAmHVx8aSVa1j0iq76j27fG2R6niQgpKj0k0Lf1GlzHSqlxR
	 14++aDpd3LT1e2mTbslYOJIm5ZKAEhB0owE9Xq8UxyHE9xLBEM9gvWoBzGqX1esknm
	 B1cC/jLz6ZklVME8v4ob/poOVjlKfKZ2CP4lK4QWa8XM1CzWrPstFUMbUSyvWBuMb9
	 RRr19Xpqpp3N3IJrefiTo5frM+fTNHy3SULTj0+X7n25fPDW7CdMYLPIky/G2GTOh2
	 72nr5PZ5Rqz/9F/2GXZnEtK3FeKjTH8RgmvY2zEeSmQwLaQhV4Fern4YyIRzmmSwHX
	 gb1cWRUEevLrA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EE014C53BC1; Tue,  8 Oct 2024 16:24:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Tue, 08 Oct 2024 16:24:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: SCSI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harviecz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component product
Message-ID: <bug-219362-208809-RawtAtyOZN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

Tomas Mudrunka (harviecz@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |SCSI
            Product|Drivers                     |IO/Storage

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

