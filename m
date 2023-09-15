Return-Path: <linux-usb+bounces-103-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B547A1301
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 03:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE9141C2117D
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 01:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22BF806;
	Fri, 15 Sep 2023 01:42:53 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D8C36A
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 01:42:51 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id C6B5C2709
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 18:42:50 -0700 (PDT)
Received: (qmail 1019415 invoked by uid 1000); 14 Sep 2023 21:42:49 -0400
Date: Thu, 14 Sep 2023 21:42:48 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Yuran Pereira <yuran.pereira@hotmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
  "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
  "royluo@google.com" <royluo@google.com>,
  "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
  "raychi@google.com" <raychi@google.com>,
  "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "syzbot+c063a4e176681d2e0380@syzkaller.appspotmail.com" <syzbot+c063a4e176681d2e0380@syzkaller.appspotmail.com>
Subject: Re: [PATCH] USB: core: Fix a NULL pointer dereference
Message-ID: <530c4be4-ccaa-4e6e-b0ac-68c896060766@rowland.harvard.edu>
References: <AS8P192MB12697886EC8DF1650AD56A57E8EDA@AS8P192MB1269.EURP192.PROD.OUTLOOK.COM>
 <d3ffde1a-e0da-4f3f-ac34-659cbcf41258@rowland.harvard.edu>
 <AM9P192MB12670D185D208AFA51B8348EE8ECA@AM9P192MB1267.EURP192.PROD.OUTLOOK.COM>
 <c072b373-0368-4f49-a4da-da309955cb7a@rowland.harvard.edu>
 <AS8P192MB1269A9732001D142F3272ACDE8F6A@AS8P192MB1269.EURP192.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8P192MB1269A9732001D142F3272ACDE8F6A@AS8P192MB1269.EURP192.PROD.OUTLOOK.COM>

On Fri, Sep 15, 2023 at 12:57:58AM +0000, Yuran Pereira wrote:
> Hello Alan,
> 
> Thank you for the detailed explanation.
> 
> Apologies for the delay replying.
> Please, feel free to submit the patch.

No need; Andy Shevchenko already submitted the same patch some time ago 
and it has been merged.

Alan Stern

> ________________________________
> De: Alan Stern <stern@rowland.harvard.edu>
> Enviado: 9 de setembro de 2023 14:36
> Para: Yuran Pereira <yuran.pereira@hotmail.com>; Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>; royluo@google.com <royluo@google.com>; christophe.jaillet@wanadoo.fr <christophe.jaillet@wanadoo.fr>; raychi@google.com <raychi@google.com>; linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; syzbot+c063a4e176681d2e0380@syzkaller.appspotmail.com <syzbot+c063a4e176681d2e0380@syzkaller.appspotmail.com>
> Assunto: Re: [PATCH] USB: core: Fix a NULL pointer dereference
> 
> On Sat, Sep 09, 2023 at 06:28:12AM +0000, Yuran Pereira wrote:
> > Hello Alan,
> >
> > Thank you for elucidating that.
> >
> > So, this bug is present on the mainline tree which is where syzkaller
> > found it. My patch was also based on the mainline tree.
> >
> > I just ran the same reproducer against a kernel compiled from the usb
> > tree, and, as you suggested, the test you mentioned does in fact,
> > prevent the bug from occurring.
> >
> > Please forgive my ignorance; I am a new contributor to the community.
> > But in this situation how should I proceed? Is there even a need to
> > submit a patch, or will the code currently present in the usb tree
> > eventually be reflected in the mainline?
> 
> The first step is to find the difference between the mainline and USB
> trees that is responsible for this change in behavior.  A quick check of
> the Git logs shows that the change was caused by commit d21fdd07cea4
> ("driver core: Return proper error code when dev_set_name() fails"),
> written by Andy Shevchenko.  As a result of this commit, the code in
> device_add() now says:
> 
>         if (dev_name(dev))
>                 error = 0;
>         /* subsystems can specify simple device enumeration */
>         else if (dev->bus && dev->bus->dev_name)
>                 error = dev_set_name(dev, "%s%u", dev->bus->dev_name, dev->id);
>         if (error)
>                 goto name_error;
> 
> This obviously omits a final "else" clause; it should say:
> 
>         if (dev_name(dev))
>                 error = 0;
>         /* subsystems can specify simple device enumeration */
>         else if (dev->bus && dev->bus->dev_name)
>                 error = dev_set_name(dev, "%s%u", dev->bus->dev_name, dev->id);
> +       else
> +               error = -EINVAL;
>         if (error)
>                 goto name_error;
> 
> So to answer your questions: No, the code in the USB tree will not find
> its way into mainline.  The opposite will happen: The mainline code will
> land in the USB tree.  Which means that yes, there is a need to submit a
> patch.  You can go ahead and write this up for submission, or I can
> submit it for you.  Or you can check with Andy and see if he wants to
> fix the problem in a different way.
> 
> Alan Stern

