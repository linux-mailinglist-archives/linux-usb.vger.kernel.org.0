Return-Path: <linux-usb+bounces-10667-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7818D35AD
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 13:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8405F1F22EDC
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 11:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059BC17F375;
	Wed, 29 May 2024 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5YNiKP/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B9C13DDB1
	for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 11:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716982722; cv=none; b=Q8QEOvpioWtDPrXK+OPpqfjG5qhrnwYAorfk40BFT+mBzmkzw9Z73+hsoxRJ4crnSZHnPddNlwQl1XVa0XrfKi7SScz4nY3eVUtLplCVdPYc6yBLJeraUDA81DksgTPL17riF1mhw+aIgGZhAiDnbxj0SvfkabJXS35fRI5HUUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716982722; c=relaxed/simple;
	bh=z1YsNO8VMV7QJIx8f9EzpRcuzKCfcAhj0GGry2oXYZE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nyujh6pUMZH7+ZEzv87+lxBQATHuqZAXoSErfilEAfgC9bSrTGau22BuGojjbGoFTWPso8eVRD/CERYoB5nyOGHELGnxtrM2JaVip0KXQTBWQWZX41pnDo/2r2iuIoB9SChb4OSvesNKYr06FqnIXTbHLauL6tt2srLwSRBmd1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5YNiKP/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F365BC2BD10
	for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 11:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716982722;
	bh=z1YsNO8VMV7QJIx8f9EzpRcuzKCfcAhj0GGry2oXYZE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=b5YNiKP/5mv9RglxY0V0LOopmbBOgCvV7+5MFHcwvRcVWNUeud0Db+wyTjuoHx0bA
	 wa9H31y9HZTHFOpsuX5NEj+yingSSCDeIiMyJrU6ECbl02l0SANEHPJmHV7FVnknIK
	 HeVvujFarOePRuNxtWIj3X27vCHJbemam1JPtvDyeiCqizgTGsVA/J4EWdjwFMLTCj
	 hlkUFxEVN7ZD4xqyStdaBOHLSkCTM/ofE8jIr4atRXoS34UgEEA4PM+B4ycriL49RO
	 sGtHAQvDp7k/NkPn8iAtFKmsRTl0loDa489b7V6zLJk+BeDS5E5qL7UoGRPt8mS8st
	 +lQnr1af1mj7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DBFC1C53B7E; Wed, 29 May 2024 11:38:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] reset SuperSpeed USB device number 2 using xhci_hcd
Date: Wed, 29 May 2024 11:38:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierretom+12@ik.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218890-208809-kD80h15QBw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218890-208809@https.bugzilla.kernel.org/>
References: <bug-218890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218890

--- Comment #6 from Pierre Tomon (pierretom+12@ik.me) ---
Created attachment 306365
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306365&action=3Dedit
dmesg_2024-05-29_13:28:29

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

