Return-Path: <linux-usb+bounces-9232-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA2A8A0355
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 00:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E962C1C224EA
	for <lists+linux-usb@lfdr.de>; Wed, 10 Apr 2024 22:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049E018413E;
	Wed, 10 Apr 2024 22:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dxe512Aq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1B2184125
	for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2024 22:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712788102; cv=none; b=aEKdOyS63J7bjfDABmr3hqvbVEGJ9+F5wbKRa11EkxYjKDJ5mgQUgM0w5hTrCRAD8XTn6k83Niw88Uqm+mOSYr4eSe4VupWJCRj6E5AlnkWkw3NmyypotgpsjHzgFZ8xdevQXkjw9IdlQiAENQX+kOWKEuYYudqpTyN0WMZkTSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712788102; c=relaxed/simple;
	bh=YH+YCK0TtaM4xpNLgp7r4l7WLrbNv3kRu3yjDoe624s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b7lQ/EwhRxBSvjOuEQwlRUcKJCXCLY31Smd07fkQbT4nDKQjS57RZzMBPaV729mSlxFEuUlHUldzAlnddrWQzEm7dm8OvPHsZdA157RWUjz7Umo1dlz6WSZ4AmuKxQ1oiKeSrWPuNrQS2jOvJ+qdwELJa5hn5Tr2teXCkR52R30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dxe512Aq; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-479e857876fso1928010137.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2024 15:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712788100; x=1713392900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BB3ccNjO9MqZA0XBab5NYc/mwf8q7S7CIiocRg95hpo=;
        b=dxe512Aq9/lATeSjgr2uPgr0MfleTkvvlpIbJkcbLJVX0pm163yovwpLg0xo89CkM2
         rg4ifL+po9DRJPuK+G9fMI38El9Bg1w3mBG4Xa+/n1esuW0JvsbM6cAONzrKG9Yuf0ev
         +H3st5tH61oy0BClSHycBl6YLTBk1Rq9JwI5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712788100; x=1713392900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BB3ccNjO9MqZA0XBab5NYc/mwf8q7S7CIiocRg95hpo=;
        b=uD0XtLPRH0eG+UBo0v3m7E76c0SpF9qHNRHWW4Ln6452zP3AHlJFRkCIm7kTz2YPfv
         7tCq1YIEUK58fYJEfG5L8iIIHDXJf+1iPPp0iCWqwDzmTnyBaWJICHl/HBi9ux7jHzVq
         djOOurs+A3rkPrEoKRu/38bJCrENzsi7fkyaHV7CRem/pdA13cQkrUCvrVzDb/p+Cu0M
         umSVBrwWosw5RL7JvJtvQrPwDCkJ4cSeDOt+GxJED9nga0xDe0/+6QnrtGtE8gl8LfQ3
         ewVr4xXPMu7hBuuYplcoihlS/+dw03VvlTz9dngj/2Dx9Cft6TvcFvZOWdp5+f5MBwfv
         2Qug==
X-Forwarded-Encrypted: i=1; AJvYcCWMwHkuJaNSE9K3wJJWZRwxIT9lL3QQ7wHYz+5YpuZSsHCfvCfQoZehe5LksnaqhdSl74cTYkP59i5R7s0f7TlVcSZ4Gf0t3QZC
X-Gm-Message-State: AOJu0YypS2I0fnb1CP465dJlofLibiECW8xdUO14cajLCTK4W4+MaVf1
	NOktzK/wbiijB8XAM+3N9al3YM2PgK2Wdd3f7Fnn9Yw6E+nTfbbVAvtpEVqsVNbFcz3MTDou7j9
	3WDGE9HKS82jx+TAxDogp9UBp7bv3M5uoYi0B
X-Google-Smtp-Source: AGHT+IG0DYJSZA6M/0G7T2aTS2ZJ/iILrEXt6TniERHXXkQOUOrG3LvxlW3P/tXtGQZaaYSu1vjHu2wxuT1qlaAsDFc=
X-Received: by 2002:a05:6102:2092:b0:47a:23bb:5302 with SMTP id
 h18-20020a056102209200b0047a23bb5302mr3103418vsr.11.1712788099606; Wed, 10
 Apr 2024 15:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409-public-ucsi-h-v4-0-e770735222a2@chromium.org>
 <20240409-public-ucsi-h-v4-2-e770735222a2@chromium.org> <2024040916-kleenex-machinist-4858@gregkh>
In-Reply-To: <2024040916-kleenex-machinist-4858@gregkh>
From: Pavan Holla <pholla@chromium.org>
Date: Wed, 10 Apr 2024 15:27:43 -0700
Message-ID: <CAB2FV=6We88NrvN8NZYt8NkMFH9N_ZBGyUWVUpGwPdja2X_+NA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I plan to upload the next version after related EC changes land on
ChromeOS. That might take a few weeks.

On Tue, Apr 9, 2024 at 8:16=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Apr 09, 2024 at 02:27:37AM +0000, Pavan Holla wrote:
> > +#define DRV_NAME "cros-ec-ucsi"
>
> KBUILD_MODNAME?

Will replace DRV_NAME with KBUILD_MODNAME.

> > +
> > +#define MAX_EC_DATA_SIZE 256
> > +#define WRITE_TMO_MS 500
>
> What are these and why these values?  And tabs perhaps?

MAX_EC_DATA_SIZE is the number of bytes that can be read or written to in t=
he
UCSI data structure using a single host command to the EC.
WRITE_TMO_MS is the time within which a cmd complete or ack notification mu=
st
arrive after a command is sent to the PPM.

Will add comments and tabs.

> > +     uint8_t ec_buffer[MAX_EC_DATA_SIZE + sizeof(struct ec_params_ucsi=
_ppm_set)];
>
> That's a lot of data on the stack, are you sure you want to do that?
>
> And are you sure you are allowed to have this data on the stack?  It
> never ends up being sent using DMA?

I confirmed that this data isn't DMA'ed. However, I don't mind putting
it on the heap, and will do so in the next version.

> And please, don't use non-kernel types like "uint8_t", use "u8" like
> intended.  This isn't userspace (yes, I know a lot of kernel code uses
> these, but as you are going to change this, might as well change that
> too.)

Ack.

Thanks,
Pavan

