Return-Path: <linux-usb+bounces-37165-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHerMhlY/mmupQAAu9opvQ
	(envelope-from <linux-usb+bounces-37165-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 23:39:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF3D4FC00C
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 23:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66C2C301CCED
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 21:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE86430F80C;
	Fri,  8 May 2026 21:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="Re/VmbmS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE3E2BE7DD
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 21:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778276374; cv=pass; b=tk5Gyj6MyhvRgTeDMM8EQA0FFoWN/+wqgRQKES89x10J1zRbe6vkx4iNMbHgGuSXlZxnMywlt4qO+Y9OGKkbd2G/gRqPl4cKz2xvCKbpJdkItDPI3Aas21AJz4++WkxdDLittRtRwfT8Ko+ajWnibl9facuW05w5ZYJyAp5tzw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778276374; c=relaxed/simple;
	bh=s7BSUKmJrtMn32w+11vNmXVKs7VEk1lJfNOMU00Q910=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ncY3nifcY9hwToThXmE6fVK4wuBA8GOOU8nuNSdz74mfKnD6eDnHWu5ctzlg/OPijy4UT5PvTwbF/H+X9D95KFuWJx2G6qh6IyU668GiUJ3zJjKrcIfLKWqWD6Z6KyMkFkEs08bBNGyWVsQKaTxU3Qno8yc0TSo7VgPOYjezu4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=Re/VmbmS; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67bc8609a9bso4423099a12.0
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 14:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778276371; cv=none;
        d=google.com; s=arc-20240605;
        b=hHrgeWYWjov7PSkd7eLHVRgInY5Qi1b0FeLHY6F8sK9y7qKHcXqHY5a/Gl6gJviiFY
         mDs0rx2EiQvotQo5R5Gg9xxL6xDWRGfptGjhC9mXEuSFg0Bno9yxOPeM6cTxskv2gvdE
         gJAOd1O3z/2H2dOm5ZdEAaNFoJiFy9Ytslv9x7aIGr++iNzVeXz5qvh9z7h3XmkU4atL
         DNCuiMwgl3jVnmfpyqOo1/xEshFlfQAv+aAo0BCvIpN/FaBymBnz6uUNfdkDIWQXSn6g
         2AKE5xRONdMXgiUEZO5kK0kDNnBfXN07lw2LWBshhNz5NRqAFnDHeLboXL+23Ld26O9o
         iSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bWqDaGR73S7k5oXIpvpv1ZvoJq4F1L2Cy87jP5rVO44=;
        fh=6F+tS15QNO+/FNFp0DUuz8XPzmaXaG9nWlojS6wJsHk=;
        b=ihrbEkQvQWgWurRLE7C3Tdy8sESOCUQ8UQwF0MdlFzBw1adK5LMar7x1cdkJaYhBbU
         4ivKV2W5KDyNLUjjwiPTjFOMiO6xCOgkU5sTsksLUWJJRaX/BeXMYqVxxq8u0WUHKoRc
         hWBgXP3jR2pPw/uWUkqLGg52w2VacnTo5eKRBR3RbD1dnsEh0xIU7Wiir466zFTsr7P+
         ETPGAUqJSpX6oKf4wW4s3xZhGw4rusiGjSVhfS70rTGU4YemuRcqXp3gziOwBzcoP7iU
         l1UYdjnLahLTokWD7Jk+7NmEtO+ixpxoJPAhnk6fkcUjkb7ZpwT86IhMvhIhYt0LbBmA
         rPug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1778276371; x=1778881171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWqDaGR73S7k5oXIpvpv1ZvoJq4F1L2Cy87jP5rVO44=;
        b=Re/VmbmSmzrUmlEd1izSg1Qz5dPtS6Bs0DHsRP80vU/ZT4Xskyg2hiPil2i3IhQiIB
         2u0hlPsV9SqndQrKJzf+Gpf+mh8ojuCAb6nkc1oCwmuWIJlk4X+TLHFSHAT8ZkLh/E9A
         ztd6lJUDqI3CCgHgBB0QOnODfL+TRCKMiqRhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778276371; x=1778881171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWqDaGR73S7k5oXIpvpv1ZvoJq4F1L2Cy87jP5rVO44=;
        b=Hl3trtnH37fbZlZNE6MabKhQ2kYwxXEkgEuCmqq0WO6KWqkxz8iNqbyDKJD84c1rt8
         8QrT7tpGWnwDzV9Ddl/WOJ3bWxCGODYg/91bvd0Pi5oJGKFOf7LweXbB48tqwQztcsPm
         OQe5GfG7WPTCvssZF82RitNs+WMQD4J2NvQPflWByvwEK02LFBfDvpqs5gNR6B4Jx1mh
         NbYNrpIhyjNMag72F36AuNhDkLrfDondPILVBvk5xMcdOWl3AmVs05gPAdjX2od5Jut7
         J1jY3+js5C8CGzpGwiLSP3JNJ6iVRUC+x4sjAJqYgyjG6RgoA/vntJkqN+bueIi0kFGN
         g4Aw==
X-Forwarded-Encrypted: i=1; AFNElJ810ApuSMQ+nOqhatNUtCrbjnSVxSRLxtpAYS1+RvmvjP+KZWMzRHQr6OgywlZqj58TbLW74wRi+sw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPAd3qZWro6q5dN5sd73VnpBKglhBZD0EA7Qs/dFKR0rrPI/nk
	H2wFwlh93ZL9YAilimLLb+q1Ps9PtkMmNpLVuo2Qn7GejJAV1oxutaS0o6AWeDyc5ucj7U0HGOv
	dHCkW+OOYRariP8ahHLR5fIBOeC9VNH1kk3e9bf+p8A==
X-Gm-Gg: Acq92OGYap/8oX0OkA3wcFY0ZwDpQcifkM9qPNGiaVmB0jRVu5jSwsPC4viMNPBR3de
	Eu5A0Ii6SXK2cmXQZUshQaIDevD5KwMhrrksr/d3HRaZLbE5FP5pu/atZQXGsgBWgEhJhO65L18
	ES5KOhyF+4Z9NJEEkbsMWxT3mrNOhZebSH0+26GKezJOnyh7CUUQEYUvRHHBLFULyDE+0zgiYHP
	mGcrVyESK7IBkirxVj9QEzO5Gi+pAYGys0GiZHBfCJvAi3G3P14C9AH0ai9UcaBHpwiTMTWO8Lf
	GdCNwxst
X-Received: by 2002:a17:907:1906:b0:bc2:d65b:5a9c with SMTP id
 a640c23a62f3a-bc56be400a0mr865153066b.1.1778276371417; Fri, 08 May 2026
 14:39:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bug-220748-208809@https.bugzilla.kernel.org/> <bug-220748-208809-eL7PrzeMxr@https.bugzilla.kernel.org/>
 <fe08eabc-4f92-43fd-89d7-5e9d0e35c979@rowland.harvard.edu>
 <CA+Df+jdtQrYye85d7uZyT3jirsztKhf7qQes3LvOAPa+9qxSOw@mail.gmail.com> <20260507235432.71d28151.michal.pecio@gmail.com>
In-Reply-To: <20260507235432.71d28151.michal.pecio@gmail.com>
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Fri, 8 May 2026 17:39:20 -0400
X-Gm-Features: AVHnY4J1I5P8QKPRz86-gUwn6ffBfsHDLhnohZIvYm4t-PZrKBhr-9GriL_KxTQ
Message-ID: <CA+Df+jfkQ1QXyh=oQrX2y2x8N2=ZRFWFai5QHiZ2FC-hQqEsmQ@mail.gmail.com>
Subject: Re: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame
 and always assumes URB_ISO_ASAP is set
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	mathias.nyman@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3EF3D4FC00C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[motu.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[motu.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37165-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[motu.com:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dylan_robinson@motu.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 5:54=E2=80=AFPM Michal Pecio wrote:
> It would surely need to be optional on per-URB basis, to avoid updating
> all drivers and to enable sub-1ms URBs without gaps on HW like xHCI,
> where we can't request starting frame with microframe granularity.
>
> I suppose Windows/OSX have to be doing it this way too?

Windows isochronous transfers behave similarly to the outdated
documentation in Documentation/driver-api/usb.

Setting USBD_START_ISO_TRANSFER_ASAP in the URB instructs the USB
driver stack to schedule the transfer in the next appropriate frame.
For the first URB on a pipe, transfers with this flag are scheduled as
soon as possible. For subsequent URBs, the stack automatically tracks
stream continuity.

Otherwise, the UrbIsochronousTransfer.StartFrame member specifies the
starting USB frame number for the transfer.

Source: https://learn.microsoft.com/en-us/windows-hardware/drivers/usbcon/t=
ransfer-data-to-isochronous-endpoints

The USBDriverKit API on macOS for submitting isochronous transfers is:

virtual kern_return_t IsochIO(
    IOMemoryDescriptor *dataBuffer,
    IOMemoryDescriptor *frameList,
    uint64_t firstFrameNumber,
    OSAction *completion);

firstFrameNumber: The starting frame number for the request. You can
get the current frame number from the GetFrameNumber method of
IOUSBHostDevice or IOUSBHostInterface. Specify 0 to begin the transfer
on the next available frame (XHCI only).

Source: https://developer.apple.com/documentation/usbdriverkit/iousbhostpip=
e/isochio

> It's supposed to be implied that submission from a complete() callback
> is a continuation. I believe one of the submitted patches fixes that.

Because our devices use the implicit feedback synchronization model,
our drivers typically submit OUT transfers from the IN pipe's
completion callbacks. Would those submissions also be considered
continuations of the existing OUT stream, or is continuity only
inferred when a URB is submitted from the completion handler
associated with the same pipe?

Dylan

