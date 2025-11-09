Return-Path: <linux-usb+bounces-30231-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E568C43A31
	for <lists+linux-usb@lfdr.de>; Sun, 09 Nov 2025 09:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36A3D3B1D4E
	for <lists+linux-usb@lfdr.de>; Sun,  9 Nov 2025 08:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1812B2BE7C0;
	Sun,  9 Nov 2025 08:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAwzjIZk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13F9285CB3
	for <linux-usb@vger.kernel.org>; Sun,  9 Nov 2025 08:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762676698; cv=none; b=Jy3DEZfCUm2ea7aWzzA1lAiEt8msGvTcC/LkPX2lfpvJ7C7XZo1WKNPPd5v1OcN626w6wPb8yM9dr7+d3d6rb9LV+EEZR5FiyneiU3AowAeQjeHlBclEQ82UwxVFVjopRDHR8tg3OUHphZKQcuFPweovWvhpyBXgx2jhJKl8djI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762676698; c=relaxed/simple;
	bh=8QutaIOTS2UKgLlFlZpPLDmzPaijAHjAoxtwNrbsxkM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bdNox7DeD55U6GEEWoLLKVrR6liecKjHFlU2NSDhXno5vEMQqgWR+aVnGtrp88yhqohuTGMJrxAAVScUX9Jow6ZDn+WCqA0B0M4TZVZD/T8CbB/ld4j/HZwJwFtIpSdlxVVLCAve8asGI4ORjHFNY5cnad1eX/rz064bjcQtEgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAwzjIZk; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so1635168a12.0
        for <linux-usb@vger.kernel.org>; Sun, 09 Nov 2025 00:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762676695; x=1763281495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsY9vujuUkA8+9u3dm1loJg3PkrFnGp+k0msPuKoiXI=;
        b=hAwzjIZkXo2S12Yzlenw0TuyK96zMI9CQ5FVw7W9i42ybBTGbsqdo4+KJjwlpoXzPp
         PZC22KohFVTO/LUAjhl6w8VMqmals8yTwyP6sFrhaFHKuNmi8bvOthfx0e++QKMsE1mz
         p0z2jVY6V6oInrJufK+18LThmPUFe0wQHl+6fYF9aYPNSrlP2HEd3MWieShz+r+gga8I
         /Z7UMFbxvdqMkYHsgpa+rP14R38EXhDW/H8oUrkz8OYBNoHMTMXfCS+9dBI6JzM7b50L
         oy7WnySFbn2LOVWaqyZPKHCXvqwnDlcQ0Q3crNsZqACvvEfDARXPDKhsZq6eKSPwxmJO
         dOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762676695; x=1763281495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jsY9vujuUkA8+9u3dm1loJg3PkrFnGp+k0msPuKoiXI=;
        b=R4Uxs1Zj8ufIMvosLT5RD5oFic2KGYqTJgqyf+/wX7hm/M7GAYnLlfo50nnGSnSYH5
         CAlQx6rWrjSQSmT0Ajruy/6J5+nOgIpcjEE4oMc/AeZCfsmsdiJR75dcN0iYVU1haEOb
         +TXtcS/zyrO6tZOKOl02pz2cLTl9ZhajWMtDYdaa3dFyFB10Sp/lwXI0ntLt/7TP6KI3
         ohnftv8ilXSSTEEOtJBTQyJHY4bv+TdhjEkddvDP9g/aYL+/9hvY6QQVHT/GofdrWier
         tJhN+ljAKkXdzG81HXyOehNqh2xtnbIXGY5RLsDc/MFuEOh9Yy8UGpq8vEhUg+w4q9cV
         2XSw==
X-Forwarded-Encrypted: i=1; AJvYcCVhyRAFL8Vu1+IQ1BzjgpqFANRNZzkCEF0HlTxKYYIow4F8fBco+rnOhF6UlX8y7JjVGcb9BsU29v0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCYv4194dxixz/oxMd9XidKVmXt2RFPTxQmzvCEaRdUKAUEMBv
	qFCZy6RuBlIny4qELRkEqDxsLpeGJHm/fFbVPswRisyak3TCV+ciUMYX
