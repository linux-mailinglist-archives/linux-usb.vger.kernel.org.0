Return-Path: <linux-usb+bounces-33682-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Er8Fk5fnmmaUwQAu9opvQ
	(envelope-from <linux-usb+bounces-33682-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 03:32:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F16F9190EB4
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 03:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FE913060BD4
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 02:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05395288530;
	Wed, 25 Feb 2026 02:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="unejiNui"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D31228CA9
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 02:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771986728; cv=pass; b=qeI+VoeFHFSBRWLL4eWlJac4Xa73i+zAo9sK84ZzU1wHqjEkZPZSSF0lih5tML5In6F21elH0c1PIBZmOSO8U83Lv9uMaPkI8690F/jcA9qzEJ3IwMcOtcYDQ3lytbVn9GpKlYCvxHicbmzY9Tg9J68T8mBPOM+W3xBqAI5OikI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771986728; c=relaxed/simple;
	bh=HMllSNLX/5sTo6GERROO6GON0rCra4+CbtOSEvH9L5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BU/cMNDBZNEsXANH0sofLyz1PWKEE4+jPFxk2NLkpVLPSA0UvfGSbo4rzz/ffPPJIE/YX9JW1KRPsKW7uRc4WjlBHjPp1jOQqU+n30d6aordvjdsrfiDkla3H2oM4SmdpRfawXn5dDqPR8dog2zgX+s6h78sKQxVK3rVlFFsPhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xwf.google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=unejiNui; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xwf.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-506a355aedfso220741cf.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 18:32:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771986726; cv=none;
        d=google.com; s=arc-20240605;
        b=PXIndLi9HgnLoYbqCQbp/uyTVCfxolQtqAT2ifC3bjsP8qhJ3AjOSfD3lEqNIxc3RZ
         /4QHhJe9hw3Mcy4XwVSbdID8cKf8c+Jgj4o2KMJa6XNKR2uGhz36CKFwFXxgIbBu7gAj
         ppwqapK1yFYDEZ0z/hb2pRNdbn4ybcygZ+J4V9LFiQ6z6zHqD2ATDTMIV8YDuS7IppII
         s0zjgFgQIjlSut/g3LxANjDCH0CBsysxmu5lufEowDJYxqMmOYhn44w9YYyoitPWloNp
         FFJTohFj9ad0wudNNQ9RcbkmZG9tLUG4vZRM095+AF05S6xTm9x7+PM3TW4GLr5jES8C
         VRAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=/Oc0EL9P9H90t/kP213jAXvrzQURQZDfc9BINIduye0=;
        fh=znz0d0IlmHfnDy4fb5/mmhGB6R7ztdVgAFgkAfN6PuI=;
        b=Z9oYgWR2KPYmE29WNZvEdQnosvP5eizSq80RABCj74Omvik1vOgYRu4g12tt7NRVQ1
         Dh/tCqE2fdvkztrwryTv2457rxU/pnB3sUvLhtVKuO+BO1mR7aismP53Z1zL0gAUzYrW
         9eXQ6cUHi5xvFqaGMJcCP1egkUIlX5IHVz0geVt+MqZc71rz1JpHpq1a7a+5mdHhx+Fj
         kGYImw1O5Csu6yCTnTDgUS/Abqh/Ubc1v49KzhIEn/WrMEejsEc8Y7RNMAzUfQoIqI5p
         ZOsZleiAIjCxi0HeuF+brrBjzi82vCr29cxz43pA4sbIOK+Y0IYc3GMYvI8Y8Gr8WOR7
         1kpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771986726; x=1772591526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Oc0EL9P9H90t/kP213jAXvrzQURQZDfc9BINIduye0=;
        b=unejiNui+bHysnuemKK2PptMSAUKcP6mXp7AJH6V5WCk+1VZDfYfC4X315bSzv7x5w
         +Sao94FGzB6cpIw2EGpgb7LNN7oHFkbseS291l+7zTyC3JEPPPB3dFk+AXmfFHexta0V
         cx5n7SpbAP6WsLpLjB0brqmdORN9peAChfWIky0qdw8Kis4JV8fvoxV5T2ix+R78Wt16
         jasAoz7CzoFOzx+DCPbL9tnGxiTZ9ul/SA0MWfdap39lDxj1G7JLT59c5ILqHOawLN/4
         IAe+c/o+wnARGPYF8JmknnF355xI+UdvdraM14RJUNvBhXAhEldX7RiaKpuluKsvM8dy
         hrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771986726; x=1772591526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Oc0EL9P9H90t/kP213jAXvrzQURQZDfc9BINIduye0=;
        b=ErVTCMU4A06ccEtTOBDH5q7R9YLCefusuz6r/iReFQ5dXvmnYfIu0ryh/TZZyAi7Ia
         1AwK/qLOOTuEwEKyRfBoTYx5xB3vJqXECeJVihc2eQade1ZN3L3SF5bZqikyohTi3hof
         4ReoyPql6buBdhsGSarKgZoRKZO8q6guDVA8bpNZwj0ZC7QOIK9FgMNs5OW+viMupJdJ
         R8ALV4d9/1krqwnC4+x/b+g+bpZ00ssdWgubX3wAtSTztzR8HaUsYp8YozD7X/75aRQ9
         UuRBNyHqUnqe8FwnUHJC6ZglzE9BD/3jWsywqD1X6zwBRxDoJ0abMgEVNTC64AsWUctx
         FApg==
X-Forwarded-Encrypted: i=1; AJvYcCU9len38ir9j5ijgg/6g0RzlRJtt6W/p/NrjZTFJJcgFt27oJzYPp41B63BsVkxPbd7DQWycLHn/T0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU5qMGu4sfnUsLgS3NZUYC4YlmFyUfy30ekmSwC1lo/BEddguM
	iwpP2slvCvFjILr7GpwCOzGF5m4aohwtcMLO5U48pkCehLUNWWBX7cM+9oMrTWNV/eOlyzESojP
	wZDnTiH/utwYZ55x4/tYTCOVTNMwuKx11mRlGfyVL
X-Gm-Gg: ATEYQzzz93pRlW5cqY2htPAtHHMRI7LQdkdDHfoVuhw265NNPOjSwbnVSlNN6BJNOd9
	RMIvQQpDZvhbcVZoLgdX4J3pFLUsegjsNCMSExLdk9+9/tNAYGgz1nkR4zD7wigyoKBfBnxyIlf
	U5DbKr8OVjgBeIyPxkUpvTIOdWvsypHLcDHSqBQygg/mXAc60PoKNCQRM2HqWqOHQjLnetw4SVQ
	QM6VavDrbZXedyce9kmF76LhdIO4IE5O3o8zcJxIsBNytkIoiShfri4dEgLcQNnaeeJMsoS7vPC
	3bCAo7g/sQNvKzv1zgiWCBBVv4rk8Qp5KHM/LQ==
X-Received: by 2002:a05:622a:30e:b0:507:358a:2b22 with SMTP id
 d75a77b69052e-50738178b0bmr1176721cf.0.1771986725687; Tue, 24 Feb 2026
 18:32:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224083955.1375032-1-hhhuuu@google.com> <50314bb4-1539-452d-86d6-47887a9603a7@rowland.harvard.edu>
In-Reply-To: <50314bb4-1539-452d-86d6-47887a9603a7@rowland.harvard.edu>
Reply-To: hhhuuu@xwf.google.com
From: "Jimmy Hu (xWF)" <hhhuuu@xwf.google.com>
Date: Wed, 25 Feb 2026 10:31:54 +0800
X-Gm-Features: AaiRm535jFf_Wd3ZgoopxvcP7tMlUs04xRpSxf28KxL1dbAIqD_-iutvqH8Q2q8
Message-ID: <CAJh=zj+qoLr40+sSMksRi5AG36GkO_kDk=axvPoEU76Md-NeCg@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_uvc: fix NULL pointer dereference during
 unbind race
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dan Vacura <w36195@motorola.com>, 
	Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, badhri@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33682-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hhhuuu@xwf.google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb,cisco];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[hhhuuu@xwf.google.com]
