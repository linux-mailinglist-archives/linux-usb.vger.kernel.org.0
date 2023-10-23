Return-Path: <linux-usb+bounces-2089-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F5E7D41A0
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 23:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F4A1B20D8D
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 21:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7250E10971;
	Mon, 23 Oct 2023 21:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OvKfoYcd"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F087018E2D
	for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 21:25:46 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE46FD
	for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 14:25:44 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-53e3e7e478bso5684284a12.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 14:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698096343; x=1698701143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fi/lKgniZUuLKgl9B9aJ0yNCeztsPozgNIRB0HC6oYk=;
        b=OvKfoYcd29qJoc/8/kWzDv0zwc3ghu5t7ZsJhSdrOoCu/En63uRbYb7sToApH9FQox
         fvNxqvC23prxbUZ143QyA0epvLzx53L6OopmB2A/MpdWerkw8eYC4mqdmC2yTfhDo6cl
         t8wJZMK32dZwsOKyhRHvzhzbstdZ3xoAqDOErKPSwgOZNvZbHEryNUZ4A/v81HXyJZEU
         GXKXvNitrqK0zWcxodu2y8lFJNHwPkQbtpHbkEvyGPdzZ/KGTH4FPT/MwFqcRYtqZheE
         tJJmkFb9aY2kOsysP9/8rmi1Acn2PIcwud6CiiWMNyedu4kYBY96jc4+wxzB8hU8aRkW
         JDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698096343; x=1698701143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fi/lKgniZUuLKgl9B9aJ0yNCeztsPozgNIRB0HC6oYk=;
        b=ka+/dQ8zE733SrX60b9M/olCcWcTqsQKfy4SmVDeMalOQao5j5WfgIB1gZFkUvar1a
         bfievcGnhPf3s0uewqtYsjXF33dDFvbWwPAwX2vl6swiJtH4XGjve8QjemYBncnKM2cy
         VkWGCEe7M8HUyolQ+9lEpphqS99WvqfmHh1xQ076LZgOz5cSzkHhsTDgqK0NkWpsIkLI
         A4HdIw4BzOC79yVPfWC2Se1VxE9KF1Tu2q8JwokuTzUQQ2xHpT4MrglvMGzrfi8eKKxQ
         YrSNxXRu/diNUR+k7/KC1dW3q4wB5ZYEitG/Qy2GarlaX6LfW1Nr2jM5KJL80SiSjW9D
         p3dA==
X-Gm-Message-State: AOJu0YweWk01KNNIiRAoRVTFrblSV6i0NlnKfYCw90+gvWrwjxXNM8TE
	TlEkTZhGskTZ7MZ7XooRC8zzXPMWhb2DBAwd0tyByg==
X-Google-Smtp-Source: AGHT+IGA0FlzuzIfVcl5vaifYlDlaLFETVMz/ociXdF8lFENs1AgW3Dgv3XHRg7JNrQ9Ivq0v9kwjf/I9swu05xiL98=
X-Received: by 2002:a17:907:7fa7:b0:9ae:701a:6efa with SMTP id
 qk39-20020a1709077fa700b009ae701a6efamr10411814ejc.69.1698096342652; Mon, 23
 Oct 2023 14:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231019185319.2714000-5-arakesh@google.com> <202310200457.GwPPFuHX-lkp@intel.com>
 <738df245-e7d1-4fc0-9076-3ac5afebaa44@google.com> <2023102103-casually-wavy-6a54@gregkh>
In-Reply-To: <2023102103-casually-wavy-6a54@gregkh>
From: Avichal Rakesh <arakesh@google.com>
Date: Mon, 23 Oct 2023 14:25:30 -0700
Message-ID: <CAMHf4WKgzvMoL6tKCiQYsuudQWgGBKkhfbmYgUxVXvLEqxi1GQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] usb: gadget: uvc: Fix use-after-free for inflight usb_requests
To: Greg KH <gregkh@linuxfoundation.org>
Cc: etalvala@google.com, jchowdhary@google.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, dan.scally@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, m.grzeschik@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 21, 2023 at 3:05=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Oct 19, 2023 at 03:30:00PM -0700, Avichal Rakesh wrote:
> >
> >
> > On 10/19/23 13:32, kernel test robot wrote:
> > > Hi Avichal,
> > >
> > > kernel test robot noticed the following build warnings:
> > >
> > > [auto build test WARNING on usb/usb-testing]
> > > [also build test WARNING on usb/usb-next usb/usb-linus linus/master v=
6.6-rc6 next-20231019]
> > > [If your patch is applied to the wrong git tree, kindly drop us a not=
e.
> > > And when submitting patch, we suggest to use '--base' as documented i=
n
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Avichal-Rakesh=
/usb-gadget-uvc-prevent-use-of-disabled-endpoint/20231020-025512
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.gi=
t usb-testing
> > > patch link:    https://lore.kernel.org/r/20231019185319.2714000-5-ara=
kesh%40google.com
> > > patch subject: [PATCH v6 4/4] usb: gadget: uvc: Fix use-after-free fo=
r inflight usb_requests
> > > config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20=
231020/202310200457.GwPPFuHX-lkp@intel.com/config)
> > > compiler: m68k-linux-gcc (GCC) 13.2.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20231020/202310200457.GwPPFuHX-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202310200457.GwPPFuHX=
-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > >>> drivers/usb/gadget/function/uvc_video.c:231: warning: This comment =
starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-=
guide/kernel-doc.rst
> > >     * Must be called with req_lock held as it modifies the list ureq =
is held in
> > >
> > >
> >
> > Greg, apologies for the newb question: do you want me to upload
> > the fix for this as a reply to [PATCH v6 4/4], or upload a new chain of
> > v7s with this patch fixed?
>
> A whole new v7 series please.
>

Had a feeling, so sent out v7 series preemptively. Let me know if that
doesn't work.

v7: https://lore.kernel.org/20231020173626.2978356-1-arakesh@google.com/

Thank you!
- Avi