X-Gm-Gg: ASbGncvgnHV1ENA7AdVdHy6GydPFIaN5Wpzxm8XvwibbtFwqZni7loiJgbZVSQXrZam
	eA0egrUHsjBUaMwHT7joh3+D2i7cNDk0x5Q5wmsOopeTbkEMX/4PNyjtA5enYkLoXmtU+YAPdpV
	cX1PowMHPYoN4E3ZmLUOF/j9S7hrL5LEBenFK+wR+ZR3VjND6l6p5mMfSNqWTtqii0un9j8UMZG
	6U4SNgBDXRHfCyQqOxEG/GoCkk85ipzCXJnlNqkFwXW5G3I7fDW3sLrD7DIVurGG/cofxzskoMq
	cm4YEpACYkZvutoR87e9KJ9pymBzWmfpQvrLAT7rXM+t7DiNdvfpWoD7qtzkEk2Vov9yF2ID5HC
	AHFLWpmCt4KS+/tVCNDPbpgC6CRFdUWFTKm/VeHDuxju0RGKM1TkXZPjBbSplFT5m1MSagIkmny
	fA+MFii9nBLsUrA5g8SMpt8W7/uoYkCZg=
X-Google-Smtp-Source: AGHT+IHaWgjaeW7jvwLPGVE4BhBjXl+cVU/lxIG2fay1zIq+LJVECaQIY3bgCDLJU8dqHSKKTTKOiQ==
X-Received: by 2002:a17:907:3ccb:b0:b72:d43a:4fab with SMTP id a640c23a62f3a-b72e05e5a05mr361558066b.43.1762676695173;
        Sun, 09 Nov 2025 00:24:55 -0800 (PST)
Received: from foxbook (bfd52.neoplus.adsl.tpnet.pl. [83.28.41.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d461sm794755966b.47.2025.11.09.00.24.54
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 09 Nov 2025 00:24:54 -0800 (PST)
Date: Sun, 9 Nov 2025 09:24:50 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: The-Luga <lugathe2@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Terry Junge
 <linuxsound@cosmicgizmosystems.com>, linux-sound@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <20251109092450.693bcbe5.michal.pecio@gmail.com>
In-Reply-To: <CALvgqEAo8-MhE3ievoDkq4AOxRZ2E52kcko+GxYyf+WZE2H0=g@mail.gmail.com>
References: <CALvgqEAq8ZWgG4Dyg_oL7_+nUDy+LUoTXi+-6aceO-AKtBS3Mg@mail.gmail.com>
	<3eb2564d-5008-434e-9698-99b0cbe4d1cc@cosmicgizmosystems.com>
	<CALvgqECkMdntW2He8C7EcvOtCL-PpiXM9xNXWHzGtgimDxezHA@mail.gmail.com>
	<d7e888a6-6a65-40c1-84af-058b97ca0178@rowland.harvard.edu>
	<CALvgqED=rBkNYGkFdOXjUi1g_vbLac5Z38Z9xCRfpF-Vmy4Mww@mail.gmail.com>
	<c5c863f0-1c68-4d49-ba9b-b55c0f71d30c@rowland.harvard.edu>
	<CALvgqEAo8-MhE3ievoDkq4AOxRZ2E52kcko+GxYyf+WZE2H0=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 9 Nov 2025 02:18:44 -0300, The-Luga wrote:
> The speaker has a physical knob that changes brightness. When the
> speaker is disconnected from any USB port, the knob works fine
> increasing/decreasing brightness. When connected to Windows, rotating
> the knob (either increase or decrease) changes brightness normally and
> the speaker does not reboot (without needing any vendor software).
> When connected to Linux, rotating the knob causes the speaker to
> reboot.
> 
> All brightness changes/reboots in the previous logs were done by
> rotating the speaker's physical knob.
> 
> I believe this is a firmware bug on the speaker. My hypothesis: after
> each brightness change the speaker expects a particular USB response
> (the default response Windows sends). If it does not receive that
> response, the speaker thinks it is disconnected and resets.

I haven't attempted decoding your usbmon traces, but based on Terry's
comments, the device disconnects immediately when the knob is rotated
without even sending any HID packet. The original trace begins with
root hub traffic - likely disconnect notification, followed by failure
of a URB waiting for HID data from the speaker, and new enumeration.

If anything, it looks like Linux is doing something to the speaker
which makes it enter an invalid internal state and then the firmware
panics next time the knob is rotated, before anything is sent.

I wonder if there is some way to block 'usbhid' from ever binding to
this device (not just unbinding it later) and see if that hepls?

What happens if you pass to Windows and back, then rotate the knob?

Regards,
Michal

