Return-Path: <linux-usb+bounces-30451-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D62FFC52309
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 13:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 868491883F55
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 12:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82AA3314B91;
	Wed, 12 Nov 2025 12:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eN0yZ/Gd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F692749C7
	for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 12:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762949046; cv=none; b=J703ZuTWM06aIHw9AhMzgrbzRKnxx6ShH2l4uDjoAelw14JKX/frdykRDLuqo+4dN82/1BT+EQfnvqTu2JVgwCAUFO7F1CrvilY/M17YB/5nNuoC33ljIpDFXvW1AaPXQilt9sHWydBz8LtuEmEkT74YClnYmC+XyYyS1Gs8g/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762949046; c=relaxed/simple;
	bh=nNr0DUZQ/8VLp4TzCwfgS18j02/ugDLQvov96VmfdRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fZ282ksQOKtnP+fbgSWv3swe4xJeGcZYQ24QFnOmijQz9/0GcQ5qCClYVnW5LmobPWAQviVJPF3PZY60PiWMw+lOC9UmKndp6h5OA89zIy8S/SeqBG5Z91bv3aUBwqJ3Wo/YIYqn7nwNuXa13cg+b84mA6GdE6d/GHyt3dNMLQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eN0yZ/Gd; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37a2dcc52aeso7001991fa.0
        for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 04:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762949042; x=1763553842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNr0DUZQ/8VLp4TzCwfgS18j02/ugDLQvov96VmfdRA=;
        b=eN0yZ/GdlrTRdl7LcIBbsRDvAaIKeCF425nc881BBSymEqQ5e4AWH4e77NH9S17JnR
         IzeTBtaQX+2WtINAWwkinEnVdHXOGo3/pHN+xO35wf05a7Ck4QI5mW8gRbLpRGfyhqrK
         LMwVpIkDSOhmNRuoLDrORmC9MCRXP7TPyQfo4cdNNemCpIU/aRxr1yGfsjrEdfF4TLPz
         gqOhDeyzxZEl8XmCiUh8j0v9z4p/j1/saN8J6F3wU0mTXkCp7K9h0PDbtXCeTj4e7HrN
         MeYfPPi2bDXhFUdOQ6KfyvAxtvhBy6gY0m6BsmTq3DyP3+A7FigKj5Fww5P5USdOqQAF
         aUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762949042; x=1763553842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nNr0DUZQ/8VLp4TzCwfgS18j02/ugDLQvov96VmfdRA=;
        b=NN3W0F5m+SZktVU3j7AI3642/feSXKnKX0i8uI4dBfupfhNb+GuIpVPZWyOnAO1HQp
         81h5hgzYmFYtNpRF6J9LqLaqVBs3aemuBiFkrVeTPlsEUnibQ4nYRoPyOFpkJbrX7Ow+
         GPOhKDGjwQG8MJ2MF2XjpwEQgOpe/GRQm3py9bJdYmkBYPMhiPoxYFjm2PymMEGjX7Od
         WSPe3f28PO98iVxgTlFWIkPFv6XLEnKMuoojAyMFR9JpHTS/NjkLIsZMEiMIoUbFbK5s
         utNuCoJGP1WVBJWKvkB7wJIi+cbS85Xtu3jsliTyOakSdOE8S+Hm39P5pHCUk5zSkCcE
         Ug8g==
X-Forwarded-Encrypted: i=1; AJvYcCVbR8CElXXW0L4WukxnMK7LfRCd+poHM8Jo+b4/Irku4H9wwdoGhXktl5rYFcYV6tiv/tt0UlVTUU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTRMQVw5gq8kCZurX+W3WU38Uqlk0UgU7VS97E+gkFUnVd+fMJ
	sNRv2xg0bXlLYtPLlNG7wA54LgAIaF0CogXuIZDOhUplykXwZJUnR2bLBJATOKEcCxTOUqWzX5n
	Wmbg2tjvX8MWW0uwtXZb3cwYcE/o3AjZsm6j0AJQD7Q==
X-Gm-Gg: ASbGncskbifz+gDWDjm1B+dKSyxBd9vL7Cn7sufzcsJI+QYEfjODjHEOpBQMKZzMGVw
	PCHp7eo+ahd6eIbf2s4deiuqRP2rTky+y+TOFvvOrH4zBcB7g1azIjp4M08icbrk/IQ95tN0O+O
	zNzSqMeX9wg8uy/V6AkjBKkaF/hoU9NY5zJwSxJ1TphjAl4ahXuJShEhDFuHoqLYBJ4GDz+9ptQ
	KrlFBWnjdieQfL+bFs3EMdHy6As0YiA9NehI4oxk4y+O2xFPtxGUElqHZW40C/3JC3M5BVSyP7J
	uESDNbk/Cy87Y1q9Iw==
X-Google-Smtp-Source: AGHT+IHusJDgxIuJ9r1OqE37V5j5KU56vMgrl6TNg3PHf11vdft9QhpgI4ltWiLi8t8k/6FGhCPY8ensI+CYekuVwB8=
X-Received: by 2002:a05:651c:3259:b0:372:921b:4b8a with SMTP id
 38308e7fff4ca-37b8c2f1e68mr7766041fa.4.1762949042292; Wed, 12 Nov 2025
 04:04:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106145428.250251-1-marco.crivellari@suse.com> <2a80955c-2e89-4175-9688-6ca29538dd33@linux.intel.com>
In-Reply-To: <2a80955c-2e89-4175-9688-6ca29538dd33@linux.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 12 Nov 2025 13:03:51 +0100
X-Gm-Features: AWmQ_bmzHlWeAuqugaGH_0u_xyxLnOXBHZMHqXUsR0DXraRJSBiumvY2GCO5Gww
Message-ID: <CAAofZF4BfthVOy6auxuxOyX3wDtrZ6tx6n6726Mf0xDXrwyimw@mail.gmail.com>
Subject: Re: [PATCH] usb: xhci: replace use of system_wq with system_percpu_wq
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 1:00=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
> [...]
> Thanks, added to queue
> -Mathias
>

Many thanks!


--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