X-Rspamd-Queue-Id: F16F9190EB4
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 11:47=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Tue, Feb 24, 2026 at 04:39:55PM +0800, Jimmy Hu wrote:
> > Commit b81ac4395bbe ("usb: gadget: uvc: allow for application to cleanl=
y
> > shutdown") introduced two stages of synchronization waits totaling 1500=
ms
> > in uvc_function_unbind() to prevent several types of kernel panics.
> > However, this timing-based approach is insufficient during power
> > management (PM) transitions.
> >
> > When the PM subsystem starts freezing user space processes, the
> > wait_event_interruptible_timeout() is aborted early, which allows the
> > unbind thread to proceed and nullify the gadget pointer
> > (cdev->gadget =3D NULL):
> >
> > [  814.123447][  T947] configfs-gadget.g1 gadget.0: uvc: uvc_function_u=
nbind()
> > [  814.178583][ T3173] PM: suspend entry (deep)
> > [  814.192487][ T3173] Freezing user space processes
> > [  814.197668][  T947] configfs-gadget.g1 gadget.0: uvc: uvc_function_u=
nbind no clean disconnect, wait for release
> >
> > When the PM subsystem resumes or aborts the suspend and tasks are
> > restarted, the V4L2 release path is executed and attempts to access the
> > already nullified gadget pointer, triggering a kernel panic:
> >
> > [  814.292597][    C0] PM: pm_system_irq_wakeup: 479 triggered dhdpcie_=
host_wake
> > [  814.386727][ T3173] Restarting tasks ...
> > [  814.403522][ T4558] Unable to handle kernel NULL pointer dereference=
 at virtual address 0000000000000030
> > [  814.404021][ T4558] pc : usb_gadget_deactivate+0x14/0xf4
> > [  814.404031][ T4558] lr : usb_function_deactivate+0x54/0x94
> > [  814.404078][ T4558] Call trace:
> > [  814.404080][ T4558]  usb_gadget_deactivate+0x14/0xf4
> > [  814.404083][ T4558]  usb_function_deactivate+0x54/0x94
> > [  814.404087][ T4558]  uvc_function_disconnect+0x1c/0x5c
> > [  814.404092][ T4558]  uvc_v4l2_release+0x44/0xac
> > [  814.404095][ T4558]  v4l2_release+0xcc/0x130
> >
> > The fix introduces a 'func_unbinding' flag in struct uvc_device to prot=
ect
> > critical sections:
> > 1. In uvc_function_disconnect(), it prevents accessing the nullified
> >    cdev->gadget pointer.
> > 2. In uvc_v4l2_release(), it ensures uvcg_free_buffers() is skipped
> >    if unbind is already in progress, avoiding races with concurrent
> >    bind operations or use-after-free on the video queue memory.
>
> Sorry if the answer to this question is obvious to anybody familiar with
> the driver...
>
> The patch adds a flag that can be accessed by two different tasks
> (disconnect and release).  Is there any synchronization to prevent these
> tasks from racing and accessing the new flag concurrently?
>
> Alan Stern

Hi Alan,

Thanks for pointing that out. You're right, the boolean flag lacks
proper synchronization for concurrent access.
I will submit a V2 patch using atomic bit operations to ensure memory
visibility and atomicity across tasks. The changes will include:
* Replacing 'bool func_unbinding' with 'unsigned long flags' in struct
uvc_device.
* Using clear_bit() in uvc_function_bind() to reset the state.
* Using set_bit() in uvc_function_unbind() to mark the unbinding phase.
* Using test_bit() in uvc_function_disconnect() and uvc_v4l2_disable()
for safe checks.

Does this approach look reasonable to you?

Best regards,
Jimmy

