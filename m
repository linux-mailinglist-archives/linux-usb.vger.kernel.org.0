Return-Path: <linux-usb+bounces-19672-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC54A1A59B
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 15:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8B6B1638E9
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 14:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B98920F98A;
	Thu, 23 Jan 2025 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwJM2eCw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE9B13212A;
	Thu, 23 Jan 2025 14:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737641852; cv=none; b=IiaiXAYh1esjw+a58M9dFQxbwMGoaYKWaDkVwiL33XJPabDG2Y62DhlQa8U5Is6UviejP1w9j1qSUcJjhjO0IwUfz8p/T0eFEFI2uLkCpLfyQYBq/LnMIGm5yWK6DhAVUfdUBJDCfGLS1daBiNCfmiM1MNj1u28ji1Pg8p8VHSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737641852; c=relaxed/simple;
	bh=3ba5Mapi/GhmrvtFCAf9OaKbTfUkj1osTlpgXiSy7f8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p5Uz760b5Ma00+FyeRkA2UPp3L+eW/B/AyYW6Z06M2I0ueweZyQxKMPwD6R7cjLY4GKp0TK5Q0GOW42864BnLL6/cVdC4pQgUZw1rtX8FJILVbI5w0gxnATEqBOgIsKaRcTvAXYAJSVruT6Blx9GVmD2mwijUDaxBdjKlN80Sek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwJM2eCw; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4aff5b3845eso323991137.2;
        Thu, 23 Jan 2025 06:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737641849; x=1738246649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbEHOc3RBX5HGNz7XCuMximIU2iFKtfG+O+9bzzIsGE=;
        b=JwJM2eCwuBJmw5oS6lhbYGV9gQvFoVq3/Cbr/BTrKPVhIcEqlTebRjBqRZSPa8lO5P
         3qKtbLBLfqyahGSzSoJjp4nKWPwYkrzECO9069mUevjgrKeuBGfYE6LChHJ3sg6FbcNb
         cKJaaXzgHT2byTor1xPRDpFXAuUvzfFVPjG8cByzOrr2E3LE48kg3WualrBejCnfsg3e
         JHvsQScnHzx7zUzUIqyzP9xWHYp5iD67kqwYk8ibR79td6Wxe8yFSl7n/psOmR+hh64V
         lXWAG6dqJVt+sDQDQfdG4lXILHQmVoQh+xaywsuK1lEECKuarxnhFK/Im6szX/iT9+xN
         RPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737641849; x=1738246649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbEHOc3RBX5HGNz7XCuMximIU2iFKtfG+O+9bzzIsGE=;
        b=DkXqfd+wjvxenGkN9HgSsZOH2iwHNc+Fh8XtYHyWjXXDZ3fmGL4NnK98gZtA4fUfS5
         WpSj6MoLyMQTwX5cOVt60vV0hUdUoEP+ImheFqjweuzi9ePBuDnS07Zyd+CicOZwsXpj
         RFZJJjzaaLTcrgYY1xDv9ufhKf95rPZs+3Rq2MhvoE3MCyS8HQiEW4hTkHILxllIit/5
         QRff1vRI8VzjW7yhDQpaoQ2zmpwxqjxUuQFdM1EzM4A3MiI5nzhB+EfU5pYx2MZ6sil0
         P3UwCyLaI9lPYIaOGNj+cs67ute3h3hNQ2iv310hvldNA6Xm3hwBqZiwAS2N6uds9U4h
         sDCw==
X-Forwarded-Encrypted: i=1; AJvYcCV1oYyauiY+63tRmYrx0QBETrnZ+FSPy+ft725lucUcFPhKcNS9wX4e7OXqSB/5Mqu2wEZ1+nFd11g4EgM=@vger.kernel.org, AJvYcCXI/JwSItfskeBJgeD0tu7Tu2Fi4MnduVQS02u/ngIU6em7zlHeg0MAp1/TEuFSA6OK2nuh7DBc75bf@vger.kernel.org
X-Gm-Message-State: AOJu0YypvaLKwArje6R4CoYrfIifbD9bawO3lDcRrnfliKkxz3E259ky
	HWy6w0vjFlCjyYSjtiF151PUWv7nRJS5mfNyCF3G6SrgU6TRaGTGr2Xj4M1moRzUwvr+lJNY/ji
	EXUdn2j4tIfdcLcNQ0cWHBh2c0Bt4X7OH
X-Gm-Gg: ASbGncv/pTp2oERSydaZV0XBKI7oLGfOyTrl1161tMNqYBeT9yxQ5piOqA7eT+Gt+kV
	LKZdZPObeAp4xzQWvCVKYYHT50OY9YGqxyHKgZIWiETkLEm3urDNmbButSbwQ7w==
X-Google-Smtp-Source: AGHT+IHtzjKmtaMzI261/r1zsEOu/itdeMQRoujzkyn/a3XugYSDHrHEk6cROAmH75IPAmgI/VadOfg4ZDmAQ5ET/O8=
X-Received: by 2002:a05:6102:571b:b0:4b4:7cb0:ac54 with SMTP id
 ada2fe7eead31-4b690b97757mr20280778137.5.1737641849461; Thu, 23 Jan 2025
 06:17:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123080102.1632517-1-usmanakinyemi202@gmail.com> <2025012315-feminine-spiny-b288@gregkh>
In-Reply-To: <2025012315-feminine-spiny-b288@gregkh>
From: Usman Akinyemi <usmanakinyemi202@gmail.com>
Date: Thu, 23 Jan 2025 19:47:18 +0530
X-Gm-Features: AWEUYZnK_R4zsT1JTN-VkN8WBGgu2oXg-NPTkjQ7f5evT_AtNBWBUKia8zJLdzU
Message-ID: <CAPSxiM9vF0=fzOovxC2nj1t1Naxx9T=QJPaN-oi5U-h7s5OwLQ@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: Fix documentation warning for sg member
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 7:37=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Jan 23, 2025 at 01:31:02PM +0530, Usman Akinyemi wrote:
> > The 'sg' member in struct dwc3_request was undocumented, causing a
> > documentation warning when building the kernel docs.
> >
> > This patch adds a description for the 'sg' field, resolving the warning=
.
> >
> > Signed-off-by: Usman Akinyemi <usmanakinyemi202@gmail.com>
>
> What commit id does this fix?  And what about the reported-by: line?
>
> thanks,
>
Hi Greg,

Thanks for replying.

I was applying to Linux Mentorship(LFX) for fixing the Linux Kernel Bugs.
One of the tasks was to look for documentation warnings and I saw this.

I created a patch for it and sent it also. So, it is not reported.

I am not sure if I am missing something though.

Thank you.
Usman.
> greg k-h

