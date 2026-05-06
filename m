Return-Path: <linux-usb+bounces-37011-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJFFFh1D+2mzYgMAu9opvQ
	(envelope-from <linux-usb+bounces-37011-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 15:33:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E66A4DB030
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 15:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0C93D301C891
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2026 13:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC0D4779BF;
	Wed,  6 May 2026 13:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C149KTbY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E30A43E9C5
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 13:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074366; cv=none; b=f38W4FRvVD+4o5114j6qBPUQROdafQDPFcR3XH24r6Geo1qDTufzUA6Q4bkyWy6QsVXOuQLhGdFQlwCQPFiRgArxGoNULZjcp2FXZqpbXaJFXYRx1l8iMuJcVKtm+S9wZ79VlXK+jWYEivbIKorSO+QZBLElmtpYF7xxSj0idIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074366; c=relaxed/simple;
	bh=4oqhKxSl6S1RsFHdGwmf9PotM8LppS+cUllkvGeDkVs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R63RHcUC287hNeujoAkYIIfmxrRJNtvyL4xT5HkSCxG4C6pvTz8w5VfiLVOsN2l49936ujnyOlSIAqFoIU27ID7v1glkDy58VSUGgB0l+txIE6jWxEWB6yIsNMY/q3SL+kSbs+1ZOTnNBR8b71RTeq4RX0BddPlLFzh0eyfjF9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C149KTbY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03DFBC2BCF7
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074366;
	bh=4oqhKxSl6S1RsFHdGwmf9PotM8LppS+cUllkvGeDkVs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C149KTbYCA9U61SCzgzCm70rO1JgPLfEtMIvzT5CW/2ZP4UbnwVKDKSXNhto32tii
	 q6wA0e1oJO3M9DugcDsVdj/hsqr6MNKb96Mt2NPBz8NSA4mY1sG1ci3Auj3DfeQkHb
	 sI5//eYYuMhZN31pWyR9VxaFCd01gZV/WA7JFv0n1BxXiMeX0+5p2Z2QUThpRUNcaJ
	 2UfETqBSVu/bEJCstqpw+01X30dlY+LiWvVjI+9yDgoVli1wXORX50mWZQy7S97OPU
	 5dUpxP9r08smbgIT8Ui9GFVs4FC+QkJtuS703tQATquvkrB9uth38aE8SuM+CoQmYv
	 ztzBkxJk96R+A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F07BEC4160E; Wed,  6 May 2026 13:32:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Wed, 06 May 2026 13:32:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dylan_robinson@motu.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-c6cal7Ef1H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 5E66A4DB030
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37011-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #26 from dylan_robinson@motu.com ---
(In reply to Micha=C5=82 Pecio from comment #21)
>> If, for any reason, a service interval is missed, the alternate setting =
must
>> be toggled back to zero and then re-enabled, and the stream restarted.
>
> Does the same apply to missed service on IN endpoints?

If the stream is interrupted, the alternate setting should be toggled for t=
he
input streaming interface as well.

> Or IN endpoints with lost/corrupted packets?

This would only affect the ability to maintain implicit feedback
synchronization. As long as the endpoint is serviced during the service
interval, the device's buffer will not overrun. However, if a packet is los=
t or
corrupted, the driver cannot determine the payload size, which means it can=
not
correctly derive the corresponding OUT transfer sizes.

> And for the record, are you saying there is no hope to predict what the HW
> expects to send and receive in the next interval and handle it right?

Correct, the hardware offers no mechanism to predict this. The device relie=
s on
implicit feedback, so the correct OUT transfer size depends on the actual
length received on the corresponding IN endpoint.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

