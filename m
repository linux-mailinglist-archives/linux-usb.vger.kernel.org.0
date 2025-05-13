Return-Path: <linux-usb+bounces-23904-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08808AB5309
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 12:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99C869A6C3C
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 10:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14F2239082;
	Tue, 13 May 2025 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FiT+2ot0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6017F23C4E7
	for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747132202; cv=none; b=YBHuGa3Zf0bgeYoKtCp2A27OnoXVZYjiuuvOlN6Q82PO0SrXycw7XorQBVTlwjnUSy5H5vkiec1YudV1SB0NiXJfyjdLU6ujJWlp4U7RTzz18DndUnsF5Rh27qecXIoCJcqcG7/iyINFqEm77xyu/VbFRUyA86iwTjvvmIwx/7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747132202; c=relaxed/simple;
	bh=v7bzZFG8ljpDChj1tUYUnGr0e7oGG2NcjvbD/3kSYbM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M9FlMySx1VqoZa5nnJI+NJbnp/PpYTW1lZuW+iyTorIDGFC0VW2PgOXtkZ8IMBK4PYbTtFkzagvb37h+WKdR1JcAhDI7NXst8uhMNgf0KSLDJkG/74ou8qj5Zqv8biq1VNmMNDPI1ycXP6lH4mXN7mY72c2IXLi1vL6fmXiTyR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FiT+2ot0; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54e9021d2b5so8009177e87.1
        for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 03:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747132198; x=1747736998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7bzZFG8ljpDChj1tUYUnGr0e7oGG2NcjvbD/3kSYbM=;
        b=FiT+2ot0lRNnIItIYRwrak2WisaULDWXH6HgGBIhVVi1d9CmUOux847v7T2tpkPtfK
         LrMoV6FXk5hu7HtLb44pilr9MdwZ1sh6eOoW3EigVG8GY7Au0tiCqnREOxxQC+d+y/Qy
         fMMgL3Q5GBhS5F4/sxX5AgMzBjJsB84i4ACdgGXR7co/MKnLG4+g7y/luixSYjU8R+oR
         zhehGOh1fwDdVOLdZm6Fr7UZTCx/vrYUXKNIUGnU6uZfZEF5nHJsGthK8xdfAeaKZTlg
         u0dZKfB17O3jF0weERxBoCIhEekCmgjPWvanzfjjw1bXQpqSMjTQiHCQa3sHDYcykQJ0
         rDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747132198; x=1747736998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7bzZFG8ljpDChj1tUYUnGr0e7oGG2NcjvbD/3kSYbM=;
        b=N556UeNIyyaWDGxN2K4MD4txK9lUXu1bDxZVduqzb3kfECbYey+ME6Aqgj1TKijupi
         ZAgtE6dGG1fKhpHGOQ1sErOUZzN8mondQ3bGFfLWbvmbfnD1EFC2/1FGiYqLSdhb9J9D
         lUfEsOBVOyIe3x0/hQCXQJ3gFc3rAbwOKAvdsVR5zPXZQf8ZpqZjyxsIAt4nFPnQQwiX
         ToPV/SQbyEekm6LOb64pv39HOdfvSeSDl7az8VgKBq7WwYtd/NH9nsKBFF1lmaD/lSHe
         hkoMhbbWSDnD2jK9HI49hZNXICL4r5kBNks4WEIpqHbIJDEfW0vpbOygFAusVBqlr1sW
         kD9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgWhQSCK/IyLnHwxVu3O23vzNvLIe3UsRoacZTKI0d9Vsv1KAB5ZeQMQ6o1UfnJ7xbBAiTsftqbEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHCVF49HZK9w66xnaSFd0SKIlHoxX7h4gBdTQdMvbaDvPrGwNm
	Lkr0/Li3z3wj0niQT6a90NFMBiCeb3RRs2zwtu4PSKcv23tgfjZf1PAJwg==
X-Gm-Gg: ASbGncsSuP3Ir2IUGK+tSPwhOuhIX6j/3Swdtw5BxpapOKugB4y1uwiVnKzW7UPMv3D
	qvbwJxNGPNm4XmqAHIzyqQmjMAyGzda6jW3/DhBfy0J1jczC/UpMRr2EMpSIJKYgt+xrtpXHxlF
	gMWcy0qgETKf0sqYMxSCOspcBz0sPgRoYXWsAWm59IaYsKMvdcY53h5VgM/CNjZ0kXXMPavII0u
	gK0tRe3CdX3wZ20QQ8biOfLpw//0rwbMpQIol/o5YQ2lFW8SelNJ1ybiL5Fp58bOvj5AOgHslX5
	b0VGLty6NUAZGmMCp8kC0FAK1m35BVHsTjnCNVjhfLMamqdJGUu8XDVZcYGgqFR45aQU
