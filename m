Return-Path: <linux-usb+bounces-30821-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ED119C7CED0
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 12:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D60164E3738
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 11:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113BD28B415;
	Sat, 22 Nov 2025 11:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZpYGc9Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBE724A05D
	for <linux-usb@vger.kernel.org>; Sat, 22 Nov 2025 11:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763812156; cv=none; b=DrWtOlIqszYqjrLsP8C53P14Rh4zzztDlvuyjw+Bt1w//5Ev7Z9B+Xa56WG62PNsH13G/Nb5Hy7L9gvqQPXTsLus1PBSknQP3QWdD02M8Edlvgw7FZboMurrWJftbpt7SaXsFE+UFhHhRbDloEglR5Aoet/NMyQfYjXuNIzSKlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763812156; c=relaxed/simple;
	bh=Piyw/eZXFTwOKGiELJhpF2wh7PmuhkmgzzJs5lsAJwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3dAPiBt4aE1TablG1LvL8YQNZbZ65s4Oaw6Umuq1UW42xTbIaJCTYcKoa+NZhCLA/vwCnjRxhwsRcFckFOHVqyZ78tZHI6GgCLDex12OdBhH9kbsARlU7lF7F5yGSSBhaNjJtkrNQyMM/zi3djaiQ0O1ISzqtfdKl3AdqeiZpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZpYGc9Y; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7815092cd0bso27436067b3.2
        for <linux-usb@vger.kernel.org>; Sat, 22 Nov 2025 03:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763812154; x=1764416954; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+sk8ls8tBE63bGfmmvvJtsxQ9/7bS3soBrBwwAHdr8=;
        b=FZpYGc9YCIqYSySORi4xOUiVYcuTN8xY0PTRfjD4m9LHIqp7viStbrXx2wbSWoc7x9
         HOxoZBtDMPsmsYjPQuw7QcztAp8bEc97FMxDSa5RnfpNEav4x8ZYs9DGj8MFfx8QIO+G
         8sdq3G2Bjl6KIWVZ8/bIUIDRYoWLlDXvb1fnov+DVnAcSYqg8XV3HVf6N1HAnA+JeS3x
         rMqJcfAKkvVAZhG5dpUblNd7pRW0WNSGE1Tl7YiNloZ/MKhIKZT20a3WvBbc/QtVrAoi
         nIf4KFRFiJYGpMAEKu+Aau17evq5m+giQz4nOtFmlAnrAyH8gSeMlc48aVBspxdeavZF
         sEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763812154; x=1764416954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F+sk8ls8tBE63bGfmmvvJtsxQ9/7bS3soBrBwwAHdr8=;
        b=LSxOEEMSjuFuOq6Y/39BzQwpV7t6V4dz05NmkiiJc0pJmbIzFGOBm7cSv79oQO6T1g
         HnnkFVW0NRQ2YoJsZ/j+AV7iQt3Pgdr/+Wu7N1B24/vq6yjRoy9H7sg4aGWNfzy5NSZX
         Rs1chws69ly/IN4EP2OeuY3a988rFEFN04bBxqZqjDH85xBTghkfYCDhQW2r0xDPuZUQ
         8tTt6rgqvHLdEL4Ns16fQme8ciWh5mIucuoMXgiPNNnOV0r2kO9xEXKNbGH+C4YOdjmx
         1EA+SYaiL3jj3uKi0PV9ai4c/PTNnddj3MM77okn7lbdrM7bBrbLiFKxMdpsw+En9YRm
         ZJEg==
X-Gm-Message-State: AOJu0Yw6c3yhsfU/bP3sbOpZQyDkNAzexyS7pKmGElL1sECNi0lAjOLV
	LFfNqR2lAJ3q+9D10wmveIJmmJbG6ArdmY/ZvHIGjCr1sZt0OtHQIpWB9basoGNTtgnglRIQNhI
	UdrOPG4SUWzcqFvWe9M+0nqgtq+4WGUc=
X-Gm-Gg: ASbGncvqpn03n89GKAVYJdG3LjH9Q5nRBvEDsitilcly/F8GpebHhe7dRo24s64u2/F
	PaPLljBlNaKYL6HECH1Uo3s7iHzK/Mf7dC8pDCBbsd8jV0IBlSk4DUsFUDp6mKTfJRSQXfjkqFu
	1RDHyEjxdPu5HD3e3haJOsxaZ7HTyL5KdeUTGR/M1QltFzW0d4RiJhNG1nkrwzJDvlDZShdqheU
	uEecQ2sfuC7W3L1CAZaWpq+VaRCx+2Cfa7qYCRmXZuX/M17hLzM5gb9S/qCfki5jPR40mU+
X-Google-Smtp-Source: AGHT+IEAcvJj3XPHeT/Aekam158dHmsTKuLWFzqxQVOHmKnY8Fvuh0cgNKZm67j5s2KjGKD5bx5iWqzobQhhDFzYap0=
X-Received: by 2002:a05:690c:22c2:b0:786:69ee:15f2 with SMTP id
 00721157ae682-78a8b47b241mr91065657b3.3.1763812154084; Sat, 22 Nov 2025
 03:49:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122112539.4130712-1-jerry.xzq@gmail.com> <2025112253-quintuple-colossal-fcbb@gregkh>
In-Reply-To: <2025112253-quintuple-colossal-fcbb@gregkh>
From: jerry xzq <jerry.xzq@gmail.com>
Date: Sat, 22 Nov 2025 19:49:02 +0800
X-Gm-Features: AWmQ_bmE4rgsNFeXrV-uviaYIdMnzHjthTg1EPYkn2uvdXJ6jCEfoim2AZO9sTU
Message-ID: <CAD48c-Vp0gJZpBu0BobooWjKBksNJ+CcCTQRw1mzspoO2Zs5yA@mail.gmail.com>
Subject: Re: [PATCH] USB: of: filter disabled device node
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	treapking@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 22, 2025 at 7:32=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sat, Nov 22, 2025 at 07:25:39PM +0800, Zhengqiao Xia wrote:
> > We should not point the of_node of a USB device to a disabled devicetre=
e
> > node. Otherwise, the interface under this USB device will not be able
> > to register.
>
> Why would a USB device point to a disabled device tree node?  Shouldn't
> the device tree be fixed instead?

According to your suggestion, when a USB device is directly connected
to a USB port,
we should delete the unused USB hub node instead of disabling it?

>
> thanks,
>
> greg k-h

thanks

