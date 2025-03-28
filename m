Return-Path: <linux-usb+bounces-22297-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54462A74A72
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 14:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F30C188FEA1
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 13:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E82128819;
	Fri, 28 Mar 2025 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNAOcbvb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFE322F19
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 13:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743167664; cv=none; b=aBtJ8tWjwMJgVUn1XCUl9dqf9HFcKda6S5rC+fC/maFcipaJle8Vf8+6inFnJhH76wPrc7q491xvFsAxDt5rSbLTOSO77q9WFGV1O3f/lX8jhlLg0p4iaccFniPwgsDOn0b9zgR/iPduaD/TlHLTfJSB5jV1/qgoYcHk+2zfXhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743167664; c=relaxed/simple;
	bh=7bMVhEOI108fTpIEO7nZbKfzP+gg/leLbCmCKbauvp0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IbuMKfI68K6RgPe9+EXUJhVrqfp9eKXO4ECUOVzNme5Tn9epRkRE4tpWDCTAVp7V7fRIEzS4TTFtAqGZdD0LNAuN62odge3Dih8QGC/vA4dIgvy8ZQbwpOoRDShpfIYw9ZWVnDO+4LIg0uNQGu2q4cD9AOKrSmDGVu9h/hg5vXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNAOcbvb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0653C4CEE4
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 13:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743167663;
	bh=7bMVhEOI108fTpIEO7nZbKfzP+gg/leLbCmCKbauvp0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CNAOcbvboW8xLe6TJF94J9p59dpxOP2DCaYKZ8NoKbxjf766DumPOhITDKBcWc3YX
	 MOdWav5DzZIoZNKo1lbnDK/Jk86siip2qBgG0//jRzl9y1J/VLJTF+JAkn+LY3igl+
	 1UX7/Rvy2jO6SHozf+eY0jxpBCIWWOjVe0sXXqZlVw5jEHtjK7LFVQ3hc+fLrcnez9
	 B/G/CauFOUajmHWo+i+9qJPfdq8RuFFAWYhrd4knwkQJADrFywP4AED89jYJcELbIB
	 iWa1S29caJ29Nz+KCFtL3n5uoqtNTrKUPPXgsrkqPXLW9TeqZT8pHXlWbiIlt/34GJ
	 ZLtozs+36UaOQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8E389C41612; Fri, 28 Mar 2025 13:14:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219951] Missing null check in ast_vhub_init_dev
Date: Fri, 28 Mar 2025 13:14:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bsdhenrymartin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219951-208809-AGW2CK72nL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219951-208809@https.bugzilla.kernel.org/>
References: <bug-219951-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219951

--- Comment #3 from henry (bsdhenrymartin@gmail.com) ---
This is patch file.

henry martin <bsdhenrymartin@gmail.com> =E4=BA=8E2025=E5=B9=B43=E6=9C=8828=
=E6=97=A5=E5=91=A8=E4=BA=94 20:41=E5=86=99=E9=81=93=EF=BC=9A

> We should first check devm_kasprintf() before setting d->vhub and
> d->index, so that if allocation fails, the d struct remains in a clean
> state.
>
> Patch code:
> int ast_vhub_init_dev(struct ast_vhub *vhub, unsigned int idx)
> {
> struct ast_vhub_dev *d =3D &vhub->ports[idx].dev;
> struct device *parent =3D &vhub->pdev->dev;
> int rc;
>
> /* First allocate the name (before modifying d->vhub/index) */
> d->name =3D devm_kasprintf(parent, GFP_KERNEL, "port%d", idx + 1);
> if (!d->name)
> return -ENOMEM;
>
> /* Now safe to set vhub and index */
> d->vhub =3D vhub;
> d->index =3D idx;
> d->regs =3D vhub->regs + 0x100 + 0x10 * idx;
>
> ast_vhub_init_ep0(vhub, &d->ep0, d);
>
> <bugzilla-daemon@kernel.org> =E4=BA=8E2025=E5=B9=B43=E6=9C=8828=E6=97=A5=
=E5=91=A8=E4=BA=94 19:27=E5=86=99=E9=81=93=EF=BC=9A
>
>> https://bugzilla.kernel.org/show_bug.cgi?id=3D219951
>>
>> --- Comment #1 from Greg Kroah-Hartman (greg@kroah.com) ---
>> On Fri, Mar 28, 2025 at 11:15:22AM +0000, bugzilla-daemon@kernel.org
>> wrote:
>> > When devm_kasprintf() fails, it returns a NULL pointer. However, this
>> return
>> > value is not properly checked in the function ast_vhub_init_dev.
>> >
>> > A NULL check should be added after the devm_kasprintf call to prevent
>> > potential
>> > NULL pointer dereference error.
>>
>> Please submit a patch for this if you feel it needs to be fixed up.
>>
>> thanks,
>>
>> greg k-h
>>
>> --
>> You may reply to this email to add a comment.
>>
>> You are receiving this mail because:
>> You reported the bug.
>
>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