X-Google-Smtp-Source: AGHT+IEotVpDLtV0fzkfCT8VvGRShpU4/gzIMUnIxqho3V9QznFaFzreuDxipVQTlrYpvpm0GxGq7g==
X-Received: by 2002:a05:6512:670d:b0:54e:784e:541 with SMTP id 2adb3069b0e04-550d0bc4982mr826172e87.14.1747132198020;
        Tue, 13 May 2025 03:29:58 -0700 (PDT)
Received: from foxbook (adqk186.neoplus.adsl.tpnet.pl. [79.185.144.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bfe46sm1817227e87.194.2025.05.13.03.29.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 13 May 2025 03:29:57 -0700 (PDT)
Date: Tue, 13 May 2025 12:29:52 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: Problematic Set TR Deq error handling series in xhci-next
Message-ID: <20250513122952.5a729311@foxbook>
In-Reply-To: <c606689d-e680-4796-bb65-87424a157e98@linux.intel.com>
References: <20250509114138.7052dd3b@foxbook>
	<c606689d-e680-4796-bb65-87424a157e98@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 May 2025 16:02:06 +0300, Neronin, Niklas wrote:
> The purpose of this series is to add some error handling and improve
> warning messages.

Adding more information to those messages is great and IMO it should
have been done long ago instead of an xhci_dbg() that nobody enables.
These errors are sporadically seen on bugzilla/linux-usb and it would
be nice to know why they are happening.

I have done it on my system and it helped me understand some cases.
I found nothing terribly concerning, by the way.

(That being said, I don't like multi-line messages: they reduce log
rotation period and mix with others. I added info to existing logs.)

> Fixing the root cause is another task altogether.

But if you don't know why something happens, can you really fix it?

In normal operation these errors just don't happen, and in abnormal
operation there is no guarantee that normal recovery will work. The
driver already tried to avoid error by normal means and it failed.

A code with no known trigger can't be tested, so it may have bugs.
And it adds maintainance burden because people fear the unknown.

> Before, the only difference between a Set TR Deq command failure
> and success was that, in the case of failure, a warning was printed,
> and the xhci driver ring dequeue pointer was not moved. Otherwise,
> a Set TR Deq command failure behaved as if it were successful.

This is adequate for two most common cases that I know. Fristly, the
mysterious command TRB errors on ASMedia. The endpoint is stuck (but
not halted) until UAS times out and resets the whole device. Same
stuck endpoint behavior, but no TRB error, is seen on other HCs.

Secondly, xhci_handle_halted_endpoint() doesn't queue Reset Endpoint
when a SuperSpeed device is unplugged from the root hub. The endpoint
stays halted forever, so Set TR Dequeue is unnecessary and it fails.

Simply ignoring the failure is not a bug. Waiting for the endpoint to
reset (which never happens) turns it into a bug.

(This series generally fails to check for errors of command queuing
functions, which are not guaranteed to succeed.)

> In my opinion, instead of ignoring the Set TR Deq errors it would be
> better to retry the command if the error is due to something easily
> fixed, such as wrong EP state or Slot state.

There is nothing easy about stopping an endpoint, last year we spent
a few weeks with Mathias making it work.

See commits fd9d55d190c0 and 42b758137601, in this order ;)

We won't call xhci_invalidate_cancelled_tds() unless we are strongly
convinced that the endpoint is in the Stopped state, or the HC seems
to be completely disfunctional. (And I just facepalmed writing this,
because it looks like 28a76fcc4c85 does more harm than good, I think
will need to revert it.)

There is one case which cannot be detected by handle_cmd_stop_ep():
Stop Endpoint completes sucessfully, and later the endpoint changes
state without a doorbell ring. ASMedia HCs actually do such things
when they manage to corrupt their internal endpoint state. There
are some cases when stopping and restarting a (periodic?) endpoint
appears to corrupt the control endpoint; it generates no events or
Transaction Errors for no reason, changes state together with other
endpoints, etc. Resetting the xHC is the only solution I know.


Michal

