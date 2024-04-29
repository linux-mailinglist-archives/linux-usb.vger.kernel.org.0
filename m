Return-Path: <linux-usb+bounces-9878-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 799C28B543D
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 11:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33AF52829AB
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 09:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867B92940C;
	Mon, 29 Apr 2024 09:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXyQjcg1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134C128684
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714382856; cv=none; b=dK3vCe/iCUPIR9ipwV6AnXdnbrUuFSHl39KbzqvUBDimCNumZFVHDElD80nieP3C2NqjdQP6sv+XvXOwE640GSLO3VXXNJOiHN1s2+4EESK42dDZVBO2tjMI1aYVVECQgAZaxi8YvEIaEo67xpgxDqM7RWKJ8F7Zky8/scJAp/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714382856; c=relaxed/simple;
	bh=hc/xeX7IKZv5TDJy/gsrwMZdoVbHx17Y2l28z8h5P5g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iOwEkcRU3FNsERjSAYxDRbYHMLNp/KD8yr4RtyxFNmKuHM0b0e9tE4VcF4N9V5zCuyqUuAwQ7sJcPkY1f9lQ8ThTD2lZYpb+rjP77O1GLlDrtREvEpUKImJOHitOR1h7QYVEUp9+RUjjMsRNNB0i0JjlXyYHxkMN/eXJvjhKgdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXyQjcg1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A5AEC4AF1A
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 09:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714382855;
	bh=hc/xeX7IKZv5TDJy/gsrwMZdoVbHx17Y2l28z8h5P5g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SXyQjcg1h/xJsg6+TabbbMa3PS1VVyJafS6uNgboGGZYkopNLo+zgLzGse0xmrIDF
	 DCplls7I29FaGukboT41nGo1ga4bZMjaGelx93VwS9OFR20/N5y5mrMIuH9k8gCWWV
	 lxPPKxHqQvXFx33bXG+orVlpPvo+GRusU/88DI3XOnMyBBimNjxSpBxaVP/tO/7oB9
	 v+shGkH6xDTGc/mK9hVo2/rFnokLUdtJc0ofHj3LutLSHPmqWVPsaD/vYPRy4FYROa
	 IOQ6wwoX5T0jv3jNOI5RdaW6GzZ0p5sTycIrPOZsla5cjDY1saVHJMrcoPcDJfbSJ2
	 /L8Zq6lxalugg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 61FE7C433E5; Mon, 29 Apr 2024 09:27:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218789] ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to evaluate
 _DSM 2 in logs
Date: Mon, 29 Apr 2024 09:27:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: webcapcha@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218789-208809-l9CMoCq4NH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218789-208809@https.bugzilla.kernel.org/>
References: <bug-218789-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218789

--- Comment #1 from webcapcha@gmail.com ---
Created attachment 306237
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306237&action=3Dedit
dmesg-log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

