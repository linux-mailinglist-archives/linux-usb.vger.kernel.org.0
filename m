Return-Path: <linux-usb+bounces-15467-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 276B9986588
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 19:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2E962868AA
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 17:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681F855785;
	Wed, 25 Sep 2024 17:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QSdzqXCw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825281EEE9
	for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 17:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727284828; cv=none; b=sht591uJUTm5m4qSOgcINfvYIluYziNqavFjciD8qMclqDRB0zAVQSdiUPHg5C3YhlQ6zh8u1J3tMnCpER24ju5d3V1ShwimOgz34lSMY1Lqn/u2vfguFt8+TAsk2f+WOSXcap20pou0Yvr/ILqv61NfrZKCPjwoOgL3pyt0tGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727284828; c=relaxed/simple;
	bh=hQ6Mhx7JIWYkKXo1pfm6XkI5thrxHDL7hWgwl7eQsKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SnwFcfLSFIIxb2ZIpnNz3LriTIxHr/912VdkJ3K+0vfuZCvuvJC4CbvObc/s5uFS9gbEpheK9uSsAYv54GqU6OE3hU11ELYxumsJrI208hZF8wHzyIesLGswLOgr2QMG74t1rDP+uf0YYvDUoYWD9WU0SqVtkniTRJGxWHF6rhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QSdzqXCw; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6b747f2e2b7so1114587b3.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727284825; x=1727889625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PafzcKiIYdF6wysKKVXDWlev4TmPRalpGq31nVBCo8A=;
        b=QSdzqXCwQzAOb4nvUmNnzqvGmagJH003yTDo0t1v6nyXeaBNRW4E2Ys7hvqAKTGEDn
         0Bd3lkIf33hdv1vZVb0X4lI5WxboQ2V8GRv17YgR0l//iy4mb4D7fclaoilgThE2IF2L
         /D4A/mypEBIiLMMBQT8zH4UVU7LgE7y26Ywbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727284825; x=1727889625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PafzcKiIYdF6wysKKVXDWlev4TmPRalpGq31nVBCo8A=;
        b=PvdJK/ymQd8JZht3AFQcYlbqhGE8MVLg+a7iDha+lWdPWVI7JN2tXI+mJXjGy2xVeU
         rQ33Tbw0zufWrk3POxsp/qAnsvw54mvjXmcOX+zZ+QIGF3vlqLoKz7uF9I4CbPVVcW15
         xtQbXRSxTWqEiDkoecQkVpfd6IUTaq7269bPxkkA/uHyU84/rVDvIlWNZoJiA4KWvcUL
         WOzETylx4E4BGZguxveueMTH13VJEC130HVcpcbBrLu/Pgm29SFsumIMzhgq48KPVEIP
         oCkJbZn5rfsYPbgz6zeACR+l4usS5BVzqXns+8+nBh7yzX3kPCy/lX+LRMsFhHVV1meJ
         0Gzw==
X-Forwarded-Encrypted: i=1; AJvYcCV9YvRm6eaJcitmuOthcSRTJWR4FOaHWRfDNcozYFouqcDBA/EtKfBBtejj2aNfZQoGmUadMQ1HgpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTO3o0h/37VI7dJ3H8rPNB7oxygE2CRporvXSEfLIMWe1DhiZu
	RLkzIXpNA6fdOgzWBR4AvxId3M/JHSKCky0nIxNf9vgaQ78ZgJLkmYCrhnBRXcCeadk74/wX6oS
	BKSompsfEYhh/89c7Q+4AkCDlCAg5X5egEglo
X-Google-Smtp-Source: AGHT+IFjmckSuZuIgDBXmTJDYZfvAetoI6vwE8y2Iqb2LxyaCa3iZ6YcdfrQOslLC71B/t87NgCAsOdDnccL5zxJrrM=
X-Received: by 2002:a05:690c:f10:b0:6be:54e1:f1f3 with SMTP id
 00721157ae682-6e21d0cea24mr38881507b3.0.1727284825475; Wed, 25 Sep 2024
 10:20:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925162513.435177-1-abhishekpandit@chromium.org> <6flxq7m7fdcpajdg5sthar6xlnpn2b3nzzwgp55jlqrjw5ubge@kdym7c2kv5fm>
In-Reply-To: <6flxq7m7fdcpajdg5sthar6xlnpn2b3nzzwgp55jlqrjw5ubge@kdym7c2kv5fm>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Wed, 25 Sep 2024 10:20:11 -0700
Message-ID: <CANFp7mU8d4LfXD9p4dbdNs0CGPeYnrQdtLheh_LWD2VwT2Vt9w@mail.gmail.com>
Subject: Re: [PATCH 0/8] Thunderbolt and DP altmode support for cros-ec-typec
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, jthies@google.com, 
	pmalani@chromium.org, akuchynski@google.com, 
	Benson Leung <bleung@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 10:12=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Sep 25, 2024 at 09:25:01AM GMT, Abhishek Pandit-Subedi wrote:
> >
> > Hi Heikki, Tzung-Bi et al,
> >
> > This patch series adds support for alternate mode entry for the
> > cros-ec-typec driver for Displayport and Thunderbolt.
> >
> > Thunderbolt support is added by adapting an RFC Heikki had posted
> > previously:
> >
> > https://lore.kernel.org/linux-usb/20191230152857.43917-1-heikki.krogeru=
s@linux.intel.com/
> >
> > A few comments on the series:
> >
> > * The cros-ec interface will not accept any VDOs/VDMs so we simply
> >   ignore any configurations we are passed (i.e. DPConfigure). This mean=
s
> >   the sysfs control of DP lanes won't work.
> > * ChromeOS has two modes of operation for alt-modes: entirely EC driven
> >   or AP-driven from userspace (via the typec daemon). Thus, we never
> >   expect the kernel alt-mode drivers to auto-enter modes.
> >
> > This was tested on kernel 6.6 with a ChromeOS Brya device and compile
> > tested against linux-usb (with allmodconfig).
>
> Please test on top of the linux-usb or linux-next. 6.6 is nine months
> old kernel.

Ack -- I'm going to try to load the upstream kernel on my ChromeOS
device + test.

>
> Also for v2 please consider CC'ing both lists for all patches. Otherwise
> it's hard to follow the changes.

Really sorry about that. I'm using patman to send patches and didn't
realize it would split the patch series between the two. v2 will send
all 8 patches to both lists.

>
> >
> > Thanks,
> > Abhishek
> >
> >
> >
>
> --
> With best wishes
> Dmitry

