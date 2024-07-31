Return-Path: <linux-usb+bounces-12752-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E04943667
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 21:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73DCD2843D6
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 19:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BEF4149C51;
	Wed, 31 Jul 2024 19:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q9tphIQZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2398260DCF
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 19:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722454103; cv=none; b=Z7rQ0HInJYds7uZ1mX8+dWYE4ovcVmYFUiaVgBQQI16N2yC4t14DtmHQcDi2vONpxf+X0miEa+xrqRuRDUQ/vEF8yme9nBO0KhY2fOCmwFuQHBA8Bjk4pcSdg3HaVjiqqOkyXztZNF64Q63xnu5O4+I0QGMStKhVBEjTwSA7WWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722454103; c=relaxed/simple;
	bh=VjTrErRcxSk7utrF2JqAWMSXcQrcR3gw1vJRAWPSzQE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PsHxQ3bfKKE5glRT8Po8PyqwsWQpSlds/QTbmCAN84BtAQnF2hugr/oK553JOklFMktx7jlxUTzY/nflKE1O/nyuBFtKLGlFUvxGmfE9mvmREGdkFbxyfJQiqCUN/0C/WbN7CM32kaG00SHwalWOEbuzdlJqsCsg8axRv5+NtrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q9tphIQZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01AAAC116B1
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 19:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722454103;
	bh=VjTrErRcxSk7utrF2JqAWMSXcQrcR3gw1vJRAWPSzQE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=q9tphIQZO9y+IPfj8Y8tbQMYKh0uAft44HkZQyaaZbv9ELZFxrHEv7LEVAKNNJoiR
	 VMVxylKAB2hUb/xlDRXziXOOoBp8CtDwZGcXk35VPX3r+YVmWS8zfWPiMQds1Oue2l
	 a4/fanOnPxaiTu8nnyIc9faOgntlmXty2jBWVTsB+03KTIyhu2ZgEwnhSoXnhDVIhI
	 hxa1usx+MavErnwfBJ2M5K90OBhVXA02gEaFusIw9A57dDtG+57klO4lmrqirWzVis
	 sY5DsQtFKjWtRrmkqE0aoDvTJkQ1kqse7S+EXXjx7RNGYoc7EaLF3WYT0EDVeUc4N3
	 QzCRmoYxPlWWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EFC44C53B50; Wed, 31 Jul 2024 19:28:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Wed, 31 Jul 2024 19:28:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-ACTcz6pK9B@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #14 from CH (com+bugzilla-kernel@c-henry.fr) ---
The kernel is compiling as we speak.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

