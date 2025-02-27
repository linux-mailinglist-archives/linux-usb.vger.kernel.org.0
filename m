Return-Path: <linux-usb+bounces-21147-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42171A47EF0
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 14:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6BA83AC404
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 13:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1068522FAC3;
	Thu, 27 Feb 2025 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbBNSBuz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E30122A7F6
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 13:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740662562; cv=none; b=t4Y/dgCR+I33WY/jQNVMiYsdYmHQR7gzm4gYjye8BsFi+rvmcdeL646EnRRkgFs0z1Fm80egygT1xSZlGwpP+x+CFcsDxLmzqgDCsKjZktswhtfjUjPi3y/okeHgha2lRMbNJ5IngKgb2em4sZjgW9NmUB7IFOD1tqZTtKQmamY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740662562; c=relaxed/simple;
	bh=dnssWjEhazvptp0NyGOSdPXCzSKQ45wengzb3Ub49uk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IIpu/YgRVP/poP9sVHxL6LjioTpoAJuv0r0TGSynjXoUwE1XBU2xgTL14cWdG7qrgeoX47jRVUAaV2t2t8SkmPJuzLLUXzaj0uOGWpEqS90VGsEIOxmzBWwyjVtzbR5eZ/QRNhVzpeeTD7q4aASRfuO67TrgrPiS+zjvKwg6giM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbBNSBuz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DCF6C4CEE6
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 13:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740662562;
	bh=dnssWjEhazvptp0NyGOSdPXCzSKQ45wengzb3Ub49uk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CbBNSBuz2lSdaRsZhF7ipCHCOU4y9g8xfqaIVLK7Tm8U9tBWWM8zC8Nn6VQFbq5oO
	 UCOnmPkqXprbfXNSKTMtVYnwPlxrFHRGWkNG8binAKRXSEDe5EwYl+y44W+5JZT9m8
	 QTncc+18uA+iFbd2KOoBuSMD0M1oD/YuuG/6VcWqPZsciDJCaEuJxNecaBtlygJ2FD
	 cZHZrwwdgdxOky//Tvt14HhebnYkPw0TE7OGLoN5Y9wz2HtS0JBUz0EO+S63uijMIt
	 69ALToRw8lfhOWjthU/0gBMMxUaEId3WetC++KG9tY+wd9HmXSyRu8DSzZmpKF32GW
	 nR7LpzR1Y0Z8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E5329C433E1; Thu, 27 Feb 2025 13:22:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Thu, 27 Feb 2025 13:22:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: fredbezies@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219773-208809-SK4cW4MNoj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219773-208809@https.bugzilla.kernel.org/>
References: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

--- Comment #21 from Frederic Bezies (fredbezies@gmail.com) ---
Created attachment 307720
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307720&action=3Dedit
dmesg log using an USB HDD

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

