Return-Path: <linux-usb+bounces-33913-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKNkFVT2pmmgawAAu9opvQ
	(envelope-from <linux-usb+bounces-33913-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 15:55:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC5C1F1DB8
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 15:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F5093019C83
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 14:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBA43B4EA4;
	Tue,  3 Mar 2026 14:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vzjuxse7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2C3391511
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 14:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549713; cv=none; b=kRYPHZYNoua7j45H5B1xmcHuY4Cd49koD8Aw5QXpe85P/fXjfOZVDi4fZruF91oryOumASOmovMs2MZeuMVwU2gRu0Ypo2m0dFkYb6XbIHJaRmcEeBHtHyODxRBYgCtrlNT4iE2mLg+rZFw5ZIuzZC9ireH6lxI2L5dWNAiL8Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549713; c=relaxed/simple;
	bh=OR5WRIwX9uAavLNubIPGA5b9KvJbd3MeLe9pZ/RKi9s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ocvw1ptYF8uDpmm4zmiAgIl+hO/xoDPJfdcc4jceNZGtBg+nPKk0RkUNxU4IZqx3u+tyI42ChI+0sicTVA+4q//7oGthOuHq22GH968CKLbz9aN38zYA0019dOTxIObpRFY6E7CzD6m6rVICplg2GG6uTwpFibMNyRmFMqxQz6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vzjuxse7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7F78C2BCAF
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 14:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772549712;
	bh=OR5WRIwX9uAavLNubIPGA5b9KvJbd3MeLe9pZ/RKi9s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Vzjuxse7LeMMWX5IXnv91PvAH/0cKDPgFuwEUfPp4JG4xLfRWyl0FWDo4O03TwMvt
	 t+n5CrHWD3fUyagqOWiTEX+gJdsvfCMHn+a8JzmMrt9Y/njx4fq8bRdhhIEh9TxWnq
	 EGhJIaKgGxcjDfsqITIwBXzhLmeP/fNqJndVAczv0pCg3gojwret7C/meyf0CvcIgk
	 17l8VpWJzQloEDjjLQvJcz0o+7QlpViZO3eS8sZz4m3/HXEgzKNBhL+nSghmDXLE6k
	 vnICiA14/GF0fOY3pd7tzWRC0icAF0tJddHr/Q1Z9rc4cJFHHrpXoQdwtC6cnSLH9J
	 bke9MAifJ7O2A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E2F02C4160E; Tue,  3 Mar 2026 14:55:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 03 Mar 2026 14:55:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david.c.hubbard@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221073-208809-CtaoxJzh6G@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: ECC5C1F1DB8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33913-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #21 from David Hubbard (david.c.hubbard@gmail.com) ---
Created attachment 309524
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309524&action=3Dedit
comment16-cap02.tgz

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

