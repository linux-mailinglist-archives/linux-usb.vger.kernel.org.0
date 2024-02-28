Return-Path: <linux-usb+bounces-7277-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0571386BBD5
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 00:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81044B25CC4
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 23:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4190C7D06C;
	Wed, 28 Feb 2024 23:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EzXS6S0E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279DA7292E
	for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 22:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709161200; cv=none; b=YMEfiVv1yFb4uy1ra4UxkeDh5Lo6ErOtaHWoGhAZYdJfHl7JkZiCLAwWIvKnx7nUsIbsClf0APEmm9vfewUQGKRaZX0gIJrgz4uxpY9aVFuKr9vNWfPlUjxs4Rto3/b1pAGk7okQaSfka63wwkZWu0WTI8MQJqozO36wVu8iaUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709161200; c=relaxed/simple;
	bh=KLhVl79WXN9Ubg4coyQwz8bkIRdnew0Yg2ZrB2f1ZII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nSI7HTWG/nu2JjVHlTQ1ZA1xGNIJhgj3j14aATcA8SxQbHni7PpnikkyYEB3GT9D24KmGprRBC+e4ugpLkfPlXMBl5FTjGtUaUxnkbP+VeQN2kAdSlIH150PitlKqccepz5qKFiRDL9M6STp51m/zIS6BdTfYkc+tGyc6kevvA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EzXS6S0E; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-565223fd7d9so1995a12.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 14:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709161197; x=1709765997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcAcp9JyXZdmgBhUYq0E0dm3aQzmCgek1VqMgRhoKKo=;
        b=EzXS6S0EUoEGGHhnHGckWrAK1X0BLkXrXBlcpmmS8D2gGxYqFRX2BC5O52xMPEoiFw
         5/B8n0Wjjsc+nN7Q/DidplqCm36KqbF1sI9XOJ2xiPf+OmqiJopwUaAcU5nEubcHooPR
         RnhXG/JJFSzzzlsXaMw1oV6Kbg9olUErGz3kNIUOGVe+easPX62td4rQlnSA8m7vzF+u
         vglxZzUIHwwfjPaegOsS8/IxkofB0lyTpQ/WNDfgjOJJ+QXFElW1xVFoi0GBD8hoSt8Z
         dRvgjhHXtc7YdGDJ+jk3Fha++pk2t4a2KQpQZemg8ozeRHhialdjMjQ3cqyV/0+97dO2
         aJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709161197; x=1709765997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcAcp9JyXZdmgBhUYq0E0dm3aQzmCgek1VqMgRhoKKo=;
        b=q6q/Zx1/VThJD6zlql0eznKa9j02Ftguz+VPgOwefAYUyHqloYyhKsbUVMArl1i9k4
         8dPSr7op1eZtrLpOM89dql9dqNRozVTJXrK6+1kCIPZKR/H3OEYnOAjs3cF54Z8oWFKJ
         8DmjxtHSQTBa7/mQjkh4RKKMbXoneaadBYSexKlhLsEyxFhSQ8H7t2GLmNo0gApxctb5
         LH6yKWcdLlRf2zurTMJjqv/yQ96b83L7TJUnO9YjPlapCAZItbHvHBYEvQoGbnRNoonO
         o2iZ4FobPdnrQmi8JHya5u9up8/af+Blf58QX2qutKWMxB6xBaQ09ubshphwuNsuoCYh
         vRqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr4Y1FEpj0dSsFfYuHRTYKC9xGkAh3djr8035GLSpWxOxnRbwyKlqL+RZr0KMWoBZQNEnT1/5RKAkkmYLNoMPJswBqcw6TOpfu
X-Gm-Message-State: AOJu0YxnCJK6bMHY6LL7bwvsZZA8soIAKXl8y0P79n7Zp/9xdnb8fQwa
	H9+tFii0yNhVLI79gzh9VLOMuNWtcaQxwL04w1YwG4Ir/QzqHgae24gwdx6Axw9nHShf0OyjlyB
	qNdl1o4vW8WuHd98fNdjLrNgxkvWNiUQwycwT
X-Google-Smtp-Source: AGHT+IHpWZIU1zgRNJtryo1mYw56VDLKbEU1Iy+VtWWnb6Sjvu4R0v+EL3GOAZSsTEhy8UEVROA9gSxr+SGcYbNvZRo=
X-Received: by 2002:a05:6402:5206:b0:565:4f70:6ed with SMTP id
 s6-20020a056402520600b005654f7006edmr27867edd.6.1709161197359; Wed, 28 Feb
 2024 14:59:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226234228.1768725-2-rdbabiera@google.com> <2024022731-dusk-posture-b83f@gregkh>
In-Reply-To: <2024022731-dusk-posture-b83f@gregkh>
From: RD Babiera <rdbabiera@google.com>
Date: Wed, 28 Feb 2024 14:59:45 -0800
Message-ID: <CALzBnUHyUz2NoBxrj1m+W-Wuc23fLP7NBbJq=qpHx1oQcX8KRw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: altmodes/displayport: create sysfs nodes
 after assigning driver data
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 9:20=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> Now I am going to push back again and ask why you are even attempting to
> create sysfs files "by hand" here at all?
>
> Why is this just not set to be a default group?  That way the group is
> managed properly by the driver core and the driver doesn't have to worry
> about ANY of this at all.  Bonus is that you remove the "you raced with
> userspace and lost" problem that this code still has even with the
> change you made here.

To answer both questions, the driver had always created its sysfs
nodes manually so I did not suspect this was not the preferred way
to handle driver sysfs creation until I found your article on default attri=
butes
after your email. Will fix the patch up.

thanks again,
rd

