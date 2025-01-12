Return-Path: <linux-usb+bounces-19220-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C75A0A9DC
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 14:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ABA61887368
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 13:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99791B6CF9;
	Sun, 12 Jan 2025 13:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVxUuw3x"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312631DFCB
	for <linux-usb@vger.kernel.org>; Sun, 12 Jan 2025 13:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736689909; cv=none; b=pzWT0JDHkMrVeTkI9DXIHFCOJzhCFZ+UaeK4+ZhjppA+9gnAFyeUqZAtLMG5nsBv/jBpEJTRe8FUENXD+UcecbaveZTLjcsNsGqOdOeDld2vjq5Agjrxq1eEXyQZsBCsQ1J8VWPj+OaIsngfK8D/57V1eU/Hv0sQWa38CGWo1dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736689909; c=relaxed/simple;
	bh=DGn9iTy3WY6vxkZUqo7szJIpW8Hm/agneMOtVqyPuOs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pov222GMTHL5DRkp6XzplJn0yGrQxBBV3g2IEc9psWSC9fasJx68Wc7277Hs6lMQRTXv8KBNn+9wQ194AFx3iY3LqRNphWRI1Pz9UurLup6Coedfolgd9ltQorxx2Y8EQ61eedczqC6eAXlsz4tr8C7IFA3n6vLYmWRbz+5k/BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVxUuw3x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A82ABC4CEDF
	for <linux-usb@vger.kernel.org>; Sun, 12 Jan 2025 13:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736689908;
	bh=DGn9iTy3WY6vxkZUqo7szJIpW8Hm/agneMOtVqyPuOs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PVxUuw3x2mEfwjobyLgAPy0FDFMqjEYFavbl7kmX6XMNGVerLHGunXf0dJ7AqoNXH
	 8qoW8CP3HMxFP+J5BvX/xuUi8hhj5NS2J36S/A9gwBCsj88vbqkGpjHCW4KmpGVybY
	 +e5ZXw/2L5Y5xvDYIomeKHWL7fgtMQk1Wk52ArYn28C5ErHMT2VkHgTQowTFlKvxy5
	 8xZ9rb9NscP7qkOgv6FiOdj1meN+T1N6tbmy89VuWxz5GnDxrVluZE56lTVOmipzMS
	 MhLIjj8BhPzfq+JBpKlEFCG3BJ6KmbkaXUDq2eJ0/nZA7cmFdJDVSuOS+uHYJEDfs1
	 yV2eYn7nf6DQg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 964B8C3279E; Sun, 12 Jan 2025 13:51:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219683] Noname webcam used to work, but not anymore.
Date: Sun, 12 Jan 2025 13:51:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: pierre.juhen@orange.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219683-208809-TAabGeYvSq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219683-208809@https.bugzilla.kernel.org/>
References: <bug-219683-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219683

--- Comment #3 from Pierre Juhen (pierre.juhen@orange.fr) ---
So the problem lies here in uvc_driver.

struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id)
{
        struct uvc_entity *entity;

        list_for_each_entry(entity, &dev->entities, list) {
                if (entity->id =3D=3D id)
                        return entity;
        }

        return NULL;
}


The UVC spec says :

Each Unit and Terminal WITHIN THE VIDEO FUNCTION function is assigned a uni=
que
identification number, the
Unit ID (UID) or Terminal ID (TID), contained in the bUnitID or bTerminalID
field of the
descriptor, but the control includes also sound function, that explains why=
 the
issue occurs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

