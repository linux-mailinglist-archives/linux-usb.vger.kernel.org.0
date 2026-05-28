Return-Path: <linux-usb+bounces-38139-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIgOGl1zGGq4kAgAu9opvQ
	(envelope-from <linux-usb+bounces-38139-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 18:54:53 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 705D25F5485
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 18:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2EA89301427B
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 16:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCEC3F888D;
	Thu, 28 May 2026 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsKDbIfA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BD53F6C2D
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 16:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779986732; cv=none; b=QRUopkj+mzKeteiAif+hOXiKi63jITuytGKRh0B9jUDbRzzWLogAym0KE9/VSwHEfk2A2A9npVhw1TsqaWYIofoRXsygOpaI+Zjq4Koh7KwyLyJGP7xspO8P5dGblGMOGPTRvkJtcA/aqaakFt79B/cxuNx+1b61Uoc5AsMA3ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779986732; c=relaxed/simple;
	bh=Jj7ML26PQTjvxqh2kYmSYqd9mqKRY/SbRRDvkNUUB9g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mT0x9yempGGpkSVrJTByIjFOFxGs12wYOwNubtyK6MkU4KQQaOjDmp6PUNodRhREqzZqvfS2y2OXrSV17YrmwaRDszf5ViOsr1kug92u8hL9M0cFvbSG53RpRWWljQdIwb7CySlmP38UABCJ5Cfwuh5Nf+fFQdehbMVMfxcuVo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsKDbIfA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso62210485e9.3
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779986729; x=1780591529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+tlXWib7a29ljZjrx5g+d0tTx+x+16PkIEERsQd7Aw=;
        b=hsKDbIfA1w18fYu6ScCpULh4gSfG027eDQc2SU9AMhO8C/BFSc/VtW++j1x9S/dgId
         uJGd4ZE8Vt0jVqIwiFE8uDGvjb9CpRhFERRewi2NmNU4XB6tXHlGz0PQfwFtqvK5C3VS
         C8Q7jo5oR5xGUlqpwHj9WJlcJVB/vT3aDZNXx+UzZtK+iG8NftqZPtBucNmYMjl/kltm
         HhQnXD0n0bb0DCLVBbevWvQTd45hsZ2/aFeGb6esj+OwMz6jJrCt3/5IqcFykbkRJUuO
         xWzB+SxvXOF9xwI/InCZWMH/iucm/yudYgNTMFBd6WS8QGJZQrAA+HItpsil6IHu6/Qy
         6fQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779986729; x=1780591529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3+tlXWib7a29ljZjrx5g+d0tTx+x+16PkIEERsQd7Aw=;
        b=iK+NPFrauvIV+eqRqxsyWpZJrBy3pEy47G6prrs0keiZRbhvMRzrdEAiH2I13CanGx
         2HE8nAjMbQ0xvxhoxHk23yCLcVMzOVknKRUVevbkUi26BAHpcvhQAyyUuwX55+Kdk2V2
         w0sVW0AmOYirKYzKuNWUYhU63D4zG74qOfs9LcW3GXyB7pvWoXQBbETfsT2RqOvHvI0S
         E5ItqcHioOXA7so+TYfe6Jy+J+1JzpWDWNUEGNIDmoVIBkc7wELiOyB5IIB2zqMBCXKh
         2pPfWu3t6jRPPHc2ewupMbS8PQssaWxdUMKrOGcfZ9QEly3qWHQRI+Ij24zEkwsulG9L
         BKcA==
X-Forwarded-Encrypted: i=1; AFNElJ+lAlztiZ7w9+bKwV1aa/w6RWNnZ36Y/kKIsMGCsIrLcS771ii7VNLDvjyX1lddH6Ugz1E0hQ2x1DY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMRJgQeo4wCiO05PjIU47o/FNGSZtlcTo06qCnvhWRzmB9qjh6
	N8kxBvMD/Gq+5Kwtlv28Z8txge1zVOzD8ihVSAANV+Ln1AdKxHawFRr4oY67Vg==
X-Gm-Gg: Acq92OHJKGPaxb2/TgYKNBUeLUPHQldbD4lkr1WuN89PiP/zeWJNsq/tug8qQYkVErA
	maKgpBsfqfZCwSW02ANSXTCrRICUoaQAw9qbSOpjc/QNpYgj0Gne+eYqe0WEFlvItz08UN7thEx
	gb5/jeaE7PSmdGXHqOD5iBgM5hHyTkMw3+hBHoGxaCshVNyV6Wy7yNpTyGLNS1xp1MWO0qF7GaD
	HR+iEFN/caxOR1rr2kF73y3e1mubQ37ZE/3gNzqFa3E2Xf102eog+fpTzI5mVhf+PC5+YUmv2ny
	e9YM1jmFYLE4dQ9HkLVBQu6ASVdkRX4LYlspDmgCKsOzsV8FX3SHQlo+Qu9MorMCv2Vd3WyTiwv
	wBSJOFgVzs5ATvVzrwdmePHjj6vIWn6CcQh4l/WQlol6P/iWw/GmdOcvSJAufkbjAcQq6QLKv2+
	bUy4eCEJNrYh91nd2wj+Xa8ltj3G6T8+CBTn2q7njOKSsOGTE4hvJDl7In
X-Received: by 2002:a05:600c:35cf:b0:490:44eb:c1e5 with SMTP id 5b1f17b1804b1-49044ebc257mr506726775e9.31.1779986729268;
        Thu, 28 May 2026 09:45:29 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a925acsm89762075e9.14.2026.05.28.09.45.28
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 28 May 2026 09:45:28 -0700 (PDT)
Date: Thu, 28 May 2026 18:45:24 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Henry Lin <henryl@nvidia.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/1] media: uvcvideo: reset interface on bulk stream
 stop
Message-ID: <20260528184524.08e98ddb.michal.pecio@gmail.com>
In-Reply-To: <SAWPR12MB9991187DB56BAB00EB2550E897AC092@SAWPR12MB999118.namprd12.prod.outlook.com>
References: <20260525182028.2148267-1-henryl@nvidia.com>
	<20260526015514.466b72d4.michal.pecio@gmail.com>
	<SAWPR12MB99911841F75A9492A6FA875421AC0B2@SAWPR12MB999118.namprd12.prod.outlook.com>
	<20260526121605.332525c6.michal.pecio@gmail.com>
	<SAWPR12MB9991187DB56BAB00EB2550E897AC092@SAWPR12MB999118.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38139-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 705D25F5485
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 28 May 2026 08:36:12 +0000, Henry Lin wrote:
> > Were you seeing one such error for each restart, followed by
> > uvcvideo dropping a few frames and continuing to stream normally,
> > or multiple transaction errors and complete functional failure?  
> 
> On the NVIDIA xHCI host controller, I see the former.
> 
> After each stop/start cycle, uvcvideo reports one -71 completion
> error, and only the first frame is broken. Streaming then continues
> normally. I do not see multiple transaction errors or a complete
> functional failure.
> 
> With 25e531b422dc applied, the -71 completion error no longer appears
> in the same test.

No worries then, this is expected behavior and a known bug, now fixed.

Regards,
Michal

